Return-Path: <linux-rtc+bounces-3742-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A67A79F2F
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 11:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20CF8174FB9
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 09:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7708424C06E;
	Thu,  3 Apr 2025 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AjHHOqvH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224142459FC
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670758; cv=none; b=Om+kMpeAFfU1tfh048RUY9mSfWmvmeHDymtKoAMVobfbQQ4q4wo1LJ4G6zAJCqFrowvEhNomMBU833lUgW0UrEDC4N7maDvShpSm22x3ShYVuankI3P8FfSICvhlQTdtXZIOyQHInUWiguPlM+QTbChsEnzBCWRl4IXKGqN+ECQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670758; c=relaxed/simple;
	bh=cUTy7Xx1YiX1UnRa4JT4b9qKBeo7MuQLQSe/ooLtKqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OGh4h9mwNiBGlsYzT416o5IzAepf+BPVpzjP1c62zySYv26ZC+8bcM3Jy5Cny/iS5MoK4YXnd8EvrONlsNgtD/FbbPcfqw//gdzzzEcQe+DyW8N5eRqpEMK1xZGSTebhulrr4FdNXLpZR/qDcQvgWkRRlmBR7XwJ1W8nP03pjF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AjHHOqvH; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so1179704a12.2
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670750; x=1744275550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=AjHHOqvHENCRlXPk94D5ol/0f3FDlfN75O8DcrWoeUFpHApwRG1syizNhakbRO5fd9
         TDldk5wN9yEWwM91+A/7wrcsgtlYWH7NJclHDGw/YCmoqq34vnKJxKf+kf2XGsUvQ4U0
         xiZXtlcQoLA96MXAestzlj1qh/U/HKvumc3cqkvpe9bbs3UUNrR/qHXiqQKOpZjjtGhU
         tfiljiY5j7J4O5kzHSEbShO0vzTEAuvMqPYHpWM8baPIf/a3LCoYpZp9U/SJhxWlT9yH
         sJbeHa2m7EI+TWTyBHbqcp3TiIR+ZiHXMsrV4zLwEbJ3RMyOlU+POuNiyufq7N57pTrx
         Pz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670750; x=1744275550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=KJ7yMGU/y9qKuG2atZRcegcgsaQuJtwVQuMEfuYd9TKj6BY0f/rCQcNoBK3yezKiJt
         GRSThwYwjXTeQlOxTfdLUcxlDT6Hz2TaCNW7pzAE/b1sodmjcRQL0dAzwAffBPcIHCjn
         9ySyzbTuHRPpAKMMbfamv2mvO4UYF+4PnWgoE09O8IbTlRl2vRQC9Waxtukog2CDZixx
         jZgVTMAfOPgAMHQe5KnmBB/eqesqBPoTgmZnYPq6y2PRx5nGkcLdPZVDIRCUea99gRkh
         QpGT7Xfr4q1zeX/dpJollImPHHC81UArLA4qcjb+iHf1+gkTV/4X8YpjBHom23Y5nFX5
         lcsA==
X-Forwarded-Encrypted: i=1; AJvYcCWonJ8JNlD3z69E+RE4iPQZm4udf9cN89OxuW5OnZC4+qDQj4bQFWJZINfQIJ6BPq/d3hMtKexgPsY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/cW5hVkoK8fwuJy1giHcoBNuJ0FvZG+Upvs6VfpV26XYrkzRE
	B3PLCRVOptbeWlZpJIhARfTwS2dvsZDXshzyRoB07La+3p0xXRlb0FueN4uEZPg=
X-Gm-Gg: ASbGnct717M0Kda5y8uu7iiUyMPrGrR+ds+n9rw5ctfMmCTwFzulCf/CI+5Y7ELF9/k
	kKvhbGicfRSktvkS8lcRvyyHAAf0reG5vs4kVVS+ZbPYXM5wS1+dQACF7rzkpk0GStUjHOOWkn7
	GtZM1wL+1NqQAdeutPWnMJtQVnBxm+XbNGKHS0wtf0fMbmY3InIVv4orvuiddPFyKl67U0aIEn7
	Bm3DSB7bczrfVk0nhFuY8QuOxlpyqhwqpgnKlFP+i1PpZvJpFaycToeimCw+zxDAVv47GbO1h2i
	n0ZSF0ylOYxWIZOIsEENWCfV4AroOWzwvIjCOcxTo4bDkBeOh0eg4AlMX8o7Qtp6CaDUGYkRdFF
	wHWDyHQ1Mk4Ud3v1fJORQi8Ow6tDL
X-Google-Smtp-Source: AGHT+IF/mj/FrJ8Kxms7tCENqFVdFFdcidKVA2nEXR0Y75YsHneWseB8Fi5sl71j96aNLNBmEO4yJQ==
X-Received: by 2002:a05:6402:2682:b0:5e7:7262:2b75 with SMTP id 4fb4d7f45d1cf-5f087184cddmr1440611a12.11.1743670750284;
        Thu, 03 Apr 2025 01:59:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:08 +0100
Subject: [PATCH v3 16/32] mfd: sec: don't ignore errors from sec_irq_init()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-16-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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

sec_irq_init() can fail, we shouldn't continue and ignore the error in
that case, but actually error out.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index f4c606c5ee5a809a106b13e947464f35a926b199..bb0eb3c2d9a260ddf2fb110cc255f08a0d25230d 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -183,7 +183,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 
 	sec_pmic->pdata = pdata;
 
-	sec_irq_init(sec_pmic);
+	ret = sec_irq_init(sec_pmic);
+	if (ret)
+		return ret;
 
 	pm_runtime_set_active(sec_pmic->dev);
 

-- 
2.49.0.472.ge94155a9ec-goog


