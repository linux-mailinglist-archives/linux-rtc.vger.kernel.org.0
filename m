Return-Path: <linux-rtc+bounces-1526-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A038E932B94
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 17:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C84C1F20B64
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 15:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E940D19DF70;
	Tue, 16 Jul 2024 15:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSlPnKkG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02E427733;
	Tue, 16 Jul 2024 15:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721144811; cv=none; b=krTpZ98Td88aliSzZM3Z22iFa3w66OywEsqToqcLkzGlliO8y83ztPcKF97x9DwsWQi8H3/rB2GPVGtBanSDB0MaS5bRhNT4OOyiOj/2P+wzX86MqbnnfEXI6y+zfYRmBbxwofERnk3S2OjPbVi905uhua8pBuQ/jjx88dKLYkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721144811; c=relaxed/simple;
	bh=W1aDyR35xnncP21CWVETLRavcOB91+2faqmLffVHPEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRPXf4o3KWV8mTiM7KhfWf4/S8SKwwYEUO/f7n9j3nXDefksuuoxcjRYEnFsFwm+UPK6Jr6Yo+5MH4EI765UgmzKIorOtiTu4I4iELoT7CbIQvlhfKSrcL3sm3KtWjPAAjoDOjIb87oLzrQM/Up7r1elE6ilcTYsCsNMgvrRY2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSlPnKkG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F317AC116B1;
	Tue, 16 Jul 2024 15:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721144811;
	bh=W1aDyR35xnncP21CWVETLRavcOB91+2faqmLffVHPEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PSlPnKkGJ1kfCQRJRrishumQqQmHa3QN7e8xIDqy9g3fkYFXjgAQPvKL3UngdW0wO
	 iD7RdPMRcLDMVh4JFS0ax7Oj9DP7tFXpTuZr0vVOh9+dO0IlBa0nWlD73IddfsHHzI
	 7lGVFVFCxUCoF5fK5K1gv8F0akc/y+ZE4hYJRDtS54mgyDuRakN0oikSCMlMZbS4yr
	 DA+MM2dhuMe7Lnr4ojVapBNMd3ny1o4W8Dj6c4gGhq00sGH5vh96ERsT9K5oh5iE/W
	 HOdk5M8vtU+FHqovwuTJM93DQvONk3tgHMBTLnYO9/rfCi3sYbLE7U7yNzNjBsf2Bj
	 2NxzvHWNqQzSg==
Date: Tue, 16 Jul 2024 16:46:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alexandre.belloni@bootlin.com,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 04/11] dt-bindings: rtc: renesas,rzg3s-rtc: Document
 the Renesas RTCA-3 IP
Message-ID: <20240716-emblem-venomous-4076fec2e433@spud>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
 <20240716103025.1198495-5-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cT6PXcwCbo8g9vsX"
Content-Disposition: inline
In-Reply-To: <20240716103025.1198495-5-claudiu.beznea.uj@bp.renesas.com>


--cT6PXcwCbo8g9vsX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 01:30:18PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
> The RTC IP available on Renesas RZ/V2H is almost identical with the
> one found on Renesas RZ/G3S (it misses the time capture functionality
> which is not yet implemented on proposed driver). For this, added also a
> generic compatible that will be used at the moment as fallback for both
> RZ/G3S and RZ/V2H.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--cT6PXcwCbo8g9vsX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpaV5QAKCRB4tDGHoIJi
0jFsAQC+QJlqSg95siB5zEVl9dAFiFbwf7pRXv/F9A1AcCy/RwEA1ePIw6fACeSF
xTdpzkjnAgTGPeRDGcnoyRMffd6eQwY=
=OJ0g
-----END PGP SIGNATURE-----

--cT6PXcwCbo8g9vsX--

