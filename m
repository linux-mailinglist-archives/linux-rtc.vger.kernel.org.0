Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 196C970883E
	for <lists+linux-rtc@lfdr.de>; Thu, 18 May 2023 21:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjERTRr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 18 May 2023 15:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjERTRr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 18 May 2023 15:17:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4419195;
        Thu, 18 May 2023 12:17:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D517864A23;
        Thu, 18 May 2023 19:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C06C433D2;
        Thu, 18 May 2023 19:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684437465;
        bh=xtcGW4M791pIaymohA8Ym/cn2rgOqTlGjlCXj4M8lHI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tum2ju3kf/ZEFXl8REbZzCnUf+lTDYMkdwa58OuA5DnskOiSqE1HFsyIW0sv4cgIZ
         nx0YVvnsTTwAhwLLXkOdgE84hE6vE4p0eANNeIc+cr6sJuf0mFks9pOiTqOsB9mKov
         uJUJ6tjEvvTLqQyv9/sDDbrB3tstJvlB4EJUh09Nfzva8btcKB48Ytfg1sX+aU9fm7
         A9RzBF2dxj3uhbhBBBusGcyRxHcSJmoqMTrXbrvIp4olM4/3WbPUynFYQ5CpkQ0d6Y
         ew7mxeGs8P2rgKBt8YVcnOtqf6qeHu9xutf4J8kvRVwnS+PT4bLge4K4FD09auNGDx
         EJbpZYGA3Rwmw==
Date:   Thu, 18 May 2023 20:17:40 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Trent Piepho <tpiepho@gmail.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 03/11] dt-bindings: rtc: isil,isl1208: Document clock
 and clock-names properties
Message-ID: <20230518-plenty-drove-fced48ac6465@spud>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eW16SawQRMl3qN4B"
Content-Disposition: inline
In-Reply-To: <20230518113643.420806-4-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--eW16SawQRMl3qN4B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 12:36:35PM +0100, Biju Das wrote:
> As per the HW manual, XTOSCB bit setting is as follows
>=20
> If using an external clock signal, set the XTOSCB bit as 1 to
> disable the crystal oscillator.
>=20
> If using an external crystal, the XTOSCB bit needs to be set at 0
> to enable the crystal oscillator.
>=20
> Document clock and clock-names properties.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

I notice on v3 you appealed to Rob or Krzysztof for approval about this
approach. Clearly I not either of them, but it seems reasonable to me.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
> v4:
>  * New patch
> ---
>  .../devicetree/bindings/rtc/isil,isl1208.yaml       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml b/Do=
cumentation/devicetree/bindings/rtc/isil,isl1208.yaml
> index 565965147ce6..6c270dd53605 100644
> --- a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> @@ -25,6 +25,19 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description: |
> +      Use xin, if connected to an external crystal.
> +      Use clkin, if connected to an external clock signal.
> +    oneOf:
> +      - items:
> +          - const: xin
> +      - items:
> +          - const: clkin
> +
>    interrupts:
>      minItems: 1
>      maxItems: 2
> --=20
> 2.25.1
>=20

--eW16SawQRMl3qN4B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGZ51AAKCRB4tDGHoIJi
0o2BAQCLed5tYqJspz3QFKR0lfJl7WOvz0Ofx4DCy9Aoqykm7wEA9FLfdh1MguPh
6ehuPKZ+lu/o1zYTjCeUGpox2k56aAg=
=z6g1
-----END PGP SIGNATURE-----

--eW16SawQRMl3qN4B--
