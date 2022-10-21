Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97D576077CF
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Oct 2022 15:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbiJUNIl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 21 Oct 2022 09:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbiJUNIg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 21 Oct 2022 09:08:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52D526D207
        for <linux-rtc@vger.kernel.org>; Fri, 21 Oct 2022 06:08:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk4-0001XV-UJ; Fri, 21 Oct 2022 15:07:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk1-000Wlb-Vo; Fri, 21 Oct 2022 15:07:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk3-009Z8P-3k; Fri, 21 Oct 2022 15:07:15 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 1/9] rtc: abx80x: Convert to .probe_new()
Date:   Fri, 21 Oct 2022 15:06:58 +0200
Message-Id: <20221021130706.178687-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
References: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=A3VWPXYlSHRGLgof+3WUwIyWx+668MXopXY4/6egwQM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUplaO5JogVdRYexM6J4vHG9v5rf8ETBK0ObfljKm j/ozgAmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1KZWgAKCRDB/BR4rcrsCeanCA CX8PYQTq3miS4qFPWMWVr0K9LAmk3sIX17AhESzObKFCW39PXaUBYvyGYEP97NzRdREEF3tptSxzXy gDwA09x3jlmVsrsgPq3SH0xy9I/JADDiVS7OvAhElr0Z1BcYSIMRbifFS9wql9zPoPO0gIyX7YyQCF jek7EgTdWS9VQpWyh1MS/eHsAtTFnxHfHlB0CwsTu2RHNrzE4MkPxq1DUfsSN6HTJCGZnkIZg9tHF1 lrEUYBl0WhLNrQ5BsYwcADh3M51Og7P8JFjqEb0yyYER6CFXn/em+7X1r2Aj/mLElwbNdfkvUqCjmZ DO7HR1aBdFFC/3svKyt2He1JRD++2B
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

.probe_new() doesn't get the i2c_device_id * parameter, so determine
that explicitly in .probe(). The device_id array has to move up for that
to work.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-abx80x.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 9b0138d07232..e7f325ced940 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -673,13 +673,28 @@ static int abx80x_setup_watchdog(struct abx80x_priv *priv)
 }
 #endif
 
-static int abx80x_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static const struct i2c_device_id abx80x_id[] = {
+	{ "abx80x", ABX80X },
+	{ "ab0801", AB0801 },
+	{ "ab0803", AB0803 },
+	{ "ab0804", AB0804 },
+	{ "ab0805", AB0805 },
+	{ "ab1801", AB1801 },
+	{ "ab1803", AB1803 },
+	{ "ab1804", AB1804 },
+	{ "ab1805", AB1805 },
+	{ "rv1805", RV1805 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, abx80x_id);
+
+static int abx80x_probe(struct i2c_client *client)
 {
 	struct device_node *np = client->dev.of_node;
 	struct abx80x_priv *priv;
 	int i, data, err, trickle_cfg = -EINVAL;
 	char buf[7];
+	const struct i2c_device_id *id = i2c_match_id(abx80x_id, client);
 	unsigned int part = id->driver_data;
 	unsigned int partnumber;
 	unsigned int majrev, minrev;
@@ -847,21 +862,6 @@ static int abx80x_probe(struct i2c_client *client,
 	return devm_rtc_register_device(priv->rtc);
 }
 
-static const struct i2c_device_id abx80x_id[] = {
-	{ "abx80x", ABX80X },
-	{ "ab0801", AB0801 },
-	{ "ab0803", AB0803 },
-	{ "ab0804", AB0804 },
-	{ "ab0805", AB0805 },
-	{ "ab1801", AB1801 },
-	{ "ab1803", AB1803 },
-	{ "ab1804", AB1804 },
-	{ "ab1805", AB1805 },
-	{ "rv1805", RV1805 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, abx80x_id);
-
 #ifdef CONFIG_OF
 static const struct of_device_id abx80x_of_match[] = {
 	{
@@ -914,7 +914,7 @@ static struct i2c_driver abx80x_driver = {
 		.name	= "rtc-abx80x",
 		.of_match_table = of_match_ptr(abx80x_of_match),
 	},
-	.probe		= abx80x_probe,
+	.probe_new	= abx80x_probe,
 	.id_table	= abx80x_id,
 };
 
-- 
2.37.2

