Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0CB72CF200
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Dec 2020 17:36:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgLDQgd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Dec 2020 11:36:33 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:60009 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726309AbgLDQgd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Dec 2020 11:36:33 -0500
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6620820000D;
        Fri,  4 Dec 2020 16:35:50 +0000 (UTC)
Date:   Fri, 4 Dec 2020 17:35:50 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
Message-ID: <20201204163550.GL74177@piout.net>
References: <20201203161622.GA1317829@ziepe.ca>
 <87zh2ubny2.fsf@nanos.tec.linutronix.de>
 <87wnxybmqx.fsf@nanos.tec.linutronix.de>
 <20201203223646.GA1335797@ziepe.ca>
 <877dpxbu66.fsf@nanos.tec.linutronix.de>
 <20201204140819.GX5487@ziepe.ca>
 <20201204143735.GI74177@piout.net>
 <20201204144659.GY5487@ziepe.ca>
 <20201204150857.GJ74177@piout.net>
 <20201204155708.GB5487@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204155708.GB5487@ziepe.ca>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/12/2020 11:57:08-0400, Jason Gunthorpe wrote:
> On Fri, Dec 04, 2020 at 04:08:57PM +0100, Alexandre Belloni wrote:
> 
> > > I mean literatally time the excution of something like a straight
> > > read. This will give some estimate of the bus latency and it should
> > > linearly relate to the bus latency for a write.
> > 
> > 
> > It doesn't, some rtc will require writing dozen registers to set the
> > time and reading only 3 to get the time, the only accurate way is to
> > really time setting the time. You set the RTC time once, set up an alarm for
> > the next second, once you get the alarm, you get system time and you now
> > how far you are off.
> 
> This is why I said linearly related. Yes the relation is per-driver,
> based on the ops required, but in principle it can get close.
> 
> > Notice that systohc could do that if you wanted to be accurate and then
> > the whole issue with mc146818 is gone and this nicely solves it for all
> > the RTCs at once.
> 
> Another good solution is to have systohc progam the time and then
> immediately read it back (eg with an alarm).

This is what I was suggesting, with an alarm.

> The difference between
> the read back and the system RTC is the single value to plug into the
> adjustment offset and naturally includes all the time factors Thomas
> identified, including the additional factor of 'latency to read the
> time'

There is no 'latency to read the time' because you don't have to read
the time. You already know what the time will be when the alarm fires.
That is when you read the system time and you can figure out what the
offset is. But you never need to read the time.

[...]

> I see I also changed jobs right around then which probably explains
> why things stopped at this one patch. The fact nobody else picked it
> up probably says people really just don't care about realtime
> accuracy.

Or those that do care do it from userspace.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
