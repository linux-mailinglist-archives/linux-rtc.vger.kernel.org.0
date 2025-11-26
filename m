Return-Path: <linux-rtc+bounces-5461-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 342CBC8896D
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Nov 2025 09:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E77533A37CB
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Nov 2025 08:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD1628C035;
	Wed, 26 Nov 2025 08:14:57 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A7D2BCF7F;
	Wed, 26 Nov 2025 08:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764144897; cv=none; b=aAZGoKPtCbOo+9Hl1clepK0/Nz0T+IzJkx3cvtkFxmWQDXvIyqs+8RrymAvnHUTJZPJAoZwp3JVXTqtdhH8LyPOxjc4ak+jI4xBitI9Ad8BoSXDzhsqUtsZ6Hnch6GiTE5X1fi2b/Y1aWLGypNoDaG7LUt17RyS99IUinOETOoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764144897; c=relaxed/simple;
	bh=AbPVhOSeSpiJe/BvhuaIRtNsXq/SpC+SDk2NFGL6cds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOJh0MuoMd7jCWX60Ju+FQK5EJUpn90b+EMN6sh8pvvuJXQOQkuF6B4pr9lE7VjEB0k1HYbBT77PKoLs97TFzZnW7FjLnm8S0AOFT0fDlU//v6yJs+7l80VJbb27hlv2TUcYV81G8fF+/QZt2dJ5w0lU9M+JNSUF9BJ6SEFFosM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id DBF2E6C7FE30; Wed, 26 Nov 2025 09:14:50 +0100 (CET)
Date: Wed, 26 Nov 2025 09:14:50 +0100
From: Link Mauve <kernel@linkmauve.fr>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: alexandre.belloni@bootlin.com, linkmauve@linkmauve.fr,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtc: gamecube: Check the return value of ioremap()
Message-ID: <aSa2-nczGtaVihYE@desktop>
References: <20251126012019.1003-1-vulab@iscas.ac.cn>
 <20251126080625.1752-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6b9PuffNNLcSENqd"
Content-Disposition: inline
In-Reply-To: <20251126080625.1752-1-vulab@iscas.ac.cn>
Jabber-ID: linkmauve@linkmauve.fr


--6b9PuffNNLcSENqd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 26, 2025 at 04:06:25PM +0800, Haotian Zhang wrote:
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

You forgot to carry my R-b, but here it is again:
Reviewed-by: Link Mauve <kernel@linkmauve.fr>

> ---
> Changes in v2:
>   -Use lowercase for error message to match existing style.
> ---
>  drivers/rtc/rtc-gamecube.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/rtc/rtc-gamecube.c b/drivers/rtc/rtc-gamecube.c
> index c828bc8e05b9..045d5d45ab4b 100644
> --- a/drivers/rtc/rtc-gamecube.c
> +++ b/drivers/rtc/rtc-gamecube.c
> @@ -242,6 +242,10 @@ static int gamecube_rtc_read_offset_from_sram(struct=
 priv *d)
>  	}
> =20
>  	hw_srnprot =3D ioremap(res.start, resource_size(&res));
> +	if (!hw_srnprot) {
> +		pr_err("failed to ioremap hw_srnprot\n");
> +		return -ENOMEM;
> +	}
>  	old =3D ioread32be(hw_srnprot);
> =20
>  	/* TODO: figure out why we use this magic constant.  I obtained it by
> --=20
> 2.50.1.windows.1
>=20

--=20
Link Mauve

--6b9PuffNNLcSENqd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEjrVT1SzTln43kCLJOWgfYkb2LpAFAmkmtvcACgkQOWgfYkb2
LpCtsAgAizir34C7GoszsD64bDEhiWC2XtKEIlTWPiiJzS6Fjen963mg+xS35mEQ
Hi9i+gjxq8SdxN192IFF5+a6tPTf/2FAPXT/jafnTlR1WFBe23BmKBwod6fefv7f
1ceViym3/iBUPxNmm4p1Z9IDwV+de4DP/fOFMNBm7GlAlU1csaZf0yCP7ssZydmI
t1Fv8qj4twN5TerM5aX06kHs8H1L7EeLMD9jUPQhzlFjQuYQYcOcSVpFF+EgwCZZ
82qCK9kM3rSPKFMAblA3+5XQ+ASP2ZPcPWLyJy19NfmFzaHapPX5aQSY4uYugOB8
0WUMDY0MQZ459II91tXmGz8ABI0JTA==
=AXuV
-----END PGP SIGNATURE-----

--6b9PuffNNLcSENqd--

