Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1122CEFFA
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Dec 2020 15:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729328AbgLDOrn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Dec 2020 09:47:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728377AbgLDOrm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Dec 2020 09:47:42 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799ABC061A4F
        for <linux-rtc@vger.kernel.org>; Fri,  4 Dec 2020 06:47:02 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id i199so5582102qke.5
        for <linux-rtc@vger.kernel.org>; Fri, 04 Dec 2020 06:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u4EQAHLQ1StzXBCYHDVSsMeAsH8zoc/eEcaaN+3AhSk=;
        b=WDinJLzV2BCmwbrSoe61S6nE4F9g7KP2b2iDKEwm9I0RjiFbM64zVGnP1ii3fyB/eC
         hfjH73ZN76OaD23A/PvGMJQTqI95shSZEXtMttymsTNqnoz8yQdYISYzw2mVIJvOWQvZ
         TKM9jrWo2omsqtUmsznSyXLyxDCGi0tYMsNq/3Efpb0KB9wOtuOV1vu3cf0S3gYrcb5V
         /61z3sBwjghfso+qgO707uxfi6o6KmxkV6pbpsHn+MKWf/QAnDQnHseAWxLeGM7g+pZJ
         ckLP63x20njiE6PoPIqXJHfTEOUyY+a09gwtlOA9bgzfHJiHZzunZK1yUlX+zXSbcSb2
         /Q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u4EQAHLQ1StzXBCYHDVSsMeAsH8zoc/eEcaaN+3AhSk=;
        b=Qffq5wzZNAZA7TUnIk737eHkALwD6bVv/nCqHnS162j9wiEnZybkIoGzRIIum0VxsW
         ddjR8/IwVB1kv91l3eQW+w4pNrYyHFFf/atCT8q7FjrV9/5E3Gabnxe9Pyc4rcXUpsbR
         ZTslwtiSXEBIKdqTFeM48Jn6kVaJepykClYFDUKFiBsEAdYwavUOaYXyoVdAZWX9g9Bh
         Btwg6uaA45y8rKjiMSPLn/VcLdsztB/cVjFxwQAn1900N6Tuwx43a/nTTpW1haNmYD+6
         nhRklTl94qIdPOrQp4Yk6bPu3Ajt+jivdmwKin4kySxbhD82Z7aq/N+7pjC2dvmFnj8f
         sUIg==
X-Gm-Message-State: AOAM532rXszpRTV/DF+Ju1GI6R86xmxhd2HSE51GPQoDKfDyktcr95mj
        kVjDAAgzF6aN/QSeIPn2ivliRA==
X-Google-Smtp-Source: ABdhPJyl+2z/Jit+laF4PE23ykeXHQpocKDc+GjPrgKHOpx/6Ejz8Uby2e7q9XH/qd7BNMSnuLKJoQ==
X-Received: by 2002:a37:9a94:: with SMTP id c142mr8896235qke.480.1607093221750;
        Fri, 04 Dec 2020 06:47:01 -0800 (PST)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id r48sm5687910qtr.21.2020.12.04.06.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 06:47:00 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1klCMN-005su3-LC; Fri, 04 Dec 2020 10:46:59 -0400
Date:   Fri, 4 Dec 2020 10:46:59 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
Message-ID: <20201204144659.GY5487@ziepe.ca>
References: <87zh2vd72z.fsf@nanos.tec.linutronix.de>
 <20201203021047.GG3544@piout.net>
 <87pn3qdhli.fsf@nanos.tec.linutronix.de>
 <20201203161622.GA1317829@ziepe.ca>
 <87zh2ubny2.fsf@nanos.tec.linutronix.de>
 <87wnxybmqx.fsf@nanos.tec.linutronix.de>
 <20201203223646.GA1335797@ziepe.ca>
 <877dpxbu66.fsf@nanos.tec.linutronix.de>
 <20201204140819.GX5487@ziepe.ca>
 <20201204143735.GI74177@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204143735.GI74177@piout.net>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Dec 04, 2020 at 03:37:35PM +0100, Alexandre Belloni wrote:
> On 04/12/2020 10:08:19-0400, Jason Gunthorpe wrote:
> > On Fri, Dec 04, 2020 at 02:02:57PM +0100, Thomas Gleixner wrote:
> > 
> > > No magic sign calculation required if you look at it from the actual
> > > timeline and account the time between write and next second increment
> > > correctly.
> > 
> > Yes, it is equivalent to break things into two values, and does look
> > to be more understandable as one can read at least one of the values
> > from a datasheet and the other could be estimated by timing a read
> > clock
> > 
> 
> If you want to read an RTC accurately, you don't want to time a read,
> what you want is to time an alarm. This is a common misconception and
> is, again, why hctosys in its current state is not useful.

I mean literatally time the excution of something like a straight
read. This will give some estimate of the bus latency and it should
linearly relate to the bus latency for a write.

The driver could time configuring an alarm as well, if it likes.

> And because people using systohc are definitively using hctosys, this
> will still result in an up to 500ms error in the current time.
> As said, the price to pay for a proper solution will be an up to one
> second delay when booting which is not acceptable for most users.

IIRC I had fixed this in some embedded system long ago by having
hctosys reading seconds time during boot, then in parallel using the
'up to one second' method to get the sub-second resolution.

This means there was a sub second non-monotonicity in the realtime
clock, but the system was designed to tolerate this as it also ran a
modified NTP which would unconditionally step the clock on first sync
if it was over .1s out of alignment.

The goal was to bring the system to correct time as quickly as
possible in as many cases as possible, not to maintain the
monotonicity of the realtime clock.

> Is "fixing" systohc worth the effort and the maintenance cost?

As I said before, if there is no desire to address the read side then
the whole thing should be abandoned.

Jason 
