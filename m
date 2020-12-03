Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7AC2CDAD7
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Dec 2020 17:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgLCQIi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Dec 2020 11:08:38 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:34869 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbgLCQIi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Dec 2020 11:08:38 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E9C226000A;
        Thu,  3 Dec 2020 16:07:53 +0000 (UTC)
Date:   Thu, 3 Dec 2020 17:07:53 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
Message-ID: <20201203160753.GB7535@piout.net>
References: <20201201171420.GN1900232@localhost>
 <20201201173540.GH5487@ziepe.ca>
 <87mtywe2zu.fsf@nanos.tec.linutronix.de>
 <20201202162723.GJ5487@ziepe.ca>
 <87a6uwdnfn.fsf@nanos.tec.linutronix.de>
 <20201202205418.GN5487@ziepe.ca>
 <874kl3eu8p.fsf@nanos.tec.linutronix.de>
 <87zh2vd72z.fsf@nanos.tec.linutronix.de>
 <20201203021047.GG3544@piout.net>
 <20201203155249.GT5487@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203155249.GT5487@ziepe.ca>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 03/12/2020 11:52:49-0400, Jason Gunthorpe wrote:
> On Thu, Dec 03, 2020 at 03:10:47AM +0100, Alexandre Belloni wrote:
> 
> > IIRC, used in conjunction with rtc_hctosys which also adds
> > inconditionnaly 500ms this can ends up with the system time
> > being one second away from the wall clock time which NTP will take quite
> > some time to remove.
> 
> I can't remember the details, but this was not the intention. 
> 
> As long as systohc and hctosys exist then the design goal of rtclib
> should be to provide sub-second accuracy on the round trip of time
> through the RTC.
> 
> Otherwise what is the point?
> 

hctosys never had a sub second accuracy because there is no way to
accurately read the rtc time without being ready to wait up to a second.
I have patches doing exactly that but I'm pretty sure nobody wants to
pay the price and have a kernel that boots significantly slower.
Especially since that would basically affect everyone since systemd
requires that hctosys is enabled.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
