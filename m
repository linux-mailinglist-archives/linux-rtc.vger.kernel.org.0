Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31D406AAA20
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbjCDNcY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjCDNcW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:22 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E4A20D26
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:31:56 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyI-0000jX-QZ; Sat, 04 Mar 2023 14:30:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyI-001naZ-14; Sat, 04 Mar 2023 14:30:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyH-0027HZ-AB; Sat, 04 Mar 2023 14:30:45 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 22/41] rtc: palmas: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:09 +0100
Message-Id: <20230304133028.2135435-23-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=6KsH1C70dgoiqwQv//ldlbyWGTHAHUaGFlOnk85hGxc=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0es+a3MCKhq9JbTJJYBMT8zGIHkbWPLz0lQ8 nWZB0wMPJOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHrAAKCRDB/BR4rcrs CVdkB/90ndHDDkhOy+tn4+66WM3NGMHQS1HrLvqyV1yLKXhJXigk5Y95C8chHtiBIeLw2s4nIUE sI514s5sKsSwNLSIAJmQsxtphPB9lXq+HbLkKIzQQZ1b1G2w8x0DnHnYRwRoYDc7d8Iqpbrl2wv FGk9UsHT/mpwfEiF6l5nmJ3uwzC5agG3BjuGLP9TjqjVhwgV7y8/757wJTdtNUzMOR2DcBMBJ+I /5bVg1aNJ/H8g//BCKbMTwfp5TM6LtRX0yAIz3gUPmJGZ/nJF/xEVb8u875dNP7ePz6+lORtAgZ 8PH9OCIE9yhARxGRGbzHeJRNc+Veg3Dd10M+OAQh6I029Bjy
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
 drivers/rtc/rtc-palmas.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-palmas.c b/drivers/rtc/rtc-palmas.c
index 67571f7f0bbc..6971e47c6021 100644
--- a/drivers/rtc/rtc-palmas.c
+++ b/drivers/rtc/rtc-palmas.c
@@ -308,10 +308,9 @@ static int palmas_rtc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int palmas_rtc_remove(struct platform_device *pdev)
+static void palmas_rtc_remove(struct platform_device *pdev)
 {
 	palmas_rtc_alarm_irq_enable(&pdev->dev, 0);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -347,7 +346,7 @@ MODULE_DEVICE_TABLE(of, of_palmas_rtc_match);
 
 static struct platform_driver palmas_rtc_driver = {
 	.probe		= palmas_rtc_probe,
-	.remove		= palmas_rtc_remove,
+	.remove_new	= palmas_rtc_remove,
 	.driver		= {
 		.name	= "palmas-rtc",
 		.pm	= &palmas_rtc_pm_ops,
-- 
2.39.1

