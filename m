Return-Path: <linux-rtc+bounces-4890-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21478B568D8
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 14:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 361973BE7A7
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 12:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED7F275AFD;
	Sun, 14 Sep 2025 12:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9jvENiU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902BB274671
	for <linux-rtc@vger.kernel.org>; Sun, 14 Sep 2025 12:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757853770; cv=none; b=cUe5vRQ4kaGtuS3gWcJTuRlOfZsSpELevioT3RNQLU28q1SJTdp0DTPgCgj9WZamixafzl2Cc6aqf/yN1am3L49KoM25cPSTaeDOIQ2UCw2DIgFdPo/LbUvoj+e5kAYIPKeqRpA5AMdOoh6cxJYEVTbcuouKOOOo2XLnHkRcGC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757853770; c=relaxed/simple;
	bh=z9kDI07Wpmm78QQXXWrYdY4Mhw7hD9DVSF7dxe4fhs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bv1qQCVzJssphLKii1BbOhG3jBnEgX3FHrkwAtcWOCwD8yd3wZv3wBjnCQ7bLtc74reTJjnxkf8ZTTmwx4V3wT6xkYWCcPe1TV2bm+CmmeVgjYa/aVtw/FjLRdTS3Bf1B7KI9TBYhXwJm86QRcNCebneA3vvq3hUWYOipkUZktQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9jvENiU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45f2a69d876so2968105e9.0
        for <linux-rtc@vger.kernel.org>; Sun, 14 Sep 2025 05:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757853767; x=1758458567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NzjVjcE/iDN8N+s4aQ4GgYpTz60HWxWgUIghlOd1Cw=;
        b=K9jvENiUZznEQQ2zl8z42koo8py8wVLvKCAqOahP6RtvIdy1MPjfpev66uG4dB4X6e
         sXchn9ii1PmdLd9Br0asn3KPrqr4+Q8Iu5xXTJHWM3dhNRxaKxRwP8xlCgQTLBRHLB2p
         2k5VsNc8DlHxIhlOsQfP7E0/a2zkGAFmvCvMKkigqH/j8hvuhQDeWAkhzRlAzTj1Lulw
         AqWfISBVBoJlPXZHgVvqog+kYzCGfiq/7+rYTMxAR3UhOCYSobY0SCYvLJu8Vn21tTkF
         8RIeL8mU0qBwPGUIbyGE9nD1UsXzDbqt2rMRD/cHC0R07UJmf9FUjgD2b75baDW0YD0T
         meqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757853767; x=1758458567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NzjVjcE/iDN8N+s4aQ4GgYpTz60HWxWgUIghlOd1Cw=;
        b=ZhxwAzoHGJxqSPFRMozZa+nE8repP7ukvDtNNbxB7Y8OQUQGVO+h/XHQsk4QzU0FxH
         lvzQJ5B/YM0zKrRcmCNNveHtII6HNGzFJEGz/Iuri09vJvJi6Vy2nt4OUAG4P4GApzBw
         +5pbXMGtxEzYlbrEPMnPGhnKPPfhExqhfBy/L9pGqvxbe8mW/hUUtjybUKLjdI+A/Uxw
         mlRI5jPcjbUvLA2cF/nWUAmZb3vkOUovreWXtXUSCxWvQ9A1TEnAkVrmhNZrdQwHjmE2
         NFRccrS2wi4mk7SgyDvfHDu0ffgfc6a4DFxhDkd0vQefcIt+7DKPKFKUg2UjLi5Vmz5D
         HGhw==
X-Forwarded-Encrypted: i=1; AJvYcCWyE4XvJkLeWuNTkyouZzucMxi5gvM4UlZ3F77x8WpEnc/A7Xxl6vfR2NpH9ddyor6Q+z0+gunzqzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyytSrY7ry495qFJzk81rvLF1dZAkWn1bpX3OVSGAsH7VL8PMvh
	BiyZYEG2Nfg6vxlflKh/u8S/5d37cedCyJ3q+vny3y9BVaeg+c21nC8K
X-Gm-Gg: ASbGncsev2OpE2c/i2ZkW/FUp7CV7aWUJxOeWPBC7dqM7b/+UlX0Ql44vNZbWLJcWBG
	9h8Tr2upb78Whv6LFdnfPNgjlzgsynVgTPfOW0QrTCZ3OliGH6Jv1udWCQh+ON5YruAWC80GC90
	rl4gxsuZ4hJOiVQavUIoYALgZCPp1zlAvbh7iIGhl+2T1sQ1EBKhPXsuBIroyw7UNTZSAEcvgIu
	EAgsz6i7l5zUb1n36uZCMgd1XsmeXqKVpK0bVqKn05y7/bGs1TGdXf7gghu36D6+u8vT39bK0wY
	UNe6V9RpZku+koLxz87F85dOtaojzj0t95L/JbDpIAzD45DWkgQkA26dxT4g/Y/laVTBhyHQR5/
	yQc9xOgB5nvBIfx8kiw0FDEaL/kP83YYqOe4aInuP4kkYfC9zGKKYgKPwckEGbkKWjc3bCNf8An
	+P1V08q3ManrEMjKskPgY=
X-Google-Smtp-Source: AGHT+IF52cVcLt/Of4hqhHb8/XivoKbvphnH9NSc4wXU+Eh0bTuKYlp5oRDfnSzGvHYzjro9HUgg/g==
X-Received: by 2002:a5d:5d81:0:b0:3ea:3b7b:80a8 with SMTP id ffacd0b85a97d-3ea3b7b86e1mr1126408f8f.52.1757853766693;
        Sun, 14 Sep 2025 05:42:46 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9511abbccsm3727773f8f.9.2025.09.14.05.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:42:46 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/7] regulator: s2mps11: add support for S2MPS16 regulators
Date: Sun, 14 Sep 2025 15:42:27 +0300
Message-ID: <20250914124227.2619925-8-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

S2MPS16 is a PMIC, manufactured by Samsung, particularly used in
exynos8890 based devices, featuring 38 LDOs, of which 11 are used for
CP, and 11 BUCKs, of which 1 is used for CP. Add driver support for
controlling all BUCKs and LDOs, except the ones used for CP, as they are
not documented enough and the vendor kernel doesn't handle them anyways.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/regulator/Kconfig   |   4 +-
 drivers/regulator/s2mps11.c | 147 ++++++++++++++++++++++++++++++++++++
 2 files changed, 149 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index eaa6df1c9..41b56b647 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1352,10 +1352,10 @@ config REGULATOR_S2MPA01
 	 via I2C bus. S2MPA01 has 10 Bucks and 26 LDO outputs.
 
 config REGULATOR_S2MPS11
-	tristate "Samsung S2MPS11/13/14/15/S2MPU02/05 voltage regulator"
+	tristate "Samsung S2MPS11/13/14/15/16/S2MPU02/05 voltage regulator"
 	depends on MFD_SEC_CORE || COMPILE_TEST
 	help
-	 This driver supports a Samsung S2MPS11/13/14/15/S2MPU02/05 voltage
+	 This driver supports a Samsung S2MPS11/13/14/15/16/S2MPU02/05 voltage
 	 output regulator via I2C bus. The chip is comprised of high efficient
 	 Buck converters including Dual-Phase Buck converter, Buck-Boost
 	 converter, various LDOs.
diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 04ae9c615..f736b6ee9 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -20,6 +20,7 @@
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
 #include <linux/mfd/samsung/s2mps15.h>
+#include <linux/mfd/samsung/s2mps16.h>
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s2mpu05.h>
 
@@ -828,6 +829,146 @@ static const struct regulator_desc s2mps15_regulators[] = {
 	regulator_desc_s2mps15_buck(10, s2mps15_buck_voltage_ranges2),
 };
 
+static int s2mps16_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
+{
+	unsigned int ramp_val, ramp_shift, ramp_reg;
+	int rdev_id = rdev_get_id(rdev);
+
+	switch (rdev_id) {
+	case S2MPS16_BUCK2:
+	case S2MPS16_BUCK4:
+	case S2MPS16_BUCK5:
+		ramp_shift = S2MPS16_BUCK_RAMP_SHIFT1;
+		break;
+	case S2MPS16_BUCK1:
+	case S2MPS16_BUCK3:
+	case S2MPS16_BUCK6:
+		ramp_shift = S2MPS16_BUCK_RAMP_SHIFT2;
+		break;
+	case S2MPS16_BUCK7:
+	case S2MPS16_BUCK11:
+		ramp_shift = S2MPS16_BUCK_RAMP_SHIFT3;
+		break;
+	case S2MPS16_BUCK8:
+	case S2MPS16_BUCK9:
+		ramp_shift = S2MPS16_BUCK_RAMP_SHIFT4;
+		break;
+	default:
+		return 0;
+	}
+	ramp_reg = S2MPS16_REG_BUCK_RAMP;
+	ramp_val = get_ramp_delay(ramp_delay);
+
+	return regmap_update_bits(rdev->regmap, ramp_reg,
+				  S2MPS16_BUCK_RAMP_MASK << ramp_shift,
+				  ramp_val << ramp_shift);
+}
+
+static const struct regulator_ops s2mps16_ldo_ops = {
+	.list_voltage		= regulator_list_voltage_linear,
+	.map_voltage		= regulator_map_voltage_linear,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+};
+
+static const struct regulator_ops s2mps16_buck_ops = {
+	.list_voltage		= regulator_list_voltage_linear,
+	.map_voltage		= regulator_map_voltage_linear,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+	.set_ramp_delay		= s2mps16_set_ramp_delay,
+};
+
+#define regulator_desc_s2mps16_ldo(num, min, step) {		\
+	.name		= "ldo"#num,				\
+	.id		= S2MPS16_LDO##num,			\
+	.ops		= &s2mps16_ldo_ops,			\
+	.type		= REGULATOR_VOLTAGE,			\
+	.owner		= THIS_MODULE,				\
+	.min_uV		= S2MPS16_LDO_##min,			\
+	.uV_step	= S2MPS16_LDO_##step,			\
+	.n_voltages	= S2MPS16_LDO_N_VOLTAGES,		\
+	.vsel_reg	= S2MPS16_REG_L##num##CTRL,		\
+	.vsel_mask	= S2MPS16_LDO_VSEL_MASK,		\
+	.enable_reg	= S2MPS16_REG_L##num##CTRL,		\
+	.enable_mask	= S2MPS16_ENABLE_MASK,			\
+	.enable_time	= S2MPS16_ENABLE_TIME_LDO		\
+}
+
+#define regulator_desc_s2mps16_buck(num, min, step, vsel, enable) {	\
+	.name		= "buck"#num,					\
+	.id		= S2MPS16_BUCK##num,				\
+	.ops		= &s2mps16_buck_ops,				\
+	.type		= REGULATOR_VOLTAGE,				\
+	.owner		= THIS_MODULE,					\
+	.min_uV		= S2MPS16_BUCK_##min,				\
+	.uV_step	= S2MPS16_BUCK_##step,				\
+	.n_voltages	= S2MPS16_BUCK_N_VOLTAGES,			\
+	.vsel_reg	= S2MPS16_REG_B##num##vsel,			\
+	.vsel_mask	= S2MPS16_BUCK_VSEL_MASK,			\
+	.enable_reg	= S2MPS16_REG_B##num##enable,			\
+	.enable_mask	= S2MPS16_ENABLE_MASK,				\
+	.enable_time	= S2MPS16_ENABLE_TIME_BUCK##num			\
+}
+
+#define regulator_desc_s2mps16_buck1(num) \
+	regulator_desc_s2mps16_buck(num, MIN1, STEP1, CTRL2, CTRL1)
+
+#define regulator_desc_s2mps16_buck2(num) \
+	regulator_desc_s2mps16_buck(num, MIN1, STEP1, CTRL3, CTRL1)
+
+#define regulator_desc_s2mps16_buck3(num) \
+	regulator_desc_s2mps16_buck(num, MIN2, STEP2, CTRL2, CTRL1)
+
+static const struct regulator_desc s2mps16_regulators[] = {
+	regulator_desc_s2mps16_ldo(1, MIN2, STEP1),
+	regulator_desc_s2mps16_ldo(2, MIN4, STEP2),
+	regulator_desc_s2mps16_ldo(3, MIN3, STEP2),
+	regulator_desc_s2mps16_ldo(4, MIN3, STEP1),
+	regulator_desc_s2mps16_ldo(5, MIN3, STEP2),
+	regulator_desc_s2mps16_ldo(6, MIN4, STEP2),
+	regulator_desc_s2mps16_ldo(7, MIN1, STEP2),
+	regulator_desc_s2mps16_ldo(8, MIN1, STEP2),
+	regulator_desc_s2mps16_ldo(9, MIN1, STEP2),
+	regulator_desc_s2mps16_ldo(10, MIN1, STEP2),
+	regulator_desc_s2mps16_ldo(11, MIN1, STEP2),
+	regulator_desc_s2mps16_ldo(12, MIN3, STEP1),
+	regulator_desc_s2mps16_ldo(13, MIN3, STEP1),
+	/* LDOs 14-24 are used for CP. They aren't documented */
+	regulator_desc_s2mps16_ldo(25, MIN3, STEP1),
+	regulator_desc_s2mps16_ldo(26, MIN3, STEP1),
+	regulator_desc_s2mps16_ldo(27, MIN3, STEP1),
+	regulator_desc_s2mps16_ldo(28, MIN4, STEP2),
+	regulator_desc_s2mps16_ldo(29, MIN4, STEP2),
+	regulator_desc_s2mps16_ldo(30, MIN3, STEP2),
+	regulator_desc_s2mps16_ldo(31, MIN3, STEP1),
+	regulator_desc_s2mps16_ldo(32, MIN3, STEP2),
+	regulator_desc_s2mps16_ldo(33, MIN4, STEP2),
+	regulator_desc_s2mps16_ldo(34, MIN4, STEP2),
+	regulator_desc_s2mps16_ldo(35, MIN4, STEP2),
+	regulator_desc_s2mps16_ldo(36, MIN4, STEP2),
+	regulator_desc_s2mps16_ldo(37, MIN3, STEP2),
+	regulator_desc_s2mps16_ldo(38, MIN3, STEP1),
+	regulator_desc_s2mps16_buck1(1),
+	regulator_desc_s2mps16_buck1(2),
+	regulator_desc_s2mps16_buck1(3),
+	regulator_desc_s2mps16_buck1(4),
+	regulator_desc_s2mps16_buck1(5),
+	regulator_desc_s2mps16_buck2(6),
+	regulator_desc_s2mps16_buck1(7),
+	regulator_desc_s2mps16_buck3(8),
+	regulator_desc_s2mps16_buck3(9),
+	/* BUCK 10 is used for CP. It's not documented */
+	regulator_desc_s2mps16_buck1(11),
+};
+
 static int s2mps14_pmic_enable_ext_control(struct s2mps11_info *s2mps11,
 		struct regulator_dev *rdev)
 {
@@ -1238,6 +1379,11 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 		regulators = s2mps15_regulators;
 		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps15_regulators));
 		break;
+	case S2MPS16X:
+		rdev_num = ARRAY_SIZE(s2mps16_regulators);
+		regulators = s2mps16_regulators;
+		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps16_regulators));
+		break;
 	case S2MPU02:
 		rdev_num = ARRAY_SIZE(s2mpu02_regulators);
 		regulators = s2mpu02_regulators;
@@ -1316,6 +1462,7 @@ static const struct platform_device_id s2mps11_pmic_id[] = {
 	{ "s2mps13-regulator", S2MPS13X},
 	{ "s2mps14-regulator", S2MPS14X},
 	{ "s2mps15-regulator", S2MPS15X},
+	{ "s2mps16-regulator", S2MPS16X},
 	{ "s2mpu02-regulator", S2MPU02},
 	{ "s2mpu05-regulator", S2MPU05},
 	{ },
-- 
2.43.0


