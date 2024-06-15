Return-Path: <linux-rtc+bounces-1317-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E5E909831
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Jun 2024 14:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA28928157D
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Jun 2024 12:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93754502F;
	Sat, 15 Jun 2024 12:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7A6z8tz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC3B3C062;
	Sat, 15 Jun 2024 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718453869; cv=none; b=T6YDR+7KOeTzpfhifVUXNnxAWlZAesuryQG+tGsR75tc9tReZU93J0vg2MQ26780fasFVsKYODa3H7Li8Mr/AHwVDSq85qzqHeQa/uq+YsptsKAB0HveGJbd/BERvlbv9ipIGpsSr+PTYTPRAsrRiGL0z8Y1PHLbDCIAamMF0kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718453869; c=relaxed/simple;
	bh=jvQAeWCdVaD0BjCP05AvOEcJtz935J6YiPM0ZLxh6iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmYc91JbFYQrNdTSXZqFXiVpYozFssE8ira+toYE+hi9JTCB49zfjYmjXikre0cS6wdKB69oflyPa/S7B27xmg7R0OEUanH5nsWyGe05GqdVRjtnVo2+guSaOWQTD6PKcsqVfjO2egPm7ee9g+qCpi65EVvJ1+U9zzDWbC0Yp+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7A6z8tz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8E7C116B1;
	Sat, 15 Jun 2024 12:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718453868;
	bh=jvQAeWCdVaD0BjCP05AvOEcJtz935J6YiPM0ZLxh6iQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b7A6z8tziamb8sri2a2XV1owVztyaG5/O1VaCMT1FXpTcMWyu4QMhWHzz6ra46Q/b
	 HBGJ7uWpvp9TH1FtAa3Tbgo2WoGxSltneXHKgwW3EXMvR/mfkR+96Ay9Ne2UCXcj0Z
	 1TEfrM2YQCtpTCUuxOQJnKLj9FO8wFqEYDLVwdzUrj9uFtOxXfhgDMXsRXnxcswdSZ
	 w8fXAFDcoM1Qla88Tv4GFJ4yXYOu3/6yC6GH/F1hOguRztqxNSl7+MDejqJFN4dUEW
	 lO8NXRtI4EiKFsagjfnxJ+NDZ/unNCTjvhi6fanQBhy9lNUnJ0/Xjq7C3tbjqRtOhQ
	 PKMOkfuzL7AQQ==
Date: Sat, 15 Jun 2024 13:17:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	lee@kernel.org, alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 02/12] dt-bindings: clock: renesas,rzg3s-vbattb-clk:
 Document the VBATTB clock driver
Message-ID: <20240615-angler-occupier-6188a3187655@spud>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-3-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nsLO3LjWINDswJxd"
Content-Disposition: inline
In-Reply-To: <20240614071932.1014067-3-claudiu.beznea.uj@bp.renesas.com>


--nsLO3LjWINDswJxd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 10:19:22AM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that feeds
> the RTC and the tamper detector. Add documentation for the VBATTB clock
> driver.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  .../clock/renesas,rzg3s-vbattb-clk.yaml       | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzg3s=
-vbattb-clk.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb=
-clk.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-cl=
k.yaml
> new file mode 100644
> index 000000000000..ef52a0c0f874
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.ya=
ml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/renesas,rzg3s-vbattb-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas VBATTB clock
> +
> +maintainers:
> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> +
> +description:
> +  Renesas VBATTB module is an always on powered module (backed by batter=
y) which
> +  generates a clock (VBATTCLK). This clocks feeds the RTC and the tamper=
 detector
> +  modules.
> +
> +properties:
> +  compatible:
> +    const: renesas,rzg3s-vbattb-clk
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: VBATTB module clock
> +      - description: VBATTB input xtal
> +
> +  clock-names:
> +    items:
> +      - const: bclk
> +      - const: vbattb_xtal
> +
> +  '#clock-cells':
> +    const: 0
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  renesas,vbattb-load-nanofarads:
> +    description: load capacitance of the on board xtal
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 4000, 7000, 9000, 12500 ]
> +
> +  renesas,vbattb-osc-bypass:
> +    description: set when external clock is connected to RTXOUT pin
> +    type: boolean

When you say "external clock", is that an input or an output?

--nsLO3LjWINDswJxd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZm2GZgAKCRB4tDGHoIJi
0rtkAQCi6OWcwXo4FHX+1PWlyVi63NIjfF9JgLRdiachrjUaFAEAtuwUzfHaFzsm
8P+5obAmJteBZtgVJyrjtHfszACu3Ak=
=BI4B
-----END PGP SIGNATURE-----

--nsLO3LjWINDswJxd--

