Return-Path: <linux-rtc+bounces-3362-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0940BA4B950
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 09:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E57D318931DA
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 08:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4791EFF95;
	Mon,  3 Mar 2025 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Y0D+xgHV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153761EFF8E
	for <linux-rtc@vger.kernel.org>; Mon,  3 Mar 2025 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740990533; cv=none; b=GhXWGk4/f+mFNSAm4GZYD9d7QoOKk0Q6GM1Yc98AA1W4m/7XgBFq0cbjoXBZL47pqjobM6C7wz4RBWl3hQLZ3GXVUNty9ClrOD1gAP4SfKaZbpxJ76miJSgVZtFNQb9ana6F0GaNTn51ZSPXvCNdLwoU3M6RvPdXt9EPqh7M3Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740990533; c=relaxed/simple;
	bh=qoPtDOyTcjwvCpBRIB3CYa8gwUoF4qiW66mIwy/6yyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T95NROS4l55bnqWbmfJln3jW+nwA4sXFzoJzrxzJync01g5gwKeZcDTmZRjHmWx38CyLG/3Q8SGoQaeRXEgZMwCqNv6FcOcyLXC/5ss8/DeXVKHb0Wjr7OrnPViHKvZDOopY/vVlCm5slEu/8oIYz6ob+529ZoshtQw/pSFlb+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Y0D+xgHV; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abf64aa2a80so230533666b.0
        for <linux-rtc@vger.kernel.org>; Mon, 03 Mar 2025 00:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740990531; x=1741595331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZbWYCAiGLdzl+1azDhHiS3T7Iql29Bgd9JnV0VCloE=;
        b=Y0D+xgHVb2dK950l7vfoJF+Q6AOpJ/BByNSkcJY1OeeAJ0bBsd0BbgqkEKc4ur86dE
         cYT2Af+Oof9FyLF+kr7NyyjPgH92ZRzOhzcD17audsET7nH7KJpmLZDPGNVUg6xMru+S
         m0d6qwbBSbbUqnyROX61/FqmtvkCPJ7EkU5NWqZM+XalCsBAmP1JpJ4+sDwZE6kNO3zg
         hepJTyg9y2a0W8bhFKgOgJTdPdBfP+3be1ugGyqQhpziUZdLoiMc0ni69l5oTs+W0K5n
         Zll+GnRHvnlNZ4Bo6eW4sDVFApZeLIK16KPQyUXFP8MO+QSBthiMmZRhMRBr1TncDUXd
         FGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740990531; x=1741595331;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bZbWYCAiGLdzl+1azDhHiS3T7Iql29Bgd9JnV0VCloE=;
        b=fYXMTi3TC6KemBAjhpO2mDJvbrnktxLFsvRojRATNbSbAjQ8oUL/14O20vAh45kzkJ
         8xv5pgdaSCgJ9lf1ZqI5233TLBpyumx6JJf9bMoHUHeAC0LHrd5HCKG2sQylJmwR0Bto
         8GADVwu9ZKtc1wwGckaipOaCA1iDiB2JAmSjv0H45dBxbrFPMo9w+akmwQBmisqHCbrt
         t3DHbDAw2eLXByROmpGy36X7pg2MXtYLVdar97EJNa1T3MIhbUWQqsdqkoNMoltIgRJY
         GrViUYxl/ywsF5ineTouY6DIA+ysqhN6sgRoJ7ViqcGEM8/KNLgjSp9A2tZVbjzRtORw
         2Bhw==
X-Forwarded-Encrypted: i=1; AJvYcCVZAMUKN1fPnaYbtPUJAzzp0Q7kM59SmPbuNcXVhLx9d3i5Y7avDXkrn/HfY+Z+2z18FYC4LFfsg2k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6BUXY3bGO2a1qXKVCqCqa9CFfuYzvl9kfS+RQa6R4EcPM7xc6
	eioou/FKWopMzw2T5PmgVN+9Uhx/nljhMwvS0qeF6LUDcoTonH9agNkrnWLgTqM=
X-Gm-Gg: ASbGncsnwlPQmp695paTYBBy3rBdFPPk7pNdcmWPnijLCKoaxeeSPFZM1InlVrX0MGg
	S29sq0MreWcXinZF96kYQEjePWh5m26eosEttEDVkwprM1PTn9pEBTB0mDDAC/vThsmOYfSvTU/
	P26ifKpxJ807U121hfHF8ci3yJAG88dt1JjtX5rX7dofNaBkUURzSwGooT1JGyGr9EQ4N9Q/+Ml
	t6ZcE2Jc/6oIABTcgGTRWQNbdlXV6szdAmlHJeKJu4Rgicn+CTiQ/2iJcNphnBlVkJv1/2OPPwl
	WYVDH9hSh89VOrJPpN/n5+EjXK9zjjh+22LEz1zz7z9IU7C3WxHT3g==
X-Google-Smtp-Source: AGHT+IFrYJnOfLSyyyjojYRmFnfLxPLsWEHLU4GBBp6Ea3g+RJ8CQj9vhxA16WLLX0u0LSDAoCw01Q==
X-Received: by 2002:a17:907:7ea5:b0:ab8:c215:fd27 with SMTP id a640c23a62f3a-abf25fa8e4fmr1364497766b.14.1740990529665;
        Mon, 03 Mar 2025 00:28:49 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf17fa4a4asm733337966b.92.2025.03.03.00.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 00:28:49 -0800 (PST)
Message-ID: <430f1dae-0123-4d4a-81c9-b3c1d9df285d@tuxon.dev>
Date: Mon, 3 Mar 2025 10:28:47 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/21] ARM: dts: microchip: sama7d65: Add RTT and GPBR
 Support for sama7d65 SoC
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
 <6a1c058edee3fe1459dcb3a93a0a789a9ffff5f3.1740671156.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <6a1c058edee3fe1459dcb3a93a0a789a9ffff5f3.1740671156.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 27.02.2025 17:52, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add RTT support for SAMA7D65 SoC. The GPBR is added so the SoC is able
> to store the RTT time data.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index b0a676623100..aadeea132289 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -120,6 +120,13 @@ shdwc: poweroff@e001d200 {
>  			status = "disabled";
>  		};
>  
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
> @@ -132,6 +139,11 @@ chipid@e0020000 {
>  			reg = <0xe0020000 0x8>;
>  		};
>  
> +		gpbr: gpbr@e001d700 {
> +			compatible = "microchip,sama7d65-gpbr", "syscon";

This is not documented. I'll postpone this until a documentation patch will
be posted.

> +			reg = <0xe001d700 0x48>;
> +		};
> +
>  		dma2: dma-controller@e1200000 {
>  			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
>  			reg = <0xe1200000 0x1000>;


