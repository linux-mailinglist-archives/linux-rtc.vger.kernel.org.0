Return-Path: <linux-rtc+bounces-3924-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A30A85470
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 08:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84CC97B332C
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 06:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C9127D771;
	Fri, 11 Apr 2025 06:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="V7PLRj2K"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5C727D76F
	for <linux-rtc@vger.kernel.org>; Fri, 11 Apr 2025 06:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744353593; cv=none; b=YfInTUAeJW/fl2m9zUBNGD7VZA2P7w8WicvXgRw+XHkwYr0WOJxuoBSc3cfVNXzNp1LS+N5INL2d6UCblntMjqJlmPjWIX/pVtPimHBqvjfiSiecaj0QyU/oCKBe/j7pUD0FjwCqp1UxkEY6Djmuio+unVL/k+W9Q0guEBdxLsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744353593; c=relaxed/simple;
	bh=a+AohPDuVFBXRNXWVXywQSJ6AZk5v5TDrGaX93hsK8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDWdKBvMpep1GoB3QfcNfJBfePx37PpfjhFw/5xU1/pRCh337crjC9zt2Zl9dbMzi/bB8577Tespa+HssxFqP5bCl1xOFpWJGwTXvs0DdRFxnj4Juk5W6nBEb0BR171lMShMXLsPwwxvo161uYqzl79FKGcy9BSe2Pgz/O7PlC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=V7PLRj2K; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jZvC
	qSyauVFDk+WvKGVgeVTjq7RSbZrL7rWhpDiwGuY=; b=V7PLRj2K53bDQxQRat+W
	29yyZtTZ8dYviSzCs2xgBOA7CFHrMYRa6e13TIDpipjXjwtIexR46qN89aWJTXYO
	1D4DoXLhJ6WVymSPRcnblXszLME8SDgEVAYUXJZOL2WrphKppPQyXKFtY3xeEXAp
	XYOf90owy7njO1YtlIEV/NiY7F6MZVEhiQNFCf8CJA3kw5Q57fBV1SUfLjLxrVyD
	WOIhFsB/Q0QeD3T+zs0AxCbQjtoc19E8Itn1qmxhxedpnLuSTONGGzB5GSy0U30c
	D27NPAMUYN9AvQ4laSIqPWAZxhmyiGG9EAhI/fDVdiLveGOXwJX3rjNk9+6cptPl
	GA==
Received: (qmail 1169761 invoked from network); 11 Apr 2025 08:39:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Apr 2025 08:39:49 +0200
X-UD-Smtp-Session: l3s3148p1@wFQN+HoyFO0gAwDPXyfYALbiJ46yNPq3
Date: Fri, 11 Apr 2025 08:39:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 3/3] rtc: rzn1: support input frequencies other than
 32768Hz
Message-ID: <Z_i5NZjB5aSV1BmX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
References: <20250319110305.19687-1-wsa+renesas@sang-engineering.com>
 <20250319110305.19687-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdXMPnJ9b_5gZ4SwCAeuHUTr3y92+d94X=os5HaYis1CTw@mail.gmail.com>
 <Z_glj1NS6yRHHkyR@shikoro>
 <CAMuHMdVnu3+4Gkca0nTp7nWFSX7RjXe_GRG5PKDShC-WdpMSqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XDEbE26sXCNHepG0"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVnu3+4Gkca0nTp7nWFSX7RjXe_GRG5PKDShC-WdpMSqw@mail.gmail.com>


--XDEbE26sXCNHepG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > >     if (rate < RTCA0SCMP_MIN || rate > FIELD_MAX(RTCA0SCMP_MASK) + 1)
> > >
> > > ?
> >
> > You really think this is more readable than the original code? I am
> > really tired of bike-shedding so I don't care much, but I do wonder...
>=20
> I don't mind the literal 32000, but the "> BIT(22)" looks rather
> obscure, IMO.

Really? Ok, then it is up to what Alexandre prefers, I guess...


--XDEbE26sXCNHepG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf4uTUACgkQFA3kzBSg
KbYclA//XFDfKF/Y9OZoL81Iuc638k/je1Bd/t4uXjsRlZ6kh2aqL1XNpHYNUYg2
3SfsQR9DVkpumaoHbTVX8fJV++FT7nXt7UadQwn5V1SCauqlV541rlOjbtZ5jWd0
+CzRe0KjvbI3/vb5OaoXx9GTqaWZMOU9881b3xoPREB3HwkXLSbISsf7QBSmVKCT
PUgi2jRxjBgkl1Tq2J7tWa/MqB9GBZ92+TFrk05IIBWEJKj8Sy6XSI8nqwzwdhrk
UNJs/bmMZp9sPIYi64us/SpUybGyOCL9AsJyZFW7EcRVOCFaFdSg29yFzEAtaFL7
184bNlzXnDY1Fh8PmJHheKhPxmd7LIfYsxeKaZdPa3FH3R0nA1zgoYqtRcIFZ410
9J8MFfn7+O+KjHQ4dMmbH/ZL2w2qqQ98beJI1uMdDT5Ny1HHGjrQEB1HvJbdTV1/
Zgfwwtv2QJa3u5k4mVHE7u6DM22XyOu0IJaWz0osFPQoAuNAJCw0wwY6wxTs+JOq
K4knYRdqYd68ymObYKQ/ekw+zR1ZSZgCITplyvWZV+YJrMKCj6IXag7XG1IibQfS
iXzXzgoOGtLrJZD/UDdC72WzasMPkTV2NEKPLa6UtxBqg0ieh1JL7d8ZxthBuufv
7zoSE/E4H+zMT0OVd/iPwkc748IZinlwCrzcyjyFi7QC+Q70Ty8=
=Rd/R
-----END PGP SIGNATURE-----

--XDEbE26sXCNHepG0--

