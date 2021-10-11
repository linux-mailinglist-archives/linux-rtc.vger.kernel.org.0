Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC1642953D
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Oct 2021 19:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232915AbhJKRJC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Oct 2021 13:09:02 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:49781 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232477AbhJKRI7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Oct 2021 13:08:59 -0400
Received: from [77.244.183.192] (port=63592 helo=melee.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mZxfQ-00DXft-46; Mon, 11 Oct 2021 17:56:44 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-kernel@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 6/8] mfd: max77714: Add driver for Maxim MAX77714 PMIC
Date:   Mon, 11 Oct 2021 17:56:13 +0200
Message-Id: <20211011155615.257529-7-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011155615.257529-1-luca@lucaceresoli.net>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add a simple driver for the Maxim MAX77714 PMIC, supporting RTC and
watchdog only.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 MAINTAINERS                  |   2 +
 drivers/mfd/Kconfig          |  14 ++++
 drivers/mfd/Makefile         |   1 +
 drivers/mfd/max77714.c       | 151 +++++++++++++++++++++++++++++++++++
 include/linux/mfd/max77714.h |  68 ++++++++++++++++
 5 files changed, 236 insertions(+)
 create mode 100644 drivers/mfd/max77714.c
 create mode 100644 include/linux/mfd/max77714.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 4d0134752537..df394192f14e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11389,6 +11389,8 @@ MAXIM MAX77714 PMIC MFD DRIVER
 M:	Luca Ceresoli <luca@lucaceresoli.net>
 S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
+F:	drivers/mfd/max77714.c
+F:	include/linux/mfd/max77714.h
 
 MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
 M:	Javier Martinez Canillas <javier@dowhile0.org>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index ca0edab91aeb..b5f6e6174508 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -853,6 +853,20 @@ config MFD_MAX77693
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_MAX77714
+	bool "Maxim Semiconductor MAX77714 PMIC Support"
+	depends on I2C
+	depends on OF || COMPILE_TEST
+	select MFD_CORE
+	select REGMAP_I2C
+	help
+	  Say yes here to add support for Maxim Semiconductor MAX77714.
+	  This is a Power Management IC with 4 buck regulators, 9
+	  low-dropout regulators, 8 GPIOs, RTC, watchdog etc. This driver
+	  provides common support for accessing the device; additional
+	  drivers must be enabled in order to use each functionality of the
+	  device.
+
 config MFD_MAX77843
 	bool "Maxim Semiconductor MAX77843 PMIC Support"
 	depends on I2C=y
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 2ba6646e874c..fe43f2fdd5cb 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -163,6 +163,7 @@ obj-$(CONFIG_MFD_MAX77620)	+= max77620.o
 obj-$(CONFIG_MFD_MAX77650)	+= max77650.o
 obj-$(CONFIG_MFD_MAX77686)	+= max77686.o
 obj-$(CONFIG_MFD_MAX77693)	+= max77693.o
+obj-$(CONFIG_MFD_MAX77714)	+= max77714.o
 obj-$(CONFIG_MFD_MAX77843)	+= max77843.o
 obj-$(CONFIG_MFD_MAX8907)	+= max8907.o
 max8925-objs			:= max8925-core.o max8925-i2c.o
diff --git a/drivers/mfd/max77714.c b/drivers/mfd/max77714.c
new file mode 100644
index 000000000000..5d6c88d4d6c0
--- /dev/null
+++ b/drivers/mfd/max77714.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Maxim MAX77714 Watchdog Driver
+ *
+ * Copyright (C) 2021 Luca Ceresoli
+ * Author: Luca Ceresoli <luca@lucaceresoli.net>
+ */
+
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/max77714.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+static const struct regmap_range max77714_readable_ranges[] = {
+	regmap_reg_range(MAX77714_INT_TOP,     MAX77714_INT_TOP),
+	regmap_reg_range(MAX77714_INT_TOPM,    MAX77714_INT_TOPM),
+	regmap_reg_range(MAX77714_32K_STATUS,  MAX77714_32K_CONFIG),
+	regmap_reg_range(MAX77714_CNFG_GLBL2,  MAX77714_CNFG2_ONOFF),
+};
+
+static const struct regmap_range max77714_writable_ranges[] = {
+	regmap_reg_range(MAX77714_INT_TOPM,    MAX77714_INT_TOPM),
+	regmap_reg_range(MAX77714_32K_CONFIG,  MAX77714_32K_CONFIG),
+	regmap_reg_range(MAX77714_CNFG_GLBL2,  MAX77714_CNFG2_ONOFF),
+};
+
+static const struct regmap_access_table max77714_readable_table = {
+	.yes_ranges = max77714_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(max77714_readable_ranges),
+};
+
+static const struct regmap_access_table max77714_writable_table = {
+	.yes_ranges = max77714_writable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(max77714_writable_ranges),
+};
+
+static const struct regmap_config max77714_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = MAX77714_CNFG2_ONOFF,
+	.rd_table = &max77714_readable_table,
+	.wr_table = &max77714_writable_table,
+};
+
+static const struct regmap_irq max77714_top_irqs[] = {
+	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_ONOFF,   0, MAX77714_INT_TOP_ONOFF),
+	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_RTC,     0, MAX77714_INT_TOP_RTC),
+	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_GPIO,    0, MAX77714_INT_TOP_GPIO),
+	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_LDO,     0, MAX77714_INT_TOP_LDO),
+	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_SD,      0, MAX77714_INT_TOP_SD),
+	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_GLBL,    0, MAX77714_INT_TOP_GLBL),
+};
+
+static const struct regmap_irq_chip max77714_irq_chip = {
+	.name			= "max77714-pmic",
+	.status_base		= MAX77714_INT_TOP,
+	.mask_base		= MAX77714_INT_TOPM,
+	.num_regs		= 1,
+	.irqs			= max77714_top_irqs,
+	.num_irqs		= ARRAY_SIZE(max77714_top_irqs),
+};
+
+static const struct mfd_cell max77714_cells[] = {
+	{ .name = "max77714-watchdog" },
+	{ .name = "max77714-rtc" },
+};
+
+/*
+ * MAX77714 initially uses the internal, low precision oscillator. Enable
+ * the external oscillator by setting the XOSC_RETRY bit. If the external
+ * oscillator is not OK (probably not installed) this has no effect.
+ */
+static int max77714_setup_xosc(struct max77714 *chip)
+{
+	/* Internal Crystal Load Capacitance, indexed by value of 32KLOAD bits */
+	static const unsigned int load_cap[4] = {0, 10, 12, 22};
+	unsigned int load_cap_idx;
+	unsigned int status;
+	int err;
+
+	err = regmap_update_bits(chip->regmap, MAX77714_32K_CONFIG,
+				 MAX77714_32K_CONFIG_XOSC_RETRY,
+				 MAX77714_32K_CONFIG_XOSC_RETRY);
+	if (err)
+		return dev_err_probe(chip->dev, err, "cannot configure XOSC\n");
+
+	err = regmap_read(chip->regmap, MAX77714_32K_STATUS, &status);
+	if (err)
+		return dev_err_probe(chip->dev, err, "cannot read XOSC status\n");
+
+	load_cap_idx = (status >> MAX77714_32K_STATUS_32KLOAD_SHF)
+		& MAX77714_32K_STATUS_32KLOAD_MSK;
+
+	dev_info(chip->dev, "Using %s oscillator, %d pF load cap\n",
+		 status & MAX77714_32K_STATUS_32KSOURCE ? "internal" : "external",
+		 load_cap[load_cap_idx]);
+
+	return 0;
+}
+
+static int max77714_probe(struct i2c_client *client)
+{
+	struct max77714 *chip;
+	int err;
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, chip);
+	chip->dev = &client->dev;
+
+	chip->regmap = devm_regmap_init_i2c(client, &max77714_regmap_config);
+	if (IS_ERR(chip->regmap))
+		return dev_err_probe(chip->dev, PTR_ERR(chip->regmap),
+				     "failed to initialise regmap\n");
+
+	err = max77714_setup_xosc(chip);
+	if (err)
+		return err;
+
+	err = devm_regmap_add_irq_chip(chip->dev, chip->regmap, client->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, 0,
+				       &max77714_irq_chip, &chip->irq_data);
+	if (err)
+		return dev_err_probe(chip->dev, err, "failed to add PMIC irq chip\n");
+
+	err =  devm_mfd_add_devices(chip->dev, PLATFORM_DEVID_NONE,
+				    max77714_cells, ARRAY_SIZE(max77714_cells),
+				    NULL, 0, NULL);
+	if (err)
+		return dev_err_probe(chip->dev, err, "failed adding MFD children\n");
+
+	return 0;
+}
+
+static const struct of_device_id max77714_dt_match[] = {
+	{ .compatible = "maxim,max77714" },
+	{},
+};
+
+static struct i2c_driver max77714_driver = {
+	.driver = {
+		.name = "max77714",
+		.of_match_table = of_match_ptr(max77714_dt_match),
+	},
+	.probe_new = max77714_probe,
+};
+builtin_i2c_driver(max77714_driver);
diff --git a/include/linux/mfd/max77714.h b/include/linux/mfd/max77714.h
new file mode 100644
index 000000000000..ca6b747b73c2
--- /dev/null
+++ b/include/linux/mfd/max77714.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Maxim MAX77714 Register and data structures definition.
+ *
+ * Copyright (C) 2021 Luca Ceresoli
+ * Author: Luca Ceresoli <luca@lucaceresoli.net>
+ */
+
+#ifndef _MFD_MAX77714_H_
+#define _MFD_MAX77714_H_
+
+#include <linux/bits.h>
+
+#define MAX77714_INT_TOP	0x00
+#define MAX77714_INT_TOPM	0x07 /* Datasheet says "read only", but it is RW */
+
+#define MAX77714_INT_TOP_ONOFF		BIT(1)
+#define MAX77714_INT_TOP_RTC		BIT(3)
+#define MAX77714_INT_TOP_GPIO		BIT(4)
+#define MAX77714_INT_TOP_LDO		BIT(5)
+#define MAX77714_INT_TOP_SD		BIT(6)
+#define MAX77714_INT_TOP_GLBL		BIT(7)
+
+#define MAX77714_32K_STATUS	0x30
+#define MAX77714_32K_STATUS_SIOSCOK	BIT(5)
+#define MAX77714_32K_STATUS_XOSCOK	BIT(4)
+#define MAX77714_32K_STATUS_32KSOURCE	BIT(3)
+#define MAX77714_32K_STATUS_32KLOAD_MSK	0x3
+#define MAX77714_32K_STATUS_32KLOAD_SHF	1
+#define MAX77714_32K_STATUS_CRYSTAL_CFG	BIT(0)
+
+#define MAX77714_32K_CONFIG	0x31
+#define MAX77714_32K_CONFIG_XOSC_RETRY	BIT(4)
+
+#define MAX77714_CNFG_GLBL2	0x91
+#define MAX77714_WDTEN			BIT(2)
+#define MAX77714_WDTSLPC		BIT(3)
+#define MAX77714_TWD_MASK		0x3
+#define MAX77714_TWD_2s			0x0
+#define MAX77714_TWD_16s		0x1
+#define MAX77714_TWD_64s		0x2
+#define MAX77714_TWD_128s		0x3
+
+#define MAX77714_CNFG_GLBL3	0x92
+#define MAX77714_WDTC			BIT(0)
+
+#define MAX77714_CNFG2_ONOFF	0x94
+#define MAX77714_WD_RST_WK		BIT(5)
+
+/* Interrupts */
+enum {
+	MAX77714_IRQ_TOP_ONOFF,
+	MAX77714_IRQ_TOP_RTC,		/* Real-time clock */
+	MAX77714_IRQ_TOP_GPIO,		/* GPIOs */
+	MAX77714_IRQ_TOP_LDO,		/* Low-dropout regulators */
+	MAX77714_IRQ_TOP_SD,		/* Step-down regulators */
+	MAX77714_IRQ_TOP_GLBL,		/* "Global resources": Low-Battery, overtemp... */
+};
+
+struct max77714 {
+	struct device *dev;
+	struct regmap *regmap;
+	struct regmap_irq_chip_data *irq_data;
+
+	int irq;
+};
+
+#endif /* _MFD_MAX77714_H_ */
-- 
2.25.1

