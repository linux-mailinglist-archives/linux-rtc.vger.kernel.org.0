Return-Path: <linux-rtc+bounces-5584-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 051CACC7146
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Dec 2025 11:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A740309CF67
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Dec 2025 10:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9AD1337113;
	Wed, 17 Dec 2025 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W31D2e5R"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE84314A86
	for <linux-rtc@vger.kernel.org>; Wed, 17 Dec 2025 10:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966265; cv=none; b=mVFy9AQc0vwVWa821N3BimYfN82+sDQc1qIX5wPBE5n5Ej5+RbwIDiStGYDGRV30yPmMaCA7NNwYPlM4suVsnUfLUtQyD313VGUvqbyXHMNRimQ7JF8W0HMYfXQHziQtY8j0GnSyqO0iEqV+4FRd5yLSpHwTWypOii9ZbYnAiQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966265; c=relaxed/simple;
	bh=1ahqAflc+U7L4meIC3Q9CdG5wz6HKX/Zum9NhLjDog0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JY3SIKNZLPb5RgSowrtUd+g55m12yNz83jMhz0Ll0aAL4wOu5iaUGjFGVKBeHy2AKWtbd2pz3zs3TTiqG9iIdtvAYvsDIQwuUZb1I/BVb4woTc1Q3WSwf++ZHVLc46PlYpqmcSrvxioSggF2oLlX+4xFMmNvK2GZdpCxpcjIEbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W31D2e5R; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6492e7925d2so6610794a12.3
        for <linux-rtc@vger.kernel.org>; Wed, 17 Dec 2025 02:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765966260; x=1766571060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gu64FyOC35e6HYruzEiAR601OIEUitARDAoJ4iQ8jiM=;
        b=W31D2e5R+4lo3gQSd0r+0v0ULNG9k7yA9lpVUCYA6bbRgtLgd3kQ+EFEtgR09f4ZMk
         VY3rxd2JeGt/2bsiF1anTVup0glTRXHdIK+3lkcUmCOObmNCwHBarOHMQ4KsvWdZlE2o
         0tPPUKVC3XLo18MkK/T/H8I5dmNhPdTte2z3v5jqysL+/tGdvXCEAjX8Tib4CeadX836
         hk0jmdZr1qwDfA83wjrQOweQEZUHBBeCJbKI16P8gO7M/G0UBhz7iSNpCgdVuO6uJGIe
         uQuin6uMxcjBQTRO7upur9ewSjhlqE5sHoIh3TlNigxW6Gz3F7masA/LR6b5PVN6my50
         3BXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966260; x=1766571060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gu64FyOC35e6HYruzEiAR601OIEUitARDAoJ4iQ8jiM=;
        b=aqLQz9EE36b2aOcLUVx7Z3qeyHHNaFIhEuoJpLoox8QP4iI/wOhG19j77DBmDgPCe/
         YD4TDFrP8frSQmMuUATSsZLgBzvapl4N4ddgnvOWgdtqaSqT0yE19XP3uaxlUo0/tsoL
         obQvwAtnyIFSG2NMa7er2T7bhfElnJj48RbDVujXAI5yHRii/i7Cr/iuxxRQVCS0zzHC
         jIsPSM+CvimzBb3TFC2jTxe2OwcrfMiA2PYRNKasoKzS6LLossV06YnPEXqAt7hFyUel
         o1OAPTdlJRGGqPkbSbDjRuFgeGHJz+vcOELgyL+EwU8V7XtKEtJ9by9Zx/7LA3ZZBCAc
         hhxA==
X-Forwarded-Encrypted: i=1; AJvYcCVvwBSE61+3R7gacVMgLWtNbFn+B+BbnkekwAECUDQj58HuI/wQ52Xb50u15l5WJj9LmeQ9/H195LQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAxA90qItMV45TA74KJnuj9v7WEdYGNw398VbmgZS7Z/uRawEo
	Dl04CjuNTjTNTxryzF2DQDH3JzNryM27kRLvhXCmd39Bw0aLJn3dIJG1e7EmGfZCx4Y=
X-Gm-Gg: AY/fxX5r3fg7hc2ZEMnmokDp8rJWKi6vC50ow/92EwnlykPy8LstAdsmsgUU0ymKvFw
	sVY12Dn4LYO4gZsyZ0tsbPJGZU+1u0jH9nHmqUNh4E4HF/QMZCM0O17snv4fFmPUafFvgpSWXY9
	uegs6WucSn8/xEq2AvC4Hvgrs0bBKUPgOrEA/0uoyrEmo1SQ75cBXdj+/9HaPhUdWAx4wCaP120
	dlSiGOwZePcCdLH7aKJyRvCavqfxKHkQbkSNwBQP1NhUyD/n+FwGI005NkWw0iBkz1mNb0aaJn2
	wdd8hQjCEHBZHIcEIF2vALlyGGUzvxclhEkg20di5ZmFDEAgi0BCanJ7zRdDcWMzwsxrVib0pId
	OlLZ7mg066jyGpINrQwQkpNYT31TdkkpTPcLVGAkQbyGTiHWnfWzP0VAcIvdifw9YKV1J04EQsk
	j2pT/e3r1OAiWykQ1KdDPZSIpkJdc2i+vHXL9wRaSwzVI2Pp/Mw/IdiTBihP4L/5uTRpxMst6pr
	voZznyUgHs5pz4J
X-Google-Smtp-Source: AGHT+IGVdu+ouqQOHhPYhLM2bOTsHHu7go67EW76bydcCzQOcwGZ7xaopeNrmww5IZt6oCl8mH3roA==
X-Received: by 2002:a05:6402:1e8a:b0:647:5544:77e with SMTP id 4fb4d7f45d1cf-6499b1e4cb3mr15208957a12.29.1765966256023;
        Wed, 17 Dec 2025 02:10:56 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f4f5a22sm2043811a12.9.2025.12.17.02.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 02:10:55 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 17 Dec 2025 10:10:50 +0000
Subject: [PATCH RESEND v2 3/3] mfd: sec: drop now unused struct
 sec_pmic_dev::irq_data
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-s5m-alarm-v2-3-b7bff003e94c@linaro.org>
References: <20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org>
In-Reply-To: <20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org>
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
2.52.0.351.gbe84eed79e-goog


