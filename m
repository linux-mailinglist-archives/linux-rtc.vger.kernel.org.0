Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485002CEC6E
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Dec 2020 11:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgLDKpe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Dec 2020 05:45:34 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:46692 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbgLDKpe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Dec 2020 05:45:34 -0500
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607078692;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6sB8HC3yBfEXc+Ab6LpPmtUtZKgKBsugWZ3DmrepoAo=;
        b=jO8qHFrlQ+NVMPX/90ibQrYDlWXTc2waWdoKXiMUonX6DxuSJxTkAyHrQRn7br1+l/wfbm
        eQ2zBsZZ/G3syE0B3QznBJOMuk2RI79kWu7VWjHmvwE/LQxpm9Lyq+7ueAih06Ug5+W9Mx
        YnfrhQrG0+wQxOu34AQyLXfL4FEgV8iT6KvfasmtOY+PBuRucLbI/NIaLUPRNnKu4wPv9o
        II/ZpSJ5Y4YYT+vWKTduhoVWkIs81/UnCdwxcRPS5aW63B7e0kRbXniJGlMEo4NgxRPsO7
        X/TcEO1CAkB2YziqcHuaFHiGWgSZOYTwt35Fp7LSFSmm2kxyz0NUE7K84T4s7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607078692;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6sB8HC3yBfEXc+Ab6LpPmtUtZKgKBsugWZ3DmrepoAo=;
        b=DUfQdElh8F0G2ppDE07nUwBz/SXdP67ddlqTuBT8bSpgXu3Cf5qtVo+vVIVcNIxgamWz+9
        TL150+DVd6QYNCCA==
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
In-Reply-To: <20201204095138.GG74177@piout.net>
References: <87a6uwdnfn.fsf@nanos.tec.linutronix.de> <20201202205418.GN5487@ziepe.ca> <874kl3eu8p.fsf@nanos.tec.linutronix.de> <87zh2vd72z.fsf@nanos.tec.linutronix.de> <20201203021047.GG3544@piout.net> <87pn3qdhli.fsf@nanos.tec.linutronix.de> <20201203161622.GA1317829@ziepe.ca> <87zh2ubny2.fsf@nanos.tec.linutronix.de> <20201203220027.GB74177@piout.net> <87im9hc3u2.fsf@nanos.tec.linutronix.de> <20201204095138.GG74177@piout.net>
Date:   Fri, 04 Dec 2020 11:44:51 +0100
Message-ID: <87ft4lc0kc.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Dec 04 2020 at 10:51, Alexandre Belloni wrote:
> On 04/12/2020 10:34:13+0100, Thomas Gleixner wrote:
>> So either the RTC knows the requirements for tsched, e.g. the MC14xxx
>> datasheet, or it can retrieve that information from DT or by querying
>> the underlying bus mechanics for the xfer time estimate or just by
>> timing an xfer for reference.
>> 
>
> What I do from userspace is that the caller is the one estimating the
> transfer time and this works very well. I really think that the ntp code
> could do just the same.

For MC14xxx type RTCs tsched is defined by a constant, so heuristics are
really horrible because you have to poll the RTC to get it correct.
What's the point if the driver can just provide the value from the data
sheet?

For RTC's behind a bus the driver its pretty simple to let the driver
tell at RTC registration time that the transfer time is unknown. So you
don't have to add the estimation procedure to each driver. You simply
can add it to the core in one place and expose that info to user space
as well as a starting point.

Sticking that into the NTP code is really the wrong place. That's like
asking the users of a timer device to calibrate it before usage.

The requirements for writing a RTC are not a problem of the caller, they
are fundamental properties of the RTC itself. So why on earth are you
asking every user to implement heuristics to figure these out themself?

Having it as property of the RTC device gives at least a halfways
correct value for the periodic kernel side update and if user space
want's to do better then it still can do so.

Thanks,

        tglx
