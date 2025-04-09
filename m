Return-Path: <linux-rtc+bounces-3875-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B7DA83241
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3D9C1B6304C
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C819021CC4D;
	Wed,  9 Apr 2025 20:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cj0oNcpr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAA2217F54
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231067; cv=none; b=WGMhgb+o6+3/Su5niUffRf9Gkkfx6+0zMwJqCr++yT0legmi/f6OZ75HJ0zl8FHJuhQJVU+zhngZKoc4/C2W+Sl+97o8MbNo5cWSgCddaUL2HovsPE46IsgI55DTGs4y8qiv9Lrav3+ajBiM1dlI/1XPR4QcQz5p940pKEKyq2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231067; c=relaxed/simple;
	bh=Hu3iyZXpRaCR0lrm+kXeKWpWaXUMVhvAHxoE8tYowXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WI7/i5Qrb50SHyuHFFAg9PuBEoppM9j+R/ZCFjYPQNj6C8S7ea55qeS/q2IijbwVjdg4zSe69YGXkeyos7Hi5ThcLUXag2q1XPyTJ9Ma6GeppPtlmkdpxyLjL1yvH2OJgo9JixBCzzLQM04tkKhs47Wfm9D/270azYFV85WFxjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cj0oNcpr; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac7bd86f637so230715366b.1
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231058; x=1744835858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0giWyFiG2ehvT3dYEU+l2gt5I3uIIss9ANYfzm9oJps=;
        b=cj0oNcpr49Su8yi3o6BTtMZYy4ddzNWv02bHDkK61fPRVWEi0hRprBrQfbcoe4FfMb
         51bnRElKmINuLAl1Ru166txXZop5WvTPpG/UVIBafaKLATKEJJOl6oxGiFh9qM6aQfMg
         4K8zeI5dcfwPjfLTX/krWZrjVOndVc2RYbCDgs5rG/9KyAzlsFq6RHAa/ExwC+wCvSPP
         zzRWtRNCpV+nZmboXU+Asi7rjBkYJCR2xFCKvSnwhDC+u+iyeSCfIrLMyWkxYzLjlzuA
         LL7VXs77FscS7bX0e3EyJXU+f0PmzHuyXit5ZHWLM5LSHjw7obmNGx0SVB2ZX4k/HI03
         SR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231058; x=1744835858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0giWyFiG2ehvT3dYEU+l2gt5I3uIIss9ANYfzm9oJps=;
        b=NFkK6NH/+4H4XM9Dt1TxRTgesAs9fW2r3a6gI6Z0zPPws1hYdUBLLh7Z2zIF+5vizK
         LpgQP5bbPqqCwj2g0ZQrnJYfngRxzibiaPOv800BkCvQB47EHX0YSCZP7oMwIkYq7Svl
         Ue0iVEeFhD66hcgc7cgaNUikx9/ZDxALiO3WAprxss+dKQxHx9DBAacm5enFY4nO12as
         NSVYBY9G3ZOfarrDwAxoKlUW1aLGFw4j+emmyYTyE92xJJF8ZAidPmcaZmXE/sAUNPHH
         1v1LbAbcK6mR7jmL1/na4aZRt/R6d2VnaNIJtfP5EeyCs92RpEfLZ4Ou6/ECmMXvikHD
         CNow==
X-Forwarded-Encrypted: i=1; AJvYcCVDi6qix/wwy87HqfNh2IfFWD4Oe0RRJTycYEmgbVRNgAlWv6BdfBQw//aaJ+39G6rcjlFTa32PdQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUs2HY8oHqjFdyxznU8ieeG7zAmU14l11DZn37dltDc4ee+BVs
	b/bBn9ZIE1vtxpaKvVMB0mSewKkNTwyw9AmHcVVRg7GwqQ1fPmNsZe2Vo1AkOmM=
X-Gm-Gg: ASbGncuWC1muaZ1qmbEJT9lFsTv9yrRbQaqtQCd3D3C7s8XM4Gboza3qn/pz9tW4nkK
	2MpXQhrk0s3hVwtaeRnGE4kadOFWQDG5umS03xvxsYlaMFk+vyUv9ZXxOtl1RVnvYUuVVAJ7LBb
	wjK5qXeYGg+oqEqppDNn8AArtfZlalaZjUcM85ikS9FlhurBX0ahxZPq9K7GjMP1X+0UqYYPMIJ
	pH/FZddfB8+r0SYsP5qsdioaSF2jW/+AXaqeu5t8kVVE0RJNAUpyb3KL5xcE7btxkf09X/eQqFw
	3vIRQzbOt619xEMsR5vZBhRLkBeBXmLMdNSMkq6gQG4VJOQgyWNi4Zdn4u10PNlY8WKpBQENDhr
	AwyatsT8NoSu+XoR8Ya2ZmzaS+MY=
X-Google-Smtp-Source: AGHT+IFs5jQKKi9PBtsfwcpWP0uR3pXLFKhxM09QGSN5rk/PWUonr2doF0wyNuXkGit6lSL1qy8RxA==
X-Received: by 2002:a17:907:1ca3:b0:ac6:d368:aa97 with SMTP id a640c23a62f3a-acabbee8c8emr16347466b.10.1744231057853;
        Wed, 09 Apr 2025 13:37:37 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:37 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:37 +0100
Subject: [PATCH v4 16/32] mfd: sec-common: Don't ignore errors from
 sec_irq_init()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-16-d66d5f39b6bf@linaro.org>
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
2.49.0.604.gff1f9ca942-goog


