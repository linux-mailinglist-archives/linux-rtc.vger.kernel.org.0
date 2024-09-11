Return-Path: <linux-rtc+bounces-1938-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18034975A3B
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 20:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54450B23099
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 18:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9232C1B532F;
	Wed, 11 Sep 2024 18:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eufO4dj4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684B21B3734;
	Wed, 11 Sep 2024 18:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726078884; cv=none; b=aY8khMS6j4zHcOLT3Y3vQbwVQvL34c3BmI9bm2u350PQhM4DcUPiuNXJfLXz5SVyIZpipexOp/6z/w6ARpqkQOmhxufZWrNv6kFLAD0JCCjvRD+Okhh7qYhii8U+j2B8xgRTFfyCDpan5ySoU9gS2ROCWaD3qHwVZ0bFt1xpY+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726078884; c=relaxed/simple;
	bh=nMuSYTg4jXF6UeS8iQF2vdF2cdZq3UwftL469e8H+Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJsbISTQpk77WXMqd7t2jiYT70Hex8J+y7LcTBjbfpzQ7emsYqujjDtiZas0ojzn9qymWgoUoTdTZ3jiTxrJ60U7K2qJ9x7ocPIj8iRn2shdBbK6PP0m7y8w8DjTUqJPuNxVYtziey9UC9+U2M18EyXZ1Sy0wfh+VWwKCPL5Xeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eufO4dj4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B5D4C4CEC0;
	Wed, 11 Sep 2024 18:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726078884;
	bh=nMuSYTg4jXF6UeS8iQF2vdF2cdZq3UwftL469e8H+Ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eufO4dj4+kLUSwt1MV/NGWEz+Xf7pXrTI5EU5Ocw5+2w9L5l7d4i4OECrQFsexnOI
	 RKyYKRBTMzNzb9VwVJdUv6wPOre9TRqjqlrfQrCRB/JJmMrxjvIV8O4+oP+OGiBghh
	 HxTmuUGoKfWd4vrW5dE9hj33ltl8/44tbia4L/Kn86iEqS58+AXT/dBsCIlst/wXj0
	 hrErNRNge3hPUhzmqUDF8yUYXz6lwVTpokVVYnIbStqVlQvPgU58cNOmm2I+fL1wMT
	 ezb4dAZODs9fwdkLXPAroTOFE5VmqrnguCvVYpeJGWWZWnRzAVn/+Pw+VbicEsnV/I
	 XmXMyXE0OHnmg==
Date: Wed, 11 Sep 2024 19:21:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Message-ID: <20240911-racism-playmaker-71cb87d1260f@spud>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uAiRD+oX7AmcgdlC"
Content-Disposition: inline
In-Reply-To: <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>


--uAiRD+oX7AmcgdlC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 10:00:25AM +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>=20
> This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
>=20
> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Do=
cumentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> new file mode 100644
> index 000000000000..8f78bce6470a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> @@ -0,0 +1,79 @@
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
> +properties:
> +  compatible:
> +    const: nxp,s32g-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  nxp,clksel:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Input clock selector. Choose between 0-SIRC and 2-FIRC.
> +      The reason for these IDs not being consecutive is because
> +      they are hardware coupled.
> +    enum:
> +      - 0  # SIRC
> +      - 2  # FIRC

Could you please explain why, given both clocks must be provided by
the hardware for there to be a choice, why choosing between them is a
property of the hardware?

> +
> +  nxp,dividers:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      An array of two u32 elements, the former encoding DIV512,
> +      the latter encoding DIV32. These are dividers that can be enabled
> +      individually, or cascaded. Use 0 to disable the respective divider,
> +      and 1 to enable it.

Please explain to me what makes this a property of the hardware and how
someone would go about choosing the divider settings for their hardware.

> +    items:
> +      - description: div512
> +      - description: div32
> +
> +  clocks:
> +    maxItems: 3

I'd rather you provided an explicit items list here, explaining what
each of the tree clocks do.

Cheers,
Conor.

> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +      - const: sirc
> +      - const: firc
> +
> +required:
> +  - clock-names
> +  - clocks
> +  - compatible
> +  - interrupts
> +  - nxp,clksel
> +  - nxp,dividers
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    rtc0: rtc@40060000 {
> +        compatible =3D "nxp,s32g-rtc";
> +        reg =3D <0x40060000 0x1000>;
> +        interrupts =3D <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&clks 54>,
> +                 <&clks 55>,
> +                 <&clks 56>;
> +        clock-names =3D "ipg", "sirc", "firc";
> +        nxp,clksel =3D <2>;
> +        nxp,dividers =3D <1 0>;
> +    };
> --=20
> 2.45.2
>=20

--uAiRD+oX7AmcgdlC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuHfnwAKCRB4tDGHoIJi
0nUtAQC6Vzg7zrmcJXz4U0qPYVpKASsHkOSEL6vnI/KceTRfjAD/SeL/IMgFUGqL
shHO91YGqUhR6HdfM0WLmP+7Re9Q1w4=
=6S9Q
-----END PGP SIGNATURE-----

--uAiRD+oX7AmcgdlC--

