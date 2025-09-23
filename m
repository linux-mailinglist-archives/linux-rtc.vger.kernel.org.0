Return-Path: <linux-rtc+bounces-5016-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE22B97411
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Sep 2025 20:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DABD13B3A93
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Sep 2025 18:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF272E0914;
	Tue, 23 Sep 2025 18:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ic+JDID6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB0720A5C4;
	Tue, 23 Sep 2025 18:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758653859; cv=none; b=I6hIrS5zxLc3hUzLT3wxYdh6aVx+ICorBShY+VbxNWG0PaSdGN3eT0YoEBs1E3RF/s06WVdvxG2bx1gyEb5CoAsePKKHk0p4JI+b7pbrS+mcoMrNWeYcYCKWTvg5Boyx1RgujU9s4CAmV3DwgXYamLWH+M7dy6p93lp+e3PzgBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758653859; c=relaxed/simple;
	bh=dNT5HGq+/wivsTM0xfWilLF/3cUEjidlwnClb+HJxQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7Tj3FXj8Zq02lQg4TPd9gmT1sV46oXRO1BHuCjFotNshPGiN2io4iYCnep1JzW75di1GkO2i36GBkR5uXXiW1wDVXytFxITCh230ZmLSEgd/fOdGLciBuC68vJjOS57gDZdn1tYlTOlG1fUH9iuqgJ50NqVZklvrWHFEvKfEOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ic+JDID6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6CDC4CEF5;
	Tue, 23 Sep 2025 18:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758653858;
	bh=dNT5HGq+/wivsTM0xfWilLF/3cUEjidlwnClb+HJxQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ic+JDID6e68RvSFNbqq0MF1glN9NUZtgi4VR7HtOWlB5eeQC3uQr7b/EE+x+OrjBb
	 sHi7MdnhsRwwu2vnlp+CWXQIKSemlToG0yXjvPsxlURejCqYxWRkTT9Sd4FcBNR4ng
	 7QGnqWX9n2wlHwr1lGWIInvNnSbGgPDBV+B8ZMbls4YnOWtSef9MBF6j31tZbjWouD
	 nETuruRIrRQsgWLlwJhv3bq3MePvXjw7lcqD4qtmILCmrZWaRKQxgrM0zaTgIlBnlW
	 9euBWUo2ML30KFyrUd6ZzllAfc+iL4hzixXFf1JeYwAHwpakZV4r7287WQDNjAzJxV
	 fW2bFjNvYwtRw==
Date: Tue, 23 Sep 2025 19:57:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	pankit.garg@nxp.com, vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com
Subject: Re: [PATCH v4 1/2] dt-bindings: rtc: Add pcf85053 support
Message-ID: <20250923-capitol-easter-d0154d967522@spud>
References: <20250923113441.555284-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fY6x4SCrQh3vev97"
Content-Disposition: inline
In-Reply-To: <20250923113441.555284-1-lakshay.piplani@nxp.com>


--fY6x4SCrQh3vev97
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 05:04:40PM +0530, Lakshay Piplani wrote:
> Add device tree bindings for NXP PCF85053 RTC chip.
>=20
> Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> ---
> V3 -> V4: Add dedicated nxp,pcf85053.yaml.
>           Remove entry from trivial-rtc.yaml.
> V2 -> V3: Moved MAINTAINERS file changes to the driver patch
> V1 -> V2: Handled dt-bindings by trivial-rtc.yaml
>=20
>  .../devicetree/bindings/rtc/nxp,pcf85053.yaml | 128 ++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85053.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml b/Do=
cumentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
> new file mode 100644
> index 000000000000..6b1c97358486
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85053.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2025 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nxp,pcf85053.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP PCF85053 Real Time Clock
> +
> +maintainers:
> +  - Pankit Garg <pankit.garg@nxp.com>
> +  - Lakshay Piplani <lakshay.piplani@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,pcf85053
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  nxp,interface:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [ primary, secondary ]
> +    description: |
> +      Identifies this host's logical role in a multi-host topology for t=
he
> +      PCF85053 RTC. The device exposes a "TWO" ownership bit in the CTRL
> +      register that gates which host may write time/alarm registers.
> +        - "primary": Designated host that *may* claim write ownership (s=
et
> +          CTRL.TWO=3D1) **if** write-access is explicitly requested.
> +        - "secondary": Peer host that writes only when CTRL.TWO=3D0 (def=
ault).
> +
> +  nxp,write-access:
> +    type: boolean
> +    description: |
> +      Request the driver to claim write ownership at probe time by setti=
ng
> +      CTRL.TWO=3D1. This property is only valid when nxp,interface=3D"pr=
imary".
> +      The driver will not modify any other CTRL bits (HF/DM/etc.) and wi=
ll not
> +      clear any status/interrupt flags at probe.
> +
> +required:
> +  - compatible
> +  - reg
> +  - nxp,interface
> +
> +additionalProperties: false
> +
> +# Schema constraints matching driver:
> +# 1) If nxp,write-access is present, nxp,interface must be "primary".
> +#    Rationale: only the primary may claim ownership; driver will set TW=
O=3D1.
> +# 2) If nxp,interface is "secondary", nxp,write-access must not be prese=
nt.
> +#    Rationale: secondary never claims ownership and cannot write CTRL/S=
T/alarm.
> +#
> +# Practical effect:
> +# - Primary without 'nxp,write-access'; primary is read only; secondary =
may
> +#   write time registers.
> +# - Primary with 'nxp,write-access'; primary owns writes, secondary is r=
ead only.
> +allOf:
> +  - $ref: rtc.yaml#
> +  - oneOf:
> +      # Case 1: primary with write-access
> +      - required: [ "nxp,write-access" ]
> +        properties:
> +          nxp,interface:
> +            const: primary
> +
> +      # Case 2: primary without write-access
> +      - properties:
> +          nxp,interface:
> +            const: primary
> +        not:
> +          required: [ "nxp,write-access" ]

Aren't case 1 and case 2 here redundant? All you need to do is block
interface =3D=3D secondary when nxp,write-access is present, which your case
3 should be able to be modified to do via

if:
  properties:
    nxp,interface:
      const: secondary
then:
  properties:
   nxp,write-access: false

I think your description for nxp,write-access gets the point across
about when it can be used, and the additional commentary is not really
helpful.

> +
> +      # Case 3: secondary (must not have write-access)
> +      - properties:
> +          nxp,interface:
> +            const: secondary
> +        not:
> +          required: [ "nxp,write-access" ]
> +
> +examples:
> +  # Single host example.
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      rtc@6f {
> +        compatible =3D "nxp,pcf85053";
> +        reg =3D <0x6f>;
> +        nxp,interface =3D "primary";
> +        nxp,write-access;
> +        interrupt-parent =3D <&gpio2>;
> +        interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> +      };
> +    };
> +
> +  # Dual-host example: one primary that claims writes; one secondary tha=
t never claims writes.
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c0 {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      rtc@6f {
> +        compatible =3D "nxp,pcf85053";
> +        reg =3D <0x6f>;
> +        nxp,interface =3D "primary";
> +        nxp,write-access;
> +        interrupt-parent =3D <&gpio2>;
> +        interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> +      };
> +    };
> +
> +    i2c1 {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      rtc@6f {
> +        compatible =3D "nxp,pcf85053";
> +        reg =3D <0x6f>;
> +        nxp,interface =3D "secondary";

Maybe a silly question, but if you have a system that wants to have two
pairs of RTCs, how would you determine which primary a secondary belongs
to? I notice you have no link between these devices in dt so I am
curious. Would it be better to eschew nxp,interface and have a phandle
=66rom the secondary to the primary?

I don't know anything about your use case or features, so maybe knowing
the relationship just is not relevant at all, or it can be determined at
runtime.

Cheers,
Conor.

--fY6x4SCrQh3vev97
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNLtnQAKCRB4tDGHoIJi
0mnSAQD99ZyMCIKJqP3jGlAt1GbM1KDBt6xcMzzGhUWkvkD3ZQEAuum2mONM/NVS
CejFjUm4FFqZbWbWbNdTTwj5D8aZaA0=
=mI9+
-----END PGP SIGNATURE-----

--fY6x4SCrQh3vev97--

