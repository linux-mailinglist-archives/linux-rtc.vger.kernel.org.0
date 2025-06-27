Return-Path: <linux-rtc+bounces-4387-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E25AEB9B5
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 16:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CED50179AD5
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 14:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167DB2E2F17;
	Fri, 27 Jun 2025 14:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="EK1jlKyD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472982E2670
	for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034198; cv=none; b=h1SJ1ASb84VbfnXDBQdi0HzHGG4YjCnIu7oXcW/vH4Dd5cfV2sB6KSdub9Z/e+HWca7iUr06uz2P4NSvRvyUBDnEF1riUtCXi7E1BANheo8XHXbmKxfQ2yGqLn28Pyh6k8lPhFlPoQyDgLukvfCUYxIAtypHFmeQv/mpsYYd1DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034198; c=relaxed/simple;
	bh=Tsq4Cj77x0Uz84CFPrzoZFbQG9zudBpa1tvUCC6Cylk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hdbHTkluVPs5XDTFXpgCSy5Qj6wW2bYnY5f/YCMP3X7xdQKO4oTI2Vchlt2tYvf+hY+IiW5ZvvMb3HTeTR3wZOrCIk/LYLsPf86oPeSkaijuAsW65He8whuiH6PelYj/bIzWqQUK7axkU6zfd/FRNqaeSHwZmOTuDTyKeozuFFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=EK1jlKyD; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a6f3f88613so24634001cf.1
        for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 07:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034195; x=1751638995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEeEDXRCRhzfd7WiQWk3nSeJTZHMTuZTnU4CBiNxmaU=;
        b=EK1jlKyDIeNtBRcI5wFNDltVIXn8kPh4loOP5YOpsenltX9x8xgULOkLlFiukaxiNn
         pEm8ALvW7JtFGEIalrm9C9pT8BvdBmWF9hXgvpQxTscvkfu6zCcqNgM2BOFQ/w49r/nr
         /Sq3B56Z/LW/Rj6RWxlLNEC3ooLhaZV30ze8ds2lPAc1uyeoeqdSdURiqZgbeETYG5Sw
         1EqdI3fDLSTTsJjsoFfhn9r1tX5t4gwRwS7c2YG3Io1sPW6BJgv+zljAcln7z2sLZDT5
         Kxaaboq/Pn8xZIHu85Ji4i9pdxZBYLyV4uSpC1xHhhgZ1Zw7JH09LWmlL/+7AGNmKqjy
         LC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034195; x=1751638995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEeEDXRCRhzfd7WiQWk3nSeJTZHMTuZTnU4CBiNxmaU=;
        b=JpPipe5cf6k0fDq6o+VGyPtt7/NN6dgHWBpkluk9vVDDJwIExGi8uw5bRPyUazwLFQ
         Xpit4KJMafTg9SbWj5bKXXHDnkcmxC/+6XRCjLJOBOmkqIKFYIXGMKQIR8XqKYwk2a7+
         piGOcgJcxQpxE/X5xJgW6JBhckgDQJCnu56ISNmxnSCJJdKH4UE5cA3n2QRixucATQUO
         AqpbDZubXeMbRWJ1VadTHWkKwlahGNIndgBIXqpomz1wevXR9i9w6DOLwuGtfzUWEneg
         mhwF+AaH/OJbjUB9qNd23eTLogh6W+MSv7B8Bd6zt5qYL/skZrRqaK1AbyLxvZE26UPf
         AL4A==
X-Forwarded-Encrypted: i=1; AJvYcCW8FbYnlkRo8gm0HfxEN/y20Ploa6ynx/jnOl/PP/Zh3iiUw5rxGcnY5PXieM2mI+vJXw9x9FQAKII=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBa0CGumKcj9EYS+ju65RpPzNmPaoFZb+c9W7LRw1ToEc50jBO
	WCmBeSmdVeP509hatB6Ircz9fl9hWtOzicroxnYq4guoSvzE59fX1QqlLVdtHVurz3g=
X-Gm-Gg: ASbGncvTrEX8WwubwhvU+o+94z3/cDmQifVii53Ix1ADX0WuLKVDo9yjUB+RB99G8ND
	mbJqLiYjNoKHTrGJRKuE7PrfO2ewaS2E2JyW2cG113eB8I+XfY99FFgCNwzoYHMCd/zfzCGmqbk
	Pf9obQlgyaCJAfNGHmrfKrbCD+yOFhGIN53jgcu1ex1zOExtEdxl0uwTsl1seJDDDNj/MZanYhn
	+P9JOpy5RoWPkGTcRz0GJXj14XMoJpl6PabbjNklKUPJf54MGHcC6mUaVkGr7v1z0fdRisFLuki
	piQHoKMOP5Je+J5hswFX+4mAriwTz3b+WLdw7RRSIwk15iIAqMPkkUbEwGs1htWDcLZdpd20JDd
	Y7LQey9rn81nVs55t3YvwQbIALd8Y7p9Ja3of9OO/13v2ig==
X-Google-Smtp-Source: AGHT+IHjeJKicOQMrv5A2JPa7JA08EcBfBp+Vurfdw26JNZtOFtPu0+xcyBQuRqWuhl/FSD4KBiKAg==
X-Received: by 2002:a05:620a:2b87:b0:7d3:8ee7:ca10 with SMTP id af79cd13be357-7d443935786mr517736085a.2.1751034195204;
        Fri, 27 Jun 2025 07:23:15 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:14 -0700 (PDT)
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
Subject: [PATCH v6 2/8] mfd: simple-mfd-i2c: specify max_register
Date: Fri, 27 Jun 2025 09:23:01 -0500
Message-ID: <20250627142309.1444135-3-elder@riscstar.com>
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

All devices supported by simple MFD use the same 8-bit register
8-bit value regmap configuration.  There is an option available
for a device to specify a custome configuration, but no existing
device uses it.

Lee Jones suggested modifying the simple MFD implementation to
remove the generality of the full regmap configuration and add a
max_register value to the simple_mfd_data structure.  This can
be used in the regmap configuration to limit the valid register
addresses if desired.  It's simpler, and covers all existing and
anticipated device types.

Signed-off-by: Alex Elder <elder@riscstar.com>
Suggested-by: Lee Jones <lee@kernel.org>
---
v6: - New patch, changing the simple MFD functionality

 drivers/mfd/simple-mfd-i2c.c | 18 ++++++------------
 drivers/mfd/simple-mfd-i2c.h |  2 +-
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea03..c1dc315d44dcf 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -24,27 +24,21 @@
 
 #include "simple-mfd-i2c.h"
 
-static const struct regmap_config regmap_config_8r_8v = {
-	.reg_bits = 8,
-	.val_bits = 8,
-};
-
 static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 {
 	const struct simple_mfd_data *simple_mfd_data;
-	const struct regmap_config *regmap_config;
+	struct regmap_config regmap_config = { };
 	struct regmap *regmap;
 	int ret;
 
 	simple_mfd_data = device_get_match_data(&i2c->dev);
 
-	/* If no regmap_config is specified, use the default 8reg and 8val bits */
-	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
-		regmap_config = &regmap_config_8r_8v;
-	else
-		regmap_config = simple_mfd_data->regmap_config;
+	regmap_config.reg_bits = 8;
+	regmap_config.val_bits = 8;
+	if (simple_mfd_data)
+		regmap_config.max_register = simple_mfd_data->max_register;
 
-	regmap = devm_regmap_init_i2c(i2c, regmap_config);
+	regmap = devm_regmap_init_i2c(i2c, &regmap_config);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
index 7cb2bdd347d97..4121fe1bc1d70 100644
--- a/drivers/mfd/simple-mfd-i2c.h
+++ b/drivers/mfd/simple-mfd-i2c.h
@@ -24,9 +24,9 @@
 #include <linux/regmap.h>
 
 struct simple_mfd_data {
-	const struct regmap_config *regmap_config;
 	const struct mfd_cell *mfd_cell;
 	size_t mfd_cell_size;
+	unsigned int max_register;
 };
 
 #endif /* __MFD_SIMPLE_MFD_I2C_H */
-- 
2.45.2


