Return-Path: <linux-rtc+bounces-3360-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC44A4B93E
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 09:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C56216FC14
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 08:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708F51EF0BD;
	Mon,  3 Mar 2025 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Lhp5eRfD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BFF1EF08D
	for <linux-rtc@vger.kernel.org>; Mon,  3 Mar 2025 08:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740990417; cv=none; b=DueoMyS8engTKkbogjaoOuI2ygfpzdd3bnJK95qWjrSAnKyl1SXiC3Vs6KIxy9jjuuTgXvKLSHRglEx912CPYukdfVWh+lMikZAo58tKxY8KMzThXyrnv3KqYyiE7GD0LsWcR4RcapcjOwHI8KgOA00kebH9OHbmTkIj7KT57Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740990417; c=relaxed/simple;
	bh=lJXPyymC+Bn7eNg7QGwNenIBMEiR5kuGsl3f2E+vwL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQ5L69tbDCTbIW3bk5e2FXd4HXO/I9DJSdD1Pj+sdjhw6qgcyEk63mjrcwR1B5zJa7MEdksLAXu6nOMxG8zqXsAzIUW6GIPpJIgOiJbBNbDMmG7KdXchXX247iyYMyVOefgm+tcQH+KFbRtvolUOCb7QbYYWaXmCfo+L0iBc3yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Lhp5eRfD; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abf3d64849dso326768966b.3
        for <linux-rtc@vger.kernel.org>; Mon, 03 Mar 2025 00:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740990412; x=1741595212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BD0ged1tbWk7V8+0mBgsPRbGV+NS/Ji1P1tciZQV6bE=;
        b=Lhp5eRfDH8wGcAYGfwM89OO+e8ZKEvJ8G30YTmuWKwp3UwHrBWUElxio4311xTFaJZ
         dfibFmO7LQnho+Rwu8SoiCWi3y0BcDd8CQwttwW4XbP1kRxVEeFw7VkauJymrzUupTY2
         ayMGbkBrgQL/puxu8MZne/R5KP6Dj3CuMceUAXWke2RtcXJMDl64/OBDylZpKTZNK1kG
         IXaKee8r5vtGMxUEICWpLi6VGe6FaJbuSVnCDrjpxKlzJqx1skg27aC0NvK1Rwplz8jl
         OkPgh4AkdndEYYAwrB0H4j2k2TFAS63K0KqhSygfYsVH5yAG8bMDPDMo2r1aoZRtWDji
         2+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740990412; x=1741595212;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BD0ged1tbWk7V8+0mBgsPRbGV+NS/Ji1P1tciZQV6bE=;
        b=vFvo2C/sTzJ5lKG6QrU5DDZBFBa7ZjKvQeGVUoiXbSLlEGzw1JCFq+lwoYXu2Stf5c
         RJy0hbKHpponpYDcS1fnq2uW+hovjx1YCFyTIRaRYZvOcISNn1gAnfGyeei32njO5Gr2
         3MVZ1juKFCnphWYesWxMvGLl7KZkQX6SVTKBufy9HPQsq31Sa+Auuv8CHIrZm1TY8BDL
         XMiB/KBzNeAeyOFDElV3NzCsycUoTQpvDpM9sW57CsRJULZckxb8YbQb+9mp39f9I6J8
         MRKx4ch0JBVbvcDoXuuvmVLltvdIVWrRYyq6wgDu36ec0ShHUy6NgMPMhDipgAcOzi2d
         qkuA==
X-Forwarded-Encrypted: i=1; AJvYcCXXidPITL0ZUlJ8VxSdox84nkTficRfqskk5YYqFtocA1LRpd1rri0TBGrZJXUs9KkaZaLGTJD4sk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy228fkicCrB4fXYmQG3khpm8j40ShTbcyuNLWRjXBWVJ+R4dKo
	/FLOnlHNLespsE8RtRHs41qK7Li8UlgMtO8uU8EYUiHOeqnCjxOQFb5KzVScG7Q=
X-Gm-Gg: ASbGncu/ANZaQYbSupMlu9lagaRKYXBpDg9s4Q7Reh6Tb0C83bHVOTYkbCAnuWaXv3p
	Ih/jf72VKQphe1T3sOhgem+nEN+ZGQ7+ICaGbzmUj5XYb0fx72ygHVYwZ9XfoS9z/yErUxP+ZRk
	9eHQBzNzg9tHsiJUTDzw7ZHiKU+rQ8TtIl8P7y5IF6iRQbTAgD1HQ+cOwHu+3rMAX0rBO/7fSeE
	rtjdN9Rk5h4AH5iU97Vox5bhkqYbH6MWQAiM+Bn5JMb+u6HCiS8gmjvUZQRJiPP2HZxtWU5oRvo
	i+B5AQRFRrIX8Qc5PMjZgf66d4RKVJxUMxx8HK/QbJ7sRjoUR1P3DA==
X-Google-Smtp-Source: AGHT+IFB0ef71YNR9dJGXCO7UqAzxgYbd67xW8P9JXXgL21idOk1dW4h3KG6K2wPSXyAzJ2F6c4cew==
X-Received: by 2002:a05:6402:2692:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5e4d6b4baabmr28693051a12.23.1740990412164;
        Mon, 03 Mar 2025 00:26:52 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c6ee491sm776723966b.103.2025.03.03.00.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 00:26:51 -0800 (PST)
Message-ID: <f03946a8-24bc-4a1a-8d06-d5652a4db34f@tuxon.dev>
Date: Mon, 3 Mar 2025 10:26:49 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/21] ARM: at91: Add PM support to sama7d65
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
 <f4634d70f1e7002db059f2cc892fbbbfe1a95dac.1740671156.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <f4634d70f1e7002db059f2cc892fbbbfe1a95dac.1740671156.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 27.02.2025 17:51, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add PM support to SAMA7D65 SoC.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/mach-at91/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
> index 04bd91c72521..f3ff1220c0fb 100644
> --- a/arch/arm/mach-at91/Kconfig
> +++ b/arch/arm/mach-at91/Kconfig
> @@ -65,6 +65,7 @@ config SOC_SAMA7D65
>  	select HAVE_AT91_SAM9X60_PLL
>  	select HAVE_AT91_USB_CLK
>  	select HAVE_AT91_UTMI
> +	select PM_OPP

This is for OPP not PM support. For this series this should not be needed.


>  	select SOC_SAMA7
>  	help
>  	  Select this if you are using one of Microchip's SAMA7D65 family SoC.


