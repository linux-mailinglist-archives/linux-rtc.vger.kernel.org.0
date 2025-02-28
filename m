Return-Path: <linux-rtc+bounces-3340-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FA6A49B78
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 15:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1480173B18
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 14:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31C927560C;
	Fri, 28 Feb 2025 14:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="psEjhImf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9C2270ED9
	for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751656; cv=none; b=L5fHnSDgLok+uYtaqAzI5CerYRsWygrilqtrGKdtypx5Zgh6Hml3tz/b1yFQs6C0pd0E9Vdf+4E/2/RiKFOvm1DtPflU1XZz14kGD6ZiQJRGMxon0HZswVnVvIBgrH23SzKc9O6D4ser9PJdsfqC3rXa662F+mmnN5hikR/fRYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751656; c=relaxed/simple;
	bh=v9dyh7vGu2dacgwW0mj5cIBOkYcMAu4WL7myCF88UoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tWphoSqWP9YtCAqLqnq5rcc2UquPhaFR4svX3qFhaqrOSyqd43QqJhB1iKVFc5cV7hQjzII2X6pVKDBo1GzC7vVU7hum+dzJypUpp9yGgSWcTBnfXZ3+nXCDGjM9mOXAdo3M/RoGCp8LtWLpYn65oCblPUCdPUCiIN+xGxOzxYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=psEjhImf; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso3088459a12.2
        for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751652; x=1741356452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucCmymGJlfsI4F5PNnMG7qiqKtfzqtFmwv0m9GhXqKs=;
        b=psEjhImf2z84Zyymr3jbDWSwcYu5wLvmzNG5Roh6x2DrxXe9THSO4gG6ngM8t8t0rN
         yDWLM7aqWx8COqo9pvgwZotIU0b5zrL9jSEgYObInU2IafnBc7laTM79iC9aYSxcv2Px
         lQFUYj1ZD7ZYqeJhwY5xWZg7Qj/ZJ0kDT37yFx6bDwsWMWTLrf9nzHtpke//CQ0qygpO
         2S6U81Mi9ZHfpk0YQ4WC4Sue43tVFZLjEXOrzdZJKdM/vtV0uhCjeGu8vWhGz3U+8On9
         TPzL+LrvVv20TXxvYA3/GRm4N895UZfD+3tbOVkIuh0Whyq+0nB3IXAtWV0GIZx3ofWu
         BZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751652; x=1741356452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucCmymGJlfsI4F5PNnMG7qiqKtfzqtFmwv0m9GhXqKs=;
        b=moj0qfsJB3Uy7VGAUbY0ryk+kz3ALGDPJU0gqznMHTNTBiq/0PcMhZ0GNTu4QRab6Z
         06puLpi/l6T4LG25tH/j6UC9TsH0r0CtqhdiP6pMMek1bmOdyLLP89l4thP8TqCtLPyd
         Wj9zMcwBK3xhFCA5ggmWUeGKvWKj49FDcCBZ/kBCyV7e2ABiH029OXHRLNEvPb+9uGKx
         EJu9NEKh06JCb++xdjx7Gto1/w4+8C/ZlIk6HU4lVqqs4GeVQenl+1V9KoxSKQKDwU+2
         9kY1zfjlMCkQHc+g5CfHi2zVDXP+ZAF1M1ggpPBRCcSHY7cHnQ3S44r/+QieFkDjNbgw
         fQyw==
X-Forwarded-Encrypted: i=1; AJvYcCWchzEJTyJnOnbx3N/vKYuzdbpX/YEOaQsiU2SKGd8Ly7vIO69pMzU5xtMPTi8l3WoJ+Xky+WAhSQg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5n9RLuwars3kX8ffednfnQHKlxbCmlZXyK66PXx34gU311Cfj
	wnA2a7pSsMtyo5QJ+zbLTJ4TprQJusjmxeXP/K+/Gbtyg1YE9xKtWh/oTGQTtRY=
X-Gm-Gg: ASbGncszlcE2XqcGupVdvSzO7Dyd0E4IHb4o/iQZs9e8n5jQ09uh6Uc1HRFEPuYB/eS
	NxucbrhcHN8SUUpx+NRtSJkubOI1qPTgWUHCJB17ltjY5ry5AZqHKhz1WblaLI/QSnvri+rnztz
	NmM+EdB0Tct4WeFw15w4qjtfRV6whW/Ns3lH3s2FCsgJbNJygztzrrOjbANj2MOlVWJycH3YJkM
	NvYvALHCwu4va2WcrthuYTfkkIwjBRnFGI3Nm5iTq3gD4SqTAmbq+Z9tQyoNLpH1EsrV0BcACG+
	szYctekw0Fz4ORjER1EkVwmn5OQnuHOF1sQapfSe0TVE4HBwyiub2pHjnjosanQ8OAvfcxm6Xo4
	X5kppz0NanQ==
X-Google-Smtp-Source: AGHT+IHUtKBxx/Kb6wMivayuykLjA27f1K+WzySysSQHyW8EvpaAIClZC0PRyUOpjP+2MS95jX29jw==
X-Received: by 2002:a05:6402:35cd:b0:5db:f5bc:f696 with SMTP id 4fb4d7f45d1cf-5e4d6ad3e14mr2592499a12.5.1740751652457;
        Fri, 28 Feb 2025 06:07:32 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:32 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:31 +0000
Subject: [PATCH 18/18] rtc: s5m: convert to dev_err_probe() where
 appropriate
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-18-b44cec078481@linaro.org>
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

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 50 +++++++++++++++++++++-----------------------------
 1 file changed, 21 insertions(+), 29 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 77dd61c30681b8f0a2f23063ad5f7eb52f5b7158..4c66e38145b02638c48685580c7943bdf79bfbd4 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -626,11 +626,10 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 	}
 
 	info->rtc_24hr_mode = 1;
-	if (ret < 0) {
-		dev_err(info->dev, "%s: fail to write controlm reg(%d)\n",
-			__func__, ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(info->dev, ret,
+				     "%s: fail to write controlm reg\n",
+				     __func__);
 
 	return ret;
 }
@@ -669,26 +668,21 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		alarm_irq = S5M8767_IRQ_RTCA1;
 		break;
 	default:
-		dev_err(&pdev->dev,
-				"Device type %lu is not supported by RTC driver\n",
-				platform_get_device_id(pdev)->driver_data);
-		return -ENODEV;
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "Device type %lu is not supported by RTC driver\n",
+				     platform_get_device_id(pdev)->driver_data);
 	}
 
 	i2c = devm_i2c_new_dummy_device(&pdev->dev, i2c->adapter,
 					RTC_I2C_ADDR);
-	if (IS_ERR(i2c)) {
-		dev_err(&pdev->dev, "Failed to allocate I2C for RTC\n");
-		return PTR_ERR(i2c);
-	}
+	if (IS_ERR(i2c))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c),
+				     "Failed to allocate I2C for RTC\n");
 
 	info->regmap = devm_regmap_init_i2c(i2c, regmap_cfg);
-	if (IS_ERR(info->regmap)) {
-		ret = PTR_ERR(info->regmap);
-		dev_err(&pdev->dev, "Failed to allocate RTC register map: %d\n",
-				ret);
-		return ret;
-	}
+	if (IS_ERR(info->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(info->regmap),
+				     "Failed to allocate RTC register map\n");
 
 	info->dev = &pdev->dev;
 	info->s5m87xx = s5m87xx;
@@ -696,11 +690,10 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 
 	if (s5m87xx->irq_data) {
 		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);
-		if (info->irq <= 0) {
-			dev_err(&pdev->dev, "Failed to get virtual IRQ %d\n",
-				alarm_irq);
-			return -EINVAL;
-		}
+		if (info->irq <= 0)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "Failed to get virtual IRQ %d\n",
+					     alarm_irq);
 	}
 
 	platform_set_drvdata(pdev, info);
@@ -724,11 +717,10 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		ret = devm_request_threaded_irq(&pdev->dev, info->irq, NULL,
 						s5m_rtc_alarm_irq, 0, "rtc-alarm0",
 						info);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
-				info->irq, ret);
-			return ret;
-		}
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to request alarm IRQ %d\n",
+					     info->irq);
 		device_init_wakeup(&pdev->dev, true);
 	}
 

-- 
2.48.1.711.g2feabab25a-goog


