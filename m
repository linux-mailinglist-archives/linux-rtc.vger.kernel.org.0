Return-Path: <linux-rtc+bounces-4257-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 750EDAD4B15
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 08:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD20117AE27
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 06:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC335230BDC;
	Wed, 11 Jun 2025 06:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oPcV9Wrx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163072309AF
	for <linux-rtc@vger.kernel.org>; Wed, 11 Jun 2025 06:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622473; cv=none; b=bp8+bhfv82hE+EgTVWJtO+hdecCelvJihYg+AkZh5H1VqrIp2xAD+058Fmc56Jdcb+6cU7rO0LwIh6tAuKu9HnmK+o1ZRZIoyCeRSE7YX10xwifkjDa4lVZ9GyWRRg6lRDof+K/uq47h9mzePVlH5hQFV0+74kpSHZo2Mci+j88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622473; c=relaxed/simple;
	bh=8vGQpzjfE6u+giOJnSmjcfHXKBBVmk/PFMGclk6BN7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D4ZBg1MyjxoTEoDBcKDLOmkurE2sNs4u7FsRAjAYkacrCTTPiUnKVRmj3AfCQr6bc+250QOO2KdrEdnBsDdtjj5/MOkKU/Swr5twzUzwi8LOISX0lvcFupUmgcTupW1w9cNhJuVlBrkOzPLwXjYP/PHHr5zX/iUZcx4D07xJUlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oPcV9Wrx; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so32818f8f.0
        for <linux-rtc@vger.kernel.org>; Tue, 10 Jun 2025 23:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622470; x=1750227270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLYPwIWcNIonGvSRDv3RvBARXdaS/NHzLx8nwSb9+Xc=;
        b=oPcV9WrxJlTR3Q1mKVOWRV4Q8gvcY2/3qDxAwfYaVDgIZl1/y9kZprUZHHCnpbgSpY
         nGzmHSkRDCBjYlYlz47cL0vUgHWNWF3nAEeywyNLRFDyJU6w8nxEAtDVWTlpCa7Iwg5V
         G3KIMjdaqubKuv/AwIX2caoPRCOWQfupVAL17aGEDLNsoImFiLIwx1m2DF3kG8upQwew
         oObGhAmxh3z8jMVGp/c1YmvvHF2T6ju7lCDxmrTQ3lJY+LxwdH498xBlkY52cN6KKNO1
         YeSggFYONjG9IR35QMxmODUJH7WHk6Jihb5nyJKXr7EMoAnRrUq5WU1CBnSGX4IMDK/7
         g3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622470; x=1750227270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLYPwIWcNIonGvSRDv3RvBARXdaS/NHzLx8nwSb9+Xc=;
        b=PMFghIP3HX13XFClJpVMbDsl75KZU1wSvlO30MSIbCc9dmfuN1V7LgNLdQB0k2Pf6e
         G9BkghpzJ3sXmDeTlvA1OSq6PL/SDAD1Yo9KRbAkF36QBHknITBFa3RKobmbs8i6e2WK
         cFnDys0KmJWKlIsvZMR/aMuaXS6w83aAoeq8xBw1zl3x4TG4q77W2CS62TAyUYjhJsIT
         e+464RCdPtQeojFcqv5PeGj7KFtcfatba7fNGWjB91ytSEeXMBJYduSy5+BskuZ2UK/G
         aYekHmy+PzERzJqVRidI+ZyZJxUqhZamUfGhQqIMEhQxec2g1qfx8wfILZJSCPgkMH1l
         U1/A==
X-Forwarded-Encrypted: i=1; AJvYcCWIBoj0/KOOuAvABeu6roqjYo6IsT87y9oTd/RCKsB4zNIvGQzDcu302YZbbWuzo0Sxy9+Vbb1xumM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsiaLCq94tWNZTn7stOAd0TTXhk7A/BA4oNmVrY8qi5BkIiEGn
	yb4cN92nt60C4YRbZ+riFPjM28VhZJM2ZV+GsMBGpi0Lh0NQR/p93dJGdQYU5y3edwI=
X-Gm-Gg: ASbGncu8nFC5MZfAFL3qqudCGfTCORW7x2powGOEq+UhwUV8TYhbSdGQ6eXmcqGbNd3
	iwW3bIudOidfiU1ixoZomVNkQEr9CP+wNh8a5bZC1vufiR56Q8fjI5QDoNW08Y+2X9JHU+jP6nf
	m991TCONCr6VUR3ZTWDnT7FYlr1j6ZBICXvDAVlaCXmyZCHqQ/gJx7xfJo0AThEiePW2m1nWtir
	YFvOg3Q+FdWq+QPs6PaRyCfH1stR36euBns5A+Oj/T9tVPT2AnDjPL8+Nu8TyNEkJ09pi7PfYjg
	0SptMg8jUkTP1GocEilIIhAk1MDAMwqKf8bzklT8Mfruevmj2RSD2OOUJjztVApnduhJg8IIDgw
	XM9dwLBIxQ4ZsGt8Qxw==
X-Google-Smtp-Source: AGHT+IFZtxBFSjLuR6Ffe38My2u48aEsiQUnLVmgKKUP0ueXHo6YNiVvlCk4Ba8Qu3oZKGPSY/KEKw==
X-Received: by 2002:a05:600c:a413:b0:439:9a40:aa1a with SMTP id 5b1f17b1804b1-453248cd75dmr4600935e9.6.1749622470317;
        Tue, 10 Jun 2025 23:14:30 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:38 +0200
Subject: [PATCH v2 06/17] pinctrl: nuvoton: Constify static 'pinctrl_desc'
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-6-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8vGQpzjfE6u+giOJnSmjcfHXKBBVmk/PFMGclk6BN7Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6jcQ29NFFFK1Aw5C+7sI3DG40NeubIuVWQa
 M6tf00GyU2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeowAKCRDBN2bmhouD
 15qaD/988iyCPoqH/pBfTs7tUsVVV8Mri+Af4YNRSY86TwdRTqSCMO+0wpaUw2BeuKynQCs8ZSd
 v6c7y93x4QoZGwxvtP95m0lKxE96njRQ+2yEWLJHOZ5p+C5mkjTvNblw1G7iInSJsP8rchVDl40
 r0DH5cTiR5PBxP7K186nP0Ksdm28krr1TsC3HQuDiVbji6eJfxvrXFshWVpM2vWQQyRAaSBHkDt
 E449wE4IWwnye3jEhdetRCPEH0vVCuxuckhvO5Vw1XIoFHAIl6iko4DqbVzJmGnHroj1mHJM2eK
 53tzMUWNPCBCWcfu/jCo575CcJe3R3/LZPdj1frXSS9kau5xnfvQIhVXK6f5KxCG0CUM0qtlDlD
 p2RKEt6nSfk1il1nM/A8aWjhbK5jTiATzFEcXpIXJd1N5WccFnzR48dAHp+va8BhnC5QLcRsP9q
 vxTxvgB8pURZn0/cfKX2f7Sv0lmKxzrl0eZuS7H0xldoBa/ROi9lYTpG1PeuveKpRsR9fXMOcXM
 Ceiw64wJn2c7ndksjN48oBkeKzcjljo3MU7m0OLpv4qwb4tbUYCfNQJuDAyGXt6/aEvJwIL166W
 py6Jh/QFYmArWu9ggfKh/De2c0G+LzrGQixxWZ833ZoF2WqmwpQcZLhiBUhmtqXEXnSepRVMt7k
 k1gji4LlRC8ocpw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index dfd32feb34286b7a4d807e9033a11f507e277dce..b8872d8f5930ad931dad208afec4e08a23c3d653 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1817,7 +1817,7 @@ static const struct pinconf_ops npcm7xx_pinconf_ops = {
 };
 
 /* pinctrl_desc */
-static struct pinctrl_desc npcm7xx_pinctrl_desc = {
+static const struct pinctrl_desc npcm7xx_pinctrl_desc = {
 	.name = "npcm7xx-pinctrl",
 	.pins = npcm7xx_pins,
 	.npins = ARRAY_SIZE(npcm7xx_pins),
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index be3db8ab406c416f0709d06eb864e33e3208541a..3c3b9d8d3681c64c21927615e1bb49f157f156b5 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2299,7 +2299,7 @@ static const struct pinconf_ops npcm8xx_pinconf_ops = {
 };
 
 /* pinctrl_desc */
-static struct pinctrl_desc npcm8xx_pinctrl_desc = {
+static const struct pinctrl_desc npcm8xx_pinctrl_desc = {
 	.name = "npcm8xx-pinctrl",
 	.pins = npcm8xx_pins,
 	.npins = ARRAY_SIZE(npcm8xx_pins),
diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 4264ca749175a2ce0f3603c1d7aa271d98e6cd89..8d8314ba0e4cb55db2b1d3adf2de07e6fb93c279 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -989,7 +989,7 @@ static const struct pinconf_ops wpcm450_pinconf_ops = {
 	.pin_config_set = wpcm450_config_set,
 };
 
-static struct pinctrl_desc wpcm450_pinctrl_desc = {
+static const struct pinctrl_desc wpcm450_pinctrl_desc = {
 	.name = "wpcm450-pinctrl",
 	.pins = wpcm450_pins,
 	.npins = ARRAY_SIZE(wpcm450_pins),

-- 
2.45.2


