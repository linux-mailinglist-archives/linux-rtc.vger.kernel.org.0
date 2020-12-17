Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5592DD7E2
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Dec 2020 19:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731436AbgLQSNI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Dec 2020 13:13:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731679AbgLQSMz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 17 Dec 2020 13:12:55 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA533C061794
        for <linux-rtc@vger.kernel.org>; Thu, 17 Dec 2020 10:12:14 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kpxl4-00062E-Jr; Thu, 17 Dec 2020 19:12:10 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kpxl3-0005TP-Lv; Thu, 17 Dec 2020 19:12:09 +0100
Date:   Thu, 17 Dec 2020 19:12:09 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: rtc: add reset-source property
Message-ID: <20201217181209.sibyhlfvlpjaewrv@pengutronix.de>
References: <20201204092752.GE74177@piout.net>
 <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
 <20201211215611.24392-2-rasmus.villemoes@prevas.dk>
 <CAL_JsqJ-5gwycTRQCdX=ZsefEJ=F1GyTjjDW6QB1PBynibFzLg@mail.gmail.com>
 <b3c05d29-3ed6-d5f5-d1dd-0ddec1f89276@prevas.dk>
 <CAL_Jsq+HeeFUR1Yv37X4OnkEPvSiAc2B86=Nshxz7tmvpKk+zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bzpv2fu724s7d55y"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+HeeFUR1Yv37X4OnkEPvSiAc2B86=Nshxz7tmvpKk+zw@mail.gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--bzpv2fu724s7d55y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 10:51:08AM -0600, Rob Herring wrote:
> On Fri, Dec 11, 2020 at 5:10 PM Rasmus Villemoes
> <rasmus.villemoes@prevas.dk> wrote:
> >
> > On 11/12/2020 23.30, Rob Herring wrote:
> > > On Fri, Dec 11, 2020 at 3:56 PM Rasmus Villemoes
> > > <rasmus.villemoes@prevas.dk> wrote:
> > >>
> > >> Some RTCs, e.g. the pcf2127, can be used as a hardware watchdog. But
> > >> if the reset pin is not actually wired up, the driver exposes a
> > >> watchdog device that doesn't actually work.
> > >>
> > >> Provide a standard binding that can be used to indicate that a given
> > >> RTC can perform a reset of the machine, similar to wakeup-source.
> > >
> > > Why not use the watchdog 'timeout-sec' property?
> >
> > Wouldn't that be overloading that property? AFAIU, that is used to ask
> > the kernel to program an initial timeout value into the watchdog device.
> > But what if one doesn't want to start the watchdog device at kernel
> > boot, but just indicate that the RTC has that capability?
>=20
> Yeah, I guess you're right.

I agree, too. The initial suggestion looks fine.

> > It's quite possible that if it can act as a watchdog device (and
> > has-watchdog was also suggested), one would also want timeout-sec and
> > other watchdog bindings to apply. But that can be added later, by those
> > who actually want that.
> >
> > For now, I'd really like to get my board booting again (or rather, not
> > get reset by the real watchdog just because the pcf2127 driver now
> > exposes something as /dev/wathdog0, pushing the real one to
> > /dev/wathcdog1 which doesn't get pinged from userspace).
>=20
> I'm wondering how you solve which wdog to ping when there are multiple
> without relying on numbering. I guess 'reset-source' will solve that
> even if that's not your current fix. So I guess I'm fine with this.

I guess you'd need some udev magic that ensures that the right watchdog
always gets the same number.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bzpv2fu724s7d55y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/bn3YACgkQwfwUeK3K
7AkL2Qf/XJXUTfIwcB2/pL6pXTVDZFfY541cg7fc5B9wDWTNzWqUqmGsOCpV7eOM
r7FLaH2I1O3moJMD9o4wnorbvPP116Pfr5z0e8cTeqKnEcUEgd5EUeCobeKKVXUK
wa2gz+mOu7TRX8W0DOUeKIfsFYlEMdeVrfdFXauLdMMDF48w0//v19ZjvOGSy1SH
CyU3X8NGw2Tb3ZB81qG9QOANHbt/cAN8qIziMHxcw46+QUv3BaBOAKv57HrVkcys
TzdYYeGDqRhh9FwF0ikJ1L/lglpLpUoA6Q2ajONh6QK9+PeopW9MQTop0d+D7jMK
4g9/M1Z1XWbUQkBC0CTADRTrePaJgA==
=HAL0
-----END PGP SIGNATURE-----

--bzpv2fu724s7d55y--
