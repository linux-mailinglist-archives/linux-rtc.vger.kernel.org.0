Return-Path: <linux-rtc+bounces-1556-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1FD9371D1
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jul 2024 03:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A76992823DF
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jul 2024 01:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED74E15CB;
	Fri, 19 Jul 2024 01:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sdCtC4eS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68A41362;
	Fri, 19 Jul 2024 01:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721351318; cv=none; b=XVRSSWYP8tdfo4fOAOugpl4YzgnMLhEuuYun29qskGtZpus03UxBH494aVVtvquAWaQq0owC86A29qJYTpMqCuF+hk+bsXV3yfquWcF07dVPzP7U5AQAqOZU2SNumrtUfvnD9QT+PGH+Y3pJtMOZdFKPMHDMh3KS+jCTFLFnA9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721351318; c=relaxed/simple;
	bh=laS8KpgNXmOqI9x98Dwxup3xExT3T+m9nrqsUudLSkM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=tYB0rIcWM2XWDUsdisX+tGlIdMIlpiQdv9essyuF4AdyXC/UrDEL5eKjNn8e2H1z7F8msyOt+sMZaEkLDvO8lVvQ+E2HFOhpT10Of/5ODEvWnGRWpB5y3n5xM7jTZyXtHxre8Qk1tz5iQ7V6TZw1mxvRstmWYosIy/3UpGxcTwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sdCtC4eS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49016C4AF0A;
	Fri, 19 Jul 2024 01:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721351318;
	bh=laS8KpgNXmOqI9x98Dwxup3xExT3T+m9nrqsUudLSkM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sdCtC4eSieRC9x78sjYCL0fnKGAAWqdI91XAtQUnF1kM1oGRqoIilMk7dkjiI3MWE
	 9FafSd2Ha/z7nDvcjtcYtMMee3E1H/oNyFMA5aQ3om6f/2yb4C08UG5kEejNym0CCc
	 GfLAskHC8xD9H5t0VTpNSapSFavTlmtPauXLBsvwSNlnY+K0xjCNyLklERZyjGb8wT
	 p21WQe32xyS4PR0ec0RPf8RaoL1nLJXkwrFNYjns7MrXp51Wc7NFlhIbGCclA8pagM
	 uB5ZxxCJ018QcKgfV0xgMWggjoM97NtKcbEMu36esUlRfAs//FW0SGpA+2jevyYEF5
	 y0IPM+BoanGJw==
Message-ID: <ad8037bca3a99de58c4ef251d3288c15.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <fd8078cb-fe1c-4aef-9e83-be2baa529720@tuxon.dev>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com> <20240716103025.1198495-4-claudiu.beznea.uj@bp.renesas.com> <2abcd440664067d95b1ac0e765ad55a3.sboyd@kernel.org> <e3103f07-ce8a-4c34-af5c-bb271c7ec99a@tuxon.dev> <4cacf090dc56c3ffd15bccd960065769.sboyd@kernel.org> <fd8078cb-fe1c-4aef-9e83-be2baa529720@tuxon.dev>
Subject: Re: [PATCH v2 03/11] clk: renesas: clk-vbattb: Add VBATTB clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
To: alexandre.belloni@bootlin.com, claudiu beznea <claudiu.beznea@tuxon.dev>, conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, lee@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org
Date: Thu, 18 Jul 2024 18:08:36 -0700
User-Agent: alot/0.10

Quoting claudiu beznea (2024-07-18 07:41:03)
>=20
>=20
> On 18.07.2024 03:39, Stephen Boyd wrote:
> >=20
> > Sort of. Ignoring the problem with the subnode for the clk driver, I
> > don't really like having clock-names that don't match the hardware pin
> > names. From the diagram you provided, it looks like clock-names should
> > be "bclk" and "rtxin" for the bus clock and the rtxin signal. Then the
> > clock-cells should be "1" instead of "0", and the mux should be one of
> > those provided clks and "xc" and "xbyp" should be the other two. If that
> > was done, then assigned-clocks could be used to assign the parent of the
> > mux.
> >=20
> > #define VBATTBCLK          0
> > #define VBATTB_XBYP        1
> > #define VBATTB_XC          2
> >=20
> >     vbattb: vbattb@1005c000 {
> >         compatible =3D "renesas,r9a08g045-vbattb";
> >         reg =3D <0x1005c000 0x1000>;
> >         ranges =3D <0 0 0x1005c000 0 0x1000>;
> >         interrupts =3D <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> >         interrupt-names =3D "tampdi";
> >         clocks =3D <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&ext_clk>;
> >         clock-names =3D "bclk", "rtxin";
> >         power-domains =3D <&cpg>;
> >         resets =3D <&cpg R9A08G045_VBAT_BRESETN>;
> >         #clock-cells =3D <1>;
> >         assigned-clocks =3D <&vbattb VBATTBCLK>;
> >       assigned-clock-parents =3D <&vbattb VBATTB_XBYP>;
> >         renesas,vbattb-load-nanofarads =3D <12500>;
> >     };
>=20
> I think I got it now. Thank you for the detailed explanation.
>=20
> >=20
> > One last thing that I don't really understand is why this needs to be a
> > clk provider. In the diagram, the RTC is also part of vbattb, so it
> > looks odd to have this node be a clk provider with #clock-cells at all.
>=20
> I did it like this because the RTC is a different IP mapped at it's own
> address and considering the other VBATTB functionalities (tamper, SRAM)
> might be implemented at some point.
>=20
> I also failed to notice that RTC might not work w/o bclk being enabled
> (thanks for pointing it).

>=20
> I saw that diagram more like describing the always-on power domain
> (PD_VBATTB) where the VBATTB logic and RTC resides. That power domain is
> backed by battery. From HW manual [1]: "PD_VBATT domain is the area where
> the RTC/backup register is located, works on battery power when the power
> of PD_VCC and PD_ISOVCC domain are turned off."

Ah ok, so PD_VBATTB is like a power domain/wrapper and not an IP block
mapped on the bus at the same address as the RTC that it wraps. That
changes things a bit.

>=20
> [1]
> https://www.renesas.com/us/en/products/microcontrollers-microprocessors/r=
z-mpus/rzg3s-general-purpose-microprocessors-single-core-arm-cortex-a55-11-=
ghz-cpu-and-dual-core-cortex-m33-250
>=20
> > Is it the case that if the rtxin pin is connected, you mux that over,
> > and if the pin is disconnected you mux over the internal oscillator?=20
>=20
> From the description here at [2] I'm getting that the "32-KHz clock
> oscillator" block is used when crystal oscillator is connected to RTXIN,
> RTXOUT pins and it is skipped if external clock device is connected.
>=20
> [2] https://i2.paste.pics/RFKJ0.png?rand=3DXq8w1RLDvZ

It looks like in both cases something is connected to the pins. XC is to
use an external crystal connected to both pins and XBYP is to use a
single clk. Given that, perhaps naming the clk "rtx" is simplest and
then using assigned-clock-parents is most direct because there's only
really one "logical" clk input for this device. That means the XC and
XBYP clks have the same parent, "rtx", and the XC clk is a gateable
fixed rate clk while the XBYP clk is a fixed factor clk that does
nothing besides pass on the rate of the "rtx" clk.

>=20
> > I'm
> > really wondering why a clk provider is implemented at all. Why not just
> > hit the registers directly from the RTC driver depending on a
> > devm_clk_get_optional() call?
>=20
> I did it like this because the RTC is a different IP mapped at it's own
> address with it's own interrupts, clock, power domain and considering that
> the other VBATTB functionalities (tamper, SRAM) might be used at some poi=
nt
> in future. At the same time I failed to noticed the VBATTB clock might be
> needed for RTC.

The docs say VBATT in some places. Not sure if you want to rename it to
vbatt and drop the extra b which probably stands for "backup"?

>=20
> Do you consider better to just take a regmap to VBATTB from RTC driver and
> set the VBATTB from RTC driver itself?

No, don't do that. The only change from the above DT node is that the
assigned-clocks and assigned-clock-parents property should be moved to
the RTC node.


     vbattb: vbattb@1005c000 {
         compatible =3D "renesas,r9a08g045-vbattb";
         reg =3D <0x1005c000 0x1000>;
         ranges =3D <0 0 0x1005c000 0 0x1000>;
         interrupts =3D <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-names =3D "tampdi";
         clocks =3D <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&ext_clk>;
         clock-names =3D "bclk", "rtx";
         power-domains =3D <&cpg>;
         resets =3D <&cpg R9A08G045_VBAT_BRESETN>;
         #clock-cells =3D <1>;
         renesas,vbattb-load-nanofarads =3D <12500>;
     };

     rtc@1004ec00 {
         compatible =3D "renesas,r9a08g045-rtc";
         reg =3D <0x1004ec00 0x400>;
         clocks =3D <&vbattb VBATTBCLK>;
         assigned-clocks =3D <&vbattb VBATTBCLK>;
         assigned-clock-parents =3D <&vbattb VBATTB_XBYP>; // Or VBATTB_XC =
if external crystal connected
     };

