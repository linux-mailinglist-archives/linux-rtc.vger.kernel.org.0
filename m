Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE232CE143
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Dec 2020 23:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729333AbgLCWBL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Dec 2020 17:01:11 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:50607 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgLCWBL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Dec 2020 17:01:11 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 9CE9340007;
        Thu,  3 Dec 2020 22:00:27 +0000 (UTC)
Date:   Thu, 3 Dec 2020 23:00:27 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
Message-ID: <20201203220027.GB74177@piout.net>
References: <87mtywe2zu.fsf@nanos.tec.linutronix.de>
 <20201202162723.GJ5487@ziepe.ca>
 <87a6uwdnfn.fsf@nanos.tec.linutronix.de>
 <20201202205418.GN5487@ziepe.ca>
 <874kl3eu8p.fsf@nanos.tec.linutronix.de>
 <87zh2vd72z.fsf@nanos.tec.linutronix.de>
 <20201203021047.GG3544@piout.net>
 <87pn3qdhli.fsf@nanos.tec.linutronix.de>
 <20201203161622.GA1317829@ziepe.ca>
 <87zh2ubny2.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zh2ubny2.fsf@nanos.tec.linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 03/12/2020 22:05:09+0100, Thomas Gleixner wrote:
> 2) I2C/SPI ...
> 
>    tsched t0                 t1                     t2
>           transfer(newsec)   RTC update (newsec)    RTC increments seconds
> 
>    Lets assume that ttransfer = t1 - t0 is known.

Note that ttransfer is one of the reason why setting set_offset_nsec
from the RTC driver is not a good idea. The same RTC may be on busses
with different rates and there is no way to know that. I think that was
one of my objections at the time.

ttransfer is not a function of the RTC model but rather of how it is
integrated in the system.

> 
>    tinc is the same as above = t2 - t1
> 
>    Again, lets assume that the event is accurate for now and ignore the fuzz
>    logic, i.e. tsched == t0
> 
>    So tsched has to be ttot = t2 - t0 _before_ wallclock reaches t2 and
>    increments seconds.
> 

I had a rough week and I'm probably not awake enough to follow
completely but is that thinking correct?

For the mc146818, you have t1 - t0 which is probably negligible and t2 -
T& == 500 ms

For most of the other RTCs, you have t1 - t0 is somewhat important,
probably around 100 to 150µs and t2 - t1 is 1s. I would think that what
is needed is tsched has to be t1-t0 before wallclock reaches t1. In that
case t2 doesn't matter, it will always be 1s after t1.

>    In this case newsec = t1.tv_sec = (t0 + ttransfer).tv_sec
> 
>    So now the fuzz logic for this is:
> 
>       newtime = t0 + ttransfer;
> 
>       if (newtime.tv_nsec < FUZZ)
>           newsec = newtime.tv_sec;
>       else if (newtime.tv_nsec > NSEC_PER_SEC - FUZZ)
>           newsec = newtime.tv_sec + 1;
>       else
>           goto fail;
> 
>    Again the first condition handles the case where t1 >= tsched and the
>    second one where t1 < tsched.
> 
> So now we have two options to fix this:
> 
>    1) Use a negative sync_offset for devices which need #1 above
>       (rtc_cmos & similar)
> 
>       That requires setting tsched to t2 - abs(sync_offset)
> 
>    2) Use always a positive sync_offset and a flag which tells
>       rtc_tv_nsec_ok() whether it needs to add or subtract.
> 
> #1 is good enough. All it takes is a comment at the timer start code why
> abs() is required.
> 
> Let me hack that up along with the hrtimer muck.
> 
> Thanks,
> 
>         tglx

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
