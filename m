Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52468125E38
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Dec 2019 10:52:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfLSJwv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Dec 2019 04:52:51 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43616 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbfLSJwu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Dec 2019 04:52:50 -0500
Received: by mail-lj1-f195.google.com with SMTP id a13so5501406ljm.10;
        Thu, 19 Dec 2019 01:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=djMRt0CEVSZEysZxbEXpXkJ/id1+axKQ146EGBhy4Yo=;
        b=JcGngKbiNsilA/5yTKqcI1Z3Fwo5G+hjzIvyZTEeeMm3UiTX/+t5rjAiVK++mVWVWf
         0ONsKGkBztyLy4Tr2G509asLTyJH0YPbuIP2IaeFymE1WjJh6xPk2PML6I/7hEXZuiIS
         y8avyYOZK4kwjttHI0xO7XU67Xg1+XvpmqDDadGJjTR0zzz0ppapuTUphGiR/pWN/vn0
         mjFhi0SyTD0dqPmFhUP9InLWd9haoCzdm+WMUM2n31q5uQvLm99YnJtWFsdlPlLkD7K9
         f6zJpljsGAMlXlHse4XX86dIBZ68Z2wGktIuxNJF/Kf+TlNHUeSYrbwOUs3SR14kpy03
         hmxA==
X-Gm-Message-State: APjAAAXg+FFAhB82pJZWXNSVMXg6SFTYjWLpQ14H5V7ngw2Bh8xsmf+o
        uhShqORb2R6svQIbAOPWaj8=
X-Google-Smtp-Source: APXvYqx8SvCYZ2LYDAg1m8EFZxgHpWKZI6o7pxJx0ODYuMGcE3teWIjg6QlA5XdJOlaCxBd8Uf/htQ==
X-Received: by 2002:a2e:b0c9:: with SMTP id g9mr5181622ljl.134.1576749166952;
        Thu, 19 Dec 2019 01:52:46 -0800 (PST)
Received: from localhost.localdomain (dyt4gctb359myxd0pkwmt-4.rev.dnainternet.fi. [2001:14bb:430:5140:37cf:5409:8fcc:4495])
        by smtp.gmail.com with ESMTPSA id n11sm2595981ljg.15.2019.12.19.01.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 01:52:46 -0800 (PST)
Date:   Thu, 19 Dec 2019 11:52:39 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v7 08/12] regulator: bd718x7: Split driver to common and
 bd718x7 specific parts
Message-ID: <151b68f40a85ba8418efdba136c5925ffa7ee3e8.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Few ROHM PMICs allow setting the voltage states for different system states
like RUN, IDLE, SUSPEND and LPSR. States are then changed via SoC specific
mechanisms. bd718x7 driver implemented device-tree parsing functions for
these state specific voltages. The parsing functions can be re-used by
other ROHM chip drivers like bd71828. Split the generic functions from
bd718x7-regulator.c to rohm-regulator.c and export them for other modules
to use.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Mark Brown <broonie@kernel.org>
---

No changes since v6

 drivers/regulator/Kconfig             |   4 +
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/bd718x7-regulator.c | 183 ++++++++------------------
 drivers/regulator/rohm-regulator.c    |  95 +++++++++++++
 include/linux/mfd/rohm-generic.h      |  44 +++++++
 5 files changed, 199 insertions(+), 128 deletions(-)
 create mode 100644 drivers/regulator/rohm-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 74eb5af7295f..a4897ae52f14 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -197,6 +197,7 @@ config REGULATOR_BD70528
 config REGULATOR_BD718XX
 	tristate "ROHM BD71837 Power Regulator"
 	depends on MFD_ROHM_BD718XX
+	select REGULATOR_ROHM
 	help
 	  This driver supports voltage regulators on ROHM BD71837 PMIC.
 	  This will enable support for the software controllable buck
@@ -790,6 +791,9 @@ config REGULATOR_RN5T618
 	  Say y here to support the regulators found on Ricoh RN5T567,
 	  RN5T618 or RC5T619 PMIC.
 
+config REGULATOR_ROHM
+	tristate
+
 config REGULATOR_RT5033
 	tristate "Richtek RT5033 Regulators"
 	depends on MFD_RT5033
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 2210ba56f9bd..6bcab72c1fc7 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -99,6 +99,7 @@ obj-$(CONFIG_REGULATOR_PCF50633) += pcf50633-regulator.o
 obj-$(CONFIG_REGULATOR_RC5T583)  += rc5t583-regulator.o
 obj-$(CONFIG_REGULATOR_RK808)   += rk808-regulator.o
 obj-$(CONFIG_REGULATOR_RN5T618) += rn5t618-regulator.o
+obj-$(CONFIG_REGULATOR_ROHM)	+= rohm-regulator.o
 obj-$(CONFIG_REGULATOR_RT5033)	+= rt5033-regulator.o
 obj-$(CONFIG_REGULATOR_S2MPA01) += s2mpa01.o
 obj-$(CONFIG_REGULATOR_S2MPS11) += s2mps11.o
diff --git a/drivers/regulator/bd718x7-regulator.c b/drivers/regulator/bd718x7-regulator.c
index 6beaf867d9cb..55decb58c777 100644
--- a/drivers/regulator/bd718x7-regulator.c
+++ b/drivers/regulator/bd718x7-regulator.c
@@ -318,6 +318,7 @@ struct reg_init {
 };
 struct bd718xx_regulator_data {
 	struct regulator_desc desc;
+	const struct rohm_dvs_config dvs;
 	const struct reg_init init;
 	const struct reg_init *additional_inits;
 	int additional_init_amnt;
@@ -349,133 +350,15 @@ static const struct reg_init bd71837_ldo6_inits[] = {
 	},
 };
 
-#define NUM_DVS_BUCKS 4
-
-struct of_dvs_setting {
-	const char *prop;
-	unsigned int reg;
-};
-
-static int set_dvs_levels(const struct of_dvs_setting *dvs,
-			  struct device_node *np,
-			  const struct regulator_desc *desc,
-			  struct regmap *regmap)
-{
-	int ret, i;
-	unsigned int uv;
-
-	ret = of_property_read_u32(np, dvs->prop, &uv);
-	if (ret) {
-		if (ret != -EINVAL)
-			return ret;
-		return 0;
-	}
-
-	for (i = 0; i < desc->n_voltages; i++) {
-		ret = regulator_desc_list_voltage_linear_range(desc, i);
-		if (ret < 0)
-			continue;
-		if (ret == uv) {
-			i <<= ffs(desc->vsel_mask) - 1;
-			ret = regmap_update_bits(regmap, dvs->reg,
-						 DVS_BUCK_RUN_MASK, i);
-			break;
-		}
-	}
-	return ret;
-}
-
-static int buck4_set_hw_dvs_levels(struct device_node *np,
+static int buck_set_hw_dvs_levels(struct device_node *np,
 			    const struct regulator_desc *desc,
 			    struct regulator_config *cfg)
 {
-	int ret, i;
-	const struct of_dvs_setting dvs[] = {
-		{
-			.prop = "rohm,dvs-run-voltage",
-			.reg = BD71837_REG_BUCK4_VOLT_RUN,
-		},
-	};
+	struct bd718xx_regulator_data *data;
 
-	for (i = 0; i < ARRAY_SIZE(dvs); i++) {
-		ret = set_dvs_levels(&dvs[i], np, desc, cfg->regmap);
-		if (ret)
-			break;
-	}
-	return ret;
-}
-static int buck3_set_hw_dvs_levels(struct device_node *np,
-			    const struct regulator_desc *desc,
-			    struct regulator_config *cfg)
-{
-	int ret, i;
-	const struct of_dvs_setting dvs[] = {
-		{
-			.prop = "rohm,dvs-run-voltage",
-			.reg = BD71837_REG_BUCK3_VOLT_RUN,
-		},
-	};
+	data = container_of(desc, struct bd718xx_regulator_data, desc);
 
-	for (i = 0; i < ARRAY_SIZE(dvs); i++) {
-		ret = set_dvs_levels(&dvs[i], np, desc, cfg->regmap);
-		if (ret)
-			break;
-	}
-	return ret;
-}
-
-static int buck2_set_hw_dvs_levels(struct device_node *np,
-			    const struct regulator_desc *desc,
-			    struct regulator_config *cfg)
-{
-	int ret, i;
-	const struct of_dvs_setting dvs[] = {
-		{
-			.prop = "rohm,dvs-run-voltage",
-			.reg = BD718XX_REG_BUCK2_VOLT_RUN,
-		},
-		{
-			.prop = "rohm,dvs-idle-voltage",
-			.reg = BD718XX_REG_BUCK2_VOLT_IDLE,
-		},
-	};
-
-
-
-	for (i = 0; i < ARRAY_SIZE(dvs); i++) {
-		ret = set_dvs_levels(&dvs[i], np, desc, cfg->regmap);
-		if (ret)
-			break;
-	}
-	return ret;
-}
-
-static int buck1_set_hw_dvs_levels(struct device_node *np,
-			    const struct regulator_desc *desc,
-			    struct regulator_config *cfg)
-{
-	int ret, i;
-	const struct of_dvs_setting dvs[] = {
-		{
-			.prop = "rohm,dvs-run-voltage",
-			.reg = BD718XX_REG_BUCK1_VOLT_RUN,
-		},
-		{
-			.prop = "rohm,dvs-idle-voltage",
-			.reg = BD718XX_REG_BUCK1_VOLT_IDLE,
-		},
-		{
-			.prop = "rohm,dvs-suspend-voltage",
-			.reg = BD718XX_REG_BUCK1_VOLT_SUSP,
-		},
-	};
-
-	for (i = 0; i < ARRAY_SIZE(dvs); i++) {
-		ret = set_dvs_levels(&dvs[i], np, desc, cfg->regmap);
-		if (ret)
-			break;
-	}
-	return ret;
+	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
 }
 
 static const struct bd718xx_regulator_data bd71847_regulators[] = {
@@ -496,7 +379,17 @@ static const struct bd718xx_regulator_data bd71847_regulators[] = {
 			.enable_reg = BD718XX_REG_BUCK1_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
-			.of_parse_cb = buck1_set_hw_dvs_levels,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND,
+			.run_reg = BD718XX_REG_BUCK1_VOLT_RUN,
+			.run_mask = DVS_BUCK_RUN_MASK,
+			.idle_reg = BD718XX_REG_BUCK1_VOLT_IDLE,
+			.idle_mask = DVS_BUCK_RUN_MASK,
+			.suspend_reg = BD718XX_REG_BUCK1_VOLT_SUSP,
+			.suspend_mask = DVS_BUCK_RUN_MASK,
 		},
 		.init = {
 			.reg = BD718XX_REG_BUCK1_CTRL,
@@ -520,7 +413,14 @@ static const struct bd718xx_regulator_data bd71847_regulators[] = {
 			.enable_reg = BD718XX_REG_BUCK2_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
-			.of_parse_cb = buck2_set_hw_dvs_levels,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE,
+			.run_reg = BD718XX_REG_BUCK2_VOLT_RUN,
+			.run_mask = DVS_BUCK_RUN_MASK,
+			.idle_reg = BD718XX_REG_BUCK2_VOLT_IDLE,
+			.idle_mask = DVS_BUCK_RUN_MASK,
 		},
 		.init = {
 			.reg = BD718XX_REG_BUCK2_CTRL,
@@ -792,7 +692,17 @@ static const struct bd718xx_regulator_data bd71837_regulators[] = {
 			.enable_reg = BD718XX_REG_BUCK1_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
-			.of_parse_cb = buck1_set_hw_dvs_levels,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND,
+			.run_reg = BD718XX_REG_BUCK1_VOLT_RUN,
+			.run_mask = DVS_BUCK_RUN_MASK,
+			.idle_reg = BD718XX_REG_BUCK1_VOLT_IDLE,
+			.idle_mask = DVS_BUCK_RUN_MASK,
+			.suspend_reg = BD718XX_REG_BUCK1_VOLT_SUSP,
+			.suspend_mask = DVS_BUCK_RUN_MASK,
 		},
 		.init = {
 			.reg = BD718XX_REG_BUCK1_CTRL,
@@ -816,7 +726,14 @@ static const struct bd718xx_regulator_data bd71837_regulators[] = {
 			.enable_reg = BD718XX_REG_BUCK2_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
-			.of_parse_cb = buck2_set_hw_dvs_levels,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE,
+			.run_reg = BD718XX_REG_BUCK2_VOLT_RUN,
+			.run_mask = DVS_BUCK_RUN_MASK,
+			.idle_reg = BD718XX_REG_BUCK2_VOLT_IDLE,
+			.idle_mask = DVS_BUCK_RUN_MASK,
 		},
 		.init = {
 			.reg = BD718XX_REG_BUCK2_CTRL,
@@ -840,7 +757,12 @@ static const struct bd718xx_regulator_data bd71837_regulators[] = {
 			.enable_reg = BD71837_REG_BUCK3_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
-			.of_parse_cb = buck3_set_hw_dvs_levels,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			.level_map = ROHM_DVS_LEVEL_RUN,
+			.run_reg = BD71837_REG_BUCK3_VOLT_RUN,
+			.run_mask = DVS_BUCK_RUN_MASK,
 		},
 		.init = {
 			.reg = BD71837_REG_BUCK3_CTRL,
@@ -864,7 +786,12 @@ static const struct bd718xx_regulator_data bd71837_regulators[] = {
 			.enable_reg = BD71837_REG_BUCK4_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
-			.of_parse_cb = buck4_set_hw_dvs_levels,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			.level_map = ROHM_DVS_LEVEL_RUN,
+			.run_reg = BD71837_REG_BUCK4_VOLT_RUN,
+			.run_mask = DVS_BUCK_RUN_MASK,
 		},
 		.init = {
 			.reg = BD71837_REG_BUCK4_CTRL,
diff --git a/drivers/regulator/rohm-regulator.c b/drivers/regulator/rohm-regulator.c
new file mode 100644
index 000000000000..ca368ada53c6
--- /dev/null
+++ b/drivers/regulator/rohm-regulator.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2018 ROHM Semiconductors
+
+#include <linux/errno.h>
+#include <linux/mfd/rohm-generic.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+
+static int set_dvs_level(const struct regulator_desc *desc,
+			 struct device_node *np, struct regmap *regmap,
+			 char *prop, unsigned int reg, unsigned int mask,
+			 unsigned int omask, unsigned int oreg)
+{
+	int ret, i;
+	uint32_t uv;
+
+	ret = of_property_read_u32(np, prop, &uv);
+	if (ret) {
+		if (ret != -EINVAL)
+			return ret;
+		return 0;
+	}
+
+	if (uv == 0) {
+		if (omask)
+			return regmap_update_bits(regmap, oreg, omask, 0);
+	}
+	for (i = 0; i < desc->n_voltages; i++) {
+		ret = regulator_desc_list_voltage_linear_range(desc, i);
+		if (ret < 0)
+			continue;
+		if (ret == uv) {
+			i <<= ffs(desc->vsel_mask) - 1;
+			ret = regmap_update_bits(regmap, reg, mask, i);
+			if (omask && !ret)
+				ret = regmap_update_bits(regmap, oreg, omask,
+							 omask);
+			break;
+		}
+	}
+	return ret;
+}
+
+int rohm_regulator_set_dvs_levels(const struct rohm_dvs_config *dvs,
+			  struct device_node *np,
+			  const struct regulator_desc *desc,
+			  struct regmap *regmap)
+{
+	int i, ret = 0;
+	char *prop;
+	unsigned int reg, mask, omask, oreg = desc->enable_reg;
+
+	for (i = 0; i < ROHM_DVS_LEVEL_MAX && !ret; i++) {
+		if (dvs->level_map & (1 << i)) {
+			switch (i + 1) {
+			case ROHM_DVS_LEVEL_RUN:
+				prop = "rohm,dvs-run-voltage";
+				reg = dvs->run_reg;
+				mask = dvs->run_mask;
+				omask = dvs->run_on_mask;
+				break;
+			case ROHM_DVS_LEVEL_IDLE:
+				prop = "rohm,dvs-idle-voltage";
+				reg = dvs->idle_reg;
+				mask = dvs->idle_mask;
+				omask = dvs->idle_on_mask;
+				break;
+			case ROHM_DVS_LEVEL_SUSPEND:
+				prop = "rohm,dvs-suspend-voltage";
+				reg = dvs->suspend_reg;
+				mask = dvs->suspend_mask;
+				omask = dvs->suspend_on_mask;
+				break;
+			case ROHM_DVS_LEVEL_LPSR:
+				prop = "rohm,dvs-lpsr-voltage";
+				reg = dvs->lpsr_reg;
+				mask = dvs->lpsr_mask;
+				omask = dvs->lpsr_on_mask;
+				break;
+			default:
+				return -EINVAL;
+			}
+			ret = set_dvs_level(desc, np, regmap, prop, reg, mask,
+					    omask, oreg);
+		}
+	}
+	return ret;
+}
+EXPORT_SYMBOL(rohm_regulator_set_dvs_levels);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
+MODULE_DESCRIPTION("Generic helpers for ROHM PMIC regulator drivers");
diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
index ff3dd7578fd3..8037421cc6a1 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -4,6 +4,9 @@
 #ifndef __LINUX_MFD_ROHM_H__
 #define __LINUX_MFD_ROHM_H__
 
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+
 enum rohm_chip_type {
 	ROHM_CHIP_TYPE_BD71837 = 0,
 	ROHM_CHIP_TYPE_BD71847,
@@ -17,4 +20,45 @@ struct rohm_regmap_dev {
 	struct regmap *regmap;
 };
 
+enum {
+	ROHM_DVS_LEVEL_UNKNOWN,
+	ROHM_DVS_LEVEL_RUN,
+	ROHM_DVS_LEVEL_IDLE,
+	ROHM_DVS_LEVEL_SUSPEND,
+	ROHM_DVS_LEVEL_LPSR,
+#define ROHM_DVS_LEVEL_MAX ROHM_DVS_LEVEL_LPSR
+};
+
+struct rohm_dvs_config {
+	uint64_t level_map;
+	unsigned int run_reg;
+	unsigned int run_mask;
+	unsigned int run_on_mask;
+	unsigned int idle_reg;
+	unsigned int idle_mask;
+	unsigned int idle_on_mask;
+	unsigned int suspend_reg;
+	unsigned int suspend_mask;
+	unsigned int suspend_on_mask;
+	unsigned int lpsr_reg;
+	unsigned int lpsr_mask;
+	unsigned int lpsr_on_mask;
+};
+
+#if IS_ENABLED(CONFIG_REGULATOR_ROHM)
+int rohm_regulator_set_dvs_levels(const struct rohm_dvs_config *dvs,
+				  struct device_node *np,
+				  const struct regulator_desc *desc,
+				  struct regmap *regmap);
+
+#else
+static inline int rohm_regulator_set_dvs_levels(const struct rohm_dvs_config *dvs,
+						struct device_node *np,
+						const struct regulator_desc *desc,
+						struct regmap *regmap)
+{
+	return 0;
+}
+#endif //IS_ENABLED(CONFIG_REGULATOR_ROHM)
+
 #endif
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
