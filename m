Return-Path: <linux-rtc+bounces-4757-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5BBB34882
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Aug 2025 19:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 075911A835E6
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Aug 2025 17:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF21304BBB;
	Mon, 25 Aug 2025 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ypETvari"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A17302753
	for <linux-rtc@vger.kernel.org>; Mon, 25 Aug 2025 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756142470; cv=none; b=Ps9uc23puVe9bmzHGetACe1O7Vd2VvMMq0Rc1rhfbLJK+fBQbdueDfRd3J8k4GOzIdAx7n226sVUuc3T2Q6Bp7ZQas8a9Ll/NLRbb3w3BQ3DtO59OTkWe3nkv2D86f7naBAZd0Ah6fDsSo1G1JKZH3+/HJ88+YRmiVgZv6nKt08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756142470; c=relaxed/simple;
	bh=kLbEyV4+fFyC+TUqNZrAw1uQ1gefiZUYe69lZaahSEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BiuE52oEylbsANNJYaWXiy/mJAXwQ6Ud7M6OtvZmllkWF/1du2FgF2zdTkQfhhSNTzbIBKnb8+iS+p7yvPgs6BNXey6v7qPZJYieqryOlz3V8o2RTHxRr8Nn9VJemIQckFTF3LoVgpi6gCA2K/m6nz8cMs/95SHBA0/S3kOaiVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ypETvari; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-88432ccadeaso399664039f.0
        for <linux-rtc@vger.kernel.org>; Mon, 25 Aug 2025 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756142466; x=1756747266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0sFVnEsjQI8DSCz2p8AAK/l9KvhsbeOnyoF33jmhL4=;
        b=ypETvariMS+qOLk4hmMTSJXV6VuE2moYdA02khE7EyYxSyv2NFMKubpdlD1Tf2OMdl
         0MmCFlAAdMuGpsbezSysgEK4sUWZCE911mPyRazd/aXLRJoDCRstz+z09/KE3oW3MLRY
         vuUf1Y2ljJ+qnKCgUcFv2C6u/xuHpSf3WxUYx40fcj5x93edLtahpjuqmd5PU5+HIWPR
         c+eMZFwuMMKXyYL66OiZYgzzstSVzG/HGTEcRHfx3iWUrmk7fTWWUp6PiRSgsLqisQSh
         9mBFtzy80Njg00nFU5Xa0EdkHLX/ymRUjo7GbMcXpgLrayRUEGbYuf4kTDUo8y5SuxeP
         E4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142466; x=1756747266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0sFVnEsjQI8DSCz2p8AAK/l9KvhsbeOnyoF33jmhL4=;
        b=NxGN0g8PIkD5rwypqJa8a34IMIve6MoZXkFr6DJzbhfMxmcXVlkhnoWh8E/Mg1J5Vc
         HETzo23v5akCgG4vtNaa7RxJ/XY75quiJ0BsFBRp1WC4gkTMNKsuitGXtQkUyFgPuWwn
         zwaiDRXm0UhG7d4ofI0aXsa+Ow2AS4wyffa+4Uq3R2X5yNeUrm8xHGrdo8Q7auIQU5NN
         pVRLRqaNwIVTdLgAP0OanhA3IFcMamGDc/v7bOsjDcjpk4QJgCMS+hFfV4C5750wCT1Z
         KOB0GMuIY951QMMTio9hZWvUDo4HYbD3PUp8dl4oE4aZStoSRkC9MxHIYOQuNMBIcLlm
         WLfw==
X-Forwarded-Encrypted: i=1; AJvYcCXrZyPoIb1gcF6pRcV+aVF9f+jnzqbExq95W86FrCyFx/CoJAo+KKnehcdIIkzd05NDBnfEj5V6MsM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhsI0HgORND1iuH8cATmjsT5A3Pa2hLcLiSOuooqLyvfyqqG8U
	SF+hmWgiDDb/P1XoxoSsylCjTVGQFdpvLzJ4HtYU95AL2iZjHA8VSiR082wo534w+gM=
X-Gm-Gg: ASbGnctzU15fBPvxaeZ+JcnNcSOmDl72Qk2nqiYd6vXz1CTFOwc6t2dlkvOWAc5d0d2
	l68bbRzZTOrFsUUJIvfaVbQLQjdfeO9MfUCQGdasI8PkfKEResc5Gu8FbNrV8IZQ2GyLZIoLsxK
	BA1/t4MIm0YtOtb5GArN0aPgc3c/ybzajmKrnK1zn33kQ8jbouIL3vBPr6Oct8Lg7BTvV6z67im
	IGaqRG4NCDwgNM9pPzuGVVJ39u33rQDThkoOcQkvbLV6yL1CqNIxw2Jl1v8+pGMFYrHOnfpSDkJ
	t894WSBo6io+1O4yQw5/CCAhkQMo9HZ9p1BTJKarVb+lkfluObUqLKc4AebgF8sdByLOM68JSRD
	aLDwVWA8xwBOrtkki1zcHos5UAlw3eEwXnq2ryjWwlisnVKh+cK0oJRBgtK47viwD6A==
X-Google-Smtp-Source: AGHT+IGWgOuFATu1r9Jbw0eEl71eCRbkbibShP98TgfmuQSt5odlFDdF/6MhlxOuqMidvthIxLdvqg==
X-Received: by 2002:a05:6602:2c13:b0:886:eac3:d5d with SMTP id ca18e2360f4ac-886eac30eb2mr130369839f.2.1756142466361;
        Mon, 25 Aug 2025 10:21:06 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886e60c4737sm76275439f.26.2025.08.25.10.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:21:06 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Mon, 25 Aug 2025 12:20:51 -0500
Message-ID: <20250825172057.163883-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable support for the RTC and regulators found in the SpacemiT P1
PMIC.  Support is implemented by the simple I2C MFD driver.

The P1 PMIC is normally implemented with the SpacemiT K1 SoC.  This
PMIC provides 6 buck converters and 12 LDO regulators.  It also
implements a switch, watchdog timer, real-time clock, and more.
Initially its RTC and regulators are supported.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v13: - Have MFD_SPACEMIT_P1 depend on ARCH_SPACEMIT and select I2C_K1

 drivers/mfd/Kconfig          | 13 +++++++++++++
 drivers/mfd/simple-mfd-i2c.c | 17 +++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index a403a3daedd52..e5cdefbea71a1 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1238,6 +1238,19 @@ config MFD_QCOM_RPM
 	  Say M here if you want to include support for the Qualcomm RPM as a
 	  module. This will build a module called "qcom_rpm".
 
+config MFD_SPACEMIT_P1
+	tristate "SpacemiT P1 PMIC"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on I2C
+	select I2C_K1
+	select MFD_SIMPLE_MFD_I2C
+	help
+	  This option supports the I2C-based SpacemiT P1 PMIC, which
+	  contains regulators, a power switch, GPIOs, an RTC, and more.
+	  This option is selected when any of the supported sub-devices
+	  is configured.  The basic functionality is implemented by the
+	  simple MFD I2C driver.
+
 config MFD_SPMI_PMIC
 	tristate "Qualcomm SPMI PMICs"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index f7798bd922224..63ac263888606 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -93,6 +93,22 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
 	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
 };
 
+static const struct regmap_config spacemit_p1_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static const struct mfd_cell spacemit_p1_cells[] = {
+	{ .name = "spacemit-p1-regulator", },
+	{ .name = "spacemit-p1-rtc", },
+};
+
+static const struct simple_mfd_data spacemit_p1 = {
+	.regmap_config = &spacemit_p1_regmap_config,
+	.mfd_cell = spacemit_p1_cells,
+	.mfd_cell_size = ARRAY_SIZE(spacemit_p1_cells),
+};
+
 static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "kontron,sl28cpld" },
 	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a},
@@ -101,6 +117,7 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
 	{ .compatible = "fsl,lx2160aqds-fpga" },
 	{ .compatible = "fsl,ls1028aqds-fpga" },
+	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
-- 
2.48.1


