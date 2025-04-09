Return-Path: <linux-rtc+bounces-3865-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A21B0A83237
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5661B8A3176
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF85E216E05;
	Wed,  9 Apr 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ld05X2wV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4D6214225
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231060; cv=none; b=Gc88YG3++tsRj2YlNQO2/HYve0b5gosCEbKH+gB6yLV7m8kneVWLCpX+9sYdI0e+c7LqelKjma0t56ATcGoHiXBbafy7lerp7C40ORB1uQDBlxrTGLFR+qdjsQ46SHmTowyv8WUBgB0izmBF2Hzxib3fAJxhlq5BaRu7RKS20EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231060; c=relaxed/simple;
	bh=LbHBF4TKWm+hdTLnEofbBcbPOlVj2NdAt9E7/ghwK00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hum6UhzvdFPafL/Pf+xVeYn3MKbF6x68gyhGW/BSYINMr0aJsJIt85htfafaSMUW85m+7A39uMgJW7Vwi6SkVc2BL+1AghX6dV/nkjs6iDfcUvm9Pom2mRA3QRz/cGn7qkxqgN8BHf0ly6WH4a6GTgRDenAAcUohrr7cBCiRC8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ld05X2wV; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2963dc379so17790766b.2
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231054; x=1744835854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6ULFspg/CGx1bRJYjAsIrxdZCgjn7lM1Rjdh9Ft3ak=;
        b=ld05X2wV21FEsszR4Xo4jDv5m5f4eCeqRLPezGDOdiWsuhrpn/JUsbQIKsSPmxI0fD
         OEXlSJt0FNbuJoGVcf7nej6rQf53yCDYSHhXnwl1AXD5WzQnkE0Gxl+ig0VK9BLvNCxD
         82z0HE1Yzc13bSv2ul7Y8+ack8rXPUYVyg/MvjGw2VdDGDuhDkFSX534NsFysZ6V2q6s
         V2r+hAo/X5SydxfADjd61g8UEj8RCiZsDMxs4QKnLPHqA5W1AQhEii0L3yHVK/9YfvGy
         kJLbdkx5xcO9hBLzQJOuNmURRf0ahmb/gmYOQfzKwMatrRQmUFbVfZeE2dWmMeiDh7OU
         YUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231054; x=1744835854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6ULFspg/CGx1bRJYjAsIrxdZCgjn7lM1Rjdh9Ft3ak=;
        b=gOor3rLz1pbR0hkv0Lym35bE0oHSR+F0P2cuKNF7lCpETqMQXxAkw3qC2HltlJaK94
         3ecvLPtr8i5SBI5ny8BV7DuFYeWmhYcZh5ByfbprHvD1Yromaj/JIC5QzJxMzDqLt5BK
         6KIkDmMEAqPaQsvOIJDMW7psO5lO2oUlwle6vS5ervxJ2i3AYF/d3RiOH5zTd0XICSUD
         0NjzuD2tRpTRHoanmkFXM4NraSZgoQP6Kl29SdEckBd2Vy7YaQvU4zIjk8l55Iu2Zbc4
         GQZFrVPVDJR7+/1ECvrvtxJzsFaaSRuD+HbTUzC9vlO7S3paK2k7YqyjT97navygbgv2
         FzrA==
X-Forwarded-Encrypted: i=1; AJvYcCWfHnvUw5U8pu7hekcT3V63j5LM3MTWs1dcOZzQEVC7nRO0HtfnWsnmmV4n3b3PXGt9+GDYBCarKhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeVowwMSczyOdLveP78Mtiu7EvSHyNbxxYzeA/5PCrff8U+Cey
	0ZMxItfUSh9TUqaU9lBgCXAjIXLXiprvOxy6DeL4kIm9ZjIHYdVpoticB7lT5Rs=
X-Gm-Gg: ASbGncvgmvzpaVoV7BYXnNghpRM8E73YWxF+Ue5TnnjIFTl7fwqOPIR6VAc91zP3eLd
	AxPz9YKATXqP7Yti3lbh8+lLPUGsFV8VDaUSWRpEJHEaoKKrfppoBR7JaKkxOcOee5aTBrvPrP0
	5pARygJgiAI2iFnNRtIYpB5DAMAzfkM06dNBLJjdjH7kJz/VEfGt6OCu4iwNfWhOCQSwjkqUcNU
	UOMKw2348JtfammC+RmkU/moT6IF6+GZ2+lzKrq+5WOKul2HoEz2W+vW7/mr71t3aRXd6c/w+TT
	LUzvJlX69jlRrUiFYTI+xbgHhrzs3eJnuXB1+ZTxD5kIgusyFcvvdwdQCw1PQKdOLqDie3Th9Op
	/myju7nsiq8tKdpS/9ilaJeXditE=
X-Google-Smtp-Source: AGHT+IFgA//GqlMMtxP6zq80GkYMJkQOvivm+CoiEHZTZ3tD28P40x9A2ESKEVfJI0wc+SZlWIBudA==
X-Received: by 2002:a17:907:3f28:b0:ac7:ecfc:e5fa with SMTP id a640c23a62f3a-acabd4db30cmr8323166b.54.1744231053600;
        Wed, 09 Apr 2025 13:37:33 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:33 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:29 +0100
Subject: [PATCH v4 08/32] mfd: sec: Split into core and transport (i2c)
 drivers
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-8-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
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
2.49.0.604.gff1f9ca942-goog


