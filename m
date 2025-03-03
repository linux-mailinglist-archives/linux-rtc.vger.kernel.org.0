Return-Path: <linux-rtc+bounces-3361-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9BFA4B95F
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 09:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E61373B29DD
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 08:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9281EF363;
	Mon,  3 Mar 2025 08:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ev0Dv9xg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE64C1EF0B6
	for <linux-rtc@vger.kernel.org>; Mon,  3 Mar 2025 08:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740990524; cv=none; b=GNRaC0RUJ96YIvL5bMWrVgqzfz1+VamEuCZ1xOZ7M8cqVsLNP18Pjtw21Dh/ursKL9lWNJFoSgE04al0lvX/DPHfhD5/6USYH11qftKMxFmXQaVLh0h8HqBIOt4sFudReGwFjOdDAFFpebFg/zFyJHEYBeCbYJPOO5I3kp4qMa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740990524; c=relaxed/simple;
	bh=Str9/Z4T7boxdmYNKfUCQAYMERdj9MmqoKnoOftbpzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLxBmjcPPqf3z6rqz5TcFqd92PogWe/3hTve1RbnB7mxh8Pk3LnWep+I435MAH5bNkD5frFEc3U0Sy7pZbpmcQKp+KinK2EK6wIjqeu2fNShhhlKRf3+Qm1m3sNn2rD2qM9T8PDQSYeZONEx/feJ18mlGioWwP0EiAj5IhkDb30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ev0Dv9xg; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5491eb37dso1282272a12.0
        for <linux-rtc@vger.kernel.org>; Mon, 03 Mar 2025 00:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740990521; x=1741595321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GH41p+03OT08ssRRmEqg+Cy0Qf0zi6uiF2rijzbkmOc=;
        b=Ev0Dv9xgqBw7wW32FiSRZEU4FnONDvAlKj2KFKPd0crVicIZbCB6JN3ZMVexMZX9cJ
         ULTqrQXBVSyv8FtYXsbFlL2B4Rqdbjdx+JE1/5D0/ZkEkMJdpBaTyRrp4zG/aHCazaVc
         4J/2QPge4kYNQUbyql8ewpJwvHe//wvgdBPuABXFAuAgVSr5yspF+kvXLb3LosRi3Z7p
         gpTjcrBCXHwQKQX3lrVeubWvfR8bXrc18GhaDOUcHKRFL8QYDCcKAhdYDZSMI1pjvXRS
         ON8pFYCEuw+LuKH7zuGde2Uu248vEs5xEobLxXHX97l5qS+C1fpuwIUNt9mJyzMqPnd2
         ECFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740990521; x=1741595321;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GH41p+03OT08ssRRmEqg+Cy0Qf0zi6uiF2rijzbkmOc=;
        b=mo0vKTLJ8mdigQ6eUyXenE+T51fe98FyvkM0ddpiGe3S9dkYLCyi03rwvUrL9mVVXL
         06v5RsAPF5xTv/cV2rid7OJ8PBNtUWFQBI2T739py5vbwrZEw4adCvxLrIaz1zvvJEWw
         5gYci6aGuIt1d3omApqMCLXAs/KJumXN71hsQACE9JTVAg4/TkvAvziRGz5Mo65X1ljQ
         qoqIK4HidOYZ49Ulfd6XOyjImjGnz2qWz1A2G0vaGPCYEwBNug6JQKz9W2SYjBtN0qIt
         tR9gFAuOkVmCiwMzUHMbBzjZJxMvY6B0I197aTiw7yr9MXwug9kc9GzXL85OxsUvioMd
         kmXA==
X-Forwarded-Encrypted: i=1; AJvYcCX4VYt43QHN+GKAtduCeEkBnO3RrNs116jJb3RnJQCx4vK6adhNgZEuRoZzf/PNJO42AtWP2C/WZ7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVOMIJIiH30Cu7DmQ0EFcv+R6id2j3p2Hei3t8yiB2qxbUjjfA
	1Eksjvl0loGvzM1yMN23TPWBXrNc6JvxV/EpJI1lvvzDFuZrFZ89HNvQmYsLWn8=
X-Gm-Gg: ASbGncvXHBqDJP1Z5gqG5k5O7ZDjbcoyiV23zvZeD1CDMhyFQnpduapRJYal4y9AIv9
	Iy5S8JEtli5gon6z17EPLwm+WAzMHri+G7DK76blh34ehnuByuHCL0KYv/VKTlWgYlVlk3IIQO0
	3hoJECjpGhqUaTNVuIpuiajrOf/vrrzzu0toTm/oZceEt1vAk7B1EPApatfMj/yRcaYk8ExLEa6
	9Z3IGP2MGw9c3Bip7GRlI5WJrBHhu9O5Ph0x5kh2DJnyWKnXqhCXEDjc+XaSJ3BoSeMRB8TFT7L
	Mi9XGG3AiQ8tQeEJMKiKMGunYkMLUCJH+Xxh+fkoMthZ05K9AK5ZrA==
X-Google-Smtp-Source: AGHT+IFLKelVEVi00flzE2lHP3gHCMr7kj+GRjh+qndXBWCgYVC+cKiDJx3z7MTtqx+Mlq9hmZIcoQ==
X-Received: by 2002:a05:6402:34c2:b0:5e0:8937:6ef2 with SMTP id 4fb4d7f45d1cf-5e4d6af1104mr11411025a12.8.1740990519662;
        Mon, 03 Mar 2025 00:28:39 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3bb632esm6491336a12.36.2025.03.03.00.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 00:28:39 -0800 (PST)
Message-ID: <3bdac1bc-b84f-43b0-86be-b9d9b18be25f@tuxon.dev>
Date: Mon, 3 Mar 2025 10:28:36 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/21] ARM: dts: microchip: sama7d65: Add SRAM and DRAM
 components support
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
 <ab4002faa1b672023ffc97bf91755720508c275e.1740671156.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <ab4002faa1b672023ffc97bf91755720508c275e.1740671156.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 27.02.2025 17:52, Ryan.Wanner@microchip.com wrote:
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
> index 92a5347e35b5..c10cc3558efd 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -47,12 +47,37 @@ slow_xtal: clock-slowxtal {
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
>  		#address-cells = <1>;
>  		#size-cells = <1>;
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
> +		secumod: secumod@e0004000 {
> +			compatible = "microchip,sama7d65-secumod", "atmel,sama5d2-secumod", "syscon";

microchip,sama7d65-secumod is undocumented. I'll postpone this until a
documentation a patch will be posted.

> +			reg = <0xe0004000 0x4000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +
>  		pioa: pinctrl@e0014000 {
>  			compatible = "microchip,sama7d65-pinctrl", "microchip,sama7g5-pinctrl";
>  			reg = <0xe0014000 0x800>;
> @@ -190,6 +215,16 @@ i2c10: i2c@600 {
>  			};
>  		};
>  
> +		uddrc: uddrc@e3800000 {
> +			compatible = "microchip,sama7d65-uddrc", "microchip,sama7g5-uddrc";
> +			reg = <0xe3800000 0x4000>;
> +		};
> +
> +		ddr3phy: ddr3phy@e3804000 {
> +			compatible = "microchip,sama7d65-ddr3phy", "microchip,sama7g5-ddr3phy";
> +			reg = <0xe3804000 0x1000>;
> +		};
> +
>  		gic: interrupt-controller@e8c11000 {
>  			compatible = "arm,cortex-a7-gic";
>  			reg = <0xe8c11000 0x1000>,


