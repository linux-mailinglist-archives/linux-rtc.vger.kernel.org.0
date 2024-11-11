Return-Path: <linux-rtc+bounces-2510-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D029C4652
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 21:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F4CC1F225A6
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 20:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACB81AB6CD;
	Mon, 11 Nov 2024 20:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eS/OrRWR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2915B156C72;
	Mon, 11 Nov 2024 20:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731355556; cv=none; b=e9wLNDp5BN5Vg3e4N8m4C1xzCYLDwMp0CaiFSpeBsIDG7NkQDF/NQLuGHulcg2ErKmbkB0Pr9RxKevZk9FbI4LrBWvzQlXAF+cD65dyFhD6akLVvdkMzmWKv2jfbxxQMgXrpCOa+tWee0jJ7FsWGsFUeOV7bGwQORvdrOwEqzkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731355556; c=relaxed/simple;
	bh=P/A4t7isfDyVz8j9Sq/pwxO3TMGHlALcDuMM591w7Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQUpVhA+iVuta0v2g81PtxSog2b+rxEh5AZj5EVdvQOR8x/3EWf5YnKnUnVe8aEhFO3JmLLiHaxfvfSinntRZRSDvc0iOd+uA1i5Ap7FgXxiFo6qS8XX2OhyECcUI8FdguTZCq9Qq5Pht6tTlZFMTkB4eu32xzaYmiuQrE/+GDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eS/OrRWR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8801BC4CECF;
	Mon, 11 Nov 2024 20:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731355555;
	bh=P/A4t7isfDyVz8j9Sq/pwxO3TMGHlALcDuMM591w7Jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eS/OrRWR9GKahaWVeRdLCb11t5RZvRDcv+hXzvAuPly9D1KmeiU6LOGawK/SyOX/K
	 tPx/6inFFKY/gqUXdt1tmk99Cc4QdMVKM/89M/oaqPZgIpu0ymd6gruWN//ZrVuW9a
	 c5YmF75caj591q/9Xx2buxiNQqudDKyv9QhlDTGX+PjmsQCDiAa3gxNt+NokjjG+Xi
	 uPKmqCNGuvE9U9/r9/pHWZsIRlwdD5NcGC0q0RYq9O7whOilrSHfVZRuxLSzRsEkux
	 0CGBGcyekzyGL4qfyWr05qrlW5ljhBvLUf3PY/lNWQvmdu80ZExc/eYEUITgTpUC+c
	 U5w+zwxaYldsQ==
Date: Mon, 11 Nov 2024 20:05:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
Message-ID: <20241111-guidance-theft-9d49ded4d9a0@spud>
References: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
 <20241111135940.2534034-2-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CD7jql/wzOKtL+uU"
Content-Disposition: inline
In-Reply-To: <20241111135940.2534034-2-ciprianmarian.costea@oss.nxp.com>


--CD7jql/wzOKtL+uU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 03:59:37PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>=20
> RTC tracks clock time during system suspend and it is used as a wakeup
> source on S32G2/S32G3 architecture.
>=20
> RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
> during system reset.
>=20
> Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Do=
cumentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> new file mode 100644
> index 000000000000..231811579e1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32G2/S32G3 Real Time Clock (RTC)
> +
> +maintainers:
> +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> +
> +description:
> +  RTC hardware module present on S32G2/S32G3 SoCs is used as a wakeup
> +  source. It is not kept alive during system reset and it is not
> +  battery-powered.
> +
> +  RTC hardware module contains a hardware mux with 4 entries/inputs
> +  for clock source selection. On S32G2/S32G3 SoCs, this mux is used
> +  to select between a clock source for runtime which brings more
> +  precision but is not available during system standby, and a clock
> +  source for suspend state.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nxp,s32g2-rtc
> +      - items:
> +          - const: nxp,s32g3-rtc
> +          - const: nxp,s32g2-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +    items:
> +      - description: ipg clock drives the access to the
> +          RTC iomapped registers
> +      - description: Runtime clock source. It must be a clock
> +          source for the RTC module. It will be disabled by hardware
> +          during Standby/Suspend.
> +      - description: Standby/Suspend clock source. It is optional
> +          and can be used in case the RTC will continue ticking during
> +          platform/system suspend.
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 3

You actually have to provide the clock-names, otherwise you can't rely
on them

--CD7jql/wzOKtL+uU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJjngAKCRB4tDGHoIJi
0ntPAQDEkJcfP5c7GFs4rZSWpwpDhFNDY9PU2IOjh8XBHbRouAD+IU+Y1reHC4sL
jGNjThmFUy9VssSwShKp5ZSobznsFww=
=dgLe
-----END PGP SIGNATURE-----

--CD7jql/wzOKtL+uU--

