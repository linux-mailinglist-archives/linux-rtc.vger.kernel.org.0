Return-Path: <linux-rtc+bounces-4155-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC00AC3AC5
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 09:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F1DB3AF565
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 07:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E081A1DF27D;
	Mon, 26 May 2025 07:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XPxZoGnp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566951A42C4
	for <linux-rtc@vger.kernel.org>; Mon, 26 May 2025 07:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748245099; cv=none; b=g48+qg+SGFKz4RONZOmKmFW6wCLd82AdpDv+mnSYjC9xxbWd+MNFx1+iVcjCA0jQ3HGHPk0xhO+CBESBny2T4t0bXYB4MpTuPnai0RxgZWJKKVuYpTq8XuxMEC3tIYYpzjOxjTfddVe0LxI0MPFYEA46XDw9+nN/AwTSgBmJdl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748245099; c=relaxed/simple;
	bh=HX8CBXD2Q9iqK17O4iRt0ryd6J3FvwZ7/m/px1hJs8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6iKNQJ8EHNAg9dPAghFoWyFODlY8zAVhCbjuj4d5iau+Do3DSGhhXIy1sVH3MbUiF/NeBBqd30fqjHckTjbcKOO5+vfZ0X/8wTZB799K6EB6uHkwFV9rHCtet9zlwouFMeqemYQ/ubRcxAqGoYfXhevOxYiNeoULwNzwmvlIYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XPxZoGnp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=tvhM
	8jQz3HKt2lJJzpolw0o5Gek2TLbyjezzkOzRuCM=; b=XPxZoGnpAs8pef2ycH3I
	cT/BmqEP/4oiLSumY6OXaoY9GCeORlTwy3xaDQADO4ryxgdeVjkxPNuZH9v21mBf
	LuaWMUBOCdrxyrsFxvaMNLzwFzjHapwJeUuwv749PiGG0a4Kel+c59d8PYBAMTNH
	tc58WNxifbJH0N+TLENYloFpI4jSYssgXvTvUw0j0leGTWbLCjUymXv5zl7uYQ8k
	uY1FyTAZ9hM1XdrM5OXhqPSa0aLD08cVl55uLpl6ZNoFZbWUTPfRf+fekygOPjxF
	rBvyA9DZSRvtrf3g9gu444mvn3u263uF53MAbHnGQf9Vg6QS4q5PIi9F5zNn4zUf
	6A==
Received: (qmail 722849 invoked from network); 26 May 2025 09:38:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 May 2025 09:38:07 +0200
X-UD-Smtp-Session: l3s3148p1@RdxhBwU2TqEgAwDPXy6MAHn6Un/tgldt
Date: Mon, 26 May 2025 09:38:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] rtc: rzn1: support input frequencies other than
 32768Hz
Message-ID: <aDQaXv2MR0Tvc4AP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
References: <20250523150541.8390-1-wsa+renesas@sang-engineering.com>
 <20250523150541.8390-4-wsa+renesas@sang-engineering.com>
 <87frgr4z0o.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6lKTCZhaQuaorv5O"
Content-Disposition: inline
In-Reply-To: <87frgr4z0o.fsf@bootlin.com>


--6lKTCZhaQuaorv5O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +		rzn1_rtc_ops.read_offset =3D rzn1_rtc_read_offset;
> > +		rzn1_rtc_ops.set_offset =3D rzn1_rtc_set_offset;
>=20
> I guess this situation is not possible but let me ask. Do we care
> about the very unlikely case where two RTCs are available and configured
> differently? Because we are overwriting a static entry here. Maybe we
> could have two static structures and pick the correct one during probe
> instead.

True, it is so highly unlikely that I didn't think of it. But
theoretically possible, I'll fix.


--6lKTCZhaQuaorv5O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmg0GloACgkQFA3kzBSg
KbYs0A/+N5KbL3c6q0GaVK0a9lK7dGOdArLwuFAnTAWxZYA+tyUdDRegmcOAaw3B
jvfCiVTtHoCZ/i0YZV3wnfR9KalI2sXxBQwmE5odUd9eq3V9reRcf8CtmMbA6Qgk
6OoZPn+whSmV35ouB4SsI/5Tr/o8vJJiVoXd0JUC59uFaMTJMzw2EdEzrNSqdNhx
uvC/ikVf2LWJ7e1BZvUmKAEXC8f6GUD3GLwR+29S/RojutzenUoKi3xtzQm+d01a
NbziisyyhGD8qz42slFqmBcEI3a62jRF5b8irWT5El4Cem+Vf40pSAcrZrfR4rY1
r2S2dRvHtR4ksEk3SROEyJi4hN20nsVW9mwq5y20pH2JANtBH8sAsH2GvlsNkRsC
I7vRikqKO/mJqSsN0IEBDS7cQFlLg2LSUJqWmkJfGmcWmc7eCvrRvC8+7P3NaDN/
yL7SiV9Ye23RJiqupvYtc47JfNSaQb0NwZ7SwcDgGflltRhXIceF0cLPWHwpy+af
ChPqzYgm4IBnCp51+LTxR72Dbf019VRvcouMNNqfGD7sYrem3LYYCXkx3UjHjoN4
ZbbrRUFMoyMA0NXraH0LJVpcK8UVoJM5xJvaBmXsUk1KGwkTNkHLT7gJotF5ebjQ
NC9lG1v8b10S4CJYLEGtttGG4iflUZ+6iJsfU3VHjQcy9zRE3w4=
=bYuy
-----END PGP SIGNATURE-----

--6lKTCZhaQuaorv5O--

