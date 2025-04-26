Return-Path: <linux-rtc+bounces-4001-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B199EA9DB09
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Apr 2025 15:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B94A1928235
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Apr 2025 13:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA0A152532;
	Sat, 26 Apr 2025 13:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TxP7DoYb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF948489
	for <linux-rtc@vger.kernel.org>; Sat, 26 Apr 2025 13:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745673441; cv=none; b=eUcXzwFz5OdOq1GGJmHtAGnnLd7KCOMgYsn/uXhgBxW0cD1/CI5f1ONeSLQyjSFkrzd1JuSWIDvtxLmR5mDN/wSOs4L/AgeK2ftDnCEojjQ9ClBClfUxcWPfXxTMwhu2wzKHmu58zvrK7fLqQFKvTk+4KmRz/811Lt/FHjoLFMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745673441; c=relaxed/simple;
	bh=AgGgpgM0SKKcQMBvhiyb/+80AjEVOKjah4TFyo+HM+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXvT/Z+CThI6ThGMJ3hSyrvKiFV+tDtstUP2ozUp5I9c18oFAp/HiQcIMtwORKMtGxbsMMjxBWYB0QJv+T5M2c3bEtynP+DfpWgtEE0nUVKI+h/4pdrbT9XuKBgC4ZaEqMkT/3xn8kIvWIO9Bk2X8hDpe/v+XASH1pJEwEM6xZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TxP7DoYb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso30859625e9.1
        for <linux-rtc@vger.kernel.org>; Sat, 26 Apr 2025 06:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1745673437; x=1746278237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CI5a7+0i1Z4ciPNBaeJ5FtbaB8j0UzTY2F+B8Sn8k24=;
        b=TxP7DoYbHMNsax1kaxSFVaJ1zJNJW6mz1wdWGNvliVlKGRp9wJXbqWr4I0QLz6eM3c
         Q68qOpn1nQQqM4N2fMt3NeZDMIrJnMzOna9aNbzfX1L68yMtvGs5vbQq4uQuOUQxIAFP
         8HHb6aZ7lEk5ocWYTRrejo1dRWeGC4Ofa+AfQgS4bNgOwOhpttnMuZ+FhUIqaD6smaIF
         vO0zTttGKLA3CXDwbpqfZwt4UL+bDF4Ok00dV47idrKJmlFEtGu097zXR4R4xfaeX3UA
         dqiLRvAH45gB7WQghF/U4QdmlIwZ46NmHnGAE/H8hvbzMRTzr78SUD+5Oj9ALRY0eS+3
         k8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745673437; x=1746278237;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CI5a7+0i1Z4ciPNBaeJ5FtbaB8j0UzTY2F+B8Sn8k24=;
        b=Nywrksf1mKQriGqUubIumhSpeq1eKLisGuYAVrq0wl8konrkez5gdUG/UrYOSUUHxi
         F6LnjTz1clYh3zzWr0NdhtqPPhDWuWBe1b7k9Mj2rJICxj+FXiqvwPPjkWxgUwi0Fdlq
         gURzgAGbjVxBuV4YFq0bobsgKlmgmbXfzJB/47Ka/wnKTV5vmffCx21J9Gr4KZHZ50oH
         ue7NiLEo+mqyScDTl7wqfwZBkvZ8WyUtg6EM4KMuV6NNV7ZYNI5VA2ddYwr+gAxH05A/
         b4WKyWL7GDaixDsBS6fBpEiJw2HfptitbMM1WwTjgY9Zh2WewGcV9GmUgmM8lBoX4p8g
         ZZAg==
X-Forwarded-Encrypted: i=1; AJvYcCWzuZFOfd5jTbCWMaO5CDLCBCNGFO824uE3cHKRb+tM1L1UqCgsRv2K0ShtKbjVdrAKJwq5wDZa/ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB/MK/33DzuJYcx6blRxKK7USHfkc9cl/dvgbCs04IripgmN34
	RSA7a8ASi4GCqKpUKiB6RPd4dKNlIxVmwZmnasi3ErXR7ItU9ZAFPT0VyjUqyKk=
X-Gm-Gg: ASbGncvyAHIbUELZehEXUhCsLFFrJJlfTvgif4bMqpiMrIn3pdI85JC8ARiFv/TYeSH
	sfKBSkn8k1/Hma856nDOxyyRYOxPb8x6LTKFb7mU2ia9WSDvwXeuUKr1Wm3KcBHYolCJgv06KqK
	DnXVy3fqeL8g07sVPvgDjc8YXLbKR+L+crjF9niz//5EmEhYOi8El4XA7mkdLBigmoPqpLYVb2l
	LDoEkf7uvvvWXv+TvZjPwcG4qgdKRlOyz9fsp1de5GPC+3EeVkORwvrCNexAXIbSZzGGOk4BiRo
	01OItq5AQM0HFFxF+2K0yeoq55kcH7gCNrc1GXuu7dqIKSV1Sw==
X-Google-Smtp-Source: AGHT+IHytqi0PRSnCZUd64Qp2/4XTNrGyd31YUwQgLulH0kGSHkkv9/ZhwEu+T7t1MGAzdiUaJUlRw==
X-Received: by 2002:a05:600c:450c:b0:440:6a5f:c308 with SMTP id 5b1f17b1804b1-440ab79bd20mr22243255e9.13.1745673437040;
        Sat, 26 Apr 2025 06:17:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d8d191bsm106573135e9.1.2025.04.26.06.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 06:17:16 -0700 (PDT)
Message-ID: <b6736e74-7f90-437c-b44c-183a75401037@tuxon.dev>
Date: Sat, 26 Apr 2025 16:17:15 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] ARM: dts: microchip: sama7d65: Add SRAM and DRAM
 components support
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, lee@kernel.org, sre@kernel.org,
 p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
 <354ecd628fdd292d2125570a6b10a93cbecb7706.1744666011.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <354ecd628fdd292d2125570a6b10a93cbecb7706.1744666011.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 15.04.2025 00:41, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SRAM, secumod, UDDRC, and DDR3phy to enable support for low power modes.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 35 +++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index b6710ccd4c36..8439c6a9e9f2 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -47,6 +47,14 @@ slow_xtal: clock-slowxtal {
>  		};
>  	};
>  
> +	ns_sram: sram@100000 {
> +		compatible = "mmio-sram";
> +		reg = <0x100000 0x20000>;
> +		ranges;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		ranges;
> @@ -58,6 +66,23 @@ sfrbu: sfr@e0008000 {
>  			reg = <0xe0008000 0x20>;
>  		};
>  
> +		securam: sram@e0000800 {
> +			compatible = "microchip,sama7d65-securam", "atmel,sama5d2-securam", "mmio-sram";
> +			reg = <0xe0000800 0x4000>;
> +			ranges = <0 0xe0000800 0x4000>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 17>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			no-memory-wc;
> +		};
> +
> +		secumod: security-module@e0004000 {
> +			compatible = "microchip,sama7d65-secumod", "atmel,sama5d2-secumod", "syscon";
> +			reg = <0xe0004000 0x4000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +

These should have be before sfrbu for keeping nodes soted by their address.
I'll adjust while applying.

Thank you,
Claudiu


