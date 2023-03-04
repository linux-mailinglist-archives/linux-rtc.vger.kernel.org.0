Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0C166AAA49
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjCDNw0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjCDNwZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:52:25 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6873EC56
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:52:24 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyH-0000eU-Lk; Sat, 04 Mar 2023 14:30:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyG-001nZy-If; Sat, 04 Mar 2023 14:30:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyF-0027H3-S3; Sat, 04 Mar 2023 14:30:43 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Vladimir Zapolskiy <vz@mleia.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 14/41] rtc: lpc24xx: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:01 +0100
Message-Id: <20230304133028.2135435-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=63DuH+TOuxhnvmkNbh5i2kquvyYSlzTp6ymU9lwCIoc=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0eT87engC63C9hy727K5SZJTpeAAJtNcKNoP ew/st2yGhCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHkwAKCRDB/BR4rcrs CfyWB/9hbsekg1S94PnDZGawAnjZzsymAmajRwwRzr0oOPk6iOM9+IB6n684Ru5tMlcptTI/zB4 +UyK4en3BG8ixH3YtjOOQ9XwYGZacxwPQyjqNhi9u/UIEvcP7N4g5kOgbA4A33hW41kMSIBNNxS D8R4goExqWLcNIS9CNSb7O9aVLFec0I7DO3Q6CVZxoEuXP8LyWVVP+ynKCmzQNH3pVI6uv9OY8k s3zQl1eJ/YiagkU9+bXQlzxkHP790OvOqLLX9ziYuXBkdiuWCCbVoWi+tOmF+AJeUluNA3r5yVV vi4zThz0skJtC6yM8xIE0WbFRp6KFEvDdWfoiq0Xt9eafQ8J
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
 drivers/rtc/rtc-lpc24xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-lpc24xx.c b/drivers/rtc/rtc-lpc24xx.c
index eec881a81067..a4612e543f35 100644
--- a/drivers/rtc/rtc-lpc24xx.c
+++ b/drivers/rtc/rtc-lpc24xx.c
@@ -264,7 +264,7 @@ static int lpc24xx_rtc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int lpc24xx_rtc_remove(struct platform_device *pdev)
+static void lpc24xx_rtc_remove(struct platform_device *pdev)
 {
 	struct lpc24xx_rtc *rtc = platform_get_drvdata(pdev);
 
@@ -276,8 +276,6 @@ static int lpc24xx_rtc_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(rtc->clk_rtc);
 	clk_disable_unprepare(rtc->clk_reg);
-
-	return 0;
 }
 
 static const struct of_device_id lpc24xx_rtc_match[] = {
@@ -288,7 +286,7 @@ MODULE_DEVICE_TABLE(of, lpc24xx_rtc_match);
 
 static struct platform_driver lpc24xx_rtc_driver = {
 	.probe	= lpc24xx_rtc_probe,
-	.remove	= lpc24xx_rtc_remove,
+	.remove_new = lpc24xx_rtc_remove,
 	.driver	= {
 		.name = "lpc24xx-rtc",
 		.of_match_table	= lpc24xx_rtc_match,
-- 
2.39.1

