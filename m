Return-Path: <linux-rtc+bounces-2617-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A45C9D763B
	for <lists+linux-rtc@lfdr.de>; Sun, 24 Nov 2024 17:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04AB7B22C13
	for <lists+linux-rtc@lfdr.de>; Sun, 24 Nov 2024 15:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD39E17BB16;
	Sun, 24 Nov 2024 15:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KQi9MJ+y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CBA2500DC
	for <linux-rtc@vger.kernel.org>; Sun, 24 Nov 2024 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732463500; cv=none; b=LLTBOJBbVFLshflp/iiJSVd8RPlHHxcX3VX4CZmerCDPhs9pyefu5rinShINffIYIYjog17DC/6kWFlEvdedL6TEXp9QbM8+5S/2YZcSS4GoNmRbcw3H6+2A+yS6YdqBQSKKWZaNHOgbceXlPyY0aXWl07VVUIFmG4iosBRgyX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732463500; c=relaxed/simple;
	bh=BQhktYLIHcA439fyh8eKtVHCAp0X4s/iR6SyHfdrVmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nF6/y7t7QlyYdHIWXv+NeHN4RpdaLM2FKJN9reUqaIvrBLRDe3bMpm4a/ek5t1sMtE50kegEkmZLpU/SLJ3Yd6eS6R8ptVD79DmnwynBiAefTBXjkUApUoCRzlCOQ1iVRFKpWEosU98ydfsvjfakcOb43cpAPd6zwtvGiwd6vNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KQi9MJ+y; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=BQhk
	tYLIHcA439fyh8eKtVHCAp0X4s/iR6SyHfdrVmM=; b=KQi9MJ+ylpUP2+4+u0dF
	PGWd9PAFPf3qJZFuV6vdD6bcYabQ5fwFrysDh1WXDaYRke/3LTu4wi5FLF5F791q
	pySdzEacpcM5KgqutHKyV0bpEOMpUPne4aqoaXP60cxT7dlKcCzsA8P7J0+83TG7
	wghUhdj0SEuRBaZaVIT8Rwhiqu/5FctJS1HU46cr8mbdxzAy3ayzM59xmKl/zGEl
	ZuPQVa/1x56Th6tvzw2mBZ1eDLAx96vBnIjiN+LZCNHFNIt8Q8zRRZBZtHDgc62h
	2az1vpO0PqXBpYaAJEUeB3yENViRfLx694JaAN3dxiGZ2L+hWMKKyzeCUEud1MkN
	Nw==
Received: (qmail 2192200 invoked from network); 24 Nov 2024 16:51:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Nov 2024 16:51:36 +0100
X-UD-Smtp-Session: l3s3148p1@ZzpOl6oniMhehhYY
Date: Sun, 24 Nov 2024 16:51:36 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] rtc: rzn1: drop superfluous wday calculation
Message-ID: <Z0NLiHOyuiZ06BUp@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
References: <20241122101448.4374-1-wsa+renesas@sang-engineering.com>
 <20241122101448.4374-2-wsa+renesas@sang-engineering.com>
 <20241122232625c5adab8e@mail.local>
 <Z0GLz6OJWhnhpIVB@ninjato>
 <2024112310255821e4b03e@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ib30aqcCr+x18HwG"
Content-Disposition: inline
In-Reply-To: <2024112310255821e4b03e@mail.local>


--ib30aqcCr+x18HwG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > is necessary. So, I think it is still used. Am I missing something?
>=20
> You didn't, I misread the diff.

Ah, good. This kind of justifies my change in patch 2 to put
BCD-conversion and register access in one place, it seems :)


--ib30aqcCr+x18HwG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdDS4gACgkQFA3kzBSg
KbZJag//eLrSYhp1yzsn8DsYQvz3h9EiVoCMBH827Z5e7lTMZzpsQ3l3+ervGo4q
9v+DxxpmwP61cLJPxhZjSwLaB3fP8iATIrYMowX9fI8J69Yr8lCVVPLD6/GOw9vF
j5k0cN0bPxQRZvyYlJFUGVwg2f4zFs427TJKaCRRuwgJvXliSKrA2tv+BBBcnbVI
Sv+edV+aY4pkaNSjIsO/qPNEjA11SQoZ/ZEs+iKyCNtT8be8FMH7mmmP2mrI41Bb
13DJtxpomMoBhzipSsGv4Kq4dUUYqsHqkmMeGjbxB0SaWSMhtt0zYMmJiCtf5K9u
SMridsBYP/An1Mgs/GrgMGKfB3nEhPrqtiNpSC98zE2N5vdWMOe5a6uZUUOsGNlM
oXsEsaxG8F7x5qF7/gR5NakjnytAqHdMX3mp7Q2PkXy7a/AQy4FupjdPvki2Tx57
cmTqIHeHZcNIGWDlUa6c5++OMXERNgprME3NhJ7ZX7HRc0OmfRLHIE1IDr46TOMh
hSOXx6HGEky71WK1rOiKn8okZYM9TKxAQINBOjfP/Eid4yYfpCBuUoJ1osjqLDAC
vQAX1gOesHWwZIRlPVxjJxZjosQ/UnUm+ff6lxcITnIOqQhOdvsRNZTQYaWnWm+b
o7XLKndjoHETfhY9tnewV1Jc7O03ODDXj/J495Hu0XjgrHwk5io=
=geK2
-----END PGP SIGNATURE-----

--ib30aqcCr+x18HwG--

