Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E84C2D6C98
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Dec 2020 01:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403974AbgLKAaQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Dec 2020 19:30:16 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:36653 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393615AbgLKA3l (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Dec 2020 19:29:41 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0E0F8FF803;
        Fri, 11 Dec 2020 00:28:51 +0000 (UTC)
Date:   Fri, 11 Dec 2020 01:28:51 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch 4/8] rtc: core: Make the sync offset default more
 realistic
Message-ID: <20201211002851.GB1781038@piout.net>
References: <20201206214613.444124194@linutronix.de>
 <20201206220541.960333166@linutronix.de>
 <20201210235908.GA1781038@piout.net>
 <87czzhi40y.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87czzhi40y.fsf@nanos.tec.linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/12/2020 01:23:57+0100, Thomas Gleixner wrote:
> Alexandre,
> 
> On Fri, Dec 11 2020 at 00:59, Alexandre Belloni wrote:
> > On 06/12/2020 22:46:17+0100, Thomas Gleixner wrote:
> >>  	/* Drivers can revise this default after allocating the device. */
> >> -	rtc->set_offset_nsec =  NSEC_PER_SEC / 2;
> >> +	rtc->set_offset_nsec =  10 * NSEC_PER_MSEC;
> >
> > I did retest, on a slow 100kHz i2c bus, with a fairly inconvenient RTC,
> > The maximum offset to set the RTC was 4845533ns so I'd say 10ms is too
> > large. Should we make that 5ms ?
> 
> Sure. As I said I pulled the 10 out of thin air.
> 
> > Apart from that, on the series, you can add my
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> I'll amend the s/10/5/ throughout the series while queueing the whole
> pile in the timers/core branch unless you want it to be handled
> differently.
> 

That's fine for me.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
