Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD875F93D0
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2019 16:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbfKLPPb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Nov 2019 10:15:31 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50614 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbfKLPPb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Nov 2019 10:15:31 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 6AE2A284D18
Received: by earth.universe (Postfix, from userid 1000)
        id F03273C0C78; Tue, 12 Nov 2019 16:15:26 +0100 (CET)
Date:   Tue, 12 Nov 2019 16:15:26 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [RFCv1] rtc: m41t80: disable clock provider support
Message-ID: <20191112151526.txl5rwpuiwjpopzx@earth.universe>
References: <20191108170135.9053-1-sebastian.reichel@collabora.com>
 <20191108175329.GH216543@piout.net>
 <20191108223415.dio3pwkf24jfs5o4@earth.universe>
 <20191109002449.534B6207FA@mail.kernel.org>
 <20191109014151.yd2untpgnuinermj@earth.universe>
 <20191109065334.64A03214E0@mail.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="e3yf5i2neyiii5um"
Content-Disposition: inline
In-Reply-To: <20191109065334.64A03214E0@mail.kernel.org>
User-Agent: NeoMutt/20180716
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--e3yf5i2neyiii5um
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 08, 2019 at 10:53:33PM -0800, Stephen Boyd wrote:
> Quoting Sebastian Reichel (2019-11-08 17:41:51)
> > On Fri, Nov 08, 2019 at 04:24:48PM -0800, Stephen Boyd wrote:
> > > Quoting Sebastian Reichel (2019-11-08 14:34:15)
> > > > On Fri, Nov 08, 2019 at 06:53:29PM +0100, Alexandre Belloni wrote:
> > > > > On 08/11/2019 18:01:35+0100, Sebastian Reichel wrote:
> > > > > > Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> > > > > > modules SQW clock output defaults to 32768 Hz. This behaviour is
> > > > > > used to provide the i.MX6 CKIL clock. Once the RTC driver is pr=
obed,
> > > > > > the clock is disabled and all i.MX6 functionality depending on
> > > > > > the 32 KHz clock have undefined behaviour (e.g. the hardware wa=
tchdog
> > > > > > run to fast or slow).
> > > > > >=20
> > > > > > The normal solution would be to properly describe the clock tree
> > > > > > in DT, but from the kernel's perspective this is a chicken-and-=
egg
> > > > > > problem: CKIL is required very early, but the clock is only pro=
vided
> > > > > > after the I2C RTC has been probed.
> > > > > >=20
> > > > > > Technically everything is fine by not touching anything, so this
> > > > > > works around the issue by disabling the clock handling from the
> > > > > > RTC driver. I guess the proper solution would be to simply mark=
 the
> > > > > > clock as always-enabled, but this does not seem to be supported=
 by
> > > > > > the clock framework.
> > > > > >=20
> > > > >=20
> > > > > You need to have a consumer so this clock is not disabled by the =
CCF
> > > > > after seeing nobody uses it.
> > > >=20
> > > > That's why I was wondering if we can have something like regulator's
> > > > always-enabled for clocks.
> > >=20
> > > There's a flag CLK_IS_CRITICAL that providers can set.
> >=20
> > Thanks, that is what I was looking for.
> > Is there a DT binding to set that flag for a clock?
> >=20
>=20
> No.

:(

> > > > > If you need it early, you can have a look at rtc-sun6i.c but I
> > > > > would like that to not become a recurrent pattern, especially for
> > > > > discrete RTCs.
> > > >=20
> > > > I don't just need it early. The issue is, that CKIL is the 32khz
> > > > low frequency clock fed into the i.MX6. It is initialized by the
> > > > clock manager, so I need it before any of the SoC clocks are
> > > > registered. Without the SoC clocks, the I2C bus cannot be probed
> > > > and thus the RTC driver cannot be probed.
> > > >=20
> > >=20
> > > Is this the chicken-egg scenario? I read this thread but I can't foll=
ow
> > > along with what the problem is. Sorry.
> >=20
> > Yes. The board has an I2C based RTC (m41t62), which provides a programm=
able 1
> > Hz to 32 kHz square wave (SQW) output defaulting to 32 kHz. The board d=
esigners
> > connected the RTC's SQW output to the i.MX6 CKIL clock input instead of=
 adding
> > another oscillator. The i.MX6 CCM acquires that clock in imx6q_clocks_i=
nit()
> > (and assumes it is a fixed clock):
> >=20
> > hws[IMX6QDL_CLK_CKIL] =3D imx6q_obtain_fixed_clk_hw(ccm_node, "ckil", 0=
);
>=20
> Who uses the IMX6QDL_CLK_CKIL though? Grep on kernel sources shows me
> nothing.

The manual specifies, that CKIL is synchronized with the main system
clock. The resulting clock is used by all kind of IP cores inside
the i.MX6, for example the SNVS RTC and watchdog. I couldn't find
any registers to configure the CKIL pipeline and CKIL input is
usually a fixed clock, so current implementation might be "broken"
without anyone noticing. Checking a running i.MX6 system, that
actually seems to be the case :(

$ cat /sys/kernel/debug/clk/ckil/clk_rate        =20
32768
$ cat /sys/kernel/debug/clk/ckil/clk_enable_count=20
0
$ cat /sys/kernel/debug/clk/ckil/clk_prepare_count=20
0
$ cat /sys/kernel/debug/clk/ckil/clk_flags        =20
CLK_IS_BASIC

I suppose an easy fix would be to mark that clock as critical and
that would also keep the parent clocks enabled?

> > Changing this to reference the RTC SQW results in the chicken-egg scena=
rio. It
> > would mean, that imx6q_clocks_init() cannot complete without the RTC dr=
iver, but
> > the RTC cannot probe without the I2C bus driver and the I2C bus driver =
needs some
> > clocks from the i.MX6.
> >=20
> > I think adding the clock-is-critical flag is the best solution for
> > this setup, but on most boards the RTC SQW clock is not critical and
> > should be disabled. Did I miss a DT flag, that can be added on the
> > specific board?
> >=20
>=20
> The clk framework can unwind this problem for you. It lazily evaluates
> parents so that clk controllers can probe without needing all their
> parent clks to exist yet.
>
> The clocks in i.MX6 can be registered first and some of those can be
> left "orphaned". Then the i2c driver can probe and get the i2c clks it
> needs from the i.MX6 driver and use them because their path to the root
> is registered. The i2c driver can then probe the RTC which provides the
> CLK_CKIL parent.

That's nice, I wasn't aware of this feature. Thanks for the
explanation.

> Does something go wrong, or you're just concerned that it might not
> work?

I did not try it after noticing the dependencies. The only thing
known to be broken is the current situation in mainline ("unused"
RTC clock is turned off), but right now there is no QMX6 based board
in mainline.

-- Sebastian

--e3yf5i2neyiii5um
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3KzIAACgkQ2O7X88g7
+pq/Dw/+MNnoZQkld4s6A7pG6KJpDNy+G1JwsMUchnJmSIz3ML0eT+pV5ob9oLT+
DYctPVZlSFabpPC0977RnLyA4dsWmDCNCZwjqgpOFltdTehy+PtD8bFgsLsShtis
9xW8oQZPEfynhRcB65mSbQx1j/XDhxagK0v1sIbyapXkHBOnU2axO8UCuBaKP4J9
53bEzS3h2jw+8lbTPZIuCQipsrSDeIvrz7EvFPB6dWqQROXDJ3ahYkTjpTPDqBJ4
cOLtjnO3gYoL5spvQ1swNbgntdOg+k/WQGKutTIvM3umyv23vba5jiBuZOGefeUI
T98InRSuJ2S66X3LZHYhLVqKLNM3P2ljI/qXC7cxYYQpLijjCCINs7665oJEBMy8
lWjk81fD0Bco9LiG1kQXbuOmxFUjhCBAg1cFruHtWh8GqERQem0GpEK29gNET5w+
MhxKu0Fv78/TIXcphr/UZCxAW9a0EPKFpIDxg+3Ddn/faiCvUEh+Fp/+KImixQ+0
SeINPEWTnhSCLHnrxtv6gPZ1JF8HgGtBnAf3hvyu0gASejexpBgiGaEfnixhcsii
7XNdS4TOKdS9zif+PWF9Si9hjfcXXG4dPcTBbCDIXYc8YRB+ixBUqe7lFnzGHOyW
BvdiSRgcTlOEM4SNvrwlfSJjtSkcBGBzvrCxnuUQwkPGdCJOp2o=
=BPZB
-----END PGP SIGNATURE-----

--e3yf5i2neyiii5um--
