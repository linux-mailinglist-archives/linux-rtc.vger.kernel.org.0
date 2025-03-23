Return-Path: <linux-rtc+bounces-3572-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A41A8A6D19C
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B6723AA442
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8CB1DDA0C;
	Sun, 23 Mar 2025 22:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ljwy1hg0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1B81C860E
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769571; cv=none; b=JJ8VVlHCfqRDdAuYj+bjC9jraaK/U/ah7XGpYRrZaLPm851rwh1Y0vKby7DZwcNf4jwM0cdt/86fUncUnrVsTuddL0MnmXKf07SQGMulSoYuYN4YMS65MZYHYgx5G6oIGlSvsflFmBu/mTMMQ/hWtItXbAQxSvQvNw3QZCMImoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769571; c=relaxed/simple;
	bh=UZVJoMISWFvF9aHFwyrjWSN+7tVwoe3JXUCgzfVpa24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nF+HKVjY0ApLfh4VbQM/JD2gtGa+ukVFteIcW5uXMSL9qU5eVBrb8cG7U4DEmDDjl144F3j3hZlZH+n4tU41WHcju8o30dXj2TOrO4taqDZMdb4YvQoaofpHrU5ngSzMj8UY/mHc4gxxy1HtxWgsxQ0CkvzoyTCwz2of+DMfq0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ljwy1hg0; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab7430e27b2so806321466b.3
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769566; x=1743374366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vE10aUiMRjd8RDkwLK4ZfbXWjVS481xd07k1tbR4ePA=;
        b=ljwy1hg0w7d08uwjQpIVjewXX//G/+dGER5okwBKZPEiZNQ6YK2oBUxFG3GXFLe29P
         OCvtpzvntIqjjr8U0w09CAFbhy2Ky7AvBjD5Kdvi+aTV4sN0KpidNYNx4nJig1k4I+oi
         9S+ucAq5kUlkX2JN1J+hGhC6zSta+NuKWQugSMNj+Q4cpVztQ8RD4okNJq1qRz1a7wXa
         /72AML98KCLC8/+/+qqDE3OtktZiNIgZcKCUrF4cnyLkuszV0LPBvCDP2hfZxholBsRd
         HWDaloMWO1W217gfhKlAozTvBtCPG7zvFoAGID3n5sqKgByC1zG7iIKzToYofx5b+udG
         GlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769566; x=1743374366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vE10aUiMRjd8RDkwLK4ZfbXWjVS481xd07k1tbR4ePA=;
        b=XsTN3eDdA+9kiZpiEAakBmaVUZOP1fU+vGkC8HqZMlBzTlo6qGhwUjt/0BV85RySMk
         G9IfsbMpY8OQdcdApTgKDWHW+et0qcpJUh77a9u1k9uEKS7cmx6KCTs5HPTPjdkxNGbT
         1Qg119YTfUtOVQG8nBHAzfIsD7qzFX58Go9LlktT5AS4Y46j8t8ugY28RdcEyYJ1YZL5
         uZc9f98bl0wLaolR5FnL4v6cdhZRDCOdtqQByv1E65yjSJke1MplTwL5WghM1pMZKxL9
         RS9JW6gq4Ad1BN5YdZkYYRoWx8HdymohlhKHqvgNXu5jgCdRkFgzmk/5in7ybciVREy8
         XCww==
X-Forwarded-Encrypted: i=1; AJvYcCV9r1mGsw93ViDcn29bxpJpu1/m/Ycp4sSwa0+He35vHUD3AupZikW9JIM//73PewJH5qkIPCZvsig=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYNm5coiNubQfycV63pS+aRI7NFeUrkyiRE905pHGx+BEH+N4p
	adnhoRfTESHBZonjhWW565e+pQ0WJovzoJlwhOWd9A31+n2x8RLzLW4GRbKqJ/Y=
X-Gm-Gg: ASbGncuBd2IqyKHBVIxHy9YOAh1xhjkOx6Ibcb5pO/z7z2F9tH+bqs07S0jGPNKUCQr
	GMF4qGekl/qCWTkXtzP3WGjgScHb/q3dFDxPSg6YbyaHDd0WjGpvVHrfZsToe1ZmxQyBfOEqsAe
	MkqhBOUeOCa1dRAyx/rgrYwC3thOiUGEq3VT2UsuWUv5IFMLA+7M4x2NRnmVfFVuM+V8BnjT37Y
	5SQrbjBdbXdMi4VcSPlbdQoSySatXzxJZSM2kuYh26isdLkGy1YmlngB7PYXswpYsc0SKNhDMXk
	Sqt3syBtUABoVEDb642ccm3FD0xz0VQlzpQWyi5diyIlNdZ+2kEzjr2jpTdFmOOrwU/BC8UhxqW
	Pncxa+yIyJoUqJoYX6OCnSrq3csin
X-Google-Smtp-Source: AGHT+IGpWEO6t55UagtbffDf7jAwBntYjANUq6862eIF7eGvrz/eDXOggCL/0jo6AVynnVDx8dSnbA==
X-Received: by 2002:a17:907:97cd:b0:ac3:8988:deda with SMTP id a640c23a62f3a-ac3f24d7916mr1017581866b.40.1742769565973;
        Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:20 +0000
Subject: [PATCH 04/34] mfd: sec: drop non-existing forward declarations
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-4-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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

sec_irq_resume() was removed in commit 6445b84abf91 ("mfd: Add s2mps11
irq driver") and sec_irq_exit() in commit 3dc6f4aaafbe ("mfd: sec: Use
devm_mfd_add_devices and devm_regmap_add_irq_chip") while the
prototypes were left. They should be removed.

Do so.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index f35314458fd22e43fa13034439406bea17a155c9..b7008b50392ab857751b89e0a05d2c27f6306906 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -72,8 +72,6 @@ struct sec_pmic_dev {
 };
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-void sec_irq_exit(struct sec_pmic_dev *sec_pmic);
-int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;

-- 
2.49.0.395.g12beb8f557-goog


