Return-Path: <linux-rtc+bounces-3588-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ABDA6D1CF
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FF0B16F5AE
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9393C1EF370;
	Sun, 23 Mar 2025 22:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d29kBB7C"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A101E9907
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769585; cv=none; b=IhqI3OKo9l4AeFUvviYQP7EINryvXsMsdcvTrf5FitL181A1PUgvdQJc7N8zTvLuZ1bIj0cNPZUahNTSmzF523THsEkzFR9Au4fpyk39+7/Lv4gtAZEhsp8pa/kxrome3pU6NnAfI9edFqQ5X+QYs9iyZwasNogi6a4j0PUR3TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769585; c=relaxed/simple;
	bh=fW8fGdBIj01Ce5nYKYOtr5RzqfYdqbt2xVnIKMnonN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aheTqqfvtHVlASo/lLr0Bf4EsROc6CAdLbYSeWu7CrEY9pF3N2ULVZ749fcQXS/AyzNe+eSNGf8Q0g2lerpu+30TurcNOrqNL1LzkTgaZxOkPBuOx/VIuY54fpJfrnY+LybIWzOjT7C9r08pEC9dKNJIFNDhjdHLYCB2kO1mjV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d29kBB7C; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac29af3382dso635621666b.2
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769575; x=1743374375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66I6A9BwKPx78r+x2ze+D3BdpB1AaTqz42y1bAQYxGU=;
        b=d29kBB7CUsXeKyp2ri3yZaOZ/ombMpQc5JXyAyIdzCvPla2rksYIx2WUPRSDvTeX6g
         4FOpBEVwQ8I/DXrh6dkih3Ln4hvzKzaUUZy6ODpe/sJxVptogR5MS7Ct58NnKiFOlyze
         DXmb1qarJ29lSMNrptogUsvB9nBHUfyiga7xQQ+Ovj12sCs+bRme5fpI8RHT+i+Dnt+R
         fSG1fKK7t/bPR2i6ZNM9AXJoAbKM5LY8jxBI9B5jQyKJndIq8wAV5cvuetvD9na5+TCi
         yaMz70Y6ghIcdBCUMLDaoeMMTbRPTZJuZ2RYUUHn/mNGsslg+4u+kY5xZoV6hZd2x4I9
         +iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769575; x=1743374375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66I6A9BwKPx78r+x2ze+D3BdpB1AaTqz42y1bAQYxGU=;
        b=hkgJErRDsTvl4KaZ1yIVl6aLpi+tiSs2ZMMYCL7TMCE1DlQxyeTPgV6Jj1OK5OYT/i
         WZTeBQeW3/LuTDcTrhHFC266hRLYC1YYE3YCK19Q7fO8Nsplwf08VDhIGcYAdPbBe15z
         HpOFlIyBno9abtHwUxEQ0wrlm0gwXnvpOj3EUKGAjQSbzzHupYnmJSbEoOxCIpmjbGo+
         WTm1Iwz0MKSDQccR7emXvBiYoPUIIZb2DmYxoosZnjKsZV57kMQmU5wdKAltFG6zYL55
         pGWOq74ISr1QHGW+QOvAHshDD4bliANVd77QFMfJlpquz118S2GWYiKCAhs67SNUKCAf
         R/sg==
X-Forwarded-Encrypted: i=1; AJvYcCVLKC62k8iT/IZbXRP57SROSMkCguSWvDqjKqhwmdcXX7A+1JOxlljQQQlpHyPdihVx/krNGTHh2rk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/yhcTtR5zFAuOe5dUyzHz6m6MkOGn9q/Xy9iIx0KTnWWWBTaL
	e/fYhtDo/twrMxouCFqF34z/RbXneyQBhgHOTpmSSEhAwj03gRrEEqk6NIDl0x0=
X-Gm-Gg: ASbGnctyEy26wwz1k5qWmdrznvLzqagyRZ8hWZExcn6RsDpzv4KeCL6O4W0/ylKBihG
	7jEZXTiRdamoamAA3VEXmqTbEEcPw9u07Jqfj8OxN0l0KpNybpdjmonSJKyM0jkBhERRRPJW95e
	YfEWHEQ2fg9Ne0ZylB63FSQXYqOVSUntk/xCqo+O+40jvb7+yyDBRTUMlOPH8DrBS7alYkRORrY
	+r6/nFbAXNjDpA/4DD3fkOHj9WUrP+XGks76XLQQHCvonuSxYNlk+Gp1JOU6Mu/FlHCz+g8OH9O
	V/CLIisRfHKo0ed47sdPIv6pGMQy16nrQ+4AQE+/vSw5d//n5JtHhki9TNVBH3pDhjpAIilvsUV
	YAYosUJAMt2VYu6LTb3iWI7nH9xpu
X-Google-Smtp-Source: AGHT+IFOl2n2dt4259UO9Y2Hc/nB/vtxXxb3XEltGi4hCBG4hgPGKnJT2FEY0IZG076qDEvYKYdc8w==
X-Received: by 2002:a17:907:7f0c:b0:ac3:c4a9:7f89 with SMTP id a640c23a62f3a-ac3f251f2a0mr846621366b.54.1742769575429;
        Sun, 23 Mar 2025 15:39:35 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:35 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:36 +0000
Subject: [PATCH 20/34] mfd: sec: rework platform data and regmap
 instantiating
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-20-d08943702707@linaro.org>
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

Instead of a large open-coded switch statement, just add both regmap
config and device type to the OF match data. This allows us to have all
related information in one place, and avoids a long switch() statement.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-i2c.c | 137 +++++++++++++++++++++++++-------------------------
 1 file changed, 68 insertions(+), 69 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 1bdd6ea36fcd9f56ea5ec1159a87723f4c09a0bd..9f33d4569cf73461c57d101f6ca1cf2b75f22b4d 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -20,11 +20,16 @@
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include "sec-core.h"
 
+struct sec_pmic_i2c_platform_data {
+	const struct regmap_config *regmap_cfg;
+	unsigned long device_type;
+};
+
 static bool s2mpa01_volatile(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -153,55 +158,23 @@ sec_pmic_i2c_parse_dt_pdata(struct device *dev,
 
 static int sec_pmic_i2c_probe(struct i2c_client *client)
 {
+	const struct sec_pmic_i2c_platform_data *pdata;
 	struct sec_pmic_probe_data probedata;
-	const struct regmap_config *regmap;
-	unsigned long device_type;
 	struct regmap *regmap_pmic;
 
-	sec_pmic_i2c_parse_dt_pdata(&client->dev, &probedata);
-
-	device_type = (unsigned long)of_device_get_match_data(&client->dev);
-
-	switch (device_type) {
-	case S2DOS05:
-		regmap = &s2dos05_regmap_config;
-		break;
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
-	case S2MPU02:
-		regmap = &s2mpu02_regmap_config;
-		break;
-	case S2MPU05:
-		regmap = &s2mpu05_regmap_config;
-		break;
-	case S5M8767X:
-		regmap = &s5m8767_regmap_config;
-		break;
-	default:
+	pdata = device_get_match_data(&client->dev);
+	if (!pdata)
 		return dev_err_probe(&client->dev, -ENODEV,
-				     "Unsupported device type %lu\n",
-				     device_type);
-	}
+				     "Unsupported device type\n");
 
-	regmap_pmic = devm_regmap_init_i2c(client, regmap);
+	sec_pmic_i2c_parse_dt_pdata(&client->dev, &probedata);
+
+	regmap_pmic = devm_regmap_init_i2c(client, pdata->regmap_cfg);
 	if (IS_ERR(regmap_pmic))
 		return dev_err_probe(&client->dev, PTR_ERR(regmap_pmic),
 				     "regmap init failed\n");
 
-	return sec_pmic_probe(&client->dev, device_type, client->irq,
+	return sec_pmic_probe(&client->dev, pdata->device_type, client->irq,
 			      regmap_pmic, &probedata, client);
 }
 
@@ -210,35 +183,61 @@ static void sec_pmic_i2c_shutdown(struct i2c_client *i2c)
 	sec_pmic_shutdown(&i2c->dev);
 }
 
+static const struct sec_pmic_i2c_platform_data s2dos05_data = {
+	.regmap_cfg = &s2dos05_regmap_config,
+	.device_type = S2DOS05
+};
+
+static const struct sec_pmic_i2c_platform_data s2mpa01_data = {
+	.regmap_cfg = &s2mpa01_regmap_config,
+	.device_type = S2MPA01,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mps11_data = {
+	.regmap_cfg = &s2mps11_regmap_config,
+	.device_type = S2MPS11X,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mps13_data = {
+	.regmap_cfg = &s2mps13_regmap_config,
+	.device_type = S2MPS13X,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mps14_data = {
+	.regmap_cfg = &s2mps14_regmap_config,
+	.device_type = S2MPS14X,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mps15_data = {
+	.regmap_cfg = &s2mps15_regmap_config,
+	.device_type = S2MPS15X,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mpu02_data = {
+	.regmap_cfg = &s2mpu02_regmap_config,
+	.device_type = S2MPU02,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mpu05_data = {
+	.regmap_cfg = &s2mpu05_regmap_config,
+	.device_type = S2MPU05,
+};
+
+static const struct sec_pmic_i2c_platform_data s5m8767_data = {
+	.regmap_cfg = &s5m8767_regmap_config,
+	.device_type = S5M8767X,
+};
+
 static const struct of_device_id sec_pmic_i2c_of_match[] = {
-	{
-		.compatible = "samsung,s2dos05",
-		.data = (void *)S2DOS05,
-	}, {
-		.compatible = "samsung,s2mpa01-pmic",
-		.data = (void *)S2MPA01,
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
-		.compatible = "samsung,s2mpu02-pmic",
-		.data = (void *)S2MPU02,
-	}, {
-		.compatible = "samsung,s2mpu05-pmic",
-		.data = (void *)S2MPU05,
-	}, {
-		.compatible = "samsung,s5m8767-pmic",
-		.data = (void *)S5M8767X,
-	},
+	{ .compatible = "samsung,s2dos05", .data = &s2dos05_data, },
+	{ .compatible = "samsung,s2mpa01-pmic", .data = &s2mpa01_data, },
+	{ .compatible = "samsung,s2mps11-pmic", .data = &s2mps11_data, },
+	{ .compatible = "samsung,s2mps13-pmic", .data = &s2mps13_data, },
+	{ .compatible = "samsung,s2mps14-pmic", .data = &s2mps15_data, },
+	{ .compatible = "samsung,s2mps15-pmic", .data = &s2mps15_data, },
+	{ .compatible = "samsung,s2mpu02-pmic", .data = &s2mpu02_data, },
+	{ .compatible = "samsung,s2mpu05-pmic", .data = &s2mpu05_data, },
+	{ .compatible = "samsung,s5m8767-pmic", .data = &s5m8767_data, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, sec_pmic_i2c_of_match);

-- 
2.49.0.395.g12beb8f557-goog


