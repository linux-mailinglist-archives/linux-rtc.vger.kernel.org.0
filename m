Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D860522338A
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jul 2020 08:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgGQGVP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jul 2020 02:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgGQGVP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Jul 2020 02:21:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D32FC08C5C0
        for <linux-rtc@vger.kernel.org>; Thu, 16 Jul 2020 23:21:15 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jwJk5-0005lQ-Hr; Fri, 17 Jul 2020 08:21:09 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1jwJk4-0006z2-1f; Fri, 17 Jul 2020 08:21:08 +0200
Date:   Fri, 17 Jul 2020 08:21:07 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Bruno Thomsen <bruno.thomsen@gmail.com>, linux-rtc@vger.kernel.org,
        linux-watchdog@vger.kernel.org, a.zummo@towertech.it,
        wim@linux-watchdog.org, linux@roeck-us.net, bth@kamstrup.com
Subject: Re: [PATCH v3 4/5] rtc: pcf2127: add watchdog feature support
Message-ID: <20200717062107.mpanwzpn52kdk7ut@pengutronix.de>
References: <20190822131936.18772-1-bruno.thomsen@gmail.com>
 <20190822131936.18772-4-bruno.thomsen@gmail.com>
 <20200716144705.o57m4r7ptmsm3m6n@pengutronix.de>
 <20200716181816.GF3428@piout.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="swky2i2knx6p3pxp"
Content-Disposition: inline
In-Reply-To: <20200716181816.GF3428@piout.net>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--swky2i2knx6p3pxp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On Thu, Jul 16, 2020 at 08:18:16PM +0200, Alexandre Belloni wrote:
> On 16/07/2020 16:47:05+0200, Uwe Kleine-K=F6nig wrote:
> > On Thu, Aug 22, 2019 at 03:19:35PM +0200, Bruno Thomsen wrote:
> > > Add partial support for the watchdog functionality of
> > > both PCF2127 and PCF2129 chips.
> >=20
> > I have a board here with a pcf2127 that has the #RST pin
> > not connected.
> >=20
> > The problem this creates is: The bootloader arms the SoC's watchdog and
> > jumps into Linux. The pcf2127 driver happens to load first, so watchdog0
> > is provided by the RTC (but non-functional). Systemd is configured to
> > feed the watchdog, but happens to feed the wrong one, so the machine
> > resets shortly after it is up :-|
> >=20
> > So I wonder if we need a dt property that tells the driver if the RST
> > line is connected or not.
>=20
> I guess the current solution is to set WatchdogDevice to point to a link
> that is updated by udev thus ensuring it points to the correct watchdog
> device regardless of the probe order.
>=20
> This would be similar to the /dev/rtc symlink, pointing to the systohc
> RTC by default (even if I don't really like that heuristic).
>=20
> What you suggest is somewhat okay but doesn't really solve the issue if
> both watchdogs are functional and systemd still doesn't pick the one
> that is armed by the bootloader.

Yes, my suggestion doesn't solve the problem "Oh, there are two
watchdogs, which should I feed?". But IMHO in this case there shouldn't
be a watchdog device provided at all by an RTC that can be a watchdog
but isn't wired up correctly.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--swky2i2knx6p3pxp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl8RQ1AACgkQwfwUeK3K
7Al0ngf9Fs8+ub1geZXaqc8pW9x+60pwYaUTecooeWZEvyOU973KFGt+J6zQiprl
ZNWmw6UtGOjMPWuNpk/TJQrWwi2BHtk57ReFf5B3VsckUwqOc1VQbfYZlh8Hn/rB
8dm2cuHFj9g3oEUdUujWLlhy8ALRNqvirB1oIg3F0V4MjeFWRIiL95ZQSOsXrs7G
6ThZx28On1LEEaHoeDMytOC4gIxIo+b9n8nuzxSCQs74G/02zWnBEzZPgI1NpF5f
1mqironCReuRIMle/L0MwIG8nF418ptbX7XurekqgOu/xn8FE51zmTR5e4BiUOJI
u1JfKTIR13zr2FHhWAQ36DONnj5wMw==
=6xax
-----END PGP SIGNATURE-----

--swky2i2knx6p3pxp--
