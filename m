Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64E1862F10B
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Nov 2022 10:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbiKRJW6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 18 Nov 2022 04:22:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241374AbiKRJW4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 18 Nov 2022 04:22:56 -0500
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63CA113F7A;
        Fri, 18 Nov 2022 01:22:55 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AI9MX66095108;
        Fri, 18 Nov 2022 03:22:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1668763353;
        bh=SOAKX23ZznRqlOq68yZWeXyJ3TDIEK072b298hjasK4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=gX3M6QlSOge4dpIwt/a65i7eFkqcktFgkGxPBYavkafFobadWDlspOLTQBMOqsq0y
         GHh0cx/FlvXCa2sGab6OLNEwSPA3SlGXZOChYmWdFARh/TuQfNHwmPCINsJcH1+iaT
         3DdAAfODO+0ECqKcfKp/7tZM3UlRKy2FPLWuRaXw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AI9MX9X031095
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Nov 2022 03:22:33 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 18
 Nov 2022 03:22:33 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 18 Nov 2022 03:22:33 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AI9MUVE039750;
        Fri, 18 Nov 2022 03:22:31 -0600
From:   Matt Ranostay <mranostay@ti.com>
To:     <vigneshr@ti.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <a.zummo@towertech.it>,
        <linus.walleij@linaro.org>, <lee@kernel.org>, <brgl@bgdev.pl>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, Keerthy <j-keerthy@ti.com>,
        Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v4 2/4] MFD: TPS6594x: Add new PMIC device driver for TPS6594x chips
Date:   Fri, 18 Nov 2022 01:22:16 -0800
Message-ID: <20221118092218.480147-3-mranostay@ti.com>
X-Mailer: git-send-email 2.38.GIT
In-Reply-To: <20221118092218.480147-1-mranostay@ti.com>
References: <20221118092218.480147-1-mranostay@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Keerthy <j-keerthy@ti.com>

The TPS6594x chip is a PMIC, and contains the following components:

- GPIO controller
- RTC

Signed-off-by: Keerthy <j-keerthy@ti.com>
Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 drivers/mfd/Kconfig          |  14 +++++
 drivers/mfd/Makefile         |   1 +
 drivers/mfd/tps6594x.c       | 113 +++++++++++++++++++++++++++++++++++
 include/linux/mfd/tps6594x.h |  84 ++++++++++++++++++++++++++
 4 files changed, 212 insertions(+)
 create mode 100644 drivers/mfd/tps6594x.c
 create mode 100644 include/linux/mfd/tps6594x.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6653d03e0fe3..f19178cf9c61 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1596,6 +1596,20 @@ config MFD_TI_LP873X
 	  This driver can also be built as a module. If so, the module
 	  will be called lp873x.
 
+config MFD_TPS6594X
+	tristate "TI TPS6594X Power Management IC"
+	depends on I2C && OF
+	select MFD_CORE
+	select REGMAP_I2C
+	help
+	  If you say yes here then you get support for the TPS6594X series of
+	  Power Management Integrated Circuits (PMIC).
+	  These include voltage regulators, RTS, configurable
+	  General Purpose Outputs (GPO) that are used in portable devices.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called tps6594x.
+
 config MFD_TI_LP87565
 	tristate "TI LP87565 Power Management IC"
 	depends on I2C && OF
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 4dd479212b3a..51d7bfcd0a27 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_MFD_TPS65910)	+= tps65910.o
 obj-$(CONFIG_MFD_TPS65912)	+= tps65912-core.o
 obj-$(CONFIG_MFD_TPS65912_I2C)	+= tps65912-i2c.o
 obj-$(CONFIG_MFD_TPS65912_SPI)  += tps65912-spi.o
+obj-$(CONFIG_MFD_TPS6594X)	+= tps6594x.o
 obj-$(CONFIG_MENELAUS)		+= menelaus.o
 
 obj-$(CONFIG_TWL4030_CORE)	+= twl-core.o twl4030-irq.o twl6030-irq.o
diff --git a/drivers/mfd/tps6594x.c b/drivers/mfd/tps6594x.c
new file mode 100644
index 000000000000..700e887a0966
--- /dev/null
+++ b/drivers/mfd/tps6594x.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for tps6594x PMIC chips
+ *
+ * Copyright (C) 2022 Texas Instruments Incorporated - https://www.ti.com/
+ * Author: Keerthy <j-keerthy@ti.com>
+ */
+
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/tps6594x.h>
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+
+static const struct regmap_config tps6594x_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = TPS6594X_REG_MAX,
+};
+
+static const struct mfd_cell tps6594x_cells[] = {
+	{ .name = "tps6594-gpio" },
+	{ .name = "tps6594-rtc" },
+};
+
+static struct tps6594x *tps;
+
+static void tps6594x_power_off(void)
+{
+	regmap_write(tps->regmap, TPS6594X_FSM_NSLEEP_TRIGGERS,
+		TPS6594X_FSM_NSLEEP_NSLEEP1B | TPS6594X_FSM_NSLEEP_NSLEEP2B);
+
+	regmap_write(tps->regmap, TPS6594X_INT_STARTUP,
+		TPS6594X_INT_STARTUP_NPWRON_START_INT |
+		TPS6594X_INT_STARTUP_ENABLE_INT | TPS6594X_INT_STARTUP_RTC_INT |
+		TPS6594X_INT_STARTUP_SOFT_REBOOT_INT);
+
+	regmap_write(tps->regmap, TPS6594X_INT_MISC,
+		TPS6594X_INT_MISC_BIST_PASS_INT |
+		TPS6594X_INT_MISC_EXT_CLK_INT | TPS6594X_INT_MISC_TWARN_INT);
+
+	regmap_write(tps->regmap, TPS6594X_CONFIG_1,
+		TPS6594X_CONFIG_NSLEEP1_MASK | TPS6594X_CONFIG_NSLEEP2_MASK);
+
+	regmap_write(tps->regmap, TPS6594X_FSM_I2C_TRIGGERS,
+		TPS6594X_FSM_I2C_TRIGGERS_I2C0);
+}
+
+static int tps6594x_probe(struct i2c_client *client)
+{
+	struct tps6594x *ddata;
+	struct device_node *node = client->dev.of_node;
+	unsigned int otpid;
+	int ret;
+
+	ddata = devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->dev = &client->dev;
+
+	ddata->regmap = devm_regmap_init_i2c(client, &tps6594x_regmap_config);
+	if (IS_ERR(ddata->regmap))
+		return dev_err_probe(ddata->dev, PTR_ERR(ddata->regmap),
+			"Failed to initialize register map\n");
+
+	ret = regmap_read(ddata->regmap, TPS6594X_REG_DEV_REV, &otpid);
+	if (ret)
+		return dev_err_probe(ddata->dev, ret, "Failed to read OTP ID\n");
+
+	ddata->rev = otpid;
+	i2c_set_clientdata(client, ddata);
+
+	ret = mfd_add_devices(ddata->dev, PLATFORM_DEVID_AUTO, tps6594x_cells,
+			      ARRAY_SIZE(tps6594x_cells), NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(ddata->dev, ret, "Failed to register cells\n");
+
+	tps = ddata;
+
+	if (of_property_read_bool(node, "ti,system-power-controller"))
+		pm_power_off = tps6594x_power_off;
+
+	return 0;
+}
+
+static const struct of_device_id of_tps6594x_match_table[] = {
+	{ .compatible = "ti,tps6594", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, of_tps6594x_match_table);
+
+static const struct i2c_device_id tps6594x_id_table[] = {
+	{ "tps6594", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, tps6594x_id_table);
+
+static struct i2c_driver tps6594x_driver = {
+	.driver	= {
+		.name	= "tps6594",
+		.of_match_table = of_tps6594x_match_table,
+	},
+	.probe_new	= tps6594x_probe,
+	.id_table	= tps6594x_id_table,
+};
+module_i2c_driver(tps6594x_driver);
+
+MODULE_AUTHOR("J Keerthy <j-keerthy@ti.com>");
+MODULE_DESCRIPTION("TPS6594X PMIC device driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/tps6594x.h b/include/linux/mfd/tps6594x.h
new file mode 100644
index 000000000000..5a6af0da9223
--- /dev/null
+++ b/include/linux/mfd/tps6594x.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Core driver interface for TI TPS6594x PMIC family
+ *
+ * Copyright (C) 2022 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+#ifndef __MFD_TPS6594X_H
+#define __MFD_TPS6594X_H
+
+#include <linux/bits.h>
+
+/* TPS6594x chip ID list */
+#define TPS6594X			0x00
+
+/* All register addresses */
+#define TPS6594X_REG_DEV_REV			0x01
+#define TPS6594X_INT_STARTUP			0x65
+#define TPS6594X_INT_MISC			0x66
+#define TPS6594X_CONFIG_1			0x7d
+#define TPS6594X_FSM_I2C_TRIGGERS		0x85
+#define TPS6594X_FSM_NSLEEP_TRIGGERS		0x86
+
+#define TPS6594X_RTC_SECONDS			0xb5
+#define TPS6594X_RTC_MINUTES			0xb6
+#define TPS6594X_RTC_HOURS			0xb7
+#define TPS6594X_RTC_DAYS			0xb8
+#define TPS6594X_RTC_MONTHS			0xb9
+#define TPS6594X_RTC_YEARS			0xba
+#define TPS6594X_RTC_WEEKS			0xbb
+#define TPS6594X_ALARM_SECONDS			0xbc
+#define TPS6594X_ALARM_MINUTES			0xbd
+#define TPS6594X_ALARM_HOURS			0xbe
+#define TPS6594X_ALARM_DAYS			0xbf
+#define TPS6594X_ALARM_MONTHS			0xc0
+#define TPS6594X_ALARM_YEARS			0xc1
+#define TPS6594X_RTC_CTRL_1			0xc2
+#define TPS6594X_RTC_CTRL_2			0xc3
+#define TPS6594X_RTC_STATUS			0xc4
+#define TPS6594X_RTC_INTERRUPTS			0xc5
+#define TPS6594X_REG_MAX			0xd0
+
+/* Register field definitions */
+#define TPS6594X_DEV_REV_DEV_ID			0xff
+
+#define TPS6594X_INT_STARTUP_NPWRON_START_INT	BIT(0)
+#define TPS6594X_INT_STARTUP_ENABLE_INT		BIT(1)
+#define TPS6594X_INT_STARTUP_RTC_INT		BIT(2)
+#define TPS6594X_INT_STARTUP_FSD_INT		BIT(4)
+#define TPS6594X_INT_STARTUP_SOFT_REBOOT_INT	BIT(5)
+
+#define TPS6594X_INT_MISC_BIST_PASS_INT		BIT(0)
+#define TPS6594X_INT_MISC_EXT_CLK_INT		BIT(1)
+#define TPS6594X_INT_MISC_TWARN_INT		BIT(3)
+
+#define TPS6594X_CONFIG_NSLEEP1_MASK		BIT(6)
+#define TPS6594X_CONFIG_NSLEEP2_MASK		BIT(7)
+
+#define TPS6594X_FSM_I2C_TRIGGERS_I2C0		BIT(0)
+
+#define TPS6594X_FSM_NSLEEP_NSLEEP1B		BIT(0)
+#define TPS6594X_FSM_NSLEEP_NSLEEP2B		BIT(1)
+
+#define TPS6594X_RTC_CTRL_REG_GET_TIME		BIT(6)
+#define TPS6594X_RTC_CTRL_REG_STOP_RTC		BIT(0)
+#define TPS6594X_RTC_INTERRUPTS_REG_IT_ALARM	BIT(3)
+
+#define TPS6594X_RTC_STATUS_RUN			BIT(1)
+
+/**
+ * struct tps6594x - state holder for the tps6594x driver
+ * @dev: struct device pointer for MFD device
+ * @rev: revision of the tps6594x
+ * @lock: lock guarding the data structure
+ * @regmap: register map of the tps6594x PMIC
+ *
+ * Device data may be used to access the TPS6594X chip
+ */
+struct tps6594x {
+	struct device *dev;
+	u8 rev;
+	struct regmap *regmap;
+};
+#endif /* __MFD_TPS6594X_H */
-- 
2.38.GIT

