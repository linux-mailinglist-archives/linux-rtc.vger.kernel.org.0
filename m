Return-Path: <linux-rtc+bounces-4082-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B37C6AB1C6A
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 20:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24B64540860
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 18:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA1A241122;
	Fri,  9 May 2025 18:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+/xbjSF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105662405E8;
	Fri,  9 May 2025 18:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815914; cv=none; b=QPRR7F0p8sLdACqvb1fTQoHVj5kv2ATMuNh6G0U1yS+4n5aDowyaLgJTdKGv+fs/Ub7Kq61ES7hy5duK6VsJR16ERnPz7PLzXETnooQ7avLTfuwJABl3Xd6H35NBy/6jyBsnFgkOIsbChzMy50kLu9sh/kLT2nZHkDBCIazySaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815914; c=relaxed/simple;
	bh=jwsoeajWLSOPJcvIZix/A6b+favE2I6KfWiuZwzI3kE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gIB7vO26JmYnMDlq45L2tlAa9qmKYQw0/jVTZ1SU9M65vdX3u3EBcjHT1Q1LgLQMwX/z8UIh63ddOUR8leCmqKCsgI8FaZ6gp8GPXVqB6YYBqxZ8e5cUjzJt/PAn+oMkNI8YQKiDFlcne3soLJuEJveu/lB3M7yCmQlQYWjOgZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+/xbjSF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a1fa0d8884so569521f8f.3;
        Fri, 09 May 2025 11:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746815910; x=1747420710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EL5d6O3loKPdrSygpYmikEvuM6mYmpkHUhAOsZ8Nu3Q=;
        b=k+/xbjSFSQlwcXrmzDFq5gEsanbQbBMtSDS0oKoahab/ccjhvcwPuRaaz+RCGbh+LD
         dd8o0hUAnyo3/snDtkLb97kJXyBYWjKPrANjcttFs7c3hacKwmEMSl5a2kebmfEahh+p
         8h0nO20P1t8pEA2DBtohnfWEDT/08XRgvepHFJ62SrTnBbM1+C7rVGjlIt9TNTdFDth1
         HPxQn+7PgwYw8H6FcTISzaj2t2Jnw85cV4TIXMf4xX+BBZEDGyCPQnQtv3Q6ErbsDkko
         NhArpqvIsGOzPMVXz5xyb7rMS5ReN6xzZSF86B3Gii6JscQxeX05XJN1AuzcFVgL/nFN
         aj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815910; x=1747420710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EL5d6O3loKPdrSygpYmikEvuM6mYmpkHUhAOsZ8Nu3Q=;
        b=ccu9vwTVOsokToqnWOVU/69pVo8SxIYl2MzUpywpq1lWXXkGLpZ59bfzu3quSwy8/R
         mOVGt+tFkcawlHubb5C0LjfZkOFKy1FA6i/XM3zoHfVoYqEkhSdgaxh39mTU6Pewnega
         G46L5PV0+q7wDU1YTjs7Z0ez+CfFtGLo3NnKJoDG1zLzSnXaiAebOlY3adTOBLJ9U+i+
         WV0M20M7GN+PskCznHDKcj05IpUS04C1YBIdV7Rcb+bQ6tE9YPfwmwVx80BIHtYGaNT3
         h1JR1FimKyV3H3MbJY0RbBndOJs6nH74J6fydHE6wtsf05w5Czz0BVfQgDwzH0ScWipx
         4F1w==
X-Forwarded-Encrypted: i=1; AJvYcCUIzEuIjgmt4VCPWdqQZDo87SG8M3UV5z9zOvQ5R4K3KvRp1nA8u0pcpLXaq0NGEadE7sZPPjeKBaec@vger.kernel.org, AJvYcCXZcsGL/hjOvWFMEJ5PZbjb7SbLf+mUTTHN7zpi6p1hA1SigCToBlO4m9CCx6TjqJo9u9kQjqsJ3EtY+Ebs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfh40CieDxE3JyfBylJA4aaxsDCqg24lKdsM9RXowJKoI1iPD/
	tIcbTssu0F1/tIO3jycA4z9yLHPUOb8F74PfCRkHXFYGK51g4q/I
X-Gm-Gg: ASbGncsj+F8RHYidCJAzzV5XW3fL3B2A6oaf1uQwzxFsieROumvZ+pFTwJENGCJppvc
	kzrrVtZTU8Llzm8UL3u3nOuzJRrcFmVRIx6uCQC+b0Kn2nzUd4zizcbgojcMd6GF4uUtj9k/PT5
	CTJHtMhrveIe0sinpEWnWZQ86eAlRCOmUU3IyKyAVTCLU+0gTsnSQ9JBasdw2Obx6mzJGWzu9NY
	pAJrGqlJ6cb9PakdlF7Z80GmRHREy2rBj8n0ANpdDT7L3Bt0JKSerbcOEoFX5JjDBojVwBOLvST
	MWO/edDYnKxNKJg6qIo+BO1VI/gAfF6K2uJ+gJOZ8Gem4kBKg/9yGHM+6uNULngoJAN8TA==
X-Google-Smtp-Source: AGHT+IHTQJB4UjJXsOyBDplbdrpKSv/9SS/FfSV/rIFOsJpq4daCdCNrQxp6hNkbrNaVujk/xK5wEg==
X-Received: by 2002:a5d:64e2:0:b0:3a0:7faa:309d with SMTP id ffacd0b85a97d-3a1f64a4b62mr3746983f8f.37.1746815910106;
        Fri, 09 May 2025 11:38:30 -0700 (PDT)
Received: from localhost.localdomain ([78.210.112.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2f4sm3999878f8f.78.2025.05.09.11.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:38:29 -0700 (PDT)
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
Subject: [PATCH RESEND v4 2/3] rtc: pcf85063: create pcf85063_i2c_probe
Date: Fri,  9 May 2025 20:37:49 +0200
Message-Id: <20250509183750.95836-3-apokusinski01@gmail.com>
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

Move the i2c-specific code from pcf85063_probe to the newly created
function.

This is a preparation for introducing the support for RV8063 real-time
clock with SPI interface.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-pcf85063.c | 97 +++++++++++++++++++++++++++-----------
 1 file changed, 70 insertions(+), 27 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 4fa5c4ecdd5a..03dfc58f4cd7 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -559,12 +559,12 @@ static const struct pcf85063_config config_rv8263 = {
 	.force_cap_7000 = 1,
 };
 
-static int pcf85063_probe(struct i2c_client *client)
+static int pcf85063_probe(struct device *dev, struct regmap *regmap, int irq,
+			  const struct pcf85063_config *config)
 {
 	struct pcf85063 *pcf85063;
 	unsigned int tmp;
 	int err;
-	const struct pcf85063_config *config;
 	struct nvmem_config nvmem_cfg = {
 		.name = "pcf85063_nvram",
 		.reg_read = pcf85063_nvmem_read,
@@ -573,28 +573,22 @@ static int pcf85063_probe(struct i2c_client *client)
 		.size = 1,
 	};
 
-	dev_dbg(&client->dev, "%s\n", __func__);
+	dev_dbg(dev, "%s\n", __func__);
 
-	pcf85063 = devm_kzalloc(&client->dev, sizeof(struct pcf85063),
+	pcf85063 = devm_kzalloc(dev, sizeof(struct pcf85063),
 				GFP_KERNEL);
 	if (!pcf85063)
 		return -ENOMEM;
 
-	config = i2c_get_match_data(client);
-	if (!config)
-		return -ENODEV;
-
-	pcf85063->regmap = devm_regmap_init_i2c(client, &config->regmap);
-	if (IS_ERR(pcf85063->regmap))
-		return PTR_ERR(pcf85063->regmap);
+	pcf85063->regmap = regmap;
 
-	i2c_set_clientdata(client, pcf85063);
+	dev_set_drvdata(dev, pcf85063);
 
 	err = regmap_read(pcf85063->regmap, PCF85063_REG_SC, &tmp);
 	if (err)
-		return dev_err_probe(&client->dev, err, "RTC chip is not present\n");
+		return dev_err_probe(dev, err, "RTC chip is not present\n");
 
-	pcf85063->rtc = devm_rtc_allocate_device(&client->dev);
+	pcf85063->rtc = devm_rtc_allocate_device(dev);
 	if (IS_ERR(pcf85063->rtc))
 		return PTR_ERR(pcf85063->rtc);
 
@@ -605,19 +599,17 @@ static int pcf85063_probe(struct i2c_client *client)
 	 * of the registers after the automatic power-on reset...
 	 */
 	if (tmp & PCF85063_REG_SC_OS) {
-		dev_warn(&client->dev,
-			 "POR issue detected, sending a SW reset\n");
+		dev_warn(dev, "POR issue detected, sending a SW reset\n");
 		err = regmap_write(pcf85063->regmap, PCF85063_REG_CTRL1,
 				   PCF85063_REG_CTRL1_SWR);
 		if (err < 0)
-			dev_warn(&client->dev,
-				 "SW reset failed, trying to continue\n");
+			dev_warn(dev, "SW reset failed, trying to continue\n");
 	}
 
-	err = pcf85063_load_capacitance(pcf85063, client->dev.of_node,
+	err = pcf85063_load_capacitance(pcf85063, dev->of_node,
 					config->force_cap_7000 ? 7000 : 0);
 	if (err < 0)
-		dev_warn(&client->dev, "failed to set xtal load capacitance: %d",
+		dev_warn(dev, "failed to set xtal load capacitance: %d",
 			 err);
 
 	pcf85063->rtc->ops = &pcf85063_rtc_ops;
@@ -627,13 +619,13 @@ static int pcf85063_probe(struct i2c_client *client)
 	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, pcf85063->rtc->features);
 	clear_bit(RTC_FEATURE_ALARM, pcf85063->rtc->features);
 
-	if (config->has_alarms && client->irq > 0) {
+	if (config->has_alarms && irq > 0) {
 		unsigned long irqflags = IRQF_TRIGGER_LOW;
 
-		if (dev_fwnode(&client->dev))
+		if (dev_fwnode(dev))
 			irqflags = 0;
 
-		err = devm_request_threaded_irq(&client->dev, client->irq,
+		err = devm_request_threaded_irq(dev, irq,
 						NULL, pcf85063_rtc_handle_irq,
 						irqflags | IRQF_ONESHOT,
 						"pcf85063", pcf85063);
@@ -642,8 +634,8 @@ static int pcf85063_probe(struct i2c_client *client)
 				 "unable to request IRQ, alarms disabled\n");
 		} else {
 			set_bit(RTC_FEATURE_ALARM, pcf85063->rtc->features);
-			device_init_wakeup(&client->dev, true);
-			err = dev_pm_set_wake_irq(&client->dev, client->irq);
+			device_init_wakeup(dev, true);
+			err = dev_pm_set_wake_irq(dev, irq);
 			if (err)
 				dev_err(&pcf85063->rtc->dev,
 					"failed to enable irq wake\n");
@@ -661,6 +653,8 @@ static int pcf85063_probe(struct i2c_client *client)
 	return devm_rtc_register_device(pcf85063->rtc);
 }
 
+#if IS_ENABLED(CONFIG_I2C)
+
 static const struct i2c_device_id pcf85063_ids[] = {
 	{ "pca85073a", .driver_data = (kernel_ulong_t)&config_pcf85063a },
 	{ "pcf85063", .driver_data = (kernel_ulong_t)&config_pcf85063 },
@@ -683,16 +677,65 @@ static const struct of_device_id pcf85063_of_match[] = {
 MODULE_DEVICE_TABLE(of, pcf85063_of_match);
 #endif
 
+static int pcf85063_i2c_probe(struct i2c_client *client)
+{
+	const struct pcf85063_config *config;
+	struct regmap *regmap;
+
+	config = i2c_get_match_data(client);
+	if (!config)
+		return -ENODEV;
+
+	regmap = devm_regmap_init_i2c(client, &config->regmap);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return pcf85063_probe(&client->dev, regmap, client->irq, config);
+}
+
 static struct i2c_driver pcf85063_driver = {
 	.driver		= {
 		.name	= "rtc-pcf85063",
 		.of_match_table = of_match_ptr(pcf85063_of_match),
 	},
-	.probe		= pcf85063_probe,
+	.probe		= pcf85063_i2c_probe,
 	.id_table	= pcf85063_ids,
 };
 
-module_i2c_driver(pcf85063_driver);
+static int pcf85063_register_driver(void)
+{
+	return i2c_add_driver(&pcf85063_driver);
+}
+
+static void pcf85063_unregister_driver(void)
+{
+	i2c_del_driver(&pcf85063_driver);
+}
+
+#else
+
+static int pcf85063_register_driver(void)
+{
+	return 0;
+}
+
+static void pcf85063_unregister_driver(void)
+{
+}
+
+#endif /* IS_ENABLED(CONFIG_I2C) */
+
+static int __init pcf85063_init(void)
+{
+	return pcf85063_register_driver();
+}
+module_init(pcf85063_init);
+
+static void __exit pcf85063_exit(void)
+{
+	pcf85063_unregister_driver();
+}
+module_exit(pcf85063_exit);
 
 MODULE_AUTHOR("Søren Andersen <san@rosetechnology.dk>");
 MODULE_DESCRIPTION("PCF85063 RTC driver");
-- 
2.25.1


