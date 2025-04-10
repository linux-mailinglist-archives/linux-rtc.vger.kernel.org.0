Return-Path: <linux-rtc+bounces-3917-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7595EA84E18
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 22:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2E2D1B64633
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 20:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E2C290BD1;
	Thu, 10 Apr 2025 20:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3UNx1xi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773B8290BCC;
	Thu, 10 Apr 2025 20:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744316624; cv=none; b=uXMCrcRYQa5Rbm2ML92XGqWV6xT7fCotK/qnQyPMrB8fwf9llobIsGzoWG1vF9iAzDwpPAPTcb8aH4PF7EzYlmf8UsJPMowW2cIsFVYVfsAvPhqQUPLIMq2yVwPrNUhmHs+OLsDY8/4J2QOCxw4ofs+WruuYopVc74kxIywGO+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744316624; c=relaxed/simple;
	bh=jwsoeajWLSOPJcvIZix/A6b+favE2I6KfWiuZwzI3kE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GcbbmsP/fHzMGv4s5vxrUyKkAbPvsqMBx2jyKiHjXISTOPrFiHeroK0zZDzshkLIatzZDWN7R7XwqWO+qLRJzs3NGaHDCyopqun1MQ8KIYIhUzPQPVueiBEclql4/YW9uIaFp1rKbAMPzUyvKTsByHA0kdV7erqClBa/ndZS0MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3UNx1xi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so9937905e9.0;
        Thu, 10 Apr 2025 13:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744316621; x=1744921421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EL5d6O3loKPdrSygpYmikEvuM6mYmpkHUhAOsZ8Nu3Q=;
        b=O3UNx1xiUfUAjhkD9aHo+tt+ot3erIlL19rxWKeox7SPQg8ojU5wa2+F4y7fpyl23C
         qX+fUbWit3etR5Xr3JcQybG1va/tv0fcj90x3BJ4FJ4Be9aY21JoHDI3vZ/RU3tHlATf
         sEJqmY0JhvF/zzEa3QkWu0omrOH5+5s5LT3jGAwHMfnwfQuNu99BPL1Hag1RzE/G3kKW
         k/w5wPk2K5rkBAM0dNykY9JLXZP1lC0B4925i20efO3uqt3b2HczHpfdjQXFayFtsS80
         v9+D25BxWhKKUnzo6rPZuRQXOEZMJqKNUVislw7IhKxT037XzTei791FYEjN5su5qnX+
         21aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744316621; x=1744921421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EL5d6O3loKPdrSygpYmikEvuM6mYmpkHUhAOsZ8Nu3Q=;
        b=q2APH4El4hxSQAEmf1GCRD0IduwilbzPGD6G+EIdfhrwPgns1b1/SYsYkxxcuKZ/5O
         ksvUXdFBc0y8o5LWR52jckJ3meYKUYnE9dQGLe5p87fn/XROc8BYVHxJgxIP2TOY2XzN
         bIEc1pzP4FTGr4E7e0zZTG4zAtAJ+LYxHY951TEAKbzv/Cv50DRciHoNTWxzvV+X/qrO
         iWoSetprGTdGGtgRzQ+hb7/bt6M9Lsk3T/AEv4en+9VE3inevtbp1/86OyrPmTsHqYIX
         D+kq86gPUjmQ6Z/HRKm3IUHAHkDVleRc4pJbwl//KfA0K8GNC9QLNm+oEfudNpMgvIXv
         aWpw==
X-Forwarded-Encrypted: i=1; AJvYcCWofVjfj1cj39x4/PckH/uz/F1CXG1F3ocndAY3mqsSa6FE/uIueKK1N4KzBWLwZcHaM9Gjc/4xIq7I@vger.kernel.org, AJvYcCXpUk+J4P6TOQUjQxddiByQ61kozrAndKw91X3VexxR1K0Tp+mzsiUuLnxNoqIyxfwSQrzhfvfyWTyWl93N@vger.kernel.org
X-Gm-Message-State: AOJu0YzrmOBSJiiDxLpRRJzsWkXqCrta+S0NTr9DArPIyFW0cML3sJbp
	5gflRgnwymFU6+vTM/XAGAHZSwvhfZOjmutbO99OF1H6ZzdXef0H
X-Gm-Gg: ASbGncvqpz7Ryj/kdwds8SLlHo68pXVXaLTBwUbjwQp5SYy2Ell4duSKoaRjuVzY5XJ
	uNDTL+NAiij/wJ1okpYL7k7DP1B4rOEfC3x1qnjjeRAI+eRiY/761QYmk/vWKsr8wvA0ZHS8gYP
	IYF9LvJBNFA3c6oF6+huJ0EkBpTEOOi2YIzJC8IHjc/fW7TDWz9SbzGl3XcYy4RRoi3Qnr0gzQ1
	yxA4/HutO2BPeaBzndDatpHIpE14RcJT7fVKTs+KsgamNr4HllQcEk3m9sobIo993nsMHIhiE9f
	4YqeZwEmwnfmzDcLNY4Lxw9PXjsc5Tchde6smnxWvyUyuYDiZWi9TJ6ng1cDRutU3rPh
X-Google-Smtp-Source: AGHT+IHKzorIQwvbdwENPMOUXlPpZT+hyhlsb54T92JVT6PukD3k96kNEOMErT7knvpmesYY1PxYwg==
X-Received: by 2002:a5d:64e3:0:b0:390:f6aa:4e72 with SMTP id ffacd0b85a97d-39ea5200a39mr52497f8f.18.1744316620540;
        Thu, 10 Apr 2025 13:23:40 -0700 (PDT)
Received: from localhost.localdomain ([78.211.153.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c817dsm60998745e9.23.2025.04.10.13.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:23:39 -0700 (PDT)
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
Subject: [PATCH v3 2/3] rtc: pcf85063: create pcf85063_i2c_probe
Date: Thu, 10 Apr 2025 22:23:16 +0200
Message-Id: <20250410202317.25873-3-apokusinski01@gmail.com>
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


