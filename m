Return-Path: <linux-rtc+bounces-4083-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A723BAB1C6E
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 20:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AA32B23CAE
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 18:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8BE24169B;
	Fri,  9 May 2025 18:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPLYiSra"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A70241664;
	Fri,  9 May 2025 18:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815917; cv=none; b=FCWwSb/lZgjOTWU0ZofKuEFsRXJMZYZDXrmOi/V1Srd1S8aTJue5nusG2/W7n3tgXO0xh5CqXQmlqx/B9Pkk85z2glTQDJ30FfFdjvOWqB3fKPQIZ6a/zf1Bi7imBPHjfbycHaXMtzNoUgfZXhhcLMZ0Y9cKE6Vg8HclDEIGbOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815917; c=relaxed/simple;
	bh=Qiv6epzPmbfHWOUJeoZ8ik0G7oKn1YrCqMbxsEEf+CY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SX5S0j/r7y5n1ilQ0SyL6Cn2TydTRUF8RAq1bUs5x7lyqxyiytW/mQZmwlBU1LYvBJ8/A05Y6I5InKfcqh9b4vJdTLcf9xhb6MyWmZMG1kdl/bVLINhYVE5wqgAiie5QN8iPSO0RCDZP/sLyIshvaZ1WhgwrqANDHTF7txnLoS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPLYiSra; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso24035955e9.1;
        Fri, 09 May 2025 11:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746815913; x=1747420713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBzonJ/RuSJVQf99llUENRykfQliSdPD+jdNDXviB4k=;
        b=PPLYiSraKvgJ7jlw7F7Gm4moSwiKqj4AtznUhuwQkmyazgEwyW4eL6Y2rKCEQgms+G
         czeCpmLIVe/OP4kPn0dedR2LqLdXXF6TdtiiY/DBFLNv/3PEPEMQUdZQReAQMXirwtyU
         Sq0XxGGZM7Gw5IYOCUdFtlxMzyjZ27MrR+MSOw8CPFxGs+g1B8wploHPlwR+XKCsbz5Z
         doAsjJgCcA0RRa8mv7hltNmVNxXTr8fK/0+EepzDF8/huM2trdTsz9mh1GtVM0xp58zy
         DCYrmorB1WQBGCPXGiIE2lj1jcmuYtis4ABeZ6mvFWtrvTwjLlOb9BAaa5ZhiHwqO+mr
         1EkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815913; x=1747420713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sBzonJ/RuSJVQf99llUENRykfQliSdPD+jdNDXviB4k=;
        b=HLvPUEiJE/m4MT0cNpaK8Cl3hkjJNXyI5XiSTEOPIDCImbPYC4b8w7ntFzpTcZ5EOo
         83cY8qP3YPk/DyEYcaZXvVr5cbPVdoLhZvyKr4SefNSPxze6BDbLh8s/zoiVNXv6U2Ac
         yBsp/7KN4UVme3g+lKN4B6/DY6pkclVSZXojMPnrSTS7y91qJXNQ07lzZiP8mw47Q/km
         Jh8J5cKUtf6liOzH/CbLtRZpOt7RR1zBRhQsvQnRrXRKqfuGq7rUmxL2srf4Ku6JhTnZ
         L0SjAeJUEaeOT3kd2Ft8yZwtC0HzNLjbN3qLrMUQvPKgT++slXY/1gnrXQZbevDf5uiY
         z7mw==
X-Forwarded-Encrypted: i=1; AJvYcCV71ZwEHUMF4bqyDnB9tKoTj2VHqHyioEdINBQr3lzseQOqgRMypfwgXBpAXvpcHxA2CjLmv5ADjD6TIYt+@vger.kernel.org, AJvYcCWsxM9izggAmzFeXUklLBgnXU16HozEiUf0DrSKvG1bwnTaK2KY4z0bEOOw1opbp2O+Cx6VEw+0JPze@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2SAf4DQcfeTJpovrsUo5REGH++HAjUnT1uN6optE0T0BoOC1K
	LrBsNoGjDFoaQHkN30KZaPd2zv8aT3E7+ZoxNFHv84XQjMi0kTZ1
X-Gm-Gg: ASbGncvYhcyuWk6PBRr3gzd6JC2a2MdPmvCgcgc1gKc3VHWkqQYnwJdMMEOUKRNJ2yU
	/FYoKKgGfyimruibSzmLJU5TLtih6Wdb+VA3ZTINxxpxBQSnSH5QZ82iGJggubmvj72WHWwMkqL
	Q6rZasHNLrtj2uSiS3AewGk97FAemdBIUSQC47zbK6qGz3QQoUzxFmp5fyHp5PHIqP3/9noaVHT
	GbGbo1sqyXGGfHr87UrqFcDlZNFE7UdIbgP/A9HXef6Ldpjw0T0CLCTBVgNWNGBg7/HKXh1fexa
	I54qEAGQ4a+A3KBtVJi33xwLotnIKg0DT1Jkwgm9ryfcpEPYQHeNF85aTr5gKo8GfDlfxw==
X-Google-Smtp-Source: AGHT+IHOHk8TJBRr0sBHN2EWnni4dWmQyRoi02AYzdaqeaER/SuMgxjuj7zd07Z+tSovwNvLSRBE6g==
X-Received: by 2002:a5d:64e7:0:b0:38f:2ddd:a1bb with SMTP id ffacd0b85a97d-3a1f6423f98mr3755730f8f.8.1746815913342;
        Fri, 09 May 2025 11:38:33 -0700 (PDT)
Received: from localhost.localdomain ([78.210.112.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2f4sm3999878f8f.78.2025.05.09.11.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:38:32 -0700 (PDT)
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
Subject: [PATCH RESEND v4 3/3] rtc: pcf85063: add support for RV8063
Date: Fri,  9 May 2025 20:37:50 +0200
Message-Id: <20250509183750.95836-4-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250509183750.95836-1-apokusinski01@gmail.com>
References: <20250509183750.95836-1-apokusinski01@gmail.com>
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


