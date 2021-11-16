Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE03F45380B
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Nov 2021 17:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236300AbhKPQv2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Nov 2021 11:51:28 -0500
Received: from mail-qv1-f44.google.com ([209.85.219.44]:36728 "EHLO
        mail-qv1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234638AbhKPQv1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Nov 2021 11:51:27 -0500
Received: by mail-qv1-f44.google.com with SMTP id kl8so9708967qvb.3;
        Tue, 16 Nov 2021 08:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T/DR427tTp/YwIAJcq4nzY7qJ+Hd9Zi8f0Vnt1zdVgQ=;
        b=aeifczJg+7i/hnSzMIV+jfMQ1fiFOUk0yg8eu7cwI94zTTdhKGB0fuK63KZH5ZUq7x
         FvaYrfv9CzY9M1/ejTxs0EfQ1g2gWB/N4U1bgjaxbFn5ylfxRjgEgSn8ywn4vPCFupUz
         d1vS6Dk4qiRrDfLv6uwr5jlSXS9EInky4hz9gZxxLimKHY3M3UIqvCGDuAHk85mZWihQ
         U/bpZX9noTXIAw6lYmbC1VZUB5DlkCrO9A7+/kDqjGmHU5YZtrznfqTjpDWtc4IR/35i
         CFqTHl68XOS4ptEHd3QC5Dvjb0yFwdXZ7MPGk6Wq5JsMOCrwXnzgrfOAYB9zOCgqgyk4
         Tybw==
X-Gm-Message-State: AOAM5327o+QZ0Or81ZlmfX2B3CS/1xf5TDgiumyQReyCB7onOO7SyxMf
        Vvbi2Zx2i08XxCPZDikk4eg=
X-Google-Smtp-Source: ABdhPJyYAg0XT0S8hQKjiPDNZpIXx+ib1JgY2q0aX759VibKfv3gkL8CWs3TjzVwhbkwWio6FySdTw==
X-Received: by 2002:a0c:c582:: with SMTP id a2mr46791047qvj.27.1637081310083;
        Tue, 16 Nov 2021 08:48:30 -0800 (PST)
Received: from mfe-desktop.dimonoffinc.intra (ipagstaticip-ad9375f2-382c-b511-8ac1-9541f69fe50f.sdsl.bell.ca. [142.116.33.166])
        by smtp.googlemail.com with ESMTPSA id m20sm4719620qkp.112.2021.11.16.08.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 08:48:26 -0800 (PST)
From:   ferlandm@amotus.ca
To:     a.zummo@towertech.it
Cc:     alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Marc Ferland <ferlandm@amotus.ca>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2] rtc: pcf85063: add i2c_device_id name matching support
Date:   Tue, 16 Nov 2021 11:47:33 -0500
Message-Id: <20211116164733.17149-1-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <202111051119.UeuF3GiJ-lkp@intel.com>
References: <202111051119.UeuF3GiJ-lkp@intel.com>
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
Reported-by: kernel test robot <lkp@intel.com>
---
Changes in v2:
 - rebased on rtc-next
 - fix compile warning reported by kernel test robot
 - use --base as suggested by kernel test robot

 drivers/rtc/rtc-pcf85063.c | 97 ++++++++++++++++++++++++++------------
 1 file changed, 66 insertions(+), 31 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 15e50bb10cf0..df2b072c394d 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -514,21 +514,56 @@ static struct clk *pcf85063_clkout_register_clk(struct pcf85063 *pcf85063)
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
+	PCF85063_LAST_ID
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
 	struct nvmem_config nvmem_cfg = {
 		.name = "pcf85063_nvram",
 		.reg_read = pcf85063_nvmem_read,
@@ -544,8 +579,17 @@ static int pcf85063_probe(struct i2c_client *client)
 	if (!pcf85063)
 		return -ENOMEM;
 
-	if (data)
-		config = data;
+	if (client->dev.of_node) {
+		config = of_device_get_match_data(&client->dev);
+		if (!config)
+			return -ENODEV;
+	} else {
+		enum pcf85063_type type =
+			i2c_match_id(pcf85063_ids, client)->driver_data;
+		if (type >= PCF85063_LAST_ID)
+			return -ENODEV;
+		config = &pcf85063_cfg[type];
+	}
 
 	pcf85063->regmap = devm_regmap_init_i2c(client, &config->regmap);
 	if (IS_ERR(pcf85063->regmap))
@@ -604,31 +648,21 @@ static int pcf85063_probe(struct i2c_client *client)
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
+	{ .compatible = "nxp,pcf85063", .data = &pcf85063_cfg[PCF85063] },
+	{ .compatible = "nxp,pcf85063tp", .data = &pcf85063_cfg[PCF85063TP] },
+	{ .compatible = "nxp,pcf85063a", .data = &pcf85063_cfg[PCF85063A] },
+	{ .compatible = "microcrystal,rv8263", .data = &pcf85063_cfg[RV8263] },
 	{}
 };
 MODULE_DEVICE_TABLE(of, pcf85063_of_match);
@@ -640,6 +674,7 @@ static struct i2c_driver pcf85063_driver = {
 		.of_match_table = of_match_ptr(pcf85063_of_match),
 	},
 	.probe_new	= pcf85063_probe,
+	.id_table	= pcf85063_ids,
 };
 
 module_i2c_driver(pcf85063_driver);

base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
-- 
2.30.2
