Return-Path: <linux-rtc+bounces-3595-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C20D3A6D1F2
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00C283AA452
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A8D1F0E51;
	Sun, 23 Mar 2025 22:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZBPk1M5A"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1DB1C8FBA
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769590; cv=none; b=IfUEYnQPOXjEyPo4ne5a8ekU8nVALN2UiC63G4ONTKsKO4xv3O5dY8ArHPKvkJM71XpESDwtzVeX3SWd2Yamktoi7+afo0VwoCp2H1uIwPekcneZPv+vRrnKbYikaqSIQZwxKZu0lZgy7hPoP5ldROGOXcnDVBObLCn65+JE1Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769590; c=relaxed/simple;
	bh=ql91WCByk9BaVTq64rdM6MDbJhqEHhN99K9XM4Pc+7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WKHy86vcQ/sRZoruCXjDb/bVwtm0b1IxK/F/7msVaM1NkA7Iu25cmHkeno6r3bwOV3qftP0If180OsH0/9lQwmsCZY+ZvHpQcY6dgV6fczVyIraOh4T2FP/ZEu/0FV4Kn/csEMsBk8ndeVIZx/S4IargYl2fpR74pg4zem9s2KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZBPk1M5A; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso588947866b.1
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769580; x=1743374380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsLbKQJRD9tdVXE8w0Z1fJ+0H6Ywqg5fj1IFaYNGdSQ=;
        b=ZBPk1M5AgRqdzmm45wxl9we6VgNhJ5Bw76zsi6vuh7NEQmSxKipeF8mftzaIicsVNG
         n2scCgYqggw9qtk6AneU3iJFwDqkPWSoF96OY5Ql5LASh2+QbEhzj/axfeJOctfiQHVI
         DYKJStdoEVeKXRrPGBc6oanEktDko+YvDxmQuGM33O5kh3y+q53GWuljQHdYL1OT+wDt
         9RjrlsVoOgbDQX5OP5lGS2ovx+ZqeM1ytsRDWwvattvK02occhSnJvGfe4tM8DAy3Mwj
         opoTJACjjnzCDTwHYNvFn43iqTDrbsdTHln2cwFRYyijfnvLyqcKpLP2hHz8GN5kg3Sb
         Wetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769580; x=1743374380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsLbKQJRD9tdVXE8w0Z1fJ+0H6Ywqg5fj1IFaYNGdSQ=;
        b=IPXTHzZzCxFawS7OQMSyJLY4CMv6e/IULEBBAmUCvwgVRzm2TcjjrHngXJygEYwgO6
         vX5Pbek7oFYzFPUO5Qc3wXqouzK58OlD9JqvFmzX+EAD4ZsSLnoG2/N9kf94xxYZMz0j
         L37BOC0ZpOVQPWIDWSFtKH5FnD/tYil8y6qjyat7m5hlHjuIUHFlnnpeEImbCl2k8WOr
         JpxPAVISs1k/eRw3khHXbCpi2Rwc3AQA7doUxtCLwCxH1zMkMtjT5ZpVjUV7BkKizbEU
         IVrP78nAZjINiqfB5SBtKQM1JtqSJdtYjHn1t/ZLWVRuX3uslv9Z6b2P8HPEoJIJOLHY
         cPYA==
X-Forwarded-Encrypted: i=1; AJvYcCVpu1g8Lc17dwGkk+sunK76qCYaDDX4stBypo7Q+odqsHcHVTDymeV3Ee3+lzpAU6/eilvV7SCLlhs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Aoxj95OiLTQppR8YC2+WPscCvtFiVu/eK1+AXs0aZYZK19d1
	w/j9EyVtUZlETSdV5BvxwX8V/7FzslGsIlR0XNpo78iqz5mxbZCwgl+Sou9hRjc=
X-Gm-Gg: ASbGncuFhToE+JOR/6B8CrJkxM6nTrAtjciKR9/4ie1zf9yQjGALEciL90mi7sJiQ0V
	nGB3nuvuT/VcfG49ZF7/qBrCgo9L0M5cUBBicFz2m+IAZfHfXZi6FQpAZJ27HqLcahgLZyxIP6b
	qZZAj+MW4zdxuXbUUJ5hBj4ndokWVjSGMThw6uvqvp/R/ak+5NzroVPxzEeH4qJtGfXlW+fK6Os
	N3AcNK+Vz8O/JOzjJLBjzbVYFtQBzrNHx2O9mKwaIBEMm9xD/IG6hoT/WraMHA5DccVeNTd7ZNP
	bjGOANFLA9iYgl/gjcF3e8cxiAUrgMhw5zXoNMPcy80VuaA74zdZ8VK56WppSk1DVFApiZgpR/R
	MlPTIjmponeKmsqY5NYqzOxBHJpL2
X-Google-Smtp-Source: AGHT+IGvOa3XAeKcwT9Vr0T+ZVATFp5TvHs+FtoKfari/ok1W7HicIpcGqvAlFVuwPQSyDN+Jo9fHw==
X-Received: by 2002:a17:907:8694:b0:ac3:b277:2474 with SMTP id a640c23a62f3a-ac3f2285fcdmr1145400566b.28.1742769580258;
        Sun, 23 Mar 2025 15:39:40 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:44 +0000
Subject: [PATCH 28/34] rtc: s5m: prepare for external regmap
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-28-d08943702707@linaro.org>
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

The Samsung S2MPG10 PMIC is not connected via I2C as this driver
assumes, hence this driver's current approach of creating an I2C-based
regmap doesn't work for it, and this driver should use the regmap
provided by the parent (core) driver instead for that PMIC.

To prepare this driver for s2mpg support, restructure the code to only
create a regmap if one isn't provided by the parent.

No functional changes, since the parent doesn't provide a regmap for
any of the PMICs currently supported by this driver. Having this change
separate will simply make the addition of S2MPG10 support more
self-contained, without additional restructuring.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 83 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 46 insertions(+), 37 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 31bdceac7aa245175a30eb13eaaf1f52f70e22c2..86ccf666c68059408907c97f2647716ffaad10c6 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -640,51 +640,60 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	const struct platform_device_id	* const id =
 		platform_get_device_id(pdev);
 	struct s5m_rtc_info *info;
-	struct i2c_client *i2c;
-	const struct regmap_config *regmap_cfg;
 	int ret, alarm_irq;
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
-	switch (id->driver_data) {
-	case S2MPS15X:
-		regmap_cfg = &s2mps14_rtc_regmap_config;
-		info->regs = &s2mps15_rtc_regs;
-		alarm_irq = S2MPS14_IRQ_RTCA0;
-		break;
-	case S2MPS14X:
-		regmap_cfg = &s2mps14_rtc_regmap_config;
-		info->regs = &s2mps14_rtc_regs;
-		alarm_irq = S2MPS14_IRQ_RTCA0;
-		break;
-	case S2MPS13X:
-		regmap_cfg = &s2mps14_rtc_regmap_config;
-		info->regs = &s2mps13_rtc_regs;
-		alarm_irq = S2MPS14_IRQ_RTCA0;
-		break;
-	case S5M8767X:
-		regmap_cfg = &s5m_rtc_regmap_config;
-		info->regs = &s5m_rtc_regs;
-		alarm_irq = S5M8767_IRQ_RTCA1;
-		break;
-	default:
-		return dev_err_probe(&pdev->dev, -ENODEV,
-				     "Device type %lu is not supported by RTC driver\n",
-				     id_entry->driver_data);
-	}
+	info->regmap = dev_get_regmap(pdev->dev.parent, "rtc");
+	if (!info->regmap) {
+		const struct regmap_config *regmap_cfg;
+		struct i2c_client *i2c;
 
-	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
-					RTC_I2C_ADDR);
-	if (IS_ERR(i2c))
-		return dev_err_probe(&pdev->dev, PTR_ERR(i2c),
-				     "Failed to allocate I2C for RTC\n");
+		switch (id->driver_data) {
+		case S2MPS15X:
+			regmap_cfg = &s2mps14_rtc_regmap_config;
+			info->regs = &s2mps15_rtc_regs;
+			alarm_irq = S2MPS14_IRQ_RTCA0;
+			break;
+		case S2MPS14X:
+			regmap_cfg = &s2mps14_rtc_regmap_config;
+			info->regs = &s2mps14_rtc_regs;
+			alarm_irq = S2MPS14_IRQ_RTCA0;
+			break;
+		case S2MPS13X:
+			regmap_cfg = &s2mps14_rtc_regmap_config;
+			info->regs = &s2mps13_rtc_regs;
+			alarm_irq = S2MPS14_IRQ_RTCA0;
+			break;
+		case S5M8767X:
+			regmap_cfg = &s5m_rtc_regmap_config;
+			info->regs = &s5m_rtc_regs;
+			alarm_irq = S5M8767_IRQ_RTCA1;
+			break;
+		default:
+			return dev_err_probe(&pdev->dev, -ENODEV,
+					     "Unsupported device type %lu\n",
+					     id->driver_data);
+		}
 
-	info->regmap = devm_regmap_init_i2c(i2c, regmap_cfg);
-	if (IS_ERR(info->regmap))
-		return dev_err_probe(&pdev->dev, PTR_ERR(info->regmap),
-				     "Failed to allocate RTC register map\n");
+		i2c = devm_i2c_new_dummy_device(&pdev->dev,
+						s5m87xx->i2c->adapter,
+						RTC_I2C_ADDR);
+		if (IS_ERR(i2c))
+			return dev_err_probe(&pdev->dev, PTR_ERR(i2c),
+					     "Failed to allocate I2C\n");
+
+		info->regmap = devm_regmap_init_i2c(i2c, regmap_cfg);
+		if (IS_ERR(info->regmap))
+			return dev_err_probe(&pdev->dev, PTR_ERR(info->regmap),
+					     "Failed to allocate regmap\n");
+	} else {
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "Unsupported device type %lu\n",
+				     id->driver_data);
+	}
 
 	info->dev = &pdev->dev;
 	info->s5m87xx = s5m87xx;

-- 
2.49.0.395.g12beb8f557-goog


