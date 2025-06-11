Return-Path: <linux-rtc+bounces-4262-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CA7AD4B2D
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 08:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BD193A6917
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 06:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566D32356B4;
	Wed, 11 Jun 2025 06:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z5Dp28G7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AAD234970
	for <linux-rtc@vger.kernel.org>; Wed, 11 Jun 2025 06:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622493; cv=none; b=r6im90ec6EHFYyDhRZxNNQq7R2WC7bfzAKgtwjycRKQbPh0+i44UL1gw2JXIrWvL6dKtARypZANoC67dCvNXnfSXedrOfZ78j5pOzF17i/uLDK+udRpEAGozrN1rFqFXwB2ctKAxpfQYh1aMvL2r2Ui61MU5J8VLP7iGAX7/WGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622493; c=relaxed/simple;
	bh=qi1eWzTJCENFCt5JAU6Fe0rVNJeWQChdweXO2MJK0eI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HSH6kTZ/AWGDNYGr9bqlV5FmkHvsRlfRaIVN1M5RmBBlme7AMMrak00w5YzzGyzRHtIEwawpqUXa+T3ilgXNwgHYYCIPy+Ieo0Bs+tRKZrn/yR6XalOWqAL4uUPQHA8CNY/VSpSEn2P8eCQaN0F2y6PiKx/RkSXogytsaERHwWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z5Dp28G7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso410215e9.1
        for <linux-rtc@vger.kernel.org>; Tue, 10 Jun 2025 23:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622490; x=1750227290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
        b=z5Dp28G7yd9Ro4yhJqfdnN1LChoO2EcaL5C1lv8xSETFWO1lIduUwegUas3OtOpSp9
         Bb9Ht70R2D4+lmznBlZlZFzSfaNy1PojIo1MIlUE6evboYnkZXE/nVN1ZQYWkF1SdBUs
         2IT6CcV60DQhoAH6j1QLa95Z7dVY8s7chz0G+t4tkkOq8Nm47lN0E8JhF4uFAYb/sRCu
         Ekr0TTC5wUfLMZQqVNapwdBaNfl2pRCsdj1t77cDeibKBv2fIgqvUcgIoRm42EN6SMyb
         tyfm3TZ1qf1mehmLFOBUz+Nc3LcismgwSaqCS5MLKId/kxhrP0H19MynLmlwsTFio+T9
         hKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622490; x=1750227290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
        b=fNbUsbUlG7rkVuxkZ7krJCdML1F/VMAuajzHRS8IYqBgsLE0o3pHaZ2RRrt34L/fN5
         4xh+C/r2v0BpktSENkgSIEHsyGqYb26/68dqXiJqo1tpi2dHd2OIZOdTzByCCFfjHA2n
         AM6DZTKm4rOdQ7QTMOA5zzJJWW3mzgtJtohnEof9yKMHMHYTq28o3+fLTcjibDTjZkZO
         IbbqHAKJLnhqZHSsQKUH+7U/zqTLy7NT/Elc94lCPxwbK3KM/ZeZH+Gy27eP1DG9E48E
         ru/3LvyG3hC/R5B+TN9SP7hWFwKtP4bGcZrpzaaB7FS8T0b0SD0wSnRgaUS9F6VY+ZO3
         shdg==
X-Forwarded-Encrypted: i=1; AJvYcCXgmzC4c/iuKedgvHPHLoBiCjkSu0EPdOd46xMRo2gj6rPXcmhWkL2/CmPuH+Vrdx4NAJs8tk0QUXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXppkOsNutbksUOYv00ZNXQL3QHoDttmdg6ovSE1O1sVi28uzU
	vz9bJPEl6jcuKLIGNWD6P+HkBVNMpaAls/mehTF2Iu264C12s+nmvd7YzxW5dkYDU7k=
X-Gm-Gg: ASbGncsuAXgpXqQoTQjx3gH/prKexAr9E1ZCee0HwifwTTmspXSzk3KV2iSElg15Qt/
	O8qlNGX1amUq2zW5IDou071sRlWlFjNULietoTXuaiq1pKXNrVVOOjMyXZsvIBFqybXkUquMdDp
	AM/4AwC9s6Q+tnLI46kuyFGQgwbh5gQX840ccG4rKROs5MPvOOdW6OvcsCNSSfre0sPKeP2xqJ/
	8CEWzl2OqJM6k8RwjPjF/CVIyZzGT+35/M3ZMmuEttpdy9E1HhcbjygObB0Ykdq8yo3tpV7SQex
	O9pzqBTBrByLs3VYIIrH9M3uubeMkFrlR5u0IJg1jQFkehTABFw4D3+J9D417We/wpTwRqZkiEy
	Uq9Uwa7Q=
X-Google-Smtp-Source: AGHT+IGAMOnxxwJh6k3dhRiX61q7MpOsBjEBq59fXcuOB6WHX3+BJjfe7T2i67oqLzVzIqJNLPxm7Q==
X-Received: by 2002:a05:6000:1788:b0:3a3:5c97:70c with SMTP id ffacd0b85a97d-3a558822cffmr480215f8f.14.1749622489659;
        Tue, 10 Jun 2025 23:14:49 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:43 +0200
Subject: [PATCH v2 11/17] pinctrl: as3722: Move fixed assignments to
 'pinctrl_desc' definition
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-11-b11c1d650384@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qi1eWzTJCENFCt5JAU6Fe0rVNJeWQChdweXO2MJK0eI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6oRdItqT9sxon4qbZGkWGmSQh5LLhdyjslx
 Lrhu2XhwFqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeqAAKCRDBN2bmhouD
 1zqVD/9ltJexCdYC0zqX0/CADjrrprRtZoxnsBy1fZlMCSHM//l6RgsH+zTI3L4z8D6hoXjSN7+
 kCqzJiEtHxlNkIPRSofpxJdMN4X7bnalI2zDd6X/0XwoGaFls+DBLvGym8L/PCBsw2XF6cR3Y/r
 vpnXKGcuteokGneH3wAP8Wpef9N8QOEKtMiJgtAGa7mfmPf62QTORx1Zkeyh+u+BcEHykALKzL/
 Noyc7nXEB+ywMlt91FmmpwdT0bGGf9FjGJmjXa8Hri/2a11cypStJu8pW9p0HkP0MylQcHwxAGf
 jgwyFEj9f563zIfknjjRmB07L+vhdZjrMHYuRBDARPoDCUZ/wAtWSzS013IH8KTY605CHDkDDXg
 W7tSAeJ8dfweOfmy/LVBOJVtADslkpV4zDk6Ou7cBz3IT1L3JWzytd49gj2sQZFwH8ptj+6LG/f
 hsGg4yTdoyR4r/xZyN/skZHugzysRD1LuBvV/hx+QjJaSJHmmMw9cwX8jnWFkrFO+jtWYrWNehF
 DXTusW4HtBT4feez8bRSM2jUI5kSqnYHNa4Er2ZlPLiOyqdLWrMd0AQMTP4SRLBmhsJQCbfTvHt
 GEjwdyXAIiLXyaogHeIulwyIiEw52cJ/3DShLuesPqxk/vnnajXOS+ikRv6n+kyLnyNEybCOgxA
 x214zblWxgJp17A==
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


