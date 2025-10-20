Return-Path: <linux-rtc+bounces-5108-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9916BEFF82
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Oct 2025 10:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5331188C7EC
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Oct 2025 08:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953832EC08D;
	Mon, 20 Oct 2025 08:32:33 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930B02EBBB2
	for <linux-rtc@vger.kernel.org>; Mon, 20 Oct 2025 08:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760949153; cv=none; b=NqH3KaTTDlofMo758cAXwBUEc0GybYLS8DnMbXuiuWHZ1F8PFBVQPat9NEmWhQ2B00cMlQ4hqz70gBmNG74y3UZAVZWhPk81Vv1aV6bvKlRq8/5UzRuQHno2FH7xjWCfwa/jxIvCC/dCuHh4L3iDuDrYuwp92m3C6CHJQKuIUgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760949153; c=relaxed/simple;
	bh=2Zxi1uzwcNMLMP/BnWqBgmCsQY6hstGNmVrbM1QaAG8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ImnzTu6g6h4oH0hwE+38PsYSjVx34RQWd4j28Wxu+KrKZf9o3WN+mcmwXJ1WsdwF/2tlDhJqc6XRHVV5rgRddJni/UswbtehmctrGNO+1ERXZKcx8zzIhIIYb72x2sZoVBxN/1K++bQODFj88i+3HML+wVxAEgmSE7Ewjukey14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vAlJG-0004CL-QY; Mon, 20 Oct 2025 10:32:06 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vAlJF-004VyN-1v;
	Mon, 20 Oct 2025 10:32:05 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vAlJF-000000004Ju-23bC;
	Mon, 20 Oct 2025 10:32:05 +0200
Message-ID: <d6956eba2f99faedf7e6e28cb23d95a36101e6a9.camel@pengutronix.de>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r9a09g057: Add RTC node
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Biju Das	
 <biju.das.jz@bp.renesas.com>, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>,  "alexandre.belloni@bootlin.com"	
 <alexandre.belloni@bootlin.com>, "robh@kernel.org" <robh@kernel.org>, 
 "krzk+dt@kernel.org"	 <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>,  "geert+renesas@glider.be"	
 <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
 "mturquette@baylibre.com"	 <mturquette@baylibre.com>, "sboyd@kernel.org"
 <sboyd@kernel.org>
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, 
 "linux-renesas-soc@vger.kernel.org"
	 <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	 <linux-clk@vger.kernel.org>
Date: Mon, 20 Oct 2025 10:32:05 +0200
In-Reply-To: <TY7PR01MB14910BB6AD621CC7BA42D56D4D3F5A@TY7PR01MB14910.jpnprd01.prod.outlook.com>
References: <20251019092106.5737-1-ovidiu.panait.rb@renesas.com>
	 <20251019092106.5737-6-ovidiu.panait.rb@renesas.com>
	 <TY3PR01MB11346CBE1C135CBEF82E3E7BE86F4A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
	 <TY7PR01MB14910BB6AD621CC7BA42D56D4D3F5A@TY7PR01MB14910.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org

On Mo, 2025-10-20 at 08:13 +0000, Ovidiu Panait wrote:
> Hi Biju,
>=20
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Sunday, October 19, 2025 1:16 PM
> > To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>; Claudiu Beznea
> > <claudiu.beznea.uj@bp.renesas.com>; alexandre.belloni@bootlin.com;
> > robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > geert+renesas@glider.be; magnus.damm <magnus.damm@gmail.com>;
> > mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de
> > Cc: linux-rtc@vger.kernel.org; linux-renesas-soc@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > clk@vger.kernel.org
> > Subject: RE: [PATCH 5/6] arm64: dts: renesas: r9a09g057: Add RTC node
> >=20
> >=20
> >=20
> > > -----Original Message-----
> > > From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > Sent: 19 October 2025 10:21
> > > Subject: [PATCH 5/6] arm64: dts: renesas: r9a09g057: Add RTC node
> > >=20
> > > Add RTC node to Renesas RZ/V2H ("R9A09G057") SoC DTSI.
> > >=20
> > > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > ---
> > >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > index 40b15f1db930..e426b9978e22 100644
> > > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > @@ -591,6 +591,20 @@ wdt3: watchdog@13000400 {
> > >  			status =3D "disabled";
> > >  		};
> > >=20
> > > +		rtc: rtc@11c00800 {
> > > +			compatible =3D "renesas,r9a09g057-rtca3", "renesas,rz-
> > rtca3";
> > > +			reg =3D <0 0x11c00800 0 0x400>;
> > > +			interrupts =3D <GIC_SPI 524 IRQ_TYPE_EDGE_RISING>,
> > > +				     <GIC_SPI 525 IRQ_TYPE_EDGE_RISING>,
> > > +				     <GIC_SPI 526 IRQ_TYPE_EDGE_RISING>;
> > > +			interrupt-names =3D "alarm", "period", "carry";
> > > +			clocks =3D <&cpg CPG_MOD 0x53>, <&rtxin_clk>;
> > > +			clock-names =3D "bus", "counter";
> > > +			power-domains =3D <&cpg>;
> > > +			resets =3D <&cpg 0x79>, <&cpg 0x7a>;
> >=20
> > Missing reset-names??
> >=20
>=20
> The resets are retrieved using devm_reset_control_array_get_shared(),

The device tree bindings should be designed independently from the
driver implementation.

> which does not rely on named reset entries. This keeps the
> implementation minimal and keeps it in sync with RZ/G3S, which also
> does not take the RTC reset by its name.
>=20
> For this reason, I kept the rtca3 bindings without a reset-names property=
.

There is no need to use the reset names in the driver if they are just
toggled all at once, but unless you can guarantee that there will never
be a need to tell them apart, it would be safer to give them a name.

regards
Philipp

