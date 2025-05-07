Return-Path: <linux-rtc+bounces-4057-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4157BAAE2F0
	for <lists+linux-rtc@lfdr.de>; Wed,  7 May 2025 16:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE598188C25B
	for <lists+linux-rtc@lfdr.de>; Wed,  7 May 2025 14:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6161D28BA84;
	Wed,  7 May 2025 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2t9wL/Q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335E825E816;
	Wed,  7 May 2025 14:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627784; cv=none; b=JCc1zUlIxe5qEanblpdpe+pA25l1NiKTUA0BiRz1CEAviuG82Cd8sBDwavJetcTDg2J3aBPSqiHoZ2sMssCDRfjVhl2SFF6omJ9hAzZbt5XHiEVaFn4FtUz9BLUCxaz4vRilPKiNJc/cKK1y1WaNFCoB7sABqw4QUN7GfYzKYHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627784; c=relaxed/simple;
	bh=SqiMRe5738eY7cluVKlqsmNjWnERIUVSiShN//tNEPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+zfBsk1tlAShuP0M08R0OKjzttfjki+WI0lu6JHU4A+mIuJtO30VSD73+XjzFVLwdZZWWXSs1Rv3SXkOdzBYMIRKohZfIXcBzYpvGkhkItO6vGyPjjBby9RHc5XxjSkphVea7oEvfCF60XuesixbJcrLgpNuShdfg2Hj87Nr1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2t9wL/Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D79C4CEE2;
	Wed,  7 May 2025 14:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746627783;
	bh=SqiMRe5738eY7cluVKlqsmNjWnERIUVSiShN//tNEPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P2t9wL/QKq+lXcXzo2YLa13CmEtCsb96D/WYVVk47qQQTkcVywgwsEKt6Oh/WBH4D
	 IBms+1NXipxhbfiZQcgzyjqO8o1fT3hfxsbFia9Oxugdac0+Mw/l22gAHWbh+C801Y
	 8isRnFMd5ml8WAWMnhsFMwVaZYl/D5kEm9Yka3wf2w1i+rGTxWpKovcv0JifzqQyhB
	 Xs4z4GuE5jRkexsmowVUgU4850UIYsQgsnTsNafYXIiQopPojSdNPvHJ7gUpC4Drul
	 L3dBPtvUG4932YejH3WILJAR/UdPFTlkk0maJzWx8XlfxzeF3ZWPEflOPZt66KcSya
	 WW4JaAilQb9lg==
Date: Wed, 7 May 2025 15:22:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Pankit Garg <pankit.garg@nxp.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
	alexandre.belloni@bootlin.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, daniel.aguirre@nxp.com,
	shashank.rebbapragada@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v3 1/2] dt-bindings: rtc: Add pcf85053a support
Message-ID: <20250507-zap-dyslexia-924cfd1b6ec9@spud>
References: <20250507072618.153960-1-pankit.garg@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5nmx1imcW8zRLMjW"
Content-Disposition: inline
In-Reply-To: <20250507072618.153960-1-pankit.garg@nxp.com>


--5nmx1imcW8zRLMjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 12:56:17PM +0530, Pankit Garg wrote:
> Add device tree bindings for NXP PCF85053a RTC chip.
>=20
> Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
> ---
> V2 -> V3: Moved MAINTAINERS file changes to the driver patch
> V1 -> V2: Handled dt-bindings by trivial-rtc.yaml

You forgot to add my ack.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> ---
>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Doc=
umentation/devicetree/bindings/rtc/trivial-rtc.yaml
> index 7330a7200831..47be7bbbfedd 100644
> --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> @@ -65,6 +65,8 @@ properties:
>        - microcrystal,rv8523
>        # NXP LPC32xx SoC Real-time Clock
>        - nxp,lpc3220-rtc
> +      # NXP PCF85053A Real Time Clock Module with I2C-Bus
> +      - nxp,pcf85053a
>        # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
>        - ricoh,r2025sd
>        # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> --=20
> 2.25.1
>=20

--5nmx1imcW8zRLMjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBtswgAKCRB4tDGHoIJi
0hetAQDZFb6bBTURET8u5tSP7OaxYKBO21m+kAdZypUEsonwAwD+MgiaRwDkaySB
JhAobKfGy7iy6AN+lvsBNbBpVbS/mgI=
=o9Ub
-----END PGP SIGNATURE-----

--5nmx1imcW8zRLMjW--

