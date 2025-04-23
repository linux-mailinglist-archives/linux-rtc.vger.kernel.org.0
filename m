Return-Path: <linux-rtc+bounces-3996-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EA4A99ACA
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 23:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CD7B461E74
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 21:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B22743AA4;
	Wed, 23 Apr 2025 21:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="bB5sIxAr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D5C2701CA;
	Wed, 23 Apr 2025 21:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745443837; cv=pass; b=fAmqnot9narRWGrO/XkTKSD5oLd9SpYQUsOt8r1z70qoj4qF2mu1MTwGrgwgSYNj/kj4iwIsm6kPKkYPzrNcybw/qgWS0yaE3/ANSmvMgywOnLRsC614gBO1UEsG74rN3qsEyrJEfRc4X0O927Hucyl+83PRcVkHit9z59YTTOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745443837; c=relaxed/simple;
	bh=6W7AW2P10mcoSDCLHC32d+BKV42VtGmMOCb4zzg9Xrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auahw6WzI6wk2Q0RnWuzIxWeQhyW3hltANTFsGDQYOSxhebRwIqMRHUj6YQR80tGV/A34EgFLXmFUDqBlC6enDH3SWeuoxm4duftpGLZXe5EcHOdobr/+dpJumZa9EyLRXqzxCbxe7xItlrJzuq9Q9CvbqissvP1nVLL5LDydLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=bB5sIxAr; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1745443815; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MsENPi97IxCRERi/utANxNjJvgDjfuxdjibGMuz/l0SycvNBdd03xe3FlEZqf4H50Pi3ZeqhidUZIW1QYTw+ETNh0DKA6TsMks+enzMIpFUGcYsL71Xds9QqV2b5OPB2VmhiXtiYHAUtibfIWQCIZRyyZq7CsTVfm53kFsYWe4o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745443815; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y224ndEaJ4kmwjEFR0mobY8iYn6FhE5efZNOwsWV3f4=; 
	b=ipkAhw8z/+06YhgPe5Cxk0aN/qHEEhTqmASCdmu6lQLB2/kEHnYdhjMqK2OvGUpfG/EtTnWbO1Ry9SP53GFua/JRq0fH8sjZ2n7Q+H5PyyXKcMoNBpCJqnDyp3/9uhAXlkQ8LuHrnYf9LjRwt2BpXYhh72C1XTU3GnDkKWXbT3E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745443815;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Y224ndEaJ4kmwjEFR0mobY8iYn6FhE5efZNOwsWV3f4=;
	b=bB5sIxAr8YtC8SNqTZF18dkQ8KFpfIlE5/KPEFqVsu+IyETLhKm0MWd41rYH4uFm
	hJRgicGrOYEmBkFywf6ma+DiFgKuGc5TjMoE7HYawL5zIYZ1u4OPiMPIjlt5dMxmGC/
	O9l2vuKc0kYFDK3Wl78txzUVwK9F4znTZ1iTfHKQ=
Received: by mx.zohomail.com with SMTPS id 1745443813426707.7612012497216;
	Wed, 23 Apr 2025 14:30:13 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 1B8CA1807A5; Wed, 23 Apr 2025 23:30:09 +0200 (CEST)
Date: Wed, 23 Apr 2025 23:30:08 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] rtc: cpcap: drop unused module alias
Message-ID: <3itkecxmpgwk2c5epczt3dvpw6gawktmmnc5irwyrvhencfk6i@m6q5xqupa2ix>
References: <20250423130318.31244-1-johan+linaro@kernel.org>
 <20250423130318.31244-3-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zsgokqhlyivrogha"
Content-Disposition: inline
In-Reply-To: <20250423130318.31244-3-johan+linaro@kernel.org>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/245.434.74
X-ZohoMailClient: External


--zsgokqhlyivrogha
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/7] rtc: cpcap: drop unused module alias
MIME-Version: 1.0

Hi,

On Wed, Apr 23, 2025 at 03:03:13PM +0200, Johan Hovold wrote:
> The driver only supports OF probe so drop the unused platform module
> alias.
>=20
> Fixes: dd3bf50b35e3 ("rtc: cpcap: new rtc driver")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/rtc/rtc-cpcap.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/rtc/rtc-cpcap.c b/drivers/rtc/rtc-cpcap.c
> index 568a89e79c11..c170345ac076 100644
> --- a/drivers/rtc/rtc-cpcap.c
> +++ b/drivers/rtc/rtc-cpcap.c
> @@ -320,7 +320,6 @@ static struct platform_driver cpcap_rtc_driver =3D {
> =20
>  module_platform_driver(cpcap_rtc_driver);
> =20
> -MODULE_ALIAS("platform:cpcap-rtc");
>  MODULE_DESCRIPTION("CPCAP RTC driver");
>  MODULE_AUTHOR("Sebastian Reichel <sre@kernel.org>");
>  MODULE_LICENSE("GPL");
> --=20
> 2.49.0
>=20

--zsgokqhlyivrogha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmgJW90ACgkQ2O7X88g7
+prPXRAAkhmT0rVb92JIBqZmhOoyN1J+JbDfA74rIrNWbXNQLHO1XGoO6xKpNYbR
YPxDV3wveqkSfSWrCMIDbDwJ74q/rNxwbxPdRi+Z7FjimAUNLKuTLmePeocjIM4q
fSDYEok9ddk0OV4zmGu92txsZmON7D69iH/5lqSkdNmGnRR5fq6N43NJ+vC3fxTZ
8KIzJBlpiUgH5PHg8WoOyDm6AFu6Ao+UYESrEEz7kd4KneIkufa6GP3C1D2ii6Nv
7bKUdyBbRQ97XZ5TyRsfA1H2dZJQmRlN8xPwZV8Bo5ZO/H5VAtkcrJyiCO9FSj+L
/612SpnC4WdlE5VYmPyVARMcE3MRlLUNIoi0oiR27A+q/ayesiEJKt+Ka4hf/Dgl
u7sJn4+R4NhvOfS/C2CFsUtDI1O2vJHbOrW9tGlh6ax/8UFRBC78jHfWzUN0pKuH
GLAfdAD6e6BvqzDGWtonehFVNNZ2cwC+3ZZ3ALcb7WZLW8JiSiFeKtdX6Dt+A9s7
QQqudydBtLyOy/6AWPsn2BlsfUJnH87+qO8q6oqz/ObdgrGFQboQnt67jmLagmzW
fpbS2FNrQqEYmkJwYdvd4djFvXUya+Ghft+17NWG/Zx4jhZCGk24WHR2dZ7XPF//
OjnmKz+tYKWBijYUI9A9ScyM6UMStcFxEjmu4mgOjQFqiQQMzAI=
=FWZa
-----END PGP SIGNATURE-----

--zsgokqhlyivrogha--

