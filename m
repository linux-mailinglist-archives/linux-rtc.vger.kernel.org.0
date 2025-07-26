Return-Path: <linux-rtc+bounces-4593-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D945B12A9F
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Jul 2025 15:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03DD54E700B
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Jul 2025 13:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9968924BD03;
	Sat, 26 Jul 2025 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0ROSdziR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1CC2494F5
	for <linux-rtc@vger.kernel.org>; Sat, 26 Jul 2025 13:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753535419; cv=none; b=HMMzbYAiQ1uMCWb/g0Tgf9f6eESh/aEBzFYe5d7Fl3jbnpD3LPQtd47e0/Z/14DAFcxCuCzQDSfb2SGtIhNoLv20rTbxMcjevLxDcGFRMwzNGrc+SpjK2BrK9XaeuH0Mg/6RMrnmfD18duMbsbdg7c7qp0lZzXJXLrXI0EwLBqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753535419; c=relaxed/simple;
	bh=WWe0qL6V5tKEk/+A8p3kqlVeR+nH2UxolAAnmCbJTYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnM1h0otToeZSJSXAx2fWiv3iE+NuC6uEPZmlXjxhxhCZFvIApK/A3hZV5hAqOirg3iFjYBEZGHHWEXmMdUwKF12T6x3j45if9V2XX1WiWFcKuOmQ6kvdPJovnLN1xwX/gc5H5wttmi5Y5dIniwktnYH8tDoyHo587hRmha51z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0ROSdziR; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-87c6dfca35bso136011039f.1
        for <linux-rtc@vger.kernel.org>; Sat, 26 Jul 2025 06:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535416; x=1754140216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWDAnLqXm2iHilxdbHntQ50x96Qw+sd/grNlV6D19Rs=;
        b=0ROSdziRP5jUPzOqJYedZAjrmYATDhnTrmQ2PkUGC+6SbxEanQqOBhyejeYgQLamUn
         xmS6GQ52IVlXrKVyTrSu0HPBMek1YpSZODni1NW7imt9DdBHorA2kqRB9kXxjyQlihBr
         cjByj8GItuBdYMW3V7Y4QFs5wsQ0655uO0jNqL9DrY2wub8EaP/dpGTKnM+JocbTJMQW
         PdPKvDzZFmE0AXDDYOZYjdlxjmkVpHK6VrXaJPtsWyzExxy3ds+GUW6gKnutbTjs+rvc
         X7xrmmeaJfk1Ttfvn5tegJo64WR+rjwG76Tojnt2wdQDuHudC+r+mMBrtA2dtZ+ARTmb
         KIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535416; x=1754140216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWDAnLqXm2iHilxdbHntQ50x96Qw+sd/grNlV6D19Rs=;
        b=rtgVeIF4mJsLWhd0XuCb+U6ZJMQ/F7X92mmxCTSA90OSiRx6/A8abqE6OiH2HVI5vC
         /1yT4RIP2R+PmBEJ6KFPZwMPa7eEKMAR2q6EyqePOLQdrk3ncES8iTY86PmpmLMICgXu
         NxO/FxYHICa1kDBv+RA3jHqqk9saupnJA3CPf59eNmhoaMiEiJgKI0zHSl+7JAth3VKO
         xbNiodFVVpoySS9LQ8eTOUxCrPyyuIjqcXVUQwAPTDshxoxyyjZ0iq/0s2iWO0dOKh42
         rraEbp2vqzsEznphetX+IcK6LZWKi1di4GkpUmwOJjPQxoLj0IzQCyKIRWN5NSo775ao
         ETnw==
X-Forwarded-Encrypted: i=1; AJvYcCUsmvkBOx443Vt4pTfScHpG0k/VM+MBnm0uU50GQm8XWhiyLs0+KcePQ+b1/JwihlUwRRnAn2oYYuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzpGE6qjcT2XmodyMq27kQ7hF4JWodPXeS1bvZr9kqeYREsSnl
	7t9B2xkbszh7oEVY9/mebKYgChTCC6AmZ8udtV+EM1+PCta7LxQLVkkVEpFhes5guUI=
X-Gm-Gg: ASbGncstAfwyzr9ngHvwN55jktGgsdSqm9owuxa7IEZV0rkHr/vCAGNm5KsRX2nsbaq
	Jn3xBTlpsnpJT5TgW+2lrScIuav4aKFZQ2EfKYKg2ig+79x4BPKyz/DDU09IAaDa/zQawV0En4n
	Kt3cCjFpHydb9qkeUYSAeTuXU2BSKM/umDXI4Famj9yQ6XJWm1lFAqGlNuJmOsJYng0vLyRYfxH
	iJn0G1ywqkvixZtXsrkaNasIH39QKUGgn+K1SZbSCb2T0cw9KbfFObp3YJ+uf7yadooCywFBcB0
	aN/HPhdWxoR6fuM7LQCOOoCMGJ32U7tSnKIv0QVEqHWXZPS1bKXwxtdgHdxWEqv7aZkqZ4e3EaS
	d0M6/mwf3bHEWQm0YZS++pZz8ivbteYQ8nObx9wxG6PotTIKnyTWqqoYYY1gymVwa1g==
X-Google-Smtp-Source: AGHT+IHt5uOOL7s9LWq7FTyLraGVQKqRq5m7R48mL6Vm8wp9Nx+wyJDwHfVD0iK0tpZwkTTlHy/FMw==
X-Received: by 2002:a05:6602:6308:b0:881:34a:c4f5 with SMTP id ca18e2360f4ac-881034ad105mr125908239f.4.1753535416455;
        Sat, 26 Jul 2025 06:10:16 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:16 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 4/8] regulator: spacemit: support SpacemiT P1 regulators
Date: Sat, 26 Jul 2025 08:09:58 -0500
Message-ID: <20250726131003.3137282-5-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250726131003.3137282-1-elder@riscstar.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the regulators found in the SpacemiT P1 PMIC.  This
PMIC provides 6 buck converters and 12 LDO regulators.

The PMIC is implemented as a multi-function device.  These regulators
are probed based on this driver being named in a MFD cell in the simple
MFD I2C driver.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/Kconfig       |  12 +++
 drivers/regulator/Makefile      |   1 +
 drivers/regulator/spacemit-p1.c | 157 ++++++++++++++++++++++++++++++++
 3 files changed, 170 insertions(+)
 create mode 100644 drivers/regulator/spacemit-p1.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index eaa6df1c9f806..7d5f79a468761 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1395,6 +1395,18 @@ config REGULATOR_SLG51000
 	  The SLG51000 is seven compact and customizable low dropout
 	  regulators.
 
+config REGULATOR_SPACEMIT_P1
+	tristate "SpacemiT P1 regulators"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	select MFD_SPACEMIT_P1
+	default ARCH_SPACEMIT
+	help
+	  Enable support for regulators implemented by the SpacemiT P1
+	  power controller.  The P1 implements 6 high-efficiency buck
+	  converters and 12 programmable LDO regulators.  To compile this
+	  driver as a module, choose M here.  The module will be called
+	  "spacemit-pmic".
+
 config REGULATOR_STM32_BOOSTER
 	tristate "STMicroelectronics STM32 BOOSTER"
 	depends on ARCH_STM32 || COMPILE_TEST
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index be98b29d6675d..278f5b8d1c7d7 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -162,6 +162,7 @@ obj-$(CONFIG_REGULATOR_S5M8767) += s5m8767.o
 obj-$(CONFIG_REGULATOR_SC2731) += sc2731-regulator.o
 obj-$(CONFIG_REGULATOR_SKY81452) += sky81452-regulator.o
 obj-$(CONFIG_REGULATOR_SLG51000) += slg51000-regulator.o
+obj-$(CONFIG_REGULATOR_SPACEMIT_P1) += spacemit-p1.o
 obj-$(CONFIG_REGULATOR_STM32_BOOSTER) += stm32-booster.o
 obj-$(CONFIG_REGULATOR_STM32_VREFBUF) += stm32-vrefbuf.o
 obj-$(CONFIG_REGULATOR_STM32_PWR) += stm32-pwr.o
diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
new file mode 100644
index 0000000000000..d437e6738ea1e
--- /dev/null
+++ b/drivers/regulator/spacemit-p1.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for regulators found in the SpacemiT P1 PMIC
+ *
+ * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
+ * Derived from code from SpacemiT.
+ *	Copyright (c) 2023, SPACEMIT Co., Ltd
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/linear_range.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+
+#define MOD_NAME	"spacemit-p1-regulator"
+
+enum p1_regulator_id {
+	P1_BUCK1,
+	P1_BUCK2,
+	P1_BUCK3,
+	P1_BUCK4,
+	P1_BUCK5,
+	P1_BUCK6,
+
+	P1_ALDO1,
+	P1_ALDO2,
+	P1_ALDO3,
+	P1_ALDO4,
+
+	P1_DLDO1,
+	P1_DLDO2,
+	P1_DLDO3,
+	P1_DLDO4,
+	P1_DLDO5,
+	P1_DLDO6,
+	P1_DLDO7,
+};
+
+static const struct regulator_ops p1_regulator_ops = {
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.set_voltage_time_sel   = regulator_set_voltage_time_sel,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+};
+
+/* Selector value 255 can be used to disable the buck converter on sleep */
+static const struct linear_range p1_buck_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000, 0, 170, 5000),
+	REGULATOR_LINEAR_RANGE(1375000, 171, 254, 25000),
+};
+
+/* Selector value 0 can be used for suspend */
+static const struct linear_range p1_ldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000, 11, 127, 25000),
+};
+
+/* These define the voltage selector field for buck and LDO regulators */
+#define BUCK_MASK		GENMASK(7, 0)
+#define LDO_MASK		GENMASK(6, 0)
+
+#define P1_ID(_TYPE, _n)	P1_ ## _TYPE ## _n
+#define P1_ENABLE_REG(_off, _n)	((_off) + 3 * ((_n) - 1))
+
+#define P1_REG_DESC(_TYPE, _type, _n, _s, _off, _mask, _nv, _ranges)	\
+	{								\
+		.name			= #_type #_n,			\
+		.supply_name		= _s,				\
+		.of_match		= of_match_ptr(#_type #_n),	\
+		.regulators_node	= of_match_ptr("regulators"),	\
+		.id			= P1_ID(_TYPE, _n),		\
+		.n_voltages		= _nv,				\
+		.ops			= &p1_regulator_ops,		\
+		.owner			= THIS_MODULE,			\
+		.linear_ranges		= _ranges,			\
+		.n_linear_ranges	= ARRAY_SIZE(_ranges),		\
+		.vsel_reg		= P1_ENABLE_REG(_off, _n) + 1,	\
+		.vsel_mask		= _mask,			\
+		.enable_reg		= P1_ENABLE_REG(_off, _n),	\
+		.enable_mask		= BIT(0),			\
+	}
+
+#define P1_BUCK_DESC(_n) \
+	P1_REG_DESC(BUCK, buck, _n, "vcc", 0x47, BUCK_MASK, 254, p1_buck_ranges)
+
+#define P1_ALDO_DESC(_n) \
+	P1_REG_DESC(ALDO, aldo, _n, "vcc", 0x5b, LDO_MASK, 117, p1_ldo_ranges)
+
+#define P1_DLDO_DESC(_n) \
+	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 117, p1_ldo_ranges)
+
+static const struct regulator_desc p1_regulator_desc[] = {
+	P1_BUCK_DESC(1),
+	P1_BUCK_DESC(2),
+	P1_BUCK_DESC(3),
+	P1_BUCK_DESC(4),
+	P1_BUCK_DESC(5),
+	P1_BUCK_DESC(6),
+
+	P1_ALDO_DESC(1),
+	P1_ALDO_DESC(2),
+	P1_ALDO_DESC(3),
+	P1_ALDO_DESC(4),
+
+	P1_DLDO_DESC(1),
+	P1_DLDO_DESC(2),
+	P1_DLDO_DESC(3),
+	P1_DLDO_DESC(4),
+	P1_DLDO_DESC(5),
+	P1_DLDO_DESC(6),
+	P1_DLDO_DESC(7),
+};
+
+static int p1_regulator_probe(struct platform_device *pdev)
+{
+	struct regulator_config config = { };
+	struct device *dev = &pdev->dev;
+	u32 i;
+
+	/*
+	 * The parent device (PMIC) owns the regmap.  Since we don't
+	 * provide one in the config structure, that one will be used.
+	 */
+	config.dev = dev->parent;
+
+	for (i = 0; i < ARRAY_SIZE(p1_regulator_desc); i++) {
+		const struct regulator_desc *desc = &p1_regulator_desc[i];
+		struct regulator_dev *rdev;
+
+		rdev = devm_regulator_register(dev, desc, &config);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "error registering regulator %s\n",
+					     desc->name);
+	}
+
+	return 0;
+}
+
+static struct platform_driver p1_regulator_driver = {
+	.probe = p1_regulator_probe,
+	.driver = {
+		.name = MOD_NAME,
+	},
+};
+
+module_platform_driver(p1_regulator_driver);
+
+MODULE_DESCRIPTION("SpacemiT P1 regulator driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" MOD_NAME);
-- 
2.48.1


