Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7D784577E2
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Nov 2021 21:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235873AbhKSUql (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Nov 2021 15:46:41 -0500
Received: from mx-out.tlen.pl ([193.222.135.142]:45627 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235760AbhKSUq3 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 19 Nov 2021 15:46:29 -0500
Received: (wp-smtpd smtp.tlen.pl 9184 invoked from network); 19 Nov 2021 21:43:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1637354599; bh=eA+1Uvi9uXhmLNb3F2vvtxmwBMjqDbDxzc36ZQojcgk=;
          h=From:To:Cc:Subject;
          b=tlrCcjOMcWyGwlDdEDMaQni1sbRMUXGKmRHmASjT61G2efYjt/uue8FmD2z9OAkgG
           uEakEKH3ONqY3O488UTkgYTKDQBr2HeRB3YIcwkUz+9c7YhFwoeLLZvnz8pxbWmfOa
           fOgvkecsif0AtKjEh9a/qEyaqZRzlAODeAmctGsc=
Received: from aaen55.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.4.117.55])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-kernel@vger.kernel.org>; 19 Nov 2021 21:43:18 +0100
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH RESEND v3 5/7] rtc-mc146818-lib: refactor mc146818_does_rtc_work
Date:   Fri, 19 Nov 2021 21:42:19 +0100
Message-Id: <20211119204221.66918-6-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119204221.66918-1-mat.jonczyk@o2.pl>
References: <20211119204221.66918-1-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 95d48e30e1015ad3c6876b070b77768d
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [MYMk]                               
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

