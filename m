Return-Path: <linux-rtc+bounces-1319-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2D5909847
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Jun 2024 14:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE22DB20BB0
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Jun 2024 12:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383C94642D;
	Sat, 15 Jun 2024 12:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJZqQWID"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E27D53B;
	Sat, 15 Jun 2024 12:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718454043; cv=none; b=XJycYjfpTTPLS5yZbQ815xxfg/xAh5SsDcloy7jF3FJUZsphTNUVjYiip2t7wW8BRRv1U4TDPWovtQFCNj/bUeTEKNhJXQni5otjwECx71o+mMfeI7p4BUZtAWUG3ebNpldR1FTutjXvOLf8gDUeP/r8h8YxCxaaA17ZFLxahKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718454043; c=relaxed/simple;
	bh=7kk/DFowxR3MGw0j7A7XvwsF/1h3DlePO4r6VOndC6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOJEWyHeO3su559A4PaF/krjDvQXWjcOF+7Y0KSEfKycwshhDz1Sxx8+3ko/Ubb6bqrGeWLC/05RK5TQeHnq1yH36Hcb+enAlzRTtkrqVDGHLhWveU2IucKN1oAIfHyTitKbo4GpZLx+kwUIlmlIIsJgPMEu8km3izy6XcQb2kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJZqQWID; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A830C116B1;
	Sat, 15 Jun 2024 12:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718454042;
	bh=7kk/DFowxR3MGw0j7A7XvwsF/1h3DlePO4r6VOndC6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJZqQWIDjaz0svJqbozGaXjpzmBwU+d6SY+7xvNmQ5/kQ5mkaHbgZjTP6ktqDjnbN
	 5FnVwwVmAfnJOL0hvU4zYfiJ5VcZDtyvLBHED9I+9+VmBlIQmrPSKX1gLG1Mg0jXEW
	 74ryuoczJJK+zaAOq8a+BRbl1M+w+1sFUTzM4iPi4JIdec630vRuVgyMkFkYhHuVlg
	 xB4A7L4rK2Gguz1gmBF+wSH1ARfq1Ea1xLUhrUJ8aaY+/jrqLYVukAsARZb9VWl8AK
	 lOvZdQK84L2pt8Zu89V2v/lY5nFe9XYAahdhahl0xbLUns1SmwP1Nepe9+xAnJq0f5
	 1av02fLuzcYwg==
Date: Sat, 15 Jun 2024 13:20:37 +0100
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
Subject: Re: [PATCH 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document the
 Renesas RZ/G3S RTC
Message-ID: <20240615-clench-turbofan-024a14939897@spud>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-6-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7hDJOsFYWiGr2vSr"
Content-Disposition: inline
In-Reply-To: <20240614071932.1014067-6-claudiu.beznea.uj@bp.renesas.com>


--7hDJOsFYWiGr2vSr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 10:19:25AM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  .../bindings/rtc/renesas,rzg3s-rtc.yaml       | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rzg3s-r=
tc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml=
 b/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
> new file mode 100644
> index 000000000000..0e17f8a36155
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/renesas,rzg3s-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Real Time Clock for Renesas RZ/G3S SoC
> +
> +maintainers:
> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> +

Missing a ref to adc.yaml, or can this rtc not serve as a wakeup-source
or use any of the common properties?

Cheers,
Conor.

> +properties:
> +  compatible:
> +    const: renesas,rzg3s-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: alarm
> +      - const: period
> +      - const: carry
> +
> +  clocks:
> +    maxItems: 1
> +    description: RTC counter clock
> +
> +  clock-names:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    rtc: rtc@1004ec00 {
> +        compatible =3D "renesas,rzg3s-rtc";
> +        reg =3D <0x1004ec00 0x400>;
> +        interrupts =3D <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names =3D "alarm", "period", "carry";
> +        clocks =3D <&vbattclk>;
> +        clock-names =3D "counter";
> +        status =3D "disabled";
> +    };
> --=20
> 2.39.2
>=20

--7hDJOsFYWiGr2vSr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZm2HFQAKCRB4tDGHoIJi
0uGVAQCYGpapUpXdg8K12Ykj0awUCQkC0jylYMC8IS+tjNJoPQD+I5Cj0YhtMfne
A/mB42tA6jqbp6LCmF0zd7vCewr6QAA=
=WHM+
-----END PGP SIGNATURE-----

--7hDJOsFYWiGr2vSr--

