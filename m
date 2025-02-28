Return-Path: <linux-rtc+bounces-3337-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3A7A49B6D
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 15:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2864518996F9
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 14:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E5E272912;
	Fri, 28 Feb 2025 14:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vhrOgg2a"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF522702D9
	for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751655; cv=none; b=HtCOAHQW1UGLuqZOBvNFtEu8AuIdiU3ZLti7dlSWTuP3s05ygtpU4kzKPpqaLFWDYEyphZWscU9iODc6++UssZrjB7DyshNCwMDyDRF2UmtZ4ShyHOUhJisX2cmfVrli33OFePRyhjRMVf9xw7ETti5eA5iHDfW+g/r9UzJOjGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751655; c=relaxed/simple;
	bh=KnTT7JVjJd7L84lbqgaLnnpzphht/b/4e/xeT/zzGuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZbjWIe6UxDqpkwQ2K4jhWqehnOHvUR9B5L+hZtbCytyZTUnjuyFcTLzZuAHON70TCae3MdxokS5XZCl00nakysMZDWHqJKM38+VzKhcGUntQkJE8Iz1/YyojW0wAnt/RP5frBWgJKOnpWRJd8MQtZIDxj07ToFg+4cXc/JUE378=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vhrOgg2a; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e095d47a25so3595964a12.0
        for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751650; x=1741356450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNaBzsv98dZxOnoY4pQ3hhfyEv1+PH+c26jk5v5UbcU=;
        b=vhrOgg2aZzOd7RHT7K//qXuwRzvsaz4MFsjVoDelpXKBUjMPSvIgzT6bBKwLVTbQmZ
         VRKD2pCMB3yjkeq0prZ65/MeBO3cnurRHrgd80hTWrmxImi/msDee3LZQkZO7nUHxLqP
         RmAnybYsLu2jBsM9fMSK7tQKUT04/iBLxq6snU1164ReVjrX/tzR3FwgvsMdyYQItrbq
         0pg94gzAuGLRpvllaJZ5nlu3z+TZoqSd5SgZz+e+sP3O8rjyBH00+OvgNyuRvQkObyaD
         yu3cmDmWgsdnr7o+nA9ShVaXrOT7nWZCT48jNMYGcYL26P4QRph1DQFFKCkTxhgVKq6b
         FgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751650; x=1741356450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNaBzsv98dZxOnoY4pQ3hhfyEv1+PH+c26jk5v5UbcU=;
        b=oAfn79+zI8DEzJoBgvMvXXAMlhi2a/bQ8V0XTWX4n0Ffln7kCN6gUJYU7hOQe9ePJ3
         tkRiCeXkC1nyhM8oeRdvXTFfFSEZikU6S7i0OSgY0kr3DXPcWVh+LdCChyng4Ntcuy6d
         Z+vz23NrJgdSgO8VQj365TCCce5+KL986e6eh5hqSUHV671spS1rwOwngVhqgqOkz0U4
         pChhChwm3eXaBytiFLMeTZp6pDRn+NcNeStWf0r4kO9f+wjaAQBELXcZdJgY/qP0AQF7
         gzCLePjLAYeFuydUfe0rqNOOA0SHGkyrWQ1ZN7xXG1tOvRi0LETOLPLulSP7jXMDo265
         4E8w==
X-Forwarded-Encrypted: i=1; AJvYcCXKajsQZRIrBeQRRUvwm1Zjo9rXGxbL4GhFSdclefrDtTsg9vvY/1bKf1i2jsJ/xAq2kRNuCj1DAzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJYURbSbAkpMxau9HOjZV9xwVfjZ/ZKOMpLlqCFbj3jJ0lK4Wu
	8BnCm2vr4JwJKtrBDpgS3wZZauqsQYi3sLyvaO+rjHG1fnoLALDOFE5VWfKUSXk=
X-Gm-Gg: ASbGncufRO0fIzJJWEAVXfVmGU+AVdC2sultkIoI/b0B58MdpDvfbWmwraHSd48YUL2
	f7U+qw6ylpV3RJGdHzgrzLSwhgwUwU+m1LTS5K8iS/+F0eqJ3kePexjJ4zo7j+CvAU3wvkxgdUh
	L+n/82FFecPrTJHJZMoxTeRuyK0bDUtcknPgPwr5kP99JT6V8bH4Y82SoL7ekapmH5Md+jBhwsy
	qFjLUjOeuObcZ8bHLIAe/hP06zPMFZm3XT60Ln5jneX8JUXxs3rpYnFk9TxWT0kEKIr8emG2KLK
	tAfRYgppvDl0GzsoWtJHlrt8LmH2N61GbNdxZloXOcr8fK8Awcq8Ro4KRf5irJziDCbJSH5Kxkw
	abqr7jMCAyw==
X-Google-Smtp-Source: AGHT+IHJgHIb94bIAN1OxpmT/CmpG5hxROPCgFLfrUaKlqlLkHckO5CTYjuy4Kdl9gpiKvePvUPO6w==
X-Received: by 2002:a05:6402:35d3:b0:5e0:9959:83cd with SMTP id 4fb4d7f45d1cf-5e4d6b70ef7mr2396243a12.21.1740751650375;
        Fri, 28 Feb 2025 06:07:30 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:30 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:28 +0000
Subject: [PATCH 15/18] rtc: rx8581: drop needless struct rx8581
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-15-b44cec078481@linaro.org>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
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
 Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

This private data struct has one member only, there is no need to
allocate data for it and pass that around via the various callbacks,
just to extract that one member.

Instead, we can just pass that one member and avoid the extra memory
allocation, reducing runtime memory consumption.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-rx8581.c | 63 +++++++++++++++++++-----------------------------
 1 file changed, 25 insertions(+), 38 deletions(-)

diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c
index 785ebaca07ac971eee34559f8d1e0a8a872cbba9..20c2dff01bae833ae4e100cc38cd5f030017be75 100644
--- a/drivers/rtc/rtc-rx8581.c
+++ b/drivers/rtc/rtc-rx8581.c
@@ -52,10 +52,6 @@
 #define RX8571_USER_RAM		0x10
 #define RX8571_NVRAM_SIZE	0x10
 
-struct rx8581 {
-	struct regmap		*regmap;
-};
-
 struct rx85x1_config {
 	struct regmap_config regmap;
 	unsigned int num_nvram;
@@ -71,14 +67,14 @@ static int rx8581_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	unsigned char date[7];
 	unsigned int data;
 	int err;
-	struct rx8581 *rx8581 = i2c_get_clientdata(client);
+	struct regmap *regmap = i2c_get_clientdata(client);
 
 	/* First we ensure that the "update flag" is not set, we read the
 	 * time and date then re-read the "update flag". If the update flag
 	 * has been set, we know that the time has changed during the read so
 	 * we repeat the whole process again.
 	 */
-	err = regmap_read(rx8581->regmap, RX8581_REG_FLAG, &data);
+	err = regmap_read(regmap, RX8581_REG_FLAG, &data);
 	if (err < 0)
 		return err;
 
@@ -91,20 +87,20 @@ static int rx8581_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	do {
 		/* If update flag set, clear it */
 		if (data & RX8581_FLAG_UF) {
-			err = regmap_write(rx8581->regmap, RX8581_REG_FLAG,
-					  data & ~RX8581_FLAG_UF);
+			err = regmap_write(regmap, RX8581_REG_FLAG,
+					   data & ~RX8581_FLAG_UF);
 			if (err < 0)
 				return err;
 		}
 
 		/* Now read time and date */
-		err = regmap_bulk_read(rx8581->regmap, RX8581_REG_SC, date,
+		err = regmap_bulk_read(regmap, RX8581_REG_SC, date,
 				       sizeof(date));
 		if (err < 0)
 			return err;
 
 		/* Check flag register */
-		err = regmap_read(rx8581->regmap, RX8581_REG_FLAG, &data);
+		err = regmap_read(regmap, RX8581_REG_FLAG, &data);
 		if (err < 0)
 			return err;
 	} while (data & RX8581_FLAG_UF);
@@ -136,7 +132,7 @@ static int rx8581_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	struct i2c_client *client = to_i2c_client(dev);
 	int err;
 	unsigned char buf[7];
-	struct rx8581 *rx8581 = i2c_get_clientdata(client);
+	struct regmap *regmap = i2c_get_clientdata(client);
 
 	dev_dbg(dev, "%s: secs=%d, mins=%d, hours=%d, "
 		"mday=%d, mon=%d, year=%d, wday=%d\n",
@@ -159,25 +155,23 @@ static int rx8581_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	buf[RX8581_REG_DW] = (0x1 << tm->tm_wday);
 
 	/* Stop the clock */
-	err = regmap_update_bits(rx8581->regmap, RX8581_REG_CTRL,
+	err = regmap_update_bits(regmap, RX8581_REG_CTRL,
 				 RX8581_CTRL_STOP, RX8581_CTRL_STOP);
 	if (err < 0)
 		return err;
 
 	/* write register's data */
-	err = regmap_bulk_write(rx8581->regmap, RX8581_REG_SC,
-				buf, sizeof(buf));
+	err = regmap_bulk_write(regmap, RX8581_REG_SC, buf, sizeof(buf));
 	if (err < 0)
 		return err;
 
 	/* get VLF and clear it */
-	err = regmap_update_bits(rx8581->regmap, RX8581_REG_FLAG,
-				 RX8581_FLAG_VLF, 0);
+	err = regmap_update_bits(regmap, RX8581_REG_FLAG, RX8581_FLAG_VLF, 0);
 	if (err < 0)
 		return err;
 
 	/* Restart the clock */
-	return regmap_update_bits(rx8581->regmap, RX8581_REG_CTRL,
+	return regmap_update_bits(regmap, RX8581_REG_CTRL,
 				 RX8581_CTRL_STOP, 0);
 }
 
@@ -189,29 +183,27 @@ static const struct rtc_class_ops rx8581_rtc_ops = {
 static int rx8571_nvram_read(void *priv, unsigned int offset, void *val,
 			     size_t bytes)
 {
-	struct rx8581 *rx8581 = priv;
+	struct regmap *regmap = priv;
 
-	return regmap_bulk_read(rx8581->regmap, RX8571_USER_RAM + offset,
-				val, bytes);
+	return regmap_bulk_read(regmap, RX8571_USER_RAM + offset, val, bytes);
 }
 
 static int rx8571_nvram_write(void *priv, unsigned int offset, void *val,
 			      size_t bytes)
 {
-	struct rx8581 *rx8581 = priv;
+	struct regmap *regmap = priv;
 
-	return regmap_bulk_write(rx8581->regmap, RX8571_USER_RAM + offset,
-				 val, bytes);
+	return regmap_bulk_write(regmap, RX8571_USER_RAM + offset, val, bytes);
 }
 
 static int rx85x1_nvram_read(void *priv, unsigned int offset, void *val,
 			     size_t bytes)
 {
-	struct rx8581 *rx8581 = priv;
+	struct regmap *regmap = priv;
 	unsigned int tmp_val;
 	int ret;
 
-	ret = regmap_read(rx8581->regmap, RX8581_REG_RAM, &tmp_val);
+	ret = regmap_read(regmap, RX8581_REG_RAM, &tmp_val);
 	(*(unsigned char *)val) = (unsigned char) tmp_val;
 
 	return ret;
@@ -220,12 +212,11 @@ static int rx85x1_nvram_read(void *priv, unsigned int offset, void *val,
 static int rx85x1_nvram_write(void *priv, unsigned int offset, void *val,
 			      size_t bytes)
 {
-	struct rx8581 *rx8581 = priv;
+	struct regmap *regmap = priv;
 	unsigned char tmp_val;
 
 	tmp_val = *((unsigned char *)val);
-	return regmap_write(rx8581->regmap, RX8581_REG_RAM,
-				(unsigned int)tmp_val);
+	return regmap_write(regmap, RX8581_REG_RAM, (unsigned int)tmp_val);
 }
 
 static const struct rx85x1_config rx8581_config = {
@@ -248,7 +239,7 @@ static const struct rx85x1_config rx8571_config = {
 
 static int rx8581_probe(struct i2c_client *client)
 {
-	struct rx8581 *rx8581;
+	struct regmap *regmap;
 	const struct rx85x1_config *config = &rx8581_config;
 	const void *data = of_device_get_match_data(&client->dev);
 	struct rtc_device *rtc;
@@ -276,15 +267,11 @@ static int rx8581_probe(struct i2c_client *client)
 	if (data)
 		config = data;
 
-	rx8581 = devm_kzalloc(&client->dev, sizeof(struct rx8581), GFP_KERNEL);
-	if (!rx8581)
-		return -ENOMEM;
-
-	i2c_set_clientdata(client, rx8581);
+	regmap = devm_regmap_init_i2c(client, &config->regmap);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
-	rx8581->regmap = devm_regmap_init_i2c(client, &config->regmap);
-	if (IS_ERR(rx8581->regmap))
-		return PTR_ERR(rx8581->regmap);
+	i2c_set_clientdata(client, regmap);
 
 	rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(rtc))
@@ -299,7 +286,7 @@ static int rx8581_probe(struct i2c_client *client)
 	ret = devm_rtc_register_device(rtc);
 
 	for (i = 0; i < config->num_nvram; i++) {
-		nvmem_cfg[i].priv = rx8581;
+		nvmem_cfg[i].priv = regmap;
 		devm_rtc_nvmem_register(rtc, &nvmem_cfg[i]);
 	}
 

-- 
2.48.1.711.g2feabab25a-goog


