Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3A8A19005C
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Mar 2020 22:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgCWVas (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Mar 2020 17:30:48 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:39541 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbgCWVas (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Mar 2020 17:30:48 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 596A5240006;
        Mon, 23 Mar 2020 21:30:46 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: class: avoid unnecessary lookup in hctosys
Date:   Mon, 23 Mar 2020 22:30:39 +0100
Message-Id: <20200323213039.297458-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

rtc_hctosys is only called when the relevant RTC is found, avoid looking it
up while we already have a pinter to the proper struct rtc_device.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/class.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index 8793b2b8cf9d..03d6516941a8 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -46,20 +46,13 @@ int rtc_hctosys_ret = -ENODEV;
  * the best guess is to add 0.5s.
  */
 
-static int rtc_hctosys(void)
+static void rtc_hctosys(struct rtc_device *rtc)
 {
 	int err = -ENODEV;
 	struct rtc_time tm;
 	struct timespec64 tv64 = {
 		.tv_nsec = NSEC_PER_SEC >> 1,
 	};
-	struct rtc_device *rtc = rtc_class_open(CONFIG_RTC_HCTOSYS_DEVICE);
-
-	if (!rtc) {
-		pr_info("unable to open rtc device (%s)\n",
-			CONFIG_RTC_HCTOSYS_DEVICE);
-		goto err_open;
-	}
 
 	err = rtc_read_time(rtc, &tm);
 	if (err) {
@@ -83,12 +76,7 @@ static int rtc_hctosys(void)
 		 &tm, (long long)tv64.tv_sec);
 
 err_read:
-	rtc_class_close(rtc);
-
-err_open:
 	rtc_hctosys_ret = err;
-
-	return err;
 }
 #endif
 
@@ -433,7 +421,7 @@ int __rtc_register_device(struct module *owner, struct rtc_device *rtc)
 
 #ifdef CONFIG_RTC_HCTOSYS_DEVICE
 	if (!strcmp(dev_name(&rtc->dev), CONFIG_RTC_HCTOSYS_DEVICE))
-		rtc_hctosys();
+		rtc_hctosys(rtc);
 #endif
 
 	return 0;
-- 
2.25.1

