Return-Path: <linux-rtc+bounces-3888-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D55A83280
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CF2F8A43C4
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9ED21ADD4;
	Wed,  9 Apr 2025 20:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V6tCAMuX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A855321ABC1
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231077; cv=none; b=i/Zjq+ob3cvZH7rqPdixdbFcJmYxGVQxbC/2a9SKhrrtZZiuFV9mfDbWRZ5cpnYghZAwW4c4TSY0x2fDl6+NbU9kZmv9p6mg7uuy5e+zzG+qOzeCD6iX7CqISHMcqZOlQFANfMMCOhFmiLs+q9Rbsixw48ejvj7UaKe0+AFad1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231077; c=relaxed/simple;
	bh=JZoZsQGu+qys2atTASOCtFxTZ7xGv8u8FbjT8AQa4aw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y6OjJI54IO8hUkfy6Zjuy+AYwoR4Ggvr+Zo3mIb8QoiEf0SXN9paZN9/yaoNRpu4zgsm46gZvwLRx2z+G2FiA8x5JpeAtSq3I/g/FRsN7wqCZIDEDDeGO3g2PxWuEgEAXY8BTseBsHKDs5VrTeblh7i+wUdBlbHATFqUEWPxAq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V6tCAMuX; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso21147166b.1
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231062; x=1744835862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJnt4X6YdY/BFyT2FERwCeV5jxdImTZ9iH94rwv0lzU=;
        b=V6tCAMuXmzCFCqLb2nBg7n5ZdExxfGIyLS/rgWf+FIH9xts46XEDLeAjHGY5yMQnMj
         QIMhTx3wruviBDs+GGJ862QPA2W/IxgxmnuRYzk4hSKyiH2vPYlxZgNzPET/DU5W9P5e
         +k4azMVU4JVy1tAAXABoi0kQHoVWs/mqFmLoov7/Qzn1C0QqvfYLKhQfCF11Z9Y2KDGz
         VjNsVKc/zwmZ3tluwcaUKa/CrwacU/LsfIkjPSoHjkpSgsHrbuk/G2aMJ/7P0neb/eSp
         pGYnuxbcv9w8v1cL9Q2fy436IKvW7D1eAdTTqZUzcNH3vsxgiFfqS2jeJ16id0+ulS1T
         JStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231062; x=1744835862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJnt4X6YdY/BFyT2FERwCeV5jxdImTZ9iH94rwv0lzU=;
        b=FK8bTHMLDxtwUHXDt4kD0BnAusLTXtPSvSfzm0SGK98x8K5DReNDskuhopThL/kQ58
         wjUtHxPnQg7CzH4MkeYF+8SOSIEsbXlhVZtP43jZXcdK240IO5+ty4AChBZkh+tnc/BD
         Gnyu8kviFif682dEzUqTHFr5LIzwswPf02bbTyNoPpIyj2sayHdO3ZeregZ6DS8YLjap
         FRWYnfXLljuDRRiErlywBzhYMp7yGXgKgcTf6b83u3fQfmhto1xQi3eTegAbaHFpY2vR
         Me7v0ydZ956kScLEP4eVfVZ1OGYQrusXxTY6LBAw4QL8WFjiveOBh7t79un+o8iyecWj
         zSfg==
X-Forwarded-Encrypted: i=1; AJvYcCV5sK8jb7ZC+eN9d5MD5d0ioN34c4k/daUVR3WBP28aQGc6ZZ2rxPzqkHTz6ZWXMQzyE2gL7ljIm1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhLlh2vsUYEjWrZ8u1CVqxuR8224hNqyRUd1l7Gzyx1LIBIs3y
	Jtgkhmj5JnfgLYpZ0FQAGT6/32ggulndOh72ye/uSu4GbnsA6VW26zHYH7ruZ4I=
X-Gm-Gg: ASbGncsjsZHWIfjGM5+fySIG8TNYbPH7MMzfabPKXarcNq6E8I41d0a5ws2Zxau3JHm
	hRqE7/5nlgutftPk4a2SsAu2ZbXdPrgo1XFkmp2//JBqIH63NdCTBdBMNKV+F5EhgNa5eGCI9+Y
	rgJQDjOwb3xn3LMCJfpEIVUNaButdfkzhu1NB6pgx/vGUOichljtVE4zlaNzz5tEcUkxH8C5sWP
	ltQKteGDIlpSAe7oe/IfwPJWWyXalWSsjOh79/e2urGknxJduUr99Kl3oSQ71Xu4ddBN1KrTu9s
	u44SULRX84c3b0jF6RGibwwxjcSE01ImtN3fCp2eUxIaQdZt/m9M68OM6jCRJJ5e5PWSLVRwQ3T
	qjtdPEVSVQHDI+g9WACYAzNJGouc=
X-Google-Smtp-Source: AGHT+IGcGvyBEozGeWIYo1Wmu1QpRypnZWsnec23s92Whxrsp0WWnRhv1muM1X5KK7DjvKkeOCkkGA==
X-Received: by 2002:a17:907:7248:b0:ac2:9093:6856 with SMTP id a640c23a62f3a-acabd4db31bmr9024966b.54.1744231061967;
        Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:45 +0100
Subject: [PATCH v4 24/32] clk: s2mps11: add support for S2MPG10 PMIC clock
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-24-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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

Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
existing PMIC clocks supported by this driver.

S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/clk-s2mps11.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 8ddf3a9a53dfd5bb52a05a3e02788a357ea77ad3..92c8d36dafcf8a448873567fb3541a1b90cd9837 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -11,6 +11,7 @@
 #include <linux/regmap.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/mfd/samsung/s2mpg10.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
@@ -140,6 +141,9 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	clk_data->num = S2MPS11_CLKS_NUM;
 
 	switch (hwid) {
+	case S2MPG10:
+		s2mps11_reg = S2MPG10_PMIC_RTCBUF;
+		break;
 	case S2MPS11X:
 		s2mps11_reg = S2MPS11_REG_RTC_CTRL;
 		break;
@@ -221,6 +225,7 @@ static void s2mps11_clk_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mps11_clk_id[] = {
+	{ "s2mpg10-clk", S2MPG10},
 	{ "s2mps11-clk", S2MPS11X},
 	{ "s2mps13-clk", S2MPS13X},
 	{ "s2mps14-clk", S2MPS14X},
@@ -241,6 +246,9 @@ MODULE_DEVICE_TABLE(platform, s2mps11_clk_id);
  */
 static const struct of_device_id s2mps11_dt_match[] __used = {
 	{
+		.compatible = "samsung,s2mpg10-clk",
+		.data = (void *)S2MPG10,
+	}, {
 		.compatible = "samsung,s2mps11-clk",
 		.data = (void *)S2MPS11X,
 	}, {

-- 
2.49.0.604.gff1f9ca942-goog


