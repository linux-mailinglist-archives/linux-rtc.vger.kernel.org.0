Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E0E2CE0C3
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Dec 2020 22:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgLCVbo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Dec 2020 16:31:44 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:42838 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLCVbo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Dec 2020 16:31:44 -0500
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607031062;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=y6t87COzzxb5+LKoDByx21aiE9mMgZNsbodr8zb3eR0=;
        b=FTKTIhQ+z6vRwq3w1QmnlFuypMlY3MkX1wogolO0pE+V+odbzG73Ji0cyvCzDqtcjcfIKj
        pcguVmUorAOXDIZVwT3GHthKLftKsN/LKPwvgpU4YZAJPXIZJsbu8eRDvYfig3FQvF9B2A
        FpQbJKBiu44+n9H8yc/Ne4v2lvERN3gFYbn8ws6tHo3P3HnyLlT6gBCV0krM3OwOVxeD9P
        ugIhON0V1af10d9erFLk31sFLlUUsKBI7c4jhzBfvJI/pPaYiTRzhtREV0jlUCjKhDJB5v
        NTVZbaImuApmriYSKnUyt9S6tOXRG8SbQCt3msWMas8GW3cY1wj6jjDX6A9F8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607031062;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=y6t87COzzxb5+LKoDByx21aiE9mMgZNsbodr8zb3eR0=;
        b=Ydqaubx/r3c4q0uzu+msHcYDpVRj/O+qc+ZtJT27uPp0QvPOUqWbp/CwvC+0YAPNd9VHBt
        H9MXCxAFyUULfAAw==
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
In-Reply-To: <87zh2ubny2.fsf@nanos.tec.linutronix.de>
References: <20201201171420.GN1900232@localhost> <20201201173540.GH5487@ziepe.ca> <87mtywe2zu.fsf@nanos.tec.linutronix.de> <20201202162723.GJ5487@ziepe.ca> <87a6uwdnfn.fsf@nanos.tec.linutronix.de> <20201202205418.GN5487@ziepe.ca> <874kl3eu8p.fsf@nanos.tec.linutronix.de> <87zh2vd72z.fsf@nanos.tec.linutronix.de> <20201203021047.GG3544@piout.net> <87pn3qdhli.fsf@nanos.tec.linutronix.de> <20201203161622.GA1317829@ziepe.ca> <87zh2ubny2.fsf@nanos.tec.linutronix.de>
Date:   Thu, 03 Dec 2020 22:31:02 +0100
Message-ID: <87wnxybmqx.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Dec 03 2020 at 22:05, Thomas Gleixner wrote:
> On Thu, Dec 03 2020 at 12:16, Jason Gunthorpe wrote:
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

That comment in rtc.h makes me cry:

	/* Number of nsec it takes to set the RTC clock. This influences when
	 * the set ops are called. An offset:
	 *   - of 0.5 s will call RTC set for wall clock time 10.0 s at 9.5 s
	 *   - of 1.5 s will call RTC set for wall clock time 10.0 s at 8.5 s
	 *   - of -0.5 s will call RTC set for wall clock time 10.0 s at 10.5 s
	 */

Setting the wall clock time 10.0 at 10.5 is only possible for time
traveling RTCs. It magically works, but come on ...

Thanks,

        tglx
