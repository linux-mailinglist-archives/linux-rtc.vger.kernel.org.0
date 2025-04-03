Return-Path: <linux-rtc+bounces-3734-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB86A79F0B
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 11:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3E6C1745DC
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 09:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DE224886B;
	Thu,  3 Apr 2025 08:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M4yOEDyc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922FB242916
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670751; cv=none; b=I71vS/ZH+musftIP+BfoOTxVe1Xmy6NvWLeVXK9yTw+mswzZJ1Q3wPjlILAn4xqEJR7wIzOLKtUcjX8NRl06zA8rFQlvRkiMCoEp57YRdGEZ3jCJRDUka+JsPKyWNLn4319eJg4nQt6L6FlSXXqR6IqVNDhnkvx0D+jtw40FwZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670751; c=relaxed/simple;
	bh=PI3U05hE1oIiZE6XppzEJEQtfSZFiinsebmK6V2enuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rX6kdbnbcSfyt+tENzkosQNEKHlzlNSy8kUQ7YkPIfyvXX3BYlD2SQ+tA3lc2qO2+125zMU/cHi86G3R0943znCgHkf19iMHx6vEtXOOopBTUBA5fE7D8rjzT7uug3Zx4k94/ggeXgfJpX9uPN53aDpTx0rYGdBMTT7ODSC3n3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M4yOEDyc; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so924223a12.1
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670745; x=1744275545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CKjAMiD1RE7RTGUiJe9q7KbEFxCPs59yWp4xXVklQ0=;
        b=M4yOEDycM01vNeBl4Q9ypbzKMyfJoIRbLsPRSofK6qDUo99dzp6l76Kk9ECLrWsDM3
         dEJMt9k6tP1Q74lqpQbxCgLiVJluZMfAV/QA2cpeU2ybK+82MWNoKuWyVDO/V607WGaB
         A8cJ7H2qpCjy6++IxmgTCbr881SZjEYMYHDaXLrGJaWbgPDQSF/A4C3ui9mytuikl6cg
         lqs3ZIwyoMW1qEJGL1fvTQOwNznz5vuhevy6wPHqrvIsN34nDe/ScmRo4Svw8pRHUaeo
         OG9FAuqXkqK9n83+z4zGmCoXAJ3iBdHhbcPcyRXGnbKfOhlFAhsBpdu8PF3aXUATEEwH
         HvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670745; x=1744275545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CKjAMiD1RE7RTGUiJe9q7KbEFxCPs59yWp4xXVklQ0=;
        b=to9p6TViCcnQLiJLJwBR1yvuEogytO1q5Pe2qO2kittN43V86vyBG0PYOVSIz90hq2
         b88TExwgvheeZu4xPECbff9SzamuGWvgnOhlJcaett0Lkjzg5Y6ddFp/rOEeRYLRdBBs
         5tosnYpl2ZwXfi4gCTdsudT+QMADQFwHTbOwrD5MqlMrDDgawLwEP5sTvVnclLtC3GR6
         44nssKYhe0YHMlK2x4A8skWeT6SEMS1U0H2dL1Lt9SxxbRENDMbSgMfnH4NCByQWe689
         QqdO6TSBS2kSfPZlXf6QIWz3+5A+WtvM2BfiYZdclOzQlnFm33dFsGBgmS2Yv1WoWVKp
         ZAlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG0w56H0W3h3e+Y5QrRoAAsbLClepTsGzSyUh/tqvYRDPuM8aecKhpMyVs9LjxpBRIiW1UPXIfevc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnW7qlgP5TO6fXZy8K7/juoi+Aqqbf2TVuzz/NBHCs1p9Lk4c/
	4wXOWdCuMe1/auLV1PbbkyIwYEDz11ajgalKpppkCN7j7K0sl0Ioz+7P1nIrKNQ=
X-Gm-Gg: ASbGncs1koBfYfRtxHwwbGkoViZmCDhO5DUT5MZ4xT7s7MiPngqjCxUqz+ALo5gs+SH
	r+6vzuaEuAO+gClmb9XY0Y/5YYRniTe6wKGt0GWUavjF6edQeTTd5sUhBweQj3HZ1t4IpZ2XTS+
	9d3drCkF9Kx3cEqlLEeorm31rzP7mFpGaL+JURicHtge5xaakFU6OwKbhj4E3JeCgi2S7Svz92C
	bcToY1AwcGpEqCapJv5zRh/HNd9Eg092oEA2w+MxYhbgN57rndJBIH7g/cUwrkQ9OI1Dcm7hxIr
	V1eOO9bJN5VRyu5EPepUsvej9ykF5+E1LjE5mjHUggltuNaAw4q5J71jUqPshbTe31WRAdU/suE
	cU8lJdkXQAbhb6tWKF/qNFg6YIlio
X-Google-Smtp-Source: AGHT+IGl6BQvkjkQUqwZ3Fr/WtdqH/2OUS2EIBSd7b2JjB+krYkcqp4Vj+iXyq5LNeNuws6JOh+r/w==
X-Received: by 2002:a05:6402:51c6:b0:5ec:c990:b578 with SMTP id 4fb4d7f45d1cf-5edfd15767bmr17482441a12.19.1743670744626;
        Thu, 03 Apr 2025 01:59:04 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:03 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:00 +0100
Subject: [PATCH v3 08/32] mfd: sec: split into core and transport (i2c)
 drivers
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-8-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

As a preparation for adding support for Samsung's S2MPG10, which is
connected via SPEEDY / ACPM rather than I2C, split out (move) all
I2C-specific driver code into its own kernel module, sec-i2c, and
make the existing sec-core module be just the transport-agnostic core
driver kernel module.

At the same time, update all defconfigs that reference the old kconfig
symbol name.

While at it, also update file header comments and module description(s)
to drop references to 'mfd', and update comments to be C-style, not
C++.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

--
Note: checkpatch complains about missing help for MFD_SEC_I2C here, but
that's a false-positive due to patch context.
It also suggests to update MAINTAINERS, but the new file is covered
already due to using a wildcard.

v2:
* split MODULE_AUTHOR update out of this patch (Krzysztof)
* keep DT parsing in core, not in transport driver
  (sec_pmic_i2c_parse_dt_pdata / sec_pmic_parse_dt_pdata)
* merge defconfig updates into this patch (Krzysztof)
---
 arch/arm/configs/exynos_defconfig   |   2 +-
 arch/arm/configs/multi_v7_defconfig |   2 +-
 arch/arm/configs/pxa_defconfig      |   2 +-
 arch/arm64/configs/defconfig        |   2 +-
 drivers/mfd/Kconfig                 |  18 ++-
 drivers/mfd/Makefile                |   1 +
 drivers/mfd/sec-core.c              | 247 +++++-------------------------------
 drivers/mfd/sec-core.h              |   9 ++
 drivers/mfd/sec-i2c.c               | 231 +++++++++++++++++++++++++++++++++
 9 files changed, 287 insertions(+), 227 deletions(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 7ad48fdda1dac69a4a9612eabb573729bed7b3a6..251f45be6c14af59263373f21b27b15f42ec7f61 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -167,7 +167,7 @@ CONFIG_MFD_MAX77686=y
 CONFIG_MFD_MAX77693=y
 CONFIG_MFD_MAX8997=y
 CONFIG_MFD_MAX8998=y
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_STMPE=y
 CONFIG_STMPE_I2C=y
 CONFIG_MFD_TPS65090=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ad037c175fdb0ec8601c9b3607aca0c0e5f3c145..7d06ac5369b1a2f325462f2cf5b54fe22061ca77 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -612,7 +612,7 @@ CONFIG_MFD_QCOM_RPM=y
 CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK8XX_I2C=y
 CONFIG_MFD_RN5T618=y
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_PALMAS=y
 CONFIG_MFD_TPS65090=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index de0ac8f521d7612704ce327e9ac16ab9e999f3d3..064e79baf20da809c9ab1f1fa18282aaba11a41f 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -335,7 +335,7 @@ CONFIG_MFD_MAX77693=y
 CONFIG_MFD_MAX8907=m
 CONFIG_EZX_PCAP=y
 CONFIG_UCB1400_CORE=m
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_PALMAS=y
 CONFIG_MFD_TPS65090=y
 CONFIG_MFD_TPS6586X=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a22116781169611482179b10798c14..f021fb29683be1a10720d7e6415daea771647879 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -769,7 +769,7 @@ CONFIG_MFD_MT6397=y
 CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK8XX_I2C=y
 CONFIG_MFD_RK8XX_SPI=y
-CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_SL28CPLD=y
 CONFIG_RZ_MTU3=y
 CONFIG_MFD_TI_AM335X_TSCADC=m
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 22b93631003943c393d9fe704748bc23f1905397..62565dc89ec6d58611bbc1f31c65f757343b6453 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1292,21 +1292,25 @@ config MFD_RN5T618
 	  functionality of the device.
 
 config MFD_SEC_CORE
-	tristate "Samsung Electronics PMIC Series Support"
+	tristate
+	select MFD_CORE
+	select REGMAP_IRQ
+
+config MFD_SEC_I2C
+	tristate "Samsung Electronics S2MPA/S2MPS1X/S2MPU/S5M series PMICs"
 	depends on I2C=y
 	depends on OF
-	select MFD_CORE
+	select MFD_SEC_CORE
 	select REGMAP_I2C
-	select REGMAP_IRQ
 	help
-	  Support for the Samsung Electronics PMIC devices coming
-	  usually along with Samsung Exynos SoC chipset.
+	  Support for the Samsung Electronics PMIC devices with I2C interface
+	  coming usually along with Samsung Exynos SoC chipset.
 	  This driver provides common support for accessing the device,
 	  additional drivers must be enabled in order to use the functionality
-	  of the device
+	  of the device.
 
 	  To compile this driver as a module, choose M here: the
-	  module will be called sec-core.
+	  module will be called sec-i2c.
 	  Have in mind that important core drivers (like regulators) depend
 	  on this driver so building this as a module might require proper
 	  initial ramdisk or might not boot up as well in certain scenarios.
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 948cbdf42a18b22a826f0b17fb8d5796a7ec8ba6..ab6c4b17a391946d4c88f52ccbfee5424b4fb2d2 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -229,6 +229,7 @@ obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
 obj-$(CONFIG_MFD_RK8XX_SPI)	+= rk8xx-spi.o
 obj-$(CONFIG_MFD_RN5T618)	+= rn5t618.o
 obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
+obj-$(CONFIG_MFD_SEC_I2C)	+= sec-i2c.o
 obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
 obj-$(CONFIG_MFD_LM3533)	+= lm3533-core.o lm3533-ctrlbank.o
 obj-$(CONFIG_MFD_VEXPRESS_SYSREG)	+= vexpress-sysreg.o
diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 83693686567df61b5e09f7129dc6b01d69156ff3..bb664e052bf5198f2fc83a86bd6e1e72364fb8df 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -1,23 +1,21 @@
 // SPDX-License-Identifier: GPL-2.0+
-//
-// Copyright (c) 2012 Samsung Electronics Co., Ltd
-//              http://www.samsung.com
+/*
+ * Copyright 2012 Samsung Electronics Co., Ltd
+ *                http://www.samsung.com
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Samsung SxM core driver
+ */
 
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/i2c.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
-#include <linux/mfd/samsung/s2mpa01.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
-#include <linux/mfd/samsung/s2mps14.h>
-#include <linux/mfd/samsung/s2mps15.h>
-#include <linux/mfd/samsung/s2mpu02.h>
-#include <linux/mfd/samsung/s5m8767.h>
-#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm.h>
@@ -88,144 +86,6 @@ static const struct mfd_cell s2mpu05_devs[] = {
 	{ .name = "s2mps15-rtc", },
 };
 
-static const struct of_device_id sec_dt_match[] = {
-	{
-		.compatible = "samsung,s5m8767-pmic",
-		.data = (void *)S5M8767X,
-	}, {
-		.compatible = "samsung,s2dos05",
-		.data = (void *)S2DOS05,
-	}, {
-		.compatible = "samsung,s2mps11-pmic",
-		.data = (void *)S2MPS11X,
-	}, {
-		.compatible = "samsung,s2mps13-pmic",
-		.data = (void *)S2MPS13X,
-	}, {
-		.compatible = "samsung,s2mps14-pmic",
-		.data = (void *)S2MPS14X,
-	}, {
-		.compatible = "samsung,s2mps15-pmic",
-		.data = (void *)S2MPS15X,
-	}, {
-		.compatible = "samsung,s2mpa01-pmic",
-		.data = (void *)S2MPA01,
-	}, {
-		.compatible = "samsung,s2mpu02-pmic",
-		.data = (void *)S2MPU02,
-	}, {
-		.compatible = "samsung,s2mpu05-pmic",
-		.data = (void *)S2MPU05,
-	}, {
-		/* Sentinel */
-	},
-};
-MODULE_DEVICE_TABLE(of, sec_dt_match);
-
-static bool s2mpa01_volatile(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case S2MPA01_REG_INT1M:
-	case S2MPA01_REG_INT2M:
-	case S2MPA01_REG_INT3M:
-		return false;
-	default:
-		return true;
-	}
-}
-
-static bool s2mps11_volatile(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case S2MPS11_REG_INT1M:
-	case S2MPS11_REG_INT2M:
-	case S2MPS11_REG_INT3M:
-		return false;
-	default:
-		return true;
-	}
-}
-
-static bool s2mpu02_volatile(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case S2MPU02_REG_INT1M:
-	case S2MPU02_REG_INT2M:
-	case S2MPU02_REG_INT3M:
-		return false;
-	default:
-		return true;
-	}
-}
-
-static const struct regmap_config sec_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-};
-
-static const struct regmap_config s2mpa01_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-
-	.max_register = S2MPA01_REG_LDO_OVCB4,
-	.volatile_reg = s2mpa01_volatile,
-	.cache_type = REGCACHE_FLAT,
-};
-
-static const struct regmap_config s2mps11_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-
-	.max_register = S2MPS11_REG_L38CTRL,
-	.volatile_reg = s2mps11_volatile,
-	.cache_type = REGCACHE_FLAT,
-};
-
-static const struct regmap_config s2mps13_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-
-	.max_register = S2MPS13_REG_LDODSCH5,
-	.volatile_reg = s2mps11_volatile,
-	.cache_type = REGCACHE_FLAT,
-};
-
-static const struct regmap_config s2mps14_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-
-	.max_register = S2MPS14_REG_LDODSCH3,
-	.volatile_reg = s2mps11_volatile,
-	.cache_type = REGCACHE_FLAT,
-};
-
-static const struct regmap_config s2mps15_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-
-	.max_register = S2MPS15_REG_LDODSCH4,
-	.volatile_reg = s2mps11_volatile,
-	.cache_type = REGCACHE_FLAT,
-};
-
-static const struct regmap_config s2mpu02_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-
-	.max_register = S2MPU02_REG_DVSDATA,
-	.volatile_reg = s2mpu02_volatile,
-	.cache_type = REGCACHE_FLAT,
-};
-
-static const struct regmap_config s5m8767_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-
-	.max_register = S5M8767_REG_LDO28CTRL,
-	.volatile_reg = s2mps11_volatile,
-	.cache_type = REGCACHE_FLAT,
-};
-
 static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)
 {
 	unsigned int val;
@@ -268,7 +128,7 @@ static void sec_pmic_configure(struct sec_pmic_dev *sec_pmic)
  * platform data.
  */
 static struct sec_platform_data *
-sec_pmic_i2c_parse_dt_pdata(struct device *dev)
+sec_pmic_parse_dt_pdata(struct device *dev)
 {
 	struct sec_platform_data *pd;
 
@@ -283,68 +143,34 @@ sec_pmic_i2c_parse_dt_pdata(struct device *dev)
 	return pd;
 }
 
-static int sec_pmic_probe(struct i2c_client *i2c)
+int sec_pmic_probe(struct device *dev, unsigned long device_type,
+		   unsigned int irq, struct regmap *regmap,
+		   struct i2c_client *client)
 {
-	const struct regmap_config *regmap;
 	struct sec_platform_data *pdata;
 	const struct mfd_cell *sec_devs;
 	struct sec_pmic_dev *sec_pmic;
 	int ret, num_sec_devs;
 
-	sec_pmic = devm_kzalloc(&i2c->dev, sizeof(struct sec_pmic_dev),
-				GFP_KERNEL);
+	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
 	if (sec_pmic == NULL)
 		return -ENOMEM;
 
-	i2c_set_clientdata(i2c, sec_pmic);
-	sec_pmic->dev = &i2c->dev;
-	sec_pmic->i2c = i2c;
-	sec_pmic->irq = i2c->irq;
+	dev_set_drvdata(dev, sec_pmic);
+	sec_pmic->dev = dev;
+	sec_pmic->device_type = device_type;
+	sec_pmic->i2c = client;
+	sec_pmic->irq = irq;
+	sec_pmic->regmap_pmic = regmap;
 
-	pdata = sec_pmic_i2c_parse_dt_pdata(sec_pmic->dev);
+	pdata = sec_pmic_parse_dt_pdata(sec_pmic->dev);
 	if (IS_ERR(pdata)) {
 		ret = PTR_ERR(pdata);
 		return ret;
 	}
 
-	sec_pmic->device_type = (unsigned long)of_device_get_match_data(sec_pmic->dev);
 	sec_pmic->pdata = pdata;
 
-	switch (sec_pmic->device_type) {
-	case S2MPA01:
-		regmap = &s2mpa01_regmap_config;
-		break;
-	case S2MPS11X:
-		regmap = &s2mps11_regmap_config;
-		break;
-	case S2MPS13X:
-		regmap = &s2mps13_regmap_config;
-		break;
-	case S2MPS14X:
-		regmap = &s2mps14_regmap_config;
-		break;
-	case S2MPS15X:
-		regmap = &s2mps15_regmap_config;
-		break;
-	case S5M8767X:
-		regmap = &s5m8767_regmap_config;
-		break;
-	case S2MPU02:
-		regmap = &s2mpu02_regmap_config;
-		break;
-	default:
-		regmap = &sec_regmap_config;
-		break;
-	}
-
-	sec_pmic->regmap_pmic = devm_regmap_init_i2c(i2c, regmap);
-	if (IS_ERR(sec_pmic->regmap_pmic)) {
-		ret = PTR_ERR(sec_pmic->regmap_pmic);
-		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
-			ret);
-		return ret;
-	}
-
 	sec_irq_init(sec_pmic);
 
 	pm_runtime_set_active(sec_pmic->dev);
@@ -387,9 +213,9 @@ static int sec_pmic_probe(struct i2c_client *i2c)
 		num_sec_devs = ARRAY_SIZE(s2mpu05_devs);
 		break;
 	default:
-		dev_err(&i2c->dev, "Unsupported device type (%lu)\n",
+		dev_err(sec_pmic->dev, "Unsupported device type %lu\n",
 			sec_pmic->device_type);
-		return -ENODEV;
+		return -EINVAL;
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
 				   NULL, 0, NULL);
@@ -401,10 +227,11 @@ static int sec_pmic_probe(struct i2c_client *i2c)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(sec_pmic_probe);
 
-static void sec_pmic_shutdown(struct i2c_client *i2c)
+void sec_pmic_shutdown(struct device *dev)
 {
-	struct sec_pmic_dev *sec_pmic = i2c_get_clientdata(i2c);
+	struct sec_pmic_dev *sec_pmic = dev_get_drvdata(dev);
 	unsigned int reg, mask;
 
 	if (!sec_pmic->pdata->manual_poweroff)
@@ -428,11 +255,11 @@ static void sec_pmic_shutdown(struct i2c_client *i2c)
 
 	regmap_update_bits(sec_pmic->regmap_pmic, reg, mask, 0);
 }
+EXPORT_SYMBOL_GPL(sec_pmic_shutdown);
 
 static int sec_pmic_suspend(struct device *dev)
 {
-	struct i2c_client *i2c = to_i2c_client(dev);
-	struct sec_pmic_dev *sec_pmic = i2c_get_clientdata(i2c);
+	struct sec_pmic_dev *sec_pmic = dev_get_drvdata(dev);
 
 	if (device_may_wakeup(dev))
 		enable_irq_wake(sec_pmic->irq);
@@ -452,8 +279,7 @@ static int sec_pmic_suspend(struct device *dev)
 
 static int sec_pmic_resume(struct device *dev)
 {
-	struct i2c_client *i2c = to_i2c_client(dev);
-	struct sec_pmic_dev *sec_pmic = i2c_get_clientdata(i2c);
+	struct sec_pmic_dev *sec_pmic = dev_get_drvdata(dev);
 
 	if (device_may_wakeup(dev))
 		disable_irq_wake(sec_pmic->irq);
@@ -462,20 +288,9 @@ static int sec_pmic_resume(struct device *dev)
 	return 0;
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops,
-				sec_pmic_suspend, sec_pmic_resume);
-
-static struct i2c_driver sec_pmic_driver = {
-	.driver = {
-		   .name = "sec_pmic",
-		   .pm = pm_sleep_ptr(&sec_pmic_pm_ops),
-		   .of_match_table = sec_dt_match,
-	},
-	.probe = sec_pmic_probe,
-	.shutdown = sec_pmic_shutdown,
-};
-module_i2c_driver(sec_pmic_driver);
+DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
+EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
-MODULE_DESCRIPTION("Core support for the S5M MFD");
+MODULE_DESCRIPTION("Core driver for the Samsung S5M");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
index b3fded5f02a0ddc09a9508fd49a5d335f7ad0ee7..a0a3488924d96f69373e7569079cfefd0544ca26 100644
--- a/drivers/mfd/sec-core.h
+++ b/drivers/mfd/sec-core.h
@@ -10,6 +10,15 @@
 #ifndef __SEC_CORE_INT_H
 #define __SEC_CORE_INT_H
 
+struct i2c_client;
+
+extern const struct dev_pm_ops sec_pmic_pm_ops;
+
+int sec_pmic_probe(struct device *dev, unsigned long device_type,
+		   unsigned int irq, struct regmap *regmap,
+		   struct i2c_client *client);
+void sec_pmic_shutdown(struct device *dev);
+
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
 
 #endif /* __SEC_CORE_INT_H */
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
new file mode 100644
index 0000000000000000000000000000000000000000..8e3a365ff3e5533e27d94fa8a15dbfa639518a5f
--- /dev/null
+++ b/drivers/mfd/sec-i2c.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2012 Samsung Electronics Co., Ltd
+ *                http://www.samsung.com
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Samsung SxM I2C driver
+ */
+
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/mfd/samsung/core.h>
+#include <linux/mfd/samsung/s2mpa01.h>
+#include <linux/mfd/samsung/s2mps11.h>
+#include <linux/mfd/samsung/s2mps13.h>
+#include <linux/mfd/samsung/s2mps14.h>
+#include <linux/mfd/samsung/s2mps15.h>
+#include <linux/mfd/samsung/s2mpu02.h>
+#include <linux/mfd/samsung/s5m8767.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm.h>
+#include <linux/regmap.h>
+#include "sec-core.h"
+
+static bool s2mpa01_volatile(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case S2MPA01_REG_INT1M:
+	case S2MPA01_REG_INT2M:
+	case S2MPA01_REG_INT3M:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static bool s2mps11_volatile(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case S2MPS11_REG_INT1M:
+	case S2MPS11_REG_INT2M:
+	case S2MPS11_REG_INT3M:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static bool s2mpu02_volatile(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case S2MPU02_REG_INT1M:
+	case S2MPU02_REG_INT2M:
+	case S2MPU02_REG_INT3M:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static const struct regmap_config sec_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static const struct regmap_config s2mpa01_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = S2MPA01_REG_LDO_OVCB4,
+	.volatile_reg = s2mpa01_volatile,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static const struct regmap_config s2mps11_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = S2MPS11_REG_L38CTRL,
+	.volatile_reg = s2mps11_volatile,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static const struct regmap_config s2mps13_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = S2MPS13_REG_LDODSCH5,
+	.volatile_reg = s2mps11_volatile,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static const struct regmap_config s2mps14_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = S2MPS14_REG_LDODSCH3,
+	.volatile_reg = s2mps11_volatile,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static const struct regmap_config s2mps15_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = S2MPS15_REG_LDODSCH4,
+	.volatile_reg = s2mps11_volatile,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static const struct regmap_config s2mpu02_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = S2MPU02_REG_DVSDATA,
+	.volatile_reg = s2mpu02_volatile,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static const struct regmap_config s5m8767_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = S5M8767_REG_LDO28CTRL,
+	.volatile_reg = s2mps11_volatile,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static int sec_pmic_i2c_probe(struct i2c_client *client)
+{
+	const struct regmap_config *regmap;
+	unsigned long device_type;
+	struct regmap *regmap_pmic;
+	int ret;
+
+	device_type = (unsigned long)of_device_get_match_data(&client->dev);
+
+	switch (device_type) {
+	case S2MPA01:
+		regmap = &s2mpa01_regmap_config;
+		break;
+	case S2MPS11X:
+		regmap = &s2mps11_regmap_config;
+		break;
+	case S2MPS13X:
+		regmap = &s2mps13_regmap_config;
+		break;
+	case S2MPS14X:
+		regmap = &s2mps14_regmap_config;
+		break;
+	case S2MPS15X:
+		regmap = &s2mps15_regmap_config;
+		break;
+	case S5M8767X:
+		regmap = &s5m8767_regmap_config;
+		break;
+	case S2MPU02:
+		regmap = &s2mpu02_regmap_config;
+		break;
+	default:
+		regmap = &sec_regmap_config;
+		break;
+	}
+
+	regmap_pmic = devm_regmap_init_i2c(client, regmap);
+	if (IS_ERR(regmap_pmic)) {
+		ret = PTR_ERR(regmap_pmic);
+		dev_err(&client->dev, "Failed to allocate register map: %d\n",
+			ret);
+		return ret;
+	}
+
+	return sec_pmic_probe(&client->dev, device_type, client->irq,
+			      regmap_pmic, client);
+}
+
+static void sec_pmic_i2c_shutdown(struct i2c_client *i2c)
+{
+	sec_pmic_shutdown(&i2c->dev);
+}
+
+static const struct of_device_id sec_pmic_i2c_of_match[] = {
+	{
+		.compatible = "samsung,s5m8767-pmic",
+		.data = (void *)S5M8767X,
+	}, {
+		.compatible = "samsung,s2dos05",
+		.data = (void *)S2DOS05,
+	}, {
+		.compatible = "samsung,s2mps11-pmic",
+		.data = (void *)S2MPS11X,
+	}, {
+		.compatible = "samsung,s2mps13-pmic",
+		.data = (void *)S2MPS13X,
+	}, {
+		.compatible = "samsung,s2mps14-pmic",
+		.data = (void *)S2MPS14X,
+	}, {
+		.compatible = "samsung,s2mps15-pmic",
+		.data = (void *)S2MPS15X,
+	}, {
+		.compatible = "samsung,s2mpa01-pmic",
+		.data = (void *)S2MPA01,
+	}, {
+		.compatible = "samsung,s2mpu02-pmic",
+		.data = (void *)S2MPU02,
+	}, {
+		.compatible = "samsung,s2mpu05-pmic",
+		.data = (void *)S2MPU05,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sec_pmic_i2c_of_match);
+
+static struct i2c_driver sec_pmic_i2c_driver = {
+	.driver = {
+		.name = "sec-pmic-i2c",
+		.pm = pm_sleep_ptr(&sec_pmic_pm_ops),
+		.of_match_table = sec_pmic_i2c_of_match,
+	},
+	.probe = sec_pmic_i2c_probe,
+	.shutdown = sec_pmic_i2c_shutdown,
+};
+module_i2c_driver(sec_pmic_i2c_driver);
+
+MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
+MODULE_DESCRIPTION("I2C driver for the Samsung S5M");
+MODULE_LICENSE("GPL");

-- 
2.49.0.472.ge94155a9ec-goog


