Return-Path: <linux-rtc+bounces-3400-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7E7A4E92A
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 18:36:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0488F422A5B
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 17:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE1B2DE111;
	Tue,  4 Mar 2025 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HWeitVD2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28982BF125
	for <linux-rtc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107947; cv=none; b=KF1rurVc2fgbuDSv4ZA2xPQcrFwFeaeNmwR/eXnymOBq8Kr+hJ0z/D/HD8dndJS12suU6igxqriazxVZPrec/s6OvfxPd+9wVWMgY30pKdUxughxX/MOE5uHbeutj0q6arA0ZPjHEz3dJfQcJ5+I1cgUdnxJeKwMPRr8EO1LOJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107947; c=relaxed/simple;
	bh=9NiX1CWV0hfu5OaTJtAP498kfcNRuxNWGXOfalDiImQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uaz2VWiLsC0vhL9vhc/vMQZUIry8HVsFdog8E+Dtw9JwXhIbJNtME6tBjfcXdk25rHHcv/06P6LcZva0whbBOSUMaPgZ8Z673jgZLbT5XsmFY5kOEiNHGKaOGbhvprVqUFrE6PDfJNUFZgy+9GDFa5GEif5k+0QDC2+sIbT6/7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HWeitVD2; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43bbc8b7c65so28261405e9.0
        for <linux-rtc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107942; x=1741712742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+a3Z9er7HS5GhzYho010S7pznnO0QcQ46P/wgZR3Rg=;
        b=HWeitVD2KfHXmID+JZ0Qw97az5c4S5wCuYWb/qh1PoKs3mkNUER/F7p/d2srKVNvrw
         7ZYwQzQlTbXJa+xJ1M+/Ky4NUxfnWNkCM23LmrZ9u/uVq0m3aN1IDMHt/pS5bda4Py+N
         rUogfWzaLnd3LHPLBPTYgoOHncg7K/TdqS9RJMyi2p614MxjDcngJa541Opm1ep/FJTp
         QrU1MWqry/N6+b90kHydMqqzugCEFH84hc/Z+WLTQuQfzDmRsgwULR5jtnHco0A6KQVK
         nceYkki+sOCjkti7fvQUAEumI6GeS7B2g3iAKA08eIGN7Waj8J3W7ZoiZMxZ4nZ8Syy2
         L9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107942; x=1741712742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+a3Z9er7HS5GhzYho010S7pznnO0QcQ46P/wgZR3Rg=;
        b=ko+TZum5MAtPYW5zOo/rmeuKfYsjVSuJlpYcXHxzvk+zgXK0Tq969ZuS2IbiXfOgck
         GkGQiY7ksR1vd6dgln3XYQk7E9NtZCLlbCsSjFxkJ++QG2npuV33N486GRD1+C99xHDq
         nOa0Ina0QjlrBvXRIeEQepheiu4JEDrk5SDZ2xrDPOplCaFVVMig9qJTFCvB3ZbY/bFN
         ncQGuLGmOt7fBaSi5g8sTo+gS/qldOtsyb4qxznI4lIwiIT/uDKq4A80XMuDSMgPAiKT
         Gk1JB4Fp7azxqtGMmIkbKiIvmepDkRj+c/K3TbvpEuXVAqkdV2BhAVYhVgr01eDkIeKD
         GTbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8Yv9U5MXab+WRed2mlWs13tgBgnTo5p2gTiXcBLsQtBd+WZ8IvGdoc6FTsV7SROVdXRv7D+waff4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD8+XqGwsBWSNV9LROfvkXvRMWLe5DkHuIGmPB3zUUq1gXmzFL
	Bgp4zjQ8syYBAY5TSmxx3U3G27lYrD2RnUE1R/XY4l0fRlQYoWJuLK7btjKFAhk=
X-Gm-Gg: ASbGncti4Sp0yalOlekyKJbJeLlYCI8ijLKA9cuIZ6I60+3MaVtjIXo+6U+DWw5uZui
	BlnfxP5zpy0NNqivwIhlSJZ5nTiRa1zvTtBKd/tZRzidqAEcCgw5BGQQs7cVOd8hqCNGL8WJYMp
	9Z/TxW6UH348Y4RmzhOPoUkbFprT+yFxHsgEqefC0xO2FK1SikRWa75vKdWnXHi3HhlIV+6FEjG
	9/lVJ4WmeHdEb1gGQZ4jLDdG2fu/0Y/XE2+LloEDhDyh/dfhHMn0kvb0jFh9qIEQSgEaXEDANr1
	7tyDWZrjPXgx3LawVQ5uhEezHJpA6qpH6fNmrj+CVxYafrwQ24kZAOUyGKM+BS5JSKQFk9nQ+O8
	Ct2GE8KUN/u9VPvUsOuXi102Mdq5d
X-Google-Smtp-Source: AGHT+IFBi6JjsYJDnSEwMCPY80NtpnY/0pWo317IbLvcMp22I1j/lVgkodnN+FQ/p9Zn6V6GISOI9g==
X-Received: by 2002:a05:6000:178c:b0:390:debd:70c3 with SMTP id ffacd0b85a97d-390eca25fbdmr19248281f8f.54.1741107941433;
        Tue, 04 Mar 2025 09:05:41 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:41 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:43 +0000
Subject: [PATCH v2 15/16] rtc: max77686: use dev_err_probe() where
 appropriate
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-15-d4689a71668c@linaro.org>
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

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-max77686.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 6b0d02b44c8097453f704cbec9f02580fb869ca3..69ea3ce75b5a5426d4a56b979773be71c4ee7562 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -704,10 +704,9 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 	}
 
 	info->regmap = dev_get_regmap(parent, NULL);
-	if (!info->regmap) {
-		dev_err(info->dev, "Failed to get rtc regmap\n");
-		return -ENODEV;
-	}
+	if (!info->regmap)
+		return dev_err_probe(info->dev, -ENODEV,
+				     "Failed to get rtc regmap\n");
 
 	if (info->drv_data->rtc_i2c_addr == MAX77686_INVALID_I2C_ADDR) {
 		info->rtc_regmap = info->regmap;
@@ -716,28 +715,24 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 
 	client = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
 					   info->drv_data->rtc_i2c_addr);
-	if (IS_ERR(client)) {
-		dev_err(info->dev, "Failed to allocate I2C device for RTC\n");
-		return PTR_ERR(client);
-	}
+	if (IS_ERR(client))
+		return dev_err_probe(info->dev, PTR_ERR(client),
+				     "Failed to allocate I2C device for RTC\n");
 
 	info->rtc_regmap = devm_regmap_init_i2c(client,
 						info->drv_data->regmap_config);
-	if (IS_ERR(info->rtc_regmap)) {
-		ret = PTR_ERR(info->rtc_regmap);
-		dev_err(info->dev, "Failed to allocate RTC regmap: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(info->rtc_regmap))
+		return dev_err_probe(info->dev, PTR_ERR(info->rtc_regmap),
+				     "Failed to allocate RTC regmap\n");
 
 add_rtc_irq:
 	ret = regmap_add_irq_chip(info->rtc_regmap, info->rtc_irq,
 				  IRQF_ONESHOT | IRQF_SHARED,
 				  0, info->drv_data->rtc_irq_chip,
 				  &info->rtc_irq_data);
-	if (ret < 0) {
-		dev_err(info->dev, "Failed to add RTC irq chip: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(info->dev, ret,
+				     "Failed to add RTC irq chip\n");
 
 	return 0;
 }

-- 
2.48.1.711.g2feabab25a-goog


