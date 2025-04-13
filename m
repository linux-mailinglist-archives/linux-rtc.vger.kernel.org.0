Return-Path: <linux-rtc+bounces-3943-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B2A87215
	for <lists+linux-rtc@lfdr.de>; Sun, 13 Apr 2025 15:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 980941895733
	for <lists+linux-rtc@lfdr.de>; Sun, 13 Apr 2025 13:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E241C9DE5;
	Sun, 13 Apr 2025 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKQOqFIE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13381D6187;
	Sun, 13 Apr 2025 13:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744549745; cv=none; b=Y4jfSYeuliC7OtehbMc/IGbY688rfHb9tWtcRf2JH+9jcAv6knVk0pBD6Er0Ku/d4lOxtjebM8KfQMjsPrUVutd/ItO9LyEJ8XOqusd2eQuZ5P96xA1uJeBg/YQ+xuUux6mOGzlxTH0fZ7ip1UUa3ysUyxjEvEPM5+RFCuuCoUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744549745; c=relaxed/simple;
	bh=Qiv6epzPmbfHWOUJeoZ8ik0G7oKn1YrCqMbxsEEf+CY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mah90fGsrFlZLS/lrlIdfxBEPs98Slxf7LNLUo10lijaM5QL67Uo9P6Bx5YEiO8ruejL2XPce8lLZfkEkQDZJzBMLIo0nwNUDJ0Fabq+zlq2p/AKlpRiQmWWxHG+/Vo/FAh5M95YK8WjvOOIopwpp5zW0k3elOO2jKfNdj26EA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKQOqFIE; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c14016868so3112657f8f.1;
        Sun, 13 Apr 2025 06:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744549742; x=1745154542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBzonJ/RuSJVQf99llUENRykfQliSdPD+jdNDXviB4k=;
        b=TKQOqFIEFuMvSJsMn5iYkVCmLpTLGPP+5V0fiM8pogBzxRsC7te0vDOGMLd0akVbDi
         sPPxKTWwQp8rymdyUDhvnMYBNQxFqQqbsPCj7tU5MgOPJYr90XG4xDSrcZc2/AoOJLAu
         Z3ww9DbUIrLhsdITC4Yzvm1e/yalSv+jcdnFnBc6pn3Cv8yPP3ZXJs3C9KsclZuEYnbh
         xSr7E3/y2ITSho9/5TAocSWWETU/ltJr0IYey4P7lVppS3IApq/6Mtik+EdMJX6IjMh5
         y8uJPr46VR9HBTWqH6O+zVJR0yePCGVKwhSG5Ks9DYrYSjc3BM+texHVFXueT7Ek3Rac
         TLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744549742; x=1745154542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sBzonJ/RuSJVQf99llUENRykfQliSdPD+jdNDXviB4k=;
        b=UdaGX05qhkTv8qeACILr+T8aFbSA5fhiYV6iZWOu4bQC56W7zDzNft7GY6Y6WVe17G
         VZ1NjlBpy1qRkuZMAa1ZyD/TGu02rH/Vec2XyMPWdk57BhTLWxvkrb6CsQdQi4iMTHJB
         4pTPBGQrq6yVDrn0OU6AMsapgbd+3SNp8n3lGWin8ROJZ5w6ir5esKOIwUGkPF20riQK
         YPJ34k2e+3Uc+FREiI1X2NqtLC+riCbfrKE71w73HetpSJIg3RJ2+4Yz/56Ja91qowSc
         ZSC0KD6JGZkBsl7ZtOCKuzy2e/4Bw+CSTC+AMkmSAFwV+TZhQTqKakB5C0FfgBUwUmiq
         wdkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXT2HubiZnwwyO3n+lK94ZSGErMDwx3oHbyKIu2X4EsXsy01ILGie3iTAnjOV71+AtN3+dDpeiSkNob6bL@vger.kernel.org, AJvYcCXd/qbUVdy2x+PICYff8kf9gJW+o0iKRFe4UENY6tAncGgeC2kx44PRe+w2YgnfI7nW5kenNjbvLq0B@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu1Z2tml7P/MvoxK7k0FboyDOzuzewWGgqHid8NrERTdhDD3cj
	EZFSCLOZiMzeOT4M3bZieAPSK8NDWLNSU0MSHN8h05eCPLA/s6Jq
X-Gm-Gg: ASbGncuOyOnhq3GalGjo8eblHNlQ0mJj/1prNlA+s9WGGG/0hA3FKCW6jhCz8xojKRm
	MeRJY1IDQz4galJXl8I6DiVow92ZYxoYUpGY/KwwhFcFaj8jkZUf82wnVDtXxYZDpyxat80J+jc
	JYUNnubRKbl9Rq7BY7qCR9mN78r05+GkxTcVu9shMZp2sxrTvgC3pC+HheAaiAC9n0E30aXg2kQ
	BssBnlaSf+PSzYtpkjo21SDgMzkQ/9mCf9GRIZ4B6zPA7NDbgKwZo2LyN+bExMaoAW2ieMR+PWQ
	as49h9sEzC1GBLTQ5UxSd8edL5iUp5N2B/cdioFVvNeYZ6rIE1k9LooPOJICbcr7FbqFSA==
X-Google-Smtp-Source: AGHT+IHBram3DuDjE0NvKBJYc4QQx8tGnUCX6OGw+TWpFkl9g/so1Pv3ghZKm+XqfEfKGH1lsHretg==
X-Received: by 2002:a05:6000:401f:b0:391:1458:2233 with SMTP id ffacd0b85a97d-39ea51ee473mr7830729f8f.11.1744549741819;
        Sun, 13 Apr 2025 06:09:01 -0700 (PDT)
Received: from localhost.localdomain ([37.161.110.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445737sm7739348f8f.88.2025.04.13.06.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 06:09:01 -0700 (PDT)
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
Subject: [PATCH v4 3/3] rtc: pcf85063: add support for RV8063
Date: Sun, 13 Apr 2025 15:07:55 +0200
Message-Id: <20250413130755.159373-4-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250413130755.159373-1-apokusinski01@gmail.com>
References: <20250413130755.159373-1-apokusinski01@gmail.com>
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
 drivers/rtc/Kconfig        | 21 +++++----
 drivers/rtc/rtc-pcf85063.c | 87 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 98 insertions(+), 10 deletions(-)

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
index 03dfc58f4cd7..d9b67b959d18 100644
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
@@ -725,14 +741,83 @@ static void pcf85063_unregister_driver(void)
 
 #endif /* IS_ENABLED(CONFIG_I2C) */
 
+#if IS_ENABLED(CONFIG_SPI_MASTER)
+
+static const struct spi_device_id rv8063_id[] = {
+	{ "rv8063" },
+	{}
+};
+MODULE_DEVICE_TABLE(spi, rv8063_id);
+
+static const struct of_device_id rv8063_of_match[] = {
+	{ .compatible = "microcrystal,rv8063" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rv8063_of_match);
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
+		.of_match_table = rv8063_of_match,
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


