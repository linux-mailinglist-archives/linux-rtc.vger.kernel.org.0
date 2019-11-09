Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF59BF5CCB
	for <lists+linux-rtc@lfdr.de>; Sat,  9 Nov 2019 02:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbfKIBl5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 8 Nov 2019 20:41:57 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41714 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfKIBl5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 8 Nov 2019 20:41:57 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id D688D284D33
Received: by earth.universe (Postfix, from userid 1000)
        id 0597E3C0C78; Sat,  9 Nov 2019 02:41:52 +0100 (CET)
Date:   Sat, 9 Nov 2019 02:41:51 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [RFCv1] rtc: m41t80: disable clock provider support
Message-ID: <20191109014151.yd2untpgnuinermj@earth.universe>
References: <20191108170135.9053-1-sebastian.reichel@collabora.com>
 <20191108175329.GH216543@piout.net>
 <20191108223415.dio3pwkf24jfs5o4@earth.universe>
 <20191109002449.534B6207FA@mail.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hvzbjabz4wumpn23"
Content-Disposition: inline
In-Reply-To: <20191109002449.534B6207FA@mail.kernel.org>
User-Agent: NeoMutt/20180716
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--hvzbjabz4wumpn23
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 08, 2019 at 04:24:48PM -0800, Stephen Boyd wrote:
> Quoting Sebastian Reichel (2019-11-08 14:34:15)
> > On Fri, Nov 08, 2019 at 06:53:29PM +0100, Alexandre Belloni wrote:
> > > On 08/11/2019 18:01:35+0100, Sebastian Reichel wrote:
> > > > Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> > > > modules SQW clock output defaults to 32768 Hz. This behaviour is
> > > > used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> > > > the clock is disabled and all i.MX6 functionality depending on
> > > > the 32 KHz clock have undefined behaviour (e.g. the hardware watchd=
og
> > > > run to fast or slow).
> > > >=20
> > > > The normal solution would be to properly describe the clock tree
> > > > in DT, but from the kernel's perspective this is a chicken-and-egg
> > > > problem: CKIL is required very early, but the clock is only provided
> > > > after the I2C RTC has been probed.
> > > >=20
> > > > Technically everything is fine by not touching anything, so this
> > > > works around the issue by disabling the clock handling from the
> > > > RTC driver. I guess the proper solution would be to simply mark the
> > > > clock as always-enabled, but this does not seem to be supported by
> > > > the clock framework.
> > > >=20
> > >=20
> > > You need to have a consumer so this clock is not disabled by the CCF
> > > after seeing nobody uses it.
> >=20
> > That's why I was wondering if we can have something like regulator's
> > always-enabled for clocks.
>=20
> There's a flag CLK_IS_CRITICAL that providers can set.

Thanks, that is what I was looking for.
Is there a DT binding to set that flag for a clock?

> > > If you need it early, you can have a look at rtc-sun6i.c but I
> > > would like that to not become a recurrent pattern, especially for
> > > discrete RTCs.
> >=20
> > I don't just need it early. The issue is, that CKIL is the 32khz
> > low frequency clock fed into the i.MX6. It is initialized by the
> > clock manager, so I need it before any of the SoC clocks are
> > registered. Without the SoC clocks, the I2C bus cannot be probed
> > and thus the RTC driver cannot be probed.
> >=20
>=20
> Is this the chicken-egg scenario? I read this thread but I can't follow
> along with what the problem is. Sorry.

Yes. The board has an I2C based RTC (m41t62), which provides a programmable=
 1
Hz to 32 kHz square wave (SQW) output defaulting to 32 kHz. The board desig=
ners
connected the RTC's SQW output to the i.MX6 CKIL clock input instead of add=
ing
another oscillator. The i.MX6 CCM acquires that clock in imx6q_clocks_init()
(and assumes it is a fixed clock):

hws[IMX6QDL_CLK_CKIL] =3D imx6q_obtain_fixed_clk_hw(ccm_node, "ckil", 0);

Changing this to reference the RTC SQW results in the chicken-egg scenario.=
 It
would mean, that imx6q_clocks_init() cannot complete without the RTC driver=
, but
the RTC cannot probe without the I2C bus driver and the I2C bus driver need=
s some
clocks from the i.MX6.

I think adding the clock-is-critical flag is the best solution for
this setup, but on most boards the RTC SQW clock is not critical and
should be disabled. Did I miss a DT flag, that can be added on the
specific board?

-- Sebastian

--hvzbjabz4wumpn23
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3GGVwACgkQ2O7X88g7
+ppDqQ//XhiZw7RmDRZYK6qb1dM4jV8U5hCdveaGEu7RsSe2S2dTOkPC7rN+O/jD
AkFg7ZG2Ao9oEdC75vAeEeqBrEWKQDtmWk/fCab7ZPQFUMhwlEy7XZ9wZpLl++yu
zkjpF9fBKGnrsVpEoL9Ip7nZjx2Z5pega11gyRTq5f7BlrMXOuNjzvsDzgKs5dhl
PRM16/J/Pu24lTYS7QZPhgS3lENoYZi+by3YvvparXBxUrbCdVgzfV2kz+Lci+45
UEJ+GBmInJqe3Asxt3zBFFkPlu8SAcCE9jUsd+Gge4yRWqtjetYRXS18qZNRYj4q
YuXgOGCwvGJ6JOHwgnJ7607fBptt4+ItbG+aYpHWYEvzKP4Ydlgf2+r6uUfkYwka
4kvBVrvSbBybaaAl+Ss4pdFK7kvQyvbLdFSTjz5EBmpjUIdrLvJmNGcE8KqpvDFS
vTlopVMpEsd5Qrvp/RI8Lt69Sipi0CX2IM4vt1L+0hEd5KU0JEiNfFwioqySovYy
vHyuu1mAXWPmgXxWoH01PCCBa6TiW1HcgLfv504QIvT0ppgD4NQ3Dx5cKR9VcQB1
l3fmaTlWwVclTB8Je8rOKKXokuThjBDqVkwRoL9Z79DzusGd4jDR8yNLExNf6/47
s/8UR++M+iSUH5GkyLMkLG9kWb5A5yMJSNpuo7S2/5d8XQONfx4=
=Dx13
-----END PGP SIGNATURE-----

--hvzbjabz4wumpn23--
