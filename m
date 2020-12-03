Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B772CCC4E
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Dec 2020 03:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727752AbgLCCLb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Dec 2020 21:11:31 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:37779 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgLCCLb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Dec 2020 21:11:31 -0500
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id F102B200002;
        Thu,  3 Dec 2020 02:10:47 +0000 (UTC)
Date:   Thu, 3 Dec 2020 03:10:47 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
Message-ID: <20201203021047.GG3544@piout.net>
References: <20201201143835.2054508-1-mlichvar@redhat.com>
 <20201201161224.GF5487@ziepe.ca>
 <20201201171420.GN1900232@localhost>
 <20201201173540.GH5487@ziepe.ca>
 <87mtywe2zu.fsf@nanos.tec.linutronix.de>
 <20201202162723.GJ5487@ziepe.ca>
 <87a6uwdnfn.fsf@nanos.tec.linutronix.de>
 <20201202205418.GN5487@ziepe.ca>
 <874kl3eu8p.fsf@nanos.tec.linutronix.de>
 <87zh2vd72z.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zh2vd72z.fsf@nanos.tec.linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Thomas,

I'll take more time to reply more in depth to the whole email but...

On 03/12/2020 02:14:12+0100, Thomas Gleixner wrote:
> Aside of that the magic correction of the time which is written to the
> RTC is completely bogus. Lets start with the interface and the two
> callers of it:
> 
> static inline bool rtc_tv_nsec_ok(s64 set_offset_nsec,
>                                   struct timespec64 *to_set,
>                                   const struct timespec64 *now)
> 
> The callers are:
> 
>   sync_cmos_clock()   /* The legacy RTC cruft */
>     struct timespec64 now;
>     struct timespec64 adjust;
>     long target_nsec = NSEC_PER_SEC / 2;
> 
>     ktime_get_real_ts64(&now);
>     if (rtc_tv_nsec_ok(-1 * target_nsec, &adjust, &now)) {
>        if (persistent_clock_is_local)
> 	  adjust.tv_sec -= (sys_tz.tz_minuteswest * 60);
>        rc = update_persistent_clock64(adjust);
>     } 
>        
>   sync_rtc_clock()
>     unsigned long target_nsec;          <- Signed unsigned ....
>     struct timespec64 adjust, now;
> 
>     ktime_get_real_ts64(&now);
> 
>     adjust = now;                       <- Why the difference to the above?
> 
>     if (persistent_clock_is_local)      <- Again, why is the ordering different?
> 	adjust.tv_sec -= (sys_tz.tz_minuteswest * 60);
>     
>     rc = rtc_set_ntp_time(adjust, &target_nsec)
>        // int rtc_set_ntp_time(struct timespec64 now, unsigned long *target_nsec)
> 
>          struct timespec64 to_set;
> 
> 	 set_normalized_timespec64(&to_set, 0, -rtc->set_offset_nsec);
> 	 *target_nsec = to_set.tv_nsec;      <- target_nsec = rtc->set_offset_nsec
>                                                 because the timespec is normalized
>                                                 ergo == rtc->set_offset_nsec
>                                                 unless the set_offset_nsec would
>                                                 be negative which makes at all.
> 
>          if (rtc_tv_nsec_ok(rtc->set_offset_nsec, &to_set, &now))
>          	update_rtc(...);
> 
> So sync_cmos_clock hands in -(NSEC_PER_SEC/2) and the rtc cruft hands in
> NSEC_PER_SEC/2 by default. The comment in drivers/rtc/class.c says:
> 
> drivers/rtc/class.c-    /* Drivers can revise this default after allocating the device. */
> drivers/rtc/class.c:    rtc->set_offset_nsec =  NSEC_PER_SEC / 2;
> 
> but no driver ever bothered to change that value. Also the idea of
> having this offset as type s64 is beyond my understanding. Why the heck
> would any RTC require to set an offset which is _after_ the second
> transition.
> 

This (no driver making use of set_offset_nsec) happened because it got
applied without me agreeing to the change. I did complain at the time
and RMK walked away.

[...]

> That said, can somebody answer the one million dollar question which
> problem is solved by all of this magic nonsense?
> 

The goal was to remove the 500ms offset for all the RTCs but the
MC146818 because there are RTC that will reset properly their counter
when setting the time, meaning they can be set very precisely.

IIRC, used in conjunction with rtc_hctosys which also adds
inconditionnaly 500ms this can ends up with the system time
being one second away from the wall clock time which NTP will take quite
some time to remove.

> If anyone involved seriously believes that any of this solves a real
> world problem, then please come forth an make your case.
> 
> If not, all of this illusionary attempts to be "correct" can be removed
> for good and the whole thing reduced to a
> 
>     update_rtc_plus_minus_a_second()
> 
> mechanism, which is exactly what we have today just without the code
> which pretends to be *exact* or whatever.
> 

Coincidentally, I was going to revert those patches for v5.11. Also,
honestly, I still don't understand why the kernel needs to set the RTC
while userspace is very well equipped to do that. chrony is able to set
the RTC time and it can do so precisely. It can even compute how that RTC is
time drifting and that value can already be used to adjust the RTC
crystal.

From my tests, with some efforts, userspace can set the RTC time with a
20µs precision, even on low end systems. To do so, it doesn't need
set_offset_nsec.

I also don't like hctosys, it is currently wrong but I can see use cases
and now systemd relies on its presence so my plan is to fix it.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
