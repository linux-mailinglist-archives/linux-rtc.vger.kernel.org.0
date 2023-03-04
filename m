Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4196AAA1E
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Mar 2023 14:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbjCDNcX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Mar 2023 08:32:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjCDNcU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 4 Mar 2023 08:32:20 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FA292
        for <linux-rtc@vger.kernel.org>; Sat,  4 Mar 2023 05:31:54 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyI-0000hD-6g; Sat, 04 Mar 2023 14:30:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyH-001naF-7E; Sat, 04 Mar 2023 14:30:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyG-0027HB-7J; Sat, 04 Mar 2023 14:30:44 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 16/41] rtc: mc13xxx: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:03 +0100
Message-Id: <20230304133028.2135435-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=AVXxUQAmIRG347kCJNr+rju/Ya4JNMxt9hmnmWBsgPQ=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0eZ9WxHde0TzVQumwHA1xjwicQooKnEk+/ho WUPhiPQlxGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHmQAKCRDB/BR4rcrs CTvzB/0TSJrx+rIg+r6JeKZJWui9drTodHjf1GJT1RE1/arv/1+peySWyMz5pLp97vgklRKxWgR 9DQyuY3U3a7KJu8GjjkpnjBImQ0qNNBl1pfNDRkn8vCK8DDz5gb8OYWxlJ5/VXZcFVfSkL7AskF s2KQkOdRAfoF9/VuLWUUep8NtGwsgZRWuWW/8yPciYdLNpqV3Hi4Mtd56DaJo2IWBRThLB5Z0tQ IeAxxrvQ3YTmfwv4Ec4UiyIddymjTSJ1NYM8+vdxRnzGiA4Es3XMdvVG6GB+SthtmR2KRjcb7ZS c0QUYi52MnhGCkj2HmBK8bdoIXg8FVUDvY25U2E57WfYYnFA
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
 drivers/rtc/rtc-mc13xxx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-mc13xxx.c b/drivers/rtc/rtc-mc13xxx.c
index d4234e78497e..763a42f422eb 100644
--- a/drivers/rtc/rtc-mc13xxx.c
+++ b/drivers/rtc/rtc-mc13xxx.c
@@ -324,7 +324,7 @@ static int __init mc13xxx_rtc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mc13xxx_rtc_remove(struct platform_device *pdev)
+static void mc13xxx_rtc_remove(struct platform_device *pdev)
 {
 	struct mc13xxx_rtc *priv = platform_get_drvdata(pdev);
 
@@ -334,8 +334,6 @@ static int mc13xxx_rtc_remove(struct platform_device *pdev)
 	mc13xxx_irq_free(priv->mc13xxx, MC13XXX_IRQ_RTCRST, priv);
 
 	mc13xxx_unlock(priv->mc13xxx);
-
-	return 0;
 }
 
 static const struct platform_device_id mc13xxx_rtc_idtable[] = {
@@ -352,7 +350,7 @@ MODULE_DEVICE_TABLE(platform, mc13xxx_rtc_idtable);
 
 static struct platform_driver mc13xxx_rtc_driver = {
 	.id_table = mc13xxx_rtc_idtable,
-	.remove = mc13xxx_rtc_remove,
+	.remove_new = mc13xxx_rtc_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 	},
-- 
2.39.1

