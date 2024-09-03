Return-Path: <linux-rtc+bounces-1864-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A634596A7B9
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 21:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61E87281E4A
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 19:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA431DC731;
	Tue,  3 Sep 2024 19:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WaOiBXY/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5201DC720;
	Tue,  3 Sep 2024 19:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725392886; cv=none; b=E4sqaFolTM9pRXSDRbJbtEu+Ov+rWlIqZRREMQstgwtGGIDbr202hrM7x4We1Hs6lroKz3K6gCbbAlOIzB6LD/9ZwDZlzhf6lHcx9Eisf11Hkas0+beOFaUsu3wXFbTD387dJIXt3pJCzq6fHqPBTZ/3mToWQ7XHf0Q0Fd9K4o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725392886; c=relaxed/simple;
	bh=3p0g7g5p3i50KQ2x/lFG1FmicesjihiO7bM0HYwDHBY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=dQ+FkNlt4qppexpm0z9atIeqQBosP87a465F1ccGT/8bFVW2XjbMkFw7nQishmBWEhofgE1gwJfHk/h2RbG0Sfxfq46io5IIqFWNJeYnsb8MDzgAvwywbVpH9tDOYFVqzqel3tXyAAZMijbcpAcEhchx/1wlNC82uaxGdXbpQuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WaOiBXY/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D6BC4CEC4;
	Tue,  3 Sep 2024 19:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725392885;
	bh=3p0g7g5p3i50KQ2x/lFG1FmicesjihiO7bM0HYwDHBY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WaOiBXY/KVKWzml45UCJb+WWIBSw0lvuhE0Mv7k/zWUsAqIsb4Mma5kz3NxWBQ0bq
	 Q5p2ZfbrI+3zDeagmBF4/6SsbBGUnCt9Gb07whtcTgm+Yn9V4kqIHjm2WRtzTCL3Ti
	 etT4gj82eXuH2jyWUUA61XPuxMAYeWXuCztfUklSF0l/KuB+auXZVOC2lwBBoR2ulI
	 5OnSKLo0z4pYiY++tp1dAgKItd46IXo+cd8RZ7GM6DotjLox9rxNPM1u2FKZ9vOsj6
	 WrMHdMs4peE8U35yOBAcPUURlOazdQiP08efgujoHR0JylWzVrkkfqi+wYLOQtSJYs
	 z+Y3lm9vigyDA==
Message-ID: <83fac884d749bda0cf0b346e4e869bc8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240830130218.3377060-8-claudiu.beznea.uj@bp.renesas.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com> <20240830130218.3377060-8-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 07/12] arm64: dts: renesas: r9a08g045: Add VBATTB node
From: Stephen Boyd <sboyd@kernel.org>
Cc: claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
To: Claudiu <claudiu.beznea@tuxon.dev>, alexandre.belloni@bootlin.com, conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org
Date: Tue, 03 Sep 2024 12:48:03 -0700
User-Agent: alot/0.10

Quoting Claudiu (2024-08-30 06:02:13)
> diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g045.dtsi
> index 067a26a66c24..247fa80a4f53 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> @@ -160,6 +160,18 @@ i2c3: i2c@10090c00 {
>                         status =3D "disabled";
>                 };
> =20
> +               vbattb: vbattb@1005c000 {
> +                       compatible =3D "renesas,r9a08g045-vbattb";
> +                       reg =3D <0 0x1005c000 0 0x1000>;
> +                       interrupts =3D <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&=
vbattb_xtal>;
> +                       clock-names =3D "bclk", "rtx";
> +                       #clock-cells =3D <1>;
> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg R9A08G045_VBAT_BRESETN>;
> +                       status =3D "disabled";
> +               };
> +
>                 cpg: clock-controller@11010000 {
>                         compatible =3D "renesas,r9a08g045-cpg";
>                         reg =3D <0 0x11010000 0 0x10000>;
> @@ -425,4 +437,11 @@ timer {
>                 interrupt-names =3D "sec-phys", "phys", "virt", "hyp-phys=
",
>                                   "hyp-virt";
>         };
> +
> +       vbattb_xtal: vbattb-xtal {

The node name should be something like clock-<frequency> but if the
frequency is different per-board then I don't know what should happen
here. Can you leave the vbattb_xtal phandle up above and then require
the node to be defined in the board with the proper frequency after the
dash?

> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               /* This value must be overridden by the board. */
> +               clock-frequency =3D <0>;

