Return-Path: <linux-rtc+bounces-3446-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F98A58F03
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Mar 2025 10:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA52D7A5954
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Mar 2025 09:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7A33208;
	Mon, 10 Mar 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="R09XJCNB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EAD224880
	for <linux-rtc@vger.kernel.org>; Mon, 10 Mar 2025 09:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741597633; cv=none; b=CVpA4+anqxC+heQlKgu8i45EfcIR4WMPZtX6CGQZzLQtl0wg/QdAR7Gy5v9pAVM/WuH1FBQeHi/O21ZMJtPZ/FlPXMeAyiccv83W4SjMqGnkykUTMF31wEo4ByuDZ87+AcjM5u2TpkI4YPK0mf1GORQEZdbta+3wxpWqSpQJUD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741597633; c=relaxed/simple;
	bh=9KsJwm1lsYnuoYcaSvy1DDtDS1yKrsUCzoAdEZs1TVo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kl9loEVspZBYV11uDEVicg1dqmEj3bF07JoOLko5ghxiWfQCSEMDnQKFiMdAmMUO62px41gE2oHahxOEe9V9lCuDEjac0tF9gcXgZ1fMy6jIx5WDJDILsBJXnLYkVo5MSXjR35+WAUN2jaD0fGnHnYrWhLPksewXrUG6gJuW73M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=R09XJCNB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=u4xD
	PsTANlB0NqEgWvte17yfP/aJL33RMtvvcYthvqc=; b=R09XJCNBCcz6nkWS/ugm
	6NdFGUGq3Eawfxl5oYeko91JgkFrxM3950GYXo/oDCvqZcP/H+W4gwu3WcDZDX5X
	F6mBldqG07tG2fWzxAcWizoY2ASS19HYTrvHWtKWdYs9j49wcwvWZvOooYfieO/q
	hBNkbYc+vff6UGXf7aALZNCJ8deF41Lu8O9GUtvd195RW1WeikIfWUY4Z71HsogO
	Y1BPJo9yFwGOY8jINu0YCpl3bbjXKiLV5MPN5Uajb1/jD25WaFdJ9GKxFmrb7Vxp
	/GzxmnZgJVj0vBHT6leprX+P5MVIRbIWnOLRIEW9GA4OaKL3IwnKNWAVi850uUCZ
	Nw==
Received: (qmail 412416 invoked from network); 10 Mar 2025 10:07:07 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2025 10:07:07 +0100
X-UD-Smtp-Session: l3s3148p1@H9LjS/kveqW5aIo9
Date: Mon, 10 Mar 2025 10:07:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: rzn1: implement one-second accuracy for alarms
Message-ID: <Z86rueNSSps2foF9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
References: <20250305101038.9933-2-wsa+renesas@sang-engineering.com>
 <2025030522061502555577@mail.local>
 <Z8qYM2-LQPgIe2JE@shikoro>
 <20250307183817b7747a66@mail.local>
 <Z86f-tvJ42ui9Esv@shikoro>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fGr/aUVbyPMS41OW"
Content-Disposition: inline
In-Reply-To: <Z86f-tvJ42ui9Esv@shikoro>


--fGr/aUVbyPMS41OW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On Mon, Mar 10, 2025 at 09:16:58AM +0100, Wolfram Sang wrote:
>=20
> > Yes, you followed the code correctly, I have a series that is removing
> > RTC_UF that I didn't send yet.
>=20
> Please CC me when you send this. I am interested.

Do you also have a series pending simplifying handling of
'max_user_freq'? AFAICS this is totally HW independent now, meaning we
can just deal with the constant max value in the core and remove messing
with with it in the drivers. If you don't have such a series, I am
willing to work on this.

All the best,

   Wolfram


--fGr/aUVbyPMS41OW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfOq7YACgkQFA3kzBSg
KbbZgg//aukfkkYWlJTDwkMnU7qhgLzO0YAH7MOwNBRV4V7T35fzdMLFt22A8PaY
d3GvKX0apRvaZ1CzCBCmjg5fNHumNI/1lGUH1MhO8ETCEJhU+grqXSDWxKpZV6JH
0GGPbW0IEId16VDbKRkcx1aYh+Do7a2HfcEiFe+BG9JBBzuNKr1rlYdwKWSMCWbn
R/HJkAarJis3Y3xWerpSXRhPh9nkoCYuq6V/IQncXgSLLKiiXtC4uvacbO97F2i6
qnobtwJvj4yTHOBdOrIEfwZ2Y/nZtXDuH6cB6SkvscxB6TtAYrIAPmHcvuvdAPYK
nASvKU2JtXj83jsnwv0qZm69WthIXtR2907Mz7RDHUO+3NmmFQGSoTi6TPCJCMx4
zjdYY0zQi/xmey7xkZsSHilthgzDqP8jxqfg5HQg9NwPsKwufITW6H/PEOGFIBHl
9bZlKgtIhRk2YfQUkD5vp46fE1odYJiopg86lkNvypVr6wYPUtsy5+s8gsXL0Hmr
kz5yPoVIfjnpkyCmnwz5aNoeXrKFLE2QEPvmO0b0gG9tnizg0wvEVq7T+BCc46NS
sO2il9y0ENYg+J7BgLIx1hVIQWXHxL28sc5pmLwZ/Xik33rSLdp6F8BErVszvtzU
g4K+dQbAStqUUEWNVYdNtb63UvQkKKauXk4RMtS2DZoSdCdSAsU=
=N0tJ
-----END PGP SIGNATURE-----

--fGr/aUVbyPMS41OW--

