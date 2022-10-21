Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E995E6077CC
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Oct 2022 15:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbiJUNIj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 21 Oct 2022 09:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbiJUNIf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 21 Oct 2022 09:08:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2337B26B4AE
        for <linux-rtc@vger.kernel.org>; Fri, 21 Oct 2022 06:08:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk5-0001Y6-Tj; Fri, 21 Oct 2022 15:07:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk2-000Wlt-Ti; Fri, 21 Oct 2022 15:07:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk4-009Z8h-He; Fri, 21 Oct 2022 15:07:16 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 6/9] rtc: pcf2127: Convert to .probe_new()
Date:   Fri, 21 Oct 2022 15:07:03 +0200
Message-Id: <20221021130706.178687-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
References: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=L2nRK2VCDIqaUNaEEf5rTfin2X0REpZCkAWZO3gkJQg=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUplriOoSI0ld3bwiwrCa9KdN8WAPvRiY22Ocn0sP 8HbqTySJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1KZawAKCRDB/BR4rcrsCesKB/ 9dKA7pw9uoHoBlHPcmgLFULBaP7ufsAXMrYzsNk3rZW9/P0u/8vV3WxFWGbl81QjlOoiQqIqjQXtOt TQYTPbvZSOyHab6W7C5q+BSAuLXVCe2Ddx4r+lkNe/1jogpgBpKlfm1UabD+GlFGzPowEpdCbkhjvP W4A9icCQ3IvTrzwqvu4fqi8L1jmGnba1qKNFgFpRTTCU3LDk7yIdY0s5egex5Xoxu3TuBVw8yVxORm lHcAgJKKn6iAutY1hevGXDy3IxYIvmdv4oyQBIR5jcXyWp9I/HhNkOd45bpG5T2jP43VypoMJWnzrF t6WbZbY6Re6o9rixjJVeDoLxlBKGE6
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
 drivers/rtc/rtc-pcf2127.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 63b275b014bd..87f4fc9df68b 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -885,9 +885,17 @@ static const struct regmap_bus pcf2127_i2c_regmap = {
 
 static struct i2c_driver pcf2127_i2c_driver;
 
-static int pcf2127_i2c_probe(struct i2c_client *client,
-				const struct i2c_device_id *id)
+static const struct i2c_device_id pcf2127_i2c_id[] = {
+	{ "pcf2127", 1 },
+	{ "pcf2129", 0 },
+	{ "pca2129", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
+
+static int pcf2127_i2c_probe(struct i2c_client *client)
 {
+	const struct i2c_device_id *id = i2c_match_id(pcf2127_i2c_id, client);
 	struct regmap *regmap;
 	static const struct regmap_config config = {
 		.reg_bits = 8,
@@ -910,20 +918,12 @@ static int pcf2127_i2c_probe(struct i2c_client *client,
 			     pcf2127_i2c_driver.driver.name, id->driver_data);
 }
 
-static const struct i2c_device_id pcf2127_i2c_id[] = {
-	{ "pcf2127", 1 },
-	{ "pcf2129", 0 },
-	{ "pca2129", 0 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
-
 static struct i2c_driver pcf2127_i2c_driver = {
 	.driver		= {
 		.name	= "rtc-pcf2127-i2c",
 		.of_match_table = of_match_ptr(pcf2127_of_match),
 	},
-	.probe		= pcf2127_i2c_probe,
+	.probe_new	= pcf2127_i2c_probe,
 	.id_table	= pcf2127_i2c_id,
 };
 
-- 
2.37.2

