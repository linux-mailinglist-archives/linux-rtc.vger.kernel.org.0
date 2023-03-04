Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22E506AAA4C
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbjCDNwf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:52:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCDNwe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:52:34 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA493EC78
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:52:33 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyG-0000bn-DT; Sat, 04 Mar 2023 14:30:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyE-001nZF-QF; Sat, 04 Mar 2023 14:30:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyD-0027GO-V9; Sat, 04 Mar 2023 14:30:41 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 03/41] rtc: ab8500: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:29:50 +0100
Message-Id: <20230304133028.2135435-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=BLHdjLefuLnIeHMJ8UBloZ2lxD5IPETTOoZSx138Hws=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0dwJqGd82y/I7QCauVEcw5em+sdTxXXDAemE oypLiOdWjqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHcAAKCRDB/BR4rcrs CaYSB/wIPa63XT1v6nsteEyETcbSgFjTCWg57SFHlB8d/f6arkuoxCyCVRMiGhNUDps4ajar7e/ Uli2MytvzbN55pHWbhq+bYRAU/SZzVqRN6vKdoY7Pq168BR4OZiP/OaspC4hRTKoEF862Tad05q L/jrapnDPC+M2X5YgV16F8yy3nu7v1/AGP0+DvT3QLpxOX8r4cNHc+bqFdrcLQJAldiInP5ezzN v5OES1BsHj1xWDj1MJ1EDgEcDrUdtzqnzqlhKYVxbWAG6us7fNCybtUzCrkrWSQT4/0Npebjf0r wP9a0bjenqvi+R9242eKyX7FQrdofxq+dRgw9NrgAt8TWxVT
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
 drivers/rtc/rtc-ab8500.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-ab8500.c b/drivers/rtc/rtc-ab8500.c
index ea33e149d545..75bb2ac9005c 100644
--- a/drivers/rtc/rtc-ab8500.c
+++ b/drivers/rtc/rtc-ab8500.c
@@ -392,12 +392,10 @@ static int ab8500_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(rtc);
 }
 
-static int ab8500_rtc_remove(struct platform_device *pdev)
+static void ab8500_rtc_remove(struct platform_device *pdev)
 {
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
-
-	return 0;
 }
 
 static struct platform_driver ab8500_rtc_driver = {
@@ -405,7 +403,7 @@ static struct platform_driver ab8500_rtc_driver = {
 		.name = "ab8500-rtc",
 	},
 	.probe	= ab8500_rtc_probe,
-	.remove = ab8500_rtc_remove,
+	.remove_new = ab8500_rtc_remove,
 	.id_table = ab85xx_rtc_ids,
 };
 
-- 
2.39.1

