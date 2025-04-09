Return-Path: <linux-rtc+bounces-3867-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD838A8323B
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7FF27AA1A5
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE469219A67;
	Wed,  9 Apr 2025 20:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BSNlTUvY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54731214A73
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231062; cv=none; b=QR2bEoqvzpxmNxf6SwfeVRKz82/JalZn6l9Rfz30rEJW04/X8sEbosfsTRaZs+6iDvOTyt7o0KJ20NtRXMEfQ62d6sR2t09ETHmTulqshB5y+Mvtn+uM8xgcXloDTA1onGFXMkmaTc1jpjeqPafv54ItmVUx9EC7tUKTHk/YRgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231062; c=relaxed/simple;
	bh=3/O/TK1IMe7G5gDwhngAG9ZtBL5ca9AkzEwNVYZdbDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f55DWo+YKbJWVdHEB8pZbdTvyILI6kIxLCmFOzH5mY6VJMMHyL1gFvqOnj/YJ4En9HEKS9IHeisLZeaEBKI9Gm0oN97ycMUO09wm7l9yzxefty+vJybdR7sIl9EvnpU6LHJHTxFypC3hG4u983xys+cpEu4bWaK2Fi1FwWLJBkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BSNlTUvY; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2aeada833so29821566b.0
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231056; x=1744835856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pyl0f2+uV4prp2eIcLZG8qEi7jejYsdgoESG840i2SE=;
        b=BSNlTUvYXaUe4q29vDF4Qd0kubtEVQoaoAwcPF15qR/9YcRTFRdj6bOOadejNsrnl1
         IyyGK/jL5M29D6I3aG8s+g+cdPHqTuNAjUxWi2mt1pj6ndXoq8dPt1Z5UM3X38y/Form
         I0V/ZhyLGB9MKIpMpjw1DZ3VLIsnINjnqV9u9VS1t0NIMWIJRi24KktgPeAkUqQHGvrK
         rz7MoCydQQfQ51pkB7WLOAtCHpkU8MuTW2OXSlE7rFz6NTU8bzy7l+cLQ1KkhfXQhKNg
         iIvyA/20wkD3OiGFV3O/cRb8H/3YtkKxYdwGwDF7Rjty1ALAk4e9rrCmah9VK/fDSUDO
         Ujag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231056; x=1744835856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pyl0f2+uV4prp2eIcLZG8qEi7jejYsdgoESG840i2SE=;
        b=cu7UlO2AzFcwwkiIhgF/c3qL+v7+IXXmAYcjvMQbHQak5TT5x0c4SR3xk0C97jtfI0
         tv3M+7V8NJQMPmBlWUpd5J+OhmBYdd5I4dBDBNnCeckIIVt6glH7Zibk8Nh9Dcn70BL4
         kMZlVczzYOXuBU5ReLof+yrSCxAHa/P+GJm6VZlPrZxTI/42XlUoBbnXSY2a0PkMY0Ci
         WO/VxF0NsrFrR7WJbM5bP3+EDRmSej/yy4NyL2OH1vJEJSgCqMC3WT1hA+GjemUQhB+l
         AK8ON9TpNVJZgK21jXk2LHNRsLrzwu69GBxTFvDjvKHYcJi7YUXTiXJPkqqoLAKxhA8y
         cPWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPL4AkiASvOTtsKvIF+mUxiauRrFt5cYd/vQPh6ymiAEwJ9pQvRloaXYqA//FzvaFYCwTavIahObY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzewPmfgzRxs9LUG/4DK45f+GZR1ImlDXIo2FBZGX9wU1AKutc2
	obuhvo4fgSltLXlaedgZHwrAvENeQ8RF5SWV3QBCoZwPQkUjZ1DfACrAaVPzsKI=
X-Gm-Gg: ASbGnctV7XhdrPkEzvf6xDEQTjrleZDB6s7Mmx5qaA3ZMb8FNthJF5/HWLRVs632eLx
	tDYDU5Ifo+946Ulk3cN/0CzoC+szf+a0vza4HXmSp6QToZPtm15txpUSLUuzSa9RiHSDN4P1exk
	o7PmhEd2SgsHeP6LJfsNzA5iJLURDQJbXILvmN9aLkl/DiKVMa3nBLF2wjINlboteuZpuiV5GVK
	yrCVfk9pB/aoq9esJ5RCl4w39o9ZRbUqvi1DmH56JCTnHAkz+NRF80XfG5nKeewEarcC+GAVCuM
	9odNwKCtVnmCgVovzqiFuto8WUfleNhAQDEwKVX+T2n/3N1Daz8TS8xxsaKCppyyMsrt5HynO3D
	rLlFmptY6IsCBHv1+JmVk49RwZIFqPRkWjTPEGA==
X-Google-Smtp-Source: AGHT+IH59O+fzF/X8FnUuo3I290X8VkEPvKxapspcX/vEqYKSvjWcafmZVH9OY5PbPtNmVJlOQOSrw==
X-Received: by 2002:a17:906:4fcd:b0:abf:48df:bf07 with SMTP id a640c23a62f3a-acabc24ab2bmr15279266b.15.1744231055680;
        Wed, 09 Apr 2025 13:37:35 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:35 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:33 +0100
Subject: [PATCH v4 12/32] mfd: sec-i2c: Sort struct of_device_id entries
 and the device type switch
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-12-d66d5f39b6bf@linaro.org>
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
2.49.0.604.gff1f9ca942-goog


