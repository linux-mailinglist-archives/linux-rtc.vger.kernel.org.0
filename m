Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB3B2D37D8
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Dec 2020 01:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730815AbgLIAdv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Dec 2020 19:33:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730759AbgLIAdv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Dec 2020 19:33:51 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0369C0613CF;
        Tue,  8 Dec 2020 16:33:10 -0800 (PST)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607473988;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hgQpIUc63mDLW0den1AS8FxhMR0Jrh1CG+uMhsbuxUI=;
        b=KLnSRU8ddKIlu8HHC+KCk5y2Gb3j6DjqbEpNIjpb3BiZn5Af8I3A/0HAvHsHwUv9M3Jj3K
        RGV/f2d1qdsVoxZ01lgQQnqV51LVD4xfCrRcc3lTPZ4MAhkRQE+2/dB014b2k45m2cN32j
        ZMnjEWa2x7WbqjwQdI3OAqF8JdH/ZuZGFnib7dluHeHyl4iuTTaNnNEZd4+MDvSUthq2el
        0ETLqzPYPb017Lrb1Z4RiVCM1jFahrIH2SR93dv5XWBx34xPx1L8Lw3Ww1AsLAAOj8Hdi5
        51G2I3lqslnHjMmVz//Bnc7jJHwjOQE4VZl0KifOqBWr7Xs9jYhbEh7w7DnbZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607473988;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hgQpIUc63mDLW0den1AS8FxhMR0Jrh1CG+uMhsbuxUI=;
        b=Bt6VK/OQlIx814XTZLYEm4kp1BRbJLhVsNbwnDY0mJb1AyJITSa4AUHXQUtTgREXHEPhop
        jHee7DbttqqFYmDQ==
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch 0/8] ntp/rtc: Fixes and cleanups
In-Reply-To: <20201206214613.444124194@linutronix.de>
References: <20201206214613.444124194@linutronix.de>
Date:   Wed, 09 Dec 2020 01:33:08 +0100
Message-ID: <87sg8f24zf.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Alexandre,

On Sun, Dec 06 2020 at 22:46, Thomas Gleixner wrote:
> Miroslav ran into a situation where the periodic RTC synchronization almost
> never was able to hit the time window for the update. That happens due the
> usage of delayed_work and the properties of the timer wheel.
>
> While that particular problem is halfways simple to fix this started to
> unearth other problems with that code particularly with rtc_set_npt_time()
> but expanded into other things as well.
>
>   1) The update offset for rtc-cmos is off by a full second
>
>   2) The readout of MC146818 (rtc-cmos and arch code) is broken and can
>      return garbage.
>
>   2) Alexandre questioned the approach in general and wants to get rid of
>      it. Of course there are better methods to do that and it can be
>      completely done in user space.
>
>      Unfortunately it's not that simple as this would be a user visible
>      change, so making it at least halfways correct.
>
>   3) Alexandre requested to move that code into the NTP code as this is not
>      really RTC functionality and just usage of the RTC API.
>
>   4) The update offset itself was questioned, but the time between the
>      write and the next seconds increment in the RTC is fundamentaly a
>      hardware property. The transport time, which is pretty irrelevant for
>      direct accessible RTCs (rtc-cmos), but relevant for RTC behind i2c/SPI
>      needs to be added on top.
>
>      It's undebated that this transport time cannot be correctly estimated,
>      but right now it's 500ms which is far off. The correct transport time
>      can be calibrated, a halfways correct value supplied via DT, but
>      that's an orthogonal problem.
>
> The following series addresses the above:
>
>     1) Fix the readout function of MC146818
>     2) Fix the rtc-cmos offset
>     3) Reduce the default transport time
>
>     4) Switch the NTP periodic sync code to a hrtimer/work combo
>
>     5) Move rtc_set_npt_time() to the ntp code
>     6) Make the update offset more intuitive
>     7) Simplify the whole machinery

any opinion on this?

Thanks,

        tglx
