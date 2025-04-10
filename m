Return-Path: <linux-rtc+bounces-3919-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E54F5A84E24
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 22:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B3C74A633C
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 20:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2A5293461;
	Thu, 10 Apr 2025 20:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghOgjhDj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B13290BDE;
	Thu, 10 Apr 2025 20:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744316628; cv=none; b=XGVGPlvEIgRE5/fLKEXCH27G0TfVwVBD28q6h8rzcTp5So59sFT6PgHnETrOdIR2D/U1qfCVzlL2h9rUfGrHEu4jsFsxJFdawNi70j5nRcueFuC54rkq4eSZxMJ3ultp3J95smoN+w9GjZB7Uk79rWhp31UAa70ssQDk3nxEFVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744316628; c=relaxed/simple;
	bh=29MwE5bOHbzihqKS98mIQfYlP2+1BKDsSNDg2G+7wwg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ORwyFyIwmAx9IJwcrv7UHFTJQNCfvOk1gfeRODPo/+racSZC1YG5LEN9W8Td1DXqNLQePaErRDR85uNCMB6jFxXE++fH3vTQf9/f0DCt0k4hLeodX5CpTYcS222+UW/OeYKGlHlIzfxSoAGGNKGGYFbIDrtW6VkbzZ5HG4NQXxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghOgjhDj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a823036so12763825e9.0;
        Thu, 10 Apr 2025 13:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744316625; x=1744921425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aB27vvwT7DSR/rq1zNxpJ8AqSNFk9AHof2SWw8w5sY=;
        b=ghOgjhDjOHsbk8gXbu4yg6Rt/YfCI4yan/8daA/Nck06gCnQsOMXg1eFxtDsb+Ijl/
         hm+xYp+Zoa2R4IKjKA9qaVxwhjGHRZlofj/F9SBCPE47jwxTPH+EV5BnVqLXTtw56/Pd
         r5FOyhpE+2R/hO28lzQzw3YWxs2iJ1kvIm1IJBh8gILR4Ah47nbFF+pvRc4L/EGIkJxP
         IMZnnFIk+5zhBnEtTuApMz0oajmvYdldRNSqsnECWJpocVzlnWid5FOKMtfXXpE8kh8m
         +qiA8IxFJqKu+qnPOD02cUZ5r518WotL7k6x7/cf2gNln3Fp62kKq9D1eXqbuquz1Xan
         57QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744316625; x=1744921425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aB27vvwT7DSR/rq1zNxpJ8AqSNFk9AHof2SWw8w5sY=;
        b=HDo1YAhkmMOiHKT3cZrHlXRu0oPn0piK+u97bjLgUab++wn16fJOKdxDzpQ5otFlVm
         kqbd8QRfCF174IWqOyJjgwV/r1aAxIhe5yTXBC48K8YmB+OwBCM8Yziv1CmQ3UL06Yjk
         nnBUZpHc78qxrlFpFI7zkOpq6tzajmrt92Vk/5ew24255o0FMQ+50aiETiLXl9M/b01z
         BSWCEeytnvzAUf1yowQfU0vMhCOD98RZ6uxjyb6rGZwGh/zBLOE1t2dJVyymREoIUGRB
         ciBV0TqSq0MwyeeYrf811cW5CJRgfi+j0YXbjsGddWJyrCBFnm8ZU4yP9WQ3g0Xcq7iF
         iDbw==
X-Forwarded-Encrypted: i=1; AJvYcCUDanyQ/+MDNWFF7ksV6wdk8avovhhs/m5cvzzBs59hBrOgHyd4UB558ipOvNcrvOLf560VGhjJ1vQ9@vger.kernel.org, AJvYcCVrKnegaS8E3tDylLTOjPLLsPsp0UFt7HhbdzJeJfyRjZ7kPjZnmT9AZ5fhUibvlCWS3JXLSNMwxbWWYCb/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3zO+N1stVjsh8EOo/l6HQk/AKuOsOZk/XHgVAYu94g3LFfPjZ
	1OKmePSMB6s7n5Kw5mt3DcKPKPLLZviZMPBAv/etiQVB03AQyUM6
X-Gm-Gg: ASbGncvd3FezRPNmg1Z61qYaVgJPmFnPUf0xtjScKVExKqUx3SKKq/ZpxDIgZ4s6Xvi
	IY9PqlV/3QSNdbLjpnxyI8dHOVO2AelHBkbzKWfHMbU+YXts72pVKYDT7V1TESjvS6eFr4g+1fh
	nmBmg5N0QnwUODmz8P2m/9etAuLyMa4+U49j6IBf/cL5Ey6Pbpf+8H0yfPKBBJE60ltKvASrME6
	imdELiqNKW/70jsKoQ0cJ2wxmfgi5KaPdce9+U8ezLVSh0bq4OeKREvmw+hXuzJbNegTedn+IK5
	d4/3+Cjjz/IWR1+fHDW0MhTyg86fsgZz4eLF5S/3vO5uzYC9JrNfF78PlfQNUhQokSpH
X-Google-Smtp-Source: AGHT+IG8eRmwUe7uP4Lvrhjpc6E+6izutYZJF8iXl4m/cVd72XyLQ5YRD0EFjcKouL//mH6R1h45qQ==
X-Received: by 2002:a05:600c:83c4:b0:43c:fb8e:aec0 with SMTP id 5b1f17b1804b1-43f3a925ademr26335e9.1.1744316624488;
        Thu, 10 Apr 2025 13:23:44 -0700 (PDT)
Received: from localhost.localdomain ([78.211.153.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c817dsm60998745e9.23.2025.04.10.13.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:23:43 -0700 (PDT)
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
Subject: [PATCH v3 3/3] rtc: pcf85063: add support for RV8063
Date: Thu, 10 Apr 2025 22:23:17 +0200
Message-Id: <20250410202317.25873-4-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410202317.25873-1-apokusinski01@gmail.com>
References: <20250410202317.25873-1-apokusinski01@gmail.com>
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


