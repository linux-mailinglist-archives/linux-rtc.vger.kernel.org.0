Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52C472CDF33
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Dec 2020 20:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728700AbgLCTxg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Dec 2020 14:53:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgLCTxg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Dec 2020 14:53:36 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3838DC061A4E;
        Thu,  3 Dec 2020 11:52:54 -0800 (PST)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607025172;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rasSaeJRB3xwJZCidBSqDx5GoPlIUeT1fHanrxbFk+c=;
        b=Sf5jP6h4596jEHPy1dCzlvNMrbn8q89g23C8G6OpFsUR+6jKjvwr9/vjnLLn33bTQ43usW
        hGsCvD/BzAl2CpvWpzKcumPsNBq424FiRcJKFtREABs1yekovBd3Dkhm+s6l2lHdNLrwIQ
        6ahZfXowE9plMR20QWg41PZvvO31s/imivnheIbVy1MrWGPNEIssMtcuIqF/Abc0o0koVU
        jPGiAwhE9qKlCLrKcgDHiqS2w8gAS+xYUzbo6cb7eze8V85hlVj+mFFg56fMjZoPTpWSu7
        1Jzm2FSVs6GAf/pWGvPdVu0yV9tQSFlMUX96rA/VPokOMXdHoFhrJ48JvoCZuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607025172;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rasSaeJRB3xwJZCidBSqDx5GoPlIUeT1fHanrxbFk+c=;
        b=b4H326DzaVGLFzrxlXyDXDATvxdDm1gUwN0XvMXRMFgn+EjKuJACdubt9x/K0m0CUxLbjW
        D/7cOXfvNjrRT0DA==
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
In-Reply-To: <20201203172919.GC7535@piout.net>
References: <20201201171420.GN1900232@localhost> <20201201173540.GH5487@ziepe.ca> <87mtywe2zu.fsf@nanos.tec.linutronix.de> <20201202162723.GJ5487@ziepe.ca> <87a6uwdnfn.fsf@nanos.tec.linutronix.de> <20201202205418.GN5487@ziepe.ca> <874kl3eu8p.fsf@nanos.tec.linutronix.de> <87zh2vd72z.fsf@nanos.tec.linutronix.de> <20201203021047.GG3544@piout.net> <87pn3qdhli.fsf@nanos.tec.linutronix.de> <20201203172919.GC7535@piout.net>
Date:   Thu, 03 Dec 2020 20:52:51 +0100
Message-ID: <875z5id5v0.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Alexandre,

On Thu, Dec 03 2020 at 18:29, Alexandre Belloni wrote:
> On 03/12/2020 16:39:21+0100, Thomas Gleixner wrote:
>> On Thu, Dec 03 2020 at 03:10, Alexandre Belloni wrote:
>> > On 03/12/2020 02:14:12+0100, Thomas Gleixner wrote:
>> > Coincidentally, I was going to revert those patches for v5.11.
>> 
>> Which will break the rtc_cmos() driver in a different way. We should
>> really fix that proper and just have the 500ms offset for rtc_cmos,
>> aka. MC146818. When other drivers want a different offset, then they
>> still can do so.
>> 
>
> My point was to get back to the previous situation where only
> rtc_cmos was supposed to work properly by removing rtc_tv_nsec_ok and
> set_offset_nsec.

If you remove the offset, then rtc_cmos() is off by ~500ms.

> I'm still convinced that set_offset_nsec is not needed to set the time
> accurately and I still want to remove it. Also, this may be a good time
> to move systohc.c to kernel/time/ntp.c as this is definitively some NTP
> specific code being an RTC consumer, very much like alarmtimer.c

No objections from my side.

The main pain point is that the periodic update is seen as ABI by some
folks. The fact that you can disable it in Kconfig does not matter. You
can disable other stuff like posix timers which is ABI as well.

So removing it is not really an option. Keeping it broken or break it
differently is neither...

Thanks,

        tglx


