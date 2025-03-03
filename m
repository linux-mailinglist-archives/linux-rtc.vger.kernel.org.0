Return-Path: <linux-rtc+bounces-3364-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E95E7A4B985
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 09:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD5E53A8FA3
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 08:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C97E1EE006;
	Mon,  3 Mar 2025 08:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GTwMmdPn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293C6645
	for <linux-rtc@vger.kernel.org>; Mon,  3 Mar 2025 08:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991067; cv=none; b=o7f1/06+bfMF/RwV3cTsGUmBMWIu1ZAXFVtBLsHCwuZeFepNQoKFCltLCY/XIXUIk/0iE/LD3Cj3WTSxW+n5JbS0+YIQnDM1v2L6scN8mGmfkOr3oODOhQ053pkyOxBY8ZtpGm8QN/0h8TDf2VvlUUWGVmG9haobgy/JJ1ruaCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991067; c=relaxed/simple;
	bh=RK+QYQOjVVok1aZddoO9G5Ba4alVGQm4Od6mXZJOVrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJxFRBJpwnyI0Q2fu/2tk5GRQnl7XGP9lcYsMhldraIGLDxsIZY2Fc9Ok8yivuHAsaRHBBqi4tdj2x8o2bZ2r9RUIMDMP+lMJlv8sai3GdVKGcmwbON7QzZ1HI2sSgtYDPcYGHq3SC0wj0S2TxwrK3Z9OshQVmCJjz4Qrwfumhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GTwMmdPn; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaecf50578eso790469466b.2
        for <linux-rtc@vger.kernel.org>; Mon, 03 Mar 2025 00:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740991063; x=1741595863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=088gCiVsmCpfljLz/WNF5os3OZWs6Dr62hIApojY3d8=;
        b=GTwMmdPnOt4JdMYnuZd0BMPrJfhOGVMFGyaIt30eGyGKH88mrDBAzuCfb/8W5gXcoy
         Fi0uy9lBo5b+sX6jQwzO/TDHvHWK+HQ1iD2HimnqoKKc3X9eeKxHTqBk7fAMzKMe7ITd
         GNspcevs36/PtIIe/M4DnImUflW+aYnaeFBZ2YhmvcrpsGZFM7rNmzpGAJqBJ1tfWeC+
         L/h+qu3fKXDM9nLcrDaz281esofKd3ZoO1E+e7XW9UMkROxWf0HeLO8RKiKKWwvyXNf7
         K8v7lThakNbJ8u5gSwcEum02YRFL0CJc2ABSIZROxqE9G47oFCC9y5epW7El/7yx/rIP
         TR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991063; x=1741595863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=088gCiVsmCpfljLz/WNF5os3OZWs6Dr62hIApojY3d8=;
        b=U04x68x6XudT6z1vlYp0ehi0ZsL08rCsVtwZn+5oRuknyGRvimLKlIavfGQ3FXTXl8
         DjPYniE1bIdbcorA4AZ1vEEi9LLZ6HirOaxCPN45p5MGKzPb82Og5WwgPQSJk/FUc5cE
         qdbuTRKKx8Ej2Wa3QZGDsttAqW1+5Fy66xGk8ykPghp9xR5Iuq1g5ssg6RUUm2ZEdbQV
         BPd4ffPejRQVcnodTg1D1PUfLuA5Tmly3+QitdyKOjHw4E+DgBa5MF8Q/P37eEM/7y6u
         U6imA2QFED91p49Z7GMKh4eP8pKCZgsql7zsfXZuac0W4r40EB0sCZ75Vy7XX8BgfYtp
         Eatw==
X-Forwarded-Encrypted: i=1; AJvYcCWMnxB8MHNhTmfHLxWRU570IikXFraQUMz3LmDJiwXPXiPgE73+VDaXL4Zw2G8ngCDKixkNsfYNs38=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqxuKoY7kjRWPyNoA4F4ewTkbrdiYLhY7hRc4i1ClMZdgWwewk
	uyEQnIWzQulXzNTyFq3rCVGZUSJfMs514G29JcosC+6VwwSQRyCYRLclsPu0A0s=
X-Gm-Gg: ASbGncvdb5GYzaLClfrseUaRE9UivvKto4RYsPZs+PwiytLwfLEl8yULLLy+7WxAUY8
	y+mjOVttRgnxkR24NKH6dXocwBCfIFcIVw4M7hdqflw7PGUft9hdRpo3dp5reEwMLS2DJOrjzfo
	SgrxrEJi33fQBPLjN2FXJYmPRooTXvHj0BpuAD20uKkYkOieBLzT7KI3tBde8KPQsfYTdz7/731
	x8Rg7hP4uinMDJVk4YnAdDAKkU3ZWjj7yvSUcZ1FFB5IknKkMRDjrgt4PLv/z21os3J96RwtHhs
	thVaGwV6HangVePaVjzcDbYh+th1oFHm2njO4I2omPvnLAerj0zkqbyy
X-Google-Smtp-Source: AGHT+IG+mwXTx4eDAQj8AAOugFy3UaMktA3JlzKQWx74RnnVc1/k+KU8S1qfjCYJPEbQsqpxnNFduw==
X-Received: by 2002:a17:906:6a28:b0:abf:749f:f719 with SMTP id a640c23a62f3a-abf749ffc45mr408409866b.7.1740991063333;
        Mon, 03 Mar 2025 00:37:43 -0800 (PST)
Received: from [192.168.50.159] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf19aca8a0sm730375166b.178.2025.03.03.00.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 00:37:42 -0800 (PST)
Message-ID: <45713e88-57af-43c7-bf0b-4583383b10dc@tuxon.dev>
Date: Mon, 3 Mar 2025 10:37:43 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/21] ARM: at91: PM: Add Backup mode for SAMA7D65
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
 <3a1f59af1ac9322b0203694b535d5d13120a31eb.1740671156.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
From: "claudiu beznea (tuxon)" <claudiu.beznea@tuxon.dev>
In-Reply-To: <3a1f59af1ac9322b0203694b535d5d13120a31eb.1740671156.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/27/25 17:51, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add config check that enables Backup mode for SAMA7D65 SoC.
> 
> Add SHDWC_SR read to clear the status bits once finished exiting backup
> mode. This is only for SAMA7D65 SoCs. The SHDWC status register
> needs to be cleared after exiting backup mode to clear the wake up pin
> status.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   arch/arm/mach-at91/pm.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> index 39644703244d..d82a507bc8da 100644
> --- a/arch/arm/mach-at91/pm.c
> +++ b/arch/arm/mach-at91/pm.c
> @@ -647,6 +647,11 @@ static void at91_pm_suspend(suspend_state_t state)
>   		at91_suspend_sram_fn = fncpy(at91_suspend_sram_fn,
>   					     &at91_pm_suspend_in_sram,
>   					     at91_pm_suspend_in_sram_sz);
> +
> +		if (IS_ENABLED(CONFIG_SOC_SAMA7D65))
> +			/* SHDWC.SR */
> +			readl(soc_pm.data.shdwc + 0x08);
> +
>   	} else {
>   		at91_suspend_finish(0);
>   	}
> @@ -707,6 +712,7 @@ static int at91_pm_enter(suspend_state_t state)
>   static void at91_pm_end(void)
>   {
>   	at91_pm_config_ws(soc_pm.data.mode, false);
> +

Not needed. I'll drop it while applying.

>   }
>   
>   
> @@ -1065,7 +1071,8 @@ static int __init at91_pm_backup_init(void)
>   	int ret = -ENODEV, located = 0;
>   
>   	if (!IS_ENABLED(CONFIG_SOC_SAMA5D2) &&
> -	    !IS_ENABLED(CONFIG_SOC_SAMA7G5))
> +	    !IS_ENABLED(CONFIG_SOC_SAMA7G5) &&
> +	    !IS_ENABLED(CONFIG_SOC_SAMA7D65))
>   		return -EPERM;
>   
>   	if (!at91_is_pm_mode_active(AT91_PM_BACKUP))


