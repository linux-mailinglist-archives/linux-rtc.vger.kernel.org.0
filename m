Return-Path: <linux-rtc+bounces-4170-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AA6AC6748
	for <lists+linux-rtc@lfdr.de>; Wed, 28 May 2025 12:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09B183B1AB7
	for <lists+linux-rtc@lfdr.de>; Wed, 28 May 2025 10:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1EC27A129;
	Wed, 28 May 2025 10:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s58b/9H9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82D727AC54
	for <linux-rtc@vger.kernel.org>; Wed, 28 May 2025 10:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428901; cv=none; b=BTfs/gqJWQTcrFxo5L/YI6t5I9G5JgJ0lxvQG8Za6rCKmcFao9j4VTUabHJMPA8D+3iswW8gyILlnzV9TwiGWTjyJYBdpPo9SS0/N+EGBiLvBeZl64+w/kKqgCJnPSHbQhwKQMXTGD0F2xVjv5pFCPxwjMotRem50U/M1Csq+JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428901; c=relaxed/simple;
	bh=ctLoeYbHiiEBT9tiXppJUMjUFh7QHQFzP0xX2rdTSyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e45n7NrlgHT/PmvPo21aOsRLyFiOxcaOMqVrbqzJ/E8rEh4al4Y5e9taSEm1WTito4aoFNyjjh/lbibI1PIfRGEcje0czV6fGvzihOcPr/CwYy6K13nBVqLF6XhISpMlmCksKvJnM9foG+LUkbfLjTjxFfPDRmufT3mpb5awnf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s58b/9H9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso5069035e9.2
        for <linux-rtc@vger.kernel.org>; Wed, 28 May 2025 03:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428898; x=1749033698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5o7kHuq5fh1nhgrBmbItAcmZQfVjyPSWaEBF50baGeo=;
        b=s58b/9H9Xb23FRjzD7gHPlTSFdA+ODYb1pzBnFDfVnrXU3V8L/pMYQiMmQy3NBvmQQ
         iBSI9pWR5nAs6yDkY0er1/PwDI4wzJG7H6dcrpSnGIB7dC6lYpy63yvFudToVZ2orKX0
         +zi8MGsGtQkus0m3ejGLN8PA24IhMjQhaPrOrrVCQBr70H6VRXgG1oEZr9OwouFXnh7O
         fGv3JGzU/dSHEmIFE6PbyGqgHOt1Ecfg4eW7azw+79+fS8CQSjU9h80eCw/FBGI/sbef
         Cageh0CB4d3jxhMHcxWtOQLsaQ2krssaC7fhWRiEWGok/cIEvDcaqawNJwPQ794OubBX
         bnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428898; x=1749033698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5o7kHuq5fh1nhgrBmbItAcmZQfVjyPSWaEBF50baGeo=;
        b=xLz3knUAIz0b34CuwPMT/MmQZUesEYp3rOSOK60twdgl2vYu4AsC62A2VhA7XP9+vb
         z7u5smW7OwIKwYQ0D4KrBuVC5M8syHcvPkGHSOmkbV75VGdcY4N75GAsoqvbuDMRrDC8
         6TKcOalq6Vh6pEuBpsPqBvkpVB3FunrVDdlHZQOJ6Ox+0G+u4cSl1T7HxN1AGziEZDxk
         C0yN9tfbFkJAG6SKDWwfeyMDytQHTV0egbT/hc5G1mBG3pPGJT9YT0jXj7Yr9GJoQ0W8
         YNpfjF22sbPk5s+V4nIzJnm0LbLr6VNnJ+CNDBo5dky4lVIbNJERCIgcoLlRzOWwL84p
         IoqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyVBUcgO4vkiKyKtbF7IHfTvQ8YK5uEroVU9x1JQqDeE1MApj/5Mx9dD8Qsb6dm4aApD1NjCIvjIY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/s3ejCo4vQdZsZ7m9aAgIkG+roCWARbARz533lJCh+JHd3Xad
	6PpCrvhdpYNEoM2IsHogpqUWHOl2RQ81Od2eh18FvqbdRZCkg/sHYAMVZGa7C09yPaw=
X-Gm-Gg: ASbGnctA85OQIF+3SQdZ9kYSp7Yqn8TRR4+TFNviLAMhgV4HGbfCeL8mBgoIxVhhFV+
	lq5Fjqzv8stmt2Q0Wu1nb3cF8SrZUnnADo9WpOZnOkXBXG6ThoheKZGbbZUmIEQiOZmALkDLN+I
	fgWd8KvpAS3/AfOdwItPCz1K4ppp25XPHhiwYhChO9PJ6/CGYna8wmlwpUD4r2SjlPq7n5Gu4ww
	/6UyNfvrD7aBauzIZP32ACCvxRtg4Q3+FeycWljenXP4brLcr6ySQaZ5NglRdhB2cqZHgNZ4iTE
	pqgLHPE1rjzRNPyzpydP+uSQK7rQ6oIXJJlYhVUiW9T8l/0A5ro3BJ4PaiPOb0dMLKxVc/k=
X-Google-Smtp-Source: AGHT+IEqdF3+R9PvjaaVFg6PDyOWyRZc3HR0H7gqLL2irDsUydaByqxkZ9IUn5cux0xSEgLuwczlgg==
X-Received: by 2002:a05:600c:45ce:b0:43b:c938:1d0e with SMTP id 5b1f17b1804b1-44fcb9e409dmr26120075e9.2.1748428898180;
        Wed, 28 May 2025 03:41:38 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:40:58 +0200
Subject: [PATCH 02/17] pinctrl: Allow compile testing for K210, TB10X and
 ZYNQ
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-2-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ctLoeYbHiiEBT9tiXppJUMjUFh7QHQFzP0xX2rdTSyo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhKnpMXQJB0a7WYDcwZWwHu8C1P+bTuhMNNC
 +EXWDs6a8+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboSgAKCRDBN2bmhouD
 11VaD/9bw31tjR68bxVpvaTyp/6cSym928yjCV9vR7oyl3BoFzh4W/a+7D30PLrsKSbtBC0J/LD
 ZSkuCuQRCTdT/n3XZG0T+ABgncoGE8an/aWUK1QeNySdpFSaEb5IitD03FUnLNTrxbziwX2OSOt
 6Z8A1nYodGD43IqazDQ2Xa7koDf9waLjKZ4MmbB8/+UkbSkzvm0UwGsFauOIvDrdj5PPraBwoo0
 W1X4sxPqQbmIu/4DVRh6oGcHsCwbTyAArmCXRUGcCavGlYBMYD0sfBZ14yAoyXbd+TywqhMmceW
 Tgtkyg/cXJ8JinZQIyzaHGnbQKLMukCGj+sTXlEyYG54GXhLmH3szir1Zsww23gOCwDK/qdnObe
 c/31A7IEOIftcgkxejUbOr2hcAttBy7peOBZmeIe2iHS2xV/0B3z4DN69SNuH7YSD06YPSnBrgv
 BPRrGVkzC6QpojpzpZYG1rdP1Mov2N6Xb6lFueCWghnaWhmNte0hYDoOi3sHyHcLTY1RBqCyKVb
 ghPKA7ZSaMhuw3XFjrTUOHMhvO/Qxo44gHjL9XbyoHVDmw2vtEczKKN6madwPnMdoxroiO8Szan
 PthWKLwLidRlevSuV3zpMfPWxCO8gOal4o4jOif7BkNZmL0L1ELFxabGoZqrimpzXrW9si4MeWO
 jCjZimWjAIxLjVg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Pinctrl drivers for K210, TB10X and ZYNQ do not reference any machine
headers, thus can be compile tested for increased build coverage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 33db9104df178e5a3148b60c3c6bd153113385d3..77a5d13e899f8c5251987c2c74df1d05dbd59128 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -269,7 +269,7 @@ config PINCTRL_INGENIC
 
 config PINCTRL_K210
 	bool "Pinctrl driver for the Canaan Kendryte K210 SoC"
-	depends on RISCV && SOC_CANAAN_K210 && OF
+	depends on RISCV && SOC_CANAAN_K210 && OF || COMPILE_TEST
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	select GPIOLIB
@@ -554,8 +554,8 @@ config PINCTRL_SX150X
 	  - 16 bits: sx1509q, sx1506q
 
 config PINCTRL_TB10X
-	bool
-	depends on OF && ARC_PLAT_TB10X
+	bool "Pinctrl for TB10X" if COMPILE_TEST
+	depends on OF && ARC_PLAT_TB10X || COMPILE_TEST
 	select GPIOLIB
 
 config PINCTRL_TPS6594
@@ -590,7 +590,7 @@ config PINCTRL_TH1520
 
 config PINCTRL_ZYNQ
 	bool "Pinctrl driver for Xilinx Zynq"
-	depends on ARCH_ZYNQ
+	depends on ARCH_ZYNQ || COMPILE_TEST
 	select PINMUX
 	select GENERIC_PINCONF
 	help

-- 
2.45.2


