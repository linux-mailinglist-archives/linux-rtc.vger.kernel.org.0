Return-Path: <linux-rtc+bounces-2512-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC739C4707
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 21:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1457286940
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 20:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546691BC099;
	Mon, 11 Nov 2024 20:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rffi9uUX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240EC1B3B28;
	Mon, 11 Nov 2024 20:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731357554; cv=none; b=d/u8FxItAx5IKYbOEHXBTXp2V2ya9uekY2sPGxvlZnlk3tWzH08YPR8iK83pv4LY+2KPPwyTDA4ZuODCfeb0p5Yj2Jfgq3YH3qSJLI1LEn3Mnz7Uwsq+plMrRaE6eq3hR5pxUDv0z0Uuf4FzL1WtgbzHiXfCZsqPrJqGVMoPj54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731357554; c=relaxed/simple;
	bh=UwkMTjW6sov+wPp+3u36kErHK1s/HqcK3Hwsq1a5W00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwY73hNT9oDsbu3rifL3Rh3wWk8yU21xGZLNFrPdAaHJsOcje45FMg2yxpW0zXSh3kyCnYnuYUGC5hEf4lxl3fsJp0aLHo4s5PSU8XEOIxt9Pkve91CR8y/9zlb8Q+53CUGlPLBN9aqAw6u1DeWCkO/olFckpIAzTjq7qm67XMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rffi9uUX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964D1C4CED5;
	Mon, 11 Nov 2024 20:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357554;
	bh=UwkMTjW6sov+wPp+3u36kErHK1s/HqcK3Hwsq1a5W00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rffi9uUXqJX97dyyGl3VIoon2F640mhLmBoXFJei8nKQ3pBb8Rg97Im4U8Nog52Vg
	 u6ztx5vi9Zuouy0H2W+GZBWlaSqaP1pv6406zAZj6p5IlgBZXsPRjCWwgED7Pj2Qfg
	 d7hp2NRZA1VQ+q3jlM1LESIcUkVUHoKnZff9yWKK/dwYz8ktJPJl0X6iGDv70Any6Q
	 riJNz2ma2oWXWlrGvhP0vf4u2tCHmK20xlqDtNTGsnzAORd4ZBFaRaFLutWa7KXNnB
	 vNDoScx5dGelqgf4wFyHH8btS3Dal3EMhLiSoiWAI409z81ArqkS0xUq3F643gsaiQ
	 zyL7BeKZwR09Q==
Date: Mon, 11 Nov 2024 20:39:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 10/14] dt-bindings: rtc: sun6i: Add Allwinner A523 support
Message-ID: <20241111-bountiful-armed-88c010ad592a@spud>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-11-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aAEbuXVm7Dr2XTcd"
Content-Disposition: inline
In-Reply-To: <20241111013033.22793-11-andre.przywara@arm.com>


--aAEbuXVm7Dr2XTcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 01:30:29AM +0000, Andre Przywara wrote:
> The RTC in the Allwinner A523 SoC is compatible to the D1 and R329, so
> just add its name and use the R329 as a fallback.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--aAEbuXVm7Dr2XTcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJrbQAKCRB4tDGHoIJi
0pirAQCbFDBqlsipWFbGSgOWt/7FKy8zoNUR7RczsJFMnDFlCgD9Ftj4Q9lmlqbR
/UwVx0Fk9EBUBv94ctiTAmXz+3VTzQk=
=a6hw
-----END PGP SIGNATURE-----

--aAEbuXVm7Dr2XTcd--

