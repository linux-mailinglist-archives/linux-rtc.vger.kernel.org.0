Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBF19F9CDF
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2019 23:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbfKLWUN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Nov 2019 17:20:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:53060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726896AbfKLWUN (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 12 Nov 2019 17:20:13 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 157CC20674;
        Tue, 12 Nov 2019 22:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573597212;
        bh=b1dnES5jgk7yk1lCvITSroRU4oC3E0VLXE/Pf6QOSIg=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=biolw4qTw3IGUYY/x72iCkR6o7cUXTdm1dZ1W5261DfUErbGMW8NzaVlZnLwbgNxT
         g9dI9yML7RoVbl2JSa2i+akWfdqpgUyh+osRqCR5NqHvKmiCnFlWZiyEuXzEBTW0b5
         4si4rFOEMWlRBga2uBLGTiHsHEb+zaledkIahE1c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191112151526.txl5rwpuiwjpopzx@earth.universe>
References: <20191108170135.9053-1-sebastian.reichel@collabora.com> <20191108175329.GH216543@piout.net> <20191108223415.dio3pwkf24jfs5o4@earth.universe> <20191109002449.534B6207FA@mail.kernel.org> <20191109014151.yd2untpgnuinermj@earth.universe> <20191109065334.64A03214E0@mail.kernel.org> <20191112151526.txl5rwpuiwjpopzx@earth.universe>
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
Date:   Tue, 12 Nov 2019 14:20:11 -0800
Message-Id: <20191112222012.157CC20674@mail.kernel.org>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Quoting Sebastian Reichel (2019-11-12 07:15:26)
> Hi,
>=20
> On Fri, Nov 08, 2019 at 10:53:33PM -0800, Stephen Boyd wrote:
> > Quoting Sebastian Reichel (2019-11-08 17:41:51)
> > > On Fri, Nov 08, 2019 at 04:24:48PM -0800, Stephen Boyd wrote:
> > > >=20
> > > > Is this the chicken-egg scenario? I read this thread but I can't fo=
llow
> > > > along with what the problem is. Sorry.
> > >=20
> > > Yes. The board has an I2C based RTC (m41t62), which provides a progra=
mmable 1
> > > Hz to 32 kHz square wave (SQW) output defaulting to 32 kHz. The board=
 designers
> > > connected the RTC's SQW output to the i.MX6 CKIL clock input instead =
of adding
> > > another oscillator. The i.MX6 CCM acquires that clock in imx6q_clocks=
_init()
> > > (and assumes it is a fixed clock):
> > >=20
> > > hws[IMX6QDL_CLK_CKIL] =3D imx6q_obtain_fixed_clk_hw(ccm_node, "ckil",=
 0);
> >=20
> > Who uses the IMX6QDL_CLK_CKIL though? Grep on kernel sources shows me
> > nothing.
>=20
> The manual specifies, that CKIL is synchronized with the main system
> clock. The resulting clock is used by all kind of IP cores inside
> the i.MX6, for example the SNVS RTC and watchdog. I couldn't find
> any registers to configure the CKIL pipeline and CKIL input is
> usually a fixed clock, so current implementation might be "broken"
> without anyone noticing. Checking a running i.MX6 system, that
> actually seems to be the case :(
>=20
> $ cat /sys/kernel/debug/clk/ckil/clk_rate        =20
> 32768
> $ cat /sys/kernel/debug/clk/ckil/clk_enable_count=20
> 0
> $ cat /sys/kernel/debug/clk/ckil/clk_prepare_count=20
> 0
> $ cat /sys/kernel/debug/clk/ckil/clk_flags        =20
> CLK_IS_BASIC
>=20
> I suppose an easy fix would be to mark that clock as critical and
> that would also keep the parent clocks enabled?

Yes. It sounds like some sort of low frequency timer clk. It probably
should always be left enabled with CLK_IS_CRITICAL then.

