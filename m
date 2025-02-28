Return-Path: <linux-rtc+bounces-3338-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5DFA49B71
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 15:09:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EB1718995FE
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 14:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E496F27424A;
	Fri, 28 Feb 2025 14:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JodhXI1z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC7026D5AD
	for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751655; cv=none; b=nrPrm4NvCKol6JA6jTYm94e/Qd3QsGDs+N+zIqgGdTfNifv+6kd+BPCNw6iT7Q9s8K5LNYF3LkxaQ+wTXLP0if7nSt5jJIVvvsxYQmhYE+XUFEiRR2EUZUhAQG90zpE3Locn2IoXhQ4ZU4/F0FM09pxyO0z6uwnbB4M+gLDAISE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751655; c=relaxed/simple;
	bh=fWzdE+Hu5xOwZqrVrpDeDLFG0S6j3Aw3nymZYqj35jQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WUi4aAvWacnh9nJHabGtJOrynYVQaSBV3KaeBTpMRHH7rDB2ffXytEwUHBd7j8BGWnh/O47vefl7AtZchmDy4KECRrogm0fUsw8NneWeKMJ5SMAJ4gAyWEHiaE41BlIqiPhgeGkPSICrbvEBw9/DBugY1D1HHWorikcDsbjk7GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JodhXI1z; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5deb1266031so3679055a12.2
        for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751651; x=1741356451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/r1ypkbSjtebcdcKcBz70+d9/hPyy6PTiaBKA6Wiwh8=;
        b=JodhXI1zeosrw04nHBmla+PiMvN97KQqyGOjn7WjAGmy5tKwpwUvXrolAs1dXjytx+
         1g8YQ9E5PUVKjg/DK5mQeGSoSRZ9r1Vvgxgk3tiCG8sdHmA9B0JwGYjMwOx8gGIRsOrX
         B7F0j3hUJ84AEu0TPczihCvLjF2HLKX2XUJ0ihNNO8OJGJMuHbSXCoxaVVDjQKvN/oM2
         rT3FbdKk7MsNYGXSDVlyTG6fP8eeXYCT/iw1u3WvtwGBC22NVXB5dM3dw9u2lTK56UeJ
         U67muVpqhN+T2r8MBCFnXFYzdjb5qaw+37J8+R1Amgm8sbkYzFk53eRHwqW31adALoHr
         pwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751651; x=1741356451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/r1ypkbSjtebcdcKcBz70+d9/hPyy6PTiaBKA6Wiwh8=;
        b=CtU7p38G5zYpMfklvc/Varm/4Gq55zby6wRakoxcYIrDEJKCxZm3+W/lCOwjXJK7+C
         XZgxyBqYJIuat3nrtY/imQ2fbW+AYXj81/n/YODe7qF8AQ/tI+XZWH1xFsK0Dcq8PHDq
         4zTjveg5hMw4y08UbPwYE9iDR0/TxmYUT53I1sMJoLQAIsk1vxLytsrKwZj4LNLmWCAu
         mHY3H0yvigfyPCFk4pE79egYEo4p2f3tqbPI3g80pFaKCkPqsKiJagI2+X3d/2i94eGd
         WlaEGWlk9gnypsEvU7AghUYI0CdrXVzAz6VG782lUYcuSQlwtLlCxB2GvXXCEmTJvsAT
         KXzw==
X-Forwarded-Encrypted: i=1; AJvYcCW8urLG4CrYT3WaH9idViq7l3g/Pxc1feuWuwVWLBDAzTI5NYHithXEGCcuPH3cbqz0yWZDW3sZv/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvlMVJS3VsIa8DiQb/qvdSHd2Q6AwLOer1cDBrZ2uQPMTwug5I
	ad8i4qBRacChQ4c5cke5fhCKmUpJLi3eckcyYcdNJim0Dx1EBShmNCG79DRs0ic=
X-Gm-Gg: ASbGncs7Dm8X8pvVZqhFUdmKrwqzLhUVkW+QzfZScnDShFQj6nowg6QoEWYfUGacUnl
	3OHm3WQz5sC0aSX8lo5ZEWwD8DSwOYlWX047Vx6HwW+nt1AsD7TKhlkMcY+vBJsTLPjzCACeGlT
	I7FWcOdBeuC5luGIubBEsdOV/xUEWNGvO9DvpaHog2TUc0v8f2eiMVHqKZL3UNsfFJnM+lVaVcF
	ZD6FYqoCd1yO616v6VYIYKnsPc/5GECZn1JTJGq2nPNJbN4kSdWpaAfz9Xvimw0n0Ut3BvAFb4E
	RLrs8b4r6VVJwimuJVNSi9hnaoXg4u/qJeIYanCA2+i2Ypx2v1mHJwnNmnF32SSLJvL5S7Tgh1G
	ySk0nF5pTXw==
X-Google-Smtp-Source: AGHT+IEmNzc9psOsG8S5U8hQjyEGUEZtM5fJSHlUXxz0d+LoEipOpq1K+57NoVXqKGgpzCnWIQsf3g==
X-Received: by 2002:a05:6402:2711:b0:5de:dfd0:9d22 with SMTP id 4fb4d7f45d1cf-5e4d6b6ebf3mr3156214a12.22.1740751650904;
        Fri, 28 Feb 2025 06:07:30 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:30 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:29 +0000
Subject: [PATCH 16/18] rtc: sd3078: drop needless struct sd3078
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-16-b44cec078481@linaro.org>
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
 drivers/rtc/rtc-sd3078.c | 55 ++++++++++++++++++------------------------------
 1 file changed, 20 insertions(+), 35 deletions(-)

diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c
index ebb4d45ce2409982880affbc7a85d5e7410c8f42..10cc1dcfc7748144f51ef674939506feee1fb471 100644
--- a/drivers/rtc/rtc-sd3078.c
+++ b/drivers/rtc/rtc-sd3078.c
@@ -36,10 +36,6 @@
  */
 #define WRITE_PROTECT_EN	0
 
-struct sd3078 {
-	struct regmap		*regmap;
-};
-
 /*
  * In order to prevent arbitrary modification of the time register,
  * when modification of the register,
@@ -48,14 +44,11 @@ struct sd3078 {
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
@@ -68,14 +61,11 @@ static void sd3078_enable_reg_write(struct sd3078 *sd3078)
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
 
@@ -84,11 +74,10 @@ static int sd3078_rtc_read_time(struct device *dev, struct rtc_time *tm)
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
@@ -122,7 +111,7 @@ static int sd3078_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	unsigned char rtc_data[NUM_TIME_REGS];
 	struct i2c_client *client = to_i2c_client(dev);
-	struct sd3078 *sd3078 = i2c_get_clientdata(client);
+	struct regmap *regmap = i2c_get_clientdata(client);
 	int ret;
 
 	rtc_data[SD3078_REG_SC] = bin2bcd(tm->tm_sec);
@@ -134,10 +123,10 @@ static int sd3078_rtc_set_time(struct device *dev, struct rtc_time *tm)
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
@@ -145,7 +134,7 @@ static int sd3078_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	}
 
 #if WRITE_PROTECT_EN
-	sd3078_disable_reg_write(sd3078);
+	sd3078_disable_reg_write(regmap);
 #endif
 
 	return 0;
@@ -165,23 +154,19 @@ static const struct regmap_config regmap_config = {
 static int sd3078_probe(struct i2c_client *client)
 {
 	int ret;
-	struct sd3078 *sd3078;
+	struct regmap *regmap;
 	struct rtc_device *rtc;
 
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
 
 	rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(rtc))
@@ -195,7 +180,7 @@ static int sd3078_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	sd3078_enable_reg_write(sd3078);
+	sd3078_enable_reg_write(regmap);
 
 	return 0;
 }

-- 
2.48.1.711.g2feabab25a-goog


