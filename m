Return-Path: <linux-rtc+bounces-4887-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA54B568C9
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 14:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64D6C172D26
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 12:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F303D272E6A;
	Sun, 14 Sep 2025 12:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNtQtBnG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ABA26F445
	for <linux-rtc@vger.kernel.org>; Sun, 14 Sep 2025 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757853766; cv=none; b=uB3Jo2yZpN/gY4gMoQc2wAXs5d9Esv3wqqFHjICURRpUjrVROrxP0lwa8rMZ4/THcrzWIETSQWeGPAgbctrnWT+g4OFNQSJBRsWGWeQxiT70ouZpZVZe/cFuxQ2OMc9roiq92jK7HRzqyBjY9IqOTwr7g/3z00ELVT0I4NNvatQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757853766; c=relaxed/simple;
	bh=dKQqnhIWFdrKicbr+8oW/yxrn+Yu6xMAJ0gurlV7IOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DdxQXjlPOTLwGgGJZNZy2ioYuJN1Oy6KmKa1aoCint6s1c9eZ9E1KtomsmzCjhytgeIlqlHP/gvvsx4z5C/EShpwbZOMVap7nPh5H1Sso/bgPULXHpLG+oCCXD18AFpOZBe0POB+M+yzoboGzENnFhcaeGUdNZDdq0wHz+eWVAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNtQtBnG; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3e7428c4cbdso2234981f8f.0
        for <linux-rtc@vger.kernel.org>; Sun, 14 Sep 2025 05:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757853762; x=1758458562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5y29YsQR0a3S2vDTFMSXyL29PIH6dS+uIhJsTA3ewk=;
        b=fNtQtBnGccezcdOE0+E89bn5wugPCGJC3SirWR24f6C7sLGr/Wic+RD23sBAIVPfnY
         5AKqDHYgDHTeEds0EsOUeiNMz6mQmOSwrsPrzgmFIcCNcOk1354J7dLyj7h/Wf7NPI2p
         Vums0HFRXSBbyPevxkHxoJuUBna2K7z+RYJVEx92dT0QqzEuMUHDZ25X7y3W2ezNawRk
         SKL91kQwbPR4qZJAXL54Mnzx3p3p8u3+T2zOT7Ii4d0cYwZPLsHUJi1nw2zzLh0GBk9O
         0oYifj3LmNxdywCbsK4SD8GEBgPv2lLZWmNUHST+O9QJuKoTNy1V2vjMN3wYKvoflmvK
         xWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757853762; x=1758458562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5y29YsQR0a3S2vDTFMSXyL29PIH6dS+uIhJsTA3ewk=;
        b=f4LTkS13wrSZ9NENlDQm7vhAFCA9jKE3ZyTEn1HoHciGWp1+fbK8vS+VjURRaBfVP0
         Q+020QfpuBzEro3KWkLuGJoiwTyszMPxaByg0E6uicACALr87x+O6z6GjXw4JM6b+bk5
         R+ae8r+P59dbkuCu73Ix88SXD9/7dEqqPCuCPzwjALPScS/LFEp9BDryIFL5Rq9cx/7A
         HvZWgKmSNYZX+x3rQNrlKTZxUwCMaCMNYtJhP/bl3fam32bsuK6JRyBq0yOjArQdiZhQ
         iIVNwSmv+vxkBjBo9OcZ4djOmKm8rFsMEDXSGvpWcUFSxl48xleTfgNS98wOBUh9hLeg
         73hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwYFve6sCfH/2OwHDiX55lOvtsl2JYC0NLBHXazSsQrA292QHTcX6HStBj4iRfD7iw0otN8oIJIaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFGOsvKz5OxIZOv5vp7ze4AEMg1Qa42LU2fVCGZUoc/3QDZhO6
	XgGB7mXhN4OMhAwrbW2YJmqUbTqeK9FyOcqJP/hqF9C/kigngThi+fPk
X-Gm-Gg: ASbGncud4vkWunxCPf1TZ9BSI6jvoyW87IN0pAEYIXl8h1SXNEt5+OL1jtSbJ16eJJ+
	xVI2wIVEq/63eElsMNJlZ09As2K8eXzw7bRyMtb31RCwqXmC+uyQmQS7o5avMvpGS2WOvbeYfgI
	rcz8Dc9SbNuLLXFm4QOLlchyMPvgtoNLnxMeu/R6SJJv1bF+f0mPSOAHcVGcSYtuSADa0l25GR7
	hWclpJrTBSgyl9p7G8xm27CdsLbB28kovddxy33Gm3JbHcsNpA+5st2bnbel95MTBG7KioAX1g2
	CJGHbzhP7P3PIXzR44Xhrg9Ej1t2AXsOltHukQlkbZ9n9BJL095YCcjEt0S2JXWB+slYmp5nNiJ
	70y/lPje1lngeEiPpg+vC7nkQqNUsyn7wjp74rb2jl2+dX8jYpK1g/PdDZ22nDT/NUucFpPig1w
	EeRrZFOqfd
X-Google-Smtp-Source: AGHT+IFPLneFeBWoWeASue/P+y46u0tViNBhr13nDHYaPRoOL4Mw73LLpOUwQyl0q2cx0U/uBXZKig==
X-Received: by 2002:a05:6000:1884:b0:3ea:80ec:8543 with SMTP id ffacd0b85a97d-3ea80ec8823mr552221f8f.5.1757853762463;
        Sun, 14 Sep 2025 05:42:42 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9511abbccsm3727773f8f.9.2025.09.14.05.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:42:42 -0700 (PDT)
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
Subject: [PATCH v1 4/7] mfd: sec: add support for s2mps16 pmic
Date: Sun, 14 Sep 2025 15:42:24 +0300
Message-ID: <20250914124227.2619925-5-ivo.ivanov.ivanov1@gmail.com>
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

Add support for Samsung's s2mps16 pmic. It's the primary PMIC used by
exynos8890 devices. It houses regulators (38 LDOs and 11 BUCKs), three
32.768KHz clock outputs and an RTC device.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/mfd/sec-common.c            |  10 ++
 drivers/mfd/sec-i2c.c               |  16 +++
 drivers/mfd/sec-irq.c               |  46 +++++++
 include/linux/mfd/samsung/core.h    |   1 +
 include/linux/mfd/samsung/irq.h     |  66 ++++++++++
 include/linux/mfd/samsung/s2mps16.h | 195 ++++++++++++++++++++++++++++
 6 files changed, 334 insertions(+)
 create mode 100644 include/linux/mfd/samsung/s2mps16.h

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 42d55e70e..1f21d0d26 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -65,6 +65,12 @@ static const struct mfd_cell s2mps15_devs[] = {
 	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
+static const struct mfd_cell s2mps16_devs[] = {
+	MFD_CELL_NAME("s2mps16-regulator"),
+	MFD_CELL_NAME("s2mps16-rtc"),
+	MFD_CELL_OF("s2mps16-clk", NULL, NULL, 0, 0, "samsung,s2mps16-clk"),
+};
+
 static const struct mfd_cell s2mpa01_devs[] = {
 	MFD_CELL_NAME("s2mpa01-pmic"),
 	MFD_CELL_NAME("s2mps14-rtc"),
@@ -206,6 +212,10 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 		sec_devs = s2mps15_devs;
 		num_sec_devs = ARRAY_SIZE(s2mps15_devs);
 		break;
+	case S2MPS16X:
+		sec_devs = s2mps16_devs;
+		num_sec_devs = ARRAY_SIZE(s2mps16_devs);
+		break;
 	case S2MPU02:
 		sec_devs = s2mpu02_devs;
 		num_sec_devs = ARRAY_SIZE(s2mpu02_devs);
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 3132b849b..6b0a8e927 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -16,6 +16,7 @@
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
 #include <linux/mfd/samsung/s2mps15.h>
+#include <linux/mfd/samsung/s2mps16.h>
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/mod_devicetable.h>
@@ -116,6 +117,15 @@ static const struct regmap_config s2mps15_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static const struct regmap_config s2mps16_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = S2MPS16_REG_VTH_OFFSET,
+	.volatile_reg = s2mps11_volatile,
+	.cache_type = REGCACHE_FLAT,
+};
+
 static const struct regmap_config s2mpu02_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -193,6 +203,11 @@ static const struct sec_pmic_i2c_platform_data s2mps15_data = {
 	.device_type = S2MPS15X,
 };
 
+static const struct sec_pmic_i2c_platform_data s2mps16_data = {
+	.regmap_cfg = &s2mps16_regmap_config,
+	.device_type = S2MPS16X,
+};
+
 static const struct sec_pmic_i2c_platform_data s2mpu02_data = {
 	.regmap_cfg = &s2mpu02_regmap_config,
 	.device_type = S2MPU02,
@@ -215,6 +230,7 @@ static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	{ .compatible = "samsung,s2mps13-pmic", .data = &s2mps13_data, },
 	{ .compatible = "samsung,s2mps14-pmic", .data = &s2mps14_data, },
 	{ .compatible = "samsung,s2mps15-pmic", .data = &s2mps15_data, },
+	{ .compatible = "samsung,s2mps16-pmic", .data = &s2mps16_data, },
 	{ .compatible = "samsung,s2mpu02-pmic", .data = &s2mpu02_data, },
 	{ .compatible = "samsung,s2mpu05-pmic", .data = &s2mpu05_data, },
 	{ .compatible = "samsung,s5m8767-pmic", .data = &s5m8767_data, },
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index c5c80b1ba..c0bdc4314 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -116,6 +116,39 @@ static const struct regmap_irq s2mps14_irqs[] = {
 	REGMAP_IRQ_REG(S2MPS14_IRQ_TSD, 2, S2MPS14_IRQ_TSD_MASK),
 };
 
+static const struct regmap_irq s2mps16_irqs[] = {
+	REGMAP_IRQ_REG(S2MPS16_IRQ_PWRONF, 0, S2MPS16_IRQ_PWRONF_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_PWRONR, 0, S2MPS16_IRQ_PWRONR_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_JIGONBF, 0, S2MPS16_IRQ_JIGONBF_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_JIGONBR, 0, S2MPS16_IRQ_JIGONBR_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_ACOKBF, 0, S2MPS16_IRQ_ACOKBF_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_ACOKBR, 0, S2MPS16_IRQ_ACOKBR_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_PWRON1S, 0, S2MPS16_IRQ_PWRON1S_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_MRB, 0, S2MPS16_IRQ_MRB_MASK),
+
+	REGMAP_IRQ_REG(S2MPS16_IRQ_RTC60S, 1, S2MPS16_IRQ_RTC60S_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_RTCA1, 1, S2MPS16_IRQ_RTCA1_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_RTCA0, 1, S2MPS16_IRQ_RTCA0_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_SMPL, 1, S2MPS16_IRQ_SMPL_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_RTC1S, 1, S2MPS16_IRQ_RTC1S_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_WTSR, 1, S2MPS16_IRQ_WTSR_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_WRSTB, 1, S2MPS16_IRQ_WRSTB_MASK),
+
+	REGMAP_IRQ_REG(S2MPS16_IRQ_INT120C, 2, S2MPS16_IRQ_INT120C_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_INT140C, 2, S2MPS16_IRQ_INT140C_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_TSD, 2, S2MPS16_IRQ_TSD_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_ADCDONE, 2, S2MPS16_IRQ_ADCDONE_MASK),
+
+	REGMAP_IRQ_REG(S2MPS16_IRQ_OC0, 3, S2MPS16_IRQ_OC0_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_OC1, 3, S2MPS16_IRQ_OC1_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_OC2, 3, S2MPS16_IRQ_OC2_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_OC3, 3, S2MPS16_IRQ_OC3_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_OC4, 3, S2MPS16_IRQ_OC4_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_OC5, 3, S2MPS16_IRQ_OC5_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_OC6, 3, S2MPS16_IRQ_OC6_MASK),
+	REGMAP_IRQ_REG(S2MPS16_IRQ_OC7, 3, S2MPS16_IRQ_OC7_MASK),
+};
+
 static const struct regmap_irq s2mpu02_irqs[] = {
 	REGMAP_IRQ_REG(S2MPU02_IRQ_PWRONF, 0, S2MPS11_IRQ_PWRONF_MASK),
 	REGMAP_IRQ_REG(S2MPU02_IRQ_PWRONR, 0, S2MPS11_IRQ_PWRONR_MASK),
@@ -223,6 +256,16 @@ static const struct regmap_irq_chip s2mps15_irq_chip = {
 	S2MPS1X_IRQ_CHIP_COMMON_DATA,
 };
 
+static const struct regmap_irq_chip s2mps16_irq_chip = {
+	.name = "s2mps16",
+	.irqs = s2mps16_irqs,
+	.num_irqs = ARRAY_SIZE(s2mps16_irqs),
+	.num_regs = 4,
+	.status_base = S2MPS14_REG_INT1,
+	.mask_base = S2MPS11_REG_INT1M,
+	.ack_base = S2MPS11_REG_INT1,
+};
+
 static const struct regmap_irq_chip s2mpu02_irq_chip = {
 	.name = "s2mpu02",
 	.irqs = s2mpu02_irqs,
@@ -282,6 +325,9 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	case S2MPS15X:
 		sec_irq_chip = &s2mps15_irq_chip;
 		break;
+	case S2MPS16X:
+		sec_irq_chip = &s2mps16_irq_chip;
+		break;
 	case S2MPU02:
 		sec_irq_chip = &s2mpu02_irq_chip;
 		break;
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index d785e101f..d99fa609f 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -44,6 +44,7 @@ enum sec_device_type {
 	S2MPS13X,
 	S2MPS14X,
 	S2MPS15X,
+	S2MPS16X,
 	S2MPU02,
 	S2MPU05,
 };
diff --git a/include/linux/mfd/samsung/irq.h b/include/linux/mfd/samsung/irq.h
index b4805cbd9..e62d00188 100644
--- a/include/linux/mfd/samsung/irq.h
+++ b/include/linux/mfd/samsung/irq.h
@@ -226,6 +226,72 @@ enum s2mps14_irq {
 	S2MPS14_IRQ_NR,
 };
 
+enum s2mps16_irq {
+	S2MPS16_IRQ_PWRONF,
+	S2MPS16_IRQ_PWRONR,
+	S2MPS16_IRQ_JIGONBF,
+	S2MPS16_IRQ_JIGONBR,
+	S2MPS16_IRQ_ACOKBF,
+	S2MPS16_IRQ_ACOKBR,
+	S2MPS16_IRQ_PWRON1S,
+	S2MPS16_IRQ_MRB,
+
+	S2MPS16_IRQ_RTC60S,
+	S2MPS16_IRQ_RTCA1,
+	S2MPS16_IRQ_RTCA0,
+	S2MPS16_IRQ_SMPL,
+	S2MPS16_IRQ_RTC1S,
+	S2MPS16_IRQ_WTSR,
+	S2MPS16_IRQ_WRSTB,
+
+	S2MPS16_IRQ_INT120C,
+	S2MPS16_IRQ_INT140C,
+	S2MPS16_IRQ_TSD,
+	S2MPS16_IRQ_ADCDONE,
+
+	S2MPS16_IRQ_OC0,
+	S2MPS16_IRQ_OC1,
+	S2MPS16_IRQ_OC2,
+	S2MPS16_IRQ_OC3,
+	S2MPS16_IRQ_OC4,
+	S2MPS16_IRQ_OC5,
+	S2MPS16_IRQ_OC6,
+	S2MPS16_IRQ_OC7,
+
+	S2MPS16_IRQ_NR,
+};
+
+#define S2MPS16_IRQ_PWRONF_MASK		BIT(0)
+#define S2MPS16_IRQ_PWRONR_MASK		BIT(1)
+#define S2MPS16_IRQ_JIGONBF_MASK	BIT(2)
+#define S2MPS16_IRQ_JIGONBR_MASK	BIT(3)
+#define S2MPS16_IRQ_ACOKBF_MASK		BIT(4)
+#define S2MPS16_IRQ_ACOKBR_MASK		BIT(5)
+#define S2MPS16_IRQ_PWRON1S_MASK	BIT(6)
+#define S2MPS16_IRQ_MRB_MASK		BIT(7)
+
+#define S2MPS16_IRQ_RTC60S_MASK		BIT(0)
+#define S2MPS16_IRQ_RTCA1_MASK		BIT(1)
+#define S2MPS16_IRQ_RTCA0_MASK		BIT(2)
+#define S2MPS16_IRQ_SMPL_MASK		BIT(3)
+#define S2MPS16_IRQ_RTC1S_MASK		BIT(4)
+#define S2MPS16_IRQ_WTSR_MASK		BIT(5)
+#define S2MPS16_IRQ_WRSTB_MASK		BIT(7)
+
+#define S2MPS16_IRQ_INT120C_MASK	BIT(0)
+#define S2MPS16_IRQ_INT140C_MASK	BIT(1)
+#define S2MPS16_IRQ_TSD_MASK		BIT(2)
+#define S2MPS16_IRQ_ADCDONE_MASK	BIT(7)
+
+#define S2MPS16_IRQ_OC0_MASK		BIT(0)
+#define S2MPS16_IRQ_OC1_MASK		BIT(1)
+#define S2MPS16_IRQ_OC2_MASK		BIT(2)
+#define S2MPS16_IRQ_OC3_MASK		BIT(3)
+#define S2MPS16_IRQ_OC4_MASK		BIT(4)
+#define S2MPS16_IRQ_OC5_MASK		BIT(5)
+#define S2MPS16_IRQ_OC6_MASK		BIT(6)
+#define S2MPS16_IRQ_OC7_MASK		BIT(7)
+
 enum s2mpu02_irq {
 	S2MPU02_IRQ_PWRONF,
 	S2MPU02_IRQ_PWRONR,
diff --git a/include/linux/mfd/samsung/s2mps16.h b/include/linux/mfd/samsung/s2mps16.h
new file mode 100644
index 000000000..d4394b054
--- /dev/null
+++ b/include/linux/mfd/samsung/s2mps16.h
@@ -0,0 +1,195 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (c) 2012 Samsung Electronics Co., Ltd
+ * Copyright (c) 2025 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ */
+
+#ifndef __LINUX_MFD_S2MPS16_H
+#define __LINUX_MFD_S2MPS16_H
+
+/* S2MPS16 registers */
+enum S2MPS16_reg {
+	S2MPS16_REG_ID,
+	S2MPS16_REG_INT1,
+	S2MPS16_REG_INT2,
+	S2MPS16_REG_INT3,
+	S2MPS16_REG_INT4,
+	S2MPS16_REG_INT1M,
+	S2MPS16_REG_INT2M,
+	S2MPS16_REG_INT3M,
+	S2MPS16_REG_INT4M,
+	S2MPS16_REG_ST1,
+	S2MPS16_REG_ST2,
+	S2MPS16_REG_PWRONSRC,
+	S2MPS16_REG_OFFSRC,
+	S2MPS16_REG_BU_CHG,
+	S2MPS16_REG_RTC_BUF,
+	S2MPS16_REG_CTRL1,
+	S2MPS16_REG_CTRL2,
+	S2MPS16_REG_ETC_TEST,
+	S2MPS16_REG_OTP_ADRL,
+	S2MPS16_REG_OTP_ADRH,
+	S2MPS16_REG_OTP_DATA,
+	S2MPS16_REG_CTRL3,
+	S2MPS16_REG_ETC_OTP,
+	S2MPS16_REG_UVLO_OTP,
+	S2MPS16_REG_CFG1,
+	S2MPS16_REG_CFG2,
+	S2MPS16_REG_B1CTRL1,
+	S2MPS16_REG_B1CTRL2,
+	S2MPS16_REG_B2CTRL1,
+	S2MPS16_REG_B2CTRL2,
+	S2MPS16_REG_B3CTRL1,
+	S2MPS16_REG_B3CTRL2,
+	S2MPS16_REG_B4CTRL1,
+	S2MPS16_REG_B4CTRL2,
+	S2MPS16_REG_B5CTRL1,
+	S2MPS16_REG_B5CTRL2,
+	S2MPS16_REG_B6CTRL1,
+	S2MPS16_REG_B6CTRL2,
+	S2MPS16_REG_B6CTRL3,
+	S2MPS16_REG_B7CTRL1,
+	S2MPS16_REG_B7CTRL2,
+	S2MPS16_REG_B8CTRL1,
+	S2MPS16_REG_B8CTRL2,
+	S2MPS16_REG_B9CTRL1,
+	S2MPS16_REG_B9CTRL2,
+	/* buck10 is used for CP */
+	S2MPS16_REG_B11CTRL1 = 0x30,
+	S2MPS16_REG_B11CTRL2,
+	S2MPS16_REG_BB1CTRL1,
+	S2MPS16_REG_BB1CTRL2,
+	S2MPS16_REG_BUCK_RAMP,
+	S2MPS16_REG_LDO7_DVS,
+	S2MPS16_REG_LDO8_DVS,
+	S2MPS16_REG_LDO9_DVS,
+	S2MPS16_REG_LDO10_DVS,
+	S2MPS16_REG_LDO11_DVS,
+	S2MPS16_REG_L1CTRL,
+	S2MPS16_REG_L2CTRL,
+	S2MPS16_REG_L3CTRL,
+	S2MPS16_REG_L4CTRL,
+	S2MPS16_REG_L5CTRL,
+	S2MPS16_REG_L6CTRL,
+	S2MPS16_REG_L7CTRL,
+	S2MPS16_REG_L8CTRL,
+	S2MPS16_REG_L9CTRL,
+	S2MPS16_REG_L10CTRL,
+	S2MPS16_REG_L11CTRL,
+	S2MPS16_REG_L12CTRL,
+	S2MPS16_REG_L13CTRL,
+	/* ldo14 to 24 are used for CP */
+	S2MPS16_REG_L25CTRL = 0x55,
+	S2MPS16_REG_L26CTRL,
+	S2MPS16_REG_L27CTRL,
+	S2MPS16_REG_L28CTRL,
+	S2MPS16_REG_L29CTRL,
+	S2MPS16_REG_L30CTRL,
+	S2MPS16_REG_L31CTRL,
+	S2MPS16_REG_L32CTRL,
+	S2MPS16_REG_L33CTRL,
+	S2MPS16_REG_L34CTRL,
+	S2MPS16_REG_L35CTRL,
+	S2MPS16_REG_L36CTRL,
+	S2MPS16_REG_L37CTRL,
+	S2MPS16_REG_L38CTRL,
+	S2MPS16_REG_LDO_DSCH,
+	S2MPS16_REG_LDO_CTRL0,
+	S2MPS16_REG_LDO_CTRL1,
+	S2MPS16_REG_LDO_CTRL2,
+	S2MPS16_REG_LDO_OCP,
+	S2MPS16_REG_IOCONF,
+	S2MPS16_REG_AVP,
+	S2MPS16_REG_ADC_CTRL1,
+	S2MPS16_REG_ADC_CTRL2,
+	S2MPS16_REG_ADC_DATA,
+	S2MPS16_REG_TCXO_CTRL,
+	S2MPS16_REG_SELMIF,
+	S2MPS16_REG_SQE_CTRL,
+	S2MPS16_REG_VTH_OFFSET = 0xFF,
+};
+
+/* S2MPS16 regulator ids */
+enum S2MPS16_regulators {
+	S2MPS16_LDO1,
+	S2MPS16_LDO2,
+	S2MPS16_LDO3,
+	S2MPS16_LDO4,
+	S2MPS16_LDO5,
+	S2MPS16_LDO6,
+	S2MPS16_LDO7,
+	S2MPS16_LDO8,
+	S2MPS16_LDO9,
+	S2MPS16_LDO10,
+	S2MPS16_LDO11,
+	S2MPS16_LDO12,
+	S2MPS16_LDO13,
+	/* ldo14 to 24 are used for CP */
+	S2MPS16_LDO25,
+	S2MPS16_LDO26,
+	S2MPS16_LDO27,
+	S2MPS16_LDO28,
+	S2MPS16_LDO29,
+	S2MPS16_LDO30,
+	S2MPS16_LDO31,
+	S2MPS16_LDO32,
+	S2MPS16_LDO33,
+	S2MPS16_LDO34,
+	S2MPS16_LDO35,
+	S2MPS16_LDO36,
+	S2MPS16_LDO37,
+	S2MPS16_LDO38,
+	S2MPS16_BUCK1,
+	S2MPS16_BUCK2,
+	S2MPS16_BUCK3,
+	S2MPS16_BUCK4,
+	S2MPS16_BUCK5,
+	S2MPS16_BUCK6,
+	S2MPS16_BUCK7,
+	S2MPS16_BUCK8,
+	S2MPS16_BUCK9,
+	/* buck10 is used for CP */
+	S2MPS16_BUCK11,
+	S2MPS16_REG_MAX,
+};
+
+#define S2MPS16_BUCK_MIN1		300000
+#define S2MPS16_BUCK_MIN2		600000
+#define S2MPS16_BUCK_MIN3		2600000
+#define S2MPS16_BUCK_STEP1		6250
+#define S2MPS16_BUCK_STEP2		12500
+
+#define S2MPS16_LDO_MIN1		300000
+#define S2MPS16_LDO_MIN2		500000
+#define S2MPS16_LDO_MIN3		700000
+#define S2MPS16_LDO_MIN4		1800000
+#define S2MPS16_LDO_STEP1		12500
+#define S2MPS16_LDO_STEP2		25000
+
+#define S2MPS16_ENABLE_SHIFT		0x06
+#define S2MPS16_LDO_VSEL_MASK		0x3F
+#define S2MPS16_BUCK_VSEL_MASK		0xFF
+#define S2MPS16_ENABLE_MASK		(0x03 << S2MPS16_ENABLE_SHIFT)
+#define S2MPS16_LDO_N_VOLTAGES		(S2MPS16_LDO_VSEL_MASK + 1)
+#define S2MPS16_BUCK_N_VOLTAGES		(S2MPS16_BUCK_VSEL_MASK + 1)
+
+#define S2MPS16_BUCK_RAMP_SHIFT1	6
+#define S2MPS16_BUCK_RAMP_SHIFT2	4
+#define S2MPS16_BUCK_RAMP_SHIFT3	2
+#define S2MPS16_BUCK_RAMP_SHIFT4	0
+#define S2MPS16_BUCK_RAMP_MASK		0x3
+
+#define S2MPS16_ENABLE_TIME_LDO		128
+#define S2MPS16_ENABLE_TIME_BUCK1	95
+#define S2MPS16_ENABLE_TIME_BUCK2	95
+#define S2MPS16_ENABLE_TIME_BUCK3	95
+#define S2MPS16_ENABLE_TIME_BUCK4	95
+#define S2MPS16_ENABLE_TIME_BUCK5	95
+#define S2MPS16_ENABLE_TIME_BUCK6	128
+#define S2MPS16_ENABLE_TIME_BUCK7	95
+#define S2MPS16_ENABLE_TIME_BUCK8	106
+#define S2MPS16_ENABLE_TIME_BUCK9	150
+#define S2MPS16_ENABLE_TIME_BUCK10	95
+#define S2MPS16_ENABLE_TIME_BUCK11	95
+
+#endif /*  __LINUX_MFD_S2MPS16_H */
-- 
2.43.0


