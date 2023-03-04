Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C46776AAA23
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjCDNc0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjCDNcY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:24 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3B820067
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:31:58 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyG-0000cg-PW; Sat, 04 Mar 2023 14:30:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyG-001nZh-2v; Sat, 04 Mar 2023 14:30:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyF-0027Gs-AI; Sat, 04 Mar 2023 14:30:43 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Joshua Kinard <kumba@gentoo.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 11/41] rtc: ds1685: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:29:58 +0100
Message-Id: <20230304133028.2135435-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=6wCekPd1j8T/latIFmhMto7X0GgnW9pJQSU/BDjLj9g=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0eJxDTrOvlOg7lG/wFRQ9mrhMQsdp4IeU1iJ zAAg6ftXtOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHiQAKCRDB/BR4rcrs CaygB/9OjLioX3HVfr35WH3R1spnaavy6lWetr2vNtff+4V/iuc/vygpUAxHlUYMX3mgrZdlrsM eqxCP1gHaziVoboJESnD+O3FfViQk6TQIBPIMG39jfJraCSbplOAbnPjqGKkFy/d8oCiKjPXdEW qDKRvbj/Oyv3pPhp6Rj2G0uZuR4P33lKLyPk/Jsb9USj+JKaLE4yobycpJ9Ssf7AiYObkqeqnQo wPsuNQbUMDfaCgEelyxU7p1GvEfgaIgM1ntQtHlMc8SMypA4KrkuNidbdrpP0KEcxOAH0RTzecp 5iWn82aFX2U0yXqmdAQxLYIeDF2rxaff8RgiPRRB0l10MODy
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
 drivers/rtc/rtc-ds1685.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
index 5db9c737c022..0f707be0eb87 100644
--- a/drivers/rtc/rtc-ds1685.c
+++ b/drivers/rtc/rtc-ds1685.c
@@ -1322,7 +1322,7 @@ ds1685_rtc_probe(struct platform_device *pdev)
  * ds1685_rtc_remove - removes rtc driver.
  * @pdev: pointer to platform_device structure.
  */
-static int
+static void
 ds1685_rtc_remove(struct platform_device *pdev)
 {
 	struct ds1685_priv *rtc = platform_get_drvdata(pdev);
@@ -1344,8 +1344,6 @@ ds1685_rtc_remove(struct platform_device *pdev)
 	rtc->write(rtc, RTC_EXT_CTRL_4A,
 		   (rtc->read(rtc, RTC_EXT_CTRL_4A) &
 		    ~(RTC_CTRL_4A_RWK_MASK)));
-
-	return 0;
 }
 
 /*
@@ -1356,7 +1354,7 @@ static struct platform_driver ds1685_rtc_driver = {
 		.name	= "rtc-ds1685",
 	},
 	.probe		= ds1685_rtc_probe,
-	.remove		= ds1685_rtc_remove,
+	.remove_new	= ds1685_rtc_remove,
 };
 module_platform_driver(ds1685_rtc_driver);
 /* ----------------------------------------------------------------------- */
-- 
2.39.1

