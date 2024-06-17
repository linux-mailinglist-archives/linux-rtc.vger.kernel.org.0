Return-Path: <linux-rtc+bounces-1342-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C55690B714
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 18:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DEFDB4665D
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 15:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F21158A28;
	Mon, 17 Jun 2024 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcD6Akg1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD4B22083;
	Mon, 17 Jun 2024 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718637576; cv=none; b=D15Jh/NuWrXwWM7Ow7X9rs091YGiuhgthDO4UHI4Did+UbB3mS1fJ4xL+zQNVefmr5RHTjj1Ovty/TMTWpGUXI7dC1TOO1pAiAtElFH3JqofpwsGNVTldBTl9cBDMeIagUHhO6628htrv7g7dCDOPMIDDmu7+NfPPlTLRp5hloA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718637576; c=relaxed/simple;
	bh=naIpIa1Kqns2NPV2ho5gEYD9eBsk6s5vBFjFML3y3gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttQ4L65tQpVMV6fjDmCFAx1wKiaWFKeNC9KSfiNDIOR9PtkcFVSpekNHDSq8ue39xjDrYMJSw64J23ml9PQ970cWmVjyoOIcHuJMbiW+b8IgVp/n+lA8SAD01pmD3i8eC+LaQ66Tg4WK9VGkdi8i3hzP/vgJKUNUH2UQnI0qvRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcD6Akg1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61E1C2BD10;
	Mon, 17 Jun 2024 15:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718637576;
	bh=naIpIa1Kqns2NPV2ho5gEYD9eBsk6s5vBFjFML3y3gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QcD6Akg1FReoE8UPj/9zF6jZ1yON9EcKYgTCgFyPoyQ9Wte08cmcGhBeGg10nC+52
	 O07VNeU9KgWCAhkTidcKUHPuLZVhNLLHF7Q2CVLDMy96838Aq1knZ40LRDYWYRw9h7
	 wRFVHZzx65ta+Hy8nTLvQW+TchUfJ9RzIAW8G9NnlcHxNMURuZ77x09vgNM2ZJoAVH
	 B/9g1CHT4IbzAUQLyY1zCq9Q0DAdAZMfnRVNwzKAta163AL8eRs5wW5Xu6D7Y6LSYz
	 9R9F+CYDa8ySAitMzmOL9BByawEiEH6S/JI+Lqni/isTureAiD5nlUV0rBD+3sZzUh
	 WskH6GRMGuisw==
Date: Mon, 17 Jun 2024 16:19:30 +0100
From: Conor Dooley <conor@kernel.org>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
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
Message-ID: <20240617-subsoil-creed-04bf5f13d081@spud>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-3-claudiu.beznea.uj@bp.renesas.com>
 <20240615-angler-occupier-6188a3187655@spud>
 <3d9ed0ec-ca9a-45b4-a633-8f7051d13cff@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="56coL768YMNwi762"
Content-Disposition: inline
In-Reply-To: <3d9ed0ec-ca9a-45b4-a633-8f7051d13cff@tuxon.dev>


--56coL768YMNwi762
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 10:02:47AM +0300, claudiu beznea wrote:
>=20
>=20
> On 15.06.2024 15:17, Conor Dooley wrote:
> > On Fri, Jun 14, 2024 at 10:19:22AM +0300, Claudiu wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that feeds
> >> the RTC and the tamper detector. Add documentation for the VBATTB clock
> >> driver.
> >>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >> ---
> >>  .../clock/renesas,rzg3s-vbattb-clk.yaml       | 90 +++++++++++++++++++
> >>  1 file changed, 90 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,rz=
g3s-vbattb-clk.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg3s-vba=
ttb-clk.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb=
-clk.yaml
> >> new file mode 100644
> >> index 000000000000..ef52a0c0f874
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk=
=2Eyaml
> >> @@ -0,0 +1,90 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/clock/renesas,rzg3s-vbattb-clk.yam=
l#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Renesas VBATTB clock
> >> +
> >> +maintainers:
> >> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >> +
> >> +description:
> >> +  Renesas VBATTB module is an always on powered module (backed by bat=
tery) which
> >> +  generates a clock (VBATTCLK). This clocks feeds the RTC and the tam=
per detector
> >> +  modules.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: renesas,rzg3s-vbattb-clk
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    items:
> >> +      - description: VBATTB module clock
> >> +      - description: VBATTB input xtal
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: bclk
> >> +      - const: vbattb_xtal
> >> +
> >> +  '#clock-cells':
> >> +    const: 0
> >> +
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  renesas,vbattb-load-nanofarads:
> >> +    description: load capacitance of the on board xtal
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +    enum: [ 4000, 7000, 9000, 12500 ]
> >> +
> >> +  renesas,vbattb-osc-bypass:
> >> +    description: set when external clock is connected to RTXOUT pin
> >> +    type: boolean
> >=20
> > When you say "external clock", is that an input or an output?
>=20
> I took that statement from the HW manual. As of the HW manual [1], table
> 42.2, that would be an input.

Forgive me for not wanting to open the zip etc and find the information
in the document, but why do you need an extra property? Is it not
something you can determine from the clocks/clock-names properties?
It sounds like an additional clock from your description, is it actually
different way to provide the second clock you mention above?

>=20
> [1]
> https://www.renesas.com/us/en/products/microcontrollers-microprocessors/r=
z-mpus/rzg3s-general-purpose-microprocessors-single-core-arm-cortex-a55-11-=
ghz-cpu-and-dual-core-cortex-m33-250
>=20

--56coL768YMNwi762
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnBUAgAKCRB4tDGHoIJi
0rZQAQCewakzSyZHrcYUH8+d8xIo+9/OP7zyCp6sCDIWB4L7sAEAzqCsVwlD4cn+
2oxxeZnpGsG3xJ+EYOZM76MqaXgtQwQ=
=GLxB
-----END PGP SIGNATURE-----

--56coL768YMNwi762--

