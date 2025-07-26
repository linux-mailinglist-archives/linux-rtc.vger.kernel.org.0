Return-Path: <linux-rtc+bounces-4591-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B03B12A98
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Jul 2025 15:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E718545F84
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Jul 2025 13:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B72A248F67;
	Sat, 26 Jul 2025 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dG+4ollu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8A0246BAF
	for <linux-rtc@vger.kernel.org>; Sat, 26 Jul 2025 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753535416; cv=none; b=d/FuWCLw7Bq0D6ug14eVVzLhr1pJ3nU57Q7T3l2xfdMG5AxZ4A1yJ8Rlzss0XoOxLNwtaF7iZzdXBLTffI2L4+hiYRa/542vMKnEZMXhh/81BEP0eLBKcQSPyCfOduRSp7p3gnduUEan31wHUyHVQ7u/DV7Ef9hx2vAvXqKf+F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753535416; c=relaxed/simple;
	bh=i24VZQoL4HdNicf8fZrx7hfEBriE1Lb+9VIUFSrq24E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QiNH1/86yc9GS8D/ce9GjQ5x3p/cMBK5SeiWd4nJRqDhkiTwQDQJYSbt2TGu6c72sCYpQMEwFhHBSdzENH79r84nUUreMsIrhwHGmsqz73TwGMJDjplXdcgdfHKCZCdLEmiFWWlw26a7U8PYEbJyP/0alhpHv+EwPyTlsvo3I/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dG+4ollu; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-87999c368e9so246165239f.0
        for <linux-rtc@vger.kernel.org>; Sat, 26 Jul 2025 06:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535412; x=1754140212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBjRH5dYFSfxMS2Dw/xrzSnit2iXBotKiwm7tMWcaRU=;
        b=dG+4ollu30Ry+lgXOeq2KFgfSF/tjhwFz6Lgt5s3FNiPOwjMOsge5JQAuyiYM658oZ
         nKV/H6umysR4seyMKph3u/Arq5VStH36mYiLFhYYlFlm4nIDYn4dKQMjFJheiLNVp6u5
         hsXirVeM92LE9oIYKDv6qT7dn+KVIyeLX27A2xqDk9D+kxg3KqLqp3MHKjOuAwNZ4ZL6
         aslVd21jZqzcZoOZiHNdFXKxtnEFyZcxr7Gil+7TWVprSyXl9CDF+JJF+DlrqmDs72N4
         RZTcAT+cChsvEVzAvutVoWkvEeolIyo6V3O+2VGfVs9Mzd+bRrN9wEcHGFSiiCx3tQ19
         RPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535412; x=1754140212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBjRH5dYFSfxMS2Dw/xrzSnit2iXBotKiwm7tMWcaRU=;
        b=sMCHlDmHwUfZfEC7qRIYNW46RFk4y+h7VAMDCPYfiNLtKeIAdqDLuMANkOAvNdZt06
         BYPuXrE7dT1xDd5TTRFWiCcrhPzFGfcQSYbMBT9S6NuhKNK4pu/vA6aMmW8peicqHqdL
         vBNUwkuwR1QfOM4CCGcHITY/twZxD/fa6sixraLG7NL+cyGmM4BZnfph7Eby49guK2s2
         6LUvYOOEi6bzYacqrKslz11ESu/Lp5Tv/asQQvfHQf7Gx0snfUbiAYC30b31vYNNlCwU
         503FnYXkUQz9nU9ookN0ZQwvxEhmFJZcvIMJRwp6V5fuPvLcsdu7TDploa/yZZ6B+uHa
         IDFQ==
X-Forwarded-Encrypted: i=1; AJvYcCULQmA1rTBYlKtYSsiUvYPLfPmRUWE9hv76wwzahAozYfV0ECpEWCjnXwUS8KbytVFphqE012jC6RY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNb8dUh7Tt1Xgu2wttNBrPfiyN5M+cJjaAsqMMLpU+BfPTOpkX
	8qy/Y1scnjAmWqHHgoJwebGsNkwVncpeRhNGiXezQXvwZRTUbL0iJjwhuPDChgpJsI4=
X-Gm-Gg: ASbGncu/BN5EiZbBcCZzHFijUP72osssXDd58MYHi+toPWwRnnZ2Lh/dR8suRplLINU
	cKRM81j+Z11hgEfe8Rql4kJVEC4c8tQP4jNsPf/IHslRq/OfbJoDwXv61Kh+Y00LzK3iWffxBOK
	u83lOD1LAR2oRVtMYvfx8IP63r2GXk6I5r2ZLnVKeL3zsvViv3YNU3bizR2eLa8HPYmfgBdxSjo
	WPcNRSt/GEp79zwjKudYEl8EQY7mZ5YAeqwwSWdFcH6ivm5adrxLOd/CrmQWqqmsoaPPzD3JLon
	FFCQrDW03Z2Iw8v6tdbmpBA9ZEpm0wrFViQKS0uFDTymmQqCYjWfoswmCqB41TTxPtzgSPIS7J0
	cRGnN2xoLpY4S8X4RRjNrUqKuUp6EO4UhGKDEYR2sWMFsGDt4UICsF4FZPNrdmu18oQ==
X-Google-Smtp-Source: AGHT+IEMiSe1+TI8S2A/w2fU5yeWMCGvndi/cNc/yR7qunidcz9YFlCFnwcgzawUglMsdcxbT5XxBQ==
X-Received: by 2002:a05:6602:1582:b0:879:c609:f5a1 with SMTP id ca18e2360f4ac-880229bbf86mr905586239f.12.1753535412429;
        Sat, 26 Jul 2025 06:10:12 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:11 -0700 (PDT)
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
Subject: [PATCH v10 2/8] mfd: simple-mfd-i2c: specify max_register
Date: Sat, 26 Jul 2025 08:09:56 -0500
Message-ID: <20250726131003.3137282-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250726131003.3137282-1-elder@riscstar.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
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
v10: - Rename simple_regmap_config() -> simple_regmap_config_get()
     - Introduce simple_regmap_config_put() to free regmap_config

 drivers/mfd/simple-mfd-i2c.c | 45 ++++++++++++++++++++++++++++++++----
 drivers/mfd/simple-mfd-i2c.h |  5 +---
 2 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea03..3622f189c8342 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -29,6 +29,40 @@ static const struct regmap_config regmap_config_8r_8v = {
 	.val_bits = 8,
 };
 
+static const struct regmap_config *
+simple_regmap_config_get(const struct simple_mfd_data *data)
+{
+	struct regmap_config *regmap_config;
+	const struct regmap_config *source;
+
+	if (!data)
+		return &regmap_config_8r_8v;
+
+	source = data->regmap_config ? : &regmap_config_8r_8v;
+
+	if (!data->max_register)
+		return source;
+
+	regmap_config = kmemdup(source, sizeof(*regmap_config), GFP_KERNEL);
+	if (regmap_config)
+		regmap_config->max_register = data->max_register;
+
+	return regmap_config;
+}
+
+static void simple_regmap_config_put(const struct simple_mfd_data *data,
+				     const struct regmap_config *regmap_config)
+{
+	/* This condition holds if data is null */
+	if (regmap_config == &regmap_config_8r_8v)
+		return;
+
+	if (regmap_config == data->regmap_config)
+		return;
+
+	kfree(regmap_config);
+}
+
 static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 {
 	const struct simple_mfd_data *simple_mfd_data;
@@ -38,13 +72,14 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 
 	simple_mfd_data = device_get_match_data(&i2c->dev);
 
-	/* If no regmap_config is specified, use the default 8reg and 8val bits */
-	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
-		regmap_config = &regmap_config_8r_8v;
-	else
-		regmap_config = simple_mfd_data->regmap_config;
+	regmap_config = simple_regmap_config_get(simple_mfd_data);
+	if (!regmap_config)
+		return -ENOMEM;
 
 	regmap = devm_regmap_init_i2c(i2c, regmap_config);
+
+	simple_regmap_config_put(simple_mfd_data, regmap_config);
+
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
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
2.48.1


