Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6922D3965
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Dec 2020 05:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbgLIECj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Dec 2020 23:02:39 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:45517 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgLIECj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Dec 2020 23:02:39 -0500
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id DC159240003;
        Wed,  9 Dec 2020 04:01:55 +0000 (UTC)
Date:   Wed, 9 Dec 2020 05:01:55 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch 0/8] ntp/rtc: Fixes and cleanups
Message-ID: <20201209040155.GB1245199@piout.net>
References: <20201206214613.444124194@linutronix.de>
 <87sg8f24zf.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sg8f24zf.fsf@nanos.tec.linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/12/2020 01:33:08+0100, Thomas Gleixner wrote:
> Alexandre,
> 
> On Sun, Dec 06 2020 at 22:46, Thomas Gleixner wrote:
> > Miroslav ran into a situation where the periodic RTC synchronization almost
> > never was able to hit the time window for the update. That happens due the
> > usage of delayed_work and the properties of the timer wheel.
> >
> > While that particular problem is halfways simple to fix this started to
> > unearth other problems with that code particularly with rtc_set_npt_time()
> > but expanded into other things as well.
> >
> >   1) The update offset for rtc-cmos is off by a full second
> >
> >   2) The readout of MC146818 (rtc-cmos and arch code) is broken and can
> >      return garbage.
> >
> >   2) Alexandre questioned the approach in general and wants to get rid of
> >      it. Of course there are better methods to do that and it can be
> >      completely done in user space.
> >
> >      Unfortunately it's not that simple as this would be a user visible
> >      change, so making it at least halfways correct.
> >
> >   3) Alexandre requested to move that code into the NTP code as this is not
> >      really RTC functionality and just usage of the RTC API.
> >
> >   4) The update offset itself was questioned, but the time between the
> >      write and the next seconds increment in the RTC is fundamentaly a
> >      hardware property. The transport time, which is pretty irrelevant for
> >      direct accessible RTCs (rtc-cmos), but relevant for RTC behind i2c/SPI
> >      needs to be added on top.
> >
> >      It's undebated that this transport time cannot be correctly estimated,
> >      but right now it's 500ms which is far off. The correct transport time
> >      can be calibrated, a halfways correct value supplied via DT, but
> >      that's an orthogonal problem.
> >
> > The following series addresses the above:
> >
> >     1) Fix the readout function of MC146818
> >     2) Fix the rtc-cmos offset
> >     3) Reduce the default transport time
> >
> >     4) Switch the NTP periodic sync code to a hrtimer/work combo
> >
> >     5) Move rtc_set_npt_time() to the ntp code
> >     6) Make the update offset more intuitive
> >     7) Simplify the whole machinery
> 
> any opinion on this?
> 

This looks very good to me, however, I think the 10ms offset is a bit
too much. Do you mind waiting one or two days so I can get my test setup
back up?


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
