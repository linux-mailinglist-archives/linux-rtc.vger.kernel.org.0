Return-Path: <linux-rtc+bounces-3854-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EB8A82D4A
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 19:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62B85888360
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 17:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24743276042;
	Wed,  9 Apr 2025 17:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjrN9MC3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3652C270ED9;
	Wed,  9 Apr 2025 17:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218591; cv=none; b=iFHcBfq7dXR61fkotP9FXB70xjrfbsHDz8nWx6Oj8Q3GTLFPZucxO5+ydry4pHhIXDsB99Ei/P4tDHIvtplnEn6noGb5PxSE3GXIH5UveN/4BmIKYD8+KTPIYIyXXY5nT2qHi86Bo+FK4iyehz6HyLsO38uV0fNpXLHCUzEecZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218591; c=relaxed/simple;
	bh=29MwE5bOHbzihqKS98mIQfYlP2+1BKDsSNDg2G+7wwg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XOoWnJLsFBfivLOwEmhttFuaIMcKQNB1epdEK8Uy+sPUz7JIAA+L+6wANvJTpBi0FhdXzOpRcY1nT5Xl34WTFhizM95Xs+dSlwFyp/bxMb/pi9hkUC3h762xc+DCQnWRdZrgQb64StaFraNkwWJGWiAS6KdA2dNOUlraWMTbcfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjrN9MC3; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac298c8fa50so1151715466b.1;
        Wed, 09 Apr 2025 10:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744218587; x=1744823387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aB27vvwT7DSR/rq1zNxpJ8AqSNFk9AHof2SWw8w5sY=;
        b=FjrN9MC3cv9NcmqJAvGHiIsm570HoBYmrE3b5aLJLBgAlNfKr5E2iOvII+5L+FdUeK
         VqUiz/6UavtF4G3hjIobPWPkXImEEuX9o/nX00M3S48nY5SVY7n9YxKROQgY1GsmUJQO
         3+0CKhAKljzkALx0O6fS1VAOdXDeuFJIyE0ToXuKGF6HTggqaIsIjxKVCA/A4JHYhw+T
         FSUiLmKt+lWwhtwYyDy50vmLxbFBxQhNyLFpuF1uUU/+YIxfDmUGcUdJ9VcIILkhkUsN
         BM4gffe0S9Gdp4cq9jjjoAcu1epwXf6+VopcZX+rHRaxtDr5dcrd7SkzPQWnwuKvz0bl
         27BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218587; x=1744823387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aB27vvwT7DSR/rq1zNxpJ8AqSNFk9AHof2SWw8w5sY=;
        b=FVu8k9tTBUFK4Hal/vzBNsElafEjog8qSSllDqp3jD9kCgaUtVhdrDPmwsAyP9yc60
         5F4meHzGiSVSwHwoTipuEdxjs+IKOKJOEg3sIkrWA337mraUZWi8Ri/euvWbAWXm2a04
         q264UnmQdIU30HW/TdOjmxp/mtrvZ2IZG5iSiRAaqm/WvOQPvCHhNWcUpu9JSwklktgJ
         sxWYtXtqDJstpeiFB7oYhA9MMVBK0yPOGJo5cYJDGUP0JfgCwNJEoxeGJehm/5ZVIFjW
         cl6FbEN5iMWz+ibyzKxbbf6G8PmcX0QGSwgdJjemnxhkXynfwlQt6e9fxVAK/r+Mq5ZG
         9UsA==
X-Forwarded-Encrypted: i=1; AJvYcCWtTiRoafivS7h3u1D0fqLhqWsecILoZqKgox5cN/3IzzUNzA4cddYUr3G9AhHJMfKHwi1AEc5h035J@vger.kernel.org, AJvYcCXpiKxZ235vIYpaWNedmvfFgMU9JIgf3nCHQ6Lw0dLXIVfA7jbDbPTYGhcSQ4O7rBVchT+R3rcQEv6WyC5m@vger.kernel.org
X-Gm-Message-State: AOJu0YwAFRZf2OpE+84cRQDY9PyJQcgWesZcxi/1ctumlFkLyHps/f2H
	3UTAMhYpTJoyemqBOpWF1yRAaU2+LNuTTta3/wvHMZHxnmlra0HX
X-Gm-Gg: ASbGncuAfs7TsZrFsBcp38AzwTyDsSY9A4PAuYK6twgA5xuSNTbRg5xdxUhnvMM3sd0
	QBt8FaCIvjfYWi35/g5F0tPyjecDzgIWXzBBdtbAcjzxzuUzjmvWs0nTzpE41aG9ko3nriJ4Lqh
	fFgz58Ah1yZVL6+gppIYE/L5XYEEJwypQ8LZBfN4S+i6jv2WOb/1MffmH37u2htOuI9G6I/wlZV
	5gGRaKowkKpdYn+yaqt7wbyWZmkD2cFvDRdVgerh08d5m2CE/eQuKlnhNaRBYWhrZJUq3kWzLdA
	ZM2aEr5IVNLhVxIA3tYI39DIAp5mIb/IQUExFYnJRvADbG+yYgDlQ7raxw==
X-Google-Smtp-Source: AGHT+IH0gNjqYqXbQct4sQZH48O10mDQektq13dZcPo5RKRj92OiES29akyDwsCoKbWqhxq/eVjKpA==
X-Received: by 2002:a17:907:d1f:b0:ac3:a7bb:1c2f with SMTP id a640c23a62f3a-aca9d5dc8ebmr378855566b.7.1744218587199;
        Wed, 09 Apr 2025 10:09:47 -0700 (PDT)
Received: from localhost.localdomain ([78.209.27.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be913asm122151166b.47.2025.04.09.10.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:09:46 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	alexander.stein@ew.tq-group.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v2 2/3] rtc: pcf85063: add support for RV8063
Date: Wed,  9 Apr 2025 19:09:15 +0200
Message-Id: <20250409170916.47224-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250409170916.47224-1-apokusinski01@gmail.com>
References: <20250409170916.47224-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Microcrystal RV8063 is a real-time clock with SPI interface. Its
functionality is very similar to the RV8263 rtc.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/Kconfig        | 21 +++++-----
 drivers/rtc/rtc-pcf85063.c | 80 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 91 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 838bdc138ffe..1b9be96faa13 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -483,15 +483,6 @@ config RTC_DRV_PCF8523
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-pcf8523.
 
-config RTC_DRV_PCF85063
-	tristate "NXP PCF85063"
-	select REGMAP_I2C
-	help
-	  If you say yes here you get support for the PCF85063 RTC chip
-
-	  This driver can also be built as a module. If so, the module
-	  will be called rtc-pcf85063.
-
 config RTC_DRV_PCF85363
 	tristate "NXP PCF85363"
 	select REGMAP_I2C
@@ -971,6 +962,18 @@ config RTC_DRV_PCF2127
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-pcf2127.
 
+config RTC_DRV_PCF85063
+	tristate "NXP PCF85063"
+	depends on RTC_I2C_AND_SPI
+	select REGMAP_I2C if I2C
+	select REGMAP_SPI if SPI_MASTER
+	help
+	  If you say yes here you get support for the PCF85063 and RV8063
+	  RTC chips.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-pcf85063.
+
 config RTC_DRV_RV3029C2
 	tristate "Micro Crystal RV3029/3049"
 	depends on RTC_I2C_AND_SPI
diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 03dfc58f4cd7..bcfefe823044 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -17,6 +17,7 @@
 #include <linux/of.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
+#include <linux/spi/spi.h>
 
 /*
  * Information for this driver was pulled from the following datasheets.
@@ -29,6 +30,9 @@
  *
  *  https://www.microcrystal.com/fileadmin/Media/Products/RTC/App.Manual/RV-8263-C7_App-Manual.pdf
  *  RV8263 -- Rev. 1.0 — January 2019
+ *
+ *  https://www.microcrystal.com/fileadmin/Media/Products/RTC/App.Manual/RV-8063-C7_App-Manual.pdf
+ *  RV8063 -- Rev. 1.1 - October 2018
  */
 
 #define PCF85063_REG_CTRL1		0x00 /* status */
@@ -559,6 +563,18 @@ static const struct pcf85063_config config_rv8263 = {
 	.force_cap_7000 = 1,
 };
 
+static const struct pcf85063_config config_rv8063 = {
+	.regmap = {
+		.reg_bits = 8,
+		.val_bits = 8,
+		.max_register = 0x11,
+		.read_flag_mask = BIT(7) | BIT(5),
+		.write_flag_mask = BIT(5),
+	},
+	.has_alarms = 1,
+	.force_cap_7000 = 1,
+};
+
 static int pcf85063_probe(struct device *dev, struct regmap *regmap, int irq,
 			  const struct pcf85063_config *config)
 {
@@ -725,14 +741,76 @@ static void pcf85063_unregister_driver(void)
 
 #endif /* IS_ENABLED(CONFIG_I2C) */
 
+#if IS_ENABLED(CONFIG_SPI_MASTER)
+
+static const struct spi_device_id rv8063_id[] = {
+	{ "rv8063" },
+	{}
+};
+MODULE_DEVICE_TABLE(spi, rv8063_id);
+
+static int rv8063_probe(struct spi_device *spi)
+{
+	const struct pcf85063_config *config = &config_rv8063;
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init_spi(spi, &config->regmap);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return pcf85063_probe(&spi->dev, regmap, spi->irq, config);
+}
+
+static struct spi_driver rv8063_driver = {
+	.driver         = {
+		.name   = "rv8063",
+	},
+	.probe          = rv8063_probe,
+	.id_table	= rv8063_id,
+};
+
+static int __init rv8063_register_driver(void)
+{
+	return spi_register_driver(&rv8063_driver);
+}
+
+static void __exit rv8063_unregister_driver(void)
+{
+	spi_unregister_driver(&rv8063_driver);
+}
+
+#else
+
+static int __init rv8063_register_driver(void)
+{
+	return 0;
+}
+
+static void __exit rv8063_unregister_driver(void)
+{
+}
+
+#endif /* IS_ENABLED(CONFIG_SPI_MASTER) */
+
 static int __init pcf85063_init(void)
 {
-	return pcf85063_register_driver();
+	int ret;
+
+	ret = pcf85063_register_driver();
+	if (ret)
+		return ret;
+
+	ret = rv8063_register_driver();
+	if (ret)
+		pcf85063_unregister_driver();
+
+	return ret;
 }
 module_init(pcf85063_init);
 
 static void __exit pcf85063_exit(void)
 {
+	rv8063_unregister_driver();
 	pcf85063_unregister_driver();
 }
 module_exit(pcf85063_exit);
-- 
2.25.1


