Return-Path: <linux-rtc+bounces-4281-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1319BAD55E7
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 14:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6B2F3A50FA
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 12:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257AA280CEE;
	Wed, 11 Jun 2025 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="a20UDsYi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C1D22172B
	for <linux-rtc@vger.kernel.org>; Wed, 11 Jun 2025 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646156; cv=none; b=j4CT7aZaS99xZomK6DP2Co9pWZOVltyMnW3SDFy8jX7QYMmEsVmk4bhMlMudY7FRCYSUvERWKcI9pJeHJEvcM3rpchP3QfHeJYVd+NtQDiMKfMKe1PkoH6N5jbdKJ46YMOJyCC/fvZ+xb8uTEFspdFo+P/iawdpEspajcU+FcVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646156; c=relaxed/simple;
	bh=JEL5rHgZNb7DAsn6xBRypsK6BNQMJX3AEL99ZzoDNpA=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKbnWv1oUwlJPZ4t0eW4QLHSl7bV3PeHS0OhQYEGnyRdxHC4F86Qe6lCiqqKqLm3Xt0KE+AgSPWebWyihehHDIPS/1zQXhgOlIl/4MFWAOCiwpMLCB0ofv8y11k1CcQ7LO5uXHGEDa6X4sWwgdjTDBcWZ2SWHcQQX/x/4FMz2yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=a20UDsYi; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B857C44709
	for <linux-rtc@vger.kernel.org>; Wed, 11 Jun 2025 12:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1749646141;
	bh=bELfz3w2j893PNHUaLtbdQ42P6gz+Z983PYtPwmORCE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=a20UDsYi2qY6HfKd0ZzRlNFs5q9bSATI67LFDqW7k9VCeo8Pzz1ntvfqvBPk84gNS
	 TtvsigjkOUdlMnT6/2zFeVlbqp8YPC0ErnLHdBpT1VVyMKVajZALtwwN9Go2SlruAD
	 DgXbPSedT/bERJb/w+rtOuqMk1wlf15a5HDBgiVpFCNm9MjO/iX081rDvsNVaCrkI5
	 9/vuR7AWTgVC5l0yKeypcCULMzrnyc61ti6WR/2wm10LSob5BPtWE9Top8UeS9/CSW
	 fedML+7o8c/yamObmkxmytfqHfmYHEGsFDHrLiHDGm0Ke746QC3Y8HXqD1uR6QdQwu
	 sBGB9kituaXMg==
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-2e990e17650so5728914fac.3
        for <linux-rtc@vger.kernel.org>; Wed, 11 Jun 2025 05:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646139; x=1750250939;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bELfz3w2j893PNHUaLtbdQ42P6gz+Z983PYtPwmORCE=;
        b=AN0aX4IZ1ME9YrTSNy5ZVIpGutEW2RSrfdyvnizj2XVxSZRBN7V4GreBOE4MFTRPdq
         7Iumqe40BIcQp0o3Li/vj9pvg3pGYfp/8knjPrfkI0djTAg/8eS/YpbYXbOb4lx5N1Wx
         j3pOiZpGxQElYKorCa1RdJQPGCoCcFfdctMWPOrlcoUheDSYdiFVS7gSo7pwBolXW70k
         skodkKNWUnKyI9KjASvyVJkB3K6aqg5Fw29WIa8tnSBdRp78BanbLWtH5hq9Ufpa1+89
         RZcq42iAk46sFR9/5dbDndd1Zcl4h/DTISRJbTKWZXjdCSvYZGKx1Zb9nh4A98pTaU0P
         fNyw==
X-Forwarded-Encrypted: i=1; AJvYcCXd8qMd8MaGcXWOdhFiQBnAKUmm2qmhRkahjGZKqR0cxK0lnTnau11It9cX0SPdRKo8SW9UynHaAqs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv6d+ucRjzuhYRrWWlEeclVK0yK4+FhLlBd9M5AkwcgdLRJKKZ
	iO/CHSGuRhQB9BMg0WY3Jel7UCNYp4MyxJj8/EStlxqosv0SXVQmn1VzS1mbkfRm9cr78CYgEjZ
	A+szrIpHI9KEUXNaf7rBpb0cVqsSUDnP8B0yvNhqgI/Yst8p3jWO9CHVY1xncYVK1m6dkfmdQFt
	hokNOqSbSt8pXFfCR8BFhhx4L9jJiybJtRd+1usf9xVlZLb23NRBIc
X-Gm-Gg: ASbGncugRtGorHGBXtbd1+BZ4VpATKK5+NZtVjM7uwn31kRJ5sjrARDuBZ1WYHk3QQ6
	yRiNZJzqfXEgxtfEceuqJzDNN7l5EhUhdALgn1oiV3kdRk2TgZLh1KzkHwirSCE2THdu6DKbkQp
	7sPQ==
X-Received: by 2002:a05:6871:e803:b0:289:2126:6826 with SMTP id 586e51a60fabf-2ea96f18fc2mr1940863fac.30.1749646138973;
        Wed, 11 Jun 2025 05:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzhqyM2kCCDhwaEPz02MLETIROTaGu5WeJENkIMCzCu3hfLe4ldyitgFfsfYyGdI6dZNlApiM1ratiR1ypk/k=
X-Received: by 2002:a05:6871:e803:b0:289:2126:6826 with SMTP id
 586e51a60fabf-2ea96f18fc2mr1940818fac.30.1749646138634; Wed, 11 Jun 2025
 05:48:58 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Jun 2025 07:48:57 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org> <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 11 Jun 2025 07:48:57 -0500
X-Gm-Features: AX0GCFuz_RtY5rxDREJdwFYXLGRQkyQfytWb3LifI1_It-SfpAfrMZfWta2TVOY
Message-ID: <CAJM55Z9WzsxWGmQYH05hSisigTRaHuKOn8g3AsLJ9h6Womy2dg@mail.gmail.com>
Subject: Re: [PATCH v2 01/17] pinctrl: starfive: Allow compile testing on
 other platforms
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

Krzysztof Kozlowski wrote:
> Always descent to drivers/pinctrl/starfive/ because limiting it with
> SOC_STARFIVE is redundant since its Makefile doesn't build anything if
> no Starfive-specific pin control Kconfig options are enabled.  This
> allows compile testing on other architectures with allyesconfig.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/pinctrl/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 65dac8e387985ac7f865d13325eb903f64645a2a..de80f3ee52c40f3a817f229a751909c590161594 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -83,7 +83,7 @@ obj-y				+= sophgo/
>  obj-y				+= spacemit/
>  obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
>  obj-y				+= sprd/
> -obj-$(CONFIG_SOC_STARFIVE)	+= starfive/
> +obj-y				+= starfive/
>  obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
>  obj-y				+= sunplus/
>  obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/
>
> --
> 2.45.2
>

