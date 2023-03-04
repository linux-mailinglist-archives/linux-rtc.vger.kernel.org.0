Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFDD26AAA3A
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjCDNcq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjCDNcn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:43 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62927222F0
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:32:17 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyG-0000ce-Mj; Sat, 04 Mar 2023 14:30:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyG-001nZe-0R; Sat, 04 Mar 2023 14:30:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyE-0027Gg-QS; Sat, 04 Mar 2023 14:30:42 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 08/41] rtc: cadence: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:29:55 +0100
Message-Id: <20230304133028.2135435-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=fqAwrgM7HA4cFVQpfw7DiTcLZZUh3kSOSWvlxzkgq8w=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0eAZVSIjNhbrPLpfvodJXbheTnqULcCE/AzZ VTpBl7pj/yJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHgAAKCRDB/BR4rcrs CV2tB/9rsE8Gs1bHNZqVIeDxiXYerNSa8Hza9nr32lglFIbAJZGq71aKS6mKm4Dyet2Fpk4oigG 9HEQ+iq5LPamEB2TXNlcOE3B+VWttnaEj1Kidl8SSeVTHpTnuB2IdNFi30yDEfELvpLBIMjvWDZ yIc9Y6reHvRExadLszkMLj/UMsXih2YlEAiOGrBHS7WhLMSa+IhWCW9D3IvuUy/kI57h6TuMY63 2Pn4aZlMBE0YG7EqAWI+ESLbN1+i6R+46Hz6yuZdWMrrFJHED1UL3/vTb63xr9+RRw01oc0JZi4 bYKabOMTs0XRWEskf5f9B4UqgkjAMBr5/gD7U2EeKI6bodvY
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
 drivers/rtc/rtc-cadence.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-cadence.c b/drivers/rtc/rtc-cadence.c
index 1edf7f16d73a..4ca60b519836 100644
--- a/drivers/rtc/rtc-cadence.c
+++ b/drivers/rtc/rtc-cadence.c
@@ -354,7 +354,7 @@ static int cdns_rtc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cdns_rtc_remove(struct platform_device *pdev)
+static void cdns_rtc_remove(struct platform_device *pdev)
 {
 	struct cdns_rtc *crtc = platform_get_drvdata(pdev);
 
@@ -363,8 +363,6 @@ static int cdns_rtc_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(crtc->pclk);
 	clk_disable_unprepare(crtc->ref_clk);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -404,7 +402,7 @@ static struct platform_driver cdns_rtc_driver = {
 		.pm = &cdns_rtc_pm_ops,
 	},
 	.probe = cdns_rtc_probe,
-	.remove = cdns_rtc_remove,
+	.remove_new = cdns_rtc_remove,
 };
 module_platform_driver(cdns_rtc_driver);
 
-- 
2.39.1

