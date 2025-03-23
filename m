Return-Path: <linux-rtc+bounces-3578-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B57DFA6D1B4
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61D953AA620
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AC71E7C1E;
	Sun, 23 Mar 2025 22:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qnLa8lbZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25711DACA1
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769577; cv=none; b=WUBQR5oCRwUpjQHCNf5HeTVddR4yexU/0SuRkaGgcfR2rv2Oig/nw61OENmsc870cAZHbT4gnW1YzK/e1CpEBtLa8Z2C7cqdLPWbXWUvRC9BFANwncT2Oc7WIen4ItLqamkut3HD8L8DtJcXA0LaDqGi3x5UD9CnXv38iGyeVpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769577; c=relaxed/simple;
	bh=mppPZKJtm6NBtUUJnaZ3zV140OVOKVNhZcDnsSoPyI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fVBH7fUnyWRKL+rzHeAAniyuFlNNtY9GlwWo+CuXrnFpX14q/UehdExPOf2fzBKYsVxPPdBhXZPDntYmP4EB+z9Tst20tIAlZpHzKyOSIbIoZYi+Ac3VVNwZ+bwL5avYa6t61gUyKfUd1VGAqint+s5QVbdThsCLMCSIcSrAWrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qnLa8lbZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so490790366b.3
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769569; x=1743374369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dFsyupPhmKYZlG9iNTJYyZLnPSeEsntUTwAd5ZCRdnY=;
        b=qnLa8lbZ5aqRQWgyLqvx3Yh8KO9bJr9gaQAOU9c+Ia213ARsGwkS4tsw/FKMKIY0z4
         JsOUdvyHZrgnnLH4tWbCDxrOdBRiB7T0asS1vIcXUL+ZOKMQspMZnLf7htYygqRijlLn
         ZqxfrQJuVueufBp4wtLnNHEYXM3g3UEOhU81r+80J7KIGjnG8DBdk5NNjU21/ggx7E8M
         daFBtbT9q4aExIlVrPwUQmminbsbhdDn0zsIqWDxAKikB0KYLsc0QA7fU78/MLbr6zmo
         AXDhlk/ouzEgyw2AxT8yduVwPCSkh+O+eMiloHKGMXElfj6MeBXTroLn3+xcAQ0O6xC1
         uGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769569; x=1743374369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFsyupPhmKYZlG9iNTJYyZLnPSeEsntUTwAd5ZCRdnY=;
        b=ReqxTexHZC+qkj+567bQ4L0YCSC0CTAnxqyFBHO90BXaaxRDqJFzMuvS7/t9k2pkSM
         0B4VP/M3k+khWJOaoVIwXvUre2zj1gjmvzkIh+1Cqm/Rws1mjv2L9Wodql/bmxCJi91/
         faaPkHSR6fTGREH8Ry6ATazOi7NEZtQHCg2ZZY6Rlub8c5PPO5i2Wz+g2+jheLnctKO8
         AmK42LQEl7WMW8jo/JBlyzPKJRBAd6oGPpMuCVsehVkEzSS3Mpx2+oHCZvYdY25x9bb6
         nyM54TTi+kanxyyxYt+Kym2wRW7gOqkG9un/vKEm1UlxR8e+/Ta7/q9//e1lwsPMtM8E
         p1IA==
X-Forwarded-Encrypted: i=1; AJvYcCWpAZK6dpgZpn3IsChc3+t7pDki8XEqLrRQ9nvgVleXk8gNjDe8PKGBDoIf9bubJ9a5eytbALyl09k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZMZrHE+DW9L9jUZ7H1D7F8T7VIt0n4g+LMj+yZxbN1fagcyUo
	tmmaZtzsrC5EvWapRDGy+E+aMBtBaTS1CdJa5K9OKHy9gvJttQTJPF5Yu8ixvg4=
X-Gm-Gg: ASbGnctON7oF115QI/D3YIB21U8HzjIinYsfpj5Rqfr8J4v1TggL7Oj718VBFlKYQjc
	xsPzYXMJEqEngj9bCMrqIh9QGRV0tLOoSBxGQnEL4cFBsW7zykNYdcCybq4gnNREGI4isyb6JFu
	LIJx4RL+TI2tkVb44fyITvQjdZxQ8reI2RVEZaf+hgUiULjez3Yh10vTWa2RPYJ8U4hPU1kMS78
	YNFq4zASkGobmQExjz9mug0+NELQ4WluEZMYfUxVLOZLoom6iIBKFtyQchEDa0NbvptNBMVsV2f
	0UN84qVtluhhLh3BnqoxXukADkMz38kLAgGBDna2omUTitRfrrqdCD2g8daMaYbNcvUXaPnaIY9
	F4E/eMnC5THCnmUnGDB3YGDHCEXDi
X-Google-Smtp-Source: AGHT+IFKRMEiigkgpMescp9Pdge+rz06jxqEMtOIomAzaRLdoxKIqzx2eOJmKTb9eHlLOoRhHEw7/w==
X-Received: by 2002:a17:907:7f06:b0:ac4:4b5:2433 with SMTP id a640c23a62f3a-ac404b53f82mr827448666b.41.1742769569301;
        Sun, 23 Mar 2025 15:39:29 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:26 +0000
Subject: [PATCH 10/34] mfd: sec: split into core and transport (i2c)
 drivers
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-10-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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

Also add myself to MODULE_AUTHOR() and update file headers due to that
and all the follow-up rework.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

--
Note: checkpatch complains about missing help for MFD_SEC_I2C here, but
that's a false-positive due to patch context.
It also suggests to update MAINTAINERS, but the new file is covered
already due to using a wildcard.
---
 drivers/mfd/Kconfig    |  18 ++--
 drivers/mfd/Makefile   |   1 +
 drivers/mfd/sec-core.c | 268 +++++++------------------------------------------
 drivers/mfd/sec-core.h |  17 ++++
 drivers/mfd/sec-i2c.c  | 252 ++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 316 insertions(+), 240 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 205918c826334981587c4179bb00481c336ab8d5..9cce9a632827a38d6e4396167aa3b0391f273e97 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1316,21 +1316,25 @@ config MFD_RN5T618
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
index 320a431b4aa11e8d4d99740dfa16267a83cb417d..ca9efff5780a7c818ca6cfe017c0f897ca70b449 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -233,6 +233,7 @@ obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
 obj-$(CONFIG_MFD_RK8XX_SPI)	+= rk8xx-spi.o
 obj-$(CONFIG_MFD_RN5T618)	+= rn5t618.o
 obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
+obj-$(CONFIG_MFD_SEC_I2C)	+= sec-i2c.o
 obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
 obj-$(CONFIG_MFD_LM3533)	+= lm3533-core.o lm3533-ctrlbank.o
 obj-$(CONFIG_MFD_VEXPRESS_SYSREG)	+= vexpress-sysreg.o
diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 9c514f4b5f853ec2b4e234c578935ffad145cd4b..e81da34cf6795beca5f660fb46eefa4b5f8957d1 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -1,25 +1,22 @@
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
-#include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -88,144 +85,6 @@ static const struct mfd_cell s2mpu05_devs[] = {
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
@@ -258,87 +117,40 @@ static void sec_pmic_configure(struct sec_pmic_dev *sec_pmic)
 	}
 }
 
-/*
- * Only the common platform data elements for s5m8767 are parsed here from the
- * device tree. Other sub-modules of s5m8767 such as pmic, rtc , charger and
- * others have to parse their own platform data elements from device tree.
- */
-static void sec_pmic_i2c_parse_dt_pdata(struct device *dev,
-					struct sec_platform_data *pd)
+int sec_pmic_probe(struct device *dev, unsigned long device_type,
+		   unsigned int irq, struct regmap *regmap,
+		   const struct sec_pmic_probe_data *probedata,
+		   struct i2c_client *client)
 {
-	pd->manual_poweroff =
-		of_property_read_bool(dev->of_node,
-				      "samsung,s2mps11-acokb-ground");
-	pd->disable_wrstbi =
-		of_property_read_bool(dev->of_node,
-				      "samsung,s2mps11-wrstbi-ground");
-}
-
-static int sec_pmic_probe(struct i2c_client *i2c)
-{
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
+	sec_pmic->irq = irq;
+	sec_pmic->regmap_pmic = regmap;
+	sec_pmic->i2c = client;
 
 	/*
 	 * The s5m8767 platform data structure is instantiated here and the
 	 * drivers for the sub-modules need not instantiate another instance
 	 * while parsing their platform data.
 	 */
-	pdata = devm_kzalloc(sec_pmic->dev, sizeof(*pdata), GFP_KERNEL);
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
 
-	sec_pmic_i2c_parse_dt_pdata(sec_pmic->dev, pdata);
-
-	sec_pmic->device_type = (unsigned long)of_device_get_match_data(sec_pmic->dev);
 	sec_pmic->pdata = pdata;
-
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
+	if (probedata) {
+		pdata->manual_poweroff = probedata->manual_poweroff;
+		pdata->disable_wrstbi = probedata->disable_wrstbi;
 	}
 
 	sec_irq_init(sec_pmic);
@@ -383,9 +195,9 @@ static int sec_pmic_probe(struct i2c_client *i2c)
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
@@ -397,10 +209,11 @@ static int sec_pmic_probe(struct i2c_client *i2c)
 
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
@@ -424,11 +237,11 @@ static void sec_pmic_shutdown(struct i2c_client *i2c)
 
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
@@ -448,8 +261,7 @@ static int sec_pmic_suspend(struct device *dev)
 
 static int sec_pmic_resume(struct device *dev)
 {
-	struct i2c_client *i2c = to_i2c_client(dev);
-	struct sec_pmic_dev *sec_pmic = i2c_get_clientdata(i2c);
+	struct sec_pmic_dev *sec_pmic = dev_get_drvdata(dev);
 
 	if (device_may_wakeup(dev))
 		disable_irq_wake(sec_pmic->irq);
@@ -458,20 +270,10 @@ static int sec_pmic_resume(struct device *dev)
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
 
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
-MODULE_DESCRIPTION("Core support for the S5M MFD");
+MODULE_DESCRIPTION("Core driver for the Samsung S5M");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
index b3fded5f02a0ddc09a9508fd49a5d335f7ad0ee7..58e5b645f377cea5543a215c05957a2c49239a6f 100644
--- a/drivers/mfd/sec-core.h
+++ b/drivers/mfd/sec-core.h
@@ -10,6 +10,23 @@
 #ifndef __SEC_CORE_INT_H
 #define __SEC_CORE_INT_H
 
+struct i2c_client;
+
+extern const struct dev_pm_ops sec_pmic_pm_ops;
+
+struct sec_pmic_probe_data {
+	/* Whether or not manually set PWRHOLD to low during shutdown. */
+	bool manual_poweroff;
+	/* Disable the WRSTBI (buck voltage warm reset) when probing? */
+	bool disable_wrstbi;
+};
+
+int sec_pmic_probe(struct device *dev, unsigned long device_type,
+		   unsigned int irq, struct regmap *regmap,
+		   const struct sec_pmic_probe_data *probedata,
+		   struct i2c_client *client);
+void sec_pmic_shutdown(struct device *dev);
+
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
 
 #endif /* __SEC_CORE_INT_H */
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
new file mode 100644
index 0000000000000000000000000000000000000000..803a46e657a5a1a639014d442941c0cdc60556a5
--- /dev/null
+++ b/drivers/mfd/sec-i2c.c
@@ -0,0 +1,252 @@
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
+/*
+ * Only the common platform data elements for s5m8767 are parsed here from the
+ * device tree. Other sub-modules of s5m8767 such as pmic, rtc , charger and
+ * others have to parse their own platform data elements from device tree.
+ */
+static void
+sec_pmic_i2c_parse_dt_pdata(struct device *dev,
+			    struct sec_pmic_probe_data *pd)
+{
+	pd->manual_poweroff =
+		of_property_read_bool(dev->of_node,
+				      "samsung,s2mps11-acokb-ground");
+	pd->disable_wrstbi =
+		of_property_read_bool(dev->of_node,
+				      "samsung,s2mps11-wrstbi-ground");
+}
+
+static int sec_pmic_i2c_probe(struct i2c_client *client)
+{
+	struct sec_pmic_probe_data probedata;
+	const struct regmap_config *regmap;
+	unsigned long device_type;
+	struct regmap *regmap_pmic;
+	int ret;
+
+	sec_pmic_i2c_parse_dt_pdata(&client->dev, &probedata);
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
+			      regmap_pmic, &probedata, client);
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
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
+MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
+MODULE_DESCRIPTION("I2C driver for the Samsung S5M");
+MODULE_LICENSE("GPL");

-- 
2.49.0.395.g12beb8f557-goog


