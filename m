Return-Path: <linux-rtc+bounces-3363-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36965A4B97F
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 09:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CD25169039
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 08:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2971EDA0D;
	Mon,  3 Mar 2025 08:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jWlMsxws"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6B11EB1BC
	for <linux-rtc@vger.kernel.org>; Mon,  3 Mar 2025 08:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991056; cv=none; b=X//J9DHVGe1Iy4kigdSjXqfcdfjmmyzz8NC+uPQEr61BT3jmgcdV/z2j+Clu4yL4FN/ZksLPvRZfOeR8Fn7MyUMZiIZ5471DqVZogZQ8/SCPFG/NOvEkfrOuCk6ck1fp/xBJoVBy40qFIP9KglZVU0RwDiG9dUyb8Rs4eSq3S08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991056; c=relaxed/simple;
	bh=ZQkQ0v+LVOjnnddsmiqkVeGvaIQ78BApCBN3whw0Bh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jboTWLRb72oNG8nohzjMvcMbmY1558ThBYOSkwC066hWKBU9mSLpsTu6T1rC6BCQti6f3kE/BGLpPZKFOd0Xu8yF1cBeU2DIpTEV2ItpqzoBrw0OswkCLYy10AS6dZUI+hqE+xyM9W9ahtoQ5j3GpgNFiurLLI6v5cuxDc87baA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jWlMsxws; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abf5358984bso254592866b.3
        for <linux-rtc@vger.kernel.org>; Mon, 03 Mar 2025 00:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740991053; x=1741595853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rHzoEXcX3rRgSypgjLl/rpTLfRP49fuHATm+VBKv9lY=;
        b=jWlMsxwsUDdonJkhTqhHJvmcLaMy1EI8DH1KqPBmYNwOKGbMDZ0YzFUW211ZNRN/bt
         VSR8XGrNGFpqhlB61NnOUGuH5wSamTWUCcYHbn+BA9TVfRRq4w/SZ4RFddi6W+q9vMBg
         UyJhH7g1QmdARr7zNXFgwNjp3qI6DvwVxvQnFREZ3joNm2wGQlRq1vIXAwKetKcuVmrI
         lsZxcOBW0kBCWxm9nbJM7LqpQZGZLDhco/wUt7so4WCsUMNO90+K9483EhLNDdCQ88FO
         fZ4QIiMjYS9ntnC60o6Db2zG79kWCai7wKYxwG4Ilq7xfAlVwwtZLZMTvadCRpl4gEiC
         aY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991053; x=1741595853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rHzoEXcX3rRgSypgjLl/rpTLfRP49fuHATm+VBKv9lY=;
        b=ZRFQgwMsclsHjqH/gdHOv42rNSgOtdJlmfMSGCqWSuViSdrb0MTqWkkW5XerENDXWc
         k9ly2R9fUZXNGegg0+F/FngoEx2Nl35Mu8TXGD51WVJ+FKE3Nmw1//HRBjqWiZhbxTsu
         ki8+fEVfM1TDmxrCrMAlk/GKT+gTFsg2Fwzmx6vvzfbPBSm2QMr2OUAD3kU1e5lgXUYs
         orCsX4lTMo/uVmdBjRyiBxr2kOcF4bt9b2STeGXZiTrK7NWvc0M8sEAQ937n2Tg7Qyie
         fblwfHCqgigyXdR60bBzar4LUt19ThAJ3qpf0av4c2thz1hLtfNNylrwQtOs8E9MROcV
         EhqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5enrmbpccqAYq6Ct+GQ0A3UAdtml+leqbWVLq0+wsqD1wOCeVVd1842e29uxx0ohTz3bocGBYs5g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw71l/Gb9pJNdsh8atlGGxKU0+Bjb0Vz8rR4YEHG5m7oU7dw0zM
	sdnqS6p888sOaH62qeoN5XAT63eNEbr9daf93zhbSpkeQHv+oLhgurQfQiOaAfY=
X-Gm-Gg: ASbGnctA7hJJOUz29GMiWOtJub0qhcXfM7KGZKt5GXyFp1f8zzgrmAKaSr/OxPpphUW
	ZE+e3jGD5rRBWDtAHeijirsagyB3VugxXcIdVWFSQGB31AcIz61zWNEvjhNr6/1ymO9nGpQ97kt
	IxL+fDA1JxleXGxC2KaB+FsU0+kqKxcjp6wzAMtzPzeL9T4t5jfhUu2R/efKsy+tG+8vnNqjloI
	7s/dDhlGTCXrG05vOeWbYb8E+h+U2EK66nSKijpjF3C75Xd+AlnZcxEBqdQ+qQqO7OKRax8gq8r
	G4bzHLAgu1l8JUyelj5hOF/K0BiNJZmLhor0Bx5Ll+x5iLpHwRFK3qFA
X-Google-Smtp-Source: AGHT+IEu4SCH3E4lm5pHLGphX1D/WhBV+YCMGBhWUNyZogIyLMScbPiRPIx0Mz9hoI+7dm2HVL+OtA==
X-Received: by 2002:a17:907:97cf:b0:abf:38a:6498 with SMTP id a640c23a62f3a-abf26708c88mr1540344766b.55.1740991053091;
        Mon, 03 Mar 2025 00:37:33 -0800 (PST)
Received: from [192.168.50.159] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0dc601sm780828466b.68.2025.03.03.00.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 00:37:32 -0800 (PST)
Message-ID: <81354810-14e6-4840-9e50-52bdd0e63b95@tuxon.dev>
Date: Mon, 3 Mar 2025 10:37:33 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/21] ARM: at91: pm: add DT compatible support for
 sama7d65
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
 <06b64869f2de4b499835d153411ba30512409168.1740671156.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
From: "claudiu beznea (tuxon)" <claudiu.beznea@tuxon.dev>
In-Reply-To: <06b64869f2de4b499835d153411ba30512409168.1740671156.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/27/25 17:51, Ryan.Wanner@microchip.com wrote:
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
>   arch/arm/mach-at91/pm.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> index 6c3e6aa22606..39644703244d 100644
> --- a/arch/arm/mach-at91/pm.c
> +++ b/arch/arm/mach-at91/pm.c
> @@ -222,13 +222,16 @@ static const struct of_device_id sam9x60_ws_ids[] = {
>   	{ /* sentinel */ }
>   };
>   
> -static const struct of_device_id sama7g5_ws_ids[] = {
> +static const struct of_device_id sama7_ws_ids[] = {
> +	{ .compatible = "microchip,sama7d65-rtc",	.data = &ws_info[1] },
>   	{ .compatible = "microchip,sama7g5-rtc",	.data = &ws_info[1] },
>   	{ .compatible = "microchip,sama7g5-ohci",	.data = &ws_info[2] },
>   	{ .compatible = "usb-ohci",			.data = &ws_info[2] },
>   	{ .compatible = "atmel,at91sam9g45-ehci",	.data = &ws_info[2] },
>   	{ .compatible = "usb-ehci",			.data = &ws_info[2] },
> +	{ .compatible = "microchip,sama7d65-sdhci",	.data = &ws_info[3] },
>   	{ .compatible = "microchip,sama7g5-sdhci",	.data = &ws_info[3] },
> +	{ .compatible = "microchip,sama7d65-rtt",	.data = &ws_info[4] },
>   	{ .compatible = "microchip,sama7g5-rtt",	.data = &ws_info[4] },
>   	{ /* sentinel */ }
>   };
> @@ -1379,6 +1382,7 @@ static const struct of_device_id atmel_pmc_ids[] __initconst = {
>   	{ .compatible = "atmel,sama5d2-pmc", .data = &pmc_infos[1] },
>   	{ .compatible = "microchip,sam9x60-pmc", .data = &pmc_infos[4] },
>   	{ .compatible = "microchip,sam9x7-pmc", .data = &pmc_infos[4] },
> +	{ .compatible = "microchip,sama7d65-pmc", .data = &pmc_infos[4] },

According to the chapter 42.18.3. PMC System Clock Status Register at [1] there 
is no AT91SAM926x_PMC_UDP for SAMA7D65 (which you are dropping in the next 
patch). This patch would have to reflect what the documentation say instead of 
fixing it in patch 12/21.

Thank you,
Claudiu

[1] 
https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAMA7D6-Series-Data-Sheet-DS60001851.pdf

>   	{ .compatible = "microchip,sama7g5-pmc", .data = &pmc_infos[5] },
>   	{ /* sentinel */ },
>   };
> @@ -1672,7 +1676,7 @@ void __init sama7_pm_init(void)
>   	at91_pm_modes_init(iomaps, ARRAY_SIZE(iomaps));
>   	at91_pm_init(NULL);
>   
> -	soc_pm.ws_ids = sama7g5_ws_ids;
> +	soc_pm.ws_ids = sama7_ws_ids;
>   	soc_pm.config_pmc_ws = at91_sam9x60_config_pmc_ws;
>   
>   	soc_pm.sfrbu_regs.pswbu.key = (0x4BD20C << 8);


