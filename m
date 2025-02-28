Return-Path: <linux-rtc+bounces-3333-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7A8A49B60
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 15:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC97F174F6E
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 14:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F580270EB2;
	Fri, 28 Feb 2025 14:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oK3XLD2i"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6249526FDBF
	for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751653; cv=none; b=hMYBV793x2CavdpQL0vV9rkH4LMjbrGdaB5gwrhFT2pzmFykS9uN9iEB8PYCf6q+qfU4foLNE3Bl9pLs+7lzinAxUIRjcZI6SGeDkDi5GocNMyesu+6UldpbRo+iRhqert+kQhKp2WZmOz6d4odXoleceVLdqvsWdo8LJdOEB+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751653; c=relaxed/simple;
	bh=+Kph84gyNH2FaYt3N+VrOHuKaKCtB8nOyu2qKHWEIWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=btAaHT4sFTEE9wZXmbGmS1+Yn9BiBNcR+dwDFyOvTL3kX3ldHR+WU4dls1QdixwAp17YFSE7g7LGXf+gOOxkZIys+k2bgh3Ki12mUBwjd16bHccUpnGkJKtwyuIYkrs8SEWCKuQmsNsBeEhVDvYUvu6pFWAa1g5cskpaUU7QyVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oK3XLD2i; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so4075430a12.0
        for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751648; x=1741356448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nzHwlkUM09BG0CuM/bA+EpIQxILewT/ffWeXrAz77U=;
        b=oK3XLD2iq0t/+2Il/MmrTMKGJKRoLUsVfpyx4Ng+GxLv/Kkq4myvUMgB8L2ilRRl6b
         W5jpg2Q68WdTg68Pxw+Bj66o9d8GG4ybSYTDUAuEexBQbY6M40SdW9l3Xgr+ncoj8i21
         8dgJk4ir8sqj19cIxHLJ1+ISGioytOnl/G0SrhbyCWc5FRABkTdyeBRhTic5Zu0FQHwd
         ABZs3zK64OEWUdJQXww7lz7gSTlPHWmMmRTENgZJ+FjZOTxZEPiRKwiiQeWpH1pV4fRc
         jKVcA3EJaxILEAlKvouxyPPdRrbdlGSnakdV8rfUzrUlBKKu0yLFJMH2pxde+RnEx8F/
         5cQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751648; x=1741356448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nzHwlkUM09BG0CuM/bA+EpIQxILewT/ffWeXrAz77U=;
        b=mTGJy8IBxJoA4vNOrk3939v2spMSCuIHvv86XA9/ggiY32yAIKVup7NztyNjWtj/y2
         2n6YXTXILe9S5QOUW2UhzbA5l4WDAbOl2sSXALa5+1/7XrG1FI6SF5jF7a5O7q9UGpMI
         f47KluERuscb2qpRDHs3MeiAD/9jSHxR3DazauP54dTz60sPoA6MFZyoCOPXeZ0yKdl+
         TexX/ioFITizkc0WFmy6iaStt7it1VYO3BjeVZ6exNY0LZzKfz5Jaffl8Blw67OIJJ8e
         7liYKvYgAHoz/bsqe7j++ldElXN/bfqd5TfRIr6yvzVkpHYucA1+a2soc4gARWigM1dm
         O7kw==
X-Forwarded-Encrypted: i=1; AJvYcCV08yXV2LDk9lTgB9Xgpfh0uDlVfJkKMcxtxx73gW0Iyi/xfQEajYTHKroFgp91qQaLmX1KrjLCgvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT9BKXL3D4fwUE/Y0z96a2kBmu14txannN6wNIVUajYeGSDUc5
	WaWnpWe2RHLsZpxQgu1eASmt//Xgxp84JnIl0PM4esrDPMta1+wZp3zBBBrGBOw=
X-Gm-Gg: ASbGncuN7dH5IzmjojAubQjCunZKvEB8z04HbHSF5mr7+0m1BekXjoiNuYjzW3zEycY
	JEVT6PG66s0BqnuwBK6CK4OsJgpGozHz4Bnm1aZZWcIiRdE5OeWJlZEzsw3TxFMGfTVTzbLuWud
	j8jzKQS4umKEJnmLVw34ichzqbRFCIS+HpR9XQcuou31lT360ZZVzFsbMX2AgxmmnVa20WPqCVm
	xs2I/xO2JCXCR+q9jMBSZ7NOUB4oRnV9cyWTH3zx63JqLxEm/cN2NQYX0rxWT+unddnmcu3P8FI
	nA4k/BjIiwhKRny8VUdZuuKw8wTWVHd4EbDtqbyIaVEZrJW0ZMmpulTucFR3NTKq65giVyHBtlT
	wsQk4cOtC/g==
X-Google-Smtp-Source: AGHT+IGquByOTAI+pOBsMihZmYnZaIy5p2XitRnKkTWDJg07k5RO868wRYsHEejBUavy8mEmWjqo9Q==
X-Received: by 2002:a05:6402:13d4:b0:5e0:8a27:cd36 with SMTP id 4fb4d7f45d1cf-5e4bfacb0a8mr8959084a12.8.1740751648271;
        Fri, 28 Feb 2025 06:07:28 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:24 +0000
Subject: [PATCH 11/18] rtc: rx8581: drop needless struct rx8581::rtc member
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-11-b44cec078481@linaro.org>
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

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-rx8581.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c
index b18c12887bdc3705ea4cee9b8d75086a05b24e71..785ebaca07ac971eee34559f8d1e0a8a872cbba9 100644
--- a/drivers/rtc/rtc-rx8581.c
+++ b/drivers/rtc/rtc-rx8581.c
@@ -54,7 +54,6 @@
 
 struct rx8581 {
 	struct regmap		*regmap;
-	struct rtc_device	*rtc;
 };
 
 struct rx85x1_config {
@@ -252,6 +251,7 @@ static int rx8581_probe(struct i2c_client *client)
 	struct rx8581 *rx8581;
 	const struct rx85x1_config *config = &rx8581_config;
 	const void *data = of_device_get_match_data(&client->dev);
+	struct rtc_device *rtc;
 	static struct nvmem_config nvmem_cfg[] = {
 		{
 			.name = "rx85x1-",
@@ -286,21 +286,21 @@ static int rx8581_probe(struct i2c_client *client)
 	if (IS_ERR(rx8581->regmap))
 		return PTR_ERR(rx8581->regmap);
 
-	rx8581->rtc = devm_rtc_allocate_device(&client->dev);
-	if (IS_ERR(rx8581->rtc))
-		return PTR_ERR(rx8581->rtc);
+	rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	rx8581->rtc->ops = &rx8581_rtc_ops;
-	rx8581->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-	rx8581->rtc->range_max = RTC_TIMESTAMP_END_2099;
-	rx8581->rtc->start_secs = 0;
-	rx8581->rtc->set_start_time = true;
+	rtc->ops = &rx8581_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->start_secs = 0;
+	rtc->set_start_time = true;
 
-	ret = devm_rtc_register_device(rx8581->rtc);
+	ret = devm_rtc_register_device(rtc);
 
 	for (i = 0; i < config->num_nvram; i++) {
 		nvmem_cfg[i].priv = rx8581;
-		devm_rtc_nvmem_register(rx8581->rtc, &nvmem_cfg[i]);
+		devm_rtc_nvmem_register(rtc, &nvmem_cfg[i]);
 	}
 
 	return ret;

-- 
2.48.1.711.g2feabab25a-goog


