Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 541E12D857A
	for <lists+linux-rtc@lfdr.de>; Sat, 12 Dec 2020 10:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405047AbgLLJ6H (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 12 Dec 2020 04:58:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389885AbgLLJyn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 12 Dec 2020 04:54:43 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72CCC06179C
        for <linux-rtc@vger.kernel.org>; Sat, 12 Dec 2020 01:25:56 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ko1A2-0000fv-I6; Sat, 12 Dec 2020 10:25:54 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ko1A0-0000DC-RY; Sat, 12 Dec 2020 10:25:52 +0100
Date:   Sat, 12 Dec 2020 10:25:50 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: rtc: add reset-source property
Message-ID: <20201212092550.mhkxw4pwmmbn5u4g@pengutronix.de>
References: <20201204092752.GE74177@piout.net>
 <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
 <20201211215611.24392-2-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="h25hckfjgae65qfw"
Content-Disposition: inline
In-Reply-To: <20201211215611.24392-2-rasmus.villemoes@prevas.dk>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--h25hckfjgae65qfw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2020 at 10:56:09PM +0100, Rasmus Villemoes wrote:
> Some RTCs, e.g. the pcf2127, can be used as a hardware watchdog. But
> if the reset pin is not actually wired up, the driver exposes a
> watchdog device that doesn't actually work.
>=20
> Provide a standard binding that can be used to indicate that a given
> RTC can perform a reset of the machine, similar to wakeup-source.
>=20
> Suggested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  Documentation/devicetree/bindings/rtc/rtc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentati=
on/devicetree/bindings/rtc/rtc.yaml
> index ee237b2ed66a..b5e24dc24b0b 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
> @@ -47,4 +47,9 @@ properties:
>      description:
>        Enables wake up of host system on alarm.
> =20
> +  reset-source:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      The RTC is able to reset the machine.

Thanks for picking that up.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Note that the patch "rtc: pcf2127: move watchdog initialisation to a
separate function" is already in next.

Best regards
Uwe


--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--h25hckfjgae65qfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/UjJsACgkQwfwUeK3K
7Ak6yAgAgCSTdIROQXcz+oWnXcaYal26WfE+LC5XIFsI8uUXRMPkBikVvAV2Igyo
nO4v3BShfMJakKKh2ZBzgqavR0GkQ/T91h+56WDbmQ+6fQAZ4Z+eOLbcXzOTtpXJ
7B51uVET9TeWoTukwUyzs77FLR/TrCZM0m5dJvpuGeRWs5lfR78JH9nhGCVXW6Vh
dZuMZV3W/QNL4gg1EVOJr027k46t0MeukbPyqcRFWSJh1splDM0MyrzZa07w9Lvk
tIBtf62bdyUqVzjsfcICXdF4N29ht+WwZARa5nIYMa2MdK0TpnMs+y8b+PqAOgwR
XTqCL/jOPXxLfPTd4O6pntLiRf4q1w==
=wle7
-----END PGP SIGNATURE-----

--h25hckfjgae65qfw--
