Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67DB06AAA18
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjCDNcR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjCDNcQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D1C1F90A
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:31:51 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyF-0000bl-EX; Sat, 04 Mar 2023 14:30:43 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyE-001nZE-PL; Sat, 04 Mar 2023 14:30:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyE-0027GR-4F; Sat, 04 Mar 2023 14:30:42 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 04/41] rtc: ac100: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:29:51 +0100
Message-Id: <20230304133028.2135435-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=AjxRkeaeiRejjRKZfMSIhM0IqNs7Ec3jKTZRJ9+NOYY=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0dzAY9/mrmH9+LlqPpHeJwlYsNDPJrnCin6M +yXjpC+u0eJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHcwAKCRDB/BR4rcrs Ccl+B/9ImidqWibGqE7o6Mg8jZISgFyYN0KCIUOsZRl3nyo9qpOvFHL3UM4f/Xsq9CzX98+00nn esmyshk8VSr8G5zk7q2p94CNPfg0TIYuwXOgOUaiV2YmFGESf7q8z8HDlRNWVWQwcYoWj+44UjN jKkIft3oxVxgrQeOTVuC9F/EatuhJ/YAeM+rCvZI50Cm5zSDj3nHPq8CYoIXjiJRcYiiiVd1qM0 tYY6Gcz1r+DJ+iO1zzii8U9pQos3uhLQkeSLupolh3+iuuq/RDYiGG5kv0wBtFbMjETUxJY5cNU Nu0QHMuUEAmZCP0KnCiHmkRl+vs216OgL9OImEWjMHxYrhK4
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
 drivers/rtc/rtc-ac100.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-ac100.c b/drivers/rtc/rtc-ac100.c
index 66783cb5e711..eaf2c9ab9661 100644
--- a/drivers/rtc/rtc-ac100.c
+++ b/drivers/rtc/rtc-ac100.c
@@ -613,13 +613,11 @@ static int ac100_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(chip->rtc);
 }
 
-static int ac100_rtc_remove(struct platform_device *pdev)
+static void ac100_rtc_remove(struct platform_device *pdev)
 {
 	struct ac100_rtc_dev *chip = platform_get_drvdata(pdev);
 
 	ac100_rtc_unregister_clks(chip);
-
-	return 0;
 }
 
 static const struct of_device_id ac100_rtc_match[] = {
@@ -630,7 +628,7 @@ MODULE_DEVICE_TABLE(of, ac100_rtc_match);
 
 static struct platform_driver ac100_rtc_driver = {
 	.probe		= ac100_rtc_probe,
-	.remove		= ac100_rtc_remove,
+	.remove_new	= ac100_rtc_remove,
 	.driver		= {
 		.name		= "ac100-rtc",
 		.of_match_table	= of_match_ptr(ac100_rtc_match),
-- 
2.39.1

