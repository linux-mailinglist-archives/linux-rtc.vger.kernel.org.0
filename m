Return-Path: <linux-rtc+bounces-2260-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 706EA9A5D23
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2024 09:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A7A1B25DFC
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2024 07:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451001D27A5;
	Mon, 21 Oct 2024 07:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGCqNK51"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F356319408B;
	Mon, 21 Oct 2024 07:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495962; cv=none; b=NNN59+ISZxTiED1mByD4rT8bg4IZh9bvBqHg8Rq4REheN6tjHTN2BkbpSSBJauTn1qofnlepsmtreSsgG/Eo1asKqR/mGg5oiJ2Pz3t/13DXuuqlYVoDfCdmBvoPW4mfOpDvkiZQ7+K3Dk+pKVxdHwlNv3NAOPnf9TsxfuF9Gjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495962; c=relaxed/simple;
	bh=TF91/lByhMW1CGFwlu0+quAwto3mDL8Vghp7zpYZlWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7i1Xp1/xvna2HoUHPQMYUNRbEOI4K3Hb9PKg4t3Pydv6+aGaEsYAyN1MgSY8x6hFp4hjO2OCYQ45ZkxE3mv2A5FmhrFYVSjntSGk03t8DlDtr3JnDQpemJywPVUfdqQvtmzFDcqjPf0DQ/tSpUtEwy9XDQOBJ9J/Cs4XOAvtO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGCqNK51; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C45C4CEC3;
	Mon, 21 Oct 2024 07:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729495961;
	bh=TF91/lByhMW1CGFwlu0+quAwto3mDL8Vghp7zpYZlWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DGCqNK51ypchKfZEz0VWoRQ8Hvxon5nbFgCKUov3MvsJeZq59mp7SYFtvbRddXYHC
	 /khg/uZDLWoLcpYV12cRNmiofSa3knkD74KAEUv0/NrGeoI4yF6aP68TDibjAWrAfj
	 PZeP2a7nVr8l8kSEOIIwRQnKDQaH4HswxOMOY2fMWF53zd71py6aqYDYIrba5mO7X7
	 qfU10geLX7aGNATPR5GOsNGA7QGYWK3W1hqnYOnlz1ZwTqS+fOCPp21wCP4/IagYYf
	 3KYbb+ER0ps4Zi+fwnFDTbq+yMntdy+hXJg3tiqSleK5QXO4QarCJPEs+cU6KaJIcv
	 ceblDQWFcCnhA==
Date: Mon, 21 Oct 2024 09:32:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 03/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
Message-ID: <m4kxv7cba6qd67ahhh4cal6sgieohgow6f3tdvqoxvheemtp4j@gpxbkxd3tvat>
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
 <20241019084738.3370489-4-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241019084738.3370489-4-claudiu.beznea.uj@bp.renesas.com>

On Sat, Oct 19, 2024 at 11:47:29AM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC,
> the tamper detector and a small general usage memory of 128B.
> 
> The VBATTB controller controls the clock for the RTC on the Renesas
> RZ/G3S. The HW block diagram for the clock logic is as follows:
> 
>            +----------+ XC   `\
> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>            | 32K clock|      |  |----->|gate|----------->
> 	   | osc      | XBYP |  |      +----+

Messed indent. Switch to spaces.

> RTXOUT --->|          |----->| /
>            +----------+      ,/
> 
> One could connect as input to this HW block either a crystal or
> an external clock device.
> 
> After discussions w/ Stephen Boyd the clock tree associated with this
> hardware block was exported in Linux as:
> 
> input-xtal
>   xbyp
>   xc
>      mux
>         vbattclk
> 
> where:
> - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
> - xc, xbyp are mux inputs
> - mux is the internal mux
> - vbattclk is the gate clock that feeds in the end the RTC
> 
> to allow selecting the input of the MUX though assigned-clock DT
> properties, using the already existing clock drivers and avoid adding
> other DT properties.
> 
> This allows select the input of the mux based on the type of the
> connected input clock:
> - if the 32768 crystal is connected as input for the VBATTB,
>   the input of the mux should be xc
> - if an external clock device is connected as input for the VBATTB the
>   input of the mux should be xbyp

> +  clocks:
> +    items:
> +      - description: VBATTB module clock
> +      - description: RTC input clock (crystal or external clock device)
> +
> +  clock-names:
> +    items:
> +      - const: bclk
> +      - const: rtx
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: VBATTB module reset
> +
> +  quartz-load-femtofarads:
> +    description: load capacitance of the on board crystal
> +    enum: [ 4000, 7000, 9000, 12500 ]

It's not required, so:
default: ?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - power-domains
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
> +    #include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    clock-controller@1005c000 {
> +        compatible = "renesas,r9a08g045-vbattb";
> +        reg = <0x1005c000 0x1000>;
> +        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
> +        clock-names = "bclk", "rtx";
> +        assigned-clocks = <&vbattb VBATTB_MUX>;
> +        assigned-clock-parents = <&vbattb VBATTB_XC>;

Why are you configuring internal clocks to internal parents? That's part
internal to this device, not DTS... or at least some explanation would
be useful.

Best regards,
Krzysztof


