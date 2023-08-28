Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B416178A94E
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Aug 2023 11:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjH1Jvy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Aug 2023 05:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjH1JvZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Aug 2023 05:51:25 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 08354CA;
        Mon, 28 Aug 2023 02:51:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,207,1688396400"; 
   d="scan'208";a="174202993"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Aug 2023 18:51:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.234])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B578341C7FA6;
        Mon, 28 Aug 2023 18:51:18 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] rtc: pcf2127: Simplify probe()
Date:   Mon, 28 Aug 2023 10:51:16 +0100
Message-Id: <20230828095116.36922-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Make similar OF and ID table for I2C and simpilfy probe() by replacing
of_device_get_match_data() and id lookup for retrieving match data by
i2c_get_match_data().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 * This patch is only compile tested.
---
 drivers/rtc/rtc-pcf2127.c | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 9c04c4e1a49c..ec3968e3b8ac 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -1349,15 +1349,6 @@ static const struct regmap_bus pcf2127_i2c_regmap = {
 
 static struct i2c_driver pcf2127_i2c_driver;
 
-static const struct i2c_device_id pcf2127_i2c_id[] = {
-	{ "pcf2127", PCF2127 },
-	{ "pcf2129", PCF2129 },
-	{ "pca2129", PCF2129 },
-	{ "pcf2131", PCF2131 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
-
 static int pcf2127_i2c_probe(struct i2c_client *client)
 {
 	struct regmap *regmap;
@@ -1370,18 +1361,9 @@ static int pcf2127_i2c_probe(struct i2c_client *client)
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
-	if (client->dev.of_node) {
-		variant = of_device_get_match_data(&client->dev);
-		if (!variant)
-			return -ENODEV;
-	} else {
-		enum pcf21xx_type type =
-			i2c_match_id(pcf2127_i2c_id, client)->driver_data;
-
-		if (type >= PCF21XX_LAST_ID)
-			return -ENODEV;
-		variant = &pcf21xx_cfg[type];
-	}
+	variant = i2c_get_match_data(client);
+	if (!variant)
+		return -ENODEV;
 
 	config.max_register = variant->max_register,
 
@@ -1396,6 +1378,15 @@ static int pcf2127_i2c_probe(struct i2c_client *client)
 	return pcf2127_probe(&client->dev, regmap, client->irq, variant);
 }
 
+static const struct i2c_device_id pcf2127_i2c_id[] = {
+	{ "pcf2127", (kernel_ulong_t)&pcf21xx_cfg[PCF2127] },
+	{ "pcf2129", (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
+	{ "pca2129", (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
+	{ "pcf2131", (kernel_ulong_t)&pcf21xx_cfg[PCF2131] },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
+
 static struct i2c_driver pcf2127_i2c_driver = {
 	.driver		= {
 		.name	= "rtc-pcf2127-i2c",
-- 
2.25.1

