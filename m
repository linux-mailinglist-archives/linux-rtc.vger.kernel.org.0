Return-Path: <linux-rtc+bounces-5147-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B247CC0746C
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 18:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86B721C0507E
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 16:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE00027979A;
	Fri, 24 Oct 2025 16:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C14ROYCB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC58219A79;
	Fri, 24 Oct 2025 16:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761322942; cv=none; b=fedm80+Rg9w+XMjQhZ9LThwctSSCOgDSjHN0275BwucguIc0dxmfW03TDseb0nHIKez7W5sh7JdTJVrASUCYy1OgjUsFfapSZy+iRlwKwi+lTcdbf+CY7yUhNXUQZQjonA6ConAVPTLTP6Cd9+VEPlWvI83+1pbBma/BU/peZkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761322942; c=relaxed/simple;
	bh=Zpj0S9WlD9iwACSCKzt192WwYeTxAcEXiUm4xIx1l8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rj7KpN6EohGsUKuWyVX1KwFsWYOj2rgu0C0JoIVZbPZwknGdCDkjqQzfpukXV2Ye+y93RaaUQo/KG3E/gCimx/KWO7ezhzh1I1d598LPInSrJyaLECVdwoNBLifQkqR7uizURsyW/noe2Cc8lpnFOBuY/4i2sx6r1Z0exg5lKMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C14ROYCB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D756FC4CEF1;
	Fri, 24 Oct 2025 16:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761322942;
	bh=Zpj0S9WlD9iwACSCKzt192WwYeTxAcEXiUm4xIx1l8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C14ROYCB3rxkIuXWxj9KaihCI0S3Q55HPeCbwzCfG2TdN6dGGimLB6rOm8D88UAFA
	 SliCh4L9PU1qhcI8+jPetpES5sp6adRnE24YiqCvQF6nnJGau7q99puV4HjyXSQYDS
	 LHKTufDVyxL+uVg+VbaS/enRUfWA1PdNNTsQoASyxj5RLQoIO73gu+TOi8OMViRTTy
	 a/jkDBYYpHj+MsqqTYbZzlHiXdkuGGfNexb+L9ZUszN1YEKKBctX2EKE8FE5MkfPLK
	 js66eEoCoBHXoU41/ff0j5VIqBSsJIYGWsFS2lRHzFj8gNX6P4vZEf9Lw//udPyhwL
	 kTmTJPo4NjBuQ==
Date: Fri, 24 Oct 2025 17:22:17 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 1/2] dt-bindings: rtc: Add MediaTek MT6685 PM/Clock IC
 Real Time Clock
Message-ID: <20251024-unleash-slouchy-ef6903088ffe@spud>
References: <20251024083318.25890-1-angelogioacchino.delregno@collabora.com>
 <20251024083318.25890-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xCs6VJHSU/yRmWkV"
Content-Disposition: inline
In-Reply-To: <20251024083318.25890-2-angelogioacchino.delregno@collabora.com>


--xCs6VJHSU/yRmWkV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 10:33:17AM +0200, AngeloGioacchino Del Regno wrote:
> The MediaTek MT6685 PM / Clock IC contains various SPMI sub
> devices, of which two are Real Time Clock IPs, one usually
> reserved for the secure world and one for the unsecured one,
> reachable at different SPMI addresses.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>=20
> NOTE: This does not contain any example because the MT6685 RTC
>       will be added to the mfd binding for MediaTek SPMI PMICs
>       and examples will be there.

Were it not for this mfd stuff, could easily go in trivial-rtc.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> ** For reviewing purposes, this is how the example will look like: **
>=20
>   - |
>     #include <dt-bindings/interrupt-controller/irq.h>
>     #include <dt-bindings/spmi/spmi.h>
>=20
>     spmi {
>       #address-cells =3D <2>;
>       #size-cells =3D <0>;
>=20
>       pmic@9 {
>         compatible =3D "mediatek,mt6363";
>         reg =3D <0x9 SPMI_USID>;
>         interrupts =3D <9 1 IRQ_TYPE_LEVEL_HIGH>;
>         interrupt-controller;
>         #address-cells =3D <1>;
>         #interrupt-cells =3D <3>;
>         #size-cells =3D <0>;
>=20
>         clock-controller@514 {
>           compatible =3D "mediatek,mt6685-sck-top";
>           reg =3D <0x514>;
>           #clock-cells =3D <1>;
>         };
>=20
>         rtc@580 {
>           compatible =3D "mediatek,mt6685-rtc";
>           reg =3D <0x580>;
>           interrupts =3D <9 0 IRQ_TYPE_LEVEL_HIGH>;
>         };
>       };
>     };
>=20
>  .../bindings/rtc/mediatek,mt6685-rtc.yaml     | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt6685=
-rtc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt6685-rtc.ya=
ml b/Documentation/devicetree/bindings/rtc/mediatek,mt6685-rtc.yaml
> new file mode 100644
> index 000000000000..1aec163b251a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/mediatek,mt6685-rtc.yaml
> @@ -0,0 +1,33 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/mediatek,mt6685-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6685 PM/Clock IC Real Time Clock
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6685-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> --=20
> 2.51.1
>=20

--xCs6VJHSU/yRmWkV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPunuQAKCRB4tDGHoIJi
0gAfAP4t8xpDdCTwJAnCsCY9dXmNmwwjQsHDr5SYXcCYPhhh6QD+Lc/9iY5UTGdo
YORX4SKxcq2wTSy8P4o9MdVtRdYbkQI=
=Bt/B
-----END PGP SIGNATURE-----

--xCs6VJHSU/yRmWkV--

