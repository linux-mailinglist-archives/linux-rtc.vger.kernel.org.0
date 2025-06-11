Return-Path: <linux-rtc+bounces-4263-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 441E9AD4B2E
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 08:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8B2517C08E
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 06:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C422236446;
	Wed, 11 Jun 2025 06:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vK+cI8Of"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F60B235BF4
	for <linux-rtc@vger.kernel.org>; Wed, 11 Jun 2025 06:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622497; cv=none; b=OtfwrluwmxScNqA/pisLBHyh+gHszQipakeRNJsRKlwFGZDN/ZUbQULVC0NUtahKHnamQH949jnvqu6Vua/s13qaB0K8PuIU/TjrECMYaAerbE8YKBGmFa4NRTyfMSk0QDQIv8gjAMfH0UoZL8eDo0mHKK1Dp6Mh9X2t3zltl4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622497; c=relaxed/simple;
	bh=vXeTXdr0B9QOQoZjEzmtipvrdS/pdMRjTxQFNr/h+bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ntZKvCZ9XllUjjnDDj7Z2R8608JQMj6ypQc0/ChBMR1md6Rq2lbmExQMIRnljr/eQfp9gKICmW1BwYJ2uBWTvWwpttU7Ov9t0y5EvcX7VW3uO99VWuWtJ0DxBPFpe8js0HD/uhUDzFGvC+XbDO5eWemMVHJGXObvxc1PHDC2FHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vK+cI8Of; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4e62619afso22931f8f.1
        for <linux-rtc@vger.kernel.org>; Tue, 10 Jun 2025 23:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622494; x=1750227294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qdA/ig8nlywJbkEyEpBGSWcEGO8vU+oGS07oZJY25lE=;
        b=vK+cI8OfvWATPZ2uMkNH8/nT6S3mbMlrF5GXvfkMjzA+4N1KeFEIN8eBITSpAklIMy
         IYgnNY59y896Sts/lJx3VhxYUTPY25DUVDoWXy4GW9btHO7QimXPwph5aLzJlBtnK1b0
         wDJwzphO8wnxaxC2B37m5YwB20HhprVqZbHVnKhwai2+0E2CQEMuY3JW4vgvVRIWFmbh
         7vMQM5vnPcD4qMfIFY1SgP+k/xlRHaGsd/MR8vL6WIPYcaSE54VEphRevMf1w1hzlE/C
         BtAFm2f6UyqEEWf34rzzEA92EsamqMlk/ZaJPO/HZ1+o8jZrzN0p99lzqBfEG92MFf/R
         hk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622494; x=1750227294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdA/ig8nlywJbkEyEpBGSWcEGO8vU+oGS07oZJY25lE=;
        b=ED85NY2NMkXxKho58sT9QBHHFbE7pdpSOLuL9bPsqZzZrhX5buv5I7gJ98Eyo8GRFn
         tRr4VYZsDfc3260nl7aEenp6Co6EDum6O2fH8bnQYdgpaYztDXHIk910uodkPjk2DMLU
         WGrBXFaf00CoocF1BgHPorxlFJ5GgOqsELux2/uxjc4v68CcDvDFleqvhw1YDWZ3XMTO
         j+Mzz2NlPn96z+FzVLp3EGfAMUfKHpzQHkK9CZahzRQuUOeEIJXfCoo2tdVuuD48d7ks
         IhgsLwxkxXwXGea2+uBqSeB2n1LCbsPILPdjNkr2+sqxvnjDXayrEinS1vqUuvIMExyn
         ypow==
X-Forwarded-Encrypted: i=1; AJvYcCUuD7EZRjZVuAa73ktCseoQ28iQFk64jZmsG1qZkYiDrIsmd97QvFewJZqk3l/dNl27dctclPTRpR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfPsFUoeGUET4nt0ngroa0GeI3Sjy3FI1GI+yXoDxnPHhENmTO
	n+2vn2XbHDdajzQUp1GamxoprRsSNtBsEOiozy5LlGZMOA1bF5k0CMGMpejLJjM+4kI=
X-Gm-Gg: ASbGncsiQRmX+EwYYd7GEwiVEd8PGwHHpza/V15WkkmMgR1oaelrtHpOccxGXnUKuLx
	yymLqedsMiJgqbh+hxwZ6PHUBcNCxpVc0wR9/X5dgz1wQAcVRMCgSXQvmyC1GEvIAdQ34N/hFnp
	yGJD//yJ7id2uxdT31bKHPNqY8fvCBHygGvVVmFITzd2NAH4viy8Ow9NIQece7fF8p7FTKLvRp8
	xBshsGxtMtbH7+5+9kuUnxRDt0vtvEt7LkEy8LYqI+8qtMopRchmOsjq5XB24xRzt1A5591tYk8
	nzkuLFFZuYw20Ct3XiiseTK0O890zOW6OdBc4Fmt8mHiXkCz7opjlL68C17En0WJAkECvfoYgJ+
	w5Qbgyvs=
X-Google-Smtp-Source: AGHT+IENybnlsYED/rRUm4ZeUok81TSNdUCTJpLATCYwg6GXmHRKMfUyNXPeuvNv6VBY5hxJDw+sPQ==
X-Received: by 2002:a05:6000:26d3:b0:3a4:d7c7:89d1 with SMTP id ffacd0b85a97d-3a5586c5d88mr559699f8f.4.1749622493663;
        Tue, 10 Jun 2025 23:14:53 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:44 +0200
Subject: [PATCH v2 12/17] pinctrl: max77620: Move fixed assignments to
 'pinctrl_desc' definition
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-12-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1581;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vXeTXdr0B9QOQoZjEzmtipvrdS/pdMRjTxQFNr/h+bw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6p+iEceLfzESsCLmaF7f58gqtG4pEf1S04I
 US6TvwJJ1iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeqQAKCRDBN2bmhouD
 1+VXEACLNTYtXHcSiimI4alyjbrbkDm6rHv4lUl4FJTdko8xkAkwphGqySFzctRNyJgI9touCTp
 VTuTb9XwzKvBv7Sz+PhDYKXWHIsu/mi6u3DQtaNf5mVdWT8Ci9eq/+0qUj6MXDgTbBNkGuWOcug
 W1RzzoY2lRp02okPqxXRdpS98elpEls0b5ltngYzUPV3D7ptB3GwD/w4KfWxqbPUw6MxHJmIIj8
 PMDrhhQxLJFw37f0hI/yWSAu85iF1aHaHs2tHxquwLzUUzZ7/+Gms5Zj21PPLjicsE7pcgtnWJk
 ssZ/fi62MsBkqreCcDTkSdnrqgpyFklT+gb+Trfwf02xAu8A8tQ/n6OEbE8tWZg8Pdu/ErxaNL1
 BUXZkKjhl1DGDjPQ5xA9nyNWyIoSHZERD/4iDV9AzInbpP7HBZEXnih1BdhaRH3Fg4uKyRkzYPY
 aha6uvVMscIWmHFwDoFIiFw4MUoXeBbT8sVDumREKH8sw96QTHnBkynPktbnQzvwQDVY6gqftFG
 o01FWQQhxZF3jkGZ0sZvaS4reNuF3D5sZ3nc3M7o85qgkCIaQN9KNG3HCbLcOWQeR5UOk5ePcpg
 6Kox4WMoTkg1O83iiImVLQssq+41bb6nolrcP48lT4q3yXb/tDPgmZdeDWExps/nYyadZXoKvlg
 Ia145EloLsO+3qQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Assign 'struct pinctrl_desc' .pins, .npins and other members in
definition to make clear that number of pins is fixed and have less code
in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-max77620.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-max77620.c b/drivers/pinctrl/pinctrl-max77620.c
index d236daa7c13ebbcaf7c4a8d1a8bed751aa111c0f..acb945a2574368b2e34659a902c34df8aad193d7 100644
--- a/drivers/pinctrl/pinctrl-max77620.c
+++ b/drivers/pinctrl/pinctrl-max77620.c
@@ -543,6 +543,10 @@ static struct pinctrl_desc max77620_pinctrl_desc = {
 	.pctlops = &max77620_pinctrl_ops,
 	.pmxops = &max77620_pinmux_ops,
 	.confops = &max77620_pinconf_ops,
+	.pins = max77620_pins_desc,
+	.npins = ARRAY_SIZE(max77620_pins_desc),
+	.num_custom_params = ARRAY_SIZE(max77620_cfg_params),
+	.custom_params = max77620_cfg_params,
 };
 
 static int max77620_pinctrl_probe(struct platform_device *pdev)
@@ -569,11 +573,6 @@ static int max77620_pinctrl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mpci);
 
 	max77620_pinctrl_desc.name = dev_name(&pdev->dev);
-	max77620_pinctrl_desc.pins = max77620_pins_desc;
-	max77620_pinctrl_desc.npins = ARRAY_SIZE(max77620_pins_desc);
-	max77620_pinctrl_desc.num_custom_params =
-				ARRAY_SIZE(max77620_cfg_params);
-	max77620_pinctrl_desc.custom_params = max77620_cfg_params;
 
 	for (i = 0; i < MAX77620_PIN_NUM; ++i) {
 		mpci->fps_config[i].active_fps_src = -1;

-- 
2.45.2


