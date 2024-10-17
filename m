Return-Path: <linux-rtc+bounces-2228-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6399A2085
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Oct 2024 13:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82A83B252D1
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Oct 2024 11:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B1B1DC075;
	Thu, 17 Oct 2024 11:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="O61kXz6V"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1781DB922
	for <linux-rtc@vger.kernel.org>; Thu, 17 Oct 2024 11:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729163049; cv=none; b=qlxISIPvt3e1rHFOEnlT5wKvWVk+kJqsk4MdyY/2crXo2y5DuKp0haXq8QBAZRxlKBDk575XoZh+SnpEqbbRKzaw7/zQfgCTNhSIwrBqxIaMhJ1YYpW6Ud/+nzF9pL/Y2GD25vZaYQZ/dQRTcxuyMWzXDXOeGl2gS/bNS0ZSbTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729163049; c=relaxed/simple;
	bh=M02vPbZefKtzgbtnglUdvhk8inJ/586iO3nEwG12f9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDNgPAMyaujvO6QN6K52ykWpbL4UdrLB+vMB+vvIe6oBq5KWE/25fuKrrYjaRkYY0OR3h4h+iy1ijzJGny67rNyQ4llPIjSKToKbR6JesOD80pRFKcBUFzGJrZM1eN8aQuRNNjZ5Kr9rmytHyoTsuq1d/byL6cqspII/1qOVE6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=O61kXz6V; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=M02v
	PbZefKtzgbtnglUdvhk8inJ/586iO3nEwG12f9A=; b=O61kXz6VJz9lGprNXARt
	RZ9Cg4RlmikIp0nJ6cfrHZ7FmYvJC5gXF/deT+gaZdEGBKKQU7VR0c8L1fPHqJ5t
	fStipJ26Xn3A0v2eMNNWIz+MTxZVktZLZrNbfwk3BRXXFUdRYNoEegyhw9dt2lg0
	unZdKHwHl13jLH02q6jDLXt5hPFuZJqaFfgcJpf5SafnXqtB7nVD99G1AgeYyGpO
	FBYiYW6MGWx5CMfGCJu0PIOkazucB9tpwGxfOH8D1TnqauLXYrWgstI9SKJc20qP
	ZrQqXiILOdiDdM38jahSvIkGmy1ocSNm0jXSEL5vGVNF4cCJfhu4wOA8p5J3VrAD
	BA==
Received: (qmail 3358213 invoked from network); 17 Oct 2024 13:04:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Oct 2024 13:04:05 +0200
X-UD-Smtp-Session: l3s3148p1@l0sMJaokT31tKPEX
Date: Thu, 17 Oct 2024 13:04:04 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 06/12] rtc: renesas-rtca3: Add driver for RTCA-3
 available on Renesas RZ/G3S SoC
Message-ID: <ZxDvJCq_GOBm8nUC@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	kernel test robot <lkp@intel.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-7-claudiu.beznea.uj@bp.renesas.com>
 <ZxDqzeA2mz0Ml6cZ@shikoro>
 <CAMuHMdU=o0MzQUoEs5-HrEVP-snXN-hUef1K3U8Ppj18P6HVCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lNCG8WzO0TPLyYgP"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU=o0MzQUoEs5-HrEVP-snXN-hUef1K3U8Ppj18P6HVCg@mail.gmail.com>


--lNCG8WzO0TPLyYgP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > ... if it has been considered to expand the existing rtc-sh driver? The

...

> Yes it has ;-)

Thanks for the pointer. Well, a few of the limitations apply for RZA1 as
well but they are not handled in the rtc-sh driver yet (from a glimpse).

Nonetheless, given the other limitations and the bit shuffling in the
control registers, I agree that a new driver makes sense here.


--lNCG8WzO0TPLyYgP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcQ7yQACgkQFA3kzBSg
Kbbb9A//YJ9DUgYEiBVtqS/ma7iA7F8MGfIClcoTBk3HhHlJIaxdXSRQ9Ld19DTB
5fXKn9jRUQwsOK/O6WU62VW+jr9b70D+EXu0PEEAI2qUI9/LX1acdHwTdp9EVhGg
JPp1Hn0CGPGQVwgTbe/veNTXMUakpHWP2h+QbSMwRka+a+skEDshgiyZZqeo2l1E
+o1wseF8obYpb2+iydJA4Vp+DdEEJoHpMJZ0DZbgrIGicnVhDRi1O0tiQ+RIqiBP
XcP5VWGb9ceABCJuBaXxW3uSJ+2fdJy6Q7f4Tmh7DP+r1R5q5lTO4wEQ9QiGVjvx
S4JAA2hJskl6wQVcfHeG/tCWByahC3APq2PFGV/4YtvysyK7mke3GEhPknT/aIfu
UZTkqZottd6vNcHJM+knvTuT+5WJ7Y5kOUpVZ8Ed83Oa3LtuVjTRg7iG+VT01plo
yaLY0++R5uZNF+ABlM5lO91BSl5VpRAb6xWYOzCq7vU8U99fpXnwGwWw3Wmk7Z/f
fDMDEz1XhpmR6ETIjCVtIGu9t/Deyyg5tC9esoDe6FP80hhdFps6Mi0/sKW//iiA
/NaB2XsnC7H1GV7yCSQKCGTKcJNvzSdGFQnsq0DWWHloOfl6nbFdfpjiy/lAcolU
N2X59O6146VnHrhWtwaC2rt2nBz6qPVobXn+d1L6TA6Xx3ww6kg=
=bTvk
-----END PGP SIGNATURE-----

--lNCG8WzO0TPLyYgP--

