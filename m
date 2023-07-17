Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD227562F0
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jul 2023 14:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbjGQMlS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 17 Jul 2023 08:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbjGQMlL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 17 Jul 2023 08:41:11 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CF9EEE4C;
        Mon, 17 Jul 2023 05:41:09 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="173145688"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jul 2023 21:41:09 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 61B134008C71;
        Mon, 17 Jul 2023 21:41:07 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/2] rtc: pcf85063: Drop enum pcf85063_type and split pcf85063_cfg[]
Date:   Mon, 17 Jul 2023 13:40:59 +0100
Message-Id: <20230717124059.196244-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230717124059.196244-1-biju.das.jz@bp.renesas.com>
References: <20230717124059.196244-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Drop enum pcf85063_type and split the array pcf85063_cfg[] as individual
variables, and make lines shorter by referring to e.g. &pcf85063_cfg
instead of &pcf85063_cfg[PCF85063].

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch
---
 drivers/rtc/rtc-pcf85063.c | 83 +++++++++++++++++---------------------
 1 file changed, 38 insertions(+), 45 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index a3b75c96ff9a..f501b6f9ed01 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -514,46 +514,39 @@ static struct clk *pcf85063_clkout_register_clk(struct pcf85063 *pcf85063)
 }
 #endif
 
-enum pcf85063_type {
-	PCF85063,
-	PCF85063TP,
-	PCF85063A,
-	RV8263,
-	PCF85063_LAST_ID
+static const struct pcf85063_config config_pcf85063 = {
+	.regmap = {
+		.reg_bits = 8,
+		.val_bits = 8,
+		.max_register = 0x0a,
+	},
 };
 
-static struct pcf85063_config pcf85063_cfg[] = {
-	[PCF85063] = {
-		.regmap = {
-			.reg_bits = 8,
-			.val_bits = 8,
-			.max_register = 0x0a,
-		},
-	},
-	[PCF85063TP] = {
-		.regmap = {
-			.reg_bits = 8,
-			.val_bits = 8,
-			.max_register = 0x0a,
-		},
+static const struct pcf85063_config config_pcf85063tp = {
+	.regmap = {
+		.reg_bits = 8,
+		.val_bits = 8,
+		.max_register = 0x0a,
 	},
-	[PCF85063A] = {
-		.regmap = {
-			.reg_bits = 8,
-			.val_bits = 8,
-			.max_register = 0x11,
-		},
-		.has_alarms = 1,
+};
+
+static const struct pcf85063_config config_pcf85063a = {
+	.regmap = {
+		.reg_bits = 8,
+		.val_bits = 8,
+		.max_register = 0x11,
 	},
-	[RV8263] = {
-		.regmap = {
-			.reg_bits = 8,
-			.val_bits = 8,
-			.max_register = 0x11,
-		},
-		.has_alarms = 1,
-		.force_cap_7000 = 1,
+	.has_alarms = 1,
+};
+
+static const struct pcf85063_config config_rv8263 = {
+	.regmap = {
+		.reg_bits = 8,
+		.val_bits = 8,
+		.max_register = 0x11,
 	},
+	.has_alarms = 1,
+	.force_cap_7000 = 1,
 };
 
 static int pcf85063_probe(struct i2c_client *client)
@@ -645,22 +638,22 @@ static int pcf85063_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pcf85063_ids[] = {
-	{ "pca85073a", .driver_data = (kernel_ulong_t)&pcf85063_cfg[PCF85063A] },
-	{ "pcf85063", .driver_data = (kernel_ulong_t)&pcf85063_cfg[PCF85063] },
-	{ "pcf85063tp", .driver_data = (kernel_ulong_t)&pcf85063_cfg[PCF85063TP] },
-	{ "pcf85063a", .driver_data = (kernel_ulong_t)&pcf85063_cfg[PCF85063A] },
-	{ "rv8263", .driver_data = (kernel_ulong_t)&pcf85063_cfg[RV8263] },
+	{ "pca85073a", .driver_data = (kernel_ulong_t)&config_pcf85063a },
+	{ "pcf85063", .driver_data = (kernel_ulong_t)&config_pcf85063 },
+	{ "pcf85063tp", .driver_data = (kernel_ulong_t)&config_pcf85063tp },
+	{ "pcf85063a", .driver_data = (kernel_ulong_t)&config_pcf85063a },
+	{ "rv8263", .driver_data = (kernel_ulong_t)&config_rv8263 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, pcf85063_ids);
 
 #ifdef CONFIG_OF
 static const struct of_device_id pcf85063_of_match[] = {
-	{ .compatible = "nxp,pca85073a", .data = &pcf85063_cfg[PCF85063A] },
-	{ .compatible = "nxp,pcf85063", .data = &pcf85063_cfg[PCF85063] },
-	{ .compatible = "nxp,pcf85063tp", .data = &pcf85063_cfg[PCF85063TP] },
-	{ .compatible = "nxp,pcf85063a", .data = &pcf85063_cfg[PCF85063A] },
-	{ .compatible = "microcrystal,rv8263", .data = &pcf85063_cfg[RV8263] },
+	{ .compatible = "nxp,pca85073a", .data = &config_pcf85063a },
+	{ .compatible = "nxp,pcf85063", .data = &config_pcf85063 },
+	{ .compatible = "nxp,pcf85063tp", .data = &config_pcf85063tp },
+	{ .compatible = "nxp,pcf85063a", .data = &config_pcf85063a },
+	{ .compatible = "microcrystal,rv8263", .data = &config_rv8263 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, pcf85063_of_match);
-- 
2.25.1

