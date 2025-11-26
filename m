Return-Path: <linux-rtc+bounces-5459-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DB5C8872A
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Nov 2025 08:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5F42C4EBDC6
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Nov 2025 07:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0021D2BE7C0;
	Wed, 26 Nov 2025 07:38:32 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113FC2F1FD2;
	Wed, 26 Nov 2025 07:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764142712; cv=none; b=Ql+F+16jF9AEMwvlGKbWAzq+qGBoCu5CKjnCe84jD49Wi+I13MngQ1Q3Rlm+Jhv74gdp3ix+QT4+lWpFL68oyWY2hpralFSsYxYdjblNPcBvj9hKhTAW8JexuuCAKX3ZA1iGwInhQ6d3OWpgp2yhjGoSV129+6KClynab7xCrVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764142712; c=relaxed/simple;
	bh=m9HdBlhhrcsb1A89VJ9psxAlEXGuCEmEIB4V6gAH35g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E79pR5EAC+rLNEtpAP4miMgdIgEHCf1boSA7RPPlwKwvYVK9YmY2vv7hnQtk5Y4l836I91UAK2RuCnbU1lGwsCpPSWDIQB2120FX34rIIWX6OAC/0Xk2HqgREW+qpQVUXsYXMXTR8q61377F6iHh5fcgNVrQKg4+NGEV8NBH++M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 755D96C7E0BB; Wed, 26 Nov 2025 08:33:15 +0100 (CET)
Date: Wed, 26 Nov 2025 08:33:15 +0100
From: Link Mauve <kernel@linkmauve.fr>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: alexandre.belloni@bootlin.com, linkmauve@linkmauve.fr,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: gamecube: Check the return value of ioremap()
Message-ID: <aSatO6MgjdnurVBJ@desktop>
References: <20251126012019.1003-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D0VjSyyxrcEI3t+E"
Content-Disposition: inline
In-Reply-To: <20251126012019.1003-1-vulab@iscas.ac.cn>
Jabber-ID: linkmauve@linkmauve.fr


--D0VjSyyxrcEI3t+E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Good catch!

On Wed, Nov 26, 2025 at 09:20:19AM +0800, Haotian Zhang wrote:
> The function ioremap() in gamecube_rtc_read_offset_from_sram() can fail
> and return NULL, which is dereferenced without checking, leading to a
> NULL pointer dereference.
>=20
> Add a check for the return value of ioremap() and return -ENOMEM on
> failure.
>=20
> Fixes: 86559400b3ef ("rtc: gamecube: Add a RTC driver for the GameCube, W=
ii and Wii U")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/rtc/rtc-gamecube.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/rtc/rtc-gamecube.c b/drivers/rtc/rtc-gamecube.c
> index c828bc8e05b9..cd7714437107 100644
> --- a/drivers/rtc/rtc-gamecube.c
> +++ b/drivers/rtc/rtc-gamecube.c
> @@ -242,6 +242,10 @@ static int gamecube_rtc_read_offset_from_sram(struct=
 priv *d)
>  	}
> =20
>  	hw_srnprot =3D ioremap(res.start, resource_size(&res));
> +	if (!hw_srnprot) {
> +		pr_err("Failed to ioremap hw_srnprot\n");

The error messages on lines 240 and 276 start with a lowercase letter,
please use the same case for this message.  From a quick grep through
the kernel, it seems we use either lowercase or uppercase, but I=E2=80=99d
prefer to keep the case consistent in this driver at least.

> +		return -ENOMEM;
> +	}
>  	old =3D ioread32be(hw_srnprot);
> =20
>  	/* TODO: figure out why we use this magic constant.  I obtained it by
> --=20
> 2.50.1.windows.1
>=20

With that change:
Reviewed-by: Link Mauve <kernel@linkmauve.fr>

--=20
Link Mauve

--D0VjSyyxrcEI3t+E
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEjrVT1SzTln43kCLJOWgfYkb2LpAFAmkmrTcACgkQOWgfYkb2
LpB2xgf/UaffCZJpmuVNtBPU1VokxsmdGAGGCvGxerZHtlBLjP2GZNY76mp4p2KQ
g7wrrRHCFg7EmirXWkyd1/eccm69NzVguv+Z7CIh4TpPfMvIpIj1aqOAvKm5Eqlu
U51wQP0SLOaJ1tdHGcjHuuAD8VKom37M5w5Rw3CaqVrhi5Sm+U9Aq16gWxsHN88v
0aHlJoQefztU0mOUWVK9eKHSdYR9Ha/1sXhX/YRWL+I4cm7OHZ6MTQfsaWzS+rPs
YXKpXiKf9JFHrek7Cb2Zji1bWYE+0+1Viw26vKDRKZgmf1etQ5pG/I4BwL74ZSIs
K1JvzbAndtHj5lSjqdv4RmuV1p7pMg==
=qliF
-----END PGP SIGNATURE-----

--D0VjSyyxrcEI3t+E--

