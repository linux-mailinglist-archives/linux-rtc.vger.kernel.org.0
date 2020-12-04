Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF2B2CEE8E
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Dec 2020 14:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbgLDNDk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Dec 2020 08:03:40 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:47320 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726309AbgLDNDk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Dec 2020 08:03:40 -0500
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607086978;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xfStrtfHtwUI64W2JPjkFzboXAtc1kqYjRgdv9IJXmg=;
        b=ffNTsTe+S0B5e3Eo0joCpAnud7EdBp43wxBRpBsohkUULahr9F2C8HOVtjMyK+Nc0GBEmI
        ZMcvyDEfnVcj90ghrlBkdpg2mNQXzqT3UOS8iKk0VtIKEUsrRd0ueRRphnlZ8ZW4bDyFgO
        u+2eDfowF45SO9C0CbWYsQyiInmFt1pakLDIH1ZeJjvvIhmS+FcLcmsjhK3rRvWAOkiwXC
        3s5Gm0PlCbK9NcPLuTEaEEelNShGKm8Q8Xh21OIlWHHasigc1RNnlxzkgSBs2g3l7B++MJ
        JphAq03xO5hf+iOiPB1Pms4QsZ3xT4cXxMCLal8e4c4S5I4Sq+ulKbFCf1Ak9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607086978;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xfStrtfHtwUI64W2JPjkFzboXAtc1kqYjRgdv9IJXmg=;
        b=cG+3zp0wdx8dnb3pzIJaBYFCKelyUM1qN5nUEsZnBRfoAirGPLEKupOGom3VEfTXgn0ROm
        rkAsqsN9HvGLQHCw==
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
In-Reply-To: <20201203223646.GA1335797@ziepe.ca>
References: <20201202162723.GJ5487@ziepe.ca> <87a6uwdnfn.fsf@nanos.tec.linutronix.de> <20201202205418.GN5487@ziepe.ca> <874kl3eu8p.fsf@nanos.tec.linutronix.de> <87zh2vd72z.fsf@nanos.tec.linutronix.de> <20201203021047.GG3544@piout.net> <87pn3qdhli.fsf@nanos.tec.linutronix.de> <20201203161622.GA1317829@ziepe.ca> <87zh2ubny2.fsf@nanos.tec.linutronix.de> <87wnxybmqx.fsf@nanos.tec.linutronix.de> <20201203223646.GA1335797@ziepe.ca>
Date:   Fri, 04 Dec 2020 14:02:57 +0100
Message-ID: <877dpxbu66.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Dec 03 2020 at 18:36, Jason Gunthorpe wrote:
> On Thu, Dec 03, 2020 at 10:31:02PM +0100, Thomas Gleixner wrote:
>> On Thu, Dec 03 2020 at 22:05, Thomas Gleixner wrote:
>> > On Thu, Dec 03 2020 at 12:16, Jason Gunthorpe wrote:
>> > So now we have two options to fix this:
>> >
>> >    1) Use a negative sync_offset for devices which need #1 above
>> >       (rtc_cmos & similar)
>> >
>> >       That requires setting tsched to t2 - abs(sync_offset)
>> >
>> >    2) Use always a positive sync_offset and a flag which tells
>> >       rtc_tv_nsec_ok() whether it needs to add or subtract.
>> >
>> > #1 is good enough. All it takes is a comment at the timer start code why
>> > abs() is required.
>> >
>> > Let me hack that up along with the hrtimer muck.
>> 
>> That comment in rtc.h makes me cry:
>> 
>> 	/* Number of nsec it takes to set the RTC clock. This influences when
>> 	 * the set ops are called. An offset:
>> 	 *   - of 0.5 s will call RTC set for wall clock time 10.0 s at 9.5 s
>> 	 *   - of 1.5 s will call RTC set for wall clock time 10.0 s at 8.5 s
>> 	 *   - of -0.5 s will call RTC set for wall clock time 10.0 s at 10.5 s
>> 	 */
>> 
>> Setting the wall clock time 10.0 at 10.5 is only possible for time
>> traveling RTCs. It magically works, but come on ...
>
> No tardis required. You can think of storing to a RTC as including a
> millisecond component, so the three examples are: 10.0 stores 9.5,
> 10.0 stores 8.5, 10.0 stores 10.5.
>
> It was probably included due to cmos, either as a misunderstanding
> what it does, or it does actually store 10.5 when you store 10.0..

Yes, it kinda stores 10.5 because after the write the next seconds
increment happens 500ms later.

But none of this magic is actually required because the behaviour of
most RTCs is that the next seconds increment happens exactly 1000ms
_after_ the write.

Which means _all_ of these offsets are positive:

   tsched         twrite           tnextsec

For CMOS tsched == twrite and tnextsec - twrite = 500ms

For I2C  tsched = tnextsec - 1000ms - ttransport

which means the formula is the same for all of them

      tRTCinc = tnextsec - twrite

      tsched = tnextsec - tRTCinc - ttransport

And this covers also the (probably unlikely) case where the I2C RTC has
a tRTCinc != 1000ms. Imagine a i2c based MC14xxx which would have:

  offset = 500ms + ttransport

No magic sign calculation required if you look at it from the actual
timeline and account the time between write and next second increment
correctly.

Thanks,

        tglx
