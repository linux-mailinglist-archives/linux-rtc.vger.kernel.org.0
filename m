Return-Path: <linux-rtc+bounces-5247-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0250EC3255F
	for <lists+linux-rtc@lfdr.de>; Tue, 04 Nov 2025 18:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A300D3435A1
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Nov 2025 17:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44467333752;
	Tue,  4 Nov 2025 17:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXQup3nD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AB92D73BA;
	Tue,  4 Nov 2025 17:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762277313; cv=none; b=Bkp+0xl3rICup27W6qSMRC8VB3cn2kXXPCAdf9y948EVlgGU33V0gvpTnSptTYWTn/4XQjwrNCHnrX4v/8av8x7TuV5DBIoODYWkZTS0tnGOPishAFTs2rbxhRooGxwKnJv1AUCXu9WUdh0MEOyvYOgSUB26tlvQ/3DUFRCg6VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762277313; c=relaxed/simple;
	bh=S7Z133WpR+a5eLKR5hQpoFUBMLsZVhUq2O6OjhiGfkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twDt3g2ifP5pjzDFcXqoqcKY8AkYgvj4KhMTtslz7TjRSDQ8tZkhvKmDjt2N75NTfRfvpkl+CdMSdYjDIlhBiZ6hoT8nyJTl4FD0SKgwA+dcVXhLAfDVnnItPW/PyzoSAHmAwIP9ODwGJhQk4r0QvhITaLK1T0YWxZmZoUd6Fcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXQup3nD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD5CC4CEF7;
	Tue,  4 Nov 2025 17:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762277312;
	bh=S7Z133WpR+a5eLKR5hQpoFUBMLsZVhUq2O6OjhiGfkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OXQup3nDUCW5FWA/mgd5EheZSAPpg32DbN8PDXog3xFexz+JFdrV+JDCyq1Db358s
	 t+M4xPJKPzZOyTrC8dqQxR48j0ono/fSSAn2hd+Ha3OdZfOBQ6rb1OrUZhKR6Jq64E
	 T1d4/c4zg96r2QOp7/RZAZ0y6Gftd/XbQjlKGJ1G2ETcFoGrD649auzhiF3JH0xXpC
	 VUH5DBfuGzk0gezEODr4WyioU0G/FPtHt1ORYCcaD0IIDD8kbMHplEDFPY2ppw3mw8
	 UoQ5r06x+SLBjKF1c+dtJO3IsmcpVfy6sg2rcQKsTDrZnxll/AptE8uVkLWdlQ8SGq
	 LWeaoEfXpJPMA==
Date: Tue, 4 Nov 2025 17:28:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H
 support
Message-ID: <20251104-magnitude-deodorant-be607e3ff4be@spud>
References: <20251103121848.6539-1-ovidiu.panait.rb@renesas.com>
 <20251103121848.6539-2-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0rzm/jgZI01C209X"
Content-Disposition: inline
In-Reply-To: <20251103121848.6539-2-ovidiu.panait.rb@renesas.com>


--0rzm/jgZI01C209X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 03, 2025 at 12:18:45PM +0000, Ovidiu Panait wrote:
> The Renesas RZ/V2H RTC IP is based on the same RTCA3 IP as RZ/G3S
> (r9a08g045), with the following differences:
> - It lacks the time capture functionality
> - The maximum supported periodic interrupt frequency is 128Hz instead
>   of 256Hz
> - It requires two reset lines instead of one
>=20
> Add new compatible string "renesas,r9a09g057-rtca3" for RZ/V2H and update
> the binding accordingly:
> - Allow "resets" to contain one or two entries depending on the SoC.
> - Add "reset-names" property, but make it required only for RZ/V2H.
>=20
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> +        reset-names:
> +          items:
> +            - const: rtc
> +            - const: rtc_rtest

If you respin, just make this second one rtest.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--0rzm/jgZI01C209X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQo3uwAKCRB4tDGHoIJi
0p8DAP0YBP/URvbpDZ415bJ+Ex+G//fAd8Bi2P4cIvMysaB1xQD9FS6YTYh/7sEE
f2T6i7TVMxBpIu+8jGbWKU8T1wGJBQI=
=DOwv
-----END PGP SIGNATURE-----

--0rzm/jgZI01C209X--

