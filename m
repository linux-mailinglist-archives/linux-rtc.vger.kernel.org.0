Return-Path: <linux-rtc+bounces-4606-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D08B15BAA
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Jul 2025 11:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C913354862C
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Jul 2025 09:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FA42874E9;
	Wed, 30 Jul 2025 09:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LMIxw3zg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69287275861
	for <linux-rtc@vger.kernel.org>; Wed, 30 Jul 2025 09:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753867916; cv=none; b=Te4KYMEAchj26kmy5yqy4RzcyloMbJMkoRucTHzjMrV6K1NoG8diQuEqWxQ1Z+7yKU1vzmiTm7Oo9+Pb3V5oVv+MSkSYPJQYsRjiDpXR8nxywNbs1FGeuf+4X8hLl5AzZNkdTJMgYDxush9caVCUi2JaeDQInHojRLLv7W3I6Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753867916; c=relaxed/simple;
	bh=UrLx/HnIyYtmVFp3GLCZaWBR+1sYwrgF6xX3qNmU/Ps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cPPZog6EatMqfGYPfjSggnokHmk8R6rEaGqk7DICd5EUJaqbfzXSy3Jpa1l9F1qqjfWfWf7w4M+rVmAINyWJveugueVOfu/yT8YPCocqQtErAYQqsiHajcME5RqJCOKxkiiFZD1BdRjd8JjW3SeEhwghwrg40LZFtiMfxaKQRdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LMIxw3zg; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6154d14d6b7so3233053a12.2
        for <linux-rtc@vger.kernel.org>; Wed, 30 Jul 2025 02:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753867911; x=1754472711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pReZwdLuvK2x7nnnNc/6AC+XTJeKDHlZAHO11VcmSA=;
        b=LMIxw3zgAucoiBnzSWYiPMEhuVXGOybEo3Xen78Roq/LyDUVvfgxD2Fb3ojWszx7Lz
         lH+kVpvRs9IuduVOf83ADOGBOTS6PQcTbCLcUWQQoc5J8H7pfc7ODh/GSSgJErpUrHBV
         +wRXClYmS4HNmW57l1/t0ZtN2XCvQn2kYgNaFwY4ZcTGSZESxnYHntev8jHrEa60+EZH
         2kIO1WNFjM3qzP7lEg3uBBkskMxJ4hbmHzdp3G3iy6iTYrXSYYKUkB1phuO2foUIA4IO
         0W0xd/FrcMHi9c5yLKKCTnHWJN9PeZeq2XpyhNjU+gkgJaqpKF8YtGFvHlHfDSnDu8ey
         QjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753867911; x=1754472711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pReZwdLuvK2x7nnnNc/6AC+XTJeKDHlZAHO11VcmSA=;
        b=lkkNS/2IARuDQEmkm4Q21cJTrCq/GhtlqRwmTqQnG7dmO3OyO6nv4u5fMIqR3DnNRi
         BhawvdYbh0d9mQDk+TikKmkdrbYsFRry64yndSjKKzVqNCr5AWz79Qz5DtoyhR1q6eKZ
         3NNVKWTV6ix+muDrwloSVvvtPEdHEBsTbrbkE1By7rzbZeQuZTWuOQB5+CbjVJISREdJ
         5S5W0iXwrZw2tbNc3cMFgGo5f2xgQYfkuHD5H6YQchxxjgqmhLkHvAvcbII8SLYfN1Ec
         B/UEqDOQSfKL+0pgqVuHp5BNaL8hkJNo2YWfq+v5fh69sUTxvINrpIk2mTgSRGgA07Qh
         bDMg==
X-Forwarded-Encrypted: i=1; AJvYcCVNJlZbbgB6jTfC3OhOkhdO45niHef1P2u+HTCgMv+oxW1+1kjgdzHecaSWyu/xRY8Q8adGDXySyj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzESKTvrXkoKvhxuoj2SCOHbInyYGR8qVvzRBXqktDC/cGBwcQw
	pV5rFapS/+IG98L/UR3sOBc8wBVdH0uQocTA7gAXl0/M5jj0QJZWsYQe9BW5JbGKRTg=
X-Gm-Gg: ASbGncvG6mOSNA91P8SEWgXYpobfj0s8bAG/OND9JlUNo3itRq4Pt/RRYJnUBZL7B59
	fiN6ZdX9RAdT1vd2fduj0W+brCUmi45qjzHdxDAqKbmZAD2jEyfHoiNuJECuIbei/Lkam+gT1kB
	Cb7ciQIwGml5yfaLpK6eH660r7EUol8aX0cZ16DuPOh2+qk/uTt3fkIGvUyFOmFAlbc9nNv66bU
	F8+a5NaAy7dPNvKUV2LEfjqijl9O9NI+Boh60OXtbOE9X12Mlnse5RmA0Wd1GCK1Er5dhyhgc49
	pfrwQJ79lLsuplsvlTsZ391lm9dcZRmSJFnDuaGQWWKrQGCRI+gyk7Ht/TCGVCD39aTfSmgdxgJ
	es68QDrzk2XmlOw8K9ct+hyG0bm+LJF0/T0MjluHaRc/pKieLMniJWA3vCSYNarIPLqz4/a48+j
	3zBZEvEA==
X-Google-Smtp-Source: AGHT+IFAIKlwhaRCqnP2buBcT0RopLWu8QC5KSLz/f0m4GU4n7vGaomxMURhZGUWklTnaKUlIOKM1w==
X-Received: by 2002:a17:907:3f16:b0:ada:4b3c:ea81 with SMTP id a640c23a62f3a-af8fd957532mr287123966b.39.1753867911166;
        Wed, 30 Jul 2025 02:31:51 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61536916dbasm4090424a12.43.2025.07.30.02.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 02:31:50 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 30 Jul 2025 10:31:35 +0100
Subject: [PATCH v5 2/2] clk: s2mps11: add support for S2MPG10 PMIC clock
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250730-s2mpg10-v5-2-cd133963626c@linaro.org>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
In-Reply-To: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
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
index d4e9c3577b35dec8d9ec67c489b7b5ae27211f55..ff7ce12a5da6b437b5c92b9a32dcaf9423647cde 100644
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
2.50.1.552.g942d659e1b-goog


