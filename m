Return-Path: <linux-rtc+bounces-3334-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7B9A49B6F
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 15:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C64E23BD2F0
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 14:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B9D271260;
	Fri, 28 Feb 2025 14:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tIkP3JAb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A427527004F
	for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751653; cv=none; b=eZ0FZ+6gWm9YZvn4t4oUtt7rwE0zloLwwBvddRVxZUEWTMqFF6jWYzfD0AT1ARNeeje3ntS9+0zwpvnfuBUkbTe8ECuNOfcLIO/9RYTDmQj9h9s0pzb1E29r/btHk8QXX40Jy27kgJU+5Ldba6kwqeTXncoCRNh2CnRJKVUaXoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751653; c=relaxed/simple;
	bh=wcWeDWs75X61m+m4siXkgCaNrKLjTdrfe/93knsU6io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCmSq+B+TjTv514RuBHCSZ/GUgnxImaBmIqCkfMI/seLnNDl01mPVk+8B3gLKBLXSkzga3kNfMZKTmy7atfjEBTFmnFvCI+zRFSeouzyRWgV5E8N4PFUok3x8aCDWoZIz8fsHox1l5HKQ000odRDT/DOOqMK47PExHNIImKC5jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tIkP3JAb; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso3344043a12.3
        for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751649; x=1741356449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=tIkP3JAbCYhrYFOvnjaeq/dbjJ2fYEWvHO8pFId005Ye5HsqEYCJIwTnArTYJ+nei/
         u4dh0WqEivGHiSn6n0O94Bj43dMAfp/YJPge5ypbvZ5U6O/CRGd0gAZGDSfiAAdp2DBd
         UJwJQi4xBfOAy0LCaFCiCDlhEB5iSD1HDyvkUVwXjXVnp5b7cburdus715rG3UshB7Ei
         IUQq2FhOBS17Bk1MBHasj/xHW1k45r/XWOTkQj0W6eUsDy1Q+jKYht+WmWcxM+t2Ox/M
         qJ851hynlox9VHT4hhNWZeOm7/OMLBi7cBo4CUKiEaz3dYU5yGF7LqfmhKK8N4ITXdR6
         sCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751649; x=1741356449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=WWFTWg8Rm5m0VyUt8PbbKxFcxhKvK5vCNsB4ZHTMKS4Xz3lRTb6xYf3HWZX1Jmz+KK
         vfRMSUNvwChs0FVY/UyydmzAdYtKjYGRyhm/Tdcxj107gBqoTnWvMmp3AlqJWKfnBJ2R
         PS1Ry/ghLdHHGdPjG8uivAjtQ5MzQQsGU2Glj1q+pMwLmsnMbn9iKIQ73Ift2IL3jbjN
         VxCvnKKUZ3uT7ivUZ9BwXYUZQNPWVnu3EF9FNwan2CxZkYAI96TJHuAdRZkB/Eibl4cB
         z3MPubH/RgH1gJyjuW5EqXDONC5VNfVXeL6+20A0aE7OjcqKNzfsaVPVgidd0mlexv9e
         SYgw==
X-Forwarded-Encrypted: i=1; AJvYcCV9m9tUYAA9+jFQk/MgDrMcjs5lkEQMVrRZDQ8JJies4VwI1F6TBhH4YCBgj2nkg0fuWIU+QXbtKKw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Lu5Kj0sLVcr6/5f7QnPUPXYIyUD9EgpJ0qVwPSX1tDn6Ai66
	8wgB5efeESJzz5JDd2cvywy6evSAn5gxLR5f4GaB2GlgBbisOZJdsd/Ao04Loq4=
X-Gm-Gg: ASbGncsxGlcZtAQkBR5j6IUzTorL6EvO8i8ui6Qks/sfI7cPkZ/WTJHqKy/SZMx3vXY
	y5XKIvtstnJQ3v1fCn2oBL2N8FARmt5Hk8mWJt8f4pIZ5KmxKFjcffIKXD0EaXsZvu0XXjMfO8H
	r4zDqoTr44FFHb/bigtb6l0ynmh/zvRmjyOLJwIcSUKtwPX097lP3S2jB2qqywdcq9ccKDTYQs8
	x+dghc7Y+DGJH+wwV8aoSU5t+YWwrUGoGyzvZMYlN2jaWRqxxXOu4Y1njlSi6vhpZjavg5wT6Id
	3ooF8jjlAUKuC5NPOh6ilTROzp6CHgG68u4jiPa9hRD0MzX60xDqh6RLEYZOorysPkWsLYbJPmx
	cxk+y35xxJw==
X-Google-Smtp-Source: AGHT+IF1zdUSX6ZhtbedenD60jZMcHzIIU2NhAe4k+oRQ6Wt3d6uE7nze1qy/Ap2/A6npGSF7Q9PVw==
X-Received: by 2002:a05:6402:348a:b0:5d1:f009:925e with SMTP id 4fb4d7f45d1cf-5e4d6b1869bmr2990380a12.16.1740751648743;
        Fri, 28 Feb 2025 06:07:28 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:28 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:25 +0000
Subject: [PATCH 12/18] rtc: s35390a: drop needless struct s35390a::rtc
 member
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-12-b44cec078481@linaro.org>
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
 drivers/rtc/rtc-s35390a.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index e3dc18882f41445c41fbea56edbd5c869514880c..3408d2ab274194e39cde38a83567d37bd53f6632 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -63,7 +63,6 @@ MODULE_DEVICE_TABLE(of, s35390a_of_match);
 
 struct s35390a {
 	struct i2c_client *client[8];
-	struct rtc_device *rtc;
 	int twentyfourhour;
 };
 
@@ -422,6 +421,7 @@ static int s35390a_probe(struct i2c_client *client)
 	int err, err_read;
 	unsigned int i;
 	struct s35390a *s35390a;
+	struct rtc_device *rtc;
 	char buf, status1;
 	struct device *dev = &client->dev;
 
@@ -447,9 +447,9 @@ static int s35390a_probe(struct i2c_client *client)
 		}
 	}
 
-	s35390a->rtc = devm_rtc_allocate_device(dev);
-	if (IS_ERR(s35390a->rtc))
-		return PTR_ERR(s35390a->rtc);
+	rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
 	err_read = s35390a_read_status(s35390a, &status1);
 	if (err_read < 0) {
@@ -480,17 +480,17 @@ static int s35390a_probe(struct i2c_client *client)
 
 	device_set_wakeup_capable(dev, 1);
 
-	s35390a->rtc->ops = &s35390a_rtc_ops;
-	s35390a->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-	s35390a->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->ops = &s35390a_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, s35390a->rtc->features);
-	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, s35390a->rtc->features );
+	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->features);
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
 
 	if (status1 & S35390A_FLAG_INT2)
-		rtc_update_irq(s35390a->rtc, 1, RTC_AF);
+		rtc_update_irq(rtc, 1, RTC_AF);
 
-	return devm_rtc_register_device(s35390a->rtc);
+	return devm_rtc_register_device(rtc);
 }
 
 static struct i2c_driver s35390a_driver = {

-- 
2.48.1.711.g2feabab25a-goog


