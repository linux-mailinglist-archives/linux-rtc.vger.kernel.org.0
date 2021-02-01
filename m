Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5B9230B07C
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Feb 2021 20:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbhBATkt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 1 Feb 2021 14:40:49 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:59668 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhBATks (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 1 Feb 2021 14:40:48 -0500
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1612208406;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VtZpA2AJJR10BLs4JGvZpp2Gn1wezLDmpF5F8OMPGRE=;
        b=EMEln62rnkqh9yGqgBlAHg4ORN+rRmUVEI5A0AxQE/WDb3GZdkzEZmx1HwHD/60gIDiCHL
        vhF1xYKzPD7+Qrvb9/Zib5GVc1Zsf1ofk4oMVUFEP4mNaCfM4p5y8U4G03VhcwBzsW+6XU
        quFwGd9FiH4pjhIP0v9j0MwEY/+WItOHE7l8AV1nvaBgB0LVXv0MQihEZnOSCO7VYEZWTa
        r57n90uOdmZJCsV90ROBoL0FAm401ZOhaI8VhH7syETRLlSYMmFf4J+UCdkolJjCEtumly
        uG0aONmlnLUjxfl2x6ecOfNYCozu3GTIH2eZDGSwnZlGHIehcba+HBWl060+fA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1612208406;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VtZpA2AJJR10BLs4JGvZpp2Gn1wezLDmpF5F8OMPGRE=;
        b=yHRmdsqKwMr9q9mnEoOKAFUyXCNS41Y3tnu5/rDGDkEJ80GVXuFTLZNYVgHC8b5yFppPiu
        0QEtPg8SYvrB6IAw==
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Serge Belyshev <belyshev@depni.sinp.msu.ru>,
        Dirk Gouders <dirk@gouders.net>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH V2] rtc: mc146818: Dont test for bit 0-5 in Register D
In-Reply-To: <CAHk-=wg_-_FP+B6ePabvj55_ok1YbYCsGHzYsZ064FpE4RqkTQ@mail.gmail.com>
References: <20201206214613.444124194@linutronix.de> <20201206220541.594826678@linutronix.de> <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net> <871re7hlsg.fsf@nanos.tec.linutronix.de> <98cb59e8-ecb4-e29d-0b8f-73683ef2bee7@digikod.net> <87y2gfg18p.fsf@nanos.tec.linutronix.de> <87tur3fx7w.fsf@nanos.tec.linutronix.de> <ghft2hwevu.fsf@gouders.net> <877dnrc2sv.fsf@depni.sinp.msu.ru> <8735yfd2q4.fsf@nanos.tec.linutronix.de> <87zh0nbnha.fsf@nanos.tec.linutronix.de> <CAHk-=wg_-_FP+B6ePabvj55_ok1YbYCsGHzYsZ064FpE4RqkTQ@mail.gmail.com>
Date:   Mon, 01 Feb 2021 20:40:06 +0100
Message-ID: <87wnvrbmqx.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Feb 01 2021 at 11:32, Linus Torvalds wrote:
> On Mon, Feb 1, 2021 at 11:24 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> While it cures the problem on the reporters machine it breaks machines
>> with Intel chipsets which use bit 0-5 of the D register. So check only
>> for bit 6 being 0 which is the case on these Intel machines as well.
>
> This looks fine, but it might also be worth it simply just checking
> for the only really special value: 0xff, and going "ok, that looks
> like missing hardware".
>
> That's what a few other drivers historically do in their probing
> routines, so it's not unheard of (ie you can find drivers doing that
> kind of
>
>         /* If we read 0xff from the LSR, there is no UART here. */
>         if (inb(.. port ..) == 0xff)
>
> in their init routines.
>
> Not a big deal either way, I just think it would be more in like with
> what other places do in similar situations

Yeah, we can do that as well. Either way is fine.

Thanks,

        tglx
