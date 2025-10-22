Return-Path: <linux-rtc+bounces-5125-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C769BFDA61
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Oct 2025 19:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 298713584A0
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Oct 2025 17:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1AD2D7814;
	Wed, 22 Oct 2025 17:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOHm1xhm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EA835965;
	Wed, 22 Oct 2025 17:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761154945; cv=none; b=FqR1t2xtVXeoAzkgZWJqc4hateLzwVsU6OK2047uS8ZpsX+w2MKFKxcQkCCtWr4khixCFeJfy/umExd5wm4Yn28D+bqgt1wCHDEzxGSeKHTK8CmS1TsJDfNGW8X/eARBNmdm//A0E43Ybzdkt8znUdPS1clYXHKbFKztIIPo4DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761154945; c=relaxed/simple;
	bh=0AMO4lrL/O5t2XKs7B1Iizfw927Zz0Apzg0ldNXZdUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTN59MulPzPQ9YobwHtIQybZ+cbCCPQ37Ix2SQ2p+J8FIFRxAXWbpd7AdGs5BHfNjpfwLvaV89d6LowJqVVV1+2o9CUsav9Uz6fSitOdTvKg6DK0ASh5NkTayBiQ7WtNbP7cfGz4qImfJCC2d/uQbC2ZY8vms9sysimUhUE2404=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOHm1xhm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED36C4CEE7;
	Wed, 22 Oct 2025 17:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761154944;
	bh=0AMO4lrL/O5t2XKs7B1Iizfw927Zz0Apzg0ldNXZdUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FOHm1xhmo1kgXWFc4uIkN86mJYA95j2eikpskH5pimO30ekPriCRukukUtxvKmozD
	 vMLDn85Rfu9wWdzW002K1G+yrywnCNTF76fJhsG9esjE1PVKyvAQg1nQiAzy5Fv9Sh
	 OTGvXWn1XYPVVoK2szpWHSehCFbFcKsBA54VY+KavawYDlQFO84Y/xOZYBcFAXVqrH
	 MiDzZ2P9VLvdxik8Fk+B9t9YQnlP2IfTstZ85mKcGCkveLcO6e346sirnXMYwxmf/O
	 yjbuCjOsjCjB/NOafCnw0lSZlbidZVVCRn018rKTbCIopBZTUKdfOOQZYPOcJesw+0
	 ijHsJGxOir1eA==
Date: Wed, 22 Oct 2025 18:42:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H
 support
Message-ID: <20251022-default-circus-944c6495cf63@spud>
References: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com>
 <20251021080705.18116-3-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R3KKSfrPuScx9hz5"
Content-Disposition: inline
In-Reply-To: <20251021080705.18116-3-ovidiu.panait.rb@renesas.com>


--R3KKSfrPuScx9hz5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 08:07:01AM +0000, Ovidiu Panait wrote:
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--R3KKSfrPuScx9hz5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkXewAKCRB4tDGHoIJi
0q7TAQChZVDH6ozWYZk41KzGc/dUW9h4Owva4y7k8VjvxZSr7AEAlwoRe5h+RXJq
Hv7cLdSxJehdR//pUV1yUr9sWbKSNws=
=+6bp
-----END PGP SIGNATURE-----

--R3KKSfrPuScx9hz5--

