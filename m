Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7387A6AAA25
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjCDNc0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjCDNcY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:24 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5F52055A
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:31:58 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyN-00012X-JB; Sat, 04 Mar 2023 14:30:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyM-001nc7-2Q; Sat, 04 Mar 2023 14:30:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyK-0027In-Pr; Sat, 04 Mar 2023 14:30:48 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 41/41] rtc: zynqmp: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:28 +0100
Message-Id: <20230304133028.2135435-42-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1626; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=YtSHsUVRoEfZY+IeJpnLYhSUr3NzpHhzFzNoaoxhphM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0fum+Ej/S9UKeCeKGoHKzTRXDQ5NgaRTSRoK jm1uNw1k1qJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANH7gAKCRDB/BR4rcrs CTD/B/90p1bjjLLVNRNSM0ysp3tpYrrWoLe8ipYVMLqxFkC9qeKBZwzkwMWoXgHINEIyIVn1niS I3PusbTy1kPHsce5W0fwDAbdMUV2M/CONMzf/t8dgb0Myo7NYIBZYlR77uqSo60bQ5Qfm7w2i5O IuUXnk1lPSjOsjTXxRqf2yDrECJs9CALa8Zjw4Li7lnKgTpePN7HlOnXvLUkVlo7aY8ABHxm0jo pvhUwTDHfuE/XGCu3XGxSiKGmcGfVyoVGH3G/2Il1SH4wlj6ybUBn/7iOYxHR/aO5lNQSxY7yeP ZCpLyetYOKxSAxG/vVIGMWKBzwHK9OC5K6GCdc3FcRBaU6Gr
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-zynqmp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index c9b85c838ebe..08ed171bdab4 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -342,12 +342,10 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(xrtcdev->rtc);
 }
 
-static int xlnx_rtc_remove(struct platform_device *pdev)
+static void xlnx_rtc_remove(struct platform_device *pdev)
 {
 	xlnx_rtc_alarm_irq_enable(&pdev->dev, 0);
 	device_init_wakeup(&pdev->dev, 0);
-
-	return 0;
 }
 
 static int __maybe_unused xlnx_rtc_suspend(struct device *dev)
@@ -384,7 +382,7 @@ MODULE_DEVICE_TABLE(of, xlnx_rtc_of_match);
 
 static struct platform_driver xlnx_rtc_driver = {
 	.probe		= xlnx_rtc_probe,
-	.remove		= xlnx_rtc_remove,
+	.remove_new	= xlnx_rtc_remove,
 	.driver		= {
 		.name	= KBUILD_MODNAME,
 		.pm	= &xlnx_rtc_pm_ops,
-- 
2.39.1

