Return-Path: <linux-rtc+bounces-3914-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 539BAA84DEF
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 22:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E591175463
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 20:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E4A29008C;
	Thu, 10 Apr 2025 20:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gWkvThOp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E80928FFCD
	for <linux-rtc@vger.kernel.org>; Thu, 10 Apr 2025 20:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315797; cv=none; b=upJ+f/9TmCQSHf2bssymg/LArcrWywPnfyUixtlxEC6v1MyQ6M8EuLiUN+h8k/e4OlS/RgwwKYUrsbjpttrx7oNQXMn8y2a4HnfcrK1sAOCL/kVo/wceZmSroaG4d3no6LgPwTyj4RIE4IuUsi4JbfQOyz2pw+8Oo6WZLmZBqzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315797; c=relaxed/simple;
	bh=h8wlyUpnMilelDf0MSwmG3Ypk4mPF+vctxE+BOpjYyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2OyniTlPzbzgn6x0iZ58M/Px3wbFng8iVRBhXd/jmEUL57ldueYAJ0TRwW6BCl4/L5KRwxy8iq3WxJBKmnQVM00BI36Lx4Ot0OOH29hKYc59yrhhlSPe+k/FYPkma9cgpCH487gMI0D3IVaksGxfxtia86EOOCNKczzZopmuoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gWkvThOp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=uR+k
	qY1inr1FvPVOE59aSXV+PqIZdZ46XUVFoISVmkc=; b=gWkvThOpY1dAOKiwAiG+
	WxO43l2yOkkrzaQDr0G8lyj/2F3LIH6IrU1ux4U+1izkC/h3gr+/p+dbwF+I2cHO
	IOvlNEmULV9qBAPonBb116ntV9ZtMzSWR7l0EakLi5fcpn2nLG6UWuwi0lIN5hb3
	97BK7+H1U8kgFEmOsWZtyByyuvk7HggP8I8cevbuAHUi2bgZ1Uo5qbik/tcsPol+
	gTlNLNr5PAKGsbSlszqxHY8Ca0Jq4rCERNHHESnYC3vvWl/9bkEgizMQtfWck4Uz
	96bT8St2j8EbWqt/MG2+H4XBa7SXWOKrLgDrkzHQ/+WmJlTE2jz0tY+Gce6Yr9WT
	6g==
Received: (qmail 1029286 invoked from network); 10 Apr 2025 22:09:52 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2025 22:09:52 +0200
X-UD-Smtp-Session: l3s3148p1@hl8lK3IyttQujnsS
Date: Thu, 10 Apr 2025 22:09:51 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 3/3] rtc: rzn1: support input frequencies other than
 32768Hz
Message-ID: <Z_glj1NS6yRHHkyR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
References: <20250319110305.19687-1-wsa+renesas@sang-engineering.com>
 <20250319110305.19687-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdXMPnJ9b_5gZ4SwCAeuHUTr3y92+d94X=os5HaYis1CTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="daA1QyHoiuWpkhz0"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXMPnJ9b_5gZ4SwCAeuHUTr3y92+d94X=os5HaYis1CTw@mail.gmail.com>


--daA1QyHoiuWpkhz0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +               if (rate < 32000 || rate > BIT(22)) {
>=20
> Perhaps
>=20
>     #define RTCA0SCMP_MIN    32000
>     #define RTCA0SCMP_MASK    GEN_MASK(21. 0)
>=20
> and
>=20
>     if (rate < RTCA0SCMP_MIN || rate > FIELD_MAX(RTCA0SCMP_MASK) + 1)
>=20
> ?

You really think this is more readable than the original code? I am
really tired of bike-shedding so I don't care much, but I do wonder...


--daA1QyHoiuWpkhz0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf4JY8ACgkQFA3kzBSg
KbZ0Ug//W8lz8AU9inglXnYUwQv+1ngHBKbPj/YNapViFHw9vYupil6y84cDKslv
bxKG4oYjXtVyVW9DXK3Fjj3m+BAIrvy86nK2mhFRaCs++DnUWulrNCzm6Rl/s80z
3bKib5IVra7sdVv2A6M/9Zt/RIEArqUC9rBCxfuk37wf/mByz4bDXCP1Wl8iAQaS
mBuxu3vKxVZ4uGxsxeTWl1shnF884sEhq5y3RVcueyRP3zYsRdJIwY3mb4X6Xmql
BmXBJVEVzU9xHmKC1P+qYpaZx+7QGxpuF4w4fj7u7c+r5mOQQhHhxH5Jz/saR2JZ
GSyb1gJo738eBPHjzdqRJB5ot7xHqmF7YG3D8pM9FDkFNw9H1h77LNg6p01QezJz
dzGQYmLjXY7LrtYybsjaueZeZhN+zG+ja0X3Isn2UUhj15byVui8/Q0N4jkYkltq
04XKGtoggib6aFvHB0YEb+Gtm0OBTyL6WpdIWZrc0iXXOVGRDt1nSjefFCviGLf7
HQ/PhKXrwOpCc1pUthtb4NkjDToKdrPiuZWpvHNQUExbOPU3rWdhOxhpAPdZGZVt
51Ja53DOT/BAKgs4jEzNghmyC4O9JK44Y0+FD1N9MHVD5ndHZG2bVWVjJ22gF5+G
huQOYbmoFe4SM4Yb4Tvxh0JCQzoSQcH0iQCF8PxBasodOIwlBJg=
=0yN7
-----END PGP SIGNATURE-----

--daA1QyHoiuWpkhz0--

