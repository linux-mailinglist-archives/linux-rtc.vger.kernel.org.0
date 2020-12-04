Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1DDF2CF066
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Dec 2020 16:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728727AbgLDPJl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Dec 2020 10:09:41 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:51293 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbgLDPJl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Dec 2020 10:09:41 -0500
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id D1BE120000C;
        Fri,  4 Dec 2020 15:08:57 +0000 (UTC)
Date:   Fri, 4 Dec 2020 16:08:57 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
Message-ID: <20201204150857.GJ74177@piout.net>
References: <20201203021047.GG3544@piout.net>
 <87pn3qdhli.fsf@nanos.tec.linutronix.de>
 <20201203161622.GA1317829@ziepe.ca>
 <87zh2ubny2.fsf@nanos.tec.linutronix.de>
 <87wnxybmqx.fsf@nanos.tec.linutronix.de>
 <20201203223646.GA1335797@ziepe.ca>
 <877dpxbu66.fsf@nanos.tec.linutronix.de>
 <20201204140819.GX5487@ziepe.ca>
 <20201204143735.GI74177@piout.net>
 <20201204144659.GY5487@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204144659.GY5487@ziepe.ca>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/12/2020 10:46:59-0400, Jason Gunthorpe wrote:
> > If you want to read an RTC accurately, you don't want to time a read,
> > what you want is to time an alarm. This is a common misconception and
> > is, again, why hctosys in its current state is not useful.
> 
> I mean literatally time the excution of something like a straight
> read. This will give some estimate of the bus latency and it should
> linearly relate to the bus latency for a write.
> 

It doesn't, some rtc will require writing dozen registers to set the
time and reading only 3 to get the time, the only accurate way is to
really time setting the time. You set the RTC time once, set up an alarm for
the next second, once you get the alarm, you get system time and you now
how far you are off.

Notice that systohc could do that if you wanted to be accurate and then
the whole issue with mc146818 is gone and this nicely solves it for all
the RTCs at once.

> The driver could time configuring an alarm as well, if it likes.

The driver should definitively not have to do the timing. the core,
maybe but I won't go over the 165 drivers to add timing.

> 
> > And because people using systohc are definitively using hctosys, this
> > will still result in an up to 500ms error in the current time.
> > As said, the price to pay for a proper solution will be an up to one
> > second delay when booting which is not acceptable for most users.
> 
> IIRC I had fixed this in some embedded system long ago by having
> hctosys reading seconds time during boot, then in parallel using the
> 'up to one second' method to get the sub-second resolution.
> 
> This means there was a sub second non-monotonicity in the realtime
> clock, but the system was designed to tolerate this as it also ran a
> modified NTP which would unconditionally step the clock on first sync
> if it was over .1s out of alignment.
> 
> The goal was to bring the system to correct time as quickly as
> possible in as many cases as possible, not to maintain the
> monotonicity of the realtime clock.
> 

I'm really curious, in your use case, couldn't you have read the RTC
from userspace and set the system time from there, right before starting
NTP and other applications?
Doing so, you would have probably been able to ensure monotonicity.

> > Is "fixing" systohc worth the effort and the maintenance cost?
> 
> As I said before, if there is no desire to address the read side then
> the whole thing should be abandoned.
> 

What was your plan back in 2017?

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
