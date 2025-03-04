Return-Path: <linux-rtc+bounces-3387-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62201A4E910
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 18:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F30219C3417
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 17:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8B728F920;
	Tue,  4 Mar 2025 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JjpaGvfe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B07F28D049
	for <linux-rtc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107936; cv=none; b=geuDcZleZnjSZO7lXaKgVxpu+ijo90/jacxYi4FQJRTSA9GsukJP9V/jG+UO26wimqMc1Ph1Hms6jWpSScRztyRRCpp72EVaRk13uYeLKi/IZVUrlmdHl969TWF3FSHrQhB+FoHdxr1pALqYhL+YLDrudJLbOlXhtsyhEjPklM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107936; c=relaxed/simple;
	bh=HyCZnj76UJVLp2TFtsvoqPrnKIyS4fiKrwZnWeOiCGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZErpmp6sXXGr2CVTskhQckkuRWCsoQGuFeCt23DYmKbL1+6/Bc0/xIN3fvYW0hJG5fjjwQbGXzza3GjtMAnnxgzgyIEOD9HIHDTgN+G0eTwwp+N2s9rWPIfE+qadv1UeIFcCr9ePvivYqgISiBWAMyD9EiwZpfw4YWnbft0TJVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JjpaGvfe; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abf4b376f2fso584937166b.3
        for <linux-rtc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107933; x=1741712733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXesqtK3A8i6ZSMFwP8n6Z6kZDUFNsTogrZxF0Gh9Ac=;
        b=JjpaGvfeXND1gsfIdIOi5Nk7vBOmHveBguX5rdh4QUFLQh/gyAB5LEutlmL96XIt9u
         2H8jEpvgTzvhzDBaaHd8+NTKZ8Gw+dpwXAzMGO5jf4c6/vEqqPDi/rsea2Ya4rpaKKly
         YYRodY3e0yyZn0VpGqyWfqZ355MXDsBQU4LrjsEBg2CzLff6NG//KhZOwc2Uc9AtxSFA
         sTLXJRhgPZLcOL+bqUN/usZut+CpNv04Yxx1VhvjOcoKPQ5EC/3+wAXg0Gbn9vw3As04
         EBwD0AOM+JMZIZvL5K6qyH7KqtUJr5sDZPiCkwOTH3/nStZPSmJ5G/iFR3+wLfocgEaF
         7yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107933; x=1741712733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXesqtK3A8i6ZSMFwP8n6Z6kZDUFNsTogrZxF0Gh9Ac=;
        b=mNMm7Dw7UoMFxTSryicbwvnpc1fVhyOZe2w87HNlvY3ekAUSstAVPLZ7LxHEWybYsA
         gQB3TqatgKNj2T7UC1AWLQ5sB0GU9/pk73/r0v1HNgbwUJMJ3wW3idWJgokQrPAUMpmb
         1PDx1uYUVt1zl3G0jhM9z1OxlnmDqUJWrpZ4CVHmd0moprXbt7YBuRMONkgDbFo6P1oG
         4tylnwShtDqgOs7Cihcqe1ub2j24LYmqfL3SSTIwKcyftFNkMBAlOZj0Dxg5zD1M2+ac
         XCVWsaYUfPqM4TUiKvdqKx+bCqPV2QA9rfqlhekCe6m/X20dfcWt17FqF8X5bbLuq8ps
         m4jg==
X-Forwarded-Encrypted: i=1; AJvYcCV8+mqoRyJ5i6uIYTUqaZ6+jZOq7I2zw6bzWWO5fo9GgbFbL2MBSkFJ+RKQETkaO0RsC15oXeG1a+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKa+9+JTY75RLf6glHJlYIGQFDJ/oL2vfneOsA5kUnTr75B4X8
	5u0dinvj/Jt1UVxE5r7wmkDuoGBqY3U3pUgOUkynul0OOKfQTlgxq3NzKIGMRCs=
X-Gm-Gg: ASbGncsgOgrwYZlcvjdCI0j0n0Ie617MwpaY5W/RGNg0zRXDF+KtSdMm0WpwA/YB3qW
	UBOAera/4dRZa3ioiMDgq5mu0uvsJCr+e2s/lY59UeQ2m7F6RMofHZnxRST0xbtleoTf1sEkzcm
	UHQvzndIyXtdIlrxkqhNjaZk6U6oYnUsjbsqLAb0N/WsFxD0bMlH4knWRF7GNUawohgxq1ttcw4
	72+IkteDDk76gtMoRFHC1hEsXDftesM17dIPCmHxpTrwlRmFN4xM7PFKscvwAGua71FbToDIWUU
	QXvbG1f2xwSlHqBMdA2KRwT6PnDqpMcI7pJ/6GR7FtlQN38WOo4PtKXgP8m/1ppWT38HfIKa7Q3
	fMB4MSAt+U34RqNkuvSnPe4Mn9JZC
X-Google-Smtp-Source: AGHT+IHVbcY6l9+JTAHHIw3fmIWanoQo+sapqWdolutCogJsq5sGcHSbYPT4D1lGvFYrwfxZJsMGVg==
X-Received: by 2002:a17:906:f5aa:b0:abf:59a3:df19 with SMTP id a640c23a62f3a-abf59a3fa56mr1580793966b.57.1741107932647;
        Tue, 04 Mar 2025 09:05:32 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:32 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:30 +0000
Subject: [PATCH v2 02/16] rtc: s5m: drop needless struct s5m_rtc_info::i2c
 member
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-2-d4689a71668c@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

When this driver was converted to using the devres managed i2c device
in commit 7db7ad0817fe ("rtc: s5m: use devm_i2c_new_dummy_device()"),
struct s5m_rtc_info::i2c became essentially unused.

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* fix arguments to devm_i2c_new_dummy_device() - too eager sed //, and
  gcc didn't notice, only clang :-(
---
 drivers/rtc/rtc-s5m.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 36acca5b2639e272dd9baed06ea5582f635702b0..88aed27660348a05886f080a2848fcabbf9666d0 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -146,7 +146,6 @@ static const struct s5m_rtc_reg_config s2mps15_rtc_regs = {
 
 struct s5m_rtc_info {
 	struct device *dev;
-	struct i2c_client *i2c;
 	struct sec_pmic_dev *s5m87xx;
 	struct regmap *regmap;
 	struct rtc_device *rtc_dev;
@@ -640,6 +639,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
 	struct s5m_rtc_info *info;
+	struct i2c_client *i2c;
 	const struct regmap_config *regmap_cfg;
 	int ret, alarm_irq;
 
@@ -675,14 +675,14 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	info->i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
-					      RTC_I2C_ADDR);
-	if (IS_ERR(info->i2c)) {
+	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
+					RTC_I2C_ADDR);
+	if (IS_ERR(i2c)) {
 		dev_err(&pdev->dev, "Failed to allocate I2C for RTC\n");
-		return PTR_ERR(info->i2c);
+		return PTR_ERR(i2c);
 	}
 
-	info->regmap = devm_regmap_init_i2c(info->i2c, regmap_cfg);
+	info->regmap = devm_regmap_init_i2c(i2c, regmap_cfg);
 	if (IS_ERR(info->regmap)) {
 		ret = PTR_ERR(info->regmap);
 		dev_err(&pdev->dev, "Failed to allocate RTC register map: %d\n",

-- 
2.48.1.711.g2feabab25a-goog


