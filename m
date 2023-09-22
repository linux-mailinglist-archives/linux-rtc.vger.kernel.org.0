Return-Path: <linux-rtc+bounces-9-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7137AAFDB
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Sep 2023 12:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id C82882823B8
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Sep 2023 10:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90988182DA;
	Fri, 22 Sep 2023 10:45:54 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722BB9CA64;
	Fri, 22 Sep 2023 10:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDCACC433C8;
	Fri, 22 Sep 2023 10:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695379553;
	bh=puLtyXm42PyEsz/VsiopZo93dCIxQVHLAUZ9CXlbExI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Twe5oFvWAUyba1SiyX60eP6nurVZbNL670eIg4fBz5Eq5omZTYYq9vS/fSqq/I03x
	 ujcXMMBKoU7ppsJq5QzOQv4dEx0VlRz9FMPhmRKQcIvniwAkjbrvuuxuRBxhoPtbDM
	 R7w6IzgKm3a6bD02t0Z2IRImT1ZeuZgbGQasCILt6znVc/i8nBUoUG7mWNuyTAxZjk
	 xhiL/bHu4ExEnCgcR0Bs9o/9PYMS4FSKEb29EnBA/9O2BlL1GQNbugFzWnaUmFaYZb
	 B0H3tIHKkfL0O3FNtIdkgg3B4jibTJYG+nI4Og8rq6rcsfl8wS/D6OBcSwdABItAOW
	 3E6VdfLK/+A4Q==
Date: Fri, 22 Sep 2023 11:45:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Jose Vasconcellos <jvasco@verizon.net>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: rtc7301: Rewrite bindings in schema
Message-ID: <20230922-magenta-impending-f5ade19286ae@spud>
References: <20230921-rtc-7301-regwidth-v1-0-1900556181bf@linaro.org>
 <20230921-rtc-7301-regwidth-v1-1-1900556181bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qp4tfABFVg7B8OEx"
Content-Disposition: inline
In-Reply-To: <20230921-rtc-7301-regwidth-v1-1-1900556181bf@linaro.org>


--Qp4tfABFVg7B8OEx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 10:27:42PM +0200, Linus Walleij wrote:
> This rewrites the Epson RTC7301 bindings to use YAML schema,
> and adds a property for "reg-io-width" as used in several
> other bindings to account for different register strides.

It'd probably be good to mention that there is hardware that needs this,
rather that saying "other bindings use this".

>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/rtc/epson,rtc7301.txt      | 16 -------
>  .../devicetree/bindings/rtc/epson,rtc7301.yaml     | 49 ++++++++++++++++=
++++++
>  2 files changed, 49 insertions(+), 16 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/epson,rtc7301.txt b/Do=
cumentation/devicetree/bindings/rtc/epson,rtc7301.txt
> deleted file mode 100644
> index 5f9df3f1467c..000000000000
> --- a/Documentation/devicetree/bindings/rtc/epson,rtc7301.txt
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -EPSON TOYOCOM RTC-7301SF/DG
> -
> -Required properties:
> -
> -- compatible: Should be "epson,rtc7301sf" or "epson,rtc7301dg"
> -- reg: Specifies base physical address and size of the registers.
> -- interrupts: A single interrupt specifier.
> -
> -Example:
> -
> -rtc: rtc@44a00000 {
> -	compatible =3D "epson,rtc7301dg";
> -	reg =3D <0x44a00000 0x10000>;
> -	interrupt-parent =3D <&axi_intc_0>;
> -	interrupts =3D <3 2>;
> -};
> diff --git a/Documentation/devicetree/bindings/rtc/epson,rtc7301.yaml b/D=
ocumentation/devicetree/bindings/rtc/epson,rtc7301.yaml
> new file mode 100644
> index 000000000000..4bcf1716cab6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/epson,rtc7301.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/epson,rtc7301.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Epson Toyocom RTC-7301SF/DG
> +
> +description: The only difference between the two variants is the
> +  packaging. The DG variant is a DIL package, and the SF variant
> +  is a flat package.

The lack of a \n after "description:" looks odd, and my OCD would like
to have it.

Otherwise, SGTM!

Thanks,
Conor.

> +
> +maintainers:
> +  - Akinobu Mita <akinobu.mita@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - epson,rtc7301dg
> +      - epson,rtc7301sf
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-io-width:
> +    description:
> +      The size (in bytes) of the IO accesses that should be performed
> +      on the device.
> +    enum: [1, 4]
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    rtc: rtc@44a00000 {
> +        compatible =3D "epson,rtc7301dg";
> +        reg =3D <0x44a00000 0x10000>;
> +        reg-io-width =3D <4>;
> +        interrupt-parent =3D <&axi_intc_0>;
> +        interrupts =3D <3 2>;
> +    };
>=20
> --=20
> 2.41.0
>=20

--Qp4tfABFVg7B8OEx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ1wXQAKCRB4tDGHoIJi
0heeAQDxLxFn4uD7tsuA2C2iF4MsXEbMaULx+zvy7J1RQ5hP1gD+PZ31uIl5RfH7
TKkrjD8pjgZpPxefZUfLkgZH+M2jmgI=
=hCYZ
-----END PGP SIGNATURE-----

--Qp4tfABFVg7B8OEx--

