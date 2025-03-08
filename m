Return-Path: <linux-rtc+bounces-3426-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A31AFA57A71
	for <lists+linux-rtc@lfdr.de>; Sat,  8 Mar 2025 14:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95AAE7A33C1
	for <lists+linux-rtc@lfdr.de>; Sat,  8 Mar 2025 13:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDA31C5D6E;
	Sat,  8 Mar 2025 13:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AU2LKHa6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5BC1B4F1F
	for <linux-rtc@vger.kernel.org>; Sat,  8 Mar 2025 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741440122; cv=none; b=dmNc6skL6DTgMdLjDfYcnqzkedDj4RYhJdMeoMFkRDWzEziv6CKV+v7moxOTmR4ugg6Sv7BaNeiz9Yfpcq3ru8GenrYPKzkVerRhdABarSIEWrAQP0n+FeVqErq2wy8+zF6DLPJRCupHVDB+gDtbUFJs64bTatH6KmYslhP5VQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741440122; c=relaxed/simple;
	bh=tQ1YzrRzoCH3+AX6nFYvTk6Qy6dTTlDa9DwNA/s12pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1NJrVW7iruNnphwnRRIqHXITU4yGYiS/0ULCwP3QaiYdMVz6NyazZYg6QkrvyNX5WsdOxRLxBJYGCdtFA1Wutp/cLmrdT5N97m1jZitzw8RWjO5+7e4iT+hy3tX8yoOvwMC2xLoy4PlJIml+4Um/mP9uPTCWjOVSjaXCl1P3hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AU2LKHa6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jQGw
	hYEC+1E7CQPdADfXsgkH12BmH3dSOR4kchCHnjM=; b=AU2LKHa6cKi6GYBHPtPd
	bElg7C8yZBxuGTxHW64n2fCwodGurWAnya7pHPGRUOnfAe/CBg9WAJmI3tRttw/j
	MdgDj2x88auIlvwHoDCMxTjeqfpKzRp7coWytzfK0K938UYJUXs8W6MAiXrKRVee
	b0A26jvaEskV+8RJx6LJ5VWB1Oj0+6ACyLI0/Wveq2Y1SLGhzAdGu49XX2RqZqI1
	/B+Q8BdEPfiQEq/eM9M12oM/kGLiFmlbGg6rpGimk26qMzsw7Y7fQCnp5wwcSTV+
	CCy/r3oSVP/Y7Pj4q0ca9nRAvLJN9RguBYVHDjSXtDa9St/7a34lI3zsgzjofWyl
	nw==
Received: (qmail 4015876 invoked from network); 8 Mar 2025 14:21:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Mar 2025 14:21:48 +0100
X-UD-Smtp-Session: l3s3148p1@ecANn9Qvp25tKPOC
Date: Sat, 8 Mar 2025 14:21:47 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: rzn1: implement one-second accuracy for alarms
Message-ID: <Z8xEa3iCP-9JrXWM@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
References: <20250305101038.9933-2-wsa+renesas@sang-engineering.com>
 <2025030522061502555577@mail.local>
 <Z8qYM2-LQPgIe2JE@shikoro>
 <20250307183817b7747a66@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="woe3BGYX6FhQlj+p"
Content-Disposition: inline
In-Reply-To: <20250307183817b7747a66@mail.local>


--woe3BGYX6FhQlj+p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexandre,

> Again I'm fine with the patch as is, I just wanted to point out that the
> complexity may not be needed.

Thank you for pointing this out. I would like this patch to go in,
still. I agree that the code is probably a tad more complex. The
concept, however, seems more straightforward to me. Because RTC core now
works best with an alarm timer with second accuracy. So, let's provide
that, so the timerqueue can do all it needs to do. Plus, you never know
what customers do in their application space. I prefer to be feature
complete.

Thanks for the discussion, I got a bit more insight now.

   Wolfram


--woe3BGYX6FhQlj+p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfMRGsACgkQFA3kzBSg
KbbFehAAjJrAo472GbRDUKw/9MePU2LhFwQ5fqfLUg6dHtFIbcMgVdKJyvq5JlfP
BmaGHrrsTRedeFIaRawpP7uxK5NgtQTi43mLgxXZlaTi4+fQczbGbhFaQDEVBWyY
8KxvxrFQwMMggSYIylPLYsbsAVdNHkLEO7BE5R8zfXDc3UDeQuYlDXotBSdYd7g7
KZchk0tk9jOXlqW4O295cI2yXNN3AmO6eJ6uPy42TZ1/6/VQ7pQuL21UNZcixNA1
GS9PnnzqBwefS9f0xNrRKVBgpuSCpG5q/P/iQr16Nz+pFZ31YmtUfmuN4DEP7GbH
ISG5t5LZc3Ns9o1TCFkRXe3CVinPoty5y6nqSGek1myWZYZ6Mbni4p32t7wHH2vy
9AWJKVLCCKQkpDCCmuth2reJThP7G8HwiyQoj5a0ohVwpNup8BTfwtNgr7f430ST
ly5lpa9AOurrzfWihpXi5qHeLg0V2k7Pmne9Evs5Nu8rLqyojB9nt6+p4o6AdyIf
o5ktpNUsyFX3wZRyi3QAfIJpHMnDZrihQvgatFa+9Oq8pX3f1PGBMiRaBZ/NDlWv
/foSGO/J2pc5mJbI6w0aFCe5fdaH1+luCo3yFQA9zVh4QKoTs7bKwdVn4vhWcRPu
mbPI5NTsRx1oCHwaey5pTAzj2XFw8A5ueShJRVNlJlf1NfMgk+w=
=dy4N
-----END PGP SIGNATURE-----

--woe3BGYX6FhQlj+p--

