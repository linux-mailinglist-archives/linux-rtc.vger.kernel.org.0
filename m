Return-Path: <linux-rtc+bounces-3682-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AEEA74B16
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 14:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1232317AF23
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 13:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33FC236433;
	Fri, 28 Mar 2025 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bNTT9IK3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C8421C170
	for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168672; cv=none; b=C2t9ymb5HLcWTe/FKOi8NZXUO7LuGPPuy7zF4vneNGMjbRYefXB4pYpzlL5MmLaa8GkV8mytLr3MIN90GQUu3e5D5Vn8pyO3MDw9nNxdVNu6yRmNaxT7rSsYchtZagUFYy01iMfrhLXsi/PYVhCG4M9d96S23Cy1Zaseu0nnVP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168672; c=relaxed/simple;
	bh=G2VDOjAPimv/kPRtxt/LX8SDH6NDkA0IsfX7EDPKEaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LRUTeHJrZd0SCIfka4lSD5+qe2QHl/1zM/W+wxO1O1vAqGzn0x6x9YbXvsqEHX9OADoNtxtRnAhWbCcThjX8GNjbeaLp6AdFrKT/JvykUJkQmesFLJPXUReaQM7/rgdwuKN5Iin+/x4VNtQzIRC67fDEDtxE/K5VjOf4ic8/QYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bNTT9IK3; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so4029061a12.1
        for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168662; x=1743773462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqGhx5PJ7AN26XxBcQwRDT/hvBtSHvxnm6hLozkr74A=;
        b=bNTT9IK3d5KvOh4LkL5bwbUA0xwVp6rc8YlTIemkkKqSI3HneRgnFc50spAhVeq+y7
         atLwhSkREpPPIPxNQnT2FWbAe5nWC5yz9zjHEV9gb9qhZiPVq6v+uvDYQWvptBoova5/
         X5LMl3RwbGPnWMyyLO1xxgP0aLr3komhMLoAtoLwA6iRVg3y+sf16azZ/Y7xbwt/Xh6X
         QkXWfJ8qWjEXghiZPLWr1H/jxOZPCV7njBpVMsjO58LZ+7+JXpXQEYI6FksUx8Ptjvne
         2RYSiXjR5qumJZSDyfUeWD4PLeLfyl89w/FgwcL86R0J7D/VE7bEPx5Xf+0EmXBBONve
         pMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168662; x=1743773462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqGhx5PJ7AN26XxBcQwRDT/hvBtSHvxnm6hLozkr74A=;
        b=KtpqnGhecMVO7/bR3zNAo6B+Lmdx8cPaDiue097gSgoMHcxjdM2rAYUzS/f18Qd44S
         9BeiPgOX9vHU2HqGgyAvJpD6YWiuHpI8xPN8Gq05JrYiiaVIIVNnXQXOhUN+FziIyihc
         x+20gB0CWUfhVLPdZdi7Wo7WbcWdky+hN5e2Sm9ttrj1iixa7mh59H4SgpuCL2IV1EJ0
         FXLIvhw+0BNKvmYAKFpJINpVuBUTqk3ir4amwbRjwc7Xl3um1oE7q5Ez4Tl3GYJIX9GD
         ZDAM6yCr9PA3L8jNs4+W3y7Gs2MbaJsWJfUE6L0xJjcSnOfvWmFLIjfCaRsKSFMGMtu0
         aesg==
X-Forwarded-Encrypted: i=1; AJvYcCVqxOtlEGIbOXOm+IZJKQRmoRnynsZ261UjPi9F95DTXO9zewv4IUvCwMMua+vOAtSQZcLuk+VG8+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOAxz+swiXJstKKTSoGpaZMzBGiS7ObAdis17R+hJ9g4XFJJ68
	W9cyEk9KaEEu6embulrFNdj3ntTmWSd7K/hsLWDXsNkmttFSeORppCSNjwmw7As=
X-Gm-Gg: ASbGncsFzg8wWNoC1DUaN1+FHEriTKO2mZCeWOFIA7mGZqRxkJmBLOEQj1NCJeh6dv2
	XE3allEMkbha0s9r+ihPGewl9Uab3ANXB95HscS3UO4+dySBPRwoR3DZ1ux+4cqR52xVDc4fhp6
	tNQw1sGSqw48oIRawryvUSM6Lr+m8lnBvjW+LzOi0vhTUAmL9C1sDu6OrVkWpryqvIWmOpgkTB7
	9P84lawvSVYLSJYlrPsgtY3Z/YS6yLMFRWXMiLoBX7Iv7SnllQf+a+KlFmipTtmvPy2Yal/T+5D
	NtYBzWTDQbQGb4xjPGcfEXejIBFq9rs7yieXm4wWOKE0vlr6XoxZMXfJgALhV908mGIzVXY3nUJ
	wC0739v5jzLNr9mDLc52B7cBxyVZx
X-Google-Smtp-Source: AGHT+IFFA9eoxZ8yzHOxTpOhNTpQABoRUZClQa2WX7rYpC3RMUD7CguVMWSVn/HPqyoqjb3+u3RckA==
X-Received: by 2002:a05:6402:5187:b0:5ec:922f:7a02 with SMTP id 4fb4d7f45d1cf-5ed8e496a71mr7840054a12.10.1743168661407;
        Fri, 28 Mar 2025 06:31:01 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:01 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:01 +0000
Subject: [PATCH v2 15/32] mfd: sec: s2dos05: doesn't support interrupts (it
 seems)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-15-b54dee33fb6b@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

The commit bf231e5febcf ("mfd: sec-core: Add support for the Samsung
s2dos05") adding s2dos05 support didn't add anything related to IRQ
support, so I assume this works without IRQs.

Rather than printing a warning message in sec_irq_init() due to the
missing IRQ number, or returning an error due to a missing irq chip
regmap, just return early explicitly.

This will become particularly important once errors from sec_irq_init()
aren't ignored anymore in an upcoming patch and helps the reader of
this code while reasoning about what the intention might be here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-irq.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 9f0173c48b0c8186a2cdc1d2179db081ef2e09c4..79a3b33441fa5ab48b4b233eb8d89b4c20c142ed 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -452,16 +452,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	int type = sec_pmic->device_type;
 	const struct regmap_irq_chip *sec_irq_chip;
 
-	if (!sec_pmic->irq) {
-		dev_warn(sec_pmic->dev,
-			 "No interrupt specified, no interrupts\n");
-		return 0;
-	}
-
 	switch (type) {
 	case S5M8767X:
 		sec_irq_chip = &s5m8767_irq_chip;
 		break;
+	case S2DOS05:
+		return 0;
 	case S2MPA01:
 		sec_irq_chip = &s2mps14_irq_chip;
 		break;
@@ -492,6 +488,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 				     sec_pmic->device_type);
 	}
 
+	if (!sec_pmic->irq) {
+		dev_warn(sec_pmic->dev,
+			 "No interrupt specified, no interrupts\n");
+		return 0;
+	}
+
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);

-- 
2.49.0.472.ge94155a9ec-goog


