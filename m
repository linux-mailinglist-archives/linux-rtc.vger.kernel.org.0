Return-Path: <linux-rtc+bounces-3853-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9939BA82D45
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 19:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05FB488808F
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 17:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD03B270EC3;
	Wed,  9 Apr 2025 17:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cs+hu0r7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D161F270EC5;
	Wed,  9 Apr 2025 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218587; cv=none; b=TpjBa7ScTAN45po1YoNpX/tRI7bWQge0JTdXUVvBaAGP/UhOE5Dxc7N5cIamefTdj5f8HBEjn85++88Ok/89jfPDruRcbQnmOWfw5b3kJFTNFZFZnymrKVcBlhPYovpuY3fasbzn4tN/1yOuHJSxkMdDjNBfsI6q1a9rP3mu/6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218587; c=relaxed/simple;
	bh=jwsoeajWLSOPJcvIZix/A6b+favE2I6KfWiuZwzI3kE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Biz5DWc/PMsJVO8A5/iaxVhkD517CZVbSEQ7vxR2XvZtPKXqZpldSxMNmPg6lov3L6Hl3F+JgPBN4inpn9G82t2j1TmqCkOArUtPshGEbp+nVazTbvEoBYvaaeGOFsEOEghbPNFv0UknudZfYy8gxDKZzg/IlzkXPXPWbgLpD70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cs+hu0r7; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abbb12bea54so350158766b.0;
        Wed, 09 Apr 2025 10:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744218584; x=1744823384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EL5d6O3loKPdrSygpYmikEvuM6mYmpkHUhAOsZ8Nu3Q=;
        b=cs+hu0r79CpNQVRFesrelHA85zCuFJCNRnd2Bk2jReiPawPUOTFcvIXwiX6/y4VsJL
         ZjwZPp4K/oQYCkpLCNsR78NfV7+V4Md0357x10ba9NDRGfNrRumizvSmOcJkjNeU95VJ
         72+uwZXBhIn7TRPGV7iDzGpk/ViQYYRmMwHhOVwQHkxYEhJzkFevjUy+SEhXtJybuRBD
         8meaxyGOblksgKIqbj5MWU7v89R7Faz+QWUQd5r3npYTX92tix8iHqiG3n6Qspi0V+Mm
         JojIV3qASa+TMBwpV+09x4joZQLMU5CU5wiSRz0wmishyRGV5sl4F9Qb1xLNExu3cUcK
         IIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218584; x=1744823384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EL5d6O3loKPdrSygpYmikEvuM6mYmpkHUhAOsZ8Nu3Q=;
        b=hWI5NQWmhktJINA3lVV6fL4G4ala4NAW9nkccwBn2XmOE9vkquS2U9t25lq097pUxj
         k8xqJTdB72R25T/K0YnwHUBF4AL4tCu/QPK+DBwaTnRad4DUp6Mx3BZ1G1TCv4hxBdPY
         ydqGwIRQgRtw5S4IEZoxBZ4OyQPMPOa5bCqhG1qsc6EylJgd4VxgVjBV3pWb6Rfx0wxq
         ezG/6lerdZqIF+ZJzYzNhbgFZYYDrdHw2oJn3IjxBfS+SAH/+EKzsU9qTc8AgenEX3/i
         KfA7o4kprY3kmNaFYKjQw9hQtnnROsh1sokYtNXPlKXM/4oWS59Nbj4OQgblsk3ezZRh
         9r9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUz6rdMJoK669/HOL3qUygAmj5/0f7P0xlGJRBhfhEdwtAxdTwWwwmervrGMehc0BM7ITbP01qcdI+D@vger.kernel.org, AJvYcCWIt8lIM7W1VZ09a3cGrQ+eR7LMWZPaklchhipMPOuk3PX3x7DLuUoHyQzu5bUJByIOLqF3To9k5q4vNNMA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxao9MX7aa8nh0SpUXEttnn43UC4NRBX8FAsiWDaA4i1uz8hM9n
	RijNcScFO9n0pilkeKMXBZI/mzyFPjXiT8SEUbZcG6w0h/T3qgQkM1vA/ZkYUCM=
X-Gm-Gg: ASbGnctjkjFhjQHhDdi0XCUmRAggEHqPF/FO70UMJ+Nic1UC6uVle7uFx8kzh2ma6hL
	kQ/qEfsYxwR+zZPLwIjqAv93wg4kZtREt9l7Nx08yK5W1GKMG8EUkcMaBF3utuY9aM+pRipc11+
	7ifymgexcE8j0ZrGZ9r9scRPpN7ayCkF2IoFup1Oo5p1ryF7o+kGwoZtIUbeLy0FFmUZiNx+uuH
	IhGZhTpC44EvylycePh0eAjwpF+lIUlHjb0fDMyQXUNntfoXe3TAKWV2scvl0xxF+Dhx05tuaKa
	H4buBn20dPYVKHtyzO2aNuoqsGaDrC9eJQeZlDKDpbTZf8OZ3Pm1Khi6KppEt1x/C2Mj
X-Google-Smtp-Source: AGHT+IG+q28JqOmkm6ZLT/YWkw4dfJVSxKtDocQSw2d0jFM6kZ5goVn8zSjt/yqpDQJVn9C0kabqwg==
X-Received: by 2002:a17:907:7208:b0:abf:67de:2f1f with SMTP id a640c23a62f3a-aca9d70e673mr256615666b.44.1744218583803;
        Wed, 09 Apr 2025 10:09:43 -0700 (PDT)
Received: from localhost.localdomain ([78.209.27.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be913asm122151166b.47.2025.04.09.10.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:09:43 -0700 (PDT)
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
Subject: [PATCH v2 1/3] rtc: pcf85063: create pcf85063_i2c_probe
Date: Wed,  9 Apr 2025 19:09:14 +0200
Message-Id: <20250409170916.47224-2-apokusinski01@gmail.com>
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


