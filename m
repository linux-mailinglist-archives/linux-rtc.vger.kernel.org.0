Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943C5440BF5
	for <lists+linux-rtc@lfdr.de>; Sat, 30 Oct 2021 23:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232077AbhJ3VuX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 30 Oct 2021 17:50:23 -0400
Received: from mx-out.tlen.pl ([193.222.135.142]:51940 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232055AbhJ3VuN (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 30 Oct 2021 17:50:13 -0400
Received: (wp-smtpd smtp.tlen.pl 24702 invoked from network); 30 Oct 2021 23:47:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1635630458; bh=eA+1Uvi9uXhmLNb3F2vvtxmwBMjqDbDxzc36ZQojcgk=;
          h=From:To:Cc:Subject;
          b=AkX4KxZwRNa1Wzxh5OpWP10r6IEc4FUpua4mP40zDdVDVX4HFKbvhzX504lHIy4Vb
           B8LNhYov3LvtlBvdoLc3RWS/uorlMRRDxYgunPogmIKIBFkKj2Wj2MhelmbKv6p2BH
           JMvRTRdspUZd0JQwW4H1ZQ+3cK6rpWpdKsvfjhvg=
Received: from ablz112.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.7.219.112])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-rtc@vger.kernel.org>; 30 Oct 2021 23:47:37 +0200
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 5/7] rtc-mc146818-lib: refactor mc146818_does_rtc_work
Date:   Sat, 30 Oct 2021 23:46:33 +0200
Message-Id: <20211030214636.49602-6-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030214636.49602-1-mat.jonczyk@o2.pl>
References: <20211030214636.49602-1-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 558c78463bfb96b244ff17e05871cb02
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [0QPU]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Refactor mc146818_get_time() to make use of mc146818_do_avoiding_UIP().
It is enough to call mc146818_do_avoiding_UIP() with no callback.

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-mc146818-lib.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
index f3178244db37..09d6c20726c1 100644
--- a/drivers/rtc/rtc-mc146818-lib.c
+++ b/drivers/rtc/rtc-mc146818-lib.c
@@ -83,22 +83,7 @@ EXPORT_SYMBOL_GPL(mc146818_do_avoiding_UIP);
  */
 bool mc146818_does_rtc_work(void)
 {
-	int i;
-	unsigned char val;
-	unsigned long flags;
-
-	for (i = 0; i < 10; i++) {
-		spin_lock_irqsave(&rtc_lock, flags);
-		val = CMOS_READ(RTC_FREQ_SELECT);
-		spin_unlock_irqrestore(&rtc_lock, flags);
-
-		if ((val & RTC_UIP) == 0)
-			return true;
-
-		mdelay(1);
-	}
-
-	return false;
+	return mc146818_do_avoiding_UIP(NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(mc146818_does_rtc_work);
 
-- 
2.25.1

