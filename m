Return-Path: <linux-rtc+bounces-4252-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09870AD4AFF
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 08:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3683D1898957
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 06:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20BC22A1F1;
	Wed, 11 Jun 2025 06:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d79NzVqs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D4C227EBE
	for <linux-rtc@vger.kernel.org>; Wed, 11 Jun 2025 06:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622457; cv=none; b=FCX+oQMfU4nR1mDUIbP5in8bqyiX1LvPIAjl3QQpzggDiE9/pVims337DCZVlJ+wXBjQmMjyt8s9Uc67sF9y7rS2LhPWagtHUvNJst6ny8uTxTgNq2WaMhODJBUDC1r8p9Gz02M3EXEl4bPOU+Kp/OPQY/yGMr0ugxzRWoyNhxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622457; c=relaxed/simple;
	bh=mDmWzbKLnh1AZNQ67jxvi1k0hTLwQwfvsMjzAxX0Nyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tcSFqDkTjxMep6Rkdx/yUQd7FqJsAYULUUiTv7MLFD5gUlhexIkLEcQHCWII2R7L+2mXpaWjsWFpFx55S9WJt3eMzGOpNB3APm9JocrZMYsWKTYGrK6ZufkWCRXyAW2rGgxcKxm8aXVZqIPfOmu/LxddTVUJplM6wqxFfGRFmVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d79NzVqs; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a52878d37aso31033f8f.2
        for <linux-rtc@vger.kernel.org>; Tue, 10 Jun 2025 23:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622453; x=1750227253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSwZ1HkGC0NCuxdiJr7YusfytJ75yXllA65meVJdMKM=;
        b=d79NzVqsnX+UJ8nOHxTik8AtoDN9aY8VS8XSw5wgRxsue9cSPA3Erx4eUrQhDRGwb4
         07rxkcnDe3yHdxx5NZtaV29mLJkRLmK8f+Cwgp3EHT7INOLck1+I/9Fe7sjYvQ8VtE3f
         QR4T3N/259kPnY3mmu5gRSSfT4xmuSBbhjSsvzM8+fnbS4gJGv8l+mQTGW9QP4bEEUmF
         6oOe/BEaQeWkeYV+7NOKWJcC+l8QSNILcWMKh5nL76Ht6/PIcHTRJEY6UGQLG5IiJbRI
         /QQ6gvkU9pnC0CsMaQ1t87lPqJzFhc+Jw1K/ZFaajyYkDKVFhem3nCJaldM3NftOmle3
         HrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622453; x=1750227253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSwZ1HkGC0NCuxdiJr7YusfytJ75yXllA65meVJdMKM=;
        b=nBVn2vJYxVx+BQyH2CcWBpQ4gcXyxqYpIq4xzwLHJCQlGhm86Nyv2BHzl2eieZXikL
         Ix53QJlDhq/ol+z0s+/lTL9XJVH2PihnP/gkVNT9NVxRQjS54R90JckMmgYhpR5Ae0UN
         YNxo0GT914hUeUS7LM77p53elaLoKv8F3ZxGpJrNDyNYQ1wKXSo54WHiPudLZPtD3nWV
         tBVkcMRpTlSbjUvqdWASBhNMSBEkBJosydBiPNHHAXDPDaLsDjTYAyxuC99xPOWVkEXk
         XKAgKdF79SyWc8QRwwP59rbdILQla72OmC7d4cUrV7rj7RmG2lY3LLMwB2wYwbysZ+ce
         vdTg==
X-Forwarded-Encrypted: i=1; AJvYcCVdct7zeFBWa0F4Bdh1fLv5/2zJUgIrkezIGaZFtCJnhw8XMrNjc0kxbvrlXi9Jch03R6yR6gGDGpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJmfxm3h+w4eH6cDqOsfudKug/TBFS8X+sOxuSIgYl6EQlHgLA
	WgyCaEcVvjxvCThFNF+XT1iv0N131aB82irjXWg3kEc9ZCdObJ/ligJAdqH9eQRCBmMT3BbJ6gX
	gypue
X-Gm-Gg: ASbGncsIUVwQlf6A4pF9l15OKRk52moLLDJCNrB/iXPeydPJUvEHWlbJKc4jvP9s7X6
	8NOqQGkRVkXTVqpujwjrC9tno9W9fGBLQCh2Ein2wSsMF4nSyWQI8eUJaWnYfdeweeC7RuB6GwP
	mVZizMpnJCRZ4tuSW2j7Z8t57e9387DG/V3+6iwlp2spcXZgZTDkqTq5hH2go1yv8BUDxbjKkv0
	xUSaxwRU2kQc57qx3OhVxzPqtMJXZQcY89j4i8sjmx9XVYhVQk79oKTf3gvrZSBjiAoBxyK4Mja
	obL/Ig+1EO9DEqUGxJQOOWUM8yeQPeMoV4pZ9NA8cENVqzOHcRmxjc3BkHiTSmKVf/vRFjXCxoy
	v+D/A4Qpix/z2XJ0mNA==
X-Google-Smtp-Source: AGHT+IExi18Qcb4RFgAfHXzCB8Qf4+Yd31Q1eTA2g/Az2TI0+71W9MDaYsWsvrxBOzhlE7bYKU2y7Q==
X-Received: by 2002:a05:6000:2288:b0:3a4:dc42:a09e with SMTP id ffacd0b85a97d-3a5586c5d22mr478235f8f.5.1749622453083;
        Tue, 10 Jun 2025 23:14:13 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:33 +0200
Subject: [PATCH v2 01/17] pinctrl: starfive: Allow compile testing on other
 platforms
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1030;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mDmWzbKLnh1AZNQ67jxvi1k0hTLwQwfvsMjzAxX0Nyg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6fEB9xL/xFDTrWnWiu/Ruag7QKGjRyQb35k
 gOcnuOKB3OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkenwAKCRDBN2bmhouD
 15lkD/9Q4nMlgfW+gPfCACmH3SZySXOQg89b9kURhO8G5ijTWTIu7al/6DRaw7erQNXoNQBsyJC
 20tXphKrIKBg1BOFLkQpFJao++nW1TV9e6bfDgRKv6ZQhyy1v63uBc3P9AT/zNIhPWqRonlDGYD
 EwbTm0diXMR50Hwurgx2vAmMuTZbx2IlIgw8IJ2IaAzlhv2PsgLVapM2G9zgRKTicxGxfFRuLQr
 P6k8YVt7cEdYJxGH0Cxb556NE85eXpDfgJ2zdLU2JgzKOJmQjxftTgDmTZGM0jW6ZAskVG+syK9
 KMh7ipL4lMH9/jo2rRa4r1ftUUblu9FWLsSs5i+xNKBn8z7oxv3PsWV6SOStiSl856ZKSQPXGgK
 KOzmxl2/Tw8oM71vKQfInXGzcxN5DoFaJGVy/WJ43K85ys8epHls7Y3tTpBCOZUGciGaWkLzrVr
 zmghKNkyO5kNtwLrD17MNUGAbv/LJiD9EDIoVuQPPrG5ldyRzfZwWxd/urXqJuTU75evEvNGBy+
 r3SiO/e7iKbZ/Ox8FfkubNnLYl+H6VMsLJoGVZVNI20ZJLVR7Wt/Z1lmZJtOhnIbTFslWzCML93
 AskWsFtWWjVZzX5uKBXDeo98Q5fue2afsKkRAbfKOSphNl6HIPaNmbsLDXRqvTmuBPR6M5wN4Ad
 P6tSr4VsygCRo/Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Always descent to drivers/pinctrl/starfive/ because limiting it with
SOC_STARFIVE is redundant since its Makefile doesn't build anything if
no Starfive-specific pin control Kconfig options are enabled.  This
allows compile testing on other architectures with allyesconfig.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 65dac8e387985ac7f865d13325eb903f64645a2a..de80f3ee52c40f3a817f229a751909c590161594 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -83,7 +83,7 @@ obj-y				+= sophgo/
 obj-y				+= spacemit/
 obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
 obj-y				+= sprd/
-obj-$(CONFIG_SOC_STARFIVE)	+= starfive/
+obj-y				+= starfive/
 obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
 obj-y				+= sunplus/
 obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/

-- 
2.45.2


