Return-Path: <linux-rtc+bounces-3918-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC53AA84E1A
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 22:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 379A61B64420
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 20:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0215129344A;
	Thu, 10 Apr 2025 20:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KEYZ7gV6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9335290BDB
	for <linux-rtc@vger.kernel.org>; Thu, 10 Apr 2025 20:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744316627; cv=none; b=OFA4VpZSea8zCT0TSJ7VCGB3pYQPbQiWVeHzz4fRMMC2g7ucDtR199xPewK9H4orCBM5bKKv2+SC8K89FASjXK+Ri+iqO85oi0AwtAFnj9picZ1z8k1vZx15TYGi/bB6WnurnMFCHTExQv77ehFftchFZ5Ve7tV3+t0Mau7O5dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744316627; c=relaxed/simple;
	bh=ZP4MRg6YrjW7e9gd6G1EHSXsVGozDuc1V9Y/CdznZcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUD1yxHchj4aLa9HLEd+zRLl+wL2/h1J7+j/a2yorVDueseZTm4x0CQTqHf6avUSLaEGrMzHD38C0hgvGZhOYIiz9GbSjRDpS6rzRehilf8YE//qEC9/WbYyUFvzndRpJ5XEYR/8MF8VddQcwpHor5GYxkW52cm/sOXCnAHn/oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KEYZ7gV6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=oJ2P
	ldOUnQvqb6A2BQnImyCIjSBsvkLoi3cdw6vXtG8=; b=KEYZ7gV65A1d/Kee1wHq
	GgCRB8RrpMv8jN6G99LxPoe1bN/uYxBp6Tdxm2WAnSrrbeuxmmB0y9QWwTEqHl7O
	57ji3EcUobpmDevWyLOYsuwKzf8M05lXNoJpvRBrceml+9cm46JjyC5p/SQ4cW2+
	oZEyXknnSR5tP72MCbPzVXV/NwAGpZyNGtRl1xzz4lCT8424vfbesIJ3gH+8QoEb
	wPb2+PjcfvM83mSu18S0jQRsbDO6UZJrLMwzL6RJuB0TgsilSkxPtzMH83FOf0Zw
	Cny46Cizxm3R9pcnlyIvKDYRrTCWFW3ZnszQVamQXyXyuI8RB59KZJq7b/j1yvNg
	UA==
Received: (qmail 1032934 invoked from network); 10 Apr 2025 22:23:43 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2025 22:23:43 +0200
X-UD-Smtp-Session: l3s3148p1@ml61XHIyYKQujnsS
Date: Thu, 10 Apr 2025 22:23:42 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: rtc: rzn1: add optional second clock
Message-ID: <Z_gozhmIeQiPScKK@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org
References: <20250319110305.19687-1-wsa+renesas@sang-engineering.com>
 <20250319110305.19687-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUiNYXVzK7hSmgqZ65gq0bJyGkfJU0=u+q5K=Sb8EY3ug@mail.gmail.com>
 <CAMuHMdXU7wYfzNmvBO4ibUPGUA6xV_4gQxe4DtuKcr-kqXGB1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dO50hdevzkgTT80E"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXU7wYfzNmvBO4ibUPGUA6xV_4gQxe4DtuKcr-kqXGB1w@mail.gmail.com>


--dO50hdevzkgTT80E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > >    clock-names:
> > > -    const: hclk
> > > +    minItems: 1
> > > +    items:
> > > +      - const: hclk
> > > +      - const: xtal
> >
> > Shouldn't the second clock become required? Or do you plan to make
> > that change after all upstream DTS files have been updated?

True, we should make the second clock a requirement from now on.

> Upon second thought: this xtal clock is documented to be the "rtc"
> input to the RZ/N1 system controller[1], so it looks like the original
> idea was to obtain it through the system controller.  Unfortunately
> the clock driver[2] does not use the rtc input clock, nor provides it
> to consumers.

So, it would basically be a pass-through? I don't see any register in
SYSCTRL handling the external RTC clock.

> So either we fix that, or we go with your solution...

If it is a pass-through, I wonder what it would gain us, but I can do
that if there are reasons for it.


--dO50hdevzkgTT80E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf4KM4ACgkQFA3kzBSg
KbY1wg//WzdsAUFEmHJ4zIPWlsczf4JBRElSK8kj+lKuFu7uQ3cIdyGgjkJRGHca
t82VcoDVMayUQMwrs2uyEZpZ1vXcNwdN6lyOZPFsNzfsJLVc7jx/0pSEoeshrusl
wYoEYWyHMog0C5+MulCy0qRINaAXSdMDQ84KQPO7xbzcnM168dwRmL9Plvx+3W4w
6SYcQ9uy4N+TxaTJp/dGMxd92IiCBD/t93hDkPKhQUAwShvHzyTH/hb1tLO8ubNy
OmXaBQLajc1bXcWGMBXtIT/wHAWrIScycNeWbDNccH0lAMfzZr3F7puDburwVR+i
umJkDdEA/bss2gYorAD9XL8mG5T7PZyBsDZfwUQ5kARqtMFw2cLgoxYSrObOPjdo
W5dGCbCyldq4J3wPkodoCv5gMb4QAdAX6jxrDuLJZhAkYstaKuLs80IyeeEQvFM9
7e6I4p+EdCNWDOCZYgb4lZwrmXGMZriwcZ4xLdbnXANKsu+zPnz85TU4qkU8XOQe
1JHQXnNbvNlhCiaHf7619x8Pk+yAz8Gc1jv/ABiCeKnDQj21Wa5Xn3GbmdFH0Sg1
lTjGErjYQO49vwVREh3jMvsIRvjz9Nk2LyDPiyvGMLAWCNRZFV4rP3BknwMTLQAy
poMa+pGldOix5zNQO7kaIa4sYPXhRRsXnamoV402uQ3cIqCgp+g=
=UMix
-----END PGP SIGNATURE-----

--dO50hdevzkgTT80E--

