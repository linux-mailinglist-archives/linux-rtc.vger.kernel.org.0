Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E29F58A606
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Aug 2022 08:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237495AbiHEGog (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 Aug 2022 02:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237332AbiHEGod (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 Aug 2022 02:44:33 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C02073939;
        Thu,  4 Aug 2022 23:44:28 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2756iNpZ089776;
        Fri, 5 Aug 2022 01:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1659681863;
        bh=r4cuoO0g5StmeNhBsKDshy6zD5bIMNxZivFlDri7E5Y=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=h4BMFZKjV0N/yLGXdcJ99I/XTQig7sOvZ6ftdpzCtzEFW+9Uvr0vq26PjfadZY3dL
         j3F6ZP/7EVqEpQLE0a+07uvlfveUGThsrJLLq+f4fRnMUyfNrJeTNDf0YENRIfCQZx
         R8QQocog2FoSl3JMckFg3G+U141dhewxCNoWEeVI=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2756iN1a109610
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 5 Aug 2022 01:44:23 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 5
 Aug 2022 01:44:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 5 Aug 2022 01:44:22 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2756hvNF086657;
        Fri, 5 Aug 2022 01:44:15 -0500
From:   Matt Ranostay <mranostay@ti.com>
To:     <lee@kernel.org>, <nm@ti.com>
CC:     <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, Keerthy <j-keerthy@ti.com>,
        Matt Ranostay <mranostay@ti.com>
Subject: [PATCH 2/4] MFD: TPS6594x: Add new mfd device for TPS6594x PMIC
Date:   Thu, 4 Aug 2022 23:43:50 -0700
Message-ID: <20220805064352.793918-3-mranostay@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805064352.793918-1-mranostay@ti.com>
References: <20220805064352.793918-1-mranostay@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Keerthy <j-keerthy@ti.com>

The TPS6594x chip is a PMIC, and contains the following components:

- Regulators
- GPIO controller
- RTC

However initially only RTC is supported.

Signed-off-by: Keerthy <j-keerthy@ti.com>
Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 drivers/mfd/Kconfig          |  14 +++++
 drivers/mfd/Makefile         |   1 +
 drivers/mfd/tps6594x.c       | 106 +++++++++++++++++++++++++++++++++++
 include/linux/mfd/tps6594x.h |  66 ++++++++++++++++++++++
 4 files changed, 187 insertions(+)
 create mode 100644 drivers/mfd/tps6594x.c
 create mode 100644 include/linux/mfd/tps6594x.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index abb58ab1a1a4..cfb5b3d66b76 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1547,6 +1547,20 @@ config MFD_TI_LP873X
 	  This driver can also be built as a module. If so, the module
 	  will be called lp873x.
 
+config MFD_TPS6594X
+	tristate "TI TPS6594X Power Management IC"
+	depends on I2C
+	select MFD_CORE
+	select REGMAP_I2C
+	help
+	  If you say yes here then you get support for the TPS6594X series of
+	  Power Management Integrated Circuits (PMIC).
+	  These include voltage regulators, RTS, configurable
+	  General Purpose Outputs (GPO) that are used in portable devices.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called tps7694x.
+
 config MFD_TI_LP87565
 	tristate "TI LP87565 Power Management IC"
 	depends on I2C && OF
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 858cacf659d6..7ff6a8a57d55 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -105,6 +105,7 @@ obj-$(CONFIG_MFD_TPS65910)	+= tps65910.o
 obj-$(CONFIG_MFD_TPS65912)	+= tps65912-core.o
 obj-$(CONFIG_MFD_TPS65912_I2C)	+= tps65912-i2c.o
 obj-$(CONFIG_MFD_TPS65912_SPI)  += tps65912-spi.o
+obj-$(CONFIG_MFD_TPS6594X)	+= tps6594x.o
 obj-$(CONFIG_MENELAUS)		+= menelaus.o
 
 obj-$(CONFIG_TWL4030_CORE)	+= twl-core.o twl4030-irq.o twl6030-irq.o
diff --git a/drivers/mfd/tps6594x.c b/drivers/mfd/tps6594x.c
new file mode 100644
index 000000000000..519162cc1fbe
--- /dev/null
+++ b/drivers/mfd/tps6594x.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * tps6594x.c  --  TI TPS6594x chip family multi-function driver
+ *
+ * Copyright (C) 2022 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Author: Keerthy <j-keerthy@ti.com>
+ */
+
+#include <linux/interrupt.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+
+#include <linux/mfd/tps6594x.h>
+
+static const struct regmap_config tps6594x_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = TPS6594X_REG_MAX,
+};
+
+static const struct mfd_cell tps6594x_cells[] = {
+	{ .name = "tps6594x-rtc", },
+};
+
+static struct tps6594x *tps;
+
+static void tps6594x_power_off(void)
+{
+	regmap_write(tps->regmap, TPS6594X_FSM_NSLEEP_TRIGGERS, 0x3);
+	regmap_write(tps->regmap, TPS6594X_INT_STARTUP, 0xff);
+	regmap_write(tps->regmap, TPS6594X_INT_MISC, 0xff);
+	regmap_write(tps->regmap, TPS6594X_CONFIG_1, 0xc0);
+	regmap_write(tps->regmap, TPS6594X_FSM_I2C_TRIGGERS, 0x1);
+}
+
+static int tps6594x_probe(struct i2c_client *client,
+			const struct i2c_device_id *ids)
+{
+	struct tps6594x *tps6594;
+	int ret;
+	unsigned int otpid;
+	struct device_node *node = client->dev.of_node;
+
+	tps6594 = devm_kzalloc(&client->dev, sizeof(*tps6594), GFP_KERNEL);
+	if (!tps6594)
+		return -ENOMEM;
+
+	tps6594->dev = &client->dev;
+
+	tps6594->regmap = devm_regmap_init_i2c(client, &tps6594x_regmap_config);
+	if (IS_ERR(tps6594->regmap)) {
+		ret = PTR_ERR(tps6594->regmap);
+		dev_err(tps6594->dev,
+			"Failed to initialize register map: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_read(tps6594->regmap, TPS6594X_REG_DEV_REV, &otpid);
+	if (ret) {
+		dev_err(tps6594->dev, "Failed to read OTP ID\n");
+		return ret;
+	}
+
+	tps6594->rev = otpid;
+
+	i2c_set_clientdata(client, tps6594);
+
+	ret = mfd_add_devices(tps6594->dev, PLATFORM_DEVID_AUTO, tps6594x_cells,
+			      ARRAY_SIZE(tps6594x_cells), NULL, 0, NULL);
+
+	tps = tps6594;
+	if (of_property_read_bool(node, "ti,system-power-controller"))
+		pm_power_off = tps6594x_power_off;
+
+	return ret;
+}
+
+static const struct of_device_id of_tps6594x_match_table[] = {
+	{ .compatible = "ti,tps6594x", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, of_tps6594x_match_table);
+
+static const struct i2c_device_id tps6594x_id_table[] = {
+	{ "tps6594x", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, tps6594x_id_table);
+
+static struct i2c_driver tps6594x_driver = {
+	.driver	= {
+		.name	= "tps6594x",
+		.of_match_table = of_tps6594x_match_table,
+	},
+	.probe		= tps6594x_probe,
+	.id_table	= tps6594x_id_table,
+};
+module_i2c_driver(tps6594x_driver);
+
+MODULE_AUTHOR("J Keerthy <j-keerthy@ti.com>");
+MODULE_DESCRIPTION("TPS6594X chip family Multi-Function Device driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/tps6594x.h b/include/linux/mfd/tps6594x.h
new file mode 100644
index 000000000000..41349f96f013
--- /dev/null
+++ b/include/linux/mfd/tps6594x.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * tps6594x.h  --  TI TPS6594x
+ *
+ * Copyright (C) 2016 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+#ifndef __LINUX_MFD_TPS6594X_H
+#define __LINUX_MFD_TPS6594X_H
+
+#include <linux/bits.h>
+
+/* TPS6594x chip id list */
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
+#endif /* __LINUX_MFD_TPS6594X_H */
-- 
2.36.1

