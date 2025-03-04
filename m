Return-Path: <linux-rtc+bounces-3401-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA1FA4E923
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 18:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D530542377A
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 17:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD252DE116;
	Tue,  4 Mar 2025 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yi69Q1Mb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECC12BEC26
	for <linux-rtc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107947; cv=none; b=kcP34+pPYUR+lDwCBuXcyQ4eOUcozyFj96NXLo+qqdUZFh/e69BA+HceO3D1bFuXPqxMYtu3/+fmdX8BatnBqeDtzCiasobvJlJsGtmpQ/sMfDPpQNVgbvEh5JJCa/4StC8cWVDcacnE997DwT9DuSzUnFm26sqT5wfjj+yzR4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107947; c=relaxed/simple;
	bh=REGjPiVOjqVZBOjhJUgX7G6ANaxzAPJnC5dNaRot8Ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b47ZY/WnjoctAswM7pD0UQZf9IJcfLIJ4nbiAd/Qpc8aaJUM73nCMfTOaHjFaXhkR2M02mNgVhzBzN8nW2zuOmZJGuYQP0bo4IXRjsYd/xn2+RB5HzJRhGZcs6ZE/FIM79VwN3gAzbrScl7fSHxGhwbZeRr4bXjcK1i7Kr9zZyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yi69Q1Mb; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abf3cf3d142so522600866b.2
        for <linux-rtc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107941; x=1741712741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDySvxIgslRZrTqVd7bcfGaor7CHMjwsKayUWf5uR70=;
        b=yi69Q1Mbb1GkjLEkC7jzKQv1xUdlusqv87QLBkdgvqCAx3CnAQrv1jpGc/bDIFqX/Y
         yGdr2jngu80ttpJmYLHwqJMKS/3cky1zgiecRkteFQUpOQ3CcJnILv4GLF5uMeJtOiAl
         TAu6rx1ocIguFuTz0RXsT5Wyp/WXPPVQRUiWSPyCgSiTCdZ/5a132G0y26FOWVtsB/E2
         utVsUxE1O73TNJRqF4RVDRo12oWzrFGWkgr1drWvYtBgt578P46KQeRBHR4ouzoxAuSC
         TmbpiyA2qbGQXrkLyR4IEZLgbASIR8eljgxN19gtenJ+HAPeKu4XmSVa/QjXz60JJXcB
         kXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107941; x=1741712741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDySvxIgslRZrTqVd7bcfGaor7CHMjwsKayUWf5uR70=;
        b=s0znEVSdabVMrFTS+NygUefhBCrfMkyBEsBaaVpIC/hxlfwWCH+SOUUntFkNEt8Ton
         HCPjB6Yy0Z6/Mzvg147gC7M2Je0xeVaam+eOFe4RI1uGouFm6vys5Jli6gcLUyvUvaVG
         lN93p7xxRFGpcoIQmmfJb7/gIxm+btLu5rnY9bBwsgwKivrqkhpnQP6Q5KCHTGTh6Lw/
         aiXPZCCHcgPoyjpyyM1V6ZSHPecTJwgoye1XISu8TIf+/0Lg7iMIED1/atzaBKUjpDg+
         EA1HERF9DZkvKHleqD8npcXpMz9CnrpWU1xxIklgBpb/hRI91yXYxflNF5sRtkGlThaS
         zsJg==
X-Forwarded-Encrypted: i=1; AJvYcCWSW36K8Gcnft+qgwCRym3jmZxrkb9i3xQH2g5gEQlM94YnN58o8zckPTn+YfvgCnCYzNsFcEpPBQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6rCWjP4zxBqKxh5i/4iH4/e7mBHNh0f0u7pYf7g5XkjXLPh6K
	h71+fAlqH2wvo4GUi5NDhC+SoS+wHWj+nJqSkZPa5w3Ixtuy2N0F43DE+PK+x7s=
X-Gm-Gg: ASbGnctP7xT136JxOCCSO4fe4z/Slzjuo6sCwZNTfIzXI2QfbNMJQcuMh5j9fdpml2s
	MmOSHZryA6KS35Q1lwSpg5tOz77svJDMWzB4klBGGxvYcPcA/XdA6AwPwb/gZWaXeQrysmZn5sG
	nNWlFlkNJveksFDfmn3JLZxv0CV6tF9WfxQDplZDGQDMtuZIjCf1nAcimmhJlDmPoOrkRfmqHtJ
	nAtOF6gX8EVdYqJ0FgfkZUPmstrR6CRluWxiV4anqpi4kShQ7ELnixuQfqo2R4ejV7w1lQtLoMI
	KhZokvLmhjGwmV+DNsCyMIRoyvZkiPI2QxfilbwHHpiAWpyTduAgHeAsD/bSK7raqi1vk2NhSEN
	2GErs65Q91MVjZT0zEcNbMFoh3CCT
X-Google-Smtp-Source: AGHT+IGw6DMujSSlMe4X/Gi0vjiilArq9AgwOJMWr49ZazH2bLzcdxFw+AmPTscolQ+3wmW3ZQIPiA==
X-Received: by 2002:a05:6402:50d4:b0:5e5:9543:fc0d with SMTP id 4fb4d7f45d1cf-5e59543fd82mr4097180a12.31.1741107940802;
        Tue, 04 Mar 2025 09:05:40 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:40 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:42 +0000
Subject: [PATCH v2 14/16] rtc: sd3078: drop needless struct sd3078
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-14-d4689a71668c@linaro.org>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Since this now means that the structure has just one member only left,
there  is no need anymore to allocate data for it and pass that around
via the various callbacks, just to extract that one member.

Instead, we can just pass that one member and avoid the extra memory
allocation for the containing struct, reducing runtime memory
consumption.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-sd3078.c | 71 +++++++++++++++++++-----------------------------
 1 file changed, 28 insertions(+), 43 deletions(-)

diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c
index fe27b54beaad1c06b70bf7f22e44c3f6da087267..10cc1dcfc7748144f51ef674939506feee1fb471 100644
--- a/drivers/rtc/rtc-sd3078.c
+++ b/drivers/rtc/rtc-sd3078.c
@@ -36,11 +36,6 @@
  */
 #define WRITE_PROTECT_EN	0
 
-struct sd3078 {
-	struct rtc_device	*rtc;
-	struct regmap		*regmap;
-};
-
 /*
  * In order to prevent arbitrary modification of the time register,
  * when modification of the register,
@@ -49,14 +44,11 @@ struct sd3078 {
  * 2. set WRITE2 bit
  * 3. set WRITE3 bit
  */
-static void sd3078_enable_reg_write(struct sd3078 *sd3078)
+static void sd3078_enable_reg_write(struct regmap *regmap)
 {
-	regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL2,
-			   KEY_WRITE1, KEY_WRITE1);
-	regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL1,
-			   KEY_WRITE2, KEY_WRITE2);
-	regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL1,
-			   KEY_WRITE3, KEY_WRITE3);
+	regmap_update_bits(regmap, SD3078_REG_CTRL2, KEY_WRITE1, KEY_WRITE1);
+	regmap_update_bits(regmap, SD3078_REG_CTRL1, KEY_WRITE2, KEY_WRITE2);
+	regmap_update_bits(regmap, SD3078_REG_CTRL1, KEY_WRITE3, KEY_WRITE3);
 }
 
 #if WRITE_PROTECT_EN
@@ -69,14 +61,11 @@ static void sd3078_enable_reg_write(struct sd3078 *sd3078)
  * 2. clear WRITE3 bit
  * 3. clear WRITE1 bit
  */
-static void sd3078_disable_reg_write(struct sd3078 *sd3078)
+static void sd3078_disable_reg_write(struct regmap *regmap)
 {
-	regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL1,
-			   KEY_WRITE2, 0);
-	regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL1,
-			   KEY_WRITE3, 0);
-	regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL2,
-			   KEY_WRITE1, 0);
+	regmap_update_bits(regmap, SD3078_REG_CTRL1, KEY_WRITE2, 0);
+	regmap_update_bits(regmap, SD3078_REG_CTRL1, KEY_WRITE3, 0);
+	regmap_update_bits(regmap, SD3078_REG_CTRL2, KEY_WRITE1, 0);
 }
 #endif
 
@@ -85,11 +74,10 @@ static int sd3078_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	unsigned char hour;
 	unsigned char rtc_data[NUM_TIME_REGS] = {0};
 	struct i2c_client *client = to_i2c_client(dev);
-	struct sd3078 *sd3078 = i2c_get_clientdata(client);
+	struct regmap *regmap = i2c_get_clientdata(client);
 	int ret;
 
-	ret = regmap_bulk_read(sd3078->regmap, SD3078_REG_SC, rtc_data,
-			       NUM_TIME_REGS);
+	ret = regmap_bulk_read(regmap, SD3078_REG_SC, rtc_data, NUM_TIME_REGS);
 	if (ret < 0) {
 		dev_err(dev, "reading from RTC failed with err:%d\n", ret);
 		return ret;
@@ -123,7 +111,7 @@ static int sd3078_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	unsigned char rtc_data[NUM_TIME_REGS];
 	struct i2c_client *client = to_i2c_client(dev);
-	struct sd3078 *sd3078 = i2c_get_clientdata(client);
+	struct regmap *regmap = i2c_get_clientdata(client);
 	int ret;
 
 	rtc_data[SD3078_REG_SC] = bin2bcd(tm->tm_sec);
@@ -135,10 +123,10 @@ static int sd3078_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	rtc_data[SD3078_REG_YR] = bin2bcd(tm->tm_year - 100);
 
 #if WRITE_PROTECT_EN
-	sd3078_enable_reg_write(sd3078);
+	sd3078_enable_reg_write(regmap);
 #endif
 
-	ret = regmap_bulk_write(sd3078->regmap, SD3078_REG_SC, rtc_data,
+	ret = regmap_bulk_write(regmap, SD3078_REG_SC, rtc_data,
 				NUM_TIME_REGS);
 	if (ret < 0) {
 		dev_err(dev, "writing to RTC failed with err:%d\n", ret);
@@ -146,7 +134,7 @@ static int sd3078_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	}
 
 #if WRITE_PROTECT_EN
-	sd3078_disable_reg_write(sd3078);
+	sd3078_disable_reg_write(regmap);
 #endif
 
 	return 0;
@@ -166,36 +154,33 @@ static const struct regmap_config regmap_config = {
 static int sd3078_probe(struct i2c_client *client)
 {
 	int ret;
-	struct sd3078 *sd3078;
+	struct regmap *regmap;
+	struct rtc_device *rtc;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
-	sd3078 = devm_kzalloc(&client->dev, sizeof(*sd3078), GFP_KERNEL);
-	if (!sd3078)
-		return -ENOMEM;
-
-	sd3078->regmap = devm_regmap_init_i2c(client, &regmap_config);
-	if (IS_ERR(sd3078->regmap)) {
+	regmap = devm_regmap_init_i2c(client, &regmap_config);
+	if (IS_ERR(regmap)) {
 		dev_err(&client->dev, "regmap allocation failed\n");
-		return PTR_ERR(sd3078->regmap);
+		return PTR_ERR(regmap);
 	}
 
-	i2c_set_clientdata(client, sd3078);
+	i2c_set_clientdata(client, regmap);
 
-	sd3078->rtc = devm_rtc_allocate_device(&client->dev);
-	if (IS_ERR(sd3078->rtc))
-		return PTR_ERR(sd3078->rtc);
+	rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	sd3078->rtc->ops = &sd3078_rtc_ops;
-	sd3078->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-	sd3078->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->ops = &sd3078_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-	ret = devm_rtc_register_device(sd3078->rtc);
+	ret = devm_rtc_register_device(rtc);
 	if (ret)
 		return ret;
 
-	sd3078_enable_reg_write(sd3078);
+	sd3078_enable_reg_write(regmap);
 
 	return 0;
 }

-- 
2.48.1.711.g2feabab25a-goog


