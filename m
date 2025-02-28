Return-Path: <linux-rtc+bounces-3323-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D514A49B48
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 15:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA7E83A98F6
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 14:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5BA26E174;
	Fri, 28 Feb 2025 14:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i03efqjn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D3C25F98E
	for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751646; cv=none; b=b4pM1ge8sSrXpuk4qCkHMmcEXIKMbsCba7JbxY7HdqemuVFGSWyIfqbpDJLx8cmHIwByk7lCkS5nQVabkXmT35zMt3y2mMHC6wHhbT5Ah1tgbKG77KCSunqOi9pSFb68WN9z0teUEQK9ebZkwTGfpj1bZcSlRdau01ELl6NDX6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751646; c=relaxed/simple;
	bh=o6iUQpkX2kREXBtqHVFBYq4KM/Ol+6TBK8alsSBDLFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E3FN4smbJ/LYSRc18LvH4l9pAIGybVV92jEMiu787OE2FvYsGBk4xgr/CkPZjjBxtb4ITyluma+jY/eOCpU7q3CcvVANobk0Ci+SqNolnKfpG2DAnUYPOgoMk6haUx1DBVigjJLmgUGxU2+kaunwNaUwBWuxJYy1kUNrOAeqY0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i03efqjn; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abf3cf3d142so63638266b.2
        for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751643; x=1741356443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxV5ubkQILRDTTOOiWiVBaTKuCWcjZ1klG/odToLNLU=;
        b=i03efqjnlFkObHW1ztwNuqWMePtLs/sq4dmV85pqjRtrRv/6u5zjc3+7LF9N6rvm3D
         VgUAuMNZCVN2aFvXztpaWFFP6KTLbP292+FHSHhqP8+lbYjhzwIVbSTznR1jePgTeQf3
         Xxv3R/EoiFGazGdfUiQXPOq0KgQi7g6izTyHExGklTWZBRp2GjxYsuYqjKIVpz6KU0jg
         FAk+qFERo+crftlurfpxbBl/JRZqV5Uabocq71zI7Cb2v0M0bUQEHeDAXjmgW8h+/nNU
         m4kdI1wUlFu64hozU2n29hXURoDUgiVuiisr9Nnt5mdj7Et3JhuyXmsjFzFhCbDmcD1Y
         bsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751643; x=1741356443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxV5ubkQILRDTTOOiWiVBaTKuCWcjZ1klG/odToLNLU=;
        b=LY56NSnuKhDer0mYRBLXvB6dHYfw5zS3VLF0jof8dqsRDwTU7m7v7TxUqe8VNQZKKG
         o9HVTdqrBTc2U8I5LtwupxLqCi+P1dD9lrXsPPvP4FXLDN0yjLt98U5Is4GINawOEF7p
         tLm93dNUbwFfK5McwGWAuzB39xM1ZbABGJHazJYloQH7fCAdMWGICx5dI4R5AtOSw78/
         FN0K8zzIDyveYvIyryzgdlZEPj2Ah/AyY5/JIJgcHuETjBM1G3Uz7pkAgRMUNXn7gw2I
         hOB0bea+NY513huSkndo6gqaHLEJR4dUe1BUD5WUkc6WWIjwOghrI1+MLHjrFHBqyuEw
         db9w==
X-Forwarded-Encrypted: i=1; AJvYcCX9Kwx+49K/4Gat+D+IRGd5evNwlFHXKp08p30zdi3d6j79V5aJL6ufs8wYyUReZKuNe2JtBMCM+NM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfo+t57s0ZshZBLvwyf3B2V9oPFEeGtiYhwFVgrrG/MlQri+eg
	Rz9gnZK3a8UyGxC5HBnowk+AFKxki3S9WQ94a2+0nd9Fv2765qTSYtsrWJSaBiY=
X-Gm-Gg: ASbGnctMza3ND9OcTfur9GiQWThg5Zhr5EPhOHR0Qd+HgQHKpyRTD2Cu1xQxHcF4npi
	n5uVPlzyXE4PvXiSdzvhvY3PcMmn/ZiqYGZO0cRpBk91O+XSfmF/dJABjtt89KIPMugI0nNE5Rc
	bhzvA0idkPPA+q3Kwz+6j5mF4bjPjvUAVI19E7FQQg6fOhbcD72WYabeo7qdXL34ElX8OL21Log
	V5/cAImez8H7Pf/wHWoeZWwRkMvv0pe/VCmrixGdDTlQf42xUs0DDwLunuD0bAJ1f1XZHyNnGAj
	3m1eLhsh9REFg+BpealvUQYYY7SEGnlGSq6Tw8TPnrylDWwkzjVa1deCyWEv6aP53V+xB//paSl
	gfQ+ugmhRbw==
X-Google-Smtp-Source: AGHT+IFUL7DUuq/VqTU9dmynPShF+8aK2RXF+k+UR0pl4bWqZxWvS8VoSsjq66EWlcydyD7uTG7tww==
X-Received: by 2002:a05:6402:1d4d:b0:5dc:796f:fc86 with SMTP id 4fb4d7f45d1cf-5e4d6af436amr7325207a12.16.1740751642551;
        Fri, 28 Feb 2025 06:07:22 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:21 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:14 +0000
Subject: [PATCH 01/18] rtc: max77686: drop needless struct
 max77686_rtc_info::rtc member
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-1-b44cec078481@linaro.org>
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

When this driver was converted to using the devres managed i2c device
in commit 59a7f24fceb3 ("rtc: max77686: convert to
devm_i2c_new_dummy_device()"), struct max77686_rtc_info::rtc became
essentially unused.

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-max77686.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 7bb044d2ac25aeaaf2404b47b7e7bd485ae3d39e..6b0d02b44c8097453f704cbec9f02580fb869ca3 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -85,7 +85,6 @@ struct max77686_rtc_driver_data {
 
 struct max77686_rtc_info {
 	struct device		*dev;
-	struct i2c_client	*rtc;
 	struct rtc_device	*rtc_dev;
 	struct mutex		lock;
 
@@ -691,6 +690,7 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 {
 	struct device *parent = info->dev->parent;
 	struct i2c_client *parent_i2c = to_i2c_client(parent);
+	struct i2c_client *client;
 	int ret;
 
 	if (info->drv_data->rtc_irq_from_platform) {
@@ -714,14 +714,14 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 		goto add_rtc_irq;
 	}
 
-	info->rtc = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
-					      info->drv_data->rtc_i2c_addr);
-	if (IS_ERR(info->rtc)) {
+	client = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
+					   info->drv_data->rtc_i2c_addr);
+	if (IS_ERR(client)) {
 		dev_err(info->dev, "Failed to allocate I2C device for RTC\n");
-		return PTR_ERR(info->rtc);
+		return PTR_ERR(client);
 	}
 
-	info->rtc_regmap = devm_regmap_init_i2c(info->rtc,
+	info->rtc_regmap = devm_regmap_init_i2c(client,
 						info->drv_data->regmap_config);
 	if (IS_ERR(info->rtc_regmap)) {
 		ret = PTR_ERR(info->rtc_regmap);

-- 
2.48.1.711.g2feabab25a-goog


