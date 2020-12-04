Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D22442CF15B
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Dec 2020 16:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbgLDP5v (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Dec 2020 10:57:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbgLDP5u (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Dec 2020 10:57:50 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7987C061A4F
        for <linux-rtc@vger.kernel.org>; Fri,  4 Dec 2020 07:57:10 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id z188so5805372qke.9
        for <linux-rtc@vger.kernel.org>; Fri, 04 Dec 2020 07:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xiuRU5gjXIm9XOVD+WEIsXlsJb8C9JaURz+n0lPMd1E=;
        b=OoNzvPR6tta9qFPmGEZPxv16PRpJ8m9Xsr7MpTtZiRB34AsjeRiFblkofygVNn1SIX
         yQ6c/LTmKsRbFKH22ohxRCverE9PiYwmBwKt+WSERBtv/XEX2HiXcHdgAz+ewJLR382n
         2YbExCBDyUaO1vgnBg79ahsyox4uJqjMctIgM2C123oTKHgcR4+htP+OEHtk/riPviOM
         5HiO1F6BtGFrYZyBkZGWARoLJL3lUObUSmspF996TTbx8gMjPno5j+UPzMmQAvdEjFH4
         nk0GifIObwFA3+6JKKKUAOngOpueTJ4uvodZdWyHN886s6GCWTUs+qorHDqCTYHPoNDK
         zQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xiuRU5gjXIm9XOVD+WEIsXlsJb8C9JaURz+n0lPMd1E=;
        b=k8LNWI5Ral3R4uXQcO+wnzhTsq/WcP99Dfko9vPVDVXYXcLWBikoGoWDIchxoZ0ZiT
         uAbWijPKSCg7oQ6z9SiolTNw1TG1AFpY2Kme2bWtnKZGxeZHBppaFjfylaUspx0BIdnJ
         Lb8hdv59hnL4biVjcQYw3ficSfLS2v9qQqvGTCJC1Zwl9aRaWiRLSUBZ7UOzJw7WB76G
         OUDiRqCJwOdO+rXIHrtbfkdLRWR7yvDJx7/0FSQ+X0pQe0IwpHo/ONn4/guGu8EfnAgY
         MRwOgFdtho+6kOeCoSG76ntQZALSxyS4RcgxBlWT8ubLBmO80cwPMdI+pTNVdthkWQeX
         lHvQ==
X-Gm-Message-State: AOAM533JoEfieqUjgWWiYG0xtqW8Sptzz7z2XAC+87c7MhtbxvWQgZm+
        Ytti+OQNwp7mjCqLjIpzExbnmg==
X-Google-Smtp-Source: ABdhPJykZ7PwxId0/tq4C6eszgOfW4dtuWKqDQTixMY70MWVd3k7G6Bujg+sD8iCVvFyj63IxjMDWg==
X-Received: by 2002:a05:620a:806:: with SMTP id s6mr9366450qks.193.1607097429916;
        Fri, 04 Dec 2020 07:57:09 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id c65sm5075664qkf.47.2020.12.04.07.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 07:57:09 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1klDSG-005vNM-6L; Fri, 04 Dec 2020 11:57:08 -0400
Date:   Fri, 4 Dec 2020 11:57:08 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
Message-ID: <20201204155708.GB5487@ziepe.ca>
References: <87pn3qdhli.fsf@nanos.tec.linutronix.de>
 <20201203161622.GA1317829@ziepe.ca>
 <87zh2ubny2.fsf@nanos.tec.linutronix.de>
 <87wnxybmqx.fsf@nanos.tec.linutronix.de>
 <20201203223646.GA1335797@ziepe.ca>
 <877dpxbu66.fsf@nanos.tec.linutronix.de>
 <20201204140819.GX5487@ziepe.ca>
 <20201204143735.GI74177@piout.net>
 <20201204144659.GY5487@ziepe.ca>
 <20201204150857.GJ74177@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204150857.GJ74177@piout.net>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Dec 04, 2020 at 04:08:57PM +0100, Alexandre Belloni wrote:

> > I mean literatally time the excution of something like a straight
> > read. This will give some estimate of the bus latency and it should
> > linearly relate to the bus latency for a write.
> 
> 
> It doesn't, some rtc will require writing dozen registers to set the
> time and reading only 3 to get the time, the only accurate way is to
> really time setting the time. You set the RTC time once, set up an alarm for
> the next second, once you get the alarm, you get system time and you now
> how far you are off.

This is why I said linearly related. Yes the relation is per-driver,
based on the ops required, but in principle it can get close.

> Notice that systohc could do that if you wanted to be accurate and then
> the whole issue with mc146818 is gone and this nicely solves it for all
> the RTCs at once.

Another good solution is to have systohc progam the time and then
immediately read it back (eg with an alarm). The difference between
the read back and the system RTC is the single value to plug into the
adjustment offset and naturally includes all the time factors Thomas
identified, including the additional factor of 'latency to read the
time'

> > The goal was to bring the system to correct time as quickly as
> > possible in as many cases as possible, not to maintain the
> > monotonicity of the realtime clock.
> 
> I'm really curious, in your use case, couldn't you have read the RTC
> from userspace and set the system time from there, right before starting
> NTP and other applications?

This was RAM constrainted embedded, a few hundred bytes of kernel code
wins over 100k of userspace

> Doing so, you would have probably been able to ensure monotonicity.

No, this case also wasn't willing to wait the 1s to load the time. It
had to go parallel with the rest of the boot up. This was enterprise
gear, boot time to operational counts against the achievable
availability rating.

From an upstream perspective this was hacky because
 - We historically try not to create non-monotinicity in CLOCK_REALTIME
   because too much stuff wrongly works on CLOCK_REALTIME when they
   really need CLOCK_MONOTONIC
 - Having the kernel async set the clock is racy with NTP also trying
   to set the clock

But in a closed system the two above were delt with reliably.

> > As I said before, if there is no desire to address the read side then
> > the whole thing should be abandoned.
> 
> What was your plan back in 2017?

Well I was helping RMK because we had similar issues, but I saw some
path to achive the low offset round trip, and view this as laudable
for the embedded world.

I see I also changed jobs right around then which probably explains
why things stopped at this one patch. The fact nobody else picked it
up probably says people really just don't care about realtime
accuracy.

Jason 
