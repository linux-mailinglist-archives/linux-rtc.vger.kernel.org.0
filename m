Return-Path: <linux-rtc+bounces-4000-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CDBA9DB03
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Apr 2025 15:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D71C9467D27
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Apr 2025 13:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72381145B24;
	Sat, 26 Apr 2025 13:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="j7abyu2H"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7582AE8E
	for <linux-rtc@vger.kernel.org>; Sat, 26 Apr 2025 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745673409; cv=none; b=itJzbzsCDw5PBEQjMseKdQ68utRKxFIHP1j5uV+J1UsoU5/97mFyfaOczq48dQXo1uHNF5LQaBA320l6mnGgd9Ep0nF7G1yAt2iKbVlRiOYbLn+aVD2dnnaa8Y2NALYFQW5+w8dhNE65YeYlkWij0tWJZn1lS7vOslLrKnNIvBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745673409; c=relaxed/simple;
	bh=A2QesqpKFd5HugAJmo85A8ZYC0ForBZg6/ap+WMdLRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IGtRnv02Sf3KspkS3fL6PhPrlRTXKSqa3G+ozSUjiPK35hHhgOUaQlDEHIRwn4cZ9Uh2w5gtlVeBr8J/9dtZikY3UJ7pRCwhBwdIN3YXZM0ABP28NufJGGVm0tYSFIc/bks46IS2zkr3/kpL8zgeMw431DgX8AZxlQeIxPwsMKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=j7abyu2H; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so32211505e9.2
        for <linux-rtc@vger.kernel.org>; Sat, 26 Apr 2025 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1745673404; x=1746278204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J407mJFXHjtMTMAmHlJN1cKIkBEdqNJvnzIbzWuD3a0=;
        b=j7abyu2HrxbXpboRgy0NBBnlSfFX84wfbkU0qgv/XAs4UxiZ2YdxYex6i2VgG9vN3C
         bAJc5fbkiaRNzDtThI7WVtEUbCYkcpklADzwsmu2bJUzpdy5c10EnnXlRq5+UnS44yuO
         LTYQRTmsmEQcfl1mZIzXCcPAjXBw5hvKh+0DD6Bl5i53VWCawmFCOHzwy3oVHC9G16+m
         Hw6p9XNbQFvUcWVA4ZBjb8cR8pfpE/Lkxfki0AhGNe5dyk29JsVR2abs8KZmSkmaKdD0
         t5m/C2STAWpJVJM+eFISjOkq2GcYcaVQB+xwKMI4lFfm6UNYc3VCD1Baa6iL99Mx8/np
         9w5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745673404; x=1746278204;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J407mJFXHjtMTMAmHlJN1cKIkBEdqNJvnzIbzWuD3a0=;
        b=Ek/8rFJFIvFGPOIkgS/oUthCfaaAJXkyq+GrAol4tpjyudCTqocSn48ov/FQuIsaYx
         zs/s9k2SXZVDnVv/0tfWQgwB6NtnygERgWWeSNQ+4VxI61tAUSnutMjEzkDTDgjWA0Pr
         3Sso1RfrXx5lyaceKAPVG2AndV4w1gtQNWhy4ZwQZqY11K2BzuV0J9A5p231D/H++sPe
         Dccj2mLiTcy/yqlyAn3v+GKbJzCEwfvL9ozISEuGD76h6ZO9bjblifkT79ku9TwW5B7Q
         nKx0GwhklnuouPKHaqrEmqHW1EOyZJzFmIFAeq0Ceulrk5tTw90ugce2onPr7pj2rDdg
         ML9w==
X-Forwarded-Encrypted: i=1; AJvYcCVWSg6cY3Z0PDbeYFOPmHwyfl9iGIfQsN9wR3eujfMA+GvaMomNToDqKAkANJJpfyqvGrDGz5nC2Tg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWvo9tzMS5Cn2U8kmIinP8iT7EaUmVFWoQvZBRoRP2OiWLsg6f
	1pfk77pY6g1j7CHiOuY0R8FB6FAUjGe08Wza6t5si4WOKmHJH5cfjfu5QcRlOTg=
X-Gm-Gg: ASbGncumbEtJrVe/oExWO9AjvqQ3tKcIEfun6+ACpaRdN86pBim+FQxAF7O/xY0fSp2
	JGz25T5S7QgvKW+FEtb09eHVqyKtWRYIa7N/Xg8Hl/9FAbUeJz7QsVcCLux08DTIX1sfya1pdWQ
	wCuSzXrXA49E/+u4vBs7tdJ+qPDjIX3WCwxW/aZYmMGaPebHL+57+wWpuvRsWivQkq3nyLrJce6
	8vbvcfE7lPnG9gplUT8RqqI4cHaECEUyV70hlc6mgFeCb64T1Whg90EvdwPLuyIjdc2xytFzgvp
	8r4R6TVhL1TsTSlRbV6xhgNRmvKDypDy13wGm8OiENLDBhLyeA==
X-Google-Smtp-Source: AGHT+IFEdPhvnEPF2IPYYIjIlVAxjiyxZPBsePtMycDc8OXoHjZ80eyhmbO/+g2anWdvGqYyjM32vw==
X-Received: by 2002:a05:600c:3548:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-440a65fe6ebmr57418595e9.16.1745673404131;
        Sat, 26 Apr 2025 06:16:44 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5e1c6sm5649133f8f.98.2025.04.26.06.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 06:16:43 -0700 (PDT)
Message-ID: <79d1211f-6d4b-4f1f-8d94-3bb717025f05@tuxon.dev>
Date: Sat, 26 Apr 2025 16:16:41 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] ARM: dts: microchip: sama7d65: Add RTT and GPBR
 Support for sama7d65 SoC
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, lee@kernel.org, sre@kernel.org,
 p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
 <e8868ef06102241b47883ba10edaed751831be6d.1744666011.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <e8868ef06102241b47883ba10edaed751831be6d.1744666011.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 15.04.2025 00:41, Ryan.Wanner@microchip.com wrote:
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
> index 8439c6a9e9f2..bec70164a75c 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -132,6 +132,13 @@ shdwc: poweroff@e001d200 {
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
> @@ -146,6 +153,11 @@ rtc: rtc@e001d800 {
>  			clocks = <&clk32k 1>;
>  		};
>  
> +		gpbr: syscon@e001d700 {
> +			compatible = "microchip,sama7d65-gpbr", "syscon";
> +			reg = <0xe001d700 0x48>;
> +		};
> +

This should go before rtc node to keep the nodes sorted by their address.
I'll adjust while applying.

Thank you,
Claudiu

