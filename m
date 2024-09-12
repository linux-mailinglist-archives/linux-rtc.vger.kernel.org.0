Return-Path: <linux-rtc+bounces-1959-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 949E39767E6
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 13:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DF731F21173
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 11:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C8219F439;
	Thu, 12 Sep 2024 11:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="0MMyeIV3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9514F13174B;
	Thu, 12 Sep 2024 11:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726140489; cv=none; b=cezw79w5g1rG7eWtNup1nkoSvbIDI0FWHJuuh8YrYHXCTIoxsXWlEU93zhtyfIFPYMaUNF2rLfaRrhNWEf7gzQqkmaepgtERUKdiyUV9ezdj88UZwuchH2/C8Ewnbg+k96ijFy4qrBuyeKSrvlh0FWXrNe/NoesOy7lXM3UnGv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726140489; c=relaxed/simple;
	bh=nDn6unH5tAhXWtRRLOGA+5Nl2pWg7WAtVYRbNLHpai8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7EpOKZXzByt8ZX508zH1W03UuI92QQj5NcHIFGKZs5qtA8j0aa7IW5qPrdK7MM5IPJI9A++pfDUng+Lly3nDEiHgU8UO8syJRIpLN5ev/7+GDgzpPuOfQqt96nlO8ERTXSNEawkayQm7uAOBlJfggg02c2/hvZm+oCay9snruI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=0MMyeIV3; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726140488; x=1757676488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nDn6unH5tAhXWtRRLOGA+5Nl2pWg7WAtVYRbNLHpai8=;
  b=0MMyeIV3aSLOm6gutOxnKP/qPPvGUEhSYEcA8xkyM8ZAcajwfj+0ZiFx
   iojvAcoAMZY4qhbsacg8w887PiOGzBFrR1xoVcaB7xkEGph5Jd10F7VUV
   rC2meF9NI321Mohg324Px3G1qMVEk5LJ1HDSHC2uYRyHi+SqkeO35wltH
   +MUS+1GQG6Qb1t4PSHOoLiEP44AKh7X6BO3VTZNrS+N7SsPMxCxQQxik4
   oQ84g52p4HKjWlP0d4dYg+xnSWldPD9mlMxYkx5Bg9RPa68JvaT1JEyQr
   IAUayAAqxWed4zfw0ugM6hg6d/Bl/9ywhOivgBUXewoeJsIcV6F256nZF
   w==;
X-CSE-ConnectionGUID: Ho+Go28UQ22rTQtj8F2tvQ==
X-CSE-MsgGUID: 42eUs+DHSTujsgDfYWh4nw==
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="asc'?scan'208";a="262681680"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2024 04:28:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 12 Sep 2024 04:27:57 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 12 Sep 2024 04:27:55 -0700
Date: Thu, 12 Sep 2024 12:27:22 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
CC: Conor Dooley <conor@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	<linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, NXP
 S32 Linux Team <s32@nxp.com>, Bogdan-Gabriel Roman
	<bogdan-gabriel.roman@nxp.com>, Ghennadi Procopciuc
	<ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Message-ID: <20240912-immersion-obvious-81a2a0c7a9cb@wendy>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>
 <20240911-racism-playmaker-71cb87d1260f@spud>
 <62ba70ca-429e-476c-bb7b-78f743574a68@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2CwcanIC+v5LIFSS"
Content-Disposition: inline
In-Reply-To: <62ba70ca-429e-476c-bb7b-78f743574a68@oss.nxp.com>

--2CwcanIC+v5LIFSS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 01:50:25PM +0300, Ciprian Marian Costea wrote:
> On 9/11/2024 9:21 PM, Conor Dooley wrote:
> > On Wed, Sep 11, 2024 at 10:00:25AM +0300, Ciprian Costea wrote:
> > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

> > > +  nxp,clksel:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Input clock selector. Choose between 0-SIRC and 2-FIRC.
> > > +      The reason for these IDs not being consecutive is because
> > > +      they are hardware coupled.
> > > +    enum:
> > > +      - 0  # SIRC
> > > +      - 2  # FIRC
> >=20
> > Could you please explain why, given both clocks must be provided by
> > the hardware for there to be a choice, why choosing between them is a
> > property of the hardware?
> >=20
>=20
>=20
> According to RTC module's clocking scheme for S32G2/S32G3 SoCs, it has th=
ree
> potential clock sources to select between:
>   1. FIRC:
>     - fast clock - ~48 MHz output
>     - chosen by default because it is proven to be more reliable (e.g:
> temperature drift).
>   2. SIRC:
>     - slow clock - ~32 kHz output
>     - When in Standby mode, SIRC_CLK is the only available clock for RTC.
> This is important because RTC module is used as a wakeup source from Susp=
end
> to RAM on S32G2/S32G3 SoC. Therefore, a temporary switch to SIRC clock is
> performed when entering Suspend to RAM.
>=20
>   3. EXT_CLK:
>     - has not been tested/validated for those SoCs within NXP's downstream
> Linux. Therefore, I did not treat it, nor mention it, for the moment.
>=20
> Now to answer your question, all above clocks are entering a RTCC[CLKSEL]
> (RTCC - RTC Control Register) mux. Therefore, a selection can be made,
> according to one's needs.

Given both clocks must be provided, what is the benefit of using the
slow clock outside of standby mode? Why would someone not just always
use the fast clock outside of standby and slow in standby?

> I will add a shorter version of above information in the bindings
> documentation in the V2 of this patchset.
>=20
> > > +
> > > +  nxp,dividers:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +    description:
> > > +      An array of two u32 elements, the former encoding DIV512,
> > > +      the latter encoding DIV32. These are dividers that can be enab=
led
> > > +      individually, or cascaded. Use 0 to disable the respective div=
ider,
> > > +      and 1 to enable it.
> >=20
> > Please explain to me what makes this a property of the hardware and how
> > someone would go about choosing the divider settings for their hardware.
> >=20
>=20
> As per hardware RTC module clocking scheme, the output of the clock mux c=
an
> be optionally divided by a combination of 512 and 32 (via other two input
> cascaded muxes) to give various count periods for different clock sources.
>=20
> With respect to choosing the divider settings for custom hardware, it

What do you mean by "custom" hardware? I assume that you mean on a per
board basis?

> depends on the clock source being selected and the desired rollover time.
> For example, on S32G2 or S32G3 SoC based boards, using FIRC (~48-51 MHz)
> with DIV512 enabled results in a rollover time of aprox. 13 hours.

So a different user of the same board might want a different rollover
time? If so, this doesn't really seem like something that should be
controlled from devicetree.

Cheers,
Conor.

--2CwcanIC+v5LIFSS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuLQGgAKCRB4tDGHoIJi
0tEgAP99+nRC38H0f8hEmTD3u+9C+yaZTnWDwwyh7e4qtBLr+gD9EZom/+kmjZsN
6vIDaHsEjiJnlxxws/NntJUiMyrv6gY=
=vCvM
-----END PGP SIGNATURE-----

--2CwcanIC+v5LIFSS--

