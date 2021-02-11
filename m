Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 679EA319675
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Feb 2021 00:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhBKXRm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Feb 2021 18:17:42 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:47430 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbhBKXRm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 Feb 2021 18:17:42 -0500
X-Greylist: delayed 460 seconds by postgrey-1.27 at vger.kernel.org; Thu, 11 Feb 2021 18:17:41 EST
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 2AC2B9200B4; Fri, 12 Feb 2021 00:09:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 242799200B3;
        Fri, 12 Feb 2021 00:09:20 +0100 (CET)
Date:   Fri, 12 Feb 2021 00:09:20 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Gleixner <tglx@linutronix.de>
cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Serge Belyshev <belyshev@depni.sinp.msu.ru>,
        Dirk Gouders <dirk@gouders.net>,
        =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH V2] rtc: mc146818: Dont test for bit 0-5 in Register D
In-Reply-To: <87wnvrbmqx.fsf@nanos.tec.linutronix.de>
Message-ID: <alpine.DEB.2.21.2102120001450.35623@angie.orcam.me.uk>
References: <20201206214613.444124194@linutronix.de> <20201206220541.594826678@linutronix.de> <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net> <871re7hlsg.fsf@nanos.tec.linutronix.de> <98cb59e8-ecb4-e29d-0b8f-73683ef2bee7@digikod.net>
 <87y2gfg18p.fsf@nanos.tec.linutronix.de> <87tur3fx7w.fsf@nanos.tec.linutronix.de> <ghft2hwevu.fsf@gouders.net> <877dnrc2sv.fsf@depni.sinp.msu.ru> <8735yfd2q4.fsf@nanos.tec.linutronix.de> <87zh0nbnha.fsf@nanos.tec.linutronix.de>
 <CAHk-=wg_-_FP+B6ePabvj55_ok1YbYCsGHzYsZ064FpE4RqkTQ@mail.gmail.com> <87wnvrbmqx.fsf@nanos.tec.linutronix.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 1 Feb 2021, Thomas Gleixner wrote:

> >> While it cures the problem on the reporters machine it breaks machines
> >> with Intel chipsets which use bit 0-5 of the D register. So check only
> >> for bit 6 being 0 which is the case on these Intel machines as well.
> >
> > This looks fine, but it might also be worth it simply just checking
> > for the only really special value: 0xff, and going "ok, that looks
> > like missing hardware".
> >
> > That's what a few other drivers historically do in their probing
> > routines, so it's not unheard of (ie you can find drivers doing that
> > kind of
> >
> >         /* If we read 0xff from the LSR, there is no UART here. */
> >         if (inb(.. port ..) == 0xff)
> >
> > in their init routines.
> >
> > Not a big deal either way, I just think it would be more in like with
> > what other places do in similar situations
> 
> Yeah, we can do that as well. Either way is fine.

 Given that evidently vendors appear to start playing with 146818 clones 
it may be worth it to peek at the D and the C register and checking they 
are not 0xff both at a time for robustness before concluding no RTC is 
present.  The C register is supposed to hold zeros in bits 3:0.  A read of 
the C register will drop interrupt bits, but I guess it does not matter at 
the probe time.

 FWIW,

  Maciej
