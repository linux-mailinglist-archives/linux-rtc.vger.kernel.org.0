Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6CD36AAA1B
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjCDNcV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjCDNcT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:19 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B359E6E84
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:31:52 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyJ-0000k1-7e; Sat, 04 Mar 2023 14:30:47 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyI-001nak-Eu; Sat, 04 Mar 2023 14:30:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyH-0027Hj-Mk; Sat, 04 Mar 2023 14:30:45 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 24/41] rtc: pic32: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:11 +0100
Message-Id: <20230304133028.2135435-25-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1700; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=e46LrrfE/GMSzpNGoMERvPgoEmQteRK7KPnMj8xmAQ4=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0ey7GyV/UQlWc3WvTBQAxWb7NtdO1MeCSLRO UCsZqhaOUKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHsgAKCRDB/BR4rcrs CSs1B/0c/y/fuF+sfZbb0rxLvDoMQ6q44VS4LtRCkcitfJDMjMX02KfecjoheuhLoTP7zBNQUhX oHlzhBUu0F1zmRk1C4AmaFRBJV06gq/5iz2Kv24fyaO1WL5w+Wicnqn/l469uNiuBP97gAa8AgE Pa08IZVV4O4ZgCxkZCIaV9SQH725dEQF2anpHbHuovmSm9/AQe4Tmn0wJ9Jf9HPw+FNBlim726x KHb4P05Lf91UhvRVDNButS5pU9LIc4/AVG2nP1PiB8C6p0CBdCFKBOi55jeJXVOZTJRswMD95SJ 3kHZrgZnBXho7Etiy739ahC6ehCtOS2oVyKo3YffAS8Lg6VV
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
 drivers/rtc/rtc-pic32.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-pic32.c b/drivers/rtc/rtc-pic32.c
index fa351ac20158..4f85e0c3d757 100644
--- a/drivers/rtc/rtc-pic32.c
+++ b/drivers/rtc/rtc-pic32.c
@@ -284,15 +284,13 @@ static void pic32_rtc_enable(struct pic32_rtc_dev *pdata, int en)
 	clk_disable(pdata->clk);
 }
 
-static int pic32_rtc_remove(struct platform_device *pdev)
+static void pic32_rtc_remove(struct platform_device *pdev)
 {
 	struct pic32_rtc_dev *pdata = platform_get_drvdata(pdev);
 
 	pic32_rtc_setaie(&pdev->dev, 0);
 	clk_unprepare(pdata->clk);
 	pdata->clk = NULL;
-
-	return 0;
 }
 
 static int pic32_rtc_probe(struct platform_device *pdev)
@@ -373,7 +371,7 @@ MODULE_DEVICE_TABLE(of, pic32_rtc_dt_ids);
 
 static struct platform_driver pic32_rtc_driver = {
 	.probe		= pic32_rtc_probe,
-	.remove		= pic32_rtc_remove,
+	.remove_new	= pic32_rtc_remove,
 	.driver		= {
 		.name	= "pic32-rtc",
 		.of_match_table	= of_match_ptr(pic32_rtc_dt_ids),
-- 
2.39.1

