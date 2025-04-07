Return-Path: <linux-rtc+bounces-3821-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6323AA7EDA8
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 21:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3141D1882EE4
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 19:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C8E21B191;
	Mon,  7 Apr 2025 19:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igq33PqE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBEC21ADB2;
	Mon,  7 Apr 2025 19:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744054585; cv=none; b=stKIN4TKh6aHCBnJpWkztdvhXMJXTpguyUNIwXRDvbn8Ll7sVeZQGvu+wWt/6+FhjAslUu9tNWUpPcuW++RsNeJPAr3emUtcol71JsN/0N1dwcFokd+eqoVU85e02MceW5cNbN+my7rg1pollWmwOImQVJLeQ3THq8keyI7FQFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744054585; c=relaxed/simple;
	bh=ms+tYdR53053E43YyII93QJlp+tohqyqFRMZhXt0p6E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZijMFE3R4u5rsETydhmQhDlDYhEWw0bE6ymhCa/3qsU9eTQq4yQ6N5NmFg1BW+zTx71M2u4P/dcrqPnSBGSXzdq/WYHWIrLgsfn9WGi9ZNfLOVE120v697mdXNEIueCVLreqDxvSuBpb1LHW3T53lpoYNHdrWGolMT5+X7TEQ4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igq33PqE; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so45720235e9.2;
        Mon, 07 Apr 2025 12:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744054581; x=1744659381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlHmBNOkxmZPTNxQJVMiMMe6Xd3Ab4qQY+iYtGL1uvM=;
        b=igq33PqE4waWoJ234w7LsPniSZuEX6F3W1g2F8eNRhTryRjeFsWIQsv4k4Rk52pzx1
         0RcOuKfHUvakeuXmk+6SeDrIdtvdszkFp1gkYx1wwtZgnE4ENrWDhZHWuDOJemNkgVu2
         Rvc7qXb1Lcwi+ZKpa8O8bWkhb5hHMdlJkHB6ecvwlL0cMPkUGc3JuUJD5ZwhG6FXmOJz
         Xw+wJwj+PfsNva2plv7g/YNaA+h0wr27s96lHYv97OyG43prr+DnkHg+hX9Ss4EfB5cc
         b6y76azOEiF/JBbMBMRkmlcORWk/VgAhqZos1Leb7k502ovuWDenfWH//+3TWkA17icS
         miAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744054581; x=1744659381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hlHmBNOkxmZPTNxQJVMiMMe6Xd3Ab4qQY+iYtGL1uvM=;
        b=hPrCkJkbkel3z3VWOb33JxoXxaaaHIRaLadgGxoDSeKnDIodCZAHPfJdz6pe99mXkA
         7epODzhjlANDieqUvoRXrIUP+rUckqjT09lmy8vMUgqORbjub6NkAVOK2zoxv96yQA1W
         4UIxXoQWaYHYOQzaLB1MWvY3ffU5JVyYYv4yUhj0U9rGnyQbslOfbut61RBOi12Iitf6
         Va3/EOj5okaD144ZskaSfSi4AP4jdkNCoY1FQe9gmK5sx20eMys/RUHKVFwDqgRNeRQO
         wZ4Dq9ErOFd253fNLYfMMMO0sbuZAXSKFCsRlf2AbYpXX+EzearPJmgAjb3e4fagu3x/
         0MVg==
X-Forwarded-Encrypted: i=1; AJvYcCXVYqh7TnUx62xPToHkMXNcQGJO5mr90Y0cnGKUSsDApuF7xqAuAI2udw9Jh4DgDAbPE1ubAxtufiW6@vger.kernel.org, AJvYcCXwnhSddYwYr1uMds9dIpAk6fCSSUZZ4izfawITOCepN+Mn9S1PyQUbKCVdEOMXMFemjN32nM5Qx848rzC8@vger.kernel.org
X-Gm-Message-State: AOJu0YzQVdtqpYXZ69sQyjBdZJGFwlyS82gqROBMudRc2w8jBGXjHVIr
	xImo3DtJ/sfk3bPLH1j3ETtQLCfuK6/zxR6sE+Oc0nTZRwXWMMi+FwKTQdTKQQ8=
X-Gm-Gg: ASbGncumX1/CqVAx3kD0GRtwS9Bd6FKIHQ07J9ZQ+Lw0bcR7/ZP78o/FrNNvMHr7agJ
	HzbRrbnO9xXeymUFUMXiJfjvhaWOEP4AXuETDTmIn13vktg+uF7YfaYEff25fnfalWSlBnbI8bZ
	Ws+ASdgJmvYSNaKBZTYE2nkdsAWxHOdr6rJdeR3qY2gJJJf47DR473WsTKMkn7KZif1iJTp8teC
	PS3jog5/RazbpKved0FiGeuI/L20xzVx8+ful9tCT8LT7ecNF1CNk51Q5j5vXr1wquuXS1WiMml
	fQ2xoROjcxHDQnUAnN23+j4nXhsp0pKsL6V4F6/D6DoTAaQ9I186C39zz7qVPz8=
X-Google-Smtp-Source: AGHT+IH1hs11OVfqQQEd0Puk52b90jTdsp1VBSkd909WOM5UwPPvjaCV4xVQzK5kVLzuDliSWuvy8A==
X-Received: by 2002:a05:6000:2482:b0:39a:c9ed:8657 with SMTP id ffacd0b85a97d-39d0de17e4dmr10920173f8f.17.1744054581141;
        Mon, 07 Apr 2025 12:36:21 -0700 (PDT)
Received: from localhost.localdomain ([37.162.191.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d62fsm13122812f8f.79.2025.04.07.12.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:36:20 -0700 (PDT)
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
Subject: [PATCH 2/3] rtc: pcf85063: add support for RV8063
Date: Mon,  7 Apr 2025 21:35:20 +0200
Message-Id: <20250407193521.634807-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407193521.634807-1-apokusinski01@gmail.com>
References: <20250407193521.634807-1-apokusinski01@gmail.com>
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
 drivers/rtc/Kconfig        | 21 ++++++-----
 drivers/rtc/rtc-pcf85063.c | 74 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 85 insertions(+), 10 deletions(-)

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
index 03dfc58f4cd7..512933479dd5 100644
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
@@ -725,14 +741,69 @@ static void pcf85063_unregister_driver(void)
 
 #endif /* IS_ENABLED(CONFIG_I2C) */
 
+#if IS_ENABLED(CONFIG_SPI_MASTER)
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
@@ -740,3 +811,4 @@ module_exit(pcf85063_exit);
 MODULE_AUTHOR("Søren Andersen <san@rosetechnology.dk>");
 MODULE_DESCRIPTION("PCF85063 RTC driver");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("spi:rv8063");
-- 
2.25.1


