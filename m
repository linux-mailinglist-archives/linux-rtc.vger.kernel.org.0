Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D07536AAA48
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjCDNwV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:52:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCDNwU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:52:20 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF473EB7E
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:52:19 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyN-0000yv-7h; Sat, 04 Mar 2023 14:30:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyL-001nbx-As; Sat, 04 Mar 2023 14:30:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyK-0027If-DC; Sat, 04 Mar 2023 14:30:48 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     patches@opensource.cirrus.com, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 39/41] rtc: wm8350: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:26 +0100
Message-Id: <20230304133028.2135435-40-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=OrP8RwHkkKih9nDjgUpOCIUHrjTzbZRcM4XgzAgiC1A=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0foUZj7JbRAGsdia8vun9xczW2VUVAc2fd04 XVyl7B6d/yJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANH6AAKCRDB/BR4rcrs CdqpB/98FVXYDTPwHfbatwxEPi+oPvj0qdjjDcFSB9cbI76gfspPIUCRjU1FS6BV0K3ai5BnpRX yq7TtcY8ZiIKqNn8DAZrMPRLHALxzy9cf7LpOk2Puz2Ua1Y74J+z1Zn0INhEH1pLeGJiqn1tKsH HhqHztVr3abQgCZFS3cxoZM7NNri0xuQb620ecwTNQB4kIxtY1VFq7/VugAD1qrYwgYYzg2KHjY 3Xmm6NiBeQO5BTcEMEGlZ3HJ2V1ESOFGCoEYGgE1fQ2XFhCD5U/OrnYlYxsTVao97/p6/4Yuonj qyuSDmJx0TL3WzWMQB1m15fmUWIimou6J9V/bQZf9mJl1Rjj
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
 drivers/rtc/rtc-wm8350.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-wm8350.c b/drivers/rtc/rtc-wm8350.c
index 6eaa9321c074..947f8071803f 100644
--- a/drivers/rtc/rtc-wm8350.c
+++ b/drivers/rtc/rtc-wm8350.c
@@ -451,14 +451,12 @@ static int wm8350_rtc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int wm8350_rtc_remove(struct platform_device *pdev)
+static void wm8350_rtc_remove(struct platform_device *pdev)
 {
 	struct wm8350 *wm8350 = platform_get_drvdata(pdev);
 
 	wm8350_free_irq(wm8350, WM8350_IRQ_RTC_SEC, wm8350);
 	wm8350_free_irq(wm8350, WM8350_IRQ_RTC_ALM, wm8350);
-
-	return 0;
 }
 
 static SIMPLE_DEV_PM_OPS(wm8350_rtc_pm_ops, wm8350_rtc_suspend,
@@ -466,7 +464,7 @@ static SIMPLE_DEV_PM_OPS(wm8350_rtc_pm_ops, wm8350_rtc_suspend,
 
 static struct platform_driver wm8350_rtc_driver = {
 	.probe = wm8350_rtc_probe,
-	.remove = wm8350_rtc_remove,
+	.remove_new = wm8350_rtc_remove,
 	.driver = {
 		.name = "wm8350-rtc",
 		.pm = &wm8350_rtc_pm_ops,
-- 
2.39.1

