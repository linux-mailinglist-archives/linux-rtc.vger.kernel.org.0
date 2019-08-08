Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3703986DF0
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Aug 2019 01:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403901AbfHHXjf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 8 Aug 2019 19:39:35 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:44239 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390130AbfHHXjf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 8 Aug 2019 19:39:35 -0400
X-Originating-IP: 176.129.6.65
Received: from localhost (car62-h01-176-129-6-65.dsl.sta.abo.bbox.fr [176.129.6.65])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id DC3221C0003;
        Thu,  8 Aug 2019 23:39:31 +0000 (UTC)
Date:   Fri, 9 Aug 2019 01:39:30 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        devicetree <devicetree@vger.kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org
Subject: Re: [linux-sunxi] [PATCH 0/3] Add basic support for RTC on Allwinner
 H6 SoC
Message-ID: <20190808233930.GM3600@piout.net>
References: <20190412120730.473-1-megous@megous.com>
 <CAGb2v66cbpsoHJoiFJkBwhZ5SbO+uO+Kf6gtnA3kPFQZq0329Q@mail.gmail.com>
 <20190806183045.edhm3qzpegscf2z7@core.my.home>
 <20190807105502.GK3600@piout.net>
 <20190808121237.g6twq2nh3sayu3vx@core.my.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190808121237.g6twq2nh3sayu3vx@core.my.home>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/08/2019 14:12:37+0200, Ondřej Jirman wrote:
> On Wed, Aug 07, 2019 at 12:55:02PM +0200, Alexandre Belloni wrote:
> > Hi,
> > 
> > On 06/08/2019 20:30:45+0200, Ondřej Jirman wrote:
> > > Maybe whether XO or DCXO is used also matters if you want to do some fine
> > > tunning of DCXO (control register has pletny of options), but that's probably
> > > better done in u-boot. And there's still no need to read HOSC source from DT.
> > > The driver can just check compatible, and if it is H6 and OSC_CLK_SRC_SEL is 1,
> > > it can do it's DCXO tunning, or whatever. But neither OS nor bootloader will
> > > be using this info to gate/disable the osciallator.
> > > 
> > 
> > It is actually useful to be able to tweak the crystal tuning at
> > runtime to be able to reduce clock drift and compare with a reliable
> > source (e.g. NTP).
> 
> I don't think there's a Linux kernel API that you can use to achieve that, so
> that's a rather theoretical concern at the moment.
> 

There is /sys/class/rtc/rtcX/offset which is even properly documented.

The reason I asked is that some RTCs have both analog (changing the
oscillator capacitance) and digital (changing the RTC counter) so I'm
wondering whether this interface should be extended.

> Also there are multiple clocks, that can drive the RTC, and you usually don't
> drive it from 24MHz DCXO oscillator. The reason is that you'd have to deal with
> the fact that the clock for RTC then becomes 24000000/750 (750 is fixed
> divider), which is 32000.
> 
> So if you want to get 32768Hz for RTC by tuning the DCXO, it would have to have
> 24 576 000 Hz. And even if you could achieve that (doubtful), it would throw off
> timings in the rest of the system (say UART, USB, CPU, display ctl) in a major way.
> 
> I guess you can try tuning 24MHz oscillator so that it's closer to the
> real-world 24MHz via NTP reference for other reasons. But it would be
> complicated, and require precise interaction with other components, like using
> HW timers sourced from 24MHz HOSC clock, because you can't use CPU's timers,
> because of inaccuracies introduced during DVFS, for example.
> 
> regards,
> 	o.
> 
> > I'm curious, what kind of options does this RTC have?
> > 
> > -- 
> > Alexandre Belloni, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
