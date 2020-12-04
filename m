Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8B452CEFC6
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Dec 2020 15:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730284AbgLDOiS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Dec 2020 09:38:18 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:40271 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgLDOiS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Dec 2020 09:38:18 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 07B50C000D;
        Fri,  4 Dec 2020 14:37:35 +0000 (UTC)
Date:   Fri, 4 Dec 2020 15:37:35 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
Message-ID: <20201204143735.GI74177@piout.net>
References: <874kl3eu8p.fsf@nanos.tec.linutronix.de>
 <87zh2vd72z.fsf@nanos.tec.linutronix.de>
 <20201203021047.GG3544@piout.net>
 <87pn3qdhli.fsf@nanos.tec.linutronix.de>
 <20201203161622.GA1317829@ziepe.ca>
 <87zh2ubny2.fsf@nanos.tec.linutronix.de>
 <87wnxybmqx.fsf@nanos.tec.linutronix.de>
 <20201203223646.GA1335797@ziepe.ca>
 <877dpxbu66.fsf@nanos.tec.linutronix.de>
 <20201204140819.GX5487@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204140819.GX5487@ziepe.ca>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/12/2020 10:08:19-0400, Jason Gunthorpe wrote:
> On Fri, Dec 04, 2020 at 02:02:57PM +0100, Thomas Gleixner wrote:
> 
> > No magic sign calculation required if you look at it from the actual
> > timeline and account the time between write and next second increment
> > correctly.
> 
> Yes, it is equivalent to break things into two values, and does look
> to be more understandable as one can read at least one of the values
> from a datasheet and the other could be estimated by timing a read
> clock
> 

If you want to read an RTC accurately, you don't want to time a read,
what you want is to time an alarm. This is a common misconception and
is, again, why hctosys in its current state is not useful.

And because people using systohc are definitively using hctosys, this
will still result in an up to 500ms error in the current time.
As said, the price to pay for a proper solution will be an up to one
second delay when booting which is not acceptable for most users.

Is "fixing" systohc worth the effort and the maintenance cost?

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
