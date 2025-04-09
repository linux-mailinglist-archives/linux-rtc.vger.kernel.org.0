Return-Path: <linux-rtc+bounces-3877-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C24EDA8328A
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DD6D16369F
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BF02144DF;
	Wed,  9 Apr 2025 20:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QSKhtznF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E91217F5C
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231072; cv=none; b=d8eB9POZIE91P4dIuFq9Kwjy/ljNw2HaM36Xz5yiPz+9YNDUhlfRwhxxuMcFzvZOmLsQEzWJnkItSrGjkH/U7yfElmFC07xSIDcWNqtCX3WyISZkxSLdb549aZwhG1fqgA0aOYQrfY4libn5w/exIFzB1kLcIcu9K6JiEZ+H36A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231072; c=relaxed/simple;
	bh=O4JPugPn1xYM+7ioH06ufb1b5Ml7ZG8ODWJmVaR2vyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PcupCLjKnKYSt0hrmy89JRbZWcOzZIXcMojqALgps7LqrBwH+hWzv+oZhFewx/P1R3kRLBRPhpXiFvuq2sINjIngTMYNJthz4XeZa9yEi+3wXGUuw4QqYNfKqkUR+7iCT9b5zZPB51ecMZgco/mqBHgzPCYj/U8qggSrUWJabT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QSKhtznF; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abbb12bea54so19162866b.0
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231059; x=1744835859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9YixQkkh2h+PoC6ERL/H9JIANLx33uZRMtwP8F9qEs=;
        b=QSKhtznFFXhtw8I666k9RPPov0Jeb0/GuqcYV/i8h7a3uPLBzVCKThrqNLL/NEeEfo
         uPEA5/LZgoo8uqck8Q4CRMAd18ot8lIsLjjZnvbsx8LIkEpgtHjsznDv/AuX7UmEsLSF
         668uPgadesgsOhYTO3xMq/isrXBVOHUmLZn0x+3kmFiO+HOUN1a2IYLhbwft7oqb58T4
         bE9DKX/s98yxzHjQ7tZE4l2O8AC0DnSmvHQ8pr/J4/agaErPC87RwCDOpStEu5TIkQfb
         BJ8HdZodcVoJwf5O92kpTa4iWWsv1XISXpVui0xP9M8cLkHdfFjG3n4SHkNVHiCu8ui6
         DsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231059; x=1744835859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9YixQkkh2h+PoC6ERL/H9JIANLx33uZRMtwP8F9qEs=;
        b=WEKEeTiwryxbaPKvuINTZOTzJCB1teS5qBuGCNiPGkcvoJc3eYAVUNXUNxtbH/hTYu
         0VcPKacYK1miz7dF4puEsDJE+DBvXEEg52/JW+ct1w0gl/OU2ET6wPgx0y7/RhOaJrFM
         +aOFBbQkHrZ5byWkyoDDsqs92Ek/+3/1k+P5Yu/88OHxzTqsHckgd0Xc8uIpqKVu7srd
         4BVsRnCx/OJj6cBAXDIRFHERFESPXXr06Iwr22GMQ/7ehV8S58HaT5U/BpU/cVKZhCzz
         uOoAsfFQTQo6QdFbGlxPAviq9fldILNkGFXKm5Vh/HgpxzMJwIaY6OVMHOVejsYnG6Qx
         g2cw==
X-Forwarded-Encrypted: i=1; AJvYcCU1qYr15y3M+zyxsRi/qNge2zcvbWkliK3vfIEkeg13aQZPMc/bx7tr0kVbxjYsyCZ4ePHfvDEq7iw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/gD0GtSSQxJu77W+GLhDF77SkMhBUT1nRp/d9ZakUx5nebpA2
	cC1OaNUH9OUcpz0m7GCqFFbC21kg7ivXaBDO6ZrgIFFxPBdy0mhpO+1jyPH5I58=
X-Gm-Gg: ASbGncs3AN5hhA6RD6TmEn3pzKX0xA5gcyHof9caWwzPQejR3rudTs8oxq4S4UPslZf
	cO6ufS46OqO35XJzi7Mra7n/ngFyZoSrCQnEvI3BVBVaRmCxMpZZsViRGIjTfxSPOICo0taoldU
	tIl92v4uIXbSSLLspS7rGscmo+awO69I3tLxawvo61oCER0jAiwNS9Vmsqi2bpPg5ppkgrpVFe1
	BNZmpx4AKn0H2xLXAy4jnzPtMeFI0iEEzxkFnbhLC7tFOMlIV6NmoBqfmSMbo7fatxF3L/Zbwv3
	nLjuB3tTv96iKS/9emw7i3LwsbqOL+qgOuP4Lh459Fnz6cIDyV8UbIojRTHZW58PkV18OJQj6zj
	qom82VIa5N58EY94l6l+wOG8jRK0=
X-Google-Smtp-Source: AGHT+IGySdKlCUCRqIRdMr1m1a7VVzze8sUjh0tF6sp5LZEti5v72rp0jlKeAu4Y6YWVta765Hb6Iw==
X-Received: by 2002:a17:906:4fd4:b0:ac3:b3a3:f19d with SMTP id a640c23a62f3a-acabd3ba32cmr8605966b.43.1744231058840;
        Wed, 09 Apr 2025 13:37:38 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:39 +0100
Subject: [PATCH v4 18/32] mfd: sec: Change device_type to int
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-18-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
index 79b4f74b05a24e413a84ff8c0b16156a828310e5..54c674574c701eec979d8c6a94909b78dcc77065 100644
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
2.49.0.604.gff1f9ca942-goog


