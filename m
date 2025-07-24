Return-Path: <linux-rtc+bounces-4575-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2591B11236
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 22:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3204AC20D2
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 20:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0312561A8;
	Thu, 24 Jul 2025 20:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vyH00tth"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D0A24E00F
	for <linux-rtc@vger.kernel.org>; Thu, 24 Jul 2025 20:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388721; cv=none; b=T1VHRTs2Vqdi8gzHeAziM8jUi0sMNPdEqEf9aPMRI6pWThEV8xdCnXGJ9+3Gcm+39tinf5v7bqNZO5ZdzdFGpzHOwfFWKx8yCxuv6Eb86kFDtRpnP5FQ9ttvvDdCcOuwled0tzz3lJ+nxU+i+3vmnGIay6RQvGwAdQsg3MSuMEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388721; c=relaxed/simple;
	bh=UrNWY27+WGuXhBrr8FZ4VtBPQzBe5GWLS5gaqBEezLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bgem7+auKmb+D3+WKXDjT9FR3QHhML6pu3eQw7Zn0yWJ5B5+wOc5meuXXuI6M5Ie7yq8vzTVVla0nmKwfCBtyEn1Si5FUbFWJt/1rwLWzQkA8ARJoCSLXHl01UoIPUDeVLfDPqTYOSxmj/mVFJvYa2geNVOQiQeaOwrQtBAHGdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vyH00tth; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-879c3222a14so48248339f.1
        for <linux-rtc@vger.kernel.org>; Thu, 24 Jul 2025 13:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388719; x=1753993519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUWJeO10MspBNvjbgvonhw7oiCj7Ud69EwF31dVMKc0=;
        b=vyH00tthU2gfIwChYemo5wrwz0yO+Mt7fE2TPm/dxXiKtOwHYHu/WxRXiDGsYXriZR
         S0PybRIXNuWgfTrz8P1RDd2niMKxibj9eqKQey/SYDDZOtvkNRJUdOrZ7LHUnDcBtjeq
         sBrpNWaVmhvO01JtVn2KxueAO3RtUNueOzNuW03qxJlpwdHYlznD3wr57jV2hfqm01Li
         sPCtE9LnQLV7rWnIUJZGY8/Dy8/y0tIArL6d8+HAl33lSKo5XBvxrl4JvDQ5i6m/v8Zu
         OLxNpWQj07ol5eB8Ua1ltRU2GWzO30zNb01Or1gngp6+dtyRAI5XJuXI5XRG5KGUNntx
         NsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388719; x=1753993519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUWJeO10MspBNvjbgvonhw7oiCj7Ud69EwF31dVMKc0=;
        b=CdsByNYpufS5aZeJXOF8EVrn8N1dgbdkzxsEdjaTrVXk8qfRTlpCFeKu5I3/rED2c7
         6z1hsw/2rhDe3hyvi8H6k0WheWfARUBmubdK4QKfBqp+xgCPLT+mVLFVcPAJiT9y/6S5
         +2kVlkkVxWLHTgIr36AFfQKMvcgYT1F+5LjQ7jW3z15P0wEl2WcCEuf8zQoYrcA3g2WP
         nsjz0dHLRhb39gIiqbkqbUc95O7rsuC4puwp79Spo8Q5l08yf1CJH5BiOWRStvEB/DBA
         FsFPOC58KSbL4M9jORHeP/qvmT8ktrweJIvps0qT4s0F5gIbMRVpKfUnKyqVFulhWU9j
         nRTA==
X-Forwarded-Encrypted: i=1; AJvYcCUWghfjeJpJ5g/Js81t0SVABnamNbbmB3KqwG+csFlt3/625/ZtOUnjsOD7+TtM3s3NtLT6mHmAzYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZspttMoC6jM1stdXczHOHEwGRxdWygOAyLOtV9CEBWPugu45S
	YKQm8lPU/KRTQx9VptHYXold1YzyNVTXWnG6Q88Quu9QpFwLm8nLMiOoJ6U3lpwiiBs=
X-Gm-Gg: ASbGncsG1WRoMld9vfDldMyY9Ye5Ps2PM8i7Vfs9RNZ2VtuwSsXKP1Y9RlbS4n54HHl
	lgKCWyNLiMf893fzb2Jej20btu69VsXjPBljkZzzf0xznN/9MGcVJcZ3SL4b6wPEbLUg9jDNen1
	r3HtycJ7eGUu4pGJBM6NrZ/uYVqWs528xTPCL3Qt2S/TmQn0B3MbkJ6cilADoyA7ehQyz1moi6W
	wOEY5jwWTzx6TasZG/nK5Lo6IWipPLWTwWbDtKUP77X6O8a4ThmTG+0vNin+hAvsb0aYpFj0awV
	5c/2A1tQbXRfW7aUrpdxU1c6lmSH9kKrUEQy6SFFeCnf3OTrZDA8YdY7sq8YIRaZ7eavtRigDAB
	eQKKj4wI4B6iYdWpaO1TB+1JWuI2IsMakjRvEsMhT
X-Google-Smtp-Source: AGHT+IFUp9h4K9IBStIoZAgqsn9asnHHUeYZME463FiGof5MP3p6oGHeDXOYqEh2MNkn2bzq84JyzQ==
X-Received: by 2002:a05:6602:b8e:b0:876:7876:a587 with SMTP id ca18e2360f4ac-87c64dc5c35mr1342670039f.0.1753388719095;
        Thu, 24 Jul 2025 13:25:19 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:18 -0700 (PDT)
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
Subject: [PATCH v9 2/8] mfd: simple-mfd-i2c: specify max_register
Date: Thu, 24 Jul 2025 15:25:03 -0500
Message-ID: <20250724202511.499288-3-elder@riscstar.com>
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

All devices supported by simple MFD use the same 8-bit register 8-bit
value regmap configuration.  There is an option available for a device
to specify a custom configuration, but no existing device uses it.

Rather than requiring a "full" regmap configuration to be provided to
change only the max_register value, Lee Jones suggested allowing
max_register to be specified in the simple_mfd_data structure.  The
8-bit register 8-bit configuration is still used by default, but
max_register is also applied if it is non-zero.

If both regmap_config and max_register are provided, the max_register
field in the regmap_config structure is ignored.

Signed-off-by: Alex Elder <elder@riscstar.com>
Suggested-by: Lee Jones <lee@kernel.org>
---
v9: - max_register takes precedence over regmap_config in simple_mfd_data
    - New function simple_regmap_config() encapsulates providing config
    - simple_regmap_config() allocates a regmap_config if necessary
    - A small duplicated comment is removed in "simple-mfd-i2c.h"

 drivers/mfd/simple-mfd-i2c.c | 38 +++++++++++++++++++++++++++++++-----
 drivers/mfd/simple-mfd-i2c.h |  5 +----
 2 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea03..f3ba79c112d4e 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -29,6 +29,36 @@ static const struct regmap_config regmap_config_8r_8v = {
 	.val_bits = 8,
 };
 
+/*
+ * Determine regmap config to use.  If no regmap_config is provided,
+ * regmap_config_8r_8v is used.  If max_register is specified it is
+ * (also) used, whether or not regmap_config is provided.
+ */
+static const struct regmap_config *
+simple_regmap_config(struct device *dev, const struct simple_mfd_data *data)
+{
+	struct regmap_config *regmap_config;
+
+	if (!data)
+		return &regmap_config_8r_8v;
+
+	if (data->regmap_config && !data->max_register)
+		return data->regmap_config;
+
+	regmap_config = devm_kzalloc(dev, sizeof(*regmap_config), GFP_KERNEL);
+	if (!regmap_config)
+		return NULL;
+
+	if (data->regmap_config)
+		*regmap_config = *data->regmap_config;
+	else
+		*regmap_config = regmap_config_8r_8v;
+	if (data->max_register)
+		regmap_config->max_register = data->max_register;
+
+	return regmap_config;
+}
+
 static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 {
 	const struct simple_mfd_data *simple_mfd_data;
@@ -38,11 +68,9 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 
 	simple_mfd_data = device_get_match_data(&i2c->dev);
 
-	/* If no regmap_config is specified, use the default 8reg and 8val bits */
-	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
-		regmap_config = &regmap_config_8r_8v;
-	else
-		regmap_config = simple_mfd_data->regmap_config;
+	regmap_config = simple_regmap_config(&i2c->dev, simple_mfd_data);
+	if (!regmap_config)
+		return -ENOMEM;
 
 	regmap = devm_regmap_init_i2c(i2c, regmap_config);
 	if (IS_ERR(regmap))
diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
index 7cb2bdd347d97..6fa36b3d7a217 100644
--- a/drivers/mfd/simple-mfd-i2c.h
+++ b/drivers/mfd/simple-mfd-i2c.h
@@ -8,10 +8,6 @@
  * shared by all sub-devices.  Children can use their parent's device structure
  * (dev.parent) in order to reference it.
  *
- * This driver creates a single register map with the intention for it to be
- * shared by all sub-devices.  Children can use their parent's device structure
- * (dev.parent) in order to reference it.
- *
  * Once the register map has been successfully initialised, any sub-devices
  * represented by child nodes in Device Tree or via the MFD cells in the
  * associated C file will be subsequently registered.
@@ -25,6 +21,7 @@
 
 struct simple_mfd_data {
 	const struct regmap_config *regmap_config;
+	unsigned int max_register;
 	const struct mfd_cell *mfd_cell;
 	size_t mfd_cell_size;
 };
-- 
2.43.0


