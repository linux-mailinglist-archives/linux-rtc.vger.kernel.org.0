Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31AFEF5C44
	for <lists+linux-rtc@lfdr.de>; Sat,  9 Nov 2019 01:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfKIAYu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 8 Nov 2019 19:24:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:52862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727468AbfKIAYu (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 8 Nov 2019 19:24:50 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 534B6207FA;
        Sat,  9 Nov 2019 00:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573259089;
        bh=klckC3nMZu9Tgu8dkxJR6JAVXobhhbXuXfjC0v42SQM=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=tkfqe502Z4S3cKlPYgNn80a0C9Y3eGvoHu0su3zzRnQX2ZEX5+w05wCgctS60/oAX
         alLQtaKpWH/TYxjyuVjlrQ6W2rMNnVUNc34HLcpDqIjq/ReRc0HFwGAEMy8KLYrJvR
         yet1BKT3Kh4WJONmgPjEzWbdasgGn7z8Xtl072yQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191108223415.dio3pwkf24jfs5o4@earth.universe>
References: <20191108170135.9053-1-sebastian.reichel@collabora.com> <20191108175329.GH216543@piout.net> <20191108223415.dio3pwkf24jfs5o4@earth.universe>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [RFCv1] rtc: m41t80: disable clock provider support
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 16:24:48 -0800
Message-Id: <20191109002449.534B6207FA@mail.kernel.org>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Quoting Sebastian Reichel (2019-11-08 14:34:15)
> Hi,
>=20
> On Fri, Nov 08, 2019 at 06:53:29PM +0100, Alexandre Belloni wrote:
> > On 08/11/2019 18:01:35+0100, Sebastian Reichel wrote:
> > > Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> > > modules SQW clock output defaults to 32768 Hz. This behaviour is
> > > used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> > > the clock is disabled and all i.MX6 functionality depending on
> > > the 32 KHz clock have undefined behaviour (e.g. the hardware watchdog
> > > run to fast or slow).
> > >=20
> > > The normal solution would be to properly describe the clock tree
> > > in DT, but from the kernel's perspective this is a chicken-and-egg
> > > problem: CKIL is required very early, but the clock is only provided
> > > after the I2C RTC has been probed.
> > >=20
> > > Technically everything is fine by not touching anything, so this
> > > works around the issue by disabling the clock handling from the
> > > RTC driver. I guess the proper solution would be to simply mark the
> > > clock as always-enabled, but this does not seem to be supported by
> > > the clock framework.
> > >=20
> >=20
> > You need to have a consumer so this clock is not disabled by the CCF
> > after seeing nobody uses it.
>=20
> That's why I was wondering if we can have something like regulator's
> always-enabled for clocks.

There's a flag CLK_IS_CRITICAL that providers can set.

>=20
> > If you need it early, you can have a look at rtc-sun6i.c but I
> > would like that to not become a recurrent pattern, especially for
> > discrete RTCs.
>=20
> I don't just need it early. The issue is, that CKIL is the 32khz
> low frequency clock fed into the i.MX6. It is initialized by the
> clock manager, so I need it before any of the SoC clocks are
> registered. Without the SoC clocks, the I2C bus cannot be probed
> and thus the RTC driver cannot be probed.
>=20

Is this the chicken-egg scenario? I read this thread but I can't follow
along with what the problem is. Sorry.

