Return-Path: <linux-rtc+bounces-3261-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A164A43BC6
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 11:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26A671896605
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 10:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C351DE2DB;
	Tue, 25 Feb 2025 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SNbQNzUx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5F9263C86
	for <linux-rtc@vger.kernel.org>; Tue, 25 Feb 2025 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740479320; cv=none; b=u4vm2q5arzLuQpDCgnFyf9n+kbVykcSs50U4Ip+2jBhkkTWeRIfp9e60Jx2YKPAUfkD5rijNGJGPjfJu63gBABmDJPblqBd1WjqJcTpLRVDgOKQYsx8r0pJegsXiOMIErQAaxPhXCeGiwZMrQwiEWRwUrK7jGTN+N3xWpI87V2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740479320; c=relaxed/simple;
	bh=JWMlVYd/uInmb85Xv2F+lYo7bSzgvrS/Zii2R7JDZaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ik8h1ljPURpXLPVWUCj+CltDXRnf7LNLDa9599Fl6+6fhLK48ownbk0RLs5vltEwDMY8xRhABGB155Q54rYQ7h3pBZRmSeMwAgGiPB3xXnewbbcJnXLiLv8N5y5F2OxDGIreXiKUKZ34tm0ypk+CnVrWtea0nIhJoRVNNNPhLAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SNbQNzUx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IeDk
	fJXKEAJ+vddtGIcJ6taHXqMO+FZL7PLiG+JPiOI=; b=SNbQNzUx1wYCy6VMaHKQ
	gBSJ1Anroy5N9vhN6QHnPD45Y3jCnq2ZU18sKXr2spDYNweuHUGQOVAOH3rpea5A
	zQznlZxIuUYAkn/Epu6Hp9R5Xg2pvLwMyEIckDuZijx2lZJwUeeXKA7jW0C8eNO7
	tbs2ccBK0J6D0IeiZi3eW1HPnunUkT93kjzEgzl0fR6gPtwboyqVnu79mPYkjOkZ
	uKaVVx4LPgffUGHcszXcgMQ+w2d/g/rqCu4WgUwxPb1Flyb6al6+RF0LJ9USYuxg
	WkeQGmakTUvXRVAVSRNtwH4XRwuqCLxfCUdKT+xAkM5V/qETGLprK2Ae0Qdvv4MP
	8Q==
Received: (qmail 179193 invoked from network); 25 Feb 2025 11:28:34 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Feb 2025 11:28:34 +0100
X-UD-Smtp-Session: l3s3148p1@G8NI6/Qu+KsujnvP
Date: Tue, 25 Feb 2025 11:28:34 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: Q: use 1s irqs to overcome alarm minute granularity?
Message-ID: <Z72bUunh0EIjDwBK@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <Z72ZFf-3Z78O44nm@ninjato>
 <TY3PR01MB1134666224CC60F280EC9422386C32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OHfPNeMj2FEHK4V9"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB1134666224CC60F280EC9422386C32@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--OHfPNeMj2FEHK4V9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 10:24:32AM +0000, Biju Das wrote:
> + Claudiu, Looks RZ/G3S RTC can handle it.
> =E2=97=8F=20
> Periodic interrupt (PRD)
> ? 2 seconds, 1 second, 1/2 second, 1/4 second, 1/8 second, 1/16 second, 1=
/32

This driver does not have that problem, because the alarms support
seconds right away:

408                 writeb(RTCA3_AR_ENB | bin2bcd(tm->tm_sec), priv->base +=
 RTCA3_RSECAR);


--OHfPNeMj2FEHK4V9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAme9m1IACgkQFA3kzBSg
Kba3DQ/7BWBWmpf7kjlOSycgclnAF723JCbINidxcumgGUQeNKXwTv0a1T3Okfnq
uy3QRK/iLOa6Kxg7xFdKLJyoleXbeyKwrac1YUfBvuKmTiywiUIPo2ZRf68t0jSL
PQ/S1YhBRIMA5jinfCxMhofV4Pyz9ICxIr06a9wLJLcAp/Nxw1LADCoIAyEy8TaE
CQNkphixasAGrpv2XneTtYQUK1JeBFk3P3BVkQ1lYPFjJz0vlfxCbK2DqZHFzoOk
zKvo65NPi5cAdoRhIxCd3HAyZG+a1ynZig9SPFoOi4RCx2x8qpujBSQBT0BfhLO8
EDn3rWFdtrWLKbxIFVqR2mwWAcW4EaW48Fd1+d19HKP+DWJO1rZX6FDifLhVzOIF
Ot9UxKWTfeebxt4JrYHqBRnPwNoGl/SqBx6e8Q3cji+PUw2ewhtvOsxmXWyVKhet
1Gxi1JZJcaXOcAIGQiLZGYBnd35EJCMKjIK11pSVB2gDxy+E789T6pn9qCQ+J/yw
H+xMKA0xZjQ5YjYmbDF2sY//nbNBb0mIvnYHoz0OvncF5HBvsXGxYz7wHjaw9eiV
lHAiRcB6gijZGlE6halLmb5axDKydBmCyCusxLDC4rtCJLBTCnJYk7eghmMlTQFh
CFsQ0Ruoe+KqgYq3Oy320C9lY4W510rQC85v9GWvlYUEDKZTYrs=
=dQaj
-----END PGP SIGNATURE-----

--OHfPNeMj2FEHK4V9--

