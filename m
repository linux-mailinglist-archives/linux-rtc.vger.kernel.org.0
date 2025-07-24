Return-Path: <linux-rtc+bounces-4576-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EE0B11241
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 22:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 696191728E9
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 20:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EAD25A34F;
	Thu, 24 Jul 2025 20:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ghyKjXV8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6159D256C8D
	for <linux-rtc@vger.kernel.org>; Thu, 24 Jul 2025 20:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388724; cv=none; b=JFjJs+W4I3fD+IHZfyTy0TsDmlGbwKcWRjdP6T0ppOynNKaSW8yXiZnhHOsl+/tvoO7kuR3CAcKHALVAF9WUlqrRP6qP715y1vzZSMkIrM/oSSRs0uasHVSUFnZ/pWRVjxVun6c4YnqOw+CbpH/KPXKITLzS/DzLqSztN2YMyn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388724; c=relaxed/simple;
	bh=l8Y690TjTxBtWa5UK1Ikcjm4OIFZIWjVnz92Fpv/IF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1PzJwWAWBrDbZTHO2ooDmrghwEBd29oAqkj8FQwiHXP2uXP/wycm6DGn1lKovte/zriQBtTf9TMJoaL0MteaB85n/VG2d0A4aD9xEX0FAS/mCGwAzkPpFKeKtxVwLhkBOXNfz3LI4vNQZwlM5JkIHsOoFKv6drFZt6U4vpMqnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ghyKjXV8; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-87999c368e9so112070839f.0
        for <linux-rtc@vger.kernel.org>; Thu, 24 Jul 2025 13:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388721; x=1753993521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fMagwIpZN5H+ZLBoespMypsP1iYS62LYPB3IOcPtBU=;
        b=ghyKjXV85vSUxEZHqpCTOBF2p426xlpy4aDdTVhoTI/M3CXUaHp2nUOswmDRh1V7up
         +BKuPwNSBH2jNkHiyJQ/XvczQo6OnfeEuPj3EOsQDKFVwYnWP9kGd6hDtjEVkX+LL3cn
         9hxeT6f7LnbdHlbmvPEhQfwXLy0tst6m9lvHG2ZaoJ8ZGRZfYwCZvDiJNU7KrzWUkW7+
         nHKd+IBO5Cp3LLGwkKInp5S5sU3utN2p1NSm0M7xtUe09SVVq930eiOAviH/cWFk9dEG
         cWW1TAYC8km83cXiFX/OcIA91uUcZizcm4x9zGOJc9V/902sF21JUWKimyot+Y6Hy3zs
         JJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388721; x=1753993521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fMagwIpZN5H+ZLBoespMypsP1iYS62LYPB3IOcPtBU=;
        b=spw/+bS1mThoV/UPFkmHtEqE37+d+UHsRDn5wOYDZlRae9AvuSKEEQ7oA5BhID/jaa
         RQPGaYjhh7FTp8cUNiEMs74CyDBOOGTF21x8beXAbdQyA5auN4keFV8/6rany1LRu7Ta
         ouCL+twiCmn8+JAmVevKhkY9ibabKtQ+OEijnsHTSsU2UeyOhaIUyLmiZGlaUhQFXi+v
         H4zb/5QczSev11oOOQxafm9w4iwcikuNjO7i8Grk3rhCwbE07DL54WCMnGoGzuxR/9mE
         cGReMC+InCuLJsIIAnGrqG8hHuYHAQcmfjKVt/+aYzSmi8mbfM1KBqi542mkbfaWrrLH
         Sbkw==
X-Forwarded-Encrypted: i=1; AJvYcCX61X7ZqVqrcXUs0k+UFFaRyJKq8cUVa4fcKw4JXaq/u1cR0CDIlCLGfuMBRojrW5BzZT9VUGJW4Fg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9NSIQ4qQBgsyTCwHaup37aF2eYmSZz8b/jUSVaQjUJ84JHWTq
	4t1OGR/hfPCz1WEFEyfBXVLfE/GTjcVqh066t/EJnlhYkXeRgWKHyktD3MOz2smgbaU=
X-Gm-Gg: ASbGncs02duePBEYd3byUsHTqDMhvBjcUzVE+mhlNVYZwuuQpTIEoa0ZX4RZWyt2K0N
	/PmrKPdBDI2UCBeRnWSMkZPc2EKV+H1M6dTO0QeGj0tUCIE3slwh4sNngLLpm7rjnNrTwV7nkQh
	i5LUH1cLCLTeJ91AUQMk2nQZhn0ggdEUuydC/DJQMGed3kfLXOtWiOAUAcSL8SDsFKOKM8nIcD0
	si8hg/AYeg92b2YFvDWvm1Q9By/Sn59efAZfoJTXWbX5yZr+/1s6eM6Med3OS1QF9vw4+Wa1+NK
	QlUEjcNHvij0BEuWqDWLBCGjuyyJket3FGNPeApxi66onKv4jl1jeMscl7NVF4letrOdXySkt26
	QKQ5n/PYbPca1fE6tioPs2gZiF5DAIubf3Z01rC1H
X-Google-Smtp-Source: AGHT+IEzuYz5qj+oH/RB69ZJfeLnXb048BakkEMmEAOuLS639h8MxrVG/7gNIToNr5fzMcWgRRoxxQ==
X-Received: by 2002:a05:6602:2c85:b0:879:c609:f5a1 with SMTP id ca18e2360f4ac-87c6504722bmr1515412339f.12.1753388721347;
        Thu, 24 Jul 2025 13:25:21 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:20 -0700 (PDT)
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
Subject: [PATCH v9 3/8] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Thu, 24 Jul 2025 15:25:04 -0500
Message-ID: <20250724202511.499288-4-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724202511.499288-1-elder@riscstar.com>
References: <20250724202511.499288-1-elder@riscstar.com>
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
 drivers/mfd/simple-mfd-i2c.c | 12 ++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 0ea3a97bb93d1..21b117eddfea4 100644
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
index f3ba79c112d4e..fd5d7b60433fe 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -121,12 +121,24 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
 	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
 };
 
+static const struct mfd_cell spacemit_p1_cells[] = {
+	{ .name = "spacemit-p1-regulator", },
+	{ .name = "spacemit-p1-rtc", },
+};
+
+static const struct simple_mfd_data spacemit_p1 = {
+	.mfd_cell = spacemit_p1_cells,
+	.mfd_cell_size = ARRAY_SIZE(spacemit_p1_cells),
+	.max_register = 0xaa,
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
2.43.0


