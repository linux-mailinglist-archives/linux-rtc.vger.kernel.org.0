Return-Path: <linux-rtc+bounces-3741-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3453A79F19
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 11:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 688143B5F4A
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 09:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C332459FA;
	Thu,  3 Apr 2025 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kLk3EfJW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA160248875
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670756; cv=none; b=F82VpgcZBkiIWbIpug23IBHLRfSEVaHVVIYfpQbnzn6ZlDr0BxwXzWlxdvYadICHiYX9xq+Jcs5HU5v1RNDmbakyFBbZojBckQdAP9Fqr5z2igLNfoeZI4eMvdGNEbGgRfUcAYnROanC/q1sbQNsF2bfYcPIOenyFcVygDAFEpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670756; c=relaxed/simple;
	bh=G2VDOjAPimv/kPRtxt/LX8SDH6NDkA0IsfX7EDPKEaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oqwoop5xRvYRQlkXnLanRT0NwlKetcoVo4NuHpBeceV1obupRVk3SFK3uIxr0qj/PlwP2x6nnI15J+vGSb7tioSm/SnmwR8VuP/syiaYKhpFSmZjuY0zPjehdT3uzYPdwIRVPR4ELBmP1t47ZPdImU+kn9PsFz6ILLm9ye6VYwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kLk3EfJW; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so1027253a12.3
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670750; x=1744275550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqGhx5PJ7AN26XxBcQwRDT/hvBtSHvxnm6hLozkr74A=;
        b=kLk3EfJWTjU2iYikUQe+drlwEuNkbxBQ97uf6xS+cs5zxyJJCuNPPxKtI6KgboUVRB
         hUx/NaLTndbrIG7BXMT5d+8FLxjSDuBFGqP0ElQ4ENIBHfpKL01ZyzUfH0dxgsYQAazv
         Mftq+n10tP0TxIubR7wRbi7BzHIq+v/FimHjsSb7b5Ip3A4poiQcB7FO9P7DqOTTDN9n
         g4GP0pIIXrSekkrHAvpWMQ868+Frmwxfp/Ycmy/cMsNhUbk7acgZ/YNXYVQ2P+tFxNPO
         IWGT/9VYZLNh4nngk/j3Ir58K82dR+zIVYzGL9H3KgcI8ZtdHuxlEw3kxZhxWt4FXGja
         d+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670750; x=1744275550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqGhx5PJ7AN26XxBcQwRDT/hvBtSHvxnm6hLozkr74A=;
        b=XnAKLccZ53Z0I5bm0ocIa8GDBcNtut0TF691ubMZ/ydnPwFYqzgRK+4BkaoecrjSab
         d6ShBKGpOlAxNp+0/BFJfUw9qUaZDgb7TJ8+d/O6LmRQ5YfqEwHpmOXk068kOta3l8ve
         z7qr3ZvvrNaH0IHv/eC5SKJ+I+zvsPX2/CyKJGpY6D730mXPJQ8kx71RDjBP8SlTIuyy
         RVx6CLLSslgXwrxJIAxF4lSZQov/OmjYuo02r1X2c6A+DvJ/44+3GnhDP03XbSsp+jUb
         7xYUiEp9E7q+3SSjZgcof3HxLsEEshh/hRolUiQLX5WIqQajAXKtAfJVrBNUVG56FhNe
         7Trg==
X-Forwarded-Encrypted: i=1; AJvYcCVb+ggPDDT2WHVNJ7dsU4VGQSl2/1n+9G2SuAbu4VjjXqz++f28MI9LobYcVgu0JXorXToK6rtiIRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIwii6Rcf2ClF4Ku6nUZZTtYH8smmtTbs/iO7ytvFYYJRWws9Q
	fVgyyLvX3/4VUcnM3AZcl67cDc8u/UtHLZykDO7g9CsYn4Kb61Cb5exCGBuCzzI=
X-Gm-Gg: ASbGncsqE06IDGqwbg0p8rw2VfLU1+JPv/MDAhYyTbevGxYQ7GO7LbN0IoiwbnXdju/
	70rqv5JR6IjjRaNKe3bmQNhRRknh+w+AgeaTMG4dUDtpGp3QG+U9VymVbtU+bq6Kot2SvP8mHHs
	aSjIYi69wT9udHYDNdNEwQntZSEis9HHEZNYBqPshO3go6BDX8UfVztidyjmuVCvCyallLG8WUT
	xsz7J7DcnmT6jCDtk9QNsmCGJfG4RKD+Xarp1WTxRr1B/k+AJy9yVcImFoArCIvu97xzlPjcc9l
	22fYuPfOLfjRZtWPRKZepwJBHRw+4BC7kJBf29PN55SRSXTvdppviFSbtWivc6jbrXFCQjvWcyq
	O2ZeA2fTTkNBsIt+2Uct3+qDasyd+
X-Google-Smtp-Source: AGHT+IHqq5xE17qMmS1fs14R51Ih6MAYPGlP5NH+CbKlyAqH2jZK+FRszx7kpSpBogd0Ourruy0TcQ==
X-Received: by 2002:a05:6402:40cc:b0:5ed:1444:7914 with SMTP id 4fb4d7f45d1cf-5edfdd23b76mr19122813a12.28.1743670749730;
        Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:07 +0100
Subject: [PATCH v3 15/32] mfd: sec: s2dos05: doesn't support interrupts (it
 seems)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-15-b542b3505e68@linaro.org>
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


