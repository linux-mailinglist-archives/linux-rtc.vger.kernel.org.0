Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83280FBB9A
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Nov 2019 23:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbfKMW1b (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Nov 2019 17:27:31 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40556 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfKMW1b (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Nov 2019 17:27:31 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 5C0F42911AD
Received: by earth.universe (Postfix, from userid 1000)
        id BF57C3C0C78; Wed, 13 Nov 2019 23:27:26 +0100 (CET)
Date:   Wed, 13 Nov 2019 23:27:26 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [RFCv1] rtc: m41t80: disable clock provider support
Message-ID: <20191113222726.ifjp2bhwmplm5r7z@earth.universe>
References: <20191108170135.9053-1-sebastian.reichel@collabora.com>
 <20191108175329.GH216543@piout.net>
 <20191108223415.dio3pwkf24jfs5o4@earth.universe>
 <20191109002449.534B6207FA@mail.kernel.org>
 <20191109014151.yd2untpgnuinermj@earth.universe>
 <20191109065334.64A03214E0@mail.kernel.org>
 <20191112151526.txl5rwpuiwjpopzx@earth.universe>
 <20191112222012.157CC20674@mail.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="c27ca4y5vep6oudt"
Content-Disposition: inline
In-Reply-To: <20191112222012.157CC20674@mail.kernel.org>
User-Agent: NeoMutt/20180716
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--c27ca4y5vep6oudt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Nov 12, 2019 at 02:20:11PM -0800, Stephen Boyd wrote:
> Quoting Sebastian Reichel (2019-11-12 07:15:26)
> > On Fri, Nov 08, 2019 at 10:53:33PM -0800, Stephen Boyd wrote:
> > > Quoting Sebastian Reichel (2019-11-08 17:41:51)
> > > > On Fri, Nov 08, 2019 at 04:24:48PM -0800, Stephen Boyd wrote:
> > > > >=20
> > > > > Is this the chicken-egg scenario? I read this thread but I can't =
follow
> > > > > along with what the problem is. Sorry.
> > > >=20
> > > > Yes. The board has an I2C based RTC (m41t62), which provides a prog=
rammable 1
> > > > Hz to 32 kHz square wave (SQW) output defaulting to 32 kHz. The boa=
rd designers
> > > > connected the RTC's SQW output to the i.MX6 CKIL clock input instea=
d of adding
> > > > another oscillator. The i.MX6 CCM acquires that clock in imx6q_cloc=
ks_init()
> > > > (and assumes it is a fixed clock):
> > > >=20
> > > > hws[IMX6QDL_CLK_CKIL] =3D imx6q_obtain_fixed_clk_hw(ccm_node, "ckil=
", 0);
> > >=20
> > > Who uses the IMX6QDL_CLK_CKIL though? Grep on kernel sources shows me
> > > nothing.
> >=20
> > The manual specifies, that CKIL is synchronized with the main system
> > clock. The resulting clock is used by all kind of IP cores inside
> > the i.MX6, for example the SNVS RTC and watchdog. I couldn't find
> > any registers to configure the CKIL pipeline and CKIL input is
> > usually a fixed clock, so current implementation might be "broken"
> > without anyone noticing. Checking a running i.MX6 system, that
> > actually seems to be the case :(
> >=20
> > $ cat /sys/kernel/debug/clk/ckil/clk_rate        =20
> > 32768
> > $ cat /sys/kernel/debug/clk/ckil/clk_enable_count=20
> > 0
> > $ cat /sys/kernel/debug/clk/ckil/clk_prepare_count=20
> > 0
> > $ cat /sys/kernel/debug/clk/ckil/clk_flags        =20
> > CLK_IS_BASIC
> >=20
> > I suppose an easy fix would be to mark that clock as critical and
> > that would also keep the parent clocks enabled?
>=20
> Yes. It sounds like some sort of low frequency timer clk. It probably
> should always be left enabled with CLK_IS_CRITICAL then.

Right, system expects that clock to be always available including
low power states. This is supposed not to be turned off at all.

I gave it a try today (I defined ckil clock in DT as fixed
rate clock with divider and multiplier set to 1 and used
the RTC as parent clock) and it happened exactly what I
expected: I received -EPROBE_DEFER. This results in
the problem, that I pointed out.

Actually imx6 clock manager driver registers a fixed clock, when
the DT part fails (incl. a -EPROBE_DEFER error), so it still boots.
But then the reference to the parent clock is obviously missing,
so RTC clock is not enabled and CKIL is effectivly missing.

If the error code is handled properly the boot does not finish,
since the i2c bus driver probe defers without the clock manager's
clocks being available. Without the i2c bus driver, the RTC driver
is not probed, so the clock never appears.

The simplest fix would be to export of_clk_detect_critical()
and call it in the RTC driver. Reading the comment above the
function I suppose this is not an acceptable solution?

-- Sebastian

--c27ca4y5vep6oudt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3Mg0gACgkQ2O7X88g7
+prbuA/9H7pQ9y3BOKoO+N4g6YrlW3p4gZJ8BlNNtICeD5ZSYj3782tWJo5DKl2+
myLZhch30TFObkni/Xl6ZZKbj3GH0d12Jy+sogyffS3S2DKvbhj5mZ78xcEVHqJB
u/4VyRnqOl9Sadb55S+Zti/8CPgAsoz9MOh72H/kfT4INXsRBeEPAiv4/y4K6QNW
ysmPG7ZjSgByJQkFNEFk/ULcJViE47IRaY4rNHmpAYQwz+xe1kHIAXKYDJMUEMbO
Pwtqh/XtxA2XqgFOlRh7SGq10R5NKbXoX9ApHuFtSjZsxMdfcEu1BENF8Xen5AZ1
5RZN4dfgl1ue10z7qMW/vVZ8RsJmm75zzIFVImFBO+VPmQjNYrqh7aSyQgQJJsgR
Y2vARKQ/OM7TY4q9UT4Q2yCgHiC50IsRqTpRaqUWXLywBfmhQjSoPDHsJC9hIMB1
i+7BqFUv5hzFA3sKB0MVjZSZiPtNbGT06YaSeFWRgH75rgWiLZaZ0jQC82SQZyhx
5wN/3+PnWAdN2MfmltX5qQ6jtKERDTMF69qOIR5iny4pA8whiXnoZVxjWH7a1CNO
wN4Q2aB70a+7o3d8efRU7Pvj/raYIogB/4fqNbDIKXRei33cQZkXIiAgKvGECEmk
do7GBKKi0srxWYh2N82gn3qdk8dSdGsUUn411GFeiYaxkHOe3dM=
=yJyD
-----END PGP SIGNATURE-----

--c27ca4y5vep6oudt--
