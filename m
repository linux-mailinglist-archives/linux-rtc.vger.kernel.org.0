Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39593754F66
	for <lists+linux-rtc@lfdr.de>; Sun, 16 Jul 2023 17:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjGPP3G (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 16 Jul 2023 11:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGPP3G (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 16 Jul 2023 11:29:06 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C74BB90;
        Sun, 16 Jul 2023 08:29:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,210,1684767600"; 
   d="scan'208";a="172933675"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jul 2023 00:29:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B428A40078B1;
        Mon, 17 Jul 2023 00:29:01 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] rtc: pcf85063: Simplify probe()
Date:   Sun, 16 Jul 2023 16:28:58 +0100
Message-Id: <20230716152858.92696-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pcf85063_ids[].driver_data could store a pointer to the config,
like for DT-based matching, making I2C and DT-based matching
more similar.

After that, we can simplify the probe() by replacing of_device_get_
match_data() and i2c_match_id() by i2c_get_match_data() as we have
similar I2C and DT-based matching table.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch is based on the work done for rtc-isl1208 and
 is just compile tested.
---
 drivers/rtc/rtc-pcf85063.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index e517abfaee2a..a3b75c96ff9a 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -556,8 +556,6 @@ static struct pcf85063_config pcf85063_cfg[] = {
 	},
 };
 
-static const struct i2c_device_id pcf85063_ids[];
-
 static int pcf85063_probe(struct i2c_client *client)
 {
 	struct pcf85063 *pcf85063;
@@ -579,17 +577,9 @@ static int pcf85063_probe(struct i2c_client *client)
 	if (!pcf85063)
 		return -ENOMEM;
 
-	if (client->dev.of_node) {
-		config = of_device_get_match_data(&client->dev);
-		if (!config)
-			return -ENODEV;
-	} else {
-		enum pcf85063_type type =
-			i2c_match_id(pcf85063_ids, client)->driver_data;
-		if (type >= PCF85063_LAST_ID)
-			return -ENODEV;
-		config = &pcf85063_cfg[type];
-	}
+	config = i2c_get_match_data(client);
+	if (!config)
+		return -ENODEV;
 
 	pcf85063->regmap = devm_regmap_init_i2c(client, &config->regmap);
 	if (IS_ERR(pcf85063->regmap))
@@ -655,11 +645,11 @@ static int pcf85063_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pcf85063_ids[] = {
-	{ "pca85073a", PCF85063A },
-	{ "pcf85063", PCF85063 },
-	{ "pcf85063tp", PCF85063TP },
-	{ "pcf85063a", PCF85063A },
-	{ "rv8263", RV8263 },
+	{ "pca85073a", .driver_data = (kernel_ulong_t)&pcf85063_cfg[PCF85063A] },
+	{ "pcf85063", .driver_data = (kernel_ulong_t)&pcf85063_cfg[PCF85063] },
+	{ "pcf85063tp", .driver_data = (kernel_ulong_t)&pcf85063_cfg[PCF85063TP] },
+	{ "pcf85063a", .driver_data = (kernel_ulong_t)&pcf85063_cfg[PCF85063A] },
+	{ "rv8263", .driver_data = (kernel_ulong_t)&pcf85063_cfg[RV8263] },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, pcf85063_ids);
-- 
2.25.1

