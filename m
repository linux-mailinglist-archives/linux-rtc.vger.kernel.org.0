Return-Path: <linux-rtc+bounces-3591-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EECA6D1E1
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04B35188E41A
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D1D1D515A;
	Sun, 23 Mar 2025 22:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DdIo1ocr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224441EE00E
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769587; cv=none; b=fbtcBLhlCatCnpc6isXtcvA3nYnIp7dFdHstR+40XCoVFLc0ykwN7rXIhmxvp2oWBx7uVoiGwONLG0IfOlZ8wEhW0GaJNp1O9gBddrXkGfy7Ai2RTdBiewBA9HgU3KL2+2zlAm8kJdXNSsi3oqOpIMwx8283hmqJ390SCf0X+S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769587; c=relaxed/simple;
	bh=2SEWJHOQRVHtm1hZDIQV8G5h9Ihj/ZSId7FCsdh0cUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gD+YxBqZLYL1LPigyMvL9x5Bud1sUWBJvmE0qPEOJmYmHf+16oNA89HlCXKIUA8LbkSlHHOkpsLpxCVwv7EMm7zHWszUWJmFvno3/8PZu0zsMt5qzXBnCow6zACJt5Vrg1BQbYE6m1HnKBY7Du9Dxx3syXgQf3M846WdwXkKjWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DdIo1ocr; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2aeada833so704468366b.0
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769580; x=1743374380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFi/wIa2zliLVLaoNCXevujk62BEru73nW/QKRcDHsY=;
        b=DdIo1ocr6oN1WklNPRlM4v5d7MVDSh5ol+XMGFqEPShgIb3z9VDnKq7j64GpehYkeo
         V7Q5zwbhXHjozJGe31PomdnLA9V3GY3+tRPOhlJ+Qq0YjXtmb0jS/i+9iiPblgToXjk7
         CwspOU3w2RNjPAhm2uf1eMc4CN1t1vlgIZHXsuh1N5QqHqQrZJklXZZXj+OrdnAXHR32
         Tv3qChqTcYXJeUhcyLBcu4syBqo+0hEupi7kPld0J4sMva324Fg8HBJcZrA7zj3hyqwM
         qRqNrvtOvb0RTJ+RXY1S6zSzrzSimFoKBSn4Ld1lIRcRIJOyKX161RHBMqlC7QsR3yt3
         8LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769580; x=1743374380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFi/wIa2zliLVLaoNCXevujk62BEru73nW/QKRcDHsY=;
        b=a9UhWXFgIGkQxxaYDZCSWJIrkmryUh/SV6oCQL8OLCqj+df+WZe/gKuYj4JGFA5zOR
         niIgFnWvT48TvP5Dh8zj32B6IrLKg2EL4iAcZwJ8oDIA/1bZGQrtx2o/Nu7zjlQ8yiUL
         jehIerGV8acDFDIbAgbyiykzmS2kVbb0uGSq1GT6WtOXdl7uBHpc5Bx59pcwEDg7hwWH
         qcmH2nDzVIVcRE9pefUF30PpeYWZfptuKDRaMbcelS+AIIX0cpz2NqA6GDPCLtfqe9m7
         gmASeql8I7jQO9bWvPRrdI9DbQ5cJKXxco6NZ1N0kWumHmqsYJxK/A8tzxnTlVZfzedP
         Vm2w==
X-Forwarded-Encrypted: i=1; AJvYcCU3Psck3dkR6APmx8lLcGc/7CIVN1F2iuB5RuaJjX/YuM1F/WvTRoK1e04Mfyrkz75MicxHyhRk1iA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx52OSOxO1JLtBjGDxUkQhCYdzhGzzWeSgIUlQvXdKV28l0TwJJ
	W9lH0hoh3D+bD6vsd353aye+4t2+zxKUkkdVcn78c1mdIql4XGmpY2uwOC9zhh8=
X-Gm-Gg: ASbGncv0aeVVW0z/UvO779r5Ia8lNdhPd0wTEXXn271jD3nIjPqSDwhGUQj8p8BUnub
	EH1rPum5K4xneXPgBI05zq6Hry9tY4dXRDbRsQfntr0zpzp8mOo8H+deM8ADNm7m6IXEXCylI5C
	ki7syAq5+Oqmp+693nYTaL3Urow3x6uC79n1W4TPXoQ5GdDomYwLu47RIvnC17I50HXecXLSgIN
	1Nwu01klLhwalom2XFR7CTPzrqXeMYKF7zNvpveTkChYdXFH/3gmpLjRHPkucRNW2TBEFX4wb/c
	VgNsfP+SSgPVoRKCEkjosERYRCDGdX7TdXIkGD3CUAwTE5PXO5rhQaeaKwBTn7PaZk5DZLxN51U
	7BGUCmerxImRi5ZQTZKCNXJYZBxk+
X-Google-Smtp-Source: AGHT+IExdWMeq50KMSeL2g8X5YzwdCsnSfpgrljF2A0N/7BkwT1ZoOB/F1xNUkswffcMZkq5HeqMZw==
X-Received: by 2002:a17:907:86a7:b0:ac3:c6a2:a02d with SMTP id a640c23a62f3a-ac3cdb95075mr1563087566b.7.1742769579644;
        Sun, 23 Mar 2025 15:39:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:43 +0000
Subject: [PATCH 27/34] rtc: s5m: cache value of platform_get_device_id()
 during probe
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-27-d08943702707@linaro.org>
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

platform_get_device_id() is called mulitple times during probe. This
makes the code harder to read than necessary.

Just get the ID once, which also trims the lengths of the lines
involved.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index db5c9b641277213aa1371776c63e2eda3f223465..31bdceac7aa245175a30eb13eaaf1f52f70e22c2 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -637,6 +637,8 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
+	const struct platform_device_id	* const id =
+		platform_get_device_id(pdev);
 	struct s5m_rtc_info *info;
 	struct i2c_client *i2c;
 	const struct regmap_config *regmap_cfg;
@@ -646,7 +648,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
-	switch (platform_get_device_id(pdev)->driver_data) {
+	switch (id->driver_data) {
 	case S2MPS15X:
 		regmap_cfg = &s2mps14_rtc_regmap_config;
 		info->regs = &s2mps15_rtc_regs;
@@ -670,7 +672,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	default:
 		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "Device type %lu is not supported by RTC driver\n",
-				     platform_get_device_id(pdev)->driver_data);
+				     id_entry->driver_data);
 	}
 
 	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
@@ -686,7 +688,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 
 	info->dev = &pdev->dev;
 	info->s5m87xx = s5m87xx;
-	info->device_type = platform_get_device_id(pdev)->driver_data;
+	info->device_type = id->driver_data;
 
 	if (s5m87xx->irq_data) {
 		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);

-- 
2.49.0.395.g12beb8f557-goog


