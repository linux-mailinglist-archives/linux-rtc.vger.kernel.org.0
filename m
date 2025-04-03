Return-Path: <linux-rtc+bounces-3746-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51557A79F3B
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 11:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECBEC1897019
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 09:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B63E244EA1;
	Thu,  3 Apr 2025 08:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="inbk4I+r"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8563F23F406
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670763; cv=none; b=Gmor7ex+eCI63GMNzOSRUshEO4IPC8N4wLT5p7Twd//i9bOxCpSFp0Lrk7R6hGjOs0y15HWoij1vEzbBWh52PxVxyv+2P33fyQgLDuHYsd4jM4+2Ax54vCoaKwVfoxeiJxlC+FxxZgnTifD4Xdlu5lw4HRCXBJ5Oevw3trpheq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670763; c=relaxed/simple;
	bh=3HQSCKKi1fwFRVm95IbU9t5Hr7ITyiskN+9xAwmrKhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGTjH97UJU757yPKsTVwMg0B5GBZorQnzUi3zxHE7E2UV+ye2L7LQyzzaYQvYBKEWVDx1F15c53G/zydHqdLVYHteqlOfFffYm5/PjYSSJNoqIj7q4E+mXFGrfK+9HoD/tOH3DDmGdeGwj5nBSBM/lMK2agypUphwX2GBnhSjLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=inbk4I+r; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so1099670a12.1
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670752; x=1744275552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c021jwV5dbsG8JoPrCRgjZmmvCnTfk3Xe/yBggRzooI=;
        b=inbk4I+r/k4ykJ/Nugo2yeQ4wXSJAhl8r0L/UHumax8beFQaeSG7wW4K6eYJdwPJwZ
         Op0as6SlDG2WVK8j7/uNNJJbIaJPNoo2yCKtf/Vfl9PbHDO2KR5MRn1lEqCbQciktX61
         VLwdEtLQjuWnmdTveoWv+1/5eY/w/E8A9MK8knRh7CK7gR7dTvRGlsifjdN1mhQ3Rc/v
         OL66GgE4HbECZJwJDdT48ZKXQcD0Mp21Mn0x+xsLlROFznQ1mT4WX82yuzac997GeFdV
         geLKIEl2t2qixDmGw3o4SSPEM4mZPXUfp24PUpgVGntda4dXhgJ/87dGlGS/vq/xYcFJ
         fc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670752; x=1744275552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c021jwV5dbsG8JoPrCRgjZmmvCnTfk3Xe/yBggRzooI=;
        b=CmNJJyUT5ryzdDXF0iVQUxNWsYSBI4yUhKMI6rkZVQb1WGpH9oVE7vwCi5W+yqwGTI
         49WMr3M9FScg1iEPz1IWXujBOPR7+/tBzxEAmZkQr2dTkGDTewjRNxX55G/GOf/e5sxR
         kgKrmpdrY3j+hIZboq3mt8D4AIDZvv7TXQV3ocwbWC7YeW4wQcfdFftLWIqqq20vX7ku
         MiO3aA/k3T418I+xIEZZ9Ie0yI4wSHf/Jzpi/+7j8YFzdHMfm8hy+tZ6RsRqNyhKb+FS
         0zsiUYhXpHABHnESZf+S1D/7EBD+AbTMgo+RWwkir9K6G4F0HQ/cARtx7Z1lUIh9T2gp
         ho3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXociw2jWtym7pLi0/fPOHyCJUNvi/I+5XLlZpNcGd0ZCqBbNYcdY6mvqcEXPJZFOUTULGhMwHDPcE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxgi1zKSSM45j6Ep06BStDOcmVcUC8l77WGT/tOL56JIFWiwp+
	OBkU9s1YGXnCJZq2wzzZ93/xeShJ3aH8gP2fCaH0z+dmp/xZbgIKQPujlJWTRPk=
X-Gm-Gg: ASbGncsL/3HZGcrANs+7yohbOoHBAVUU9iRRbpQXw4ni5x1YCaNRu24R0XY+NhEAMcV
	YwYYzGXYdFWexJuBBHB4URwxeN98xGIgogXN6tHKPetFML2XA45bCZVQZ/p3+IG5UTU3mi/DJlb
	pGpZcAlDyQfqU6ftK311n/+1cFSKgBfhO/nWr2qHjEECliejP1uRJx1FcaP1qzEtnrEs720Co3P
	gryxQdNkIikYFKcIk0L4lm8rPK4a5KyY2N/U0+z1/73kX1rLuwqeD7Y3soNlT3cy4/zu2489+kO
	4MLKiuHtdlbH3QrOb896pRA43mKFUpVCUcOhgcqTiqiXcyAqukhMPDFxm1h9Snfh3HWne3x8nMx
	8wmdfMp/uLDl878cyJ2HEjjTa1ErinIePvZd6WZM=
X-Google-Smtp-Source: AGHT+IHCv1y/iOD6tATf8l6JbAVP7nosxikaub6pMGAtowLVbGuj8LVxbHPFWCZvGPjo74E5dX1Kfg==
X-Received: by 2002:a05:6402:90e:b0:5e8:c0a7:4244 with SMTP id 4fb4d7f45d1cf-5f08716b5edmr1415400a12.9.1743670751910;
        Thu, 03 Apr 2025 01:59:11 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:11 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:11 +0100
Subject: [PATCH v3 19/32] mfd: sec: don't compare against NULL / 0 for
 errors, use !
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-19-b542b3505e68@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Follow general style and use if (!arg) instead of comparing against
NULL.

While at it, drop a useless init in sec-irq.c.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 drivers/mfd/sec-irq.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 4871492548f5efde4248b5b3db74045ec8c9d676..55edeb0f73ff4643f23b9759b115658d3bf03e9a 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -164,7 +164,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	int ret, num_sec_devs;
 
 	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
-	if (sec_pmic == NULL)
+	if (!sec_pmic)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, sec_pmic);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index c4db58813059f07372679223ec570ed07f52cd73..5cd9667a21e9e8b052b2ef0b5d2991369bffe8bb 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -448,8 +448,8 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
-	int ret = 0;
 	const struct regmap_irq_chip *sec_irq_chip;
+	int ret;
 
 	switch (sec_pmic->device_type) {
 	case S5M8767X:
@@ -496,7 +496,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0)
+	if (ret)
 		return dev_err_probe(sec_pmic->dev, ret,
 				     "Failed to add %s IRQ chip\n",
 				     sec_irq_chip->name);

-- 
2.49.0.472.ge94155a9ec-goog


