Return-Path: <linux-rtc+bounces-3686-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 158BCA74B4C
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 14:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 374AB3B1190
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 13:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA7523771C;
	Fri, 28 Mar 2025 13:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jFf4z30A"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A902721CA17
	for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168676; cv=none; b=JNgXo7JJfRM+YoQ82ma7Yg3cYZIN13RO/YybwbQzaVXBq2fkXJGeFrYq7WrNycdHCflHh4vipAiMnSwMhb5yZJOGUKerlb024SE7NoAiV/XCADwDJjz43tVt+hP2ZESxpDMjVxvdA4svLqHOqc50lA9BfW021YWQJ+TQInQGFAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168676; c=relaxed/simple;
	bh=bllvwGesgocAPfPa0BvtiRJ2XbMS7FrEApqy00ZsPPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gw+mY94Pkx3/S5zBANku4gtk5/yoQ82IrOLu8TOhuSW3BrJ8DCsL6ko8F6Laiq/VUzStEPopBf9REFOeWsXNW7AgZIaefr/nyUxBD2VSHD+4WM1JIWSaBRna5Ak242UXX9jL+OHGn/0r/VA8iVO1JFYuAi/MHjxfHDQ5AOJdqkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jFf4z30A; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so4054448a12.0
        for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168663; x=1743773463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZ+pWW3wwfoO36sbVjoQMpP7epgDk59E8mIno/3xwfk=;
        b=jFf4z30AB4Ht+cXJWhLRG8RyM9sBRtGrfCZ5MLzAytf4YmpaMFNg60I8Y1Ki5uNOc2
         iWxxlA+7is/nP2SRSjO6E6JpImKsypld7rACtiah77paGuKce3JYjflidwA1gNW8Rlep
         19wUU/82e0LV2zx7KBr7Zey0u8vuVhFgsNqvdxGv7PLtLVSk0DQPED0k5CncqtM+eSdD
         TqsEAvLjox2fCxTUNMbQxPM7LTK92YhSc5h1ICUn62xQFEAzqH7/iIV2mEwBdW6y3W+Y
         CNdJSlCnFgUAVXVLe27k00PMDovIlD1Q+YzrcRDcLsy5e24orniUAoX964Wx0bZcqP6J
         yHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168663; x=1743773463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZ+pWW3wwfoO36sbVjoQMpP7epgDk59E8mIno/3xwfk=;
        b=o/P8l4e9vml0U9XnzorgWK1KLMImQZgCx9wpHwcXIpQXYmDtCcF4ulYCewAwl6nUll
         BP+L9lOXyor4mMgvXwg2Cf+qLtRWGx6ggPL4KT4ZRhqkel6qxzpb/e/BlwcQNXwYskpn
         PW/W5OaKUihEu4FrIUuiB0txgaNCFnWicdPKmgsslqS9m8Ho0U9O3Sl97jiW0zJIxpCp
         G6lKq69oDD161EBA8l6rG2GaCI4/Zpivx/FXoOnP86ou/ZXd7n73aOwXfEy0aqAXHFqs
         75eo6qOUHCxaBP0cH/nxFp9vKbNd8TeyD71X9zZxuf8tiviSezgh6zOVc9zUyHfXlUWD
         Jzzg==
X-Forwarded-Encrypted: i=1; AJvYcCWmkeSiLuYbLuAsLKnD/jICvzsNtSrCccrV6WCDxLeoExICizR4imQDZYtNa/WHcu662Swfd1i/Ztk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz52Hj22KsYLqNGBMFdicl6HLCXR+tUxUQ8Nr/Ksfs+BaBUrgIJ
	ugfxY9t5vIzlVX8ZUdCWl/N6cVNRhHQJ3QI9WsyYQ9s0NBJWBNp35fTh73LYnyk=
X-Gm-Gg: ASbGncvOB9cTVWPsKUUDGPKKAfHGheFN7s7rHudu88pi4/hwc76KM6rQQzQdMsSQ/Zd
	zluZMQBT/kekoHANq6xssf+eUo3E8EveF/O53xTj6ccw4FtPc1OfV/Xs+loMhmSq4cv7RMGwbUD
	mLR5uxtUXD+udeKM4wJCC9p3Y+UYpLT1trUBpZtdN8t8CRlWxfxSf7K+coJw/h/O9ztStruvs8o
	EKqiMQauCM2f9Ghk0EmKWCAJzKiGONG/uvD1UuATjmmBMr7bQ/nKnbbjS/PimSFYq/8NIbuf7cE
	sjg6XDrSNXG/Jlj+mXbpfrTnh3L+XHBX0SGKd3P3VTIMw+dHG7d8jgjKJkkgG6zfjpkY8XN5JTk
	JldCO6FBlmw7aLPqHP/xsa0/cSmAn
X-Google-Smtp-Source: AGHT+IFvr+SOv6TYL/fIDoyg5ti+FaRzN3oqSR0lDemyricExzUDfIk3kNyRHZoukM47sE3VOIFENg==
X-Received: by 2002:a05:6402:518d:b0:5e7:b02b:6430 with SMTP id 4fb4d7f45d1cf-5ed8f3fd122mr6774697a12.23.1743168663146;
        Fri, 28 Mar 2025 06:31:03 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:02 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:04 +0000
Subject: [PATCH v2 18/32] mfd: sec: change device_type to int
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-18-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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

Now that sec-i2c doesn't match device type by pointer casting anymore,
we can switch the device type from unsigned long to int easily.

This saves a few bytes in struct sec_pmic_dev due to member alignment.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c         | 9 ++++-----
 drivers/mfd/sec-core.h           | 5 ++---
 drivers/mfd/sec-i2c.c            | 2 +-
 drivers/mfd/sec-irq.c            | 5 ++---
 include/linux/mfd/samsung/core.h | 2 +-
 5 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index bb0eb3c2d9a260ddf2fb110cc255f08a0d25230d..4871492548f5efde4248b5b3db74045ec8c9d676 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -155,9 +155,8 @@ sec_pmic_parse_dt_pdata(struct device *dev)
 	return pd;
 }
 
-int sec_pmic_probe(struct device *dev, unsigned long device_type,
-		   unsigned int irq, struct regmap *regmap,
-		   struct i2c_client *client)
+int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
+		   struct regmap *regmap, struct i2c_client *client)
 {
 	struct sec_platform_data *pdata;
 	const struct mfd_cell *sec_devs;
@@ -232,7 +231,7 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 		break;
 	default:
 		return dev_err_probe(sec_pmic->dev, -EINVAL,
-				     "Unsupported device type %lu\n",
+				     "Unsupported device type %d\n",
 				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
@@ -266,7 +265,7 @@ void sec_pmic_shutdown(struct device *dev)
 		 * ignore the rest.
 		 */
 		dev_warn(sec_pmic->dev,
-			 "Unsupported device %lu for manual power off\n",
+			 "Unsupported device %d for manual power off\n",
 			 sec_pmic->device_type);
 		return;
 	}
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
index a0a3488924d96f69373e7569079cfefd0544ca26..92c7558ab8b0de44a52e028eeb7998e38358cb4c 100644
--- a/drivers/mfd/sec-core.h
+++ b/drivers/mfd/sec-core.h
@@ -14,9 +14,8 @@ struct i2c_client;
 
 extern const struct dev_pm_ops sec_pmic_pm_ops;
 
-int sec_pmic_probe(struct device *dev, unsigned long device_type,
-		   unsigned int irq, struct regmap *regmap,
-		   struct i2c_client *client);
+int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
+		   struct regmap *regmap, struct i2c_client *client);
 void sec_pmic_shutdown(struct device *dev);
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 41b09f5e3c49f410604a5d47e625cbb37d7f5fa2..2ccb494c8c024361c78e92be71ce9c215757dd89 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -27,7 +27,7 @@
 
 struct sec_pmic_i2c_platform_data {
 	const struct regmap_config *regmap_cfg;
-	unsigned long device_type;
+	int device_type;
 };
 
 static bool s2mpa01_volatile(struct device *dev, unsigned int reg)
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 79a3b33441fa5ab48b4b233eb8d89b4c20c142ed..c4db58813059f07372679223ec570ed07f52cd73 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -449,10 +449,9 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
 	int ret = 0;
-	int type = sec_pmic->device_type;
 	const struct regmap_irq_chip *sec_irq_chip;
 
-	switch (type) {
+	switch (sec_pmic->device_type) {
 	case S5M8767X:
 		sec_irq_chip = &s5m8767_irq_chip;
 		break;
@@ -484,7 +483,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 		break;
 	default:
 		return dev_err_probe(sec_pmic->dev, -EINVAL,
-				     "Unsupported device type %lu\n",
+				     "Unsupported device type %d\n",
 				     sec_pmic->device_type);
 	}
 
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index c1102324172a9b6bd6072b5929a4866d6c9653fa..d785e101fe795a5d8f9cccf4ccc4232437e89416 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -67,7 +67,7 @@ struct sec_pmic_dev {
 	struct regmap *regmap_pmic;
 	struct i2c_client *i2c;
 
-	unsigned long device_type;
+	int device_type;
 	int irq;
 	struct regmap_irq_chip_data *irq_data;
 };

-- 
2.49.0.472.ge94155a9ec-goog


