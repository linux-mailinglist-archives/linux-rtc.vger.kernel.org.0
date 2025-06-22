Return-Path: <linux-rtc+bounces-4328-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62078AE2E2E
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Jun 2025 05:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E860B1746BC
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Jun 2025 03:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7176C155389;
	Sun, 22 Jun 2025 03:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rZtimGse"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7B7146A72
	for <linux-rtc@vger.kernel.org>; Sun, 22 Jun 2025 03:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750562991; cv=none; b=Ie19C7K+C8sSBLLAbaL7sE8Qj2EpGSABgM/MRq50yejNiEDnuNjunNWV06XcJgyLokJQhrzs5u/Rs4XdJQl8o1GhhFyEunMfz8C6RzQWUScf1nNrdPJF4QtNRa/r5BCO05QBu8dTM1K9TPieyN7HYNz/T8cLGoOUlmwFoUV1kzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750562991; c=relaxed/simple;
	bh=/f7vOi/zQqnML93HoZkMK7Obd2bgrfdMaoiLko3E59M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lF3k4I5B3sjGC5APgn/jAVyB3cylmdIvdtHboKghwwdg6lid94G4qwUuCp2XChSBUh1nIuiERrcYkeB3Ffoewqlnm79Ut2wRSWO1t14Yrs+LkuS67yn1g6/W9A162ZTBTJ2kMUWexHOW9tnYLW9lW9vpZXjUNU+cfWV68VzL4vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rZtimGse; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fd0a7d3949so37557086d6.0
        for <linux-rtc@vger.kernel.org>; Sat, 21 Jun 2025 20:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562988; x=1751167788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdegzUcdk0GMXdJnlI+cKOaIH3OWb8viJpt7TGJFQQQ=;
        b=rZtimGse9wQaZMtzp6YQZ4F5sMfm77cPTLEdXJ0JzVSe6rvR7lUlnZ3BKnh1n99Zne
         56aRQP/4SLvhrX9Y8r3Gu7CsElfryFKphw6kSp/UG+VvzJ5prB+xptEtjVkTFHMrGpeN
         fv0ToVJq35IBLJbg1GKlV0ZZv8Qx2J13opQ41e9iZN8984cMMNDEigt2aBZIR+7dhSuw
         sWib8mwty5a5tFVDVhgSrJ7vfcB0KOLjJ9c18IIQJOtjFIUouYLIK6vnQlLcNruz5XJA
         4Y23BA5fHtMKECqAsLB5msLZXtGdGRLDec2Uobq+L4kvCUnRFGCHRjLjkYtkFSPwvIhV
         PhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562988; x=1751167788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdegzUcdk0GMXdJnlI+cKOaIH3OWb8viJpt7TGJFQQQ=;
        b=ZzusGFhWYFUnOUbd4LhhHzRhl8vBrPbyBTdBDxxTvePnTAxVBie+aDMvWVoOWXBmM5
         w9mMTuP8ZwAjqVAiXG5sQxw4WbKINW1pdpjNl2aTCXZpaBVzt5N9Jkc4IKfAiDt4/q9o
         /Pifv2mWETad+9rYcDW1EVYTqrI7hibBtsQeV63zrUKgV60+9+urF2ULIVefncVvh1K6
         h+afiDKXL8YG5KHXOilpisHY+QEyN0T+/VKxM+gNt3SGUq9EN+76EA2OXTHD/oNYk4G/
         jn2ryfMiQBMbLUdHC1JsLF4gNrf4H+7QQH+Ey3/Arb84vS5rWF7J0UN/0wuZlE0F9kZZ
         AuiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXybtUJFpASYDnk1qHWXDGzXvIZ1gWK89iOfOZ8uZ2HSwHMRV5snfh+91oI/gxc4WDkluLS6HW/NTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUKz0aHxlDBTLuqaUhGFTK9jbke1a1mHpk+u4EBgOrPOPHB7zX
	U6KolTctS70LgUZKSN2Khg6aZ8NgeZLUzjGMzqaztm0u6Nd5y0WcXtzcVdX6w4LJ25w=
X-Gm-Gg: ASbGncvBFUjQBfB/UACrBSQjc+r5AhK3eA3R/KJtczIsqjzb8tdDKVLGG/2C4XrNj/A
	kcbGh44mL8ngmECacwxSzPZ/NigKDrbwgZPOFrwQ3XhSk34TTEhY16Z7ZvaB3US8VwEFHBSjR+S
	4czL3sLdjkZqzjtkPJJIekDQNWJlkz+EqrPWeuqDwvD8d0n/ZXEuavukPPPkh7qSL4r7NGjW/K4
	D6bcr6vTWlKXcyRsFB4iUjpDrsNnG+RrUyn3GrNNNRNenvmHS4mvTbkTAQ9afofTIL6bcatTAJX
	MoyqmxwURkJ3+DPYgjzBGf2hNT3CdbySshu/2B7P346bu4hMKI4djPVnq9MYwO6UgytxF1DrtuQ
	NJ/ZiP04T9IN8sAiiPV3igg0yOfccQTkY219DwJw2p7y64Q==
X-Google-Smtp-Source: AGHT+IGgivgJ0hOyBSwVTJjkONfdleyZ5q/Eg8WQ3nCbQOeaT7UCkBc1niaKvoGFFoFSZB9qNGIrtQ==
X-Received: by 2002:a05:6214:29c1:b0:6fa:fcb0:b893 with SMTP id 6a1803df08f44-6fd0a48a539mr131773656d6.14.1750562988574;
        Sat, 21 Jun 2025 20:29:48 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:48 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Sat, 21 Jun 2025 22:29:34 -0500
Message-ID: <20250622032941.3768912-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622032941.3768912-1-elder@riscstar.com>
References: <20250622032941.3768912-1-elder@riscstar.com>
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
v3: - Support is now implemented in "simple-mfd-i2c.c" by defining a
      "spacemit,p1" match entry with match data defining the PMIC.

 drivers/mfd/Kconfig          | 10 ++++++++++
 drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71c..a83884da6befa 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1182,6 +1182,16 @@ config MFD_QCOM_RPM
 	  Say M here if you want to include support for the Qualcomm RPM as a
 	  module. This will build a module called "qcom_rpm".
 
+config MFD_SPACEMIT_P1
+	tristate "SpacemiT P1 PMIC"
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


