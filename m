Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD94A445426
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Nov 2021 14:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhKDNpL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 4 Nov 2021 09:45:11 -0400
Received: from mail-qt1-f181.google.com ([209.85.160.181]:37529 "EHLO
        mail-qt1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231651AbhKDNnM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 4 Nov 2021 09:43:12 -0400
Received: by mail-qt1-f181.google.com with SMTP id o12so4105071qtv.4;
        Thu, 04 Nov 2021 06:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xa2FxXm6EvIpFGYPWL3bZJ+I6Y3hXoRrueVo8Uzn4QU=;
        b=ysJsTFQbWMQOpo0OOU7ged1wHdVgxtgm312o+ch19B4bqL76Km9V4kZfOIGANjApIe
         CeNOC7724zwX3BRKNaIjrCZwGKUYbz34odD10KnobPzU+C26kxWMGRiYK3BBvvQnDZHn
         VcweRnOJomQAarfzCjpUMKvNbwRvtxAINPShyNwX8VdHGauqOQITRsLG4dXIhnsg939f
         aVKXOFnYoF7uFhjZgNvduGG2hn0OYcrnsj/FT0xn0MM9XSPaNdD+kCSwSr4pGxqaWE11
         ljG8jQM53bE9Q+aUseV751T+eykcD0Duce68uTTSoIxYtxCrUi4AMe9F5ddh8Gsvw4mM
         2Kdw==
X-Gm-Message-State: AOAM531PMsZnIb049gaVjbjU+zekRisGR0khpBgcFuDSquXcMgEAB4vY
        1hq3unkBHLRF0m0pHA24hOCWtUs+2/g=
X-Google-Smtp-Source: ABdhPJwpvNoqDh0GmZQzfNPdQ5UlrzRoxGpKJ2AJPG2aGoaGToi0wBxFrPmvmZ5KbpPIo4ruZOvMKQ==
X-Received: by 2002:ac8:6112:: with SMTP id a18mr53329488qtm.401.1636033231236;
        Thu, 04 Nov 2021 06:40:31 -0700 (PDT)
Received: from mfe-desktop.dimonoffinc.intra (ipagstaticip-ad9375f2-382c-b511-8ac1-9541f69fe50f.sdsl.bell.ca. [142.116.33.166])
        by smtp.googlemail.com with ESMTPSA id k4sm3187684qko.79.2021.11.04.06.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 06:40:30 -0700 (PDT)
From:   ferlandm@amotus.ca
To:     a.zummo@towertech.it
Cc:     alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Marc Ferland <ferlandm@amotus.ca>
Subject: [PATCH] rtc: pcf85063: add i2c_device_id name matching support
Date:   Thu,  4 Nov 2021 09:40:07 -0400
Message-Id: <20211104134007.1159581-1-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Marc Ferland <ferlandm@amotus.ca>

The pcf85063 driver regsitration currently supports the "compatible"
property type of matching (for DT).

This patch adds "matching by name" support to the driver by defining
an i2c_device_id table and setting the id_table parameter in the
i2c_driver struct.

This will, for example, make the driver easier to instantiate on
systems where CONFIG_OF is not enabled (x86 in my case).

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 drivers/rtc/rtc-pcf85063.c | 92 +++++++++++++++++++++++++-------------
 1 file changed, 61 insertions(+), 31 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 14da4ab30104..521607213ada 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -500,21 +500,56 @@ static struct clk *pcf85063_clkout_register_clk(struct pcf85063 *pcf85063)
 }
 #endif
 
-static const struct pcf85063_config pcf85063tp_config = {
-	.regmap = {
-		.reg_bits = 8,
-		.val_bits = 8,
-		.max_register = 0x0a,
+enum pcf85063_type {
+	PCF85063,
+	PCF85063TP,
+	PCF85063A,
+	RV8263,
+};
+
+static struct pcf85063_config pcf85063_cfg[] = {
+	[PCF85063] = {
+		.regmap = {
+			.reg_bits = 8,
+			.val_bits = 8,
+			.max_register = 0x0a,
+		},
+	},
+	[PCF85063TP] = {
+		.regmap = {
+			.reg_bits = 8,
+			.val_bits = 8,
+			.max_register = 0x0a,
+		},
+	},
+	[PCF85063A] = {
+		.regmap = {
+			.reg_bits = 8,
+			.val_bits = 8,
+			.max_register = 0x11,
+		},
+		.has_alarms = 1,
+	},
+	[RV8263] = {
+		.regmap = {
+			.reg_bits = 8,
+			.val_bits = 8,
+			.max_register = 0x11,
+		},
+		.has_alarms = 1,
+		.force_cap_7000 = 1,
 	},
 };
 
+static const struct i2c_device_id pcf85063_ids[];
+
 static int pcf85063_probe(struct i2c_client *client)
 {
 	struct pcf85063 *pcf85063;
 	unsigned int tmp;
 	int err;
-	const struct pcf85063_config *config = &pcf85063tp_config;
-	const void *data = of_device_get_match_data(&client->dev);
+	const struct pcf85063_config *config;
+	enum pcf85063_type type;
 	struct nvmem_config nvmem_cfg = {
 		.name = "pcf85063_nvram",
 		.reg_read = pcf85063_nvmem_read,
@@ -530,8 +565,12 @@ static int pcf85063_probe(struct i2c_client *client)
 	if (!pcf85063)
 		return -ENOMEM;
 
-	if (data)
-		config = data;
+	if (client->dev.of_node)
+		type = (enum pcf85063_type)of_device_get_match_data(&client->dev);
+	else
+		type = i2c_match_id(pcf85063_ids, client)->driver_data;
+
+	config = &pcf85063_cfg[type];
 
 	pcf85063->regmap = devm_regmap_init_i2c(client, &config->regmap);
 	if (IS_ERR(pcf85063->regmap))
@@ -590,31 +629,21 @@ static int pcf85063_probe(struct i2c_client *client)
 	return devm_rtc_register_device(pcf85063->rtc);
 }
 
-#ifdef CONFIG_OF
-static const struct pcf85063_config pcf85063a_config = {
-	.regmap = {
-		.reg_bits = 8,
-		.val_bits = 8,
-		.max_register = 0x11,
-	},
-	.has_alarms = 1,
-};
-
-static const struct pcf85063_config rv8263_config = {
-	.regmap = {
-		.reg_bits = 8,
-		.val_bits = 8,
-		.max_register = 0x11,
-	},
-	.has_alarms = 1,
-	.force_cap_7000 = 1,
+static const struct i2c_device_id pcf85063_ids[] = {
+	{ "pcf85063", PCF85063 },
+	{ "pcf85063tp", PCF85063TP },
+	{ "pcf85063a", PCF85063A },
+	{ "rv8263", RV8263 },
+	{}
 };
+MODULE_DEVICE_TABLE(i2c, pcf85063_ids);
 
+#ifdef CONFIG_OF
 static const struct of_device_id pcf85063_of_match[] = {
-	{ .compatible = "nxp,pcf85063", .data = &pcf85063tp_config },
-	{ .compatible = "nxp,pcf85063tp", .data = &pcf85063tp_config },
-	{ .compatible = "nxp,pcf85063a", .data = &pcf85063a_config },
-	{ .compatible = "microcrystal,rv8263", .data = &rv8263_config },
+	{ .compatible = "nxp,pcf85063", .data =  (void *)PCF85063 },
+	{ .compatible = "nxp,pcf85063tp", .data = (void *)PCF85063TP },
+	{ .compatible = "nxp,pcf85063a", .data = (void *)PCF85063A },
+	{ .compatible = "microcrystal,rv8263", .data = (void *)RV8263 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, pcf85063_of_match);
@@ -626,6 +655,7 @@ static struct i2c_driver pcf85063_driver = {
 		.of_match_table = of_match_ptr(pcf85063_of_match),
 	},
 	.probe_new	= pcf85063_probe,
+	.id_table	= pcf85063_ids,
 };
 
 module_i2c_driver(pcf85063_driver);
-- 
2.30.2

