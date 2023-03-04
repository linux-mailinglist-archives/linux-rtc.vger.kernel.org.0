Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2E86AAA4D
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbjCDNwn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:52:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCDNwn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:52:43 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59303F740
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:52:42 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyJ-0000l5-Il; Sat, 04 Mar 2023 14:30:47 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyI-001nas-Ug; Sat, 04 Mar 2023 14:30:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyH-0027HW-38; Sat, 04 Mar 2023 14:30:45 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 21/41] rtc: omap: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:08 +0100
Message-Id: <20230304133028.2135435-22-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=T2+xGjY6BzPIkTxmA96bS227V4TzqQ1LHbVyROhVT34=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0ep3E0yEl/SoDL0IHtG2lV/s72e9PNNRzy1D sNzbi0+KOuJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHqQAKCRDB/BR4rcrs CaZTB/9gReQUO9vYt4GBYADqLNkNNWv3lYcGgIMHL/POPygcIB4tS14rIuKJuKSU6rtPFOJ6O1X D+O5IRuSAqr6bQp50AoQAWt1Mr2QjvrPA6+ElRBDGfg2gZp4BE3JVwyWYPtF9epha6NdHQiD+UY wc3kuTqKdLOn714J8z2l0BH1E3bcHOOXgDUTOXdg7MeHqN1Ffr0mLQ+0qhjKmrbDLZtg6xbXugP fR4BLJBbq/B5JldxL9YlKUXwkxtz+zFQqVxilS4VmvOUrjiYm+aoddrSb9T0PnhX9M8pXdbmutG UhlREO3ChnM6ssXV8ni6c5P8YZomuQ0LubHLdhE4HgjUNrSN
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
 drivers/rtc/rtc-omap.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index 4d4f3b1a7309..fad30b3dde46 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -910,7 +910,7 @@ static int omap_rtc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int omap_rtc_remove(struct platform_device *pdev)
+static void omap_rtc_remove(struct platform_device *pdev)
 {
 	struct omap_rtc *rtc = platform_get_drvdata(pdev);
 	u8 reg;
@@ -941,8 +941,6 @@ static int omap_rtc_remove(struct platform_device *pdev)
 	/* Disable the clock/module */
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused omap_rtc_suspend(struct device *dev)
@@ -1017,7 +1015,7 @@ static void omap_rtc_shutdown(struct platform_device *pdev)
 
 static struct platform_driver omap_rtc_driver = {
 	.probe		= omap_rtc_probe,
-	.remove		= omap_rtc_remove,
+	.remove_new	= omap_rtc_remove,
 	.shutdown	= omap_rtc_shutdown,
 	.driver		= {
 		.name	= "omap_rtc",
-- 
2.39.1

