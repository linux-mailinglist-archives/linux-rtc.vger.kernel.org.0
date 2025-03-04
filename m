Return-Path: <linux-rtc+bounces-3402-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2357A4E92B
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 18:36:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1B09422FC3
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 17:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E3C2E1389;
	Tue,  4 Mar 2025 17:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d3oco5Em"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EAC2BF13D
	for <linux-rtc@vger.kernel.org>; Tue,  4 Mar 2025 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107948; cv=none; b=eq/TdwNIIxPzMPIWfOcgMiDI64A7k220NyAhuCCuaQ3w1Ui9YOICyaA0SzU+uMHzGoe+4bH96u0jjs+dp+EETHi/USzzsfYP6SYFv8GLxY0BchM7urGZxg8+1GIW+xkq9BvbiFLTjRSEn26xxC9vHjkEEgxAIDS3Sz64O5ELmEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107948; c=relaxed/simple;
	bh=1+UZb0QJk2ChT7YBKoTmCJG5wrAK+GA3H4NxSsqsqCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j9AbA728qRJ7+4Ht9Pvyfmi2gglZg6F/TiqtRqa+pgNItBDgrOW7AwzZxqcNrs1AlsCTJe1zhozMMK5astFue705uv+Jsw8PCipMOl2giDA2YLo0T4e8NmPGhJ6ojA6kRrLjRahCFqhJogN/+O/QekgI84gYtXCjcpJlQitbjD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d3oco5Em; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abf48293ad0so587734966b.0
        for <linux-rtc@vger.kernel.org>; Tue, 04 Mar 2025 09:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107942; x=1741712742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKiEbfv2wxdcP+dRwBnTiew8ux2INId3e+zLxFho3GE=;
        b=d3oco5Em6LpOvP0G9jtoTAJeG32NkODP1cxZWrmD2Dvc1pQj0TvHv1OqugA/e/+qY6
         QYY3pspflFFEXZMkD1EfJ4ZLZ1WN0pvlKUp3MuSGP7GBS/4lMMHw42SFEEZrgeHgE5o/
         k57vTk++rBCCGzoWPv8ZhZRbnVX+GWF9yZ2qt9mwEamr84NPJ1fht5uzeiymeM/sGPai
         ETDC5rNMNoy1cW6BxAwhUPg6iEJi+CKGChHkMJC8zpyV9C62UYDpe5sTIsE2YVqMoTo6
         3/SYAjE8orpFqrPhfKtL0JG1JAOJoQYYftiIyqeaEvya6Ss7c4VRbbclz9iLRYA/1Bdl
         mGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107942; x=1741712742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKiEbfv2wxdcP+dRwBnTiew8ux2INId3e+zLxFho3GE=;
        b=C0uBaulQLVWxmcRoLYtvDnqPJNhLKRoLFNPpN10iXw67v051JK7Sd/ONdWPDhnbCjK
         dvtoN3NmQaFHgc1A7BX7G/+K380vQ13ehdj9DscuI7q/sGnYjSaO9JheEjloxGXEseuM
         8rVmlypKJa8J6eJNqOOAdMxjofD75OXPaaiP02XIUrFDMTxWWo5Z5mVk0ZGq9SzIX6te
         ckihHZBbP8CMGr+Y6AOy9162hG3LWNkRS1RULSMTNq5pcthSNB9GV+7ktCoEnw/ly4FA
         13GKgG55/jfu9ATOzzp0zJQ/t/HYqtLoOlZ4tX7y6GvlBo8PUtP4rNW95Y3f6V7lfOh+
         31Jg==
X-Forwarded-Encrypted: i=1; AJvYcCW/yHfySoFTUfMVjOFza8CYkyB4+9ww8nWMCkpBDvO/Cdu9lxDw1Xy6VTXpfzCuZ8gKMLqQyhjhTXo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzln82nbbdhwTaPV/fMRm13PjipkPQjJwe6Ki2N3oYTLtDJdk2t
	rf6VgqLIhqti1F+BixoDFLbx4koi93Pw0+5n/FQA15l667zcZOe9IjU8iE01DbE=
X-Gm-Gg: ASbGncvLZbggTlmGvHwtGvPOkqO/em9/QhuWwDHC5d4ocm2D8y+Xy1Ci2xT5yNbBvl9
	2oVBdMuO4VONGYNBOqrXR7DkUontRAc5LIKcCdViFlFG/SPRPtdEVgqia2QSVKJcIPhifSixFS1
	JnvObResLioifvkQPlVFRo8imz6pO8mW5KVzO+Kzq89qFt1bTWk0Kre9P9dsiYm1UDuC7aXltfq
	JKOJ9FOxj4DMBGzzbyABv9ZZciZR/ue5bR5ADwKao62hl7O1Vy9tkt2ea0Lju1ZoMoZQzazNFeY
	vLvynp68cIZgqa1G7WbF+4+r2y3/ekVOEtv7P4yjNDoBbeogE9lZ6UHuAikbmudAUeOUl2pfw4f
	ZIG51wJGIKgIPGGCcq+makeBL4XVV
X-Google-Smtp-Source: AGHT+IFbhvINfL30hs3YpvAxvNGhpuF08a7SPp+ErND7dZCCpi05AobDmHrT2jaUznfQQ+NeOSHQXw==
X-Received: by 2002:a17:907:2d0d:b0:abf:777d:fb7a with SMTP id a640c23a62f3a-ac20da97c7dmr2947466b.46.1741107942351;
        Tue, 04 Mar 2025 09:05:42 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:41 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:44 +0000
Subject: [PATCH v2 16/16] rtc: s5m: convert to dev_err_probe() where
 appropriate
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-16-d4689a71668c@linaro.org>
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
 drivers/rtc/rtc-s5m.c | 50 +++++++++++++++++++++-----------------------------
 1 file changed, 21 insertions(+), 29 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 88aed27660348a05886f080a2848fcabbf9666d0..db5c9b641277213aa1371776c63e2eda3f223465 100644
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
 
 	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
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


