Return-Path: <linux-rtc+bounces-4183-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 604A9AC6793
	for <lists+linux-rtc@lfdr.de>; Wed, 28 May 2025 12:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9CFB4E4875
	for <lists+linux-rtc@lfdr.de>; Wed, 28 May 2025 10:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81CE27D79F;
	Wed, 28 May 2025 10:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DkOiqnV8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA04284670
	for <linux-rtc@vger.kernel.org>; Wed, 28 May 2025 10:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428944; cv=none; b=VYytQZKiChuzF+yW9tcW2dmzklDgd9JsO/xUbqXwFXqbvoQszYKxD2+QE62eB9RjTjp9YUuTYxaUGdUBROo0SFLbvSEnOrOjTvFxDfWJCWf6+jPHrLszkotk3T/ZT5eQMfd85gHzrKU8L9UZRQTJ91/sifTXWzZ2WrUuM2WS/h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428944; c=relaxed/simple;
	bh=UtgeU3dDjW57LMOT846YXV02Tw4GcYGErdMblZiJj2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NeE3TaGzd3a1B0Z470tmyD5sObr9DS6UtMDVG0gkPJJY5KZk0zxRKYE0CeoAR7Mcl5KxLyikkfMBrJjL0VLzWd7A6qhk3jTZa685hGsMT3w3WKqDAvIOFRfE6vHApf1Z5IjFcusO1cCkx9Glw14BzjIMV4CnuPmwpgkKJl0kDSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DkOiqnV8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso5070345e9.2
        for <linux-rtc@vger.kernel.org>; Wed, 28 May 2025 03:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428940; x=1749033740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3Ze+vADApZQcXHHJvnQw5idboAhTO4ZZm7oXpqIyA0=;
        b=DkOiqnV8mJAm63RT+K1Jbcy0EV3lXT/i9lMFVx++SEJI/GBeAwZQahL6ZsGeHmwB+F
         Wc901a2FT3XbFJzLkGnqbszmI8Y4W3zLNr9ojrZOv6vTHSVMOtBolBW0DVvJotjnNJeF
         WdTFqKLgocTugOYGicXJPGkIH4oK7NKHMVqJ0yrj0WeVeV2EC9cc5z8zrOSmxQVnYgYX
         i0iz+ofTx7wPYzrvuEsOUYx/eJy9FaIEmi9hK0EbXClWbZtUMq0s6sPcT5FNhuFV6tq7
         WwrPTMBr84E17zTQkiF3iOdm/m6B3EHUOteD7FhIFukQby+rVObUJFQ3n2yrlt+rYAuq
         GMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428940; x=1749033740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3Ze+vADApZQcXHHJvnQw5idboAhTO4ZZm7oXpqIyA0=;
        b=NKG0HCyPB371Ztn1d8OpQ7RWSi/xMgdBormwcrJ6RLukFhe+vGX5Cze7cnV0h5Crgk
         ytvQedKGfcBXIsy/Tm6fTXsLBTYnNuOnRnNeyAwwyrmwk1gc9WF8d3md1sbu5ZYMDORf
         CXAA54qaCXilbVsgJooecGSJNPm1wNwRwYLeIfzDh04RBfoH6AJXVqO9Uzuolh+HHdJT
         aXpZFj7T+NXb6UhxDcN1ygv3K1Ts8Jdp8VX+yC8dxPzetP+xCvO4vGOjH41Wcl8RS9vb
         TOwF0jPZn8chHLOyA3wm9mvYBLNQowcJ4vepWJGeRRG0veGmchm/fYyPdjBou7fyNoE8
         EXbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEFNniDYc8fU3+cRvPkipsKBCf5bvtXC1DqcpDclBB/zw59iiacao/pqUPsD/06vPepBoRBRcsBHE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw98ehg1nNoNqQ1tG4QWfxaoq4ZvwKVds8XGyjEfteI4I705aK+
	VbN6upnvkg6x+D6/9kG6UJxLxEciC8+8y7G4A3ydANWYu66dTzrBHLmzw6+hZuL1Z8E=
X-Gm-Gg: ASbGnctZFAOpIlwN3t9xL/bJnF1D6q1ok98C6kmMLuxIMAcYzhc6VJQy5+nmUlLAqNn
	+JNQXGRrO2JUbUnL59enGEepWcbMLs/5iNwuj/P4WdSw7aIq24NHckrtiloreePeJQDtExDmdFw
	DJeyHODPyX4NVdvf9wnFewHCgYCM9efk2oHNNghd4QpnKxD9vuVdrrDsFWcSvCRRx7GhDryFb2E
	R3hcsz1WYWmk5JgCwfGf8j+wc2eO9HJEUNsd+r3VneutSzIJ5y7xw1s4XPzciBJ37fCYHyvrNzo
	FH1qmbEbR9IZTao1n0IwyRTlynChwWRuYY2qrQkjby+PTbxiFs6Ph309WemEdfb3USDSsUo=
X-Google-Smtp-Source: AGHT+IGOjiAalYWBzwElbSsmEX9f/2Y60O5w2k0gf1phaTpGJUJlpjPJvNra7B8bibqFA+SG8s+3FA==
X-Received: by 2002:a05:600c:1385:b0:43d:fa5d:2675 with SMTP id 5b1f17b1804b1-44c954e5abbmr50075875e9.9.1748428939845;
        Wed, 28 May 2025 03:42:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:11 +0200
Subject: [PATCH 15/17] pinctrl: pistachio: Constify static 'pinctrl_desc'
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-15-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1566;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=UtgeU3dDjW57LMOT846YXV02Tw4GcYGErdMblZiJj2Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhWkTbDlacFgpFnf1vgJHMFlUPFeOl/ORR9m
 JSbFDyczmKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboVgAKCRDBN2bmhouD
 10W9D/9xIbBzH6McgFf7kxs3Wz0pkjTxc7iD6YAhHueVZZd1gP4kz2jdB6oiJdWYbdcvCTsO0Jb
 1M1uQI4Y+F5z9nhOIsSCZcbSEa8uYgf4mTdPeZejnHLZuN+XRE4q060VzMPM+0E5ffmjbSfdguv
 jUGo/ReQL/VbQR3GL3x3Sq+TYjMsUO9HwZ74ot0fnqvUDfwONwxm9Ia8eDAmZA5wOjtSqLldzqA
 nmcrMY8YYR++DoVRbPTLeb38zzchZ4+VQga+QK2Xjpm5Q2ybYvHN4lWRbyLvHLzodyGtm+9vfTG
 jar0yvgxFJxSt43uUsQQD2kiMQ5Wo/A7Gkl/g1mAoDL86kviDaDexYqAL6QM34oxF62djx6jTYo
 t1J67a9M34V59n3xE0FqQ/zITEuVNEP6mBzPXgRbusg8xO3mZGZyyCZFaz5TfC5GMy213jvzS2G
 /BQbvzGMIvKFcEJltkEesVBc3dhPn4j3T53KxDzwq0XR8/qrHK/24e3XCpaCpkP47HtU4IkGhtt
 LDzr6uOse1tliqhZHHOz+JMmqt+JgE2zu0h7xaqEXEV5JClvnbxo0LIz2LR0f7hnbRC//FKZpon
 bEVmb4R9Sw2nd4OuvK7aG4+5drtYGMTyYELEOHkaxIcGob6OxTK6E/vhm3q31u90R4Dyb3LEcPB
 i8N0zohII+TfZBA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety after moving .pins and .npins assignment to
definition.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-pistachio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index e7bf609609617d6af2f10a3df56c62e3bfe2dcd3..7f8b562c81c9cfd1ac3a0bd50018857450bdf609 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1156,11 +1156,14 @@ static const struct pinconf_ops pistachio_pinconf_ops = {
 	.is_generic = true,
 };
 
-static struct pinctrl_desc pistachio_pinctrl_desc = {
+static const struct pinctrl_desc pistachio_pinctrl_desc = {
 	.name = "pistachio-pinctrl",
 	.pctlops = &pistachio_pinctrl_ops,
 	.pmxops = &pistachio_pinmux_ops,
 	.confops = &pistachio_pinconf_ops,
+	.pins = pistachio_pins,
+	.npins = ARRAY_SIZE(pistachio_pins),
+
 };
 
 static int pistachio_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -1474,9 +1477,6 @@ static int pistachio_pinctrl_probe(struct platform_device *pdev)
 	pctl->gpio_banks = pistachio_gpio_banks;
 	pctl->nbanks = ARRAY_SIZE(pistachio_gpio_banks);
 
-	pistachio_pinctrl_desc.pins = pctl->pins;
-	pistachio_pinctrl_desc.npins = pctl->npins;
-
 	pctl->pctldev = devm_pinctrl_register(&pdev->dev, &pistachio_pinctrl_desc,
 					      pctl);
 	if (IS_ERR(pctl->pctldev)) {

-- 
2.45.2


