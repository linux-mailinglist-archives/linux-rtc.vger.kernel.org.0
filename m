Return-Path: <linux-rtc+bounces-2226-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7079A203F
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Oct 2024 12:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 961641C2489F
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Oct 2024 10:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610871D9A44;
	Thu, 17 Oct 2024 10:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HllfLsOi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A42A1D0BB2
	for <linux-rtc@vger.kernel.org>; Thu, 17 Oct 2024 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729161945; cv=none; b=uTFPGZ9vdhqfsN7TU6WPsfnG79SE2910SfXUBDeI5Cf/JWlt0g6kzzxRAb131D/aVw7m4ZEH7t7h8E7gnyYMqymO9p7nrfqk7CWBmJ5J99nMTZ0HoEZl4qQYGqggRmof9xWsVWfmSzUR2NN2kloBmOMyy0M6aMq66DI3h2JiWq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729161945; c=relaxed/simple;
	bh=QdA6vOlmDZJ7NqYoYDzaqmLd2u3S8tMiLHjIhKDQCVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbYUuU7wf3ayfrQJJiqa6474oV8tMyRb8ERbFq1u94n8+129pEM1P1X1sOw+p7VEfct1B45acxd5gKZz/eqpFCGJ0y6IOkdsOpGA2WsvQ5ekhTuH+rKUXFqahqpP06bN8u1c92W0hZ2ThTcXqA5FKH7c8xH3q670XwOZ4izn41s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HllfLsOi; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/5y0
	ypsfWq7EM2KRl4pjCSLN0M/AE8QUTI2X2N4U0hY=; b=HllfLsOiSWvJ6YQMcw05
	CIZu/zpLjm9y9XdHu32UmKfmhK8yZ0Em61+QHu48vt/rReZqr2A75c5ebtWd1dVg
	+qJ/1W7fhiYtkhGUSuZXcGWmwV65cyFUHi157A4CORMXHIvEXajsv4VORx7S2Gra
	Mi73/ozkoDlc0AclHnKNLmLa3idXML51+6PumRav1ztPDMEkdPiHP8mZ8TSvWLGa
	4Vrm5kh3kSxb/zShgpC5TNfSvb3OyTztIx9Vg8J1dpkcJUfCbYjr04kgmm//CDtG
	INmFzS/TKIZfb7PcisBuTDawK4sZxps95VIgqm8gX84sk6Z6qMytP+p0Vs2p9o6w
	hQ==
Received: (qmail 3353394 invoked from network); 17 Oct 2024 12:45:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Oct 2024 12:45:34 +0200
X-UD-Smtp-Session: l3s3148p1@t6/R4qkkC0BtKPEX
Date: Thu, 17 Oct 2024 12:45:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 06/12] rtc: renesas-rtca3: Add driver for RTCA-3
 available on Renesas RZ/G3S SoC
Message-ID: <ZxDqzeA2mz0Ml6cZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu <claudiu.beznea@tuxon.dev>, geert+renesas@glider.be,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	kernel test robot <lkp@intel.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-7-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y12kh0Tsg/wH5L1d"
Content-Disposition: inline
In-Reply-To: <20240830130218.3377060-7-claudiu.beznea.uj@bp.renesas.com>


--y12kh0Tsg/wH5L1d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

sorry for being late to the game. I just noticed this series and
wonder...

> +/* Counter registers. */
> +#define RTCA3_RSECCNT			0x2
> +#define RTCA3_RSECCNT_SEC		GENMASK(6, 0)
> +#define RTCA3_RMINCNT			0x4
> +#define RTCA3_RMINCNT_MIN		GENMASK(6, 0)
> +#define RTCA3_RHRCNT			0x6
> +#define RTCA3_RHRCNT_HR			GENMASK(5, 0)
> +#define RTCA3_RHRCNT_PM			BIT(6)
> +#define RTCA3_RWKCNT			0x8
> +#define RTCA3_RWKCNT_WK			GENMASK(2, 0)
> +#define RTCA3_RDAYCNT			0xa
> +#define RTCA3_RDAYCNT_DAY		GENMASK(5, 0)
> +#define RTCA3_RMONCNT			0xc
> +#define RTCA3_RMONCNT_MONTH		GENMASK(4, 0)
> +#define RTCA3_RYRCNT			0xe
> +#define RTCA3_RYRCNT_YEAR		GENMASK(7, 0)

... if it has been considered to expand the existing rtc-sh driver? The
register set looks identical up to RMONAR. From that on, it looks a
different. Maybe the different offsets and bit positions could be
abstracted away by some sh_rtc_{read|write} helper? Or is there some
other new handling which makes re-using rtc-sh cumbersome?

Thanks and happy hacking,

   Wolfram


--y12kh0Tsg/wH5L1d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcQ6skACgkQFA3kzBSg
KbZzFhAAkxKvkdBgA6qdjGdJIVpKSuaZugMZFjvBRXw6WR7IP65QB6OP7P0GHUE1
OX2i57KUnQfkce0KYw5Ak+rFvPGkE/KbVTJcqno9UyiqhL7MjoRj0sAbOe7z/N3N
NSZ+gOyAdCYkQ+yau/XhyWoFntbFKEbIknhN7agIm9eTqO5weEwC7hlIoX4JVq2t
+lZ0uMjAhf/QNnNaEeiCWMnZ+ltJuO9gNdFIGwef4dox6LiNy1JSRIy6627N3gx/
8Lc6ap6k7sKW/4FLxoKkL/7CDfNdx8LlJZH/RgQ1Cvy8kUZ5qUctssDX2sgYz3uL
V8G/t5cNfjafZd1z5pPbQRpyBG6S8YLRF/TfpekvY/fFgKWsFKoZGSikMsxx3Wua
3c6dCIp4Bau60iWXCMxdpdP69k16KEgD8EkM4gap24Is14yoyq9VbZXej0pBQfne
ak5w6P10ddga+AJu//ghA3ML1ZmY12f/jtDMiKDr7iFq0jLaKu9lBlAUbQeoOMQY
eC4K555DNJYlTr5cFUa2obs9w/+9ATc+wiMYuetNccVnpmcdmoPcUBf2Zo3jSuqz
hdo9kmzqcerK9YZHhYHCZwnBxl+h4ga9DGMFVJ6dbbiAD5x1Dk5LuOHd9X62b0+8
H6zskyMykGIuxTlkr0rNkUHDHLpu4XYafiCsyGKSetE2hW66Tu0=
=bN8G
-----END PGP SIGNATURE-----

--y12kh0Tsg/wH5L1d--

