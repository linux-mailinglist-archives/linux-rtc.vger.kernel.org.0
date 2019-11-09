Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FECCF5DBB
	for <lists+linux-rtc@lfdr.de>; Sat,  9 Nov 2019 07:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbfKIGxg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 9 Nov 2019 01:53:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:57556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725861AbfKIGxg (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 9 Nov 2019 01:53:36 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 64A03214E0;
        Sat,  9 Nov 2019 06:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573282414;
        bh=gI7K6Y4VDN8HX2L2f1LVi3Kp5/2nU5WVO5P6Q+Ml6Iw=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=ZcJWDTlyTfPyHRnr7agTyoD/fRqWGcdidHh0pajxmpvSbudKtdH13pmhnFOJM2hV9
         Uj2iioRsQZh/3/BU85tfh3HqOWTygIUqpqKSIw+5JPH0FxxCIMmFCBSZslVdILe6qN
         GAZ59v7RtqCLPJyjMUzWKk1rAIop/gSYL6o3Zsew=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191109014151.yd2untpgnuinermj@earth.universe>
References: <20191108170135.9053-1-sebastian.reichel@collabora.com> <20191108175329.GH216543@piout.net> <20191108223415.dio3pwkf24jfs5o4@earth.universe> <20191109002449.534B6207FA@mail.kernel.org> <20191109014151.yd2untpgnuinermj@earth.universe>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [RFCv1] rtc: m41t80: disable clock provider support
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 22:53:33 -0800
Message-Id: <20191109065334.64A03214E0@mail.kernel.org>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Quoting Sebastian Reichel (2019-11-08 17:41:51)
> Hi,
>=20
> On Fri, Nov 08, 2019 at 04:24:48PM -0800, Stephen Boyd wrote:
> > Quoting Sebastian Reichel (2019-11-08 14:34:15)
> > > On Fri, Nov 08, 2019 at 06:53:29PM +0100, Alexandre Belloni wrote:
> > > > On 08/11/2019 18:01:35+0100, Sebastian Reichel wrote:
> > > > > Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> > > > > modules SQW clock output defaults to 32768 Hz. This behaviour is
> > > > > used to provide the i.MX6 CKIL clock. Once the RTC driver is prob=
ed,
> > > > > the clock is disabled and all i.MX6 functionality depending on
> > > > > the 32 KHz clock have undefined behaviour (e.g. the hardware watc=
hdog
> > > > > run to fast or slow).
> > > > >=20
> > > > > The normal solution would be to properly describe the clock tree
> > > > > in DT, but from the kernel's perspective this is a chicken-and-egg
> > > > > problem: CKIL is required very early, but the clock is only provi=
ded
> > > > > after the I2C RTC has been probed.
> > > > >=20
> > > > > Technically everything is fine by not touching anything, so this
> > > > > works around the issue by disabling the clock handling from the
> > > > > RTC driver. I guess the proper solution would be to simply mark t=
he
> > > > > clock as always-enabled, but this does not seem to be supported by
> > > > > the clock framework.
> > > > >=20
> > > >=20
> > > > You need to have a consumer so this clock is not disabled by the CCF
> > > > after seeing nobody uses it.
> > >=20
> > > That's why I was wondering if we can have something like regulator's
> > > always-enabled for clocks.
> >=20
> > There's a flag CLK_IS_CRITICAL that providers can set.
>=20
> Thanks, that is what I was looking for.
> Is there a DT binding to set that flag for a clock?
>=20

No.

> > > > If you need it early, you can have a look at rtc-sun6i.c but I
> > > > would like that to not become a recurrent pattern, especially for
> > > > discrete RTCs.
> > >=20
> > > I don't just need it early. The issue is, that CKIL is the 32khz
> > > low frequency clock fed into the i.MX6. It is initialized by the
> > > clock manager, so I need it before any of the SoC clocks are
> > > registered. Without the SoC clocks, the I2C bus cannot be probed
> > > and thus the RTC driver cannot be probed.
> > >=20
> >=20
> > Is this the chicken-egg scenario? I read this thread but I can't follow
> > along with what the problem is. Sorry.
>=20
> Yes. The board has an I2C based RTC (m41t62), which provides a programmab=
le 1
> Hz to 32 kHz square wave (SQW) output defaulting to 32 kHz. The board des=
igners
> connected the RTC's SQW output to the i.MX6 CKIL clock input instead of a=
dding
> another oscillator. The i.MX6 CCM acquires that clock in imx6q_clocks_ini=
t()
> (and assumes it is a fixed clock):
>=20
> hws[IMX6QDL_CLK_CKIL] =3D imx6q_obtain_fixed_clk_hw(ccm_node, "ckil", 0);

Who uses the IMX6QDL_CLK_CKIL though? Grep on kernel sources shows me
nothing.

>=20
> Changing this to reference the RTC SQW results in the chicken-egg scenari=
o. It
> would mean, that imx6q_clocks_init() cannot complete without the RTC driv=
er, but
> the RTC cannot probe without the I2C bus driver and the I2C bus driver ne=
eds some
> clocks from the i.MX6.
>=20
> I think adding the clock-is-critical flag is the best solution for
> this setup, but on most boards the RTC SQW clock is not critical and
> should be disabled. Did I miss a DT flag, that can be added on the
> specific board?
>=20

The clk framework can unwind this problem for you. It lazily evaluates
parents so that clk controllers can probe without needing all their
parent clks to exist yet.

The clocks in i.MX6 can be registered first and some of those can be
left "orphaned". Then the i2c driver can probe and get the i2c clks it
needs from the i.MX6 driver and use them because their path to the root
is registered. The i2c driver can then probe the RTC which provides the
CLK_CKIL parent.

Does something go wrong, or you're just concerned that it might not
work?

