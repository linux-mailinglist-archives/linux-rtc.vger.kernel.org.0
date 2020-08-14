Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3DC32448AA
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Aug 2020 13:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgHNLHj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Aug 2020 07:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgHNLHi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Aug 2020 07:07:38 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCB9C061384
        for <linux-rtc@vger.kernel.org>; Fri, 14 Aug 2020 04:07:37 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id FP7Y2300P4C55Sk06P7YYG; Fri, 14 Aug 2020 13:07:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k6XYa-0003r9-Cb; Fri, 14 Aug 2020 13:07:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k6XYa-0007Z4-Bj; Fri, 14 Aug 2020 13:07:32 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        kogiidena <kogiidena@eggplant.ddo.jp>,
        Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-rtc@vger.kernel.org, linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] rtc: rtc-rs5c313: Fix late hardware init
Date:   Fri, 14 Aug 2020 13:07:30 +0200
Message-Id: <20200814110731.29029-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200814110731.29029-1-geert+renesas@glider.be>
References: <20200814110731.29029-1-geert+renesas@glider.be>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

rs5c313_rtc_init() calls platform_driver_register(), and initializes the
hardware.  This is wrong because of two reasons:
  1. As soon as the driver has been registered, the device may be
     probed.  If devm_rtc_device_register() is called before hardware
     initialization, reading the current time will fail:

	rs5c313 rs5c313: rs5c313_rtc_read_time: timeout error
	rs5c313 rs5c313: registered as rtc0
	rs5c313 rs5c313: rs5c313_rtc_read_time: timeout error
	rs5c313 rs5c313: hctosys: unable to read the hardware clock

  2. If the platform device does not exist, the driver will still write
     to a hardware device that may not be present.

Fix this by moving the hardware initialization sequence to the driver's
.probe() method.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/rtc/rtc-rs5c313.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/rtc/rtc-rs5c313.c b/drivers/rtc/rtc-rs5c313.c
index 00b5ef753935ec8a..af72e428b218173e 100644
--- a/drivers/rtc/rtc-rs5c313.c
+++ b/drivers/rtc/rtc-rs5c313.c
@@ -366,8 +366,13 @@ static const struct rtc_class_ops rs5c313_rtc_ops = {
 
 static int rs5c313_rtc_probe(struct platform_device *pdev)
 {
-	struct rtc_device *rtc = devm_rtc_device_register(&pdev->dev, "rs5c313",
-				&rs5c313_rtc_ops, THIS_MODULE);
+	struct rtc_device *rtc;
+
+	rs5c313_init_port();
+	rs5c313_check_xstp_bit();
+
+	rtc = devm_rtc_device_register(&pdev->dev, "rs5c313", &rs5c313_rtc_ops,
+				       THIS_MODULE);
 
 	return PTR_ERR_OR_ZERO(rtc);
 }
@@ -381,16 +386,7 @@ static struct platform_driver rs5c313_rtc_platform_driver = {
 
 static int __init rs5c313_rtc_init(void)
 {
-	int err;
-
-	err = platform_driver_register(&rs5c313_rtc_platform_driver);
-	if (err)
-		return err;
-
-	rs5c313_init_port();
-	rs5c313_check_xstp_bit();
-
-	return 0;
+	return platform_driver_register(&rs5c313_rtc_platform_driver);
 }
 
 static void __exit rs5c313_rtc_exit(void)
-- 
2.17.1

