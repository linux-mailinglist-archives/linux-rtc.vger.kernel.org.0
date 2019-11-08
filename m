Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33142F5AF0
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Nov 2019 23:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729737AbfKHWeU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 8 Nov 2019 17:34:20 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40402 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727992AbfKHWeU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 8 Nov 2019 17:34:20 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id B75C32913DE
Received: by earth.universe (Postfix, from userid 1000)
        id ACD1D3C0C78; Fri,  8 Nov 2019 23:34:15 +0100 (CET)
Date:   Fri, 8 Nov 2019 23:34:15 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [RFCv1] rtc: m41t80: disable clock provider support
Message-ID: <20191108223415.dio3pwkf24jfs5o4@earth.universe>
References: <20191108170135.9053-1-sebastian.reichel@collabora.com>
 <20191108175329.GH216543@piout.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zhoojrggfqyx7vps"
Content-Disposition: inline
In-Reply-To: <20191108175329.GH216543@piout.net>
User-Agent: NeoMutt/20180716
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--zhoojrggfqyx7vps
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 08, 2019 at 06:53:29PM +0100, Alexandre Belloni wrote:
> On 08/11/2019 18:01:35+0100, Sebastian Reichel wrote:
> > Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> > modules SQW clock output defaults to 32768 Hz. This behaviour is
> > used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> > the clock is disabled and all i.MX6 functionality depending on
> > the 32 KHz clock have undefined behaviour (e.g. the hardware watchdog
> > run to fast or slow).
> >=20
> > The normal solution would be to properly describe the clock tree
> > in DT, but from the kernel's perspective this is a chicken-and-egg
> > problem: CKIL is required very early, but the clock is only provided
> > after the I2C RTC has been probed.
> >=20
> > Technically everything is fine by not touching anything, so this
> > works around the issue by disabling the clock handling from the
> > RTC driver. I guess the proper solution would be to simply mark the
> > clock as always-enabled, but this does not seem to be supported by
> > the clock framework.
> >=20
>=20
> You need to have a consumer so this clock is not disabled by the CCF
> after seeing nobody uses it.

That's why I was wondering if we can have something like regulator's
always-enabled for clocks.

> If you need it early, you can have a look at rtc-sun6i.c but I
> would like that to not become a recurrent pattern, especially for
> discrete RTCs.

I don't just need it early. The issue is, that CKIL is the 32khz
low frequency clock fed into the i.MX6. It is initialized by the
clock manager, so I need it before any of the SoC clocks are
registered. Without the SoC clocks, the I2C bus cannot be probed
and thus the RTC driver cannot be probed.

-- Sebastian

--zhoojrggfqyx7vps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3F7VwACgkQ2O7X88g7
+pqBbhAAnUocIxkaYkzGI0OsvrHz4LPHKIhw9Weu0U+xSMfSRNGuslcbDN0IGnFf
oeJP3d8huYNkRUIh39Am7Q94KOmfIpzaN38M7KKWZ7gLMPa1xexNv+ILnx3E2wGZ
Fb5gyw/w8GUfyzVLrYNeClEEQvCJWkrA7blxqXuQC48Os8qTo3CENKm/m5bnu56g
Nqym5i8MdHGGRoJ59fJpRVLRXgd+rAWd/MHatYprlQWdJ/Jiwh0mEYW9z5F5C2/5
SXbd3IYRREsmTlySGweBMmRRKMMI+IeXe0Tf1yCRgc9RkTBqmkWU+rVcYZ/fbc2t
t+U4ofiV94p1xQLsEZWOrV4EGncsUP+1LxQj8LWoveZKbSTXYH3Qmrlbqv1hjl1y
8QbAHmtdPywWyx/R/33W3Tdx4eAqEEiIRm3BUZnyW5MzNoyIAh3PdLWc0tXUx/Nu
+Bb4NtqiHvz4Nw66TuywmDFPRD5JF/vFNw3W1A5XIViYGBrZxfblbMvN2XnD6xLz
A3SFfPxu4G6l+rFz+PdE4jepN94/dbbysJ3CtJezJ6yCLUjPrPMFRvnYPeV9FG8i
quM+ayF0QoV/40Pj6GwH1kIdJSRGoxCK+0lhw1moAVhpf/lvr0bduSDU0YgdsTVr
mV7/Wpg/kzucypxthglK+6s0wlYFqtZmCesa+HvwszeYyBnbhwc=
=j313
-----END PGP SIGNATURE-----

--zhoojrggfqyx7vps--
