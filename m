Return-Path: <linux-rtc+bounces-2614-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A9A9D681D
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Nov 2024 09:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F374E281E1C
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Nov 2024 08:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9017172BB9;
	Sat, 23 Nov 2024 08:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QLcq2wRy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE614A0A
	for <linux-rtc@vger.kernel.org>; Sat, 23 Nov 2024 08:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732348888; cv=none; b=e728U+wx/ZlR8/GdXoFBs1BCKI9QZ7o5VGB7Qa5vsPcNbjO8WPtzyq2tghwj934vCulkZFxGKCJjBFdl5sssTHIrau/FleHOPUKN6gRI2L6fQOXIw79TpNN2O4I8mED0ZkW5etlOc/XSN6wTj5rrTMI4crLj3kNue6CoEja3MaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732348888; c=relaxed/simple;
	bh=48eRo7US3m8xjD0LRQF/9TMjsBKwPFE7bAD/vDReFR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7PdRZ3LoRNOotyTMr+NIny6Wac/RBZ1kN0cr8g3n0012SYU/b2W86VpqgTBNuwL7Ly5cgRBl/kX6lysmonAdpfgzbLZHf9DHszfPUbwpADu2P/HgKuDgrnUdEVTGqWceuDj19O2tPsqdmY+HSd+rr3tZV/rQddKhNDX+WYUBfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QLcq2wRy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=01LM
	/Ow4Pb/a8hFL/F6hOm4WM/LMJ+hRKRz8NeI0GI0=; b=QLcq2wRy55IGg8CZ4jNR
	RKd28/Btp4ubK11hi0zyAYfT2ayS225QdC3y2LwFYV3dqSPwYMXTPGCIlAS8jZIE
	ayhwUFw8vGJdcXbF3mPP8obPc99pRcz2mfdzXRkZefWU6aSCY4RbaQAIOCyOf72h
	iJ9DRFdjfT7+tHmsHwMzqhEyfXChd3nLxDXTFyPrz1CoHZ0DiimjMdT3EnZL8DDa
	6nBwaN4SeGGx5eXhF9VslrOSSZ1VFJ0tF9RGr4D188crc/cRWrvmac3SbZRx06U9
	wlTipUwqGBss/iKDaGMZMEqkgAwuDFl51lp09rVit4cXBZlNbmx9sIRkk+3a8PYl
	ow==
Received: (qmail 1838122 invoked from network); 23 Nov 2024 09:01:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Nov 2024 09:01:20 +0100
X-UD-Smtp-Session: l3s3148p1@aPCb548n2JNehhtB
Date: Sat, 23 Nov 2024 09:01:19 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] rtc: rzn1: drop superfluous wday calculation
Message-ID: <Z0GLz6OJWhnhpIVB@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
References: <20241122101448.4374-1-wsa+renesas@sang-engineering.com>
 <20241122101448.4374-2-wsa+renesas@sang-engineering.com>
 <20241122232625c5adab8e@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2TTcMPYPHKX6DK+c"
Content-Disposition: inline
In-Reply-To: <20241122232625c5adab8e@mail.local>


--2TTcMPYPHKX6DK+c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >  	struct rzn1_rtc *rtc =3D dev_get_drvdata(dev);
> > @@ -109,7 +96,6 @@ static int rzn1_rtc_read_time(struct device *dev, st=
ruct rtc_time *tm)
> >  	tm->tm_sec =3D bcd2bin(tm->tm_sec);
> >  	tm->tm_min =3D bcd2bin(tm->tm_min);
> >  	tm->tm_hour =3D bcd2bin(tm->tm_hour);
> > -	tm->tm_wday =3D bcd2bin(tm->tm_wday);
>=20
> With this, you're not even using wday anymore. This is fine as there are
> probably no userspace users of the value but the commit message claims
> it is now using it without conversion.

But it is still read form and written to the register. And the values of
the register go from 0 to 6, same as tm_wday. So not even BCD conversion
is necessary. So, I think it is still used. Am I missing something?


--2TTcMPYPHKX6DK+c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdBi8sACgkQFA3kzBSg
KbYKgRAAlfoXZpZSOERJD/AXfARQZHH7awkeM0GdWqYTXnKR+/NRAr4h7QcmczbJ
v2txEFlmp6/E6Yw3BzebVU0f0FeyEFIAy9Mvws2k9EbjQmOuUnKUtDS4qIXva9Tt
nJbNW4Q5VcbsWx/f/mrzqcMZZ8zPQRBHXwQ80OlYhgmSfV8Tg32hCOtASF/2DL6l
KrhSh6V10n6LzVDpg0HYgULNR/bb/UO0PJNUZ8prl8Cn8SseTbUhRjw1YKMIXQwa
MWFuRI6TL4nbdTfVH8CyYZmCv+Ct3ezao4ggwAAKXcT1qk8nKVb8Q1+V4Rdc7y5D
MmR1qUFmAhXKMHSNAGZswz1qzUY8grtd0eMDUNNsmT2vCk1Yo1bmZWvczcTQCxeC
cW2Az82whhE2CexoXBjMoR/LXOMXkIQGcNU1KeVrGPWkQthR4FM1O4pvVmhrJF5m
PeuGojApGFWOZEiregnqM2STpphGRpkQzo9e75atAlOXk2c59JPh0lwfKJgbQZ/X
ddwDhA5n45+3D8s+kypUPdRtmQRnxdi2OeBLZBYI6+sHRK0zB9A6fidtdCFVonZQ
62SF+nsTUpaqA1EJ5lk3GXIyhTWHFeVnh+KgqQX4ou14vAwFMLhgp0je6h6Nc4SB
Qv7WSVtbksckVn1TAo4tJU92HlhPGWt7bEv605lG4oULpKcExFQ=
=nFak
-----END PGP SIGNATURE-----

--2TTcMPYPHKX6DK+c--

