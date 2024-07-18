Return-Path: <linux-rtc+bounces-1544-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA70593456E
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 02:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 025101C21688
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 00:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0059810FA;
	Thu, 18 Jul 2024 00:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2KwpPmU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9911FA3;
	Thu, 18 Jul 2024 00:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721263157; cv=none; b=qiFzmaLcVd4bD9p4ZLkvupI7sPj4x24didiLhhcehAw77+HkABe/CLVD+I/leOjblgGslWXw5XYFKKRl/hd+s/N+OBDL41E4BIHZSEBDb0rvpC/Dh0EN1OFSsd5Jk50iz7GbzHCRH0OaORdKDheB9W3uVda70ibHyIU+18QKzuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721263157; c=relaxed/simple;
	bh=q0p1lGORvpOF1Z0/NFbmLqzuOehoaT6QsYiDkqPI4AU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=WJ1TE1aECMe1SRgLFC8heuEcSo/ztld8YSHzNZN2oEBhnjjBymt+fCBRdHjPVJy1zjns9yrDITbNkcRZjSgDLBLtfl8VZqU/kiGLkuOCacOn5aWCVVtr9gTUk1lrrX7OjF5D7xnTrtfIwNAFbX7d36MxX/9DxFbF9TqxPQC4WkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2KwpPmU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B2DFC4AF0B;
	Thu, 18 Jul 2024 00:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721263157;
	bh=q0p1lGORvpOF1Z0/NFbmLqzuOehoaT6QsYiDkqPI4AU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=r2KwpPmU+W7hAxnlAdOuiRgYgE7yxb6DdPs/gm35QxQogv+05JHUph0GiF/Qw18KJ
	 yC6nnzjXCf2/ANay177iI2v2cjYdhg05ZZht3uQZ5t+sUJPoM02marz/hKjtwhPF+Q
	 JquCBIf+WWJfVbmmFry1WI5KkUFRpoIIc0x39TfiqHm/EPcRuRU/HIr/LAcpZIxQSx
	 CShfdZY1d/2N6jae0YgdsE3iwUJWAmN/tstqV0l7VJlFoLZCv59ZdAbYetIfgotDxF
	 7/pVXL9wBN11m71YDowNNMoqqeG2BTxJ3k2R96gv0iILYeuDxb8Vqh5rKLk8R0l8tK
	 I5sl9upWK2o8Q==
Message-ID: <4cacf090dc56c3ffd15bccd960065769.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e3103f07-ce8a-4c34-af5c-bb271c7ec99a@tuxon.dev>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com> <20240716103025.1198495-4-claudiu.beznea.uj@bp.renesas.com> <2abcd440664067d95b1ac0e765ad55a3.sboyd@kernel.org> <e3103f07-ce8a-4c34-af5c-bb271c7ec99a@tuxon.dev>
Subject: Re: [PATCH v2 03/11] clk: renesas: clk-vbattb: Add VBATTB clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
To: alexandre.belloni@bootlin.com, claudiu beznea <claudiu.beznea@tuxon.dev>, conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, lee@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org
Date: Wed, 17 Jul 2024 17:39:15 -0700
User-Agent: alot/0.10

Quoting claudiu beznea (2024-07-17 01:31:20)
> Hi, Stephen,
>=20
> On 17.07.2024 01:28, Stephen Boyd wrote:
> > Quoting Claudiu (2024-07-16 03:30:17)
> >> diff --git a/drivers/clk/renesas/clk-vbattb.c b/drivers/clk/renesas/cl=
k-vbattb.c
> >> new file mode 100644
> >> index 000000000000..8effe141fc0b
> >> --- /dev/null
> >> +++ b/drivers/clk/renesas/clk-vbattb.c
> >> @@ -0,0 +1,212 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * VBATTB clock driver
> >> + *
> >> + * Copyright (C) 2024 Renesas Electronics Corp.
> >> + */
> >> +
> >> +#include <linux/cleanup.h>
> >> +#include <linux/clk.h>
> >=20
> > Prefer clk providers to not be clk consumers.
>=20
> I added it here to be able to use devm_clk_get_optional() as it was
> proposed to me in v1 to avoid adding a new binding for bypass and detect =
if
> it's needed by checking the input clock name.
>=20

Understood.

>=20
> >=20
> > I also wonder if this is really a mux,=20
>=20
> It's a way to determine what type of clock (crystal oscillator or device
> clock) is connected to RTXIN/RTXOUT pins of the module
> (the module block diagram at [1]) based on the clock name. Depending on t=
he
> type of the clock connected to RTXIN/RTXOUT we need to select the XC or
> XBYP as input for the mux at [1].
>=20
> [1] https://gcdnb.pbrd.co/images/QYsCvhfQlX6n.png

That diagram shows a mux block, so at least something in there is a mux.
From what I can tell the binding uses clock-names to describe the mux.
What I'd like to avoid is using clk_get() to determine how to configure
the mux. That's because clk_get() is a clk consumer API, and because we
want clk providers to be able to register clks without making sure that
the entire parent chain has been registered first. Eventually, we'd like
clk_get() to probe defer if the clk is an orphan. Having clk providers
use clk_get() breaks that pretty quickly.

>=20
>=20
> > and either assigned-clock-parents should be used,=20
> > or the clk_ops should have an init routine that looks at
> > which parent is present by determining the index and then use that to
> > set the mux. The framework can take care of failing to set the other
> > parent when it isn't present.
>=20
>=20
> On the board, at any moment, it will be only one clock as input to the
> VBATTB clock (either crystal oscillator or a clock device). If I'm getting
> you correctly, this will involve describing both clocks in some scenarios.
>=20
> E.g. if want to use crystal osc, I can use this DT description:
>=20
> vbattclk: clock-controller@1c {
>         compatible =3D "renesas,r9a08g045-vbattb-clk";
>         reg =3D <0 0x1c 0 0x10>;
>         clocks =3D <&vbattb_xtal>;
>         clock-names =3D "xin";
>         #clock-cells =3D <0>;
>         status =3D "disabled";
> };
>=20
> vbattb_xtal: vbattb-xtal {
>         compatible =3D "fixed-clock";
>         #clock-cells =3D <0>;
>         clock-frequency =3D <32768>;
> };
>=20
> If external clock device is to be used, I should describe a fake clock to=
o:
>=20
> vbattclk: clock-controller@1c {
>         compatible =3D "renesas,r9a08g045-vbattb-clk";
>         reg =3D <0 0x1c 0 0x10>;
>         clocks =3D <&vbattb_xtal>, <&ext_clk>;

Is vbattb_xtal the fake clk? If so, I'd expect this to be

	clocks =3D <0>, <&ext_clk>;

so that we don't have a useless clk node.

>         clock-names =3D "xin", "clkin";
>         #clock-cells =3D <0>;
>         status =3D "disabled";
> };
>=20
> vbattb_xtal: vbattb-xtal {
>         compatible =3D "fixed-clock";
>         #clock-cells =3D <0>;
>         clock-frequency =3D <0>;
> };
>=20
> ext_clk: ext-clk {
>         compatible =3D "fixed-clock";
>         #clock-cells =3D <0>;
>         clock-frequency =3D <32768>;
> };
>=20
> Is this what you are suggesting?
>=20

Sort of. Ignoring the problem with the subnode for the clk driver, I
don't really like having clock-names that don't match the hardware pin
names. From the diagram you provided, it looks like clock-names should
be "bclk" and "rtxin" for the bus clock and the rtxin signal. Then the
clock-cells should be "1" instead of "0", and the mux should be one of
those provided clks and "xc" and "xbyp" should be the other two. If that
was done, then assigned-clocks could be used to assign the parent of the
mux.

#define VBATTBCLK          0
#define VBATTB_XBYP        1
#define VBATTB_XC          2

    vbattb: vbattb@1005c000 {
        compatible =3D "renesas,r9a08g045-vbattb";
        reg =3D <0x1005c000 0x1000>;
        ranges =3D <0 0 0x1005c000 0 0x1000>;
        interrupts =3D <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
        interrupt-names =3D "tampdi";
        clocks =3D <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&ext_clk>;
        clock-names =3D "bclk", "rtxin";
        power-domains =3D <&cpg>;
        resets =3D <&cpg R9A08G045_VBAT_BRESETN>;
        #clock-cells =3D <1>;
        assigned-clocks =3D <&vbattb VBATTBCLK>;
	assigned-clock-parents =3D <&vbattb VBATTB_XBYP>;
        renesas,vbattb-load-nanofarads =3D <12500>;
    };

One last thing that I don't really understand is why this needs to be a
clk provider. In the diagram, the RTC is also part of vbattb, so it
looks odd to have this node be a clk provider with #clock-cells at all.
Is it the case that if the rtxin pin is connected, you mux that over,
and if the pin is disconnected you mux over the internal oscillator? I'm
really wondering why a clk provider is implemented at all. Why not just
hit the registers directly from the RTC driver depending on a
devm_clk_get_optional() call?

