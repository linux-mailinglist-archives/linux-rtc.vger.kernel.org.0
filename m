Return-Path: <linux-rtc+bounces-5238-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6DFC282B8
	for <lists+linux-rtc@lfdr.de>; Sat, 01 Nov 2025 17:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCFF63B23D4
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Nov 2025 16:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DEC253B66;
	Sat,  1 Nov 2025 16:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ixrwk4mI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DF6233D88
	for <linux-rtc@vger.kernel.org>; Sat,  1 Nov 2025 16:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762014499; cv=none; b=cH/BIKz4N1YbTQ4Ps1RZzSt9nQjEk9Iw4cJyT//IGFlxSJyEGzL+IhK7JPjzuJESkyPaP0Uz9Zr8TyDb65zfgyQ5ilaxyqYM3crgpBy3fo1mt0yunghqjT6jxrzeg6+kaPd+6dHodGxP5ycnzScfCwy/bNRWigNJNndVko2vYfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762014499; c=relaxed/simple;
	bh=okhYxD7WUT0Rp59869A3qZE44PxsujP2ZkV/djXv/p0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeSsn7/igdADKorPavo2aNQ+Ac91tDrE2TgpQsiQ0pB7AN2J/TQ44f3Wd0Tksx2BClpYGrAS21HT8/3N2YkpEifx/Rex95GS/UF41mZzAQpL5zo/2FjCWiaQ3Ye6r82cYIowaywr1RGo70lWTOF65Jxb9XWaDI5aIfNW96nX/xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ixrwk4mI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=okhY
	xD7WUT0Rp59869A3qZE44PxsujP2ZkV/djXv/p0=; b=Ixrwk4mIBv5ilULm6SHd
	8aFZkWLY7OiLBrU7/jCHuuQIsrHr5pYKDQxwMYWlAfQSt6Z1nCUml/LY0YTZCYqt
	ozsVse8xVV04laCbieX/9Xw2z5KZgCcIw4FlT8+7/XpQ+zSU9/K5X1irXakiL0OA
	+NjxB9J9zm2G8QcGrQ6KHaLwbGIG74YxPAySzymJT66/zaWs4RCVW827EerPTePJ
	9+CfLs4ifHQIMouY1dMpCSS+VgyK/+SR+W0Dbu8CVt7p+K2OhbFFCeolh/s3wBVe
	P7X1Soa2YLjsd0R76XtX4MSu9lK/6kCv/iYDACOWwgLqwXYt+70nhkVOXchqfr1D
	uA==
Received: (qmail 1526761 invoked from network); 1 Nov 2025 17:28:06 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Nov 2025 17:28:06 +0100
X-UD-Smtp-Session: l3s3148p1@DZ+E94pCIq4ujnt8
Date: Sat, 1 Nov 2025 17:28:04 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Joshua Kinard <linux@kumba.dev>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 11/11] rtc: sh: stop setting max_user_freq
Message-ID: <aQY1FOg0C1tkXGtm@shikoro>
References: <20251101-max_user_freq-v1-0-c9a274fd6883@bootlin.com>
 <20251101-max_user_freq-v1-11-c9a274fd6883@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lcYGcGAxcAbzFFx+"
Content-Disposition: inline
In-Reply-To: <20251101-max_user_freq-v1-11-c9a274fd6883@bootlin.com>


--lcYGcGAxcAbzFFx+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 01, 2025 at 01:45:13AM +0100, Alexandre Belloni wrote:
> max_user_freq has not been related to the hardware RTC since commit
> 6610e0893b8b ("RTC: Rework RTC code to use timerqueue for events"). Stop
> setting it from individual driver to avoid confusing new contributors.
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--lcYGcGAxcAbzFFx+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkGNREACgkQFA3kzBSg
KbZ10BAAkWFvY4/Cg/1wXBjQ0ge0Ha6N3NGk/hiALu0fPhwDBPGQf8AEVfYEGw7o
NbwufMb+R90iNjb2X5npEFIYA1PpE95OCLK+yuJx/2rJz1/9xecp2EAO9dm4Va3A
DI+npvm/p7mgRRMA2Mdpq+dvCVk/SmAkT3/8oPwrgfKHvsrOAz8VnVRoLcI5SUcB
d0nUfoLjXylZGbGJvVWVP4HKyejwMamI+Hw2UO1vv8gVKEEVx9ic4GdEtSFUiIdQ
2dT2dZK7ljVRROuA9OHHVszj2vC4rAUTxM7GXdrZGmDQfNu+rJVNtHs6hrGrQ8SY
E1HvK98oXJjJupu9Whn0FQwNaXKJRxW3KcynqSnnB+eA6faY0yKgaUtQFKNrd/9Q
0ahlYJP0BHNBr15ljMSOj0+GCTdgoNKKRVshnoBXx3itqujv0FJPeNJgbYdGLcFg
JDDObesj4jVPrBHALD+X6+Kt7d97RI+2S0D8Rg2nK24w9gQzoQLU4AGBoQaq7lw0
cgfdXhaze85U/Jo/nusg7u6wRi4qr0H0Yq7KR+WTxZVkAHyU8CVRRSmIi4LxtE8g
mYPgS8gYoD+DVr0XbTEvzrduVcnrCPNZ9fIatv3Mz5W42qllOiQ31VSnf6hvucHa
Cl9HINbBZ/CCWqd9G+DE7h5xe1mSNYaI+87mVMz6TT2xNrYypWY=
=kdVO
-----END PGP SIGNATURE-----

--lcYGcGAxcAbzFFx+--

