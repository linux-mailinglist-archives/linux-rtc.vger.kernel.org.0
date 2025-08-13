Return-Path: <linux-rtc+bounces-4679-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBA1B23E5B
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Aug 2025 04:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B02D624FB2
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Aug 2025 02:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB751FF1AD;
	Wed, 13 Aug 2025 02:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="BiA0sZLJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789661F582E
	for <linux-rtc@vger.kernel.org>; Wed, 13 Aug 2025 02:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755053122; cv=none; b=ifuSwOl6O7uG5b3OduOy7wEg8PR3ARKob4BVotaK60wZhwerH5qhnZmlvoSyMyQSqp+dULNpbGANOK08MJVUk42UfQTJzgVJplI2tDYhNf9CGZ+kGOHr/OQY7z1ZCHlzZnCpj6LzMy9y0ha6wtqWp/H/7GOZlNr23iDdDu55IyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755053122; c=relaxed/simple;
	bh=qAyi6Z4J1VmKuMgL9UNLnXal9YSPn3d/+rrwoINafhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wa9LkoZlk411URejbhNddm2OBGMHCvYYN1Jd1CXp5g+UYwfQGNtS2K5tC5ndy+ZePWNWYwJG0Yj2czCxWL9yrBfPXZwXpqky2Ckd9J7wz8EPfHw5bl4B8dgakbfUQH8/Ytn/d1gDWX0BVaMUy9OIcFgeUU81gyr+dyV7UuZxg3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=BiA0sZLJ; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3e51dc20af6so58743215ab.0
        for <linux-rtc@vger.kernel.org>; Tue, 12 Aug 2025 19:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755053117; x=1755657917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpWSmw9lis/Pk9ItaAyFFmK9qCXYijFo17aiCbiLfY4=;
        b=BiA0sZLJ6U/URK/0UFd5zrj4oaDfaHTIwPs4HWDgc86XhuCszwuOEfyfJgn2KGz7w2
         TGgNxslj5Uw2NBpY7gR7lRvEMRpNuTfHKuy5dACl6XXUcspWpfKeC78AOSf/3NXsJ6P6
         ZdK33xaBLg/023JuOiNDWS6wBx427iyMl2PP6TKQLg/BsYiDczYc7Pf8I0KPybclYUYP
         Wu+oW9l5SjoRacTmLPJktt1GiLNwlhdhNV8pgz6L/ga4RSSAABhfR0hiRI/JoceKLi/J
         iaNojzS8cIYD96dog0q3L3ZeqGHM67nK/O2tkdYDeNSG4TsCAYLYqQSThkDLifuygELO
         uYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053117; x=1755657917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpWSmw9lis/Pk9ItaAyFFmK9qCXYijFo17aiCbiLfY4=;
        b=VIJR1ek+NBpkJMr/rWweHlAqKdUzRWlVN/07b95B5SNwR3QVPmI1HVS+gixwZC7BKf
         SB3R5hfew7EoUBUvWZkvSO/f6Yb8GraFPND4DK0RHew8hfeNT96eLJSilVIqa5gTMyoj
         dIZF9U9NtZUHpFp2mFmd7PwFUT3/72frINpbXHtNAtIZf+TVFC9FCCTzDMMM/mI9KPdE
         FrjEzw8IrHphlZtxdgb/ivJqwXUVtROQnnRP2YQLp954PMdqOjLro6wKc+FY1XYocn7U
         vO4HjQnWQYPNgRwLvxacB7e9pRK/8cvJS9fzO1PlKhDb37bR0R631haGDAPUuTjdBxqO
         Qnsg==
X-Forwarded-Encrypted: i=1; AJvYcCXymfEgZS+CGyRFkmuu5XGFkOUTSMuptKYIx+Q+hX5pDFHuCwuhTd4VqamhV+PSZeUPtbfE97lQaaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDPMxKA8gF8tE5m/ybUDXjPjcLxi13uWfrSQ+XQQutFBn999FY
	RmjkROcK23Ess2jLL7ZIvb7KMab8D8oiOy8O5t7pi6zmlgVSF4SKwqlrmdcQ2lmrPMw=
X-Gm-Gg: ASbGnctTo5ImASPGbFnCiJ4xAahAK/g1Qk8hQftFvLPttI4mA+jBWRoCKaYb1J9lW3z
	c7OThbGXTk8WoQ+TPz2ddDBWM34m7q/3OGp8kKd6pblsf9u6eoH6sJ4KA/fyjqTqG1YhPKRx6mj
	drp4kh51F1RHKDKELj9LshwGDTGmHO6HkHs3SsIEg7m0K3lNVBzZ7rE7TrKK5gc98hDUQJYLfAK
	47kA5t40rdMVBEYsyn6pfjE3HBsFPhQyC4lNFCaI3LhULaeEFkpO7y0igcon9FK+za6uN9UoFki
	3IHWgqIdGDgO+0TPwAopFPKp9npFQF1EjimKGMTZIlHUPvNfOBtfhuL4cq86xwBf5tb9yk1auhJ
	+4oko+FRt3T7fuAw0RnrAZh8JZc9JDB3w7vVrtOuJ9vAQjYIydQ0a0k+F0HRqyEqTpQ==
X-Google-Smtp-Source: AGHT+IF/iYJMmWmcL8yZLA7oNGcNRdI/2yJYPqEsD9FqvoMdXobCS2emz+maEDlXX84/h0VsLJTXHA==
X-Received: by 2002:a05:6e02:380e:b0:3e5:4eb2:73d4 with SMTP id e9e14a558f8ab-3e56739943fmr24223705ab.5.1755053117425;
        Tue, 12 Aug 2025 19:45:17 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfbf6sm3430829173.54.2025.08.12.19.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 19:45:16 -0700 (PDT)
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
Subject: [PATCH v12 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Tue, 12 Aug 2025 21:45:03 -0500
Message-ID: <20250813024509.2325988-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813024509.2325988-1-elder@riscstar.com>
References: <20250813024509.2325988-1-elder@riscstar.com>
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
 drivers/mfd/Kconfig          | 11 +++++++++++
 drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 425c5fba6cb1e..4d6a5a3a27220 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1238,6 +1238,17 @@ config MFD_QCOM_RPM
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
index 22159913bea03..47ffaac035cae 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -93,12 +93,30 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
 	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
 };
 
+
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
 	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
 	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
+	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
-- 
2.48.1


