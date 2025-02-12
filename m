Return-Path: <linux-rtc+bounces-3172-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A18A320CC
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 09:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EA343A60DB
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 08:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB654204F78;
	Wed, 12 Feb 2025 08:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="J7qg5N4h"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8431204F65
	for <linux-rtc@vger.kernel.org>; Wed, 12 Feb 2025 08:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739348444; cv=none; b=kW/sk6HDCJLOp1WX/Sj7Slfq7UGIhVjy94jxdQSnHwedBkDBpf9QjjkQGmOOY5XWFXbwczNEAogmeCK074AFtfURUQosogBiNawTkt03Or70TYZI05ldULNUTTtoA8o4JEl7g9rM9tiZsFUL184g215iwC4P3cBM12j/fUEPhlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739348444; c=relaxed/simple;
	bh=S4hSIPOftNB6lFWm7JsVPSQO1ZY84MmI5zfQTDiKGH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXB9wxxCCuRHXnuWOai5j5ZncpWU9gO6A60RZpqDmNaTQU5n/8gr0LJAEnMtD8FX01FSjCEuzpWUGA8tt+REWk+Oe1Jl1i97OH5YcY+xnjKQdm2jgXU0ckh2LM7YHLwSQ32dzLqNzw3Ro3BQrv8SyjavJsjqy1z38zdpk3iW5qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=J7qg5N4h; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5de5e3729ecso8048354a12.0
        for <linux-rtc@vger.kernel.org>; Wed, 12 Feb 2025 00:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739348441; x=1739953241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2wN5plf6DQoz8MXbMzn7OeAYAYu7hV2vZ8E2rhA+6WY=;
        b=J7qg5N4hXNRd0C7RFimsuMdLfm8fFKbhgdKZMgQuZfOIdaz6wAd1fDkVbk7AnPH8ib
         FLc659FatLAMaAz9q60Qs9zg9oonB0OzFJ4/cxLtMQsdhWbsRBm5x2SKXUe8cO23Zr68
         qQlZJiqhr02BSzauNG5zL1GVQHEmY1VM6Osus1dS6k+FdiwQfnuaMJzEs8w/edznz7rK
         zvalqbHWqXXetBWyjRMT+sBSUND2VLzxjwry471hd2E5Utw1YjeF/urBHNXTxC86zzn+
         2bWgGVra2EgR9h0hq9d5cyG7HCM/Yyt/P+Y2mvxlZO1RKYhlbKuw9bOGrA62Bqv9MIo+
         HQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739348441; x=1739953241;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2wN5plf6DQoz8MXbMzn7OeAYAYu7hV2vZ8E2rhA+6WY=;
        b=NA9Kb/zksC5Ne1JkxvW9lANhKTPKV5lKO45Ic0uozZ+HcDBe/tQ+w7rkG8i3JIu3M2
         dcCLJrBucOKDAH0uUW56Wi+fm74dljzY/EPNyH0mJNFei8mT0pueT2TEURElIPpFXSOF
         jdZMAESWWcMEB5QgkqDcLX4gQuAsskJJ3avCwg+dulQFvkFE7aeCXuPwQrR3hKOeCd8V
         DdAcSz6XBjuawcnYlc7HMe7Nu1DisQXeleDHey+9DErIAchgp3WLjfQl4Cb/pDxuqR0h
         p5/zTtz4XLSoa7HTZrKu/+FzPV4zwc9OBbi+YZfZnHPSAER725Bt39osLnCyv3RV9T1P
         H8ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM2hSS3Nx5tRVpn0TJ9g124y/9pR8PgswsGkd+mOA0guVOyBKaMScROcDogZWnopiaE606KX0vmzM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpzql/GyMwnq0ZpsjqOu951r2VFKb5vV03lbIfA6WG/UR32p28
	DqR+Tz6r6flHLK7Qw2PhvUU+LV8sufQ8VetpDaQ3ibiY2x2hopWCqzwO2CGAUBY=
X-Gm-Gg: ASbGncuDnrLRB8OWpKfeHv15iudeCT/j96KeFcGgGM6JWBsQC57hAL24PZuqrapHCLJ
	t6+u2waYhrctL9yh7TgX6gnEcebXAK6hRDGzZI/Z6tl76qviR2/xTes8hfVJ1ihaGuRWv8v2g3A
	RGFYaSP4LETRE2u866k1iiNQG8AKuBVSNM0P03Cws+YTJGZfW7g+JnBwGz6p38HWxA1g8TspTPQ
	UemyR+IAST5NtSmc8QAoCwQpiKd/6xwLjCxZyTov5Nupith8IKK9WN8Hhro/D1MjpWKxMaXzFXd
	+Jg6ksLG5K1+QjSfP9UgqUM1
X-Google-Smtp-Source: AGHT+IGH5sEhr0U+ODZ2ybXw27QQ2etp37E5mEcz8CPyECrALs3n5tNlB3o2g80JXIcC69CgqPxvTw==
X-Received: by 2002:a05:6402:40c7:b0:5de:6bc2:7bb with SMTP id 4fb4d7f45d1cf-5deb088ebb9mr1358535a12.17.1739348441007;
        Wed, 12 Feb 2025 00:20:41 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de61830117sm7548806a12.6.2025.02.12.00.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 00:20:40 -0800 (PST)
Message-ID: <202c1e0b-f17b-43ec-918c-2a4460a666c2@tuxon.dev>
Date: Wed, 12 Feb 2025 10:20:38 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] ARM: at91: pm: add DT compatible support for
 sama7d65
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <a35bf7aece5f43f2517f2a4082160f47ef2acb32.1739221064.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <a35bf7aece5f43f2517f2a4082160f47ef2acb32.1739221064.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10.02.2025 23:13, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add support for SAMA7D65 new compatible strings in pm.c file for wakeup source
> IDs and PMC.
> This is the first bits of PM for this new SoC. PM depends on other patches.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> [nicolas.ferre@microchip.com: split patch and address only the pm.c changes]
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---
>  arch/arm/mach-at91/pm.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> index 6c3e6aa22606f..1eec68e92f8d8 100644
> --- a/arch/arm/mach-at91/pm.c
> +++ b/arch/arm/mach-at91/pm.c
> @@ -222,13 +222,16 @@ static const struct of_device_id sam9x60_ws_ids[] = {
>  	{ /* sentinel */ }
>  };
>  
> -static const struct of_device_id sama7g5_ws_ids[] = {
> -	{ .compatible = "microchip,sama7g5-rtc",	.data = &ws_info[1] },
> +static const struct of_device_id sama7_ws_ids[] = {
> +	{ .compatible = "microchip,sama7d65-rtc",	.data = &ws_info[1] },
> +	{ .compatible = "microchip,sama7g5-rtc",        .data = &ws_info[1] },

There are spaces b/w , and .data

>  	{ .compatible = "microchip,sama7g5-ohci",	.data = &ws_info[2] },
>  	{ .compatible = "usb-ohci",			.data = &ws_info[2] },
>  	{ .compatible = "atmel,at91sam9g45-ehci",	.data = &ws_info[2] },
>  	{ .compatible = "usb-ehci",			.data = &ws_info[2] },
> +	{ .compatible = "microchip,sama7d65-sdhci",	.data = &ws_info[3] },
>  	{ .compatible = "microchip,sama7g5-sdhci",	.data = &ws_info[3] },
> +	{ .compatible = "microchip,sama7d65-rtt",       .data = &ws_info[4] },

There are spaces b/w , and .data

>  	{ .compatible = "microchip,sama7g5-rtt",	.data = &ws_info[4] },
>  	{ /* sentinel */ }
>  };
> @@ -1379,6 +1382,7 @@ static const struct of_device_id atmel_pmc_ids[] __initconst = {
>  	{ .compatible = "atmel,sama5d2-pmc", .data = &pmc_infos[1] },
>  	{ .compatible = "microchip,sam9x60-pmc", .data = &pmc_infos[4] },
>  	{ .compatible = "microchip,sam9x7-pmc", .data = &pmc_infos[4] },
> +	{ .compatible = "microchip,sama7d65-pmc", .data = &pmc_infos[4] },
>  	{ .compatible = "microchip,sama7g5-pmc", .data = &pmc_infos[5] },
>  	{ /* sentinel */ },
>  };
> @@ -1672,7 +1676,7 @@ void __init sama7_pm_init(void)
>  	at91_pm_modes_init(iomaps, ARRAY_SIZE(iomaps));
>  	at91_pm_init(NULL);
>  
> -	soc_pm.ws_ids = sama7g5_ws_ids;
> +	soc_pm.ws_ids = sama7_ws_ids;
>  	soc_pm.config_pmc_ws = at91_sam9x60_config_pmc_ws;
>  
>  	soc_pm.sfrbu_regs.pswbu.key = (0x4BD20C << 8);


