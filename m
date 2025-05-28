Return-Path: <linux-rtc+bounces-4173-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD49AC6762
	for <lists+linux-rtc@lfdr.de>; Wed, 28 May 2025 12:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CBD2A21741
	for <lists+linux-rtc@lfdr.de>; Wed, 28 May 2025 10:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD8927FD49;
	Wed, 28 May 2025 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zjOt7Twp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3FD27F16D
	for <linux-rtc@vger.kernel.org>; Wed, 28 May 2025 10:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428912; cv=none; b=rAb5gza3+cSeOKIYVvlLO8yVcI+52mrW0qfU3Au1cGkAksoGOUg/1ThMPZVu0boqNOSun6OJx9GMf7s5D0qnsULEcxSS21GLJrYAozdTH9KOE6jyWcwvTmhxtIdnuZbjdo39LIDOZ8J2Z+xnYf0+nsmf02MMGtCi4DYHVnmfWqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428912; c=relaxed/simple;
	bh=bPCkHXtxmRdHSBbvdS8jXvx5ZcbYrMBVxN7TAPQmEWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JCMO5bSJNnwQXbvr6DqMuWzphDgnFNn9Lt3u7GxLEpCWC5OryQfgMwyAAyjhdBqo3Tr78X/+p5NHZICqVXlMRp/UbH/8uafRhamhjWRFBf2qCh9LIsCPLud/I6o8W73IOTlX5XCQht/aC/Hbp9DD1FjdM10uHzjof5lqjAC0494=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zjOt7Twp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-440668acbf3so4924595e9.0
        for <linux-rtc@vger.kernel.org>; Wed, 28 May 2025 03:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428908; x=1749033708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCWZ95h3v8faxWII4r+ll4sOFmAUxo+1NhX1BBWmSo0=;
        b=zjOt7TwplyjtC3LuWMTz63Zqnn2W/GXyObT1dpp0nxjjWpTPDZMITtCgYr915qPcE4
         sLCSWtdu0OMqnvMxK6fWKsISmkiUatORKWnDWsfwfeYtXtkXjSxjzd0ZHih/b+uCgYrB
         DS3mwMEYXeUViN76CxUB//dxhqL4qOAJ6Y3BZ30LMFb95jseFpRHSxTiQMrA/AVVV0UU
         xL8Y5JMzjLDrcHiWPMRD2bqoAFkgJMRkVsdW611WVaC6ozCsVonLm5BNRpXbipSLHNya
         9IiYtDt59SCQFXbomIE8o14GVDgGJ3knQ4Oq1EbFRMOJEG0t40ROrZ3qW03QqcM3BInp
         UwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428908; x=1749033708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCWZ95h3v8faxWII4r+ll4sOFmAUxo+1NhX1BBWmSo0=;
        b=COE9XMORIKx+4lx0aRi9jT/MZ4hhOD+23NrIh/H9BWnGxfMGlBvboLKjbY+MngkYkE
         W0HTNdBRSAhIKAQB0kI/M+9fn8pMjDSpMafTVWggI0y96VrX6Jj7hVpbo+SxBIoxgPwx
         l0vpQZkLnud9oLkXaS6z6tGelladNaMVTWrPaFCamVf3jIM5w8s/wJF7C+PPvbpEGiEU
         1jqJcWFDQGDZO6WcI9neIVHdvBjtkKgEQxXcV+eD0Iiy8hA65eUKd1RxBd8Ek1G9XLYt
         CufbA3A68DMMNUzTtvJfn7YT6X53H5/HGr8u6KmioaUrdRgBaP/4vqEj4kU1iMOxbnoZ
         PUvg==
X-Forwarded-Encrypted: i=1; AJvYcCWE/3vcxyPH40IhAzjLaf7GGrhaFlddTo1MZYvsuBUWuQkcNrQSKI71ALL5Vo3i2gUPuzn+x5N3sPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSllbtBTL/ukBFJSI47ZCe2DeFmekQb5C+CdgTs1YVjQ/ep5Wz
	iX9qMPwjbELhBW/z2zknwoLkU3ZT+SxzbyflXPYUXfTEBJXjOt6nB6kvuuRbt9+I2/E=
X-Gm-Gg: ASbGncspXLhV3cJd0Y1xfqDR7RuMPP4EerRRjhauhYKKhSLi8F5ZVXO580avOvZAedb
	NyiVjTrYgxTcQ21Bf/o58RIct1xujepGmGMLw6mmB0I0QZpe7Um1j+Ufq5kq1Hun5RanIQwO4j0
	lzMerNhCrz9Z41rPGGsrqczoYubN1MJl+O4RgzBbbaSF3HFci5P7mfzm8pEodMZNgrgXAGsPkSE
	Jq3vlfV+m8Y+WZ2k1hCA1ZxelWqJStsJlcn8wJAdtSgOrADy7XzadCUMuRVixS64nq+kgsx8a7L
	eV1RGvobN/oNkY15yz6ktTnBswDEInltEGfWfNLefhp5JCfGx5JNKDFaQe0VNRA+kXHUXaI=
X-Google-Smtp-Source: AGHT+IE/LJaHWTe9SYlHoYiKsnsZsaOAKKUrQJlJHOckCVYd00NuFwaRx6BpFbRuXnZ9itlqpT5fMg==
X-Received: by 2002:a05:600c:c0c3:10b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-44c90f4ccb1mr34271245e9.0.1748428907943;
        Wed, 28 May 2025 03:41:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:01 +0200
Subject: [PATCH 05/17] pinctrl: aspeed: Constify static 'pinctrl_desc'
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-5-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3756;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bPCkHXtxmRdHSBbvdS8jXvx5ZcbYrMBVxN7TAPQmEWo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhN3yUYNRVGlDm5GKvUjHRKmpO0NkcKTivqS
 rQ9YFsZsAGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboTQAKCRDBN2bmhouD
 15PsD/wN1dSXzevKC2HHXVm7rrp8PsHK6/O5ksoH/BLBd4VXwlPyIgGgkZ8jbISY8fCS0s7jAvE
 JbaDoYx6YKMIDEZRd/TdeBOLU2GWPzSgWvdOYA4LPr5cATQfbPRHhZIyCpk6FC4PPnfW8vfFrYy
 LKqeFzOpOHKIxR7MrchXNRqtxM+664l1K8Tb3XnT6+ojdbePdy7aXcAe3l7OG76wwg7sTwksB9A
 XcirEY5EnVp9kjB0/fwjQn3HwmrmC5zVzpgyqLm0uNEeDVJmu3CY/KxoGLqtzBfo+0xfopGAmAC
 fZ5m5O68s0ez/Xt46UgSW5XjyxlPGZkkQFz7Ba3qhVhc7GJsBR2ivHY8liIYf+UypZN3cDDN42N
 MyixdpJwa5XFsJnT+SiJ14/2t6Vu20ObUTXCfeto3WTYA6uIFk3QEktZFxNV/MQtBjA7SW59alS
 UdvaEjwa5LNRjWATKwCsWjkKNjj2zvgXhPO/kWHSySyYkAqHCAMtzWuRpLirzgARamkkw7eWkSD
 XXllk4esE/ckh1ZPaVSD4+yZ74jjdqWrNQSmFdzA6C+EA6M3BHIKo/NcQJg6NPBSnex2IGipA08
 KABgrW8+YQC/zSQ7VoZ6RwXHfcNuIMQ0ri/JoENVnFPqdN5ZVSijqUw1jZoLhXuA5LwDkWd248s
 5NOQtmWzYeMwnKA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index 774f8d05142f2d90c238f8e6661eca4685601db7..cb295856dda1244f2205305cf4c505d4ea4a326f 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -2653,7 +2653,7 @@ static const struct pinconf_ops aspeed_g4_conf_ops = {
 	.pin_config_group_set = aspeed_pin_config_group_set,
 };
 
-static struct pinctrl_desc aspeed_g4_pinctrl_desc = {
+static const struct pinctrl_desc aspeed_g4_pinctrl_desc = {
 	.name = "aspeed-g4-pinctrl",
 	.pins = aspeed_g4_pins,
 	.npins = ARRAY_SIZE(aspeed_g4_pins),
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 5bb8fd0d1e41bda799119a67887ccbc277e0f9f4..792089628362a1ed1c3eccd4e46c41a3ac7a79f6 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2845,7 +2845,7 @@ static const struct pinconf_ops aspeed_g5_conf_ops = {
 	.pin_config_group_set = aspeed_pin_config_group_set,
 };
 
-static struct pinctrl_desc aspeed_g5_pinctrl_desc = {
+static const struct pinctrl_desc aspeed_g5_pinctrl_desc = {
 	.name = "aspeed-g5-pinctrl",
 	.pins = aspeed_g5_pins,
 	.npins = ARRAY_SIZE(aspeed_g5_pins),
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 5a7cd0a8868764dc5e3dc70f325c25ba29d50a64..51a63cf92023f7dc7a27466331c77bb5dcbaa9bb 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -2763,7 +2763,7 @@ static const struct pinconf_ops aspeed_g6_conf_ops = {
 	.pin_config_group_set = aspeed_pin_config_group_set,
 };
 
-static struct pinctrl_desc aspeed_g6_pinctrl_desc = {
+static const struct pinctrl_desc aspeed_g6_pinctrl_desc = {
 	.name = "aspeed-g6-pinctrl",
 	.pins = aspeed_g6_pins,
 	.npins = ARRAY_SIZE(aspeed_g6_pins),
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 9c6ee46ac7a096ce693639d88d387b089ffe5239..7e0ebf11af163c90184231686b1e0d9920755d76 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -441,7 +441,7 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 }
 
 int aspeed_pinctrl_probe(struct platform_device *pdev,
-			 struct pinctrl_desc *pdesc,
+			 const struct pinctrl_desc *pdesc,
 			 struct aspeed_pinctrl_data *pdata)
 {
 	struct device *parent;
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 4dcde3bc29c825cbc6be954dae9a654a310b4cd8..28f3bde25081b2c8099977129acdcdfb3e4b1dd5 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -102,7 +102,7 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 		struct pinctrl_gpio_range *range,
 		unsigned int offset);
 int aspeed_pinctrl_probe(struct platform_device *pdev,
-		struct pinctrl_desc *pdesc,
+		const struct pinctrl_desc *pdesc,
 		struct aspeed_pinctrl_data *pdata);
 int aspeed_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
 		unsigned long *config);

-- 
2.45.2


