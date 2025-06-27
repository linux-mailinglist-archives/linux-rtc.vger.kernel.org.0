Return-Path: <linux-rtc+bounces-4388-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A22AEB9B7
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 16:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E9456444DE
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 14:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4112E3AE7;
	Fri, 27 Jun 2025 14:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ffwa+CxS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BF42E2665
	for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034199; cv=none; b=TyTDy1kB7tAvPcDyTiayQHN+BiUXBQJawt6c+E3SbRVJ9faPR7zO/vHWycnZgLzjZWh7jD+HDIldSPh/eTXQYVhc7RZ6S0F9+ravvPrcAOZbG9M1LAVF/PO7plQ67kQfCoClA9mna8SwEHHaLrgiERAab/xoUp2zFy2K1k4KHa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034199; c=relaxed/simple;
	bh=b+d+F+NfMBETraAATTzaFJEm4lSRbVG8DDRdAYWb/+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iIdt4FXadMEIh/TIGgWCKddrDsbTnZi/P+HjevB8EQtEC3+nkot2OENQ/Kyox+nga4AnXqAp1i8GfQBC3fWey4DK5P8OilT+gmH6gMB+odYchG7VIx+RO9XVv7v4n4RJYsBGF8xDqpM3OEA2i1lHpTxzq03655hxAPXvRCW3OO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ffwa+CxS; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d21cecc11fso352225685a.3
        for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 07:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034197; x=1751638997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImtcgLzIrcawut2MtN3yGlOkEUyWKtboJHD9r18H14s=;
        b=ffwa+CxSzk4SvAVA72UEwVhg11ozMyEh/5B9cXDMFsGfzkr51L01Mu421D3XkXGFsX
         5pd86qML+wSyKNppvIboOygQdRniJ4EiQA5EfhrVcVlM4zNO3Flqyhf3ITdEK2YKUD7n
         lOEDAVKcHb83kGG4ZYY7/yGgvo6MQZ+jPggR3SBa3K6MUqVINzn86QgEbyZSE/2bAuCF
         A0CHvFLyOOEOmjD58TNfIBxNkH/8rL77K7fBZAJzifuI39ZLmXhNeKrTg3rn5AP8LAY2
         HUlHTFmk8ZCxfD7Ge1cV6vCWnR8Uewb5ZutbnB819m/iBorbv3Jim4OmPTi8OoihJbNa
         mBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034197; x=1751638997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImtcgLzIrcawut2MtN3yGlOkEUyWKtboJHD9r18H14s=;
        b=slPbxS07F220kzQOKOB/e2yN72IzSDKt3tHoR1qNYJCafnk9nZrXdPIEk8PIp1G9QK
         tsI/duyOcYfxuyzb6YTUx+m82SUY8QEfn1/FWqiUWGNQ5WwNQv0T6XLkh/4El1hp5io9
         5oIJsEPu5KXu8/jB0g+PfdXKijjdLjRFRELmrv/YLq1+JiotsZg2t0Kmr3zamhBUvt6h
         FjxZAju3a7Zbi6rFoFQuuLWoh+Q1k/XiRkaCASYYdtiSSyPdzTl6uHyt/+IUxuTVouCc
         z0RUF6oHWdBwy0+MufJlqLSUDSJkMQKdJ8J+ZHY6VjJecfTCsho4IxaySQoyTKV3ICBW
         ywYA==
X-Forwarded-Encrypted: i=1; AJvYcCXB03hsXBGYS0VzSZwMa8rxbP2AemKUhTUFPZ8T3OjcswLyZEBXSX9su3MQe8j1dvEjy2749gUjfP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaBd/KNKyPXZYSVPKgG6zThfTwVNhVHuebIeLjKJTxELOrYFhU
	+P0MhxgIHEq+WjjZQG888b/qRXGZoNjrl0hXmA/4afZG3rJNyQGzYqZ9YNBHhJT72GE=
X-Gm-Gg: ASbGncutJwWag0MCVucBNaGeokF+NuvTGkkLpI4FzxafQ701f2VeJlaKPpXovqfWDKN
	txXlKS59KEmctjAy2R5SxOR2BaXsKeVgEK7wZeX1pDv+9VMRWnVRRK2JcOwBkUPpy7YapbG0hnj
	rxf5wzwy8eJkvBDmVKMfQvFbNTajhhaUVcu+JxNHyxE+qpTWBFLUvjYTWUUXbMD5nlaTg338U3Y
	8L+ecTH2Y71B/pbLIQpYEcg5KPp89WbJDxt32J1n5IGzEwu53J6+smgNWNOoXUbPOTaLE1u4rJ0
	BVHhXo2HIQWaEACnhpoxGJ3QPkxVqp0Y9dJaLKP9ziYV77CkN43PAeYkRViVQ+/SfWLyGUptXTz
	v3kdeaJNaubZFWfky4Z0C9LlKU2JUVoXpx/lwIZ7HK23Tdg==
X-Google-Smtp-Source: AGHT+IGVK1ecJTiuAsTlRFYL0Ii2pcfzFGLsDuQjxdb465KNunRg1KkMZc7lQpWfV88VHg+Ky4I8gw==
X-Received: by 2002:a05:620a:178c:b0:7d4:43cf:68e with SMTP id af79cd13be357-7d443cf0696mr474156085a.17.1751034196660;
        Fri, 27 Jun 2025 07:23:16 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:16 -0700 (PDT)
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
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/8] mfd: simple-mfd-i2c: add SpacemiT P1 support
Date: Fri, 27 Jun 2025 09:23:02 -0500
Message-ID: <20250627142309.1444135-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627142309.1444135-1-elder@riscstar.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
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
v6: - Update to specify max_register rather than a full regmap config

 drivers/mfd/Kconfig          | 11 +++++++++++
 drivers/mfd/simple-mfd-i2c.c | 12 ++++++++++++
 2 files changed, 23 insertions(+)

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
index c1dc315d44dcf..81573a4830076 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -87,12 +87,24 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
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
2.45.2


