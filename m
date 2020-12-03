Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930532CDC61
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Dec 2020 18:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgLCRaF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Dec 2020 12:30:05 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:14789 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgLCRaF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Dec 2020 12:30:05 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4D4C624000D;
        Thu,  3 Dec 2020 17:29:20 +0000 (UTC)
Date:   Thu, 3 Dec 2020 18:29:19 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
Message-ID: <20201203172919.GC7535@piout.net>
References: <20201201171420.GN1900232@localhost>
 <20201201173540.GH5487@ziepe.ca>
 <87mtywe2zu.fsf@nanos.tec.linutronix.de>
 <20201202162723.GJ5487@ziepe.ca>
 <87a6uwdnfn.fsf@nanos.tec.linutronix.de>
 <20201202205418.GN5487@ziepe.ca>
 <874kl3eu8p.fsf@nanos.tec.linutronix.de>
 <87zh2vd72z.fsf@nanos.tec.linutronix.de>
 <20201203021047.GG3544@piout.net>
 <87pn3qdhli.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pn3qdhli.fsf@nanos.tec.linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 03/12/2020 16:39:21+0100, Thomas Gleixner wrote:
> Alexandre,
> 
> On Thu, Dec 03 2020 at 03:10, Alexandre Belloni wrote:
> > On 03/12/2020 02:14:12+0100, Thomas Gleixner wrote:
> >> That said, can somebody answer the one million dollar question which
> >> problem is solved by all of this magic nonsense?
> >> 
> > The goal was to remove the 500ms offset for all the RTCs but the
> > MC146818 because there are RTC that will reset properly their counter
> > when setting the time, meaning they can be set very precisely.
> 
> The MC setting is halfways precise. The write resets the divider chain
> and when the reset is removed then the next UIP will happen after the
> magic 0.5 seconds. So yes, writing it 500ms _before_ the next second is
> halfways correct assumed that there is no interference between
> ktime_get_real() and the actual write which is a silly assumption as the
> code is fully preemptible.
> 
> > IIRC, used in conjunction with rtc_hctosys which also adds
> > inconditionnaly 500ms this can ends up with the system time
> > being one second away from the wall clock time which NTP will take quite
> > some time to remove.
> 
> The rtc_cmos() driver has a fun comment in cmos_set_time()....
> 
> The logic in sync_cmos_clock() and rtc_set_ntp_time() is different as I
> pointed out: sync_cmos_clock() hands -500ms to rtc_tv_nsec_ok() and
> rtc_set_ntp_time() uses +500ms, IOW exactly ONE second difference in
> behaviour.
> 
> > Coincidentally, I was going to revert those patches for v5.11.
> 
> Which will break the rtc_cmos() driver in a different way. We should
> really fix that proper and just have the 500ms offset for rtc_cmos,
> aka. MC146818. When other drivers want a different offset, then they
> still can do so.
> 

My point was to get back to the previous situation where only
rtc_cmos was supposed to work properly by removing rtc_tv_nsec_ok and
set_offset_nsec.

> The direct /dev/rtc settime ioctl is not using that logic anyway. Thats
> the business of the user space application to get that straight which is
> scheduling lottery as well.

I still don't see how userspace is worse than systohc in that regard and
why we need to do that in the kernel. Especially since hctosys is doing
a very bad job trying to read the time from the RTC. You may as well not
bother with the 500ms and just set the time to the current or next
second.

And what about the non configurable 659 period, isn't that policy that
should be left to userspace configuration?

I'm still convinced that set_offset_nsec is not needed to set the time
accurately and I still want to remove it. Also, this may be a good time
to move systohc.c to kernel/time/ntp.c as this is definitively some NTP
specific code being an RTC consumer, very much like alarmtimer.c

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
