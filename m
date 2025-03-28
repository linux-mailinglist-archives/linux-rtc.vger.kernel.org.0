Return-Path: <linux-rtc+bounces-3681-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D045A74B1B
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 14:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDAF6178324
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 13:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE4823642E;
	Fri, 28 Mar 2025 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aWEkT/bz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CC21990CD
	for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168671; cv=none; b=Q1opLoLu2UGevQcwvThII+CbJ/MdXOi42f1pSS020KAeSVjB6Ex1NTuPYajcEkMCTwo+9+hy/7DnHlz+Zxdu9OpN+hBysw/U2hOklb7NNCLUMmumLqW/aTqj4l/CY/89Alvbf4QP+c9M8CnXV9QQbrjq1/ABy3D0oSh6Y630IT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168671; c=relaxed/simple;
	bh=y6yU6lYRyqEHU2RYOfcRxwcasP7T27SnGV4OR5isOHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MpsTiNe8jUMUB8/LgTQz2mV1Bpkh5hVMuxF4hDXkrHY8UvXnf3uFuoebfCdkCB6gStLezaHG1bK0btjPF3NTGOUxF0InYRfJlV6Lt9VvyT5uU4zpoHFpRRriIY6W4YoILQA4nMxg2sY1MpXVxw8/HNN248yBNcoUTJ4xSBD1nEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aWEkT/bz; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so3663093a12.3
        for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168660; x=1743773460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pB7gFyupIzWsX2vSOEGK7q4UbjZdy1MRwKTSd+TQnVk=;
        b=aWEkT/bzhASSI4KOxwmBNBZe6evdgGI6ePH6Mdx65HYfca1Y9xJqAaMLpivF8wQ+G3
         Qcuw9+Xq+q6S0SPAZXUEQhue8Ke3AauxFUPbUT7GCXvyS849d3aGpp1XCJNcbBsCmZN7
         zzI1RCJ4KGRmteOfJcRj18JdYm/1lAy7aSHJ0SWqzddeJBfdDdUOvbzoxuh5eN1Zh9d8
         xGiOTFFBsu09dq6fGyjVTEGwlvlCUErY5yT8oweIZyf9Vo7bL0SRHCIF4C+gTzENZa1R
         rzVIbkm9u0xpUZCvhmc1HytmIr5bDxdrM2Je39vkMMyVZ1+xMc+qVMVmL6tBckKFAqET
         IINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168660; x=1743773460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pB7gFyupIzWsX2vSOEGK7q4UbjZdy1MRwKTSd+TQnVk=;
        b=qL3+W5x63yoDlu9XqS+xT0lHWFf6yr9Q+gUhJvTTFfiL+fMyX2s1T5MYTL3ckAB25v
         UNlcKJiA/7CwYlghPoOM4UakdQhrbCjbprTw+++LROREZKhcDiJ0psrax0pQy/oF/KJZ
         ZmHvFdst3BpfbrjnFeJGBjI5OYVo1uqYbtNhIjzrAIg5ff2RsIdUTHs4mA5VvksLkTVf
         kJcPZHX7I/5O2atS5vyZ10/DE7CmXwzq4M+gXiy//yJ/8dEoSnr0kscNLwhF87Y8QYRW
         El150626jiU7dS5YUOfi5ho5Y5W87M4gBvD47oG683JeRc9qav8oPgBMrhzgdx42FvvY
         QcwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNsLLDXlQatQLpxDkCQdmC25J/fn1uTyYQIsDzNbxvFfCTJI19zTFXPKXseQ8EIvkNJ8AOZnAnqd4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2uZkGihV0DXNX8kL9SuWdYptbwwa7Csa7hl2q+jvJqaOeW8YR
	A0bLfGtkW8ENfX92hyKIw6BeqJAdn7xyQJmAbA4RvA3p2BGADf97PFvMizKM9qk=
X-Gm-Gg: ASbGnctgt0iHN9SNyG5/1oQOZwRU2bLo/71YePwbcpQOCT5aAp2u4EFlGQVGgnajux8
	z96vwfCtj+x/9z5yBWaI372KF3HN5pjUtVp7T9H9KowJTvp8NA+JnHwI18ZcbGogATe+oFGzfsN
	3RyfJZdVIl1DtuCC0E/hiVRoUQ+kDL9QA+P0IjyTLbMQ2y0JvfwcXAmSiOcwVKOaFuDYOfw1Mc1
	sW+T62r4abLdyJo0ybzxI9TwQAk4MldvA+tJmK9hXXIGrvZqs6mFnT+4rdBsUhftdXI8r1hJsdy
	7EvjwgF/A0FkQkvdUemAsoYcrsJlbLVXXBVFpXvK6nMZy7FsWwjJyYOdLRhRQucS8rTuDKo7nAA
	qqSryaNLYkofQfrr+XS93+rw8QIX9
X-Google-Smtp-Source: AGHT+IEfLeFVVKPzcq/g9M+Swoap13H4J7LtCPC0wmGIvXuvFF2fbhLbZmznj1q9fH3/uH0jyy0zcQ==
X-Received: by 2002:a05:6402:2753:b0:5dc:9589:9f64 with SMTP id 4fb4d7f45d1cf-5ed8e4a9609mr7684378a12.13.1743168659884;
        Fri, 28 Mar 2025 06:30:59 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:59 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:58 +0000
Subject: [PATCH v2 12/32] mfd: sec: sort struct of_device_id entries and
 the device type switch
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-12-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Sort struct of_device_id entries and the device type switch in _probe()
alphabetically, which makes it easier to find the right place where to
insert new entries in the future.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-i2c.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 8e3a365ff3e5533e27d94fa8a15dbfa639518a5f..966d116dd781ac6ab63453f641b2a68bba3945a9 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -154,12 +154,12 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	case S2MPS15X:
 		regmap = &s2mps15_regmap_config;
 		break;
-	case S5M8767X:
-		regmap = &s5m8767_regmap_config;
-		break;
 	case S2MPU02:
 		regmap = &s2mpu02_regmap_config;
 		break;
+	case S5M8767X:
+		regmap = &s5m8767_regmap_config;
+		break;
 	default:
 		regmap = &sec_regmap_config;
 		break;
@@ -184,11 +184,11 @@ static void sec_pmic_i2c_shutdown(struct i2c_client *i2c)
 
 static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	{
-		.compatible = "samsung,s5m8767-pmic",
-		.data = (void *)S5M8767X,
-	}, {
 		.compatible = "samsung,s2dos05",
 		.data = (void *)S2DOS05,
+	}, {
+		.compatible = "samsung,s2mpa01-pmic",
+		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mps11-pmic",
 		.data = (void *)S2MPS11X,
@@ -201,15 +201,15 @@ static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	}, {
 		.compatible = "samsung,s2mps15-pmic",
 		.data = (void *)S2MPS15X,
-	}, {
-		.compatible = "samsung,s2mpa01-pmic",
-		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mpu02-pmic",
 		.data = (void *)S2MPU02,
 	}, {
 		.compatible = "samsung,s2mpu05-pmic",
 		.data = (void *)S2MPU05,
+	}, {
+		.compatible = "samsung,s5m8767-pmic",
+		.data = (void *)S5M8767X,
 	},
 	{ },
 };

-- 
2.49.0.472.ge94155a9ec-goog


