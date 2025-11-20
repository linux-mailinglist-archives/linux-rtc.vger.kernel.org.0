Return-Path: <linux-rtc+bounces-5447-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E92C74A1D
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 15:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 24C244E1E2B
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 14:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70C52D5C61;
	Thu, 20 Nov 2025 14:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RxEEFt4F"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634A9296BCF
	for <linux-rtc@vger.kernel.org>; Thu, 20 Nov 2025 14:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763649491; cv=none; b=T/M7ikz23IXHaYQSK0fjAwLmbkde8biJVDHwKv7J4kuFmLiIP1YxXnUthlbBhRUyjCQsDoshZG3wwCo743XhFAkSuWLApbzboxAsalQSa7P9obiA/S3LNlZoSN7HCwy4qt1idCpkC05SZFKDJ0/sHmfBtknOicRadq7HTbIa2zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763649491; c=relaxed/simple;
	bh=8jm84u7LjLlfXvCKgFxIMadhoffbXTuom3rGA8x1cuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WqSNkmrUFIQzbh3Of+ufTlCqjAcd4fVzT5xrQsc8IvooapsEcbjBbQp4AUG/FQCq6bMGvoEqpthU90hpjv24ylsZvCFj6+FLC+c52rkNUcTk2rLkKZ5CF7yOwa1p9ODwladZDJDrbyZbzeB0riRDbxZ5HOJc31sWVW+dJIauC20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RxEEFt4F; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b739ef3f739so191070266b.1
        for <linux-rtc@vger.kernel.org>; Thu, 20 Nov 2025 06:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763649486; x=1764254286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlPjCAelRnLfSQEAgwBc6NbAVq3HOSTWNjdTmYgiuP8=;
        b=RxEEFt4FhdEQ8EL2N4bGt2schNO00NrKFfzOBSWDncyeFj3JewR76XoFUtiOlZd7LA
         yuLo+XjAtiVNvZvJBoX3rbn7J2RbY7nsbFYyp5J7UyAZ6lnjiF0363CYwYKeuti/8YrS
         VMpKwzWmIrOpMalIC7xXS6oQqnrJyWiWKV7G2UjVbI4nScbdhXtkREdZEX9UkxlcPHrJ
         0Qc529MchRbhTTaiewJq0qTzZ+hesA3G8IOfUOlklkp5afqjBrPc11M0MFnWApXYkIWj
         jbb3IcYlmHHASTmSC+2+eSBnGA1AEkZLsuDWU6UQL1yUikXuxd+8JdQypM+r06q06FcW
         zzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763649486; x=1764254286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xlPjCAelRnLfSQEAgwBc6NbAVq3HOSTWNjdTmYgiuP8=;
        b=Czl/2RM279uwW4zgXPgmjs4DbX33p2mfq4mdEaVH+M3+OeWIxkTg38L2M7IMVBwzlR
         FYuPAajkZsU1Ndc0g7gjs0c59ZHO5xX0IYAIb20nLtmwoLt3khrEAaWgKL3Izv3+aOlM
         YNGGQDLuDLUfbO/BvKPmg/thIr+VHegKbVz4RIaAHOmAl4HYvxMdsWJgiYhZExQKLAug
         KJ17k+Zoq88OvJMFL6i6aWJ2XWwT2eWeYMjz3ZFoIJ+0t3IvS9aoMNwnLQKIkGdpF1XY
         UI+Hxg9VQ+Wncyuqj8B6JNdhUPPl9ADHCJ65um0dMIbD6H2oovwGfIOya3QZIEPysPD8
         44yw==
X-Forwarded-Encrypted: i=1; AJvYcCXaXZVukHDy0Yq3bSFOtIF0/l6Sd9kZXyMeJdbH0ImVaLVERPAutcHe9G8gn1kDITrmBPPAGBUMlIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNb3ACLWOMTHNYxvsPbkSq4PC8F9e+pErlv8zTsTavGcX3TvFj
	JLGePttrdi2YrvWHDjtkyTOQgHeAzxqbKb+xBNPoBc1lb58qBbN9q80/5CtSTG6suqs=
X-Gm-Gg: ASbGncuz8KB9ve/DvTTP0PddHswCCxBMW8ZdXKX1+yaDZK8ET8vGPBdwL90rIaqK9Gn
	gIODQtuFyVqJJiSoijVBxO0KJe4lH8/kud2XLGFoipYFU7LYW8jaV34651YV/psDKasg5PcMkw5
	7ee0wyGRJLdtizuXhUvZDbU6rqbzW2IuPZa6lGK2j7OOHsykw3K9x0r14VoanqK+tC+DM/a5zbe
	h/tERreXz36GEzskjqrG4nyeg7WH4UxfcVPIVNKyEnoy7HObIxnu8MkRW9UBzpT1cD7YppP9c0+
	BJSNuP62IDK/InvcgmcF3tB1kinmUqGjvwxjhM2nMIn1DoQG4jZKX9r9BnuP/fteSAy/7VCKVGU
	15Qx/aXHXQd+cqt1JcQS8KjbGhioEiJeTxqC6QCDXHt3b7cMBLBcuZB3CrGQjVzrk9dh8I2Vdsh
	ajS+IIBK1njSVcDPOgMF6D8sPP1ynGcbdSrktTB1feqVe7ei7mO4nne4+rNYRq3Jx3VMfGLJ6ZX
	T1gEg==
X-Google-Smtp-Source: AGHT+IF/WeYzeqGTdxWSV6LVCDSCdC4Yk31C1Uj6CW7uE4VKWNFHeWPwZZjuMvG6qurVmjk+ZY9BiQ==
X-Received: by 2002:a17:907:c14:b0:b76:277b:9a58 with SMTP id a640c23a62f3a-b7654d8ce57mr388131666b.9.1763649486579;
        Thu, 20 Nov 2025 06:38:06 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7655050927sm214326566b.71.2025.11.20.06.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 06:38:06 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 20 Nov 2025 14:38:06 +0000
Subject: [PATCH v2 3/3] mfd: sec: drop now unused struct
 sec_pmic_dev::irq_data
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251120-s5m-alarm-v2-3-cc15f0e32161@linaro.org>
References: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
In-Reply-To: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
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
 drivers/mfd/sec-common.c         |  9 +++---
 drivers/mfd/sec-core.h           |  2 +-
 drivers/mfd/sec-irq.c            | 63 ++++++++++++++++++----------------------
 include/linux/mfd/samsung/core.h |  1 -
 4 files changed, 35 insertions(+), 40 deletions(-)

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
index d992e41e716dcdc060421e1db8475523842a12be..96f53c3617da4cb54f650f9b98c0b934b823ceda 100644
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
+s2mpg1x_add_chained_irq_chip(struct device *dev, struct regmap *regmap, int pirq,
+			     struct regmap_irq_chip_data *parent,
+			     const struct regmap_irq_chip *chip)
 {
+	struct regmap_irq_chip_data *data;
 	int irq, ret;
 
 	irq = regmap_irq_get_virq(parent, pirq);
 	if (irq < 0)
-		return dev_err_probe(dev, irq, "Failed to get parent vIRQ(%d) for chip %s\n", pirq,
-				     chip->name);
+		return dev_err_ptr_probe(dev, irq, "Failed to get parent vIRQ(%d) for chip %s\n",
+					 pirq, chip->name);
 
-	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT | IRQF_SHARED, 0, chip, data);
+	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT | IRQF_SHARED, 0, chip,
+				       &data);
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
@@ -302,27 +304,28 @@ static int sec_irq_init_s2mpg1x(struct sec_pmic_dev *sec_pmic)
 		chained_pirq = S2MPG10_COMMON_IRQ_PMIC;
 		break;
 	default:
-		return dev_err_probe(sec_pmic->dev, -EINVAL, "Unsupported device type %d\n",
-				     sec_pmic->device_type);
+		return dev_err_ptr_probe(sec_pmic->dev, -EINVAL, "Unsupported device type %d\n",
+					 sec_pmic->device_type);
 	};
 
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
 
 	return s2mpg1x_add_chained_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic, chained_pirq,
-					    irq_data, chained_irq_chip, &sec_pmic->irq_data);
+					    irq_data, chained_irq_chip);
 }
 
-int sec_irq_init(struct sec_pmic_dev *sec_pmic)
+struct regmap_irq_chip_data *sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
+	struct regmap_irq_chip_data *sec_irq_chip_data;
 	const struct regmap_irq_chip *sec_irq_chip;
 	int ret;
 
@@ -331,7 +334,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 		sec_irq_chip = &s5m8767_irq_chip;
 		break;
 	case S2DOS05:
-		return 0;
+		return NULL;
 	case S2MPA01:
 		sec_irq_chip = &s2mps14_irq_chip;
 		break;
@@ -356,30 +359,22 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
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
2.52.0.rc1.455.g30608eb744-goog


