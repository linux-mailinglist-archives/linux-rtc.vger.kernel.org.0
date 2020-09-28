Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07ABB27A9CE
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Sep 2020 10:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgI1Inz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Sep 2020 04:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbgI1Inz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Sep 2020 04:43:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE9DC0613CE
        for <linux-rtc@vger.kernel.org>; Mon, 28 Sep 2020 01:43:55 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kMol7-0001Mn-GS; Mon, 28 Sep 2020 10:43:45 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kMol5-0006Ul-T2; Mon, 28 Sep 2020 10:43:43 +0200
Date:   Mon, 28 Sep 2020 10:43:43 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Bruno Thomsen <bruno.thomsen@gmail.com>, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-watchdog@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Qiang Zhao <qiang.zhao@nxp.com>
Subject: Re: [PATCH 2/2] [RFC] rtc: pcf2127: only use watchdog when
 explicitly available
Message-ID: <20200928084343.cl42lxsiionvq7tg@pengutronix.de>
References: <20200924074715.GT9675@piout.net>
 <20200924105256.18162-1-u.kleine-koenig@pengutronix.de>
 <20200924105256.18162-3-u.kleine-koenig@pengutronix.de>
 <CAH+2xPAVvMpTgT3W=0AsKy=9jkS8qd6eB65Qebw51YKRQshaGQ@mail.gmail.com>
 <8f88f2a2-4a6d-021f-4404-f05518b0477d@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="374kthn377ofw35y"
Content-Disposition: inline
In-Reply-To: <8f88f2a2-4a6d-021f-4404-f05518b0477d@roeck-us.net>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--374kthn377ofw35y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2020 at 08:54:47AM -0700, Guenter Roeck wrote:
> On 9/27/20 1:09 AM, Bruno Thomsen wrote:
> > Den tor. 24. sep. 2020 kl. 12.53 skrev Uwe Kleine-K=F6nig
> > <u.kleine-koenig@pengutronix.de>:
> >>
> >> Most boards using the pcf2127 chip (in my bubble) don't make use of the
> >> watchdog functionality and the respective output is not connected. The
> >> effect on such a board is that there is a watchdog device provided that
> >> doesn't work.
> >>
> >> So only register the watchdog if the device tree has a "has-watchdog"
> >> property.
> >>
> >> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >> ---
> >>  drivers/rtc/rtc-pcf2127.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> >> index 5b1f1949b5e5..8bd89d641578 100644
> >> --- a/drivers/rtc/rtc-pcf2127.c
> >> +++ b/drivers/rtc/rtc-pcf2127.c
> >> @@ -340,7 +340,8 @@ static int pcf2127_watchdog_init(struct device *de=
v, struct pcf2127 *pcf2127)
> >>         u32 wdd_timeout;
> >>         int ret;
> >>
> >> -       if (!IS_ENABLED(CONFIG_WATCHDOG))
> >> +       if (!IS_ENABLED(CONFIG_WATCHDOG) ||
> >> +           !device_property_read_bool(dev, "has-watchdog"))
> >>                 return 0;
> >=20
> > I don't think the compiler can remove the function if
> > CONFIG_WATCHDOG is disabled due to the device tree
> > value check. Maybe it can if split into 2 conditions.
> >=20
>=20
> If the first part of the expression is always false, the second
> part should not even be evaluated.

This is wrong. For || the second expression isn't evaluated if the first
evaluates to true (and the whole expression becomes true). This is the
intended behaviour: If CONFIG_WATCHDOG is off, we don't need to check
for the dt property and just skip the watchdog part.

> Either case, the code now hard depends on the compiler optimizing the
> code away.
>=20
> It calls devm_watchdog_register_device() which doesn't exist
> if CONFIG_WATCHDOG is not enabled. I didn't know that this is safe,
> and I would personally not want to rely on it, but we live and
> learn.

AFAICT this is save and used in other places in the kernel, too.  This
is one of the reasons why you cannot compile the kernel with -O0.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--374kthn377ofw35y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl9xoj0ACgkQwfwUeK3K
7AloGQgAmT9jAsBE55nkCiQIvfTONeRIQHfU/NnP8IE+OO7uaKe+rs00xj0rIerX
vLQyiWvIbRKkYDNvb/sbsp6OdhBh0o8C7d9wXPe7gzIgdU0VUI6aUfPv+SrpuArL
75ye2ADjrI7fOAtdEI3FLgQPUvqlEmGBtqNqP2D6ub4KFSvKJr29X2+8QMO4aHpJ
KZI/3e/3CSmg0C7a3mnPu0ghHUZUBFd7eOuiZbNrlVuaOc2cBMEdwQrtLm/dTZto
IhWtwplF4GWZaDo84GsEA7MU8v38tN2g3KnEdzlOwqdU+/pqGYv4uNm1vrRq2NMG
68zaImE+9OUEnlS364NiBvRoV8zeLQ==
=x1uh
-----END PGP SIGNATURE-----

--374kthn377ofw35y--
