Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5485E2CEAFA
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Dec 2020 10:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbgLDJe4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Dec 2020 04:34:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbgLDJe4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Dec 2020 04:34:56 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F812C061A4F;
        Fri,  4 Dec 2020 01:34:16 -0800 (PST)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607074454;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hgQbpciJbizYKA4AVJ09dODrpMGMg9MJPg1/jfecOMY=;
        b=YupU4aqaYx1YHrhVbQZs2jdm69vyI4x5Q9CEEyOxbVko6CVMZNbrqLo1VKkQqlVzXYSpDY
        eQbdS1mOq82fSzNbm5RwhA6OYGI87lvQFxoIe7JGpvmho87nDWgCWhlAMIuEKKtnIZIcSw
        GaMUC576+VUDtNqv5aHgDKNPJszGJs9ugYEFqVrkh1rQfYVlsZc+0aLrCe7H8Ztq+azwwZ
        g1nrWhROkmSjj/DN5m9jD7Jj1D/Z1YaQMN9mlFwcRjPkWPYS7M70hGJuS3gyOYdoJgCFRR
        eyV6A6QL1GqVu+Q07+xvhEo3UGHCtyyTD7NGpmt13bu8MKVimYa0LPv3+xmfbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607074454;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hgQbpciJbizYKA4AVJ09dODrpMGMg9MJPg1/jfecOMY=;
        b=+pTOGJuA4vZzLRir7Sj//2FAE/l7NuxgaQ+9p3xm1eA9ebbxnRtBajdnDBPuW73ceGQhPm
        J0/kJNnWXnjP/MBw==
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
In-Reply-To: <20201203220027.GB74177@piout.net>
References: <87mtywe2zu.fsf@nanos.tec.linutronix.de> <20201202162723.GJ5487@ziepe.ca> <87a6uwdnfn.fsf@nanos.tec.linutronix.de> <20201202205418.GN5487@ziepe.ca> <874kl3eu8p.fsf@nanos.tec.linutronix.de> <87zh2vd72z.fsf@nanos.tec.linutronix.de> <20201203021047.GG3544@piout.net> <87pn3qdhli.fsf@nanos.tec.linutronix.de> <20201203161622.GA1317829@ziepe.ca> <87zh2ubny2.fsf@nanos.tec.linutronix.de> <20201203220027.GB74177@piout.net>
Date:   Fri, 04 Dec 2020 10:34:13 +0100
Message-ID: <87im9hc3u2.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Dec 03 2020 at 23:00, Alexandre Belloni wrote:
> On 03/12/2020 22:05:09+0100, Thomas Gleixner wrote:
>> 2) I2C/SPI ...
>> 
>>    tsched t0                 t1                     t2
>>           transfer(newsec)   RTC update (newsec)    RTC increments seconds
>> 
>>    Lets assume that ttransfer = t1 - t0 is known.
>
> Note that ttransfer is one of the reason why setting set_offset_nsec
> from the RTC driver is not a good idea. The same RTC may be on busses
> with different rates and there is no way to know that. I think that was
> one of my objections at the time.
>
> ttransfer is not a function of the RTC model but rather of how it is
> integrated in the system.

Yes, but it's the right place to store that information.

It's a fundamental problem of the RTC driver because that's the one
which has to be able to tell the caller about it. The caller has
absolutely no way to figure it out because it does not even know what
type of RTC is there.

So either the RTC knows the requirements for tsched, e.g. the MC14xxx
datasheet, or it can retrieve that information from DT or by querying
the underlying bus mechanics for the xfer time estimate or just by
timing an xfer for reference.

Thanks,

        tglx





