Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0067C2DD9E9
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Dec 2020 21:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730265AbgLQU31 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Dec 2020 15:29:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgLQU31 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 17 Dec 2020 15:29:27 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07EE5C061794
        for <linux-rtc@vger.kernel.org>; Thu, 17 Dec 2020 12:28:47 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kpztC-0003Wk-Nj; Thu, 17 Dec 2020 21:28:42 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kpztB-0004Ur-TG; Thu, 17 Dec 2020 21:28:41 +0100
Date:   Thu, 17 Dec 2020 21:28:41 +0100
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
Message-ID: <20201217202841.gcr5bxlaqpupiuu2@pengutronix.de>
References: <20201204092752.GE74177@piout.net>
 <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
 <20201211215611.24392-2-rasmus.villemoes@prevas.dk>
 <CAL_JsqJ-5gwycTRQCdX=ZsefEJ=F1GyTjjDW6QB1PBynibFzLg@mail.gmail.com>
 <b3c05d29-3ed6-d5f5-d1dd-0ddec1f89276@prevas.dk>
 <CAL_Jsq+HeeFUR1Yv37X4OnkEPvSiAc2B86=Nshxz7tmvpKk+zw@mail.gmail.com>
 <20201217181209.sibyhlfvlpjaewrv@pengutronix.de>
 <CAL_Jsq+z10xMig6HgOBK4bEK9_-MMv_ootBaBZeLuJ7TWEYm=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="didtc42d7qrszfpa"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+z10xMig6HgOBK4bEK9_-MMv_ootBaBZeLuJ7TWEYm=g@mail.gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--didtc42d7qrszfpa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 01:02:32PM -0600, Rob Herring wrote:
> On Thu, Dec 17, 2020 at 12:12 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > On Thu, Dec 17, 2020 at 10:51:08AM -0600, Rob Herring wrote:
> > > On Fri, Dec 11, 2020 at 5:10 PM Rasmus Villemoes
> > > <rasmus.villemoes@prevas.dk> wrote:
> > > >
> > > > On 11/12/2020 23.30, Rob Herring wrote:
> > > > > On Fri, Dec 11, 2020 at 3:56 PM Rasmus Villemoes
> > > > > <rasmus.villemoes@prevas.dk> wrote:
> > > > >>
> > > > >> Some RTCs, e.g. the pcf2127, can be used as a hardware watchdog.=
 But
> > > > >> if the reset pin is not actually wired up, the driver exposes a
> > > > >> watchdog device that doesn't actually work.
> > > > >>
> > > > >> Provide a standard binding that can be used to indicate that a g=
iven
> > > > >> RTC can perform a reset of the machine, similar to wakeup-source.
> > > > >
> > > > > Why not use the watchdog 'timeout-sec' property?
> > > >
> > > > Wouldn't that be overloading that property? AFAIU, that is used to =
ask
> > > > the kernel to program an initial timeout value into the watchdog de=
vice.
> > > > But what if one doesn't want to start the watchdog device at kernel
> > > > boot, but just indicate that the RTC has that capability?
> > >
> > > Yeah, I guess you're right.
> >
> > I agree, too. The initial suggestion looks fine.
> >
> > > > It's quite possible that if it can act as a watchdog device (and
> > > > has-watchdog was also suggested), one would also want timeout-sec a=
nd
> > > > other watchdog bindings to apply. But that can be added later, by t=
hose
> > > > who actually want that.
> > > >
> > > > For now, I'd really like to get my board booting again (or rather, =
not
> > > > get reset by the real watchdog just because the pcf2127 driver now
> > > > exposes something as /dev/wathdog0, pushing the real one to
> > > > /dev/wathcdog1 which doesn't get pinged from userspace).
> > >
> > > I'm wondering how you solve which wdog to ping when there are multiple
> > > without relying on numbering. I guess 'reset-source' will solve that
> > > even if that's not your current fix. So I guess I'm fine with this.
> >
> > I guess you'd need some udev magic that ensures that the right watchdog
> > always gets the same number.
>=20
> Why involve udev and keep the magic numbering important? Provide
> enough details on watchdogs' features so an intelligent decision can
> be made. It's the same thing every time folks try to number things in
> DT.

Note that it was you wanted to solve the more complicated problem about
selecting the right watchdog from a set of several working watchdogs.
The problem here is easier: We have machines with two watchdog devices
and only one of them is actually working. So the straight forward thing
to do is to not provide the watchdog device for the rtc chip that cannot
reset the system.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--didtc42d7qrszfpa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/bv3YACgkQwfwUeK3K
7AnImgf9Fw73318x4WDmojLr4RhZjDZhjfvA6Gq6JqEHpz0ZbId8iNX6TO/DoUTn
nHBQVUIGab9KfGzaLwkRoxPUw7x2H3CFCrXtOxfbetHLSh6w4nOuQDHhmsbakfN5
03ryeRsa00FuDjWbH/+jMSnGipfWrxJjPJ2jEkvH8ZE5TMo0DEP8dwZXkJcKlA4/
QMuNq0MjbhbyHwIuOCLGPOjkYan8dGflQfV/CbJUxEPaAFoqMv8tjFGW4u2FWdiq
GZVVPnYGSp5OaOObox3XPPPqIOhRWvlV9w0W4cG7h5lEbdXT93VGWNsW68fr1FwY
bAqy2R0tWm1JeACw8YgALQ7IsJ08Ag==
=vFOg
-----END PGP SIGNATURE-----

--didtc42d7qrszfpa--
