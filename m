Return-Path: <linux-rtc+bounces-3336-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFC6A49B69
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 15:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0394818836DD
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 14:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE35271830;
	Fri, 28 Feb 2025 14:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QOM1+0+E"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E902B26E622
	for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751654; cv=none; b=XUcevE1BGBqzABxHA+RMvkS06LzjLJYr7Vl4eIYm1rHwwpJX73Js8hLD7tkkikTN+qbuN1wUYdRBJk7i4sesfJw8ST+0052Dxdj9YVdNXIR3aZ9XWfDR91OdCBt3JGMEatEWFe3oDSS8zXv3WfKXisDcUxZdwuR0fm6yuuh865U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751654; c=relaxed/simple;
	bh=csOMxrJ8DUKG8jZ2g+nC3altbQsJLgJ3nzkzZybq300=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fhV09nphEfOKt+6HUePPouA0l7rd79RPr2sUmPYNNnu8lhWLPFh2nngP1ieuQViNq43qa1Np1JA7VXk8F6gEhyCpKOKjZWPluLz6iIb67u46LlwaW01FyceNnIeVmboQHrYWKXEDT/gsYu68QNIT3ZUocTxnzHcimYRkCQMjaQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QOM1+0+E; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dee07e51aaso3821083a12.3
        for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751650; x=1741356450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVgVdQhbC2YyNwH7K95+EhEh/kAvax64uDHN7A2amTM=;
        b=QOM1+0+EeNvhAM/TKJ0qctceEbRr0WzYClZbSW63L29B2imhJlMzgqCkKNBIfQtU+V
         QuQMZtwErSgGydIOWkB6SiQMHnZF1pcuu56uenHSO9qrXuHSg3RPOXwXDmvKt+LmsyfB
         MicOfm81eg7/+heDKjLcIdOmVp/bSiuVMQzUNRlWQ+h6puitUmpTkVbs4ZYgfbY9yzsd
         PNKKXw1ak/dEjH6ymbT2ye1HfL/7SA9PbCXOyZ/Aqw8pC/kZpVoWjDGFFbKmuvLcS6Aa
         dhqVIr+YKq4i9susfCX6KNHJxbwr7MsCCWgVg8T04QKNkSOCVdkhLlQpjvyDz4BtjEzc
         8Rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751650; x=1741356450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVgVdQhbC2YyNwH7K95+EhEh/kAvax64uDHN7A2amTM=;
        b=ShmY4XyoQEatOK9qHVrSQwa7l9skI1aovMYOXVmN3adwkj0q/juam9tcPfsgmTyZMJ
         7O+1jNWgDU7LehSnK9vwKoEda9fL8VeqSIpMrkTKu4hDQmZUo4t1t+xx7by1HY6UEbqu
         Tz1/UywkSUDxJvsPewM+Yt+tQJK52R5jQgcswwJwTvGziVjx9fnBI38I6QaqLP6oib51
         7a6t6msU79uY2nIosraNg3PhWBqr6MZh5vC94yWvsyXLFiuycmpqpRu/fXuky96wO7CG
         wknpThXtMswXEnmMzr66ShwInVkmkygESE+yAAsTcWnTMcH0y2QtmcF8VQILbuKjMH8s
         v6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXr38NQAbsbnD7lIkDrgxYi8I6DhS/u5E9EYXCXF9F3xliLwGhZGfXceaFOs9wtLdbDHDZMgV/A0V8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDX0gbboYKv4VLoolQBN1SqkFqsFRD9g/8UuBVyzkTTpnDF0JW
	8HOFO3Vknx+N9kjzfkpMyF2LgQXevM5mDnW5khHdW6TEoQ0lsa2knO5aBXHeJ+4=
X-Gm-Gg: ASbGnctaIo5KJrk+gJBhrm1747Yp4TloASHLWBbU+W3IHkHeJfv2uVTz2Vwo8aMFO7J
	4blVU1GQ0tF+fvJazbjjYrbgMpP2RvvKIf8gRD07/0l43qSd/Q7WomRFqmljkI5TmJufOSNQfqp
	HPcQih6sJSVXP6S0xvXv2G2FY7QsACrEIuW3y7ICMTKq6pAXu5J4kFeRWKjdhlVLY64CQ6K7wcb
	nX4Vnn/yeZft/0kLm4mU9LHTaOGb1tMlAFEWbOqKJ3McKseenfV609tlt1uDPqcRhZTdYLZDTzF
	I57dIX4r7wIW7ydFUIqTICB5u+oO2GZj/NcOcM72sLx88X77gKwKY1cY4UVZ51xVD2y/uyhmTTX
	MCwuvuGctdg==
X-Google-Smtp-Source: AGHT+IHCyDQzEJ6kBhW3v4N+pYx5F1W3SqfuZOszPC9Ixk4jqjoqtVWckx72H2jiEWEF9nyPWj82Qw==
X-Received: by 2002:a05:6402:254d:b0:5e4:cfe8:3502 with SMTP id 4fb4d7f45d1cf-5e4d6afa314mr2938285a12.17.1740751649850;
        Fri, 28 Feb 2025 06:07:29 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:29 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:27 +0000
Subject: [PATCH 14/18] rtc: sd3078: drop needless struct sd3078::rtc member
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-14-b44cec078481@linaro.org>
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
 drivers/rtc/rtc-sd3078.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c
index fe27b54beaad1c06b70bf7f22e44c3f6da087267..ebb4d45ce2409982880affbc7a85d5e7410c8f42 100644
--- a/drivers/rtc/rtc-sd3078.c
+++ b/drivers/rtc/rtc-sd3078.c
@@ -37,7 +37,6 @@
 #define WRITE_PROTECT_EN	0
 
 struct sd3078 {
-	struct rtc_device	*rtc;
 	struct regmap		*regmap;
 };
 
@@ -167,6 +166,7 @@ static int sd3078_probe(struct i2c_client *client)
 {
 	int ret;
 	struct sd3078 *sd3078;
+	struct rtc_device *rtc;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
@@ -183,15 +183,15 @@ static int sd3078_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, sd3078);
 
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
 

-- 
2.48.1.711.g2feabab25a-goog


