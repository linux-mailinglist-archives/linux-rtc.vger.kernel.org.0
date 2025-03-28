Return-Path: <linux-rtc+bounces-3688-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BB0A74B35
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 14:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 878E8188FCCD
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 13:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A979B21C198;
	Fri, 28 Mar 2025 13:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fp1xXmKZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F5F1E51FC
	for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168677; cv=none; b=Tv2LZbn1fwvd7Rr5mOiDg2aFxrlpf/SIxJEDGgVLW4rgtWrbwAtnGjP4Tjd7RtUYUAhtLNdLNNbIuRLwjG5v2u46ZvTnlkjilhtekUIjITYG1rMdIBypWZ2huwo2HOwa1lEl3oSuG4MhPOhUI5kaKujkMnmTNfU8pnKbRp+xc0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168677; c=relaxed/simple;
	bh=kEDFa+8UVBQzgPmv5eunRw1YTfTPcSizj/QHfDecNE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pku8trauXDiPFg1M4JlZcoL2zYKu0yW/CyMZcX7Gcfj7cIWX7MxRI/yGFVtrhyg8UMG/XWEAT8ccMUz28R1qTUe/2VzuhozKTwzCMGox8r+uWBbc/YP8+xs43gIUfwCTXOHb0XTCwKAbWkZ0N77k0h0tVowdoygqsaAL9cMz5D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fp1xXmKZ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so312080a12.1
        for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168666; x=1743773466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=fp1xXmKZegKILOcnMMhnBzMmxqOa+3829cjCZ/M9/fvWw+rTE43gHntN9Kut2LiucL
         Jxe5mnb+b/MKhJgB6P424E96nPPVYATrIsUYfD9llnzlMepBi4Od0Bxq0z4A8rkE5T2N
         tViFclVNvinzdX/6XVRdb02bKCse1/7ibkPs7iwqsMJW48l5BLgfBZagFPoh0p62KQ2e
         x80OLHd9+emeKjWhTgynvdqvzims/yJJJFKl694bUze9O64A8vJunTFA4lC2X2lX+KoC
         EpVw8j9n+TOO7FWTh0IX/gqgn0C0Q66IiXnXYwLMLmt0lXg3/moqUqgQmBcxlx4BLbNR
         B51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168666; x=1743773466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=gO6E6XQ8dF+Balg0vk1dCEtxE4CP+PhBvCvpRE+sqDV50klzA/23f8rF0b1UBfZuao
         1zHMvb2dGVzRjBv9/L8Iq3wOcidQf/9G/QutKYrs7BLTqDgiJTJv3Le6uGvPplJlzJ5h
         J7cQtj210bFs/jTNCSljMysk9wHko7DoWP474C4pc9C9MUE6GUxXFxGlGdFCD81lZfbz
         ag4Tc4KdsMWt0lJCzr9RRM5nwxQMxSwFdBb1rwi0hShtMxm1AuQ7kMrhAbyW7699eCuS
         +8Pm/Ii3JRD98HZep8tt9X96R0HzK4by3L/LH7oWCooYaUTP7vY+MSibPjamr1OweMrV
         KIgw==
X-Forwarded-Encrypted: i=1; AJvYcCUqbKc4y8hBgNyylsPgnrRmf1gH7/dkhvsOHctzwOORzqJbCWbQqJWJ7oSqAOtw3HyTFH0Xw2cMqGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YykmqPUkNomAsmcCVGIKu0u8uE5MYcv1+dKGo2OFiX2CB5oRsq9
	VOVRYV0d/KZ8HXXqPC820p+VEliQkHpn5sF3Je8tChBeUVNuqypG6RPzAFxVYRo=
X-Gm-Gg: ASbGncvf6i3jn/lSk1E1jc0XdWILyoP9Tj0Xo54bLNJenrJuSTjez0+iOeJZ6Vgsh/m
	1Hv8n0GAMHoZu8Er+IsWlJ9cg5ZvZ7zQuqL7d8DTp6RS71BrSgfzd79+xFLPfPV0GY7cfi2rwuS
	VsaxOJ2a2UQ1xond0oRAKXQPqEJlNNqy5qIHy8XLgzawUeECFFUDDxkcWznHa+D7u9AFBoCx+YN
	r/fCrdBFkmwKNnFbakhyDD2Dj2L9GBdbED3rhsNUVSZXAn5JMpj0oOC8DWBebOIGxeWRTBeQtfa
	lPVAeUcmpzzYajl2bFRaTEIb6yVGV1pnMyfTYtcTB0smQVBKYmIf74p+0FDqEK3hPOrYPIy8xHv
	4DWYyMoRUjOdFkbtsDWLR5+tpV3IpQVVnjNfeZKE=
X-Google-Smtp-Source: AGHT+IGAjkKL4/RcQRVs4lvBXbIgZ8dDCpbSsQ9PMQOGZfxyLbsOG8rXC4O3k3x5fcgkz2IEiIeoJg==
X-Received: by 2002:a05:6402:1d51:b0:5e5:e836:71f3 with SMTP id 4fb4d7f45d1cf-5ed8ef20410mr6346734a12.29.1743168665879;
        Fri, 28 Mar 2025 06:31:05 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:05 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:09 +0000
Subject: [PATCH v2 23/32] mfd: sec: add myself as module author
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-23-b54dee33fb6b@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Add myself as module author, so people know whom to complain to about
after the recent updates :-)

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 1 +
 drivers/mfd/sec-i2c.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 448300ab547c10d81f9f2b2798d54c8a03c714d8..05658f05cb857a784c7d01b1cf25de4870e1a95e 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -293,6 +293,7 @@ static int sec_pmic_resume(struct device *dev)
 DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
 EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
 MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 2ccb494c8c024361c78e92be71ce9c215757dd89..74fd28a6bc9a42879fc1eb05546777f60e0062e9 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -233,6 +233,7 @@ static struct i2c_driver sec_pmic_i2c_driver = {
 };
 module_i2c_driver(sec_pmic_i2c_driver);
 
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("I2C driver for the Samsung S5M");
 MODULE_LICENSE("GPL");

-- 
2.49.0.472.ge94155a9ec-goog


