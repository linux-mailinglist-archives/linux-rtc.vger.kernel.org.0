Return-Path: <linux-rtc+bounces-4357-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37042AE8A1B
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Jun 2025 18:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AE201658D6
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Jun 2025 16:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6494D2D4B67;
	Wed, 25 Jun 2025 16:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="AbgM+knz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B0A2D540A
	for <linux-rtc@vger.kernel.org>; Wed, 25 Jun 2025 16:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869689; cv=none; b=mQTdjff+X1r9oQBF7Q2xGtVUp9rEBfP9dvyLHDgDnIw0F+TIEnplmYDEGbpf4lPn5PW6zZFVarfWyJhtRP1zjOmXLkt6NIUiLv0uQNX5SLN/L9Py4A0kxIfxSo5dz6UB3bbrEOSvkvsBkuRQBcdZGGuSdfI+8byOwqDFmvLEOXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869689; c=relaxed/simple;
	bh=3NwBP3VAjPu7EVZaVzYEgfspykpp/rccLhvU9/CZmWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OCfUSyJ7IlvW7N0oa2fmCWHSsisW3JAcLO3ep4kT0PPs+UFc6k+yjw4vTZfFjKTTtUjuYIdQ0l2+LILaydsmXtknRqDjVmEhMvsbVKD0rK43yOtbXE2jKnqfrk5Mp3j1zpmlZJBf+l2Ltsvjnudq48LimtGSEDKeQAgj6nriNeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=AbgM+knz; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fabe9446a0so1584286d6.2
        for <linux-rtc@vger.kernel.org>; Wed, 25 Jun 2025 09:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869686; x=1751474486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiYMAk+n2KFVeD6iTdiytYbReYUGJB4T1awuY5N83BA=;
        b=AbgM+knzYnIspw/vVzBC5ovKRwag2XnwMU3H4mBJExK8d/9Z/nnDhZSrxZdWwXq4AR
         SDiVZ6O5nq3EgUnMnOy5zK3ZQmg3P5uWfUgaCSXcBfOi0SZnmBYTBfsoahegA643myr8
         /zKGEvi23Azq1p44+5qxuiobt04bwqWAVJerjqSr3gBYv9gdsS7KANXeGjVT94nI2SOK
         KrYF7ACTqTTRAG/eEQGbq5h1gzO4pGmQyLyEhwXIwW8vEB0pGEq/urmRq2tg1IPuxGv+
         nFpE6232fhed3SJfcdlgWffpY68z4y33bCnxwFbmnNdWr3abENZziQCMiZvgJ7oK2cMw
         hg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869686; x=1751474486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiYMAk+n2KFVeD6iTdiytYbReYUGJB4T1awuY5N83BA=;
        b=iZX6zbBcPddahslUVXAeVbUgFB/Qoe039Y/e3EEkGV2noyxVAs4U0G0CAkQtf3VtWQ
         eNw5R14s0yms8XXht9gJpGph4IfpMP0H/lHv46Nw4tzyOWLeiVbsNi7/M6D4tW51lmq3
         /CBNq6RHI1PVK0JPzkLGlzBuWtW5ZBHRYRsooKZN+tsuqgj9uYbeoF7/cOrIwFuaIGEY
         z/PYEcNzQ6lRm6m2hrrtqFway4X/3LwW/8NfXTo9jDG87XFqAc+ZuFTh7XySFquz5nhC
         Ho0cUwlyWicuZBzk+zVTZ1OoqH4NzEN0RsmDR2XSKpTNBMJMbzAIskf/drBMU2LaX8pz
         0Nvg==
X-Forwarded-Encrypted: i=1; AJvYcCUMODXwHFZR4tbrk8K0qxB6UfQJLwxHONTlMdAJXvgxhsvdEFCRZhoxxx6febc2xHGUHuCQ3qP2scU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg7Sr8oOKoJD2BcYyPKBoni1ZhrxgWbNlSkP24iHisY8xRWefS
	2FOnLyraLgubYoEEwP7FYbf7G8KRyFtahoSORDUkXGkXuBRsNlfXgwtzV/aFCd5sHvc=
X-Gm-Gg: ASbGncsKOAvMCe0hYWll+BIMdZLzCvpSOvA0BAvaeaF2Z1gGI0sAbkH2bzLMDAquTdJ
	75oRpb/F9qfU0X0sFx10fcRePFqPpRZJRHkEN/XV+sNTEPgOYRxPfx89PLsS5cwgtHFfsEc0gPF
	pyFzVw1yPRXeb1Ds45x4EKA4iV76bRv0nm+lGkWf/hLxF03BSa1xGi1vmRQ3rc5UaqGUe7LqM/J
	jSl4/BSaQFDrocDgFodiH/OxQ+6flafaKGzn3fv9GmsSecMMay61I3QKKZmvN61LMZ94GzLz4jP
	WteFPt3+3TI9qnRnpCSShLT09Of+mjeApwW7VV6ll5Iy4uE/BnKJIbIxgTDKPIw+LpARjcpOk5s
	cD4lWpBHjr+eluDI/ySvNytkFPaUni0rx4pU=
X-Google-Smtp-Source: AGHT+IE1or5SFKNkcRKmq8LFw9DnBikVJYe2AFiC9sbCjtCfT/HtlItDWp87qBFYsQunHs2yQD2B7Q==
X-Received: by 2002:a05:6214:f0b:b0:6e8:fcde:58d5 with SMTP id 6a1803df08f44-6fd5efa696emr52880996d6.42.1750869686196;
        Wed, 25 Jun 2025 09:41:26 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:25 -0700 (PDT)
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
	troymitchell988@gmail.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Wed, 25 Jun 2025 11:41:13 -0500
Message-ID: <20250625164119.1068842-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
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
v4: - Add a dependency on I2C, to avoid a CROSS_COMPILE build error

 drivers/mfd/Kconfig          | 11 +++++++++++
 drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71c..01805c3eec57d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1182,6 +1182,17 @@ config MFD_QCOM_RPM
 	  Say M here if you want to include support for the Qualcomm RPM as a
 	  module. This will build a module called "qcom_rpm".
 
+config MFD_SPACEMIT_P1
+	tristate "SpacemiT P1 PMIC"
+	depends on I2C
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
index 22159913bea03..026cd92e20ad3 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -93,12 +93,30 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
 	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
 };
 
+static const struct regmap_config spacemit_p1_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xaa,
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
 	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
 	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
+	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
-- 
2.45.2


