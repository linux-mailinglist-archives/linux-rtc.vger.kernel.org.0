Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 168822CCB79
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Dec 2020 02:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbgLCBO4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Dec 2020 20:14:56 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:37234 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727128AbgLCBO4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Dec 2020 20:14:56 -0500
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1606958053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JqogfsSDrzDV4HnHO2KejkVImIk7dhZjvubsW6587GU=;
        b=41HA9V/NhaK7QpsX20YMf2PPUQcjL80wFwpZztv08SwBPqZ3sw07H2L6ZWT5L47YDpigDd
        Gt614hkznVF6lsvcmoo0FrYQnmxrHke0o8ZhruJe+6UK2kxRvDAr6Gb2s/GeDvHx/pPPsr
        Tnc/dwKfKjqoLMygNwSj3KnZ0DOWMFmZo8YC82gDRPaa66w4pibgJ+UCZsxCMhOMLoEhkZ
        Jtfe2keZKlP5kCVjQBUAvNX+4jPB8Ou7mRYIsbIa18nrJwJ9AaHwrjH4C2HEU0dhR3huqv
        WsMfPQ0uM6x6s4SpeAmfk8pyP8tStWAJFkJO077jfw8DWy0C+GWtC7it5SV8Vw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1606958053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JqogfsSDrzDV4HnHO2KejkVImIk7dhZjvubsW6587GU=;
        b=LzO0N+YsfAIM5OzywDD6affMFnWMMK9nqq/ur2o2tlsRqsQGSMilgsHailVjT2U14ET0Rc
        8aDN274QzNCezKBA==
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
In-Reply-To: <874kl3eu8p.fsf@nanos.tec.linutronix.de>
References: <20201201143835.2054508-1-mlichvar@redhat.com> <20201201161224.GF5487@ziepe.ca> <20201201171420.GN1900232@localhost> <20201201173540.GH5487@ziepe.ca> <87mtywe2zu.fsf@nanos.tec.linutronix.de> <20201202162723.GJ5487@ziepe.ca> <87a6uwdnfn.fsf@nanos.tec.linutronix.de> <20201202205418.GN5487@ziepe.ca> <874kl3eu8p.fsf@nanos.tec.linutronix.de>
Date:   Thu, 03 Dec 2020 02:14:12 +0100
Message-ID: <87zh2vd72z.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


Cc+ RTC folks.

On Wed, Dec 02 2020 at 23:08, Thomas Gleixner wrote:
> On Wed, Dec 02 2020 at 16:54, Jason Gunthorpe wrote:
>>> I don't think the timer should be canceled if the ntp_synced() state did
>>> not change. Otherwise every do_adtimex() call will cancel/restart
>>> it, which does not make sense. Lemme stare at it some more.
>>
>> That makes sense, being conditional on the STA_UNSYNC prior to doing
>> any hrtimer_start seems OK?
>
> Yeah.

And I was staring at it some more. TBH, rtc_tv_nsec_ok() is pretty much
voodoo and wishful thinking.

The point is that the original MC146818 has an update cycle once per
second. That's what mc146818_is_updating() is checking.

Lets start right here. mc146818_get_time() is bonkers to begin with. It
does:

        if (mc146818_is_updating())
        	mdelay(20);

        lock(&rtc_lock);
        read_stuff();
        unlock(&rtc_lock);

That's crap, really.

The MC146818 does a periodic update of the time data once per second and
it advertises it via the UIP bit in Register A. The UIP bit is set 244us
_before_ the update starts and depending on the time base is takes
either 248us or 1984us (32kHz) until the bit goes low again.

So let's look at the time line assuming a 32kHz time base:

Time 0.000s           ~0.998s  1.0s
                         |     | 
                          _____
UIP  ____________________|     |_______

Let's look at the code again and annotate it with time stamps:

0.997  read()
          if (mc146818_is_updating())
             lock(rtc);
             read(regA);
             unlock(rtc);
             return regA & UIP;         <- Lets assume FALSE

0.998 -> whatever happens (SMI, NMI, interrupt, preemption ...)

0.999    lock(rtc)
         read_data()                    <- Result is undefined
                                           because RTC is in the
                                           middle of the update
         unlock(rtc);

Seriously...

The comment above the if(...updating()) is full of wishful thinking:

       /*
        * read RTC once any update in progress is done. The update
        * can take just over 2ms. We wait 20ms. There is no need to
        * to poll-wait (up to 1s - eeccch) for the falling edge of RTC_UIP.
        * If you need to know *exactly* when a second has started, enable
        * periodic update complete interrupts, (via ioctl) and then
        * immediately read /dev/rtc which will block until you get the IRQ.
        * Once the read clears, read the RTC time (again via ioctl). Easy.
        */

 - The update can take exactly up to 1984us, which is not just over 2ms.
   Also the update starts 248us _after_ UIP goes high.

 - Wait 20ms? What for? To make sure that the RTC has advanced by 2ms?

 - Poll wait for the falling edge of UIP takes up to 1s?

   I must have missed something in basic math. If UIP is high then
   waiting for the falling edge takes at max 2ms.
   
   I know what the comment tries to say, but on the first read I had one
   of those forbidden-by-CoC moments.

 - The need to know *exactly* part of the comment is even more amazing.

   Q: Which system guarantees that the interrupt:

     - will not happen _before_ read(/dev/rtc) after the ioctl() enabled
       it?

     - will be delivered without delay ?

     - will make sure that the task in the blocking read will be
       scheduled immediately and then do the ioctl based readout ?

   A: None

   Q: What is *exact* about this?

   A: Nothing at all.

So the right thing to do here is:

read()
  do {
       lock(rtc)
       start = ktime_get();
       if (read(regA) & UIP) {
          unlock(rtc);
          wait(2ms);
          continue;
       }
       read_data();
       end = ktime_get();
       unlock(rtc);
  while (end - start > 2ms);

and return _all_ three values (start, end, rtcdata) so clueful userspace
can make sense of it. Returning nonsense as pointed off above is a non
option.

Hmm?

Now to the write side. That's really wishful thinking. Let's look at the
code:

write()

   lock(rtc);
   write(regB, read(reagB) | SET);
   write_data();
   write(regB, read(reagB) & ~SET);
   unlock(rtc);

lock/unlock are irrelevant as they just serialize concurrent access to
the RTC.

The magic comment in ntp.c says that RTC will update the written value
0.5 seconds after writing it. That's pure fiction...

I have no idea where this comes from, but any spec out there says about
this:

  SET - When the SET bit is a "0", the update cycle functions normally
  by advancing the counts once-per-second. When the SET bit is written
  to a "1", any update cycle in progress is aborted and the program may
  initialize the time and calendar bytes without an update occuring in
  the midst of initializing. .....

So yes, the comment is partially correct _if_ and only _if_ the time
base which schedules the update is exactly the same time base as the RTC
time base and the time on which the update is scheduled is perfectly in
sync with the RTC time base.

Plus the update must be completed _before_ then next update cycle of the
RTC starts which is what the 0.5 sec offset is trying to solve. Emphasis
on _trying_.

But with NTP that's not the case at all. The clocksource which is
adjusted by NTP (usually TSC on x86, but that does not matter) is not at
all guaranteed to run from the same crystal as the RTC.  On most systems
the RTC has a seperate crystal which feeds it across poweroff.

Even if it _is_ using the same crystal, then the NTP adjustments are
going to skew the clocksource frequency against the underlying crystal
which feeds the RTC and the clocksource.

Q: So how can any assumption about update cycle correlatation between NTP
   synced CLOCK_REALTIME and the RTC notion of clock realtime be correct?

A: Not at all.

Aside of that the magic correction of the time which is written to the
RTC is completely bogus. Lets start with the interface and the two
callers of it:

static inline bool rtc_tv_nsec_ok(s64 set_offset_nsec,
                                  struct timespec64 *to_set,
                                  const struct timespec64 *now)

The callers are:

  sync_cmos_clock()   /* The legacy RTC cruft */
    struct timespec64 now;
    struct timespec64 adjust;
    long target_nsec = NSEC_PER_SEC / 2;

    ktime_get_real_ts64(&now);
    if (rtc_tv_nsec_ok(-1 * target_nsec, &adjust, &now)) {
       if (persistent_clock_is_local)
	  adjust.tv_sec -= (sys_tz.tz_minuteswest * 60);
       rc = update_persistent_clock64(adjust);
    } 
       
  sync_rtc_clock()
    unsigned long target_nsec;          <- Signed unsigned ....
    struct timespec64 adjust, now;

    ktime_get_real_ts64(&now);

    adjust = now;                       <- Why the difference to the above?

    if (persistent_clock_is_local)      <- Again, why is the ordering different?
	adjust.tv_sec -= (sys_tz.tz_minuteswest * 60);
    
    rc = rtc_set_ntp_time(adjust, &target_nsec)
       // int rtc_set_ntp_time(struct timespec64 now, unsigned long *target_nsec)

         struct timespec64 to_set;

	 set_normalized_timespec64(&to_set, 0, -rtc->set_offset_nsec);
	 *target_nsec = to_set.tv_nsec;      <- target_nsec = rtc->set_offset_nsec
                                                because the timespec is normalized
                                                ergo == rtc->set_offset_nsec
                                                unless the set_offset_nsec would
                                                be negative which makes at all.

         if (rtc_tv_nsec_ok(rtc->set_offset_nsec, &to_set, &now))
         	update_rtc(...);

So sync_cmos_clock hands in -(NSEC_PER_SEC/2) and the rtc cruft hands in
NSEC_PER_SEC/2 by default. The comment in drivers/rtc/class.c says:

drivers/rtc/class.c-    /* Drivers can revise this default after allocating the device. */
drivers/rtc/class.c:    rtc->set_offset_nsec =  NSEC_PER_SEC / 2;

but no driver ever bothered to change that value. Also the idea of
having this offset as type s64 is beyond my understanding. Why the heck
would any RTC require to set an offset which is _after_ the second
transition.

That aside. Looking at the above two variants let's go into
rtc_tv_nsec_ok()

static inline bool rtc_tv_nsec_ok(s64 set_offset_nsec,
				  struct timespec64 *to_set,
				  const struct timespec64 *now)

	/* Allowed error in tv_nsec, arbitarily set to 5 jiffies in ns. */
	const unsigned long TIME_SET_NSEC_FUZZ = TICK_NSEC * 5;
	struct timespec64 delay = {.tv_sec = 0,
				   .tv_nsec = set_offset_nsec};

	*to_set = timespec64_add(*now, delay);

The scheduled point for both legacy CMOS and RTC modern is at the point
of the second minus 0.5 seconds (lets ignore that set_offset_nsec might
be different for this).

So let's assume the update was scheduled at 659s 500ms independent of
legacy or modern.

Now legacy does the following:

    struct timespec64 delay = { .tv_sec = 0, tv_nsec = -5e8 }

which is an not normalized timespec to begin with but

    *to_set = timespec64_add(*now , delay);

can deal with that. So the result of this computation is:

    now - delay

IOW, 0.5 seconds before now: 659s 0ms

Now the same magic for the 'modern' RTC will do:

    struct timespec64 delay = { .tv_sec = 0, tv_nsec = 5e8 }

so the result of the add is:

   now + delay

IOW, 0.5 seconds _after_ now: 700s 0ms

Can you spot the subtle difference?

That said, can somebody answer the one million dollar question which
problem is solved by all of this magic nonsense?

If anyone involved seriously believes that any of this solves a real
world problem, then please come forth an make your case.

If not, all of this illusionary attempts to be "correct" can be removed
for good and the whole thing reduced to a

    update_rtc_plus_minus_a_second()

mechanism, which is exactly what we have today just without the code
which pretends to be *exact* or whatever.

Thanks,

        tglx
