Return-Path: <linux-rtc+bounces-3583-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1AFA6D1C5
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A00613AA5E6
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E491EE7B3;
	Sun, 23 Mar 2025 22:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wgmFqBRf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600C31E5213
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769581; cv=none; b=glj5CI1ORe9z3samvH6b/0eFX/RbUziCwibmOVLaVQuX3EbaYlLynGr0smFtUg5euvwsGghxl0Dw33A44021tNzqTAcqQ9B0b/MT0x6dWXNRIY4AVGe5Uyc3yGvVPntTHUfJio1O9y2rkRlwgXs+eN5oMv+Lz5T1FiH3PSwS/yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769581; c=relaxed/simple;
	bh=rN1LIX+ASOSby+v7Y66ac8wfq2CyeekWp2iiMY3xYgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FK+qN2/oNguQQ1kNtGStk+qBOjAqzlWXzWxHzl/5ejx8mcfjqtjSOYZU258P0TyYpCNX2OG4voxACfKWl+8SB4HpKyWSQ3jCRbPdX+xEuSW+RenPklJnkikQinodUscUAy6m2nPpdoWIdWFc0EypSo+e+6BkSui1uLE4BiU2PBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wgmFqBRf; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaecf50578eso713676266b.2
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769574; x=1743374374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OvVG+h6exYVME9DrCs1LDYgxvlNyKrO2ZRoKATXeWAM=;
        b=wgmFqBRfZvGB3Wv2rdRMjAEYNdQIlob4VQBDT7YTLkRCOvKLvGlCZhggNK6fEXiXQy
         oOwf9mrRljMud8DglpoJOI+TCbW3SJ33FiwKrcoR1oIUNAgmSLaiV6bJbtQTZBnJahMB
         n893wqqDkBtBBlOJf6QB40NSrtVjjB614QhL0JUE9hlgmEXZYkJjt6mLtAQ2raSLF/N7
         u9ZcAE/V83DG4G3RGUCJ7Jc7P+LbxdmiTtMDukadyzBX+V6o/SJ4oHwiyXmPukuHvPWW
         ls35cq63wRxNS+6hbTZ+CJgsz9nISF5+VbaH1LDdCDbBWD/A8FQlVUcxnJc8BWCqRxI9
         euKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769574; x=1743374374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvVG+h6exYVME9DrCs1LDYgxvlNyKrO2ZRoKATXeWAM=;
        b=JtmC36NIzujytrZJzz+P/LGavXWVpaMLdiQ7s62Wt8fDA+HVC7PvaK/nsZsRjFL7tD
         HcFBDPu1tbtejNpKD4VaKb5VBg+PlN0lBp7FqGH8/bquRjOlWEU84jRnQAw/1OtF5iUf
         ElO7JCHxwiNVkMtNJXlrKoOexiOA2TOZLewklCQOU6qw2MCI2LO+FsVP2SivccTlguxR
         Yc8rCxTDCFGp3X7QlRQyJ1bhbGgNY8J4pRinh7yfWHcaFaos0f7gFghSZ2tjDfJBaF8J
         jmLWNjI8cbYfUIKNw7A2NQIDN5bhZegDPBU8AIDA7emrmT2djj9g6Bk5xprJErTF2fn/
         wlzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfQ8lN2hau1i1Zwqg1auec4ElqAQk4qwcbMnxmdemOq814fAUQt3GWZ5hzP6SpJfX8UXy47KYbEsM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9OBS0c4dyjHeCdsKS51UbugCEePUba6W8JqBCCgRqx5fB3fO7
	pXk57diDOefz+3GyBb4pUr8IrCcgbi8y6zzsj4lymq5LaIJJcUPkgfLJqC8M/aY=
X-Gm-Gg: ASbGnctqIusZyzUs0Uii0uC+wGnAp6dPJ57b32HypqnigN4v8Um9dWPrtuTuhGmdSh7
	9TQtnJiLpoydiLpQn8NXCwTVsoNI1ywTSVn72aoY/fsBhzZ0nmXdagjGv3xV7KNhIBNVLs9OxAN
	VCyJ+qunqbngR6N3Z0MQynxebnHytHlnFu59ACRuPyaohp+XKTDaUac5P3cplh1/Wf4dJhaj3kA
	fVl2EIhqrrnLdGYHVyI9BVCVl5G06Gqj04BJ7Cnia80P712+YQBn6NHrFrofsFTbXjxK6TVSJ4M
	8GQZemTKdqt7tkhE/vPnq7lkl3WCfcK6kZkFOkkxhzIVfUNMVYcks+jCpi+BBb9cIi6Lr3XJTfD
	4RW7l+Q/qBfMSsL7HlExFgjjtU7Ja
X-Google-Smtp-Source: AGHT+IGbu/jFjtqa9LSXFqPCJsAn/xbvTSf/7H1OcPEes32L8sKOj1rM+QLBV82JKfVyHX96sb/teQ==
X-Received: by 2002:a17:907:1b0d:b0:ac2:7a97:87fb with SMTP id a640c23a62f3a-ac3f229dcb7mr1140111466b.33.1742769574302;
        Sun, 23 Mar 2025 15:39:34 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:33 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:34 +0000
Subject: [PATCH 18/34] mfd: sec: s2dos05: doesn't support interrupts (it
 seems)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-18-d08943702707@linaro.org>
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

The commit bf231e5febcf ("mfd: sec-core: Add support for the Samsung
s2dos05") adding s2dos05 support didn't add anything related to IRQ
support, so I assume this works without IRQs.

Rather than printing a warning message in sec_irq_init() due to the
missing IRQ number, or returning an error due to a missing irq chip
regmap, just return early explicitly.

This will become particularly important once errors from sec_irq_init()
aren't ignored anymore in an upcoming patch and helps the reader of
this code while reasoning about what the intention might be here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-irq.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index d05c8b66c35f2a1356d7c641484404628870ed42..dc5560a0c496917e847a40295c53e3f762b60998 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -453,16 +453,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
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
@@ -493,6 +489,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
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
2.49.0.395.g12beb8f557-goog


