Return-Path: <linux-rtc+bounces-3820-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF73A7ED9A
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 21:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6ED93AA1BD
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 19:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDAD621ABC4;
	Mon,  7 Apr 2025 19:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXU2pOad"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77411EE032;
	Mon,  7 Apr 2025 19:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744054581; cv=none; b=N0Cl6uzgZlD+eK7Kc24XK75S7R6x11/2AfAR9a41DbQWZAmFmD7WODAL0Yk7kqZZrU4KMgiKP+o8XcCBsRnmlAmm7MaKd358hF2RGqEudCDg4nyYguPHQ3ZzqY886mqr02DlxFSY4HxkixbTehzafjyVUJCJLzzrdeAqBSfvEUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744054581; c=relaxed/simple;
	bh=jwsoeajWLSOPJcvIZix/A6b+favE2I6KfWiuZwzI3kE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VbJha0HYgnMkmycd2nbE7ds0eZZl8DPF/uyyvWNHeSXjzzZaOCvZBH373tk0SjoolcDx19PhTnvCqPAM2Iyy4tzO+ybJQOu98YcLKnWm4Zp6J8TAGipQErgSh2vf0nxp1nL+n20bBxQfkBgVekqDqBSjIR8LSGdQ8qYUJ7zxolQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXU2pOad; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-391342fc1f6so4242949f8f.1;
        Mon, 07 Apr 2025 12:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744054578; x=1744659378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EL5d6O3loKPdrSygpYmikEvuM6mYmpkHUhAOsZ8Nu3Q=;
        b=RXU2pOadSFP8WSSMWPV3qegJE+L3/tA1CeaQPxnRRRwy3j11y5LIDUlvGF7Owt2BOC
         IvgCWSqCsxrE5IKMzN6sTbKLRICrYaeGhgeMcaTEwyMIfUO0dtHeuiesmEptNeMCkCrY
         vI7GSizuK6ZehtqMsq+ETdui9mgS958awmRGjx+JsMujhjVaQVvJGfD6PmxXzinOrhyn
         MxWXR1MKoJs4Sj2xgm1rETz/uaTVE2yTFR09C9OvdflbhCZc4GbPWu+ONvUV1nfNwiL7
         A0R6dwrOkueUPR3pTpgRLcaofDdkzBGLeUfL9DMI7DOZM0itBIL/qW+5K4ku9BbBL7zH
         NVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744054578; x=1744659378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EL5d6O3loKPdrSygpYmikEvuM6mYmpkHUhAOsZ8Nu3Q=;
        b=k0lnBxTO0DrWhq4Ev40OD+w8bGXVRuoQu9ZYpASCOKAhSTiXTrWDhVs5Zx7Y8E47Ym
         hkL0gxT7cOEUA8sRy3LGSiBfxfiYlY8zb6ISD5wLHnbiiu3Sn+rr7qT3wCC4vN/5MrAh
         QHDjKl+W/gUKyF/QCnBhe/9utdaGj3XwMGsz1lG1XYPu564LBcZZwQyoGy74BLl2vXLo
         Wy+7pRtZ+r5u/qczqaA7Z/QHZxMllAj+kh+8kNd2gFT+lJ8MTg7nuJdky30W5aouCNCd
         dEq6JTLBA/+QxFe022kWlBGB5PMsX77vrF1GqrE35KBt32IBCHu26Q7QBW9e6C4nJPxd
         APwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV51wxENoVOhDPmEcqbiCuyIl8QX+7LehAXm8cN/R/4BQlLqzcMupoVNo8lKv4fqODS75IFr9yZP+d24L9/@vger.kernel.org, AJvYcCXUqI0SbCLy+dsksKMyIHZYfl4snRAtmDJJN7DxfhApsEGt7dvxv+JbPcpU4Hcy7dfhcuHikLs1rA+0@vger.kernel.org
X-Gm-Message-State: AOJu0YyRXjElydL8FuhO0W3w9thr5FVPocOIUFuB0lBS/9gt1YoZxwhU
	yozYxPnpc2iyxdb527CnNBDI4mJgWancK5UK5cd8NpdO7n2gFUQ8
X-Gm-Gg: ASbGncuCbMDmjMJaWnGmSJyicS9xcfIi1nG78BkMkafZaOzG83sL7vFRVJIRKJAOG/k
	BSfIh68Z/4HCa7WUn7G5LMf2H4Te2TlCnWTlg/vZ9nulL1U2Lh5eXICkGpSK+2dXizFcNfk+Zz8
	Kzu3EZPy23fmhWMReq1Q/4N/0QeITV8jXSpUgNQqI2qIJyQ+MOcv3QlTtOCnonZriLcD7ZFTIaa
	2UBruhbXDLINCK70ihedcD3gWCVztYYC1CUMMcjFRhi3KKf0XWHKPeMLa+GA95Y0kmnGRK4kbgf
	pf+JfLn7kzJbCpvx36PqlDdurZOZviz5qYViw5GWY3AJjfStbJ6sEY5oDKUXfGQ=
X-Google-Smtp-Source: AGHT+IH+JhJvbMe23o1gz6gaJ3o8ZSOAaySMAqbNHxTH1p6tkmuvf3PpSmaArnx/ItinZRECN4gtpg==
X-Received: by 2002:a5d:5847:0:b0:391:38a5:efa with SMTP id ffacd0b85a97d-39d0de28728mr10386777f8f.23.1744054577987;
        Mon, 07 Apr 2025 12:36:17 -0700 (PDT)
Received: from localhost.localdomain ([37.162.191.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d62fsm13122812f8f.79.2025.04.07.12.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:36:17 -0700 (PDT)
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
Subject: [PATCH 1/3] rtc: pcf85063: create pcf85063_i2c_probe
Date: Mon,  7 Apr 2025 21:35:19 +0200
Message-Id: <20250407193521.634807-2-apokusinski01@gmail.com>
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


