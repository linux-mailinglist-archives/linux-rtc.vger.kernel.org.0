Return-Path: <linux-rtc+bounces-5746-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9B6D19434
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jan 2026 15:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D94353012E9D
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jan 2026 14:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516A2392B65;
	Tue, 13 Jan 2026 14:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vlz5V8MP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BBF392B76
	for <linux-rtc@vger.kernel.org>; Tue, 13 Jan 2026 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313005; cv=none; b=dwrmFDvipjGf+d7pJbShHf+xqeLU1dmvbpyXbTqP2xCuTxsRcpK/x5Xli5l31hTXV730Nsi0K9B0Sw2dzYqtfDPsEKfHRa1Lvf4e3mGilT/hKGyBpHKvVzj9g/rwE25hDY0383eeD6APk49PokHZZ5/pdQY8BnBXWsc4QSAqAIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313005; c=relaxed/simple;
	bh=7EcWUnN0+N32pOYCO+1MoaYBsSNzfSeivRzWX9y8YCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bucRq53DZhJOo5lUvAu6SFOizlwZWaYn6EkGlDh7iNQLGLJJfvMkyD5kal7zp+lYqZw+z8xVajqEQk7AOBm6SWahSVTvpX7g53boIgjH57OvWI0OU6nMLDBHqAZv3+Wt8y0DlF5z2XGJ17D4/zzKmLfF9dydwi/DO8AgkgxGTAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vlz5V8MP; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64b9dfc146fso3125505a12.0
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jan 2026 06:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768312995; x=1768917795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2zaFPeW0OjuaYCVWPM7pM9hcNh6cwyjFk/ezWJ8SDE=;
        b=vlz5V8MPioRADm3VAhU54U6kofewBmqE5vYkAx1Vtdd6tF2teRc5xR+pBcPPYuyokT
         2EFTokEdE6J4Cj9cHrAyPAre3ZG18qExkmZv6HJ6hWiZe6LFBUAKvA0lfenMaR333vBZ
         q38NXeNh/mwZIdKVziRqSf7TYYI2Coa26M4dsUCDYLFeVIysqNy53YMRF+8czcRlscO9
         8gkwoG1M4QTrPjkBCVwCy94+8RhY49S5hUpQKpiawlC+BaRnYXO8NuIE1VaPDer8aqBr
         S2X0H//5Fgevx52Jf2uigYLYpFaxsLB4cEwMtSGRo9fbDAoFP7DjuGMEj/nlVxitvm2j
         3Paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768312995; x=1768917795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u2zaFPeW0OjuaYCVWPM7pM9hcNh6cwyjFk/ezWJ8SDE=;
        b=RHSZxk1jP7RdDmCCzZhb7O7GelRKyZiKwSb9QV11uIehxkBmxkwMYXDeQqiXaLavVd
         UkHXOp+bFy1Um7QF33ibsKlr4FPoJwLy+U1u88JYzq6IhRQsUAkim858x0ORyInBHP4v
         LonX9E/YkBHJCHCxGGhUfp88MlDIDj+BWd1pSPJH+dSe5Ju2XONz5dTMwHXUpsHdanf+
         MkQkwJblXloOYo4b0XPlnoqNOSGFF4aQ9VBnN5ItA4rl0zrTzElCTTlzkgZMSjKTl83m
         AvgbZpW/Kqm2IbXnGU7nnSXHA9Hzj0WfTYkDCGmO1Ept8wJPeodLzrNBdBGh6dS973bs
         OgMw==
X-Forwarded-Encrypted: i=1; AJvYcCXu6wmTxxCoJ/SeaMUYR6z5NKdwSj79Ds5ZkspJgziN/ub2FoItWJP2vT2eB5nSXa9ltY/lP41VkNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRsNVAJC2h9YlBIXFR9vLZ18QFv0tEKVpAS/RCSAe6hdJ2/T1H
	PvLTvyHjKm4l8tC83EkvNntpUq91T/1mpn3bp4DOvILJqdRVvTwW2gQvPwQRxsLCTng=
X-Gm-Gg: AY/fxX7Vz9T9QsrRgPc3Rh4PwU9MZRwOLkmGbvIIe1HrVxLVs1Z+3j4u0Gn3OwYv2fl
	6FBbrE4r78z9TaRZOT5hVUMk8ktTB3efB0dFMAWK3xxfEqkqjrwLaa+2iV6hTtFKYZGiRLt5bnJ
	gQnUM8nKd7Cr5MoNnyWTwX6ss8bGknSzc94E+ccUaLES3MRHJaksxPAt9fBrft1MWKcDEbyc7gL
	JkJ5LiNfOSR4QT+0KvlOajADs7xFhID/wBeQVId0ziT+PMj55OpO7SVtPYZZU9AHTbT4c89g5Lp
	qhfncxtMEDZlj4z7CjWBhEYGN/9XfQ985y9aEpKBjVXftSVjvqJbnn8KuwQdmbWq9RgQwNURBWi
	bs00BXXAwlJoXTrLATIP8PWhbuaJPFzZCCUQKPRUNFdnDYXEZa/MUejOSd4EP8KedPWRk+R9Sd/
	DdAkKnmNV2wFWj8eR+jzb4/jmqok1L1vp0gTTGBNA6GjO24bpPVi8cP6Xe4D9Muc8ivphRO74tK
	B9HJg==
X-Google-Smtp-Source: AGHT+IGy72R/EUzURB6M21xGkc6VsgnlOxnsyKpL+CiAACdFJ/LepvXg6sQq1k/76EpK7ARgXbCncA==
X-Received: by 2002:a05:6402:510d:b0:649:c6fb:1f5c with SMTP id 4fb4d7f45d1cf-652e48f7ce4mr2713178a12.5.1768312995170;
        Tue, 13 Jan 2026 06:03:15 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf65c07sm20139157a12.23.2026.01.13.06.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:03:14 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 13 Jan 2026 14:03:13 +0000
Subject: [PATCH v3 3/3] mfd: sec: drop now unused struct
 sec_pmic_dev::irq_data
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260113-s5m-alarm-v3-3-855a19db1277@linaro.org>
References: <20260113-s5m-alarm-v3-0-855a19db1277@linaro.org>
In-Reply-To: <20260113-s5m-alarm-v3-0-855a19db1277@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 Douglas Anderson <dianders@chromium.org>, kernel-team@android.com, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

This was used only to allow the s5m RTC driver to deal with the alarm
IRQ. That driver now uses a different approach to acquire that IRQ, and
::irq_data doesn't need to be kept around anymore.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
- make s2mpg1x_add_chained_irq_chip() specific to PMIC irq chip (Lee),
  and rename to s2mpg1x_add_chained_pmic() (Andre)

v2:
- return struct regmap_irq_chip_data * in sec_irq_init() (Lee)
---
 drivers/mfd/sec-common.c         |  9 +++---
 drivers/mfd/sec-core.h           |  2 +-
 drivers/mfd/sec-irq.c            | 64 ++++++++++++++++++----------------------
 include/linux/mfd/samsung/core.h |  1 -
 4 files changed, 35 insertions(+), 41 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 77370db52a7ba81234136b29f85892f4b197f429..0021f9ae8484fd0afc2e47c813a953c91fa38546 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -163,6 +163,7 @@ sec_pmic_parse_dt_pdata(struct device *dev)
 int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 		   struct regmap *regmap, struct i2c_client *client)
 {
+	struct regmap_irq_chip_data *irq_data;
 	struct sec_platform_data *pdata;
 	const struct mfd_cell *sec_devs;
 	struct sec_pmic_dev *sec_pmic;
@@ -187,9 +188,9 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 
 	sec_pmic->pdata = pdata;
 
-	ret = sec_irq_init(sec_pmic);
-	if (ret)
-		return ret;
+	irq_data = sec_irq_init(sec_pmic);
+	if (IS_ERR(irq_data))
+		return PTR_ERR(irq_data);
 
 	pm_runtime_set_active(sec_pmic->dev);
 
@@ -240,7 +241,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
-				   NULL, 0, regmap_irq_get_domain(sec_pmic->irq_data));
+				   NULL, 0, regmap_irq_get_domain(irq_data));
 	if (ret)
 		return ret;
 
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
index 92c7558ab8b0de44a52e028eeb7998e38358cb4c..8d85c70c232612d1f7e5fb61b2acd25bf03a62e0 100644
--- a/drivers/mfd/sec-core.h
+++ b/drivers/mfd/sec-core.h
@@ -18,6 +18,6 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 		   struct regmap *regmap, struct i2c_client *client);
 void sec_pmic_shutdown(struct device *dev);
 
-int sec_irq_init(struct sec_pmic_dev *sec_pmic);
+struct regmap_irq_chip_data *sec_irq_init(struct sec_pmic_dev *sec_pmic);
 
 #endif /* __SEC_CORE_INT_H */
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 74ac70002d1fc54c7eeb78cfc21b6117a3e14b03..e0dd122e8fe5ad86ae1e97dc1a4b1605d1813a64 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -268,26 +268,28 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 	.ack_base = S5M8767_REG_INT1,
 };
 
-static int s2mpg1x_add_chained_irq_chip(struct device *dev, struct regmap *regmap, int pirq,
-					struct regmap_irq_chip_data *parent,
-					const struct regmap_irq_chip *chip,
-					struct regmap_irq_chip_data **data)
+static struct regmap_irq_chip_data *
+s2mpg1x_add_chained_pmic(struct sec_pmic_dev *sec_pmic, int pirq,
+			 struct regmap_irq_chip_data *parent, const struct regmap_irq_chip *chip)
 {
+	struct device *dev = sec_pmic->dev;
+	struct regmap_irq_chip_data *data;
 	int irq, ret;
 
 	irq = regmap_irq_get_virq(parent, pirq);
 	if (irq < 0)
-		return dev_err_probe(dev, irq, "Failed to get parent vIRQ(%d) for chip %s\n", pirq,
-				     chip->name);
+		return dev_err_ptr_probe(dev, irq, "Failed to get parent vIRQ(%d) for chip %s\n",
+					 pirq, chip->name);
 
-	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT | IRQF_SHARED, 0, chip, data);
+	ret = devm_regmap_add_irq_chip(dev, sec_pmic->regmap_pmic, irq,
+				       IRQF_ONESHOT | IRQF_SHARED, 0, chip, &data);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to add %s IRQ chip\n", chip->name);
+		return dev_err_ptr_probe(dev, ret, "Failed to add %s IRQ chip\n", chip->name);
 
-	return 0;
+	return data;
 }
 
-static int sec_irq_init_s2mpg1x(struct sec_pmic_dev *sec_pmic)
+static struct regmap_irq_chip_data *sec_irq_init_s2mpg1x(struct sec_pmic_dev *sec_pmic)
 {
 	const struct regmap_irq_chip *irq_chip, *chained_irq_chip;
 	struct regmap_irq_chip_data *irq_data;
@@ -302,27 +304,27 @@ static int sec_irq_init_s2mpg1x(struct sec_pmic_dev *sec_pmic)
 		chained_pirq = S2MPG10_COMMON_IRQ_PMIC;
 		break;
 	default:
-		return dev_err_probe(sec_pmic->dev, -EINVAL, "Unsupported device type %d\n",
-				     sec_pmic->device_type);
+		return dev_err_ptr_probe(sec_pmic->dev, -EINVAL, "Unsupported device type %d\n",
+					 sec_pmic->device_type);
 	}
 
 	regmap_common = dev_get_regmap(sec_pmic->dev, "common");
 	if (!regmap_common)
-		return dev_err_probe(sec_pmic->dev, -EINVAL, "No 'common' regmap %d\n",
-				     sec_pmic->device_type);
+		return dev_err_ptr_probe(sec_pmic->dev, -EINVAL, "No 'common' regmap %d\n",
+					 sec_pmic->device_type);
 
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, regmap_common, sec_pmic->irq, IRQF_ONESHOT, 0,
 				       irq_chip, &irq_data);
 	if (ret)
-		return dev_err_probe(sec_pmic->dev, ret, "Failed to add %s IRQ chip\n",
-				     irq_chip->name);
+		return dev_err_ptr_probe(sec_pmic->dev, ret, "Failed to add %s IRQ chip\n",
+					 irq_chip->name);
 
-	return s2mpg1x_add_chained_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic, chained_pirq,
-					    irq_data, chained_irq_chip, &sec_pmic->irq_data);
+	return s2mpg1x_add_chained_pmic(sec_pmic, chained_pirq, irq_data, chained_irq_chip);
 }
 
-int sec_irq_init(struct sec_pmic_dev *sec_pmic)
+struct regmap_irq_chip_data *sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
+	struct regmap_irq_chip_data *sec_irq_chip_data;
 	const struct regmap_irq_chip *sec_irq_chip;
 	int ret;
 
@@ -331,7 +333,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 		sec_irq_chip = &s5m8767_irq_chip;
 		break;
 	case S2DOS05:
-		return 0;
+		return NULL;
 	case S2MPA01:
 		sec_irq_chip = &s2mps14_irq_chip;
 		break;
@@ -356,30 +358,22 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 		sec_irq_chip = &s2mpu05_irq_chip;
 		break;
 	default:
-		return dev_err_probe(sec_pmic->dev, -EINVAL,
-				     "Unsupported device type %d\n",
-				     sec_pmic->device_type);
+		return dev_err_ptr_probe(sec_pmic->dev, -EINVAL, "Unsupported device type %d\n",
+					 sec_pmic->device_type);
 	}
 
 	if (!sec_pmic->irq) {
 		dev_warn(sec_pmic->dev,
 			 "No interrupt specified, no interrupts\n");
-		return 0;
+		return NULL;
 	}
 
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
-				       0, sec_irq_chip, &sec_pmic->irq_data);
+				       0, sec_irq_chip, &sec_irq_chip_data);
 	if (ret)
-		return dev_err_probe(sec_pmic->dev, ret,
-				     "Failed to add %s IRQ chip\n",
-				     sec_irq_chip->name);
+		return dev_err_ptr_probe(sec_pmic->dev, ret, "Failed to add %s IRQ chip\n",
+					 sec_irq_chip->name);
 
-	/*
-	 * The rtc-s5m driver requests S2MPS14_IRQ_RTCA0 also for S2MPS11
-	 * so the interrupt number must be consistent.
-	 */
-	BUILD_BUG_ON(((enum s2mps14_irq)S2MPS11_IRQ_RTCA0) != S2MPS14_IRQ_RTCA0);
-
-	return 0;
+	return sec_irq_chip_data;
 }
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index d785e101fe795a5d8f9cccf4ccc4232437e89416..c7c3c8cd8d5f99ef0cc3188e1c3b49031f4750f2 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -69,7 +69,6 @@ struct sec_pmic_dev {
 
 	int device_type;
 	int irq;
-	struct regmap_irq_chip_data *irq_data;
 };
 
 struct sec_platform_data {

-- 
2.52.0.457.g6b5491de43-goog


