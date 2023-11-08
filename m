Return-Path: <linux-rtc+bounces-242-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA767E5A4F
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Nov 2023 16:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2E9EB20D5B
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Nov 2023 15:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFBF30352;
	Wed,  8 Nov 2023 15:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="coG2U3io"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D85199A5;
	Wed,  8 Nov 2023 15:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCA4C433C8;
	Wed,  8 Nov 2023 15:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699458256;
	bh=D4tT6+i1rkJ7YbrSU1uZeXHZViIJNDdGOZ3PS+ua+eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=coG2U3ioZRPJmjWSnMc9Qxh/kZ4r+JirkQrvPr0PBoerd8w4LHg5cHwMEOBbhKSq8
	 gf7ygTXs3OwSxY04z0d/X4M4DlJHEZjwlfqDHRcrQI/Mu/JfsUlkMreF+tsPB8q2r1
	 41W3Qzyn6cebaUkMvfWZdqdyNdNDpiQ/hPLOQnXcHggNUufWNRjSsr0QVaeV3o39nd
	 vuLRyZrG0SiNYtAKWbaX//0Mff8HJeVHRGguBZsYcaw255oHvHRRC8SnxrC2G6ayqG
	 R/qXPTipKUZ3isTSXxlF3I6xqXfFq8GWg8r4wYDOJ5vmCsd9rvVZqe3BWBSkYYGHJO
	 5LIaxa+ZRl5HA==
Date: Wed, 8 Nov 2023 15:44:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Romain Perier <romain.perier@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Daniel Palmer <daniel@0x0f.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: rtc: Add Mstar SSD202D RTC
Message-ID: <20231108-emergency-poker-8be712fdbf8e@spud>
References: <20230913151606.69494-1-romain.perier@gmail.com>
 <20230913151606.69494-3-romain.perier@gmail.com>
 <20230913-depress-bootlace-6b88bfd83966@spud>
 <CABgxDoK2T3xkKYDVeqRuDXMHfVEJcRkkBOBBkMJ5=XUv9Y5MsQ@mail.gmail.com>
 <20230914-coagulant-unbroken-2461d32274a1@wendy>
 <CABgxDoJhfKQesDtV3WJ=C-DPB8P+0LDmzbY9Zy909yr3v1FQKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MvonH0szEPgz/Evd"
Content-Disposition: inline
In-Reply-To: <CABgxDoJhfKQesDtV3WJ=C-DPB8P+0LDmzbY9Zy909yr3v1FQKQ@mail.gmail.com>


--MvonH0szEPgz/Evd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 02:27:37PM +0100, Romain Perier wrote:
> Hi,
>=20
> Alexandre seems to be okay with the current (merged) dt-binding, what
> do I do ? I can send a v3 for trivial-rtc.yaml that's not a problem
> for me but both of you seem to disagree :)

Meh, I wouldn't waste your time moving it.

--MvonH0szEPgz/Evd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUusywAKCRB4tDGHoIJi
0ubVAQCtdcyWkLpZZY7E1pDBQfevVzzlp/4iTySs7rChMJPoywD/bMfx52E1fORA
V14y5Vy0ZyWc7eL5IN6HIpKsQvpeBAY=
=jMoL
-----END PGP SIGNATURE-----

--MvonH0szEPgz/Evd--

