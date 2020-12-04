Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA4B82CEB6E
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Dec 2020 10:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387612AbgLDJwW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Dec 2020 04:52:22 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:54397 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387601AbgLDJwV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Dec 2020 04:52:21 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8EE29FF810;
        Fri,  4 Dec 2020 09:51:38 +0000 (UTC)
Date:   Fri, 4 Dec 2020 10:51:38 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
Message-ID: <20201204095138.GG74177@piout.net>
References: <87a6uwdnfn.fsf@nanos.tec.linutronix.de>
 <20201202205418.GN5487@ziepe.ca>
 <874kl3eu8p.fsf@nanos.tec.linutronix.de>
 <87zh2vd72z.fsf@nanos.tec.linutronix.de>
 <20201203021047.GG3544@piout.net>
 <87pn3qdhli.fsf@nanos.tec.linutronix.de>
 <20201203161622.GA1317829@ziepe.ca>
 <87zh2ubny2.fsf@nanos.tec.linutronix.de>
 <20201203220027.GB74177@piout.net>
 <87im9hc3u2.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87im9hc3u2.fsf@nanos.tec.linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/12/2020 10:34:13+0100, Thomas Gleixner wrote:
> On Thu, Dec 03 2020 at 23:00, Alexandre Belloni wrote:
> > On 03/12/2020 22:05:09+0100, Thomas Gleixner wrote:
> >> 2) I2C/SPI ...
> >> 
> >>    tsched t0                 t1                     t2
> >>           transfer(newsec)   RTC update (newsec)    RTC increments seconds
> >> 
> >>    Lets assume that ttransfer = t1 - t0 is known.
> >
> > Note that ttransfer is one of the reason why setting set_offset_nsec
> > from the RTC driver is not a good idea. The same RTC may be on busses
> > with different rates and there is no way to know that. I think that was
> > one of my objections at the time.
> >
> > ttransfer is not a function of the RTC model but rather of how it is
> > integrated in the system.
> 
> Yes, but it's the right place to store that information.
> 
> It's a fundamental problem of the RTC driver because that's the one
> which has to be able to tell the caller about it. The caller has
> absolutely no way to figure it out because it does not even know what
> type of RTC is there.
> 
> So either the RTC knows the requirements for tsched, e.g. the MC14xxx
> datasheet, or it can retrieve that information from DT or by querying
> the underlying bus mechanics for the xfer time estimate or just by
> timing an xfer for reference.
> 

What I do from userspace is that the caller is the one estimating the
transfer time and this works very well. I really think that the ntp code
could do just the same.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
