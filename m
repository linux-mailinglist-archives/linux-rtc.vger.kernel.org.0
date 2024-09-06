Return-Path: <linux-rtc+bounces-1902-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C3996FE45
	for <lists+linux-rtc@lfdr.de>; Sat,  7 Sep 2024 01:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E21D1C210B0
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Sep 2024 23:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6FF15A4B0;
	Fri,  6 Sep 2024 23:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9JGbMWo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E9C1B85DC;
	Fri,  6 Sep 2024 23:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725663663; cv=none; b=Mxof9P7s2rUTbMymIIT/yjCB/xL/Pa4ayc9Pxhmpew0qxL1R+1f73TZJ08EE1ccE+IZZD7YF5bsAtaLlkrgQJa5TcOTeaTX37mchjxmeXGsKborNCftqKtn9hxm9jWyrcDE9VEsZw2rZKZDwtX/xxv2uu1cRi5K7JF0CYO53pVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725663663; c=relaxed/simple;
	bh=KAS/Rwnc7T0eZM71tzNaAc3sWj4LOqmY83CNc7otz+k=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=a5kZMcKWUtijiwa2d5g2olNyz8Ix2s5P9T1c5WPBUPhI0NLL5EoGAF2+FvQ0zIjddQ3QaR3xXtqTSeygrzG6mA+lnIbURqJ3Q2Y4KMil++50eHggSok2T6TjivYROCwcjETRl3lzcLimjTC6TDe9+mCX8LBSnpX9d/NGChdFUxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9JGbMWo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA8FC4CEC4;
	Fri,  6 Sep 2024 23:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725663662;
	bh=KAS/Rwnc7T0eZM71tzNaAc3sWj4LOqmY83CNc7otz+k=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=V9JGbMWoTcRD+R7JyDvalu0KM0ftwD1NewkIvjjoXLdwmSTIv4ql+UD7IusXhbXw3
	 C4Awf5d0kXFiXSFVoQIP/Ozn+dVnMI9XZAuMFRumtmsoJZD4C8cbbDrN/nom748O+U
	 t9vNhe4N+QvEgPVi1cpvkmSSriqlPpZ3za/vquA22K/5IDlT3UCBBJ7QtAIHPErkMH
	 pErs/lY+Fppj2KJsSQqW2rBQQ9dkd22FY9D56Nn5PbmU7KErcCNaVLkjtN/ZJblDqd
	 yQgnoN6M9fYmYho+njxn3tlDKKWtoK2NC7lvwYqFUBRaOSGdBuyxarHuK2mtIInTSC
	 VLHPd17TElaHg==
Message-ID: <951b5c09c3ca2de3f0a28a078084f7dd.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdX40ROk2vZe9VHoiPDJCvtrjto+swkicv29LFyQ7zoVng@mail.gmail.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com> <20240830130218.3377060-8-claudiu.beznea.uj@bp.renesas.com> <83fac884d749bda0cf0b346e4e869bc8.sboyd@kernel.org> <d8303146-89e0-4229-a3fe-9f3c42434045@tuxon.dev> <c744cf7a70a3f97722146215a7620cfb.sboyd@kernel.org> <CAMuHMdX40ROk2vZe9VHoiPDJCvtrjto+swkicv29LFyQ7zoVng@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] arm64: dts: renesas: r9a08g045: Add VBATTB node
From: Stephen Boyd <sboyd@kernel.org>
Cc: alexandre.belloni@bootlin.com, claudiu beznea <claudiu.beznea@tuxon.dev>, conor+dt@kernel.org, krzk+dt@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 06 Sep 2024 16:01:00 -0700
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2024-09-06 00:28:38)
> Hi Stephen,
>=20
> On Thu, Sep 5, 2024 at 8:09=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wr=
ote:
> > Quoting claudiu beznea (2024-09-04 05:17:30)
> > > On 03.09.2024 22:48, Stephen Boyd wrote:
> > > > The node name should be something like clock-<frequency> but if the
> > > > frequency is different per-board then I don't know what should happ=
en
> > > > here.
> > >
> > > The frequency should be always around 32768 Hz but not necessarily ex=
actly
> > > 32768 Hz. It depends on what is installed on the board, indeed. RTC c=
an do
> > > time error adjustments based on the variations around 32768 Hz.
> > >
> > > > Can you leave the vbattb_xtal phandle up above and then require
> > > > the node to be defined in the board with the proper frequency after=
 the
> > > > dash?
> > >
> > > Is it OK for you something like this (applied on top of this series)?
> >
> > Yes, it's too bad we can't append to a property in DT, or somehow leave
> > alone certain cells and only modify one of them.
>=20
> My main objections are that (1) this approach is different than the one u=
sed
> for all other external clock inputs on Renesas SoCs, and (2) this requires
> duplicating part of the clocks property in all board DTS files.
>=20

Can 'clock-ranges' be used here? Leave the cell as null in the SoC dtsi
file and then fill it in with clocks property at the parent node. I
think you'd have to use clock-names for this though.

