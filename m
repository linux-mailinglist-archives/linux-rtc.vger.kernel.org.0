Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2C2276A06
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Sep 2020 09:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgIXHFN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Sep 2020 03:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbgIXHFN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 24 Sep 2020 03:05:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB38C0613CE
        for <linux-rtc@vger.kernel.org>; Thu, 24 Sep 2020 00:05:13 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kLLJK-0004aN-Cs; Thu, 24 Sep 2020 09:04:58 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kLLJI-0002lM-JX; Thu, 24 Sep 2020 09:04:56 +0200
Date:   Thu, 24 Sep 2020 09:04:56 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Qiang Zhao <qiang.zhao@nxp.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel@pengutronix.de
Subject: Re: [Patch v2 1/3] dt-bindings: rtc: pcf2127: Add bindings for
 nxp,pcf2127
Message-ID: <20200924070456.rovgp6n5q25s53vc@pengutronix.de>
References: <20200921054821.26071-1-qiang.zhao@nxp.com>
 <20200923094449.GP9675@piout.net>
 <DB8PR04MB67635518BE38EEF5292C8D0991390@DB8PR04MB6763.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lje45e5iguifutl5"
Content-Disposition: inline
In-Reply-To: <DB8PR04MB67635518BE38EEF5292C8D0991390@DB8PR04MB6763.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--lje45e5iguifutl5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Sep 24, 2020 at 03:20:33AM +0000, Qiang Zhao wrote:
> On 21/09/2020 13:48:19+0800, Qiang Zhao wrote:
>=20
> > -----Original Message-----
> > From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Sent: 2020=E5=B9=B49=E6=9C=8823=E6=97=A5 17:45
> > To: Qiang Zhao <qiang.zhao@nxp.com>
> > Cc: Wim Van Sebroeck <wim@linux-watchdog.org>; Guenter Roeck
> > <linux@roeck-us.net>; linux-watchdog@vger.kernel.org;
> > a.zummo@towertech.it; robh+dt@kernel.org; linux-rtc@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Uwe Kleine-K=
=C3=B6nig
> > <u.kleine-koenig@pengutronix.de>
> > Subject: Re: [Patch v2 1/3] dt-bindings: rtc: pcf2127: Add bindings for
> > nxp,pcf2127
> >=20
> > Hi,
> >=20
> > You forgot to copy the watchdog maintainers, I think such a property sh=
ould be
> > discussed with them.
> >=20
> > Note that I'm still convinced this is not a complete solution, see:
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e.kern
> > el.org%2Flinux-rtc%2F20200716181816.GF3428%40piout.net%2F&amp;data=3D
> > 02%7C01%7Cqiang.zhao%40nxp.com%7Cb71f79a044b0493d6d4f08d85fa551c
> > b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637364510931174
> > 355&amp;sdata=3D%2BOxrzB8RIuxM9Let5slhfCVmMm6PMNoERDeHC9%2Fdxng
> > %3D&amp;reserved=3D0

haha

> Yes, you are right, There is not a fundamental solution.
> However it somewhat avoid this situation at least.
>=20
> And if without this issue,=20
> is it correct to register a rtc device as watchdog no matter it is used a=
s watchdog on the board?=20
> Every time Linux are booted up, watchdog device should be configured to t=
he right one manually.
> So the patch are useful, even though it is not for the issue.
>=20
> What should we do to really resolve this issue?

I still think we need a kernel solution here. I would expect that most
assembled pcf2127 chips are unable to act as a watchdog (i.e. don't have
the RST output connected to something that resets the machine).

So my favoured solution would be a positive property like:

	has-watchdog;

or something similar. In my eyes this is definitely something we want to
specify in the device tree because it is a relevant hardware property.
I consider it a bug to give a watchdog device to userspace that isn't
functional.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--lje45e5iguifutl5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl9sRRUACgkQwfwUeK3K
7An6Rwf/fsctRYrSR7AiIff2827svhEuVNbZXRm5UlPsbaWaVFkvVIvmOc7gaBoJ
+RF3QzL4ljhdrcM6wYiCby37UgMWXi8NSom64TcqAsvlhL2I+3UNeEbexf82NZKf
4D+LkH2CVQIOsD0VM6xaRsoBw6PcQ+5CXWw7+TKiVS+dl/Wx07Lh3gZLaStnKup8
aSgPjC2lZLkq1uj9iXVKNpnqCO8SDdRH9kdIeUg53Bp3lWa4J6hGlvFOVXo1RV6d
q6N4j+/7ykHrY2SQW8x1D3QGtAES7E+z8bQfkB6kNSOLKgZWj8q6lSW0m07zYXtU
cR+lUMIwBeGEdQw7wudA/XZxJ3P8pA==
=yeqQ
-----END PGP SIGNATURE-----

--lje45e5iguifutl5--
