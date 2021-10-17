Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A67430BD2
	for <lists+linux-rtc@lfdr.de>; Sun, 17 Oct 2021 21:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242766AbhJQTmL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 17 Oct 2021 15:42:11 -0400
Received: from mx-out.tlen.pl ([193.222.135.142]:47768 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344566AbhJQTmK (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 17 Oct 2021 15:42:10 -0400
Received: (wp-smtpd smtp.tlen.pl 10169 invoked from network); 17 Oct 2021 21:39:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1634499598; bh=Fhf7rMoQ6L7izsQlV/8yihcnza8EcnJtUeazGGPlKI8=;
          h=From:To:Cc:Subject;
          b=jPQd71pcOiNgR4AWNjo++ZzSVj8wS5QxkIKp71m7Mw/qXrU/bdpGhEXyW+Xn5nK42
           unJDXnMCbICL247oN17LFJ3MKiCDfHUmT+5/b7TgMXMmaBX743fb6bUaLfOqeQABnZ
           CqkTH71bMoP2+FMQVzBzlTkODIobQR+X6ZxSgpo0=
Received: from aaet142.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.4.123.142])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-kernel@vger.kernel.org>; 17 Oct 2021 21:39:58 +0200
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RESEND 4/6] rtc-mc146818-lib: reduce RTC_UIP polling period
Date:   Sun, 17 Oct 2021 21:39:25 +0200
Message-Id: <20211017193927.277409-5-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211017193927.277409-1-mat.jonczyk@o2.pl>
References: <20211017193927.277409-1-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 7f7b814cec7a0b15916f19c47cf86d36
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [gTM0]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

A shorter period makes mc146818_get_time() more similar to
mach_get_cmos_time() in arch/x86/kernel/rtc.c, which performs the same
function, but is busy waiting for the RTC_UIP bit to clear.

Waiting 1ms every time is not necessary, for example on some AMD boxes
the RTC_UIP bit is documented as being high for around 270 microseconds
in some cases [1], which agreed with experiments on an SB710
southbridge. So 100us seems optimal.

[1] AMD SB700/710/750 Register Reference Guide, page 307,
https://developer.amd.com/wordpress/media/2012/10/43009_sb7xx_rrg_pub_1.00.pdf

        "SB700 A12: The UIP high pulse is 270 μS Typical when SS on SRC
        clock is OFF and 100μ min when SRC SS is ON." [sic]

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 drivers/rtc/rtc-mc146818-lib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
index 9175e11baf26..d1c42b0ef662 100644
--- a/drivers/rtc/rtc-mc146818-lib.c
+++ b/drivers/rtc/rtc-mc146818-lib.c
@@ -45,7 +45,7 @@ unsigned int mc146818_get_time(struct rtc_time *time)
 #endif
 
 again:
-	if (iter_count > 10) {
+	if (iter_count > 100) {
 		pr_err_ratelimited("Unable to read current time from RTC\n");
 		memset(time, 0xff, sizeof(*time));
 		return 0;
@@ -57,7 +57,7 @@ unsigned int mc146818_get_time(struct rtc_time *time)
 	/*
 	 * Check whether there is an update in progress during which the
 	 * readout is unspecified. The maximum update time is ~2ms. Poll
-	 * every msec for completion.
+	 * every 100 usec for completion.
 	 *
 	 * Store the second value before checking UIP so a long lasting NMI
 	 * which happens to hit after the UIP check cannot make an update
@@ -67,7 +67,7 @@ unsigned int mc146818_get_time(struct rtc_time *time)
 
 	if (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) {
 		spin_unlock_irqrestore(&rtc_lock, flags);
-		mdelay(1);
+		udelay(100);
 		goto again;
 	}
 
-- 
2.25.1

