Return-Path: <linux-rtc+bounces-1974-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DF0976F94
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 19:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E7961C23AD9
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 17:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A152188922;
	Thu, 12 Sep 2024 17:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9RJ91Q+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF9B17C9A4;
	Thu, 12 Sep 2024 17:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726162257; cv=none; b=HrD6acUVez1fRudOyv7YUJwEuUCq0s2ngwFT2VlxzjDaC34DUrXXYvhNwcd/UcvA3kz+a28NvP4ZKlByJdA0cLwywNjp2D5Y7idAaqurs1QFqjn9MSfVLS7w9mMpd5huw8LGFMKGX5xVlfgJuQp831qLWGfJbggfSsfZw5TawOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726162257; c=relaxed/simple;
	bh=8y1dR77puzn0RMjQTmk+xE8FToGJficDwic/ip1+65w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdWW+z8kMiiHToxKPfFtMRZfPBGyPuwYE2ESICj2gfEIKsJf6WrvPuBvZB0PF+NhU3bcFN51GFfze5Z8LZOCVWTxK6CMWpOZi+IPCQsfcvBMtJIqCFzj8yItRIKOICFWMVNl5UemMAitzwEowr9ZoRlQ3I7335GTc9+BC1IYNZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9RJ91Q+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA51C4CEC3;
	Thu, 12 Sep 2024 17:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726162257;
	bh=8y1dR77puzn0RMjQTmk+xE8FToGJficDwic/ip1+65w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K9RJ91Q+I0jr/EUH9yRcVV1aZg84L+o8IM8IcRi0rbokVhyypjosQlx18+iYffsVF
	 KVQEDvvEzwjf8FZGD7DKisEqvN8JplYE0fx8i4ceBGg628uZ5xXAbBQjQn/16pnrkr
	 2kQbtDoIbhZWGjw9MKVvCp7gLatLa1SPs16O19ZFtkuMWBN8/6u6yqt2N/N1aQUlzz
	 /C7iGxAnWpFZ51i74m6b1d7BgHsKQTAfvOY2jhALi3Jb/13nc3rNqRcSYWZTQuP2WL
	 EfaT/1AoqGwtlPgycOKWfVVvzp4443ZkJv092SThLVIW336g6SEl7Dl69mOnqlwNhz
	 N+kpaOqVJWA9g==
Date: Thu, 12 Sep 2024 18:30:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, alexandre.belloni@bootlin.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: watchdog: rockchip: Add
 rockchip,rv1126-wdt string
Message-ID: <20240912-uncloak-legible-f5dfe659ef61@spud>
References: <20240912142451.2952633-1-karthikeyan@linumiz.com>
 <20240912142451.2952633-2-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EZDJnundzgFSPVEf"
Content-Disposition: inline
In-Reply-To: <20240912142451.2952633-2-karthikeyan@linumiz.com>


--EZDJnundzgFSPVEf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 07:54:46PM +0530, Karthikeyan Krishnasamy wrote:
> Add rockchip,rv1126-wdt compatible string.
>=20
> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>=20
> Notes:
>     v3:
>     - add watchdog compatible string
>=20
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml =
b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index c7aab0418a32..bccd27a1e470 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -31,6 +31,7 @@ properties:
>                - rockchip,rk3568-wdt
>                - rockchip,rk3588-wdt
>                - rockchip,rv1108-wdt
> +              - rockchip,rv1126-wdt
>            - const: snps,dw-wdt
> =20
>    reg:
> --=20
> 2.39.2
>=20

--EZDJnundzgFSPVEf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuMlTAAKCRB4tDGHoIJi
0mj7AP9zO5lyYCl1VkO9TLYU9+GIDBHB6DnJPkBavC5UxSCQCQEAmtTmBuv9omXs
VDfEkO/KDhle6E2vpY2syWDZ0wnnvQ8=
=go4c
-----END PGP SIGNATURE-----

--EZDJnundzgFSPVEf--

