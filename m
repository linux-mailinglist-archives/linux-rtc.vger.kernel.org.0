Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85EC787513
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Aug 2019 11:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406008AbfHIJQ3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Aug 2019 05:16:29 -0400
Received: from vps.xff.cz ([195.181.215.36]:46522 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405641AbfHIJQ3 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 9 Aug 2019 05:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1565342186; bh=058fnVgEdld0XWcxrIoVMkGIvEFjKF/KELntlth1H7Y=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=QED54Z6SSAM6GpHg9GkeBumXygOE+uGYcbOUyEZ9cs3qsVjloPPJcPaoWwHrtpIsq
         98dW5idtdWYH3HUAO8Xn4vgDBzZhDR7Bv02o8SKJTsAafO6SXIZSriBzJmZV/HcfIQ
         BZIUIfh4poi+kviXd1y+WPaGI2SqNEYTghwjBE0Q=
Date:   Fri, 9 Aug 2019 11:16:26 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>,
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
Message-ID: <20190809091626.6kanjbmvbi4oipco@core.my.home>
Mail-Followup-To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        devicetree <devicetree@vger.kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org
References: <20190412120730.473-1-megous@megous.com>
 <CAGb2v66cbpsoHJoiFJkBwhZ5SbO+uO+Kf6gtnA3kPFQZq0329Q@mail.gmail.com>
 <20190806183045.edhm3qzpegscf2z7@core.my.home>
 <20190807105502.GK3600@piout.net>
 <20190808121237.g6twq2nh3sayu3vx@core.my.home>
 <20190808233930.GM3600@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190808233930.GM3600@piout.net>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Aug 09, 2019 at 01:39:30AM +0200, Alexandre Belloni wrote:
> On 08/08/2019 14:12:37+0200, Ondřej Jirman wrote:
> > On Wed, Aug 07, 2019 at 12:55:02PM +0200, Alexandre Belloni wrote:
> > > Hi,
> > > 
> > > On 06/08/2019 20:30:45+0200, Ondřej Jirman wrote:
> > > > Maybe whether XO or DCXO is used also matters if you want to do some fine
> > > > tunning of DCXO (control register has pletny of options), but that's probably
> > > > better done in u-boot. And there's still no need to read HOSC source from DT.
> > > > The driver can just check compatible, and if it is H6 and OSC_CLK_SRC_SEL is 1,
> > > > it can do it's DCXO tunning, or whatever. But neither OS nor bootloader will
> > > > be using this info to gate/disable the osciallator.
> > > > 
> > > 
> > > It is actually useful to be able to tweak the crystal tuning at
> > > runtime to be able to reduce clock drift and compare with a reliable
> > > source (e.g. NTP).
> > 
> > I don't think there's a Linux kernel API that you can use to achieve that, so
> > that's a rather theoretical concern at the moment.
> > 
> 
> There is /sys/class/rtc/rtcX/offset which is even properly documented.
> 
> The reason I asked is that some RTCs have both analog (changing the
> oscillator capacitance) and digital (changing the RTC counter) so I'm
> wondering whether this interface should be extended.

As I wrote below, that can't be achieved by tuning DCXO.

> > Also there are multiple clocks, that can drive the RTC, and you usually don't
> > drive it from 24MHz DCXO oscillator. The reason is that you'd have to deal with
> > the fact that the clock for RTC then becomes 24000000/750 (750 is fixed
> > divider), which is 32000.
> > 
> > So if you want to get 32768Hz for RTC by tuning the DCXO, it would have to have
> > 24 576 000 Hz. And even if you could achieve that (doubtful), it would throw off
> > timings in the rest of the system (say UART, USB, CPU, display ctl) in a major way.
> > 
> > I guess you can try tuning 24MHz oscillator so that it's closer to the
> > real-world 24MHz via NTP reference for other reasons. But it would be
> > complicated, and require precise interaction with other components, like using
> > HW timers sourced from 24MHz HOSC clock, because you can't use CPU's timers,
> > because of inaccuracies introduced during DVFS, for example.
> > 
> > regards,
> > 	o.
> > 
> > > I'm curious, what kind of options does this RTC have?
> > > 
> > > -- 
> > > Alexandre Belloni, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> > > 
> > > _______________________________________________
> > > linux-arm-kernel mailing list
> > > linux-arm-kernel@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> -- 
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
