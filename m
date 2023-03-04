Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC856AAA38
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjCDNck (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjCDNcj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:39 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFAD922799
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:32:14 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyK-0000pl-Sw; Sat, 04 Mar 2023 14:30:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyJ-001nbH-R7; Sat, 04 Mar 2023 14:30:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyI-0027Hz-DQ; Sat, 04 Mar 2023 14:30:46 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 28/41] rtc: rzn1: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:15 +0100
Message-Id: <20230304133028.2135435-29-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=KVLbG5ufa8Ntt0rl8VovfNEJKYzq4Ahe0QYLf7iyQwo=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0fAmk7AjQK9/kO2oo9bodAP0c7nlKJWe2mZo y0QCkitHJqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHwAAKCRDB/BR4rcrs CYYuCACW/cHRUlehChHFq+oBLP7rFVAcK8FnRKaCeMQ8ACP25txlDckrcT0tXlDs1x73bPMJAZV WH/MbW5oxH5AMYcE/a62Q6dT4+cXoF5V4n5SysI5ihNZQY7g/daoGuZz2WyH78TWjITr+1rzL1W Q5OC3C5mDwK51En0OqLnV8WprvQakZ1JQiDp73E/jYZqeBbkPBZFUrsY7211CPFhp5fPayeRf4x no8P3993VJSqRBoIfwRP4oLs7w+1BnFBPMH50eTFqiXXFgifxneHSD3vwFaLnlNL6/zh8akWEoi UaZL1Jb7PGmh4J9oNGh4/Lslp7/IVmXyV4qb6KhCTb8CFoWc
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
 drivers/rtc/rtc-rzn1.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 0d36bc50197c..dca736caba85 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -391,11 +391,9 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rzn1_rtc_remove(struct platform_device *pdev)
+static void rzn1_rtc_remove(struct platform_device *pdev)
 {
 	pm_runtime_put(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
@@ -406,7 +404,7 @@ MODULE_DEVICE_TABLE(of, rzn1_rtc_of_match);
 
 static struct platform_driver rzn1_rtc_driver = {
 	.probe = rzn1_rtc_probe,
-	.remove = rzn1_rtc_remove,
+	.remove_new = rzn1_rtc_remove,
 	.driver = {
 		.name	= "rzn1-rtc",
 		.of_match_table = rzn1_rtc_of_match,
-- 
2.39.1

