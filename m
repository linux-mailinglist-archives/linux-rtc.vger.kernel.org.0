Return-Path: <linux-rtc+bounces-1912-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDE1972469
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Sep 2024 23:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FF8B1C23364
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Sep 2024 21:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BDC18C333;
	Mon,  9 Sep 2024 21:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/6I3CbD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A966189F2F;
	Mon,  9 Sep 2024 21:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725916727; cv=none; b=tXDRrHq2jLLOICQlOW2L4d6QT+SVkHuqBebpRVgVnEIEF4dS63s/igVK2SAXvDnslC7iV3ioyCvYH6i/jbHsgnCwFKOP5A57kNTe0tBgYBVGSn6jL3SPAWAmZSedH7B0092CFWDx8FsIlw7vMpiO9Frv++p05Wp0C70s9+fYbp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725916727; c=relaxed/simple;
	bh=m+5SkT5EybNjaxvCRkvBg5O1miTtGMUqFVea2R19J2w=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=GYtYtvSUffIBQuSO2tOO92BduLTylFAciEfui1jS7b7FkNocPLrexWvoP67uqzNi3pbDzoj0BoZqSz9WsvZYDQokJYup8AHTKgpf7n9SIGI01MsI6kbZ0KtrR1T5ZRg4Yp8ZYH1rWcTk0jw8lQVA3vU9w3qTle2nPSsk3Rdh97s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/6I3CbD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BE8C4CEC5;
	Mon,  9 Sep 2024 21:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725916725;
	bh=m+5SkT5EybNjaxvCRkvBg5O1miTtGMUqFVea2R19J2w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=J/6I3CbDnNTKmJ3L2IF152M/ltoPcO5pFmy+gkca+OT1rP4WbrlaYXtr58+Vpxw87
	 LkrpSj8boSoQSpmNL4d4en/VfCIwyWsyw50l7ejeJV7+aAbdCKlA18NULD1Baf7kXd
	 S0lxQHfWWmtae2GQAMPVFzv0YAzZnctIsOUZ0rxlY4GYs5e1/uLhp8xZIqAealnVFs
	 +pLWI0oWIP6iw1X14AyJJMEw5svZsWbKqJNh4a5Tget9R2dCRPlzCCRkVjWkh6OSoN
	 x22OuX5oJfC3eM6+/L+GY9AJ1Isiu3gIqMebsuGdobnrLvdcNx/5VxgesPEt7kApwM
	 +cN69JplcUIig==
Message-ID: <8fa43530daa941b059b2de1e15dd7773.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdWBT6AaH2_5qj+j4s8JeeO3qrhYUTCVG=s_J13nSzYPsQ@mail.gmail.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com> <20240830130218.3377060-8-claudiu.beznea.uj@bp.renesas.com> <83fac884d749bda0cf0b346e4e869bc8.sboyd@kernel.org> <d8303146-89e0-4229-a3fe-9f3c42434045@tuxon.dev> <c744cf7a70a3f97722146215a7620cfb.sboyd@kernel.org> <CAMuHMdX40ROk2vZe9VHoiPDJCvtrjto+swkicv29LFyQ7zoVng@mail.gmail.com> <951b5c09c3ca2de3f0a28a078084f7dd.sboyd@kernel.org> <CAMuHMdWBT6AaH2_5qj+j4s8JeeO3qrhYUTCVG=s_J13nSzYPsQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] arm64: dts: renesas: r9a08g045: Add VBATTB node
From: Stephen Boyd <sboyd@kernel.org>
Cc: alexandre.belloni@bootlin.com, claudiu beznea <claudiu.beznea@tuxon.dev>, conor+dt@kernel.org, krzk+dt@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 09 Sep 2024 14:18:43 -0700
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2024-09-09 05:11:03)
> Hi Stephen,
>=20
> On Sat, Sep 7, 2024 at 1:01=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wr=
ote:
> > Quoting Geert Uytterhoeven (2024-09-06 00:28:38)
> > >
> > > My main objections are that (1) this approach is different than the o=
ne used
> > > for all other external clock inputs on Renesas SoCs, and (2) this req=
uires
> > > duplicating part of the clocks property in all board DTS files.
> >
> > Can 'clock-ranges' be used here? Leave the cell as null in the SoC dtsi
> > file and then fill it in with clocks property at the parent node. I
> > think you'd have to use clock-names for this though.
>=20
> "clock-ranges" does not seem to be well-documented...

Yeah, I wasn't aware of it for years!

>=20
> IUIC, your suggestion is to:
>   1. Add "clock-ranges" to the /soc subnode,
>   2. Completely leave out the "rtx" clock from the clocks property
>      of the vbattb@1005c000 node,
>   3. Add the following to the board DTS:
>=20
>         &soc {
>                 clocks =3D <&vbattb_xtal>;
>                 clock-names =3D "rtx";
>         };
>=20
> Then, when resolving "rtx" for the vbattb@1005c000 node,
> of_parse_clkspec() would iterate up and find the proper vbattb_xtal.
> Is that correct? And probably that should be done for other external
> clock inputs as well?

Sounds about right.

>=20
> Still, it looks a bit complicated and un-intuitive. And what about
> e.g. carrier boards with a SoM, where some clocks are provided by
> the SoM, and some by the carrier? In that case you still have to
> override the clock and clock-names properties in the carrier .dts,
> thus duplicating all clocks provided by the SoM.

This is the same case as the board wanting to override the soc node?
When it's a SoM is there a node for the SoM? Is the clock on the SoM?
Does this case exist? Hopefully this isn't a straw man.

>=20
> So I prefer the original approach, like is done for all other external
> SoC clock inputs on Renesas SoCs.
>=20

Sure. I'm just suggesting to follow the preferred approach by DT
maintainers. I don't feel strongly either way and I'm not the SoC
maintainer so feel free to do what you want.

