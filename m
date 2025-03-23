Return-Path: <linux-rtc+bounces-3580-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C11A6D1BC
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2356F3AA49D
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D2E1EDA22;
	Sun, 23 Mar 2025 22:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I9GDMaGT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B861C84AB
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769579; cv=none; b=mF+9Ar3xjPk8H59XNISOlME2yYm8AhyBBtFnfCudQ1LPGc0KPvDY1AnJl4k/zMz/qUPsFHgEyr1K6o1H++dqGCyhF+u+Qcfwk2BiT0NVxIq0p6TFfeGFxhaAQAt++Ka/aBVyj8IiAUBGvKSgBafyqFs9icwxSsUiIq8cUEe0uIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769579; c=relaxed/simple;
	bh=SN4XNsNLZFVi5qqeFmOu/MwH6DQLUxaf/XH7JDQjnuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T0wyBuFu9QZbCG/AC7A/SuGFzJqyi98umGmSNeiFAJ+WCugg5CliYY+PzPb00Doqpe2R0YT3ImpeZ91IM9KLTcGDpx5S7FGYDiWWl5vmomeGnEM9lNW8l0UD7/BtePYYrrWjYen6R0zOE0MauIayjAvudrpJLuLroSvjWkx6XZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I9GDMaGT; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab78e6edb99so552696966b.2
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769572; x=1743374372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Ic/0Xe88bpVQ1K2LP6tYIkZ9tLwnecoFfoF6m5efNc=;
        b=I9GDMaGTphRs+hke3npQ2q9wbFM4D2TV7JpNug+yQsZDr3WFSBbq3FvNVCaasq52Ki
         sWtmz5wZIs4E3tiZumlkow+8ondkFZBvPY6rDjaQL5HwMXJzI9TN03uujZFcWepa4kB+
         FD+G6JKK3VnRvH1+OrdzO73RqnaXmQx9Ff4JNO3uLjU+pgm5/6/ABLQnqdl4vt4S0+Sg
         CuLOfSApctaY055fOZXPQQ/o1sYWZVGq7c6KwnDaweCVb5INbGtNqEr4w+yVG6V1qz4w
         HkxrdNbWj8KMdRts+oY2fE+3FJlYt2LZJdAlVOvImtiET3x1VPPx7RPOEDkTVSVxTztn
         8Zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769572; x=1743374372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Ic/0Xe88bpVQ1K2LP6tYIkZ9tLwnecoFfoF6m5efNc=;
        b=w/sFz2zoFR9XjiVR5GxmPpwM5j3QeODVQfElLeQ71432TP2YFOlITsIQOX9jFBD+FN
         a1tKoxdglAl0aocFSi3WyyJkoWMrk231H4BfQJ5cgJW4PW4g0LUjqvzbEO26ePL0ehrd
         dmQFH8Klx2jhYqfShgPI72yEGY1bzA69cblCF4eU3BSTuRSR2k+PLsDMSdmmkUjTi+qo
         uG3K/mTfX4rR1LExGWi4mrVbgPMb22QPWE4uFQplp9rzZR/z9SzbDZfa/zaycT/KM+Ur
         THiwJWvTbRfr8w8BwK/VDqbxMm/N1SinpuHCfmIhB5v8ac0cxsSpnBNFHphIy7F4Es0W
         G7sg==
X-Forwarded-Encrypted: i=1; AJvYcCV1rkkui5Zxazqjoq/88gYjlQ8E3ccqU9LHdnZ5nkQdvLDjI/Pdws3XLL/rHrVLG/Z8rMmFX8m33KQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLz9/r/PIevuCpae2vKEfEnjfQvgK7NB1ZCfL8dEQTIAbUkT+R
	hsonZdIPIFDsW5Fjg0aeibF48j7OhWrOLnXZ9SLJucOEGkSGSxEvvBX/WqCkEbc=
X-Gm-Gg: ASbGncvZnVtRGv/n46agu2RPqR/aYqejTDAoHYh2Ph/cBjk/qajihFL8tAOnGrUCTmH
	cmpBLUSd95Sj/SR8GuihddQPDe5gOA9p/ZRrvEEwt9miFLkHrF/LERluCVyNVkfDEkZLJMCAY08
	nvE9IXbILI0AFUhAWifK6GcSTxDLbATqg3Bj2XnsWxg2gAafbEVQSdu4cWa7es5qmxU0oUYSTCf
	HP82PutlD1n7lh8aoyELtiNrHp5Qu/pXt4v76iW1KhRWISxJ/7/n0geOQEn9SvmLZH/NE1aY8bh
	LzuCiBXHzJDXaoYOdNb2kiT19MOyy9NuaALMo3J80TVJ5F+HMuvnAtVSbNqhALCrLQfswvziohU
	joMM/aS8SuU4+UsKUBYSKCiy9df0j
X-Google-Smtp-Source: AGHT+IHSWJYMmiilFq0GtP25G1GQAXzOeFA4uM6WttlSQSDa4D8BZIvbWko1AKzeqQZza3T/DLDdOw==
X-Received: by 2002:a17:907:d785:b0:ac3:3e40:e182 with SMTP id a640c23a62f3a-ac3f20f29c6mr1017949366b.19.1742769572496;
        Sun, 23 Mar 2025 15:39:32 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:31 +0000
Subject: [PATCH 15/34] mfd: sec: use dev_err_probe() where appropriate
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-15-d08943702707@linaro.org>
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

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

While at it, harmonise some error messages.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c |  6 +++---
 drivers/mfd/sec-i2c.c    | 10 +++-------
 drivers/mfd/sec-irq.c    | 14 +++++++-------
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index fcf7668efd3215ad70d81916ede249ed5f9d45ae..5e084e2c389ea6d509393be93f7e2d39a795a60c 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -211,9 +211,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 		num_sec_devs = ARRAY_SIZE(s2mpu05_devs);
 		break;
 	default:
-		dev_err(sec_pmic->dev, "Unsupported device type %lu\n",
-			sec_pmic->device_type);
-		return -EINVAL;
+		return dev_err_probe(sec_pmic->dev, -EINVAL,
+				     "Unsupported device type %lu\n",
+				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
 				   NULL, 0, NULL);
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index ba0efb30877bf668fed7476a5e247e0dd4095806..ce1e5af9215a305fbb55157ae4e7bfb9aace86b8 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -152,7 +152,6 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	const struct regmap_config *regmap;
 	unsigned long device_type;
 	struct regmap *regmap_pmic;
-	int ret;
 
 	sec_pmic_i2c_parse_dt_pdata(&client->dev, &probedata);
 
@@ -186,12 +185,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	}
 
 	regmap_pmic = devm_regmap_init_i2c(client, regmap);
-	if (IS_ERR(regmap_pmic)) {
-		ret = PTR_ERR(regmap_pmic);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(regmap_pmic))
+		return dev_err_probe(&client->dev, PTR_ERR(regmap_pmic),
+				     "regmap init failed\n");
 
 	return sec_pmic_probe(&client->dev, device_type, client->irq,
 			      regmap_pmic, &probedata, client);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 4afac3aa0a582994bf04c41768c1c788c54ee2e9..d05c8b66c35f2a1356d7c641484404628870ed42 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -488,18 +488,18 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 		sec_irq_chip = &s2mpu05_irq_chip;
 		break;
 	default:
-		dev_err(sec_pmic->dev, "Unknown device type %lu\n",
-			sec_pmic->device_type);
-		return -EINVAL;
+		return dev_err_probe(sec_pmic->dev, -EINVAL,
+				     "Unsupported device type %lu\n",
+				     sec_pmic->device_type);
 	}
 
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0) {
-		dev_err(sec_pmic->dev, "Failed to register IRQ chip: %d\n", ret);
-		return ret;
-	}
+	if (ret != 0)
+		return dev_err_probe(sec_pmic->dev, ret,
+				     "Failed to add %s IRQ chip\n",
+				     sec_irq_chip->name);
 
 	/*
 	 * The rtc-s5m driver requests S2MPS14_IRQ_RTCA0 also for S2MPS11

-- 
2.49.0.395.g12beb8f557-goog


