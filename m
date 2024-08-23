Return-Path: <linux-rtc+bounces-1722-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C9A95D21C
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 17:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62F27B238BB
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 15:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B72C188903;
	Fri, 23 Aug 2024 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bP/gAoXf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A091586D3;
	Fri, 23 Aug 2024 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724428273; cv=none; b=ElbqH8xHV5WheODkgss1P3cflYlyP5Mx33vbRcoJwR0MvVg77+0k62U5ojg260LTc/IvJBiR+Ml0t3h8FZ0bFIUa86WUazIcL0FOEWgf3E8mP/9JZ4o3cEEwfSrvw7n9ZC0WjXAARhhF9gXOfTixVoRW6UkSFFxIGWleBBx/fL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724428273; c=relaxed/simple;
	bh=UJ8y9SbdyQJ2cpOyfwD7iZtYNXEMcqBlR4gxzqHEGxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZX+spkZFgsptPC28GbdMW+/yCURsdcYcC94l6Y1NC+v7jrubNAAHKSZ4a1jKFi0oL1RnE7wcaMCrKaFV+ZEb+5/ToEDRiUxDGBL+15VUtqm/tmIkQ+fWdUYDq0h6OOsR2vh/nXLeGfMDrxy2lIgkX+nLwK4SQCOquqQNoi5j6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bP/gAoXf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04A3C32786;
	Fri, 23 Aug 2024 15:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724428272;
	bh=UJ8y9SbdyQJ2cpOyfwD7iZtYNXEMcqBlR4gxzqHEGxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bP/gAoXfI7Pog1TUdgOKN8s4SexOQTEN3/DKLmgzdIN7SXK+xlz+Cthyv9su1mGGk
	 fMvwB1aVkboO3i9jKv4q2NL7YTh5eK+mlVgbJgFfmKJAJFkXMoR36JaAJ7kbwe6H/C
	 ovTT++QqSEY9UCr8rwN/AIWGL0X4uiWDGyQir2eqwnWUY2voEpnJ5tADF8YPdq+lWC
	 +W2ehjaR780BCokbQUzzqXlyMBjCY9EdItqnv6IdArAecyDWh+Y2D58x5m/94jPH8Q
	 U8jjy+ZeqMBnk/nvj2fLQyAx7wS3yUpvjez5KbQYigJ9n+Y6MlMvfUxBhyOqvrvx/7
	 pB6uqMUfCqB/w==
Date: Fri, 23 Aug 2024 16:51:08 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Yiting Deng <yiting.deng@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add Amlogic A311L2 and A113X2 rtc
Message-ID: <20240823-rotunda-machinist-4f8dabbff479@spud>
References: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
 <20240823-rtc-v1-1-6f70381da283@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pFpN10RskjPDX7Mw"
Content-Disposition: inline
In-Reply-To: <20240823-rtc-v1-1-6f70381da283@amlogic.com>


--pFpN10RskjPDX7Mw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 05:19:44PM +0800, Xianwei Zhao via B4 Relay wrote:
> From: Yiting Deng <yiting.deng@amlogic.com>
>=20
> Add documentation describing the Amlogic A113L2 and A113X2 rtc controller.
>=20
> Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/rtc/amlogic,amlogic-rtc.yaml          | 66 ++++++++++++++++=
++++++
>  1 file changed, 66 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.ya=
ml b/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml
> new file mode 100644
> index 000000000000..fa3d7838022e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml

Filename matching a compatible please.

> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2024 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/amlogic,amlogic-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Real Time Clock controller include a4, a5
> +
> +maintainers:
> +  - Yiting Deng <yiting.deng@amlogic.com>
> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
> +
> +description:
> +  The Amlogic new chips used RTC module.
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,a4-rtc
> +      - amlogic,a5-rtc

The names you have chosen here do not match the patch description. What
is going on there?

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: RTC clock source, available 24M or 32K crystal
> +          oscillator source. when using 24M, need to divide 24M into 32K.
> +      - description: RTC module accesses the clock of the apb bus.
> +
> +  clock-names:
> +    items:
> +      - const: rtc_osc
> +      - const: rtc_sys_clk

s/_clk//, they're all clocks.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    apb {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        rtc: rtc@8e600 {

And the label here can go, you've got no references to it :)

Thanks,
Conor.

> +            compatible =3D "amlogic,a4-rtc";
> +            interrupts =3D <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>;
> +            reg =3D <0x0 0x8e600 0x0 0x38>;
> +            clocks =3D <&xtal_32k>, <&clkc_periphs 1>;
> +            clock-names =3D "rtc_osc", "rtc_sys_clk";
> +        };
> +    };
>=20
> --=20
> 2.37.1
>=20
>=20

--pFpN10RskjPDX7Mw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsiv7AAKCRB4tDGHoIJi
0pRTAQCos2kfCyu1HmMLs3vUDMHuAt4FObAjJDqXmI50lj4prAEAoCkTanOgaIFf
mgPp56m+d+FLEo2EuVyr4VMVi4sgkAo=
=N36O
-----END PGP SIGNATURE-----

--pFpN10RskjPDX7Mw--

