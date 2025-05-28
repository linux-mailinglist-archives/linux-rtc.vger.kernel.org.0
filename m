Return-Path: <linux-rtc+bounces-4179-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C47AC6781
	for <lists+linux-rtc@lfdr.de>; Wed, 28 May 2025 12:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC5FD4E47A2
	for <lists+linux-rtc@lfdr.de>; Wed, 28 May 2025 10:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162BB28315D;
	Wed, 28 May 2025 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kxPp5nu8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650C62820D8
	for <linux-rtc@vger.kernel.org>; Wed, 28 May 2025 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428931; cv=none; b=G7JbrThOy4ysG9tHbDS2HeIG8yj2dJqJLXII4UDN5ruoL7XTl2as2pNun2MCTC92yXMo3Q9o0aQGG7Pf/4GbpaD7Xd/n9T5fwXTSSYbcaITWjKa35ZhEKxfFFJfKrIL97P0n/S22ThREtdwjTIA1eydIuTnEphyC/MSmDwz1p18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428931; c=relaxed/simple;
	bh=qi1eWzTJCENFCt5JAU6Fe0rVNJeWQChdweXO2MJK0eI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HI9cDeZRWMexDFVMIsd4C2fm4iKegcTbtKefNYYmZoR3u5m3wQ9BA4WCopPLojNCtFOyVSWc4Q53ij38uUriXIgmaZktGfjMJ1TYqLbcTHtPWrdQ6BuOFJjZhrE/aNVXb6xZu71xjPZkqGfk9sYfpqAW6MIhDJRQMRC43tyG4z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kxPp5nu8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442f4d40152so5987595e9.2
        for <linux-rtc@vger.kernel.org>; Wed, 28 May 2025 03:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428928; x=1749033728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
        b=kxPp5nu8265vDYihiygF0TeLrPRm03tOKVozh5dMdM8eyBUYwfJUzo2exj6xXdV1QK
         Yx93URhqcO1cIqxC2qmDVIq3v8cjWeI5q+EQaJE5V3mEdl28PDMH0DLsZo1J5HdEEjpY
         aL1EHgIxiJQnPd2k0IJ17ORqAaKRLPxoE+cDehLwlEWZaC1YOF7AvHcDwS5BaJ/f9XhX
         lhS1ogA3qB+cbNw7eD1/RMbcck0vorAXRQkI5I2+0snr5LQx42bv7YvZq35klmzGCAnz
         z7yPyK4b3dgjcpVf0mAjd0Hm4CbFAir3XkCsp+DKwYhIw+DkPm2/iIExSyHkhO83nbW/
         PH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428928; x=1749033728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
        b=hUF97rEM5drTsiWwIlbVbh0X0NmlvnlLfZAl5TbXBJ+OAemSsHIsT/ljpPV+PbUGqh
         S6bEaua0vd0wXXyICxjBpRR30/GjVS8lDRNXJU1czHxRjhBpiN8GS96WkNY49/Feyn0f
         V3TyfJUSPRjGjzgtmiE0Kk91i288WnyV6GCrZf452N0lHs+PvKZ4oM0imN3Fty7roR1M
         WsqsW201KBlr40d0ao2gLoPbFAKMwnwO7cxCfII8+l/Ec3QIsVPmnr+avNk3sMLxAEgL
         c2ohyVDVRPF1GIJTVO5AGccKqwLiSfMN12104T44GxxFm7/QU90DVMYVFXgDQmZRDtXc
         fzAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp17ZafB6ocIEWKkqAJ0lOGaqmts6ahRtHSn/Fhi8EXJIODa0w06JiS7Wh0gCN4CM0fqGKvrVyKNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiJcPP8cDOY6/wQdyLuLDgW+ifYOxbJhw+3tf8mxfIN0AVznFu
	s2O6azmFGlJqxf+D0pJGAd0eiFZQRgifXwG/arXsNWUJivFFaBWMrF7a2vslZxSMsPI=
X-Gm-Gg: ASbGncvqioq/oNhOATpc1caQUX7P0/f4/ByK+UqiOckUhnUuw3v8XP+wYCRp1OUI8qL
	P3nA0TzYGZWM/FYbbZsnv7hsJOePw3JuU9aSerGsYacZSn1k7xQ2a8qEHrGVErtNJICH55AMHKv
	5p79ZP5HLwh7BCkQUY8QhE2/HxkKVq3Tw/lv/MEeOVSHE8+zNsX82BrKZmaor+VyG4g7w+qPvqR
	2gsicO28NyEt7K3wymoExxl65FBAe+8/lAoI8lB+r7Tn6IZg5Wa/Uo2QSXDTS/woV1Hh4evmwhd
	h2cWRx309YfApFs02iduy5vepI5XK8HOGgucOWj50tzhLWhByWbG8c2IpOs2nwIos1sna3yue5f
	IyZ8dyg==
X-Google-Smtp-Source: AGHT+IFXJEnneO4xSk8QHxW3M4MG6X2rUF/ijYk6/3E6ibOcv7/LTi5pTGoQU3pGtcmJJ43pDOy8uA==
X-Received: by 2002:a05:600c:474d:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-44c91fbb19cmr53499225e9.3.1748428927574;
        Wed, 28 May 2025 03:42:07 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:07 +0200
Subject: [PATCH 11/17] pinctrl: as3722: Move fixed assignments to
 'pinctrl_desc' definition
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-11-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qi1eWzTJCENFCt5JAU6Fe0rVNJeWQChdweXO2MJK0eI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhSmo0CjMtoXcC2sHTGZq48JxTVj2z45DQTw
 MfdipuBb+mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboUgAKCRDBN2bmhouD
 11uhD/4gp5pseL4b42D5IrbEvXxuCr6fAiAGchUSH1EtuHVur/ZUNsA/puQb+u0ePsLEwBisB8N
 HkCZQy1wRLe47FK3rertUOcjzUira7hX1qKm0jhTZant8VKm9nCaQfuvyHxdpPhOoVCVJooM9Ad
 c50bsIAmLW6CrtUn7kwQQ3rbem/I/4JrlLZQ3V+T2HBOBa+wh/sf2x2tGfE/ilSmEXtZ9VCsdbQ
 VeEf7DbVnNsvDCjNCQtCxzEBdKpKKSvCkiKIJcFpEb2Szo35NLhJzj0aBmlXWzocpri70Ho42iN
 GPRpc/emYDOm+hq9iusYbHVvfypT9421VVBIJZ8npbZmUnTu39bKewgOaguan2CHrPsWa8yw3nt
 yw5e2VWBb/HSAChzlE86yqdW9+rkoB5jFUYD23+dUZ3eWK3NDUviqsT+/YmruwWE9exSwIoDVno
 3GCqUCo5TCQOgp0hLWvEbWq7L24O47InJOwlG/6ZNrPwi+mCdVERcA18YX8T5vAEdBBiOdTFHSC
 Ekwch4dUQYD6n5qRL1rRfPoiWhQKE9VTbMoVCm46WQx7XkVKJy35962yFBpybsElB8wY4ca2J9M
 vOA8pVv0owKcK1pBhmg42QqkBmJWh3CkNUY8E0To1kMPcNE6E/hWvW13iZ5xppI3+CQBocPYecS
 qfWXlWeL9QmpElQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Assign 'struct pinctrl_desc' .pins and .npins members in definition to
make clear that number of pins is fixed and have less code in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-as3722.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 0d8c75ce20eda97627aef773342a0b63ff6114a1..ed7b2c482ff0bb6a546955c083ef7046701527b0 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -422,6 +422,8 @@ static struct pinctrl_desc as3722_pinctrl_desc = {
 	.pmxops = &as3722_pinmux_ops,
 	.confops = &as3722_pinconf_ops,
 	.owner = THIS_MODULE,
+	.pins = as3722_pins_desc,
+	.npins = ARRAY_SIZE(as3722_pins_desc),
 };
 
 static int as3722_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -550,8 +552,6 @@ static int as3722_pinctrl_probe(struct platform_device *pdev)
 	as_pci->pin_groups = as3722_pingroups;
 	as_pci->num_pin_groups = ARRAY_SIZE(as3722_pingroups);
 	as3722_pinctrl_desc.name = dev_name(&pdev->dev);
-	as3722_pinctrl_desc.pins = as3722_pins_desc;
-	as3722_pinctrl_desc.npins = ARRAY_SIZE(as3722_pins_desc);
 	as_pci->pctl = devm_pinctrl_register(&pdev->dev, &as3722_pinctrl_desc,
 					     as_pci);
 	if (IS_ERR(as_pci->pctl)) {

-- 
2.45.2


