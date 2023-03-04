Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E81AC6AAA28
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjCDNc2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbjCDNcY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:24 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D9121299
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:31:58 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyK-0000pg-SV; Sat, 04 Mar 2023 14:30:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyJ-001nbF-Qv; Sat, 04 Mar 2023 14:30:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyI-0027Hw-85; Sat, 04 Mar 2023 14:30:46 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 27/41] rtc: rtd119x: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:14 +0100
Message-Id: <20230304133028.2135435-28-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=odV417dEtzSlXvgCaVHIsG2b1T51VcLZnLpfp/v1Gt0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0e8Lk8F8jIMIsqcdjF8k7cPuqF5Bc9XQ6XN5 wmGH9R4AryJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHvAAKCRDB/BR4rcrs CbboB/97wk5Wq/NBusHWsxTtPmUkaszRxe6KnEn0LRE8hEdsMY2klwpyLBEa0Degcna91l8W3KL S38w8XIOuPL4fFCyUFd5tPbZLWXlSIXTTuWQCpVvtp/aapLx20BAtFohiszBvPrIPvb8gO8hvnl kRhBHyK4vt9KzGLsTLRhABFRAlbd1SxAj6Cs64ZVan4h1aMA8gytKBvaQu7A6OOE7jL4DWrbjBL Vm/q0slEJgwUx9DMFwMAotJKoEgcEJ7GL1o0XI8o59BbwOMjev1PxwaZFJqjJ9eN0+bUIb6W1S+ xTZ3wg0ULryzjS+Xb9jTluOjrXwDml179ENRhJt2XYS7sdt2
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
 drivers/rtc/rtc-rtd119x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-rtd119x.c b/drivers/rtc/rtc-rtd119x.c
index 8f9abd65846c..29662dfd56fe 100644
--- a/drivers/rtc/rtc-rtd119x.c
+++ b/drivers/rtc/rtc-rtd119x.c
@@ -216,7 +216,7 @@ static int rtd119x_rtc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int rtd119x_rtc_remove(struct platform_device *pdev)
+static void rtd119x_rtc_remove(struct platform_device *pdev)
 {
 	struct rtd119x_rtc *data = platform_get_drvdata(pdev);
 
@@ -224,13 +224,11 @@ static int rtd119x_rtc_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(data->clk);
 	clk_put(data->clk);
-
-	return 0;
 }
 
 static struct platform_driver rtd119x_rtc_driver = {
 	.probe = rtd119x_rtc_probe,
-	.remove = rtd119x_rtc_remove,
+	.remove_new = rtd119x_rtc_remove,
 	.driver = {
 		.name = "rtd1295-rtc",
 		.of_match_table	= rtd119x_rtc_dt_ids,
-- 
2.39.1

