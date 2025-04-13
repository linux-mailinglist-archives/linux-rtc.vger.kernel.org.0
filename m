Return-Path: <linux-rtc+bounces-3942-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45578A87212
	for <lists+linux-rtc@lfdr.de>; Sun, 13 Apr 2025 15:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDFD61703B9
	for <lists+linux-rtc@lfdr.de>; Sun, 13 Apr 2025 13:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D811AF0CE;
	Sun, 13 Apr 2025 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVVw7Vo2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269611C8613;
	Sun, 13 Apr 2025 13:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744549739; cv=none; b=j5EVTuuHQRvjE9+aV6pjrnZ8z7bVK2zApT8/mIh5cphPMzrNeHahixfykcdznomXGmMNaPgkolN0qXWr9LYdlXiPChz5dkz2Qa9t8MxXAbUJc7HKsyrABrhMWYd8biLya7MeXwHDZkbDLuSaF86nqacvAT7/vVZsnGiR7Ns4Gf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744549739; c=relaxed/simple;
	bh=jwsoeajWLSOPJcvIZix/A6b+favE2I6KfWiuZwzI3kE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cJHGi/TDSpwZ/GF7e4mU9QDLw1FFX7KaZOvXQ/Eo500QceCpWrQk+n0umelE6Sj6B0AwoaL7RW1DxgdlWDeSaN1L/IYBR3PEqbbLzYpELjS8nxbenR1fodu/CgHyLKlmm5uVESUWVnY3YgpM8KSU/ZRohVyb2rS17gfKBJaB3to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVVw7Vo2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c266c1389so2306742f8f.1;
        Sun, 13 Apr 2025 06:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744549735; x=1745154535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EL5d6O3loKPdrSygpYmikEvuM6mYmpkHUhAOsZ8Nu3Q=;
        b=fVVw7Vo2q4NBoeALSXHTCISUNGbyfy55x4k/e6YgMpPHiAY2Rl2bO0F4NHL7K2635K
         PMGyVXMuGBQXiown6r3FNKkYK+JxVBI8/GzUV5tWA+1tZ2xD6VMv2KHfmGG79AJwX6Uq
         5k/2/weHOfAD7JBkEWLtNUaZujlHutIw2y//V4Bd9kHvv2reGugz5A7Nuy/EWpLo54Ps
         /dhYngBy4CRikCL0uhrYAs+pSuFgjmzeUy32qK9CjtGz/imWJcc4YdAgqSLGOGhhAcQs
         /msJPPEuw6OZS4PkAfrjFBJJmFa5hJyCAClENIm8ywlJphyJNfMpTatQaJmfWYfRmsiK
         bhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744549735; x=1745154535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EL5d6O3loKPdrSygpYmikEvuM6mYmpkHUhAOsZ8Nu3Q=;
        b=Io0/HbzhMH1PCNYM4DChIQROk0oJrVJNiQVu3HmfAwdb3Ow/kJBF+KSM5alXwZ09lW
         55TMY5Zrua0VflZKl98GfrSz9VRdJoipiKXld5Y3CqjIypl4k79uddOFpQnnuyXn+kRI
         35tZktQ6f7qUSFmrExtyzt0O96y5D+ofICJgyQr6MNJHewS+TePZL8E1YYZdcA2qmtKg
         XFIWgZ0wfQSm6MSoSDmikmyv0+lrgRbeg2+FopYNbKrzN4vZ8osYwqOpi4VdXFu//gu8
         t8FcR/ZGO2EBlBvFEMbbN7/rq3ravPK8io2yMMpOAw+f68ntNqiir77rErtk20N+tR1z
         xnYA==
X-Forwarded-Encrypted: i=1; AJvYcCVRiUqrg3f9DeT8ZC4WoQ2piYRuhgoRSzwfzoChT2pEBuRnSIt90pMUqpoCkB0KFdMJ8d5gOE0lZXx5@vger.kernel.org, AJvYcCXkF2Mxa4SugLkXG3WZWjM3B37N5NzZs4CBOPPEQ3+hpVqPQZVYk54fKPkhzUsK8UsMar7O1vQm5KYKoBmK@vger.kernel.org
X-Gm-Message-State: AOJu0YzBo7bwicF0lYPZ9nJRCQpJhO9mC1lRDmDI7UIc2X4kdZ6xTOqV
	+usZajjR5d6aUPH0UBELY2Sx20zBQG/d+CQp2g07zILf0TewMceb
X-Gm-Gg: ASbGncvDbcwz5Cc/c4t+Tj3VAjuXadOkQmOty4rvBkOu83LklzuJWeYY3Fhdu8WvcTl
	Nbql8IPDGG8nN4/hnVXJYmF4AFIJjQmfDww9fySXKjJ3NbWA59oQefCcDseNAIABR4mdI3W0v3t
	StskgTCmz8bf6mPQ8z8k5lmJByYPC198g/BvF+GlvomU/VYAhwfP0spuzX5adQcI0Wyjba5ZMC+
	HJrQlJRiLhhzXyCzmcabn7n64HDM3nnX5yfgvWZk+pEQ7lBT0kDIlXPEDfurK1vqVPG6RYCoq+F
	OZLyUKh3fmK6SZSSyxIjTRj0W/jztTUQYEsCir3qOBiNyNktIlu5JpSnLZtEbYBCLEntKg==
X-Google-Smtp-Source: AGHT+IFQnl9V89hhf1rVdX4kwhRk8gWLs1q/eD2u6rfvW8HiavhuqnMCHXUDeIH/RsjbSxnMag3V1A==
X-Received: by 2002:a5d:64ae:0:b0:39c:2688:6904 with SMTP id ffacd0b85a97d-39eaaec7e3dmr6320046f8f.39.1744549735163;
        Sun, 13 Apr 2025 06:08:55 -0700 (PDT)
Received: from localhost.localdomain ([37.161.110.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445737sm7739348f8f.88.2025.04.13.06.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 06:08:54 -0700 (PDT)
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
Subject: [PATCH v4 2/3] rtc: pcf85063: create pcf85063_i2c_probe
Date: Sun, 13 Apr 2025 15:07:54 +0200
Message-Id: <20250413130755.159373-3-apokusinski01@gmail.com>
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


