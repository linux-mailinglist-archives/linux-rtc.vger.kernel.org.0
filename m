Return-Path: <linux-rtc+bounces-5308-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04213C48ECC
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Nov 2025 20:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F21D9420E5A
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Nov 2025 19:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF02D32E147;
	Mon, 10 Nov 2025 18:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qj3wCZ0+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1431321445;
	Mon, 10 Nov 2025 18:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762800626; cv=none; b=eObHnt5pg/m8tkoAY7j4vvr/qCtEG7gxtrETqS2/YSYvTsle3duqJECyEqbj3lI8pUYjbFmx9afasPXlTp5uBM5MDBPGX7IXb4/xooFDxrI/PonWovea7pHSQRQymZJLzAwUzzq02iVZAttJ949xnaUSQI7TdMr5ovBhFi5qorA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762800626; c=relaxed/simple;
	bh=WMEB6mjW751eoW5/MtKFj40ys+WzQgF9PxLiSmGpWMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZRBAprx+5l7zFybAfZ6IFW6663KSMfEzUjG2JHDQEdtbCdfQWou0s3RlNMXjEUmAJGYV1QA7IMfrxvUTLRySdmBVAAdp26c1A33eNyR3YbXITA1Wt7B5rq9KHqrAXRHjkRf8DudZGE8QBfVLoOSzWciCQu3YlFFa+CgxVsd5Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qj3wCZ0+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27B9C4CEF5;
	Mon, 10 Nov 2025 18:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762800626;
	bh=WMEB6mjW751eoW5/MtKFj40ys+WzQgF9PxLiSmGpWMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qj3wCZ0+BgJTkXfacsrtMMfnqYs0xda0ZTXRZUat4o9nLOOMpxsYFM3oS1aPV09f4
	 r4w1Gmml/8tFgebNwcxlp+wBL2ViJsKqNb0oowQxpx6qPQ9bVUxvFBZuB8sZsnylxs
	 dXFX7ADkUsQyFcDHOmn3I2MFKjd7bnoxRXT0+ZfVpNPmRdK2b0Ggcv50nmGqe5R63F
	 iY+QInw9VNoZ2xXqYkW07077LMVffZoCHiUU9eBgpdr3v7yMuWgXtOiCMu3sW47h5R
	 JUqlY88sg8qa2mT3vSj1LeYhxLvjflOFx48OpuMC04IK3QBBYBVnk4NLlBOfjnf95A
	 yaB6110+aFWtg==
Date: Mon, 10 Nov 2025 18:50:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H
 support
Message-ID: <20251110-hardhead-upside-54baa149f453@spud>
References: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com>
 <20251107210706.45044-2-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uLr7jK3Ro09awz3l"
Content-Disposition: inline
In-Reply-To: <20251107210706.45044-2-ovidiu.panait.rb@renesas.com>


--uLr7jK3Ro09awz3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 09:07:03PM +0000, Ovidiu Panait wrote:
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

Didn't Alexandre already apply this? The changed version is
Acked-by: Conor Dooley <conor.dooley@microchip.com>
in case this replaces the other.

pw-bot: not-applicable

--uLr7jK3Ro09awz3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRIz7QAKCRB4tDGHoIJi
0tEyAQDXu1HgKNoW6Q/JrOXqf5BJ+qv5Ngh7KZHolUf2tBa8MAD/b167Oao1IVO+
wVheMPBaKJfDFGbt0JRvKNf759VP+Qs=
=P3r6
-----END PGP SIGNATURE-----

--uLr7jK3Ro09awz3l--

