Return-Path: <linux-rtc+bounces-4198-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2F4AC78A6
	for <lists+linux-rtc@lfdr.de>; Thu, 29 May 2025 08:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D29E04A3BBF
	for <lists+linux-rtc@lfdr.de>; Thu, 29 May 2025 06:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4544D25487E;
	Thu, 29 May 2025 06:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WSOkXg5e"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E09121325F
	for <linux-rtc@vger.kernel.org>; Thu, 29 May 2025 06:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748499990; cv=none; b=QyDOiSWMGo20al6mzhthhuGnGSYZ6xd6UezivVweaL4Y7Y6GgQHgi3qx1ii6GENQoyIijVZGph0uiaqK+lid3e+D6vlNHg9enMR3W6YF+IkkHJkCy5VsN3KJy45h4MVI98oInQMBUwO50shI4GOZ2ss7HnjRjq8ElElKR1TROSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748499990; c=relaxed/simple;
	bh=JELwsM4iALKvFPVxf/Brir7616QfPWrF93PbUJN3mR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rCAS2tR5Jj5KkaW9+xctx93epYRl44/4oTmXY3ZjTxmRIE8c9a7NJ1lX5VeoCOmbT9VSEsBPl03BXv2WrW9Cu7szm0NxmUGD9ojeyYB3IQJiTSHtIXG2tXFnQNqdq7oxXDnHD8hHXyReqsIQYMC+g/P7xGapDjP93Y/9+Uh7iGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WSOkXg5e; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-604f4127399so118052a12.2
        for <linux-rtc@vger.kernel.org>; Wed, 28 May 2025 23:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748499986; x=1749104786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+2SWtTNE3E49MOlHnO8uVeg5xT5IQxhtgIcjK83+ABU=;
        b=WSOkXg5ewtHwee9YahJlde52FSJMdlGkBH/gyhGvZGj9b0WGxyRzC/tk7pmDf+6WlC
         VjmxpR+1DM6TssIu1ZHj3MINnOrJfUllSa/snXty8yd7Y/UFZMzZS7JgvBwB98COOCUQ
         4Gt8E6w9ZOXsTYg3mDCYpQ0gYklVvd2gFeCt/OIYdYQZ9VDhUFhAZOtj54Uee4+BCx/p
         IZks4ArYScFDVBlK15AkFY8KbByt7aCbK5cGKVcAY77C+naiJ7XawTd4IiDEEl/rZWvY
         +H2B9dHmwWCXsxSnCIZc/ZK76Ybpeg3kPubkNEq1wJ18Af4rbdHPjGZq9Y/PfmuJ0lE2
         oX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748499986; x=1749104786;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2SWtTNE3E49MOlHnO8uVeg5xT5IQxhtgIcjK83+ABU=;
        b=XExVYT6jcUlBzwFnncIJreMrGgHulHl1wWH+9oeslfG76TEAYl4UPd2uKN/5QANjXu
         0MIjhYUO47L5P1NJ/CkER7E2FhkSEvhkRvrgU0bGxOa+KPkSaUs26DtuBIYX7ysCiX1k
         ogmhB1OKv9gYfor2/DzvvX6l+fXz87CogcCeU5JPtMlIQRT9EHr8KrAYnEQxNrLH5AqC
         4Uo/xeVvisAqoGmi0Wg7i0oqM49+lZMpqqVg55/Q7THgc6gRmIpwrUoYMQrP9SEy5WIE
         1S89HPWImH/Ro5MpDbIpjtNoYx58iRZZTQaIZZibBg9mW3Q1pRcU+9InZpZl5jMkACuq
         lutw==
X-Forwarded-Encrypted: i=1; AJvYcCVS+9wVZfKQK2kM82Uk5qufUuC/WtTTrztIYEHadNg6tnKHyYCgXt5CjP22N6u0rMobefgslJojgqM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5VUKsEITZOaCSoLSkO9CdmS1VD/+g0eTu4OB9HkLrGMfRablI
	7RPEloTi0DfI0J3wFNYscVHW1i4Wz1otaoGmvPGVZuNF10Yrzgj/jvgiYF34EhKHkik=
X-Gm-Gg: ASbGnctUAG1LsgUNvdJm2xl6s9aVWXCnqMIaTkbMbdlZwKVK06YE3dmlJx7bEztHDpp
	FgjNh/y0mvpHTZAfVJK2zkvzD6p45ZMBamIfVUH+A/3U8GwOB0ago8KWsVZ+7CpqF8RjvLdtuGA
	iLQYfmdzftJbrAWpitcWhVGdXRGm2i4KwCQR6ObyWEuMT0w5Rw/x6kXcBd/ZI5IHZ6mI9jhFGAw
	0FoQTU0apPlJTcNclhvb8iQBzakladILbEFkC6zmeOKFzzMLGOJMSHTMaoMRvRI7t+rNc1GE3mQ
	vmdCnusnw4ruP6upPwMnIvnM9DNjj5G9R05zVWTIbfi8Hdqm6eYw16hZyyxtCqbMu6ITiVU=
X-Google-Smtp-Source: AGHT+IGlMDzn+QG/07M9P/X4G1UkWeHWA61AWrk71VubiDANJ+WF35EJENPRBZsOw8VSgdWIr7Porg==
X-Received: by 2002:a17:907:2724:b0:ad8:882e:39a with SMTP id a640c23a62f3a-ad8882e03ddmr319125766b.8.1748499985639;
        Wed, 28 May 2025 23:26:25 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6aaf5sm79818366b.183.2025.05.28.23.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 23:26:24 -0700 (PDT)
Message-ID: <6bb4f8f7-ef95-4f10-ad94-027fa18dada3@linaro.org>
Date: Thu, 29 May 2025 08:26:21 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] pinctrl: Allow compile testing for K210, TB10X and
 ZYNQ
To: Linus Walleij <linus.walleij@linaro.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
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
 linux-stm32@st-md-mailman.stormreply.com
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-2-76fe97899945@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250528-pinctrl-const-desc-v1-2-76fe97899945@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2025 12:40, Krzysztof Kozlowski wrote:
> Pinctrl drivers for K210, TB10X and ZYNQ do not reference any machine
> headers, thus can be compile tested for increased build coverage.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pinctrl/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 33db9104df178e5a3148b60c3c6bd153113385d3..77a5d13e899f8c5251987c2c74df1d05dbd59128 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -269,7 +269,7 @@ config PINCTRL_INGENIC
>  
>  config PINCTRL_K210
>  	bool "Pinctrl driver for the Canaan Kendryte K210 SoC"
> -	depends on RISCV && SOC_CANAAN_K210 && OF
> +	depends on RISCV && SOC_CANAAN_K210 && OF || COMPILE_TEST
>  	select GENERIC_PINMUX_FUNCTIONS
LKP reported here issue, so there will be v2 of this.


Best regards,
Krzysztof

