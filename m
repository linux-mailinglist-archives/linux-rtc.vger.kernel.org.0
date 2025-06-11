Return-Path: <linux-rtc+bounces-4259-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB394AD4B1E
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 08:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53C2B17BE3A
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 06:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EAD233145;
	Wed, 11 Jun 2025 06:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N77/zh3K"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613A8232365
	for <linux-rtc@vger.kernel.org>; Wed, 11 Jun 2025 06:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622482; cv=none; b=naj5sysNp4zVdX6OQGrwOaCGwhHgEF2TsfrMQmsdY/257O5tHjGQNJakmJJ/2IYjtPUi2aN9CaOgvsMoZbQcMy8fE/aPFSqXp94x7gcyiYZdUEM7P7QVVy+b8SC9Cz3opBlVIzBIb4qLVo0122yCgy44J6xxy6CuBghy00ZrMd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622482; c=relaxed/simple;
	bh=qxDFEG/2cjWrKLnKXwD75upSffPn/RaY6zrSF/H6Qbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=okxcUoP9q2GPE5XbwOXUWtSJIakUHu2ct7+gD8Vx6yzOvnYCiJQWxHv3KIWzPWFsl/TpmmpPNxzpz44HZLxCOd+52aILPUhIZTN/sXvbI4rTlD236qiaH78ZVCcmvSAH14bQ+MF8pJC/LS642Vnuab34Xe2BczG6gV14txpdM2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N77/zh3K; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4ef05f631so24984f8f.3
        for <linux-rtc@vger.kernel.org>; Tue, 10 Jun 2025 23:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622479; x=1750227279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TE7gPFs8Np7Q/FF2lBSclyxd8XnUpnZDt9gHZQ7ecXc=;
        b=N77/zh3KZKjqkdOCtI2LLJn7KXQSXHFKEZH9XnFuBdhkYQDJFVjYtNVYywnXgwG5Kf
         5VYCzPVoiwGDiUQUCQ5amXRx5f2US+dnXvyFGn4YjQAI9Jr+vtmLglZpLFzREuViJBPW
         kZruuYC/kQQ1HEz8ptw/8uryY/MwW2qk9EAhE+pCxI3UCPaCSLoRWXpUf7dtcGbZGAbk
         ew0govl9MoFExRCHhVKIZYrXx4hRz7lO5CUc2QGmp1ZO6O9Ia1tlSSEFImsCJH5RCgSs
         SYQz68v/6oyq+bw6yHLiExmQSIDmbEEaFcBZc11U+mH8qB4PhHAu9KRZhAXeGprwMfEw
         sxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622479; x=1750227279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TE7gPFs8Np7Q/FF2lBSclyxd8XnUpnZDt9gHZQ7ecXc=;
        b=oGYmOIj+qL5hTzeW3E5ln0j45pAeOp573EZW1VCoHSYifOKFa/lmYnJzQ9voDO2Swz
         /zBgAC32MlQlhIHcvxvKyYIeeQmc4IQLjPj8G6KklBzdsuaAiWGDDVyHTCnmkB8WB9ZF
         dVPHApNSZMJgwtda/5A9CMyy7ExbgXN6hP+Tnl1pzKk0d5A0+7gztEGIurRwayK05m2a
         eWIAAaaP3DRbQWi9GjXLMoVtY8ViQ86WDQFQgpBPtl6hNDkRbCZckquX3zYBxqteEnPN
         BUrRDgNEZmvhXigE9/J5mfa32P8vi5oWwaMoEU3T/5+glO+xHFvzSAtkr78qyvoTVFJl
         tbEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV52WGF35aitVUv+6AfAwQY2LMgTjj31ae3DMjD9siUhwAkjzrL6yLFrfUwI8FkCULfgzeIHgjjuow=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3RtGjHnFw3sgd+d70biTp5IFPxDMy8BsLtv2rlmah5bpvWMYH
	AUtWRCL0ro96i1IP0osjFWZmWIX9C+akbaahow0aUefn3O+Wt2Rsv/6AEDT+/GjbplQ=
X-Gm-Gg: ASbGncsolvzur5k6qNm9Pi6+rfhU8c5g3GWp9ho0WN5+oRh5AQMqP5xAl9OUYV6q/DK
	EzkN/eWxSzC3M64O1REcjobyLL0euEp8PuZQj3XLORng1C4CcRlfdUXdwFbWA/8Oh/wfftMpuJD
	Wt/qc83MU3Ihdon8awBGRw4SilmnRzWdt4E1JIT+4yzyLyoBhXZq7VSsRRiIOUF4X/K0rGTOBAE
	UAvKFOacF9vGPtCgE3yijaVPVFDtNmlKlfZg5PbDedLkJdTS+NBrehDil6QVxMkdj8wkbliUNtV
	O9nkKakQ8sNcrdCuvd1GdXSjJZ9YsVbJuO2I4qksWSV5Z86a5jnfM9n2gMFjoHo2GEA3dxqb9xj
	SreHhVJU=
X-Google-Smtp-Source: AGHT+IFn+w9wTXPGUJy/sPilC/NQmEX8xSLBnguhN63zZeVVN5Y9q/yoed/8bnPWbjxQrrKvoL0/ug==
X-Received: by 2002:a05:6000:290f:b0:3a4:dbdf:7152 with SMTP id ffacd0b85a97d-3a558827131mr509857f8f.14.1749622478587;
        Tue, 10 Jun 2025 23:14:38 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:40 +0200
Subject: [PATCH v2 08/17] pinctrl: bcm: cygnus-mux: Move fixed assignments
 to 'pinctrl_desc' definition
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-8-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
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
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2161;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qxDFEG/2cjWrKLnKXwD75upSffPn/RaY6zrSF/H6Qbo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6lg4NYzThC3P0VBNILmPNpLI7cOGxxduFw2
 79gOSp38i6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkepQAKCRDBN2bmhouD
 154dEACOMm3Rp/o7Yal3hsY5lrUILoLJv/3YbR1poy/Hntcal7lfWiRxrgpOmbhNAJ4gxXsCS2v
 pQvdOFDdKXryzGo5sBlbzlSZ+llGXe7xIMFD3ccyG7miWv3FoqR39Ss09HtlDLb/iY7lCYUklFO
 X4CE6AJdiC+cVyMjst1ORlZHYvtSmj84z8M8Xw7fjQpmfx3jwpMn8Xk98GAvBj32k1bffAnVrdc
 0dQ73IYkIqj1S30dFyPVw8jVo1NWaH7C4LOHljvBFAS2RWUlzu6GViA0z3aLYJlleswzhWiXdqQ
 2uggpYru6C02B3JBYWRsXiE9lcHMWwJdL8C3KWshReL5zYhV8hRSeuIcHkZjviIb6d7qLHswZoq
 BBsTpZzFdVstw34OgcD5V/WAGmnWxNMppVq42YTfT61ZSZo/M23EkrRVSOAtgXoy2FMcc5QNhv0
 xSBOHIUMCmzDYd3Jdou3acpCxF89InjFKRURreHYhf6ZDMV6r+Jwq9UljYzaJZ4HR0QsZZRunEj
 bIE5rRF/VBlRukZG9fnFQwey+KBFAhAYMQij7w+xJpoqhxqpyvWoVmvYHH29AzUzEaag4F/cxdw
 HHEQfjUS0EaLxw4ayenSuMFm9PmgmKlxXXS++io2JONMtPpSTwwKvP3qPWz7NuuR8O+m9h0hb1i
 HbUKb6deG5dGoyA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Assign 'struct pinctrl_desc' .npins member in definition to make clear
that number of pins is fixed and have less code in the probe.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
index bf9597800954affd954e45a4baa01da4d5dbf420..e9aa99f85e05944a2a0cb9a3e6245c707dbc9b3a 100644
--- a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
@@ -903,6 +903,7 @@ static struct pinctrl_desc cygnus_pinctrl_desc = {
 	.name = "cygnus-pinmux",
 	.pctlops = &cygnus_pinctrl_ops,
 	.pmxops = &cygnus_pinmux_ops,
+	.npins = ARRAY_SIZE(cygnus_pins),
 };
 
 static int cygnus_mux_log_init(struct cygnus_pinctrl *pinctrl)
@@ -935,7 +936,6 @@ static int cygnus_pinmux_probe(struct platform_device *pdev)
 	struct cygnus_pinctrl *pinctrl;
 	int i, ret;
 	struct pinctrl_pin_desc *pins;
-	unsigned num_pins = ARRAY_SIZE(cygnus_pins);
 
 	pinctrl = devm_kzalloc(&pdev->dev, sizeof(*pinctrl), GFP_KERNEL);
 	if (!pinctrl)
@@ -963,11 +963,12 @@ static int cygnus_pinmux_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pins = devm_kcalloc(&pdev->dev, num_pins, sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(&pdev->dev, ARRAY_SIZE(cygnus_pins), sizeof(*pins),
+			    GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-	for (i = 0; i < num_pins; i++) {
+	for (i = 0; i < ARRAY_SIZE(cygnus_pins); i++) {
 		pins[i].number = cygnus_pins[i].pin;
 		pins[i].name = cygnus_pins[i].name;
 		pins[i].drv_data = &cygnus_pins[i].gpio_mux;
@@ -978,7 +979,6 @@ static int cygnus_pinmux_probe(struct platform_device *pdev)
 	pinctrl->functions = cygnus_pin_functions;
 	pinctrl->num_functions = ARRAY_SIZE(cygnus_pin_functions);
 	cygnus_pinctrl_desc.pins = pins;
-	cygnus_pinctrl_desc.npins = num_pins;
 
 	pinctrl->pctl = devm_pinctrl_register(&pdev->dev, &cygnus_pinctrl_desc,
 			pinctrl);

-- 
2.45.2


