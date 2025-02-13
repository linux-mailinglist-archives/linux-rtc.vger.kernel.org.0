Return-Path: <linux-rtc+bounces-3182-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D628A339F1
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 09:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C040F3A9B80
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 08:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE4720C005;
	Thu, 13 Feb 2025 08:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fqnyBHfY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A421EDA14
	for <linux-rtc@vger.kernel.org>; Thu, 13 Feb 2025 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739435305; cv=none; b=DwK0AmDQEYfCSdl8GtcZlG0DSlVFlPaEcCON3PDwpWEcyW7nzaaKDG9THCFp42v1lbZJxbYBVRGJfwW3ukqrTiCTB/gC6kuJrDDf/cYisjVCNs6zoB/dXgSgb6jwi+Bw9xZMCDbEJoYZpKMu7fiklZeGMZ5fEAA08sGKW345BCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739435305; c=relaxed/simple;
	bh=w5gP/JqILSFIHX1cj+D+ILd29Uv1eYMj5eJYdM9rmOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YL7DtfonC8fjGi2RQVYCKb9bYb71VHAnuNxEdq2+ClQ0DfJtSg37ELgA/uEVi/MBvrhXIdtQRWqirzllOCZLed/17igqdVXcShbVJL6ME3PWQOGMv2PcP+lJFvOoJRhzbBrsX6WIUk+u23nD8jjdkKJeAhEsFr/vgJUBeH7x53A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fqnyBHfY; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dea50ee572so789075a12.1
        for <linux-rtc@vger.kernel.org>; Thu, 13 Feb 2025 00:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739435302; x=1740040102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pWXrP1biBRVYfhrhl3Fs6qE0BQgKKe9yf0UVNL2tW0Y=;
        b=fqnyBHfY+xSgTZifkEGToghF0k19xhP1np2B2dNWyk32GfYPdLfybF6wu8gIqh+73E
         HaZYEvjhDaI55VVrZRJ85hGJ2sTp9liEr+kwaK4QFiKtktJg5jKK7ZGIQHgcGMw2EKpy
         Qk9k1qvnyDhWqr5lndyryvj+D/CkCaOHklFWrqO7eHz9xMsVefPV+yqkZPY1W6TVPwsW
         MGEhCOH2WveeLyhwwwI4/qx5z0dmqRCNg33pkuUrVFgP/ctsunsNhQr9kdxLXnVfAqT3
         v2kdqglPHX1+ucMWhjfbY2hCaOEQqPdmmQHbt/o1Z1dYHufIM41Vm0FtKVwpxp9PvnOt
         HGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739435302; x=1740040102;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pWXrP1biBRVYfhrhl3Fs6qE0BQgKKe9yf0UVNL2tW0Y=;
        b=wsyKv+DOrvqtfm7vSmR5CR9jDRFGbY2WYdEEF6y8Gra39NcL3UQ3BIfCfQP4MZR33r
         5LnaP225HwTPX9Vb71PhnGsEpasNbHr/mOwdjtaW1US5wlDYR6FXCjSnHzDNP7IDUwtn
         T7k0W5hwLuL5slfX83KGJkvmLfLnI+2lQeXO1uDnAtYevK338oRQViF72cxEfI29cCQP
         XJgMGA7H4ihsO1Q/3G03f9DBsNYBwlKww/BZdAV+n2WRjL4Fu2DCgQtYQxo+8ccSYjGc
         Dkj9SowM0zeH33dhLwzdAWczYw3f63dAw+ibi1FMNF0AvGLHE761vE5q52YqIX8TiD5W
         +hwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNY1rH5Sd70RB23pwFXLqBTbgHCEEIpc/qCsTE8UVIcDD8M7luATmDt8g+WKzknZtE4mYDD6XGcaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YySiuvj5vs3fVHqJTWguPlCuhq9EfROCIF35vdDwttF3MIqfQ08
	1h9Mam+Q/tFmJHr/HRcANDHZEF/NnqHYd6yJQQZ8U77LmHiLsx/V93sDlfocfhg=
X-Gm-Gg: ASbGncvTxFCxXYW1KDiY9ULrq9Dsv7UvateZtMkBJukZl5JJXX4G5uSeDlCkxA4s2ew
	dPeJcVVeEcM6FaUC1FjMf7VODv8cKxeh8h53XoahYQvtdm5zX6br4D3vPdqnU9vQd0PMvBRw8P7
	SFJQt2y+AGxBaTa4XzvY36ntfm3oBMcsD38EralqWW+eEoE+lrcPNhyrv3KPqIAsErN9Rg9ketm
	4Iv7A4xvvDhpubXFTLzaNzIPPgjIOcQ1SKiBseI7hPJCgIvAeR2BUtSTD4gDPj6dqayFFFEBunK
	6ECtbU6lbIxqCLpdHZtXUK2c
X-Google-Smtp-Source: AGHT+IHp0wFc6lnyAccZeSIcOl6s43d7ybkx0g4TFeTVLObl1F1VkXxMGejHB9/VvyPpzOW9TCX7pg==
X-Received: by 2002:a17:906:3652:b0:ab7:f92c:9015 with SMTP id a640c23a62f3a-ab7f92c9331mr374928166b.4.1739435301467;
        Thu, 13 Feb 2025 00:28:21 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5339d94asm82747366b.143.2025.02.13.00.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 00:28:21 -0800 (PST)
Message-ID: <2885fac1-edb3-4251-8e4a-3da92d3b3974@tuxon.dev>
Date: Thu, 13 Feb 2025 10:28:19 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] ARM: dts: microchip: sama7d65: Add Reset and
 Shutdown and PM support
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <d8578cb635ff5b01e42132bd40a12b31c8638800.1739221064.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <d8578cb635ff5b01e42132bd40a12b31c8638800.1739221064.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 10.02.2025 23:13, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add support for reset controller, wake up alarm timers, and shutdown
> controller.
> 
> Add SRAM, SFR, secumod, UDDRC, and DDR3phy to enable support for low power modes.

Can you split it in individual patches? E.g.

1/ add reset controller
2/ add shutdown controller
3/ add rtc support
4/ add rtt support
5/ add PM support


> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 77 +++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index 854b30d15dcd4..1d40235bdab0a 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -46,12 +46,42 @@ slow_xtal: clock-slowxtal {
>  		};
>  	};
>  
> +	ns_sram: sram@100000 {
> +		compatible = "mmio-sram";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0x100000 0x20000>;
> +		ranges;

Please follow order proposed here:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/dts-coding-style.rst#n112

That would be (for this node):
- compatible
- reg
- ranges
- everything else

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
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 17>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0xe0000800 0x4000>;
> +			no-memory-wc;

Same here with regards to order and dts coding style.

> +		};
> +
> +		secumod: secumod@e0004000 {
> +			compatible = "microchip,sama7d65-secumod", "atmel,sama5d2-secumod", "syscon";
> +			reg = <0xe0004000 0x4000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +
> +		sfrbu: sfr@e0008000 {
> +			compatible ="microchip,sama7d65-sfrbu", "atmel,sama5d2-sfrbu", "syscon";
> +			reg = <0xe0008000 0x20>;
> +		};
> +
>  		pioa: pinctrl@e0014000 {
>  			compatible = "microchip,sama7d65-pinctrl", "microchip,sama7g5-pinctrl";
>  			reg = <0xe0014000 0x800>;
> @@ -76,6 +106,31 @@ pmc: clock-controller@e0018000 {
>  			clock-names = "td_slck", "md_slck", "main_xtal";
>  		};
>  
> +		reset_controller: reset-controller@e001d100 {
> +			compatible = "microchip,sama7d65-rstc", "microchip,sama7g5-rstc";
> +			reg = <0xe001d100 0xc>, <0xe001d1e4 0x4>;
> +			#reset-cells = <1>;
> +			clocks = <&clk32k 0>;
> +		};
> +
> +		shdwc: poweroff@e001d200 {
> +			compatible = "microchip,sama7d65-shdwc", "microchip,sama7g5-shdwc", "syscon";
> +			reg = <0xe001d200 0x20>;
> +			clocks = <&clk32k 0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			atmel,wakeup-rtc-timer;
> +			atmel,wakeup-rtt-timer;
> +			status = "disabled";
> +		};
> +
> +		rtt: rtc@e001d300 {
> +			compatible = "microchip,sama7d65-rtt", "atmel,at91sam9260-rtt";
> +			reg = <0xe001d300 0x30>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk32k 0>;
> +		};
> +
>  		clk32k: clock-controller@e001d500 {
>  			compatible = "microchip,sama7d65-sckc", "microchip,sam9x60-sckc";
>  			reg = <0xe001d500 0x4>;
> @@ -83,6 +138,18 @@ clk32k: clock-controller@e001d500 {
>  			#clock-cells = <1>;
>  		};
>  
> +		gpbr: gpbr@e001d700 {
> +			compatible = "microchip,sama7d65-gpbr", "syscon";
> +			reg = <0xe001d700 0x48>;
> +		};
> +
> +		rtc: rtc@e001d800 {
> +			compatible = "microchip,sama7d65-rtc", "microchip,sam9x60-rtc";
> +			reg = <0xe001d800 0x30>;
> +			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk32k 1>;
> +		};
> +
>  		sdmmc1: mmc@e1208000 {
>  			compatible = "microchip,sama7d65-sdhci", "microchip,sam9x60-sdhci";
>  			reg = <0xe1208000 0x400>;
> @@ -132,6 +199,16 @@ uart6: serial@200 {
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


