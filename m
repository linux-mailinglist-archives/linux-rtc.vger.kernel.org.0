Return-Path: <linux-rtc+bounces-5271-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FA8C3759B
	for <lists+linux-rtc@lfdr.de>; Wed, 05 Nov 2025 19:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B285D4F2CB0
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Nov 2025 18:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256BE321F42;
	Wed,  5 Nov 2025 18:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMYmejB+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60D82749DF;
	Wed,  5 Nov 2025 18:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762367637; cv=none; b=E65DdY3gDahmITL1XXt40MFVQI2L55um21QVNz1GGp7kqrpC8iTu4VEuxlkWKrouDATY60W1zJEORpph4Ov9KNujh91JrNB9szCFZ0u3ujYoVEbw9A9b2L2LJ9o8oKYPReXvqHRmRo32c0+GUFwr4pTbH1XOiCvzbH4ywu+Mvso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762367637; c=relaxed/simple;
	bh=VqJ/IL8uu6HWDCb5Th4A/p6/Q7MW/MOdOkxfXjuZ508=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuA6Vd6jZNqfR5y6M6826hhe0vRBM4qx802V09cY1kB3+tKicoY0nyJDKhtRm13wRbnJBh2lDkeIFSNzzYyQvq5Rbc0RAbqM8e9yY5vBeb0tetkar/YQeEPTbGfBH6E3aujXKjCZpMg6YtBMIhZENgCvD4Ra3leQUKAMhvCWraE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMYmejB+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94CCC4CEF5;
	Wed,  5 Nov 2025 18:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762367636;
	bh=VqJ/IL8uu6HWDCb5Th4A/p6/Q7MW/MOdOkxfXjuZ508=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMYmejB+OHlG15Yqp+E5CyvGnWcmKcmGDM6ePgcearwJ2eVrXQmfnJfwsQk24Qk17
	 w3To2pmXOBfxST4oYDr25BgcQrf7x18OjilkteWtk7dnrwFxZxRMrOoKpI4YwJ2Cpm
	 aVt3YTWrJhTN/XOqq9Wcnes0yAYam3vth8FT4Q4lZX9j6uLRQ7jyGwo9kKZq7rVubF
	 Kx9ciUb2S4O3yKINr1yKjjRcAJfgSh3G4LamjzCa8JM/3GHd2NJkJxNXoihN5SVOOA
	 Wsvcw7yG9TJL4lwjVr7kRR1i88Ihxvaqvz9jyvGS4FReOVzTsidb1aPJZTsm2/+0JH
	 pPcwCKxoVW63Q==
Date: Wed, 5 Nov 2025 18:33:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	claudiu.beznea.uj@bp.renesas.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H
 support
Message-ID: <20251105-gradually-commode-0b5269ec0aa5@spud>
References: <20251103121848.6539-1-ovidiu.panait.rb@renesas.com>
 <20251103121848.6539-2-ovidiu.panait.rb@renesas.com>
 <20251104-magnitude-deodorant-be607e3ff4be@spud>
 <2025110420204948103c2f@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wjGAGSw+cWS2iRHG"
Content-Disposition: inline
In-Reply-To: <2025110420204948103c2f@mail.local>


--wjGAGSw+cWS2iRHG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 09:20:49PM +0100, Alexandre Belloni wrote:
> On 04/11/2025 17:28:27+0000, Conor Dooley wrote:
> > On Mon, Nov 03, 2025 at 12:18:45PM +0000, Ovidiu Panait wrote:
> > > The Renesas RZ/V2H RTC IP is based on the same RTCA3 IP as RZ/G3S
> > > (r9a08g045), with the following differences:
> > > - It lacks the time capture functionality
> > > - The maximum supported periodic interrupt frequency is 128Hz instead
> > >   of 256Hz
> > > - It requires two reset lines instead of one
> > >=20
> > > Add new compatible string "renesas,r9a09g057-rtca3" for RZ/V2H and up=
date
> > > the binding accordingly:
> > > - Allow "resets" to contain one or two entries depending on the SoC.
> > > - Add "reset-names" property, but make it required only for RZ/V2H.
> > >=20
> > > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > +        reset-names:
> > > +          items:
> > > +            - const: rtc
> > > +            - const: rtc_rtest
> >=20
> > If you respin, just make this second one rtest.
>=20
> I already applied it as it had your ack but I can still change it

It's fine.

--wjGAGSw+cWS2iRHG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQuYiwAKCRB4tDGHoIJi
0pV5AQCMb1whhgz4XaSwKDaQRvxE4X1649f5YLbH3+at2WuUkQD/SvrJ/V092Ypk
DdpJUfwHoVXCJjEgMy3WdDZ5BXNHbAQ=
=6z5D
-----END PGP SIGNATURE-----

--wjGAGSw+cWS2iRHG--

