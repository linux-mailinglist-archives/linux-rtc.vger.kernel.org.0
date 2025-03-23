Return-Path: <linux-rtc+bounces-3587-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6B7A6D1D0
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B7E83AA115
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AF61EF0B9;
	Sun, 23 Mar 2025 22:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dB1iE6ev"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEB61EA7CF
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769584; cv=none; b=RaMiNJZL/pVQ51VWFkLUzYnImXC80cX1czpN6NgwmHIHZKdjTSVodJTJ888ukUg9Ohwnz80/yf7QeoBbSurHR09UjpmcXCJXmw1L4f2YyurkbXg/0CGc138jIfPF1CscZz6RJMWn5yp9aKzNsxdxx8igcpgRzrmF6RZ9HtBmCQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769584; c=relaxed/simple;
	bh=1ZMTtP1qVi1tJ/1EB9YA8Rc5n3WQtvstvVzHXtqGWW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RE0HCjwxsJGolb+2zlc+pVaO4ixHk3vOLhwn0dNoBt8uQItF+qGky9H85UJPOqbKiPVfWQPuC/eUUReVkLxoxmA2qi6M4T3sf/lXkKIwl+IuRuA4ObvbQkwBnle/q9vTT7PL6Msezc6NqUOccHcXukPqNaob7lzbS3t5cmuKCD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dB1iE6ev; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso560754966b.0
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769576; x=1743374376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3Twc2HyOCZXfu7bqwpcMcsjD+r2Ct4/gngHvFw4saQ=;
        b=dB1iE6ev4AD20dD52kXI24mJnY9pMKdKJJr9Io2uuhBIPGggpbTdxFgzL0ZV43MD8X
         XgKF8cXHjmqSdtBnF9NUSlRvReDBGwJpZOHtuE80ybI5r+NeQolA5eNw7g/050GRZ1m6
         Rj6FU6bEbf8VyE86XaIYhN+xGUclkOHe1fLwiOT9rL9Jm1aunrUdogQRd6pLsLM6LC3s
         48RmBgWW6MZlyHHTNtW73qR3XwPnXyEmQ2bxthQtNcW0c7w0bvYXd8S1Btb8ieOqkIol
         0r/R99/L8ySiw45X79zfOkRV+stnUUToXkQjtGOXgSnM8Ubl1hPDcfin8glnWGgq97Tj
         Ym8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769576; x=1743374376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3Twc2HyOCZXfu7bqwpcMcsjD+r2Ct4/gngHvFw4saQ=;
        b=iFN/72RE7gH+YiKxnL8trYoSnBgYwL+/2pE3nF8rPxgZAhR830AvueVncrgmPLFt2L
         T9mO9s23ddlmwrcabiljrjM7HgBhimQdWCEsp8b6KTGV4TesUW5O6IwdLM8cJLBCstma
         zm9ogNYZv9ToSTplh1vQoWxKtPFUT779/nlXcQObHhRLCYGRcobY+baZ6V3AIw/lHF0p
         RM4qfq/kSP7rd8H1cBQ8MPcIoKOTgDYsaoh3b7uoBB0TFI6IDsiLFkjELvN0pc2GdYxz
         Ez/caivGQPxsUFT2ZtAA+WbZfezoV7jz2Tfm2ZWKYY6CJwLc0VI3Lm2wcrqxHy91Jip+
         eufQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/L2mQPy1gigQr+D+DnWYGmRl47iQnMlXabB6hIE0SjYW/FkwgWhzWUlRWjVa8xOb567mxYPgAFcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvVFKtnfZunuMEeU+iYD5G4mSc2Rt20HUHI7fLxTGWakhp/qXF
	2EKtrLCo8WVsRIXbKzDIXEjp131WgTZcQ1sqV15+tKMkpLPyLN0AMiqROHEWqBI=
X-Gm-Gg: ASbGncthqJ+m9aJwFzf161kQfuY0gIgHJod5Ke7cC7u2czCqPBSr/5dQywjTvJrpmlX
	2tKd7hbSKmEWWV85OC0M0alb235hpFhpoLA0moOmmPlUtwSPTKuIwwn3TSkMoS3aj2R8gRLy8uh
	idHoEODiG5H5jmLm9Udj5AqjfRnsekCcV0k+SJ4JBoDQ05qccc/YfSCz4qQIDjQ0Xv6xwiXzKAL
	4s7zqNqSxNU8xKVcNSmqnWz3AEyDm/UGtnsLRfAOgEEeO5bItPK/qokhlr3VBuDnycV6tWdIzAi
	9Pq0r6Maq5H4+OA21lclulz3ehmsq+bcFeh405a/4+ZnLp6zVrqmZ497nq5tpkuCt06AsGLnAPT
	K6G9hhlY+fG4ttaBJu3Uo5Qcf4VGy
X-Google-Smtp-Source: AGHT+IGQ8L6LLeC0zwpvMlguGkzr2gQM+jg2bpgKU+l+fqanTCryHJuZychWrZmnRDXRMuRhkKJXmw==
X-Received: by 2002:a17:907:7f92:b0:abf:8f56:fe76 with SMTP id a640c23a62f3a-ac3f22b43c4mr975457666b.25.1742769576042;
        Sun, 23 Mar 2025 15:39:36 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:35 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:37 +0000
Subject: [PATCH 21/34] mfd: sec: change device_type to int
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-21-d08943702707@linaro.org>
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

Now that sec-i2c doesn't match device type by pointer casting anymore,
we can switch the device type from unsigned long to int easily.

This saves a few bytes in struct sec_pmic_dev due to member alignment.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c         | 8 ++++----
 drivers/mfd/sec-core.h           | 4 ++--
 drivers/mfd/sec-i2c.c            | 2 +-
 drivers/mfd/sec-irq.c            | 5 ++---
 include/linux/mfd/samsung/core.h | 2 +-
 5 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index bec8f93a03f7fd794beade563d73610534cb96b2..48d5c9a23230d0927b9dc610166ae3f8f1aec924 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -129,8 +129,8 @@ static void sec_pmic_configure(struct sec_pmic_dev *sec_pmic)
 	}
 }
 
-int sec_pmic_probe(struct device *dev, unsigned long device_type,
-		   unsigned int irq, struct regmap *regmap,
+int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
+		   struct regmap *regmap,
 		   const struct sec_pmic_probe_data *probedata,
 		   struct i2c_client *client)
 {
@@ -214,7 +214,7 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 		break;
 	default:
 		return dev_err_probe(sec_pmic->dev, -EINVAL,
-				     "Unsupported device type %lu\n",
+				     "Unsupported device type %d\n",
 				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
@@ -248,7 +248,7 @@ void sec_pmic_shutdown(struct device *dev)
 		 * ignore the rest.
 		 */
 		dev_warn(sec_pmic->dev,
-			"Unsupported device %lu for manual power off\n",
+			"Unsupported device %d for manual power off\n",
 			sec_pmic->device_type);
 		return;
 	}
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
index 58e5b645f377cea5543a215c05957a2c49239a6f..34a801144a47bcdb5472ce5548bcef0fe3f0926f 100644
--- a/drivers/mfd/sec-core.h
+++ b/drivers/mfd/sec-core.h
@@ -21,8 +21,8 @@ struct sec_pmic_probe_data {
 	bool disable_wrstbi;
 };
 
-int sec_pmic_probe(struct device *dev, unsigned long device_type,
-		   unsigned int irq, struct regmap *regmap,
+int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
+		   struct regmap *regmap,
 		   const struct sec_pmic_probe_data *probedata,
 		   struct i2c_client *client);
 void sec_pmic_shutdown(struct device *dev);
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 9f33d4569cf73461c57d101f6ca1cf2b75f22b4d..760dd89b62a1639013c9e51b6e1a7376f15ac504 100644
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
index dc5560a0c496917e847a40295c53e3f762b60998..cf1add30dcd0ff1ad149b483fe40edf82c2b57e1 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -450,10 +450,9 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
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
@@ -485,7 +484,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
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
2.49.0.395.g12beb8f557-goog


