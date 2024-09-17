Return-Path: <linux-rtc+bounces-2007-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AF097B032
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Sep 2024 14:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F34C22877C7
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Sep 2024 12:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F9E1714B5;
	Tue, 17 Sep 2024 12:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMRLDQ4p"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC3D16FF37;
	Tue, 17 Sep 2024 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726576648; cv=none; b=JVCC+csWyqFaukBztP4EuCmU/GhbO2C0rVKUSkjJyZ7XET/mnvvTY6ELDGaIN1iBak0MvswwEmSiyWWruIIISt+F7fUD+9r13NEDd9Hya7bSXk4j6Rs+2L9t8Dpca4x8yQHeZYEO+82dNTriSHNtx8K7/YKEu7QXXdCoTPrQKzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726576648; c=relaxed/simple;
	bh=PxFeReBWYByWEhz9w7Zs65d5ILcBl+w1tBhDo4/j68M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4zhSdJzp63ohr+NkrZ6OzHIr+ZzxWDAsI6z5DQs6kCowrbLvPKHdww6VImpcGqKVHMrlQm/oX0G1ophqn3EbEbjR0SptZ5PJ5CCSdKh4jwrxXpV3JSIgI57nMKYXGfKud4FIq/VG0c8fsV000WtcD3Q/PsWEtXVJvxinFX+cPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMRLDQ4p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E32C4CECD;
	Tue, 17 Sep 2024 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726576647;
	bh=PxFeReBWYByWEhz9w7Zs65d5ILcBl+w1tBhDo4/j68M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMRLDQ4poM7iWjNXRF02ALzeCHaoslI3yakhyXDDROTugPn1tljmXw3sNmWKENCmw
	 zj8ASnmrPfgZMoJ+N60pzOtA/cx+7lbZU3lGsibXRS46Ar98eUmPXgvze5cRLLSwg6
	 xeRXgPuoxN6qVlnso2F70eF9ZKm4Oipzg5pS4jAFZYPwh0ymrHOVH075z0Xnv11FtK
	 JjRju4cyhD+oVIaGHjlwJdFsfDaXucDh1w492Uk3aOV3xRq6B59GMvUhsho4ZbTZjo
	 klGSLkEGoN1ELjicRTDBlsKIh+ytCMv3bv3BgLUQWHYd5N9rM5Y46YJj2pQ6lhwra/
	 B/6QTho9UTovg==
Date: Tue, 17 Sep 2024 13:37:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Message-ID: <20240917-cola-cloak-5dcaa083a0ef@squawk>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>
 <20240911-racism-playmaker-71cb87d1260f@spud>
 <62ba70ca-429e-476c-bb7b-78f743574a68@oss.nxp.com>
 <2024091212260302903af7@mail.local>
 <2815dcf8-bb90-4e3f-837d-2c2a36a8744e@oss.nxp.com>
 <202409121403232ab1295b@mail.local>
 <c51a8065-2052-4a4e-b871-c0bd8d834548@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3BeO3tzMmChdpin/"
Content-Disposition: inline
In-Reply-To: <c51a8065-2052-4a4e-b871-c0bd8d834548@oss.nxp.com>


--3BeO3tzMmChdpin/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 10:21:32AM +0300, Ciprian Marian Costea wrote:
> On 9/12/2024 5:03 PM, Alexandre Belloni wrote:
> > On 12/09/2024 15:36:46+0300, Ciprian Marian Costea wrote:
> > > > Then should this mux be registered in the CCF so you can use the us=
ual
> > > > clock node properties?
> > >=20
> > > Hello Alexandre,
> > >=20
> > > In hardware, these clock muxes and divisors are part of the RTC module
> > > itself and not external. Therefore, I would say no.
> >=20
> > This is irrelevant, if this is a clock mux, it must be in the CCF, just
> > as when the RTC has a clock output.
> >=20
> >=20
>=20
> I understand your point, but taking into account the fact that FIRC clock
> should be used in most scenarios, would it be acceptable to not export th=
is
> 'clksel' property in the devicetree bindings and simply use the FIRC clock
> by default in the RTC driver ?

Devices should be described in full in the bindings, regardless of
whether or not the driver for the device makes use of that information.

Cheers,
Conor,

>=20
> At least for this patchset, in order to ease the review process. If
> configurable clock source support would want to be enabled and exported v=
ia
> bindings for this S32G2/S32G3 RTC driver, then CCF registration for this =
clk
> mux could be added in future patches.

--3BeO3tzMmChdpin/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZul4BwAKCRB4tDGHoIJi
0rabAP4utycadhKijKcCpjsXmcNUL/rYEJ9wsiGlj1v+vYZIYgEA91U1l8tZhMjG
99iEztEIFWyUsVElcZrTg5RCUGZ2FwE=
=032Y
-----END PGP SIGNATURE-----

--3BeO3tzMmChdpin/--

