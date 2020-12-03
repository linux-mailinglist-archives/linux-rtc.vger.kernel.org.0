Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE0C2CE04F
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Dec 2020 22:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbgLCVFw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Dec 2020 16:05:52 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:42736 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLCVFw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Dec 2020 16:05:52 -0500
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607029510;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=yQsxw15o82OfCAtv5HkBENTj8U8tPLmKJao23xT/mcU=;
        b=Hezi1ehf5mSPQnr1BR8UD8LFIslYjUyIaAmi8cE6uw+X0BV8qUTGgzrYIk/5KE1jGCZdAN
        y2FnD1BteAEz3KdKv4e3EuZNuPxfMyJx6/S3V9G0texC+uqf9m6v7uymyJdk5vKSbbAR5h
        Rv7sjYtwO4fkt9xnKwkK2yYse38pZdyVZunyk00yfMudBwkxsxHo9gZUWuJPf72e3a1ZWu
        VpLl9v7Z4FSSZeWwOqb6H7TRNPS6C/P63kzGCha3xazwfVtJSWzWsZg8Fp+7Y5kZqNlqKR
        +bfrtQ3GLzz/7uMpWEgCGGt1Z0Ymfzi2MW77qdCm6fZlnA89VhFzFS6wMgsSUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607029510;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=yQsxw15o82OfCAtv5HkBENTj8U8tPLmKJao23xT/mcU=;
        b=trF2RAAsp+vDwretOLfrbmiauwRUb0NaY/V8W4jbJ1p+clsrjiTFjyJiC8M+MzWx7reoTn
        uI+64xdd8nhotpCA==
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
In-Reply-To: <20201203161622.GA1317829@ziepe.ca>
References: <20201201171420.GN1900232@localhost> <20201201173540.GH5487@ziepe.ca> <87mtywe2zu.fsf@nanos.tec.linutronix.de> <20201202162723.GJ5487@ziepe.ca> <87a6uwdnfn.fsf@nanos.tec.linutronix.de> <20201202205418.GN5487@ziepe.ca> <874kl3eu8p.fsf@nanos.tec.linutronix.de> <87zh2vd72z.fsf@nanos.tec.linutronix.de> <20201203021047.GG3544@piout.net> <87pn3qdhli.fsf@nanos.tec.linutronix.de> <20201203161622.GA1317829@ziepe.ca>
Date:   Thu, 03 Dec 2020 22:05:09 +0100
Message-ID: <87zh2ubny2.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Dec 03 2020 at 12:16, Jason Gunthorpe wrote:
> On Thu, Dec 03, 2020 at 04:39:21PM +0100, Thomas Gleixner wrote:
>
>> The logic in sync_cmos_clock() and rtc_set_ntp_time() is different as I
>> pointed out: sync_cmos_clock() hands -500ms to rtc_tv_nsec_ok() and
>> rtc_set_ntp_time() uses +500ms, IOW exactly ONE second difference in
>> behaviour.
>
> I understood this is because the two APIs work differently, rmk
> explained this as:
>
>> 1. kernel/time/ntp.c assumes that all RTCs want to be told to set the
>>    time at around 500ms into the second.
>>
>> 2. drivers/rtc/systohc.c assumes that if the time being set is >= 500ms,
>>    then we want to set the _next_ second.
>
> ie one path is supposed to round down and one path is supposed to
> round up, so you get to that 1s difference..
>
> IIRC this is also connected to why the offset is signed..

The problem is that it is device specific and therefore having the
offset parameter is a good starting point.

Lets look at the two scenarios:

1) Direct accessible RTC:

   tsched t1                   t2
          write(newsec)        RTC increments seconds

   For rtc_cmos/MC1... tinc = t2 - t1 = 500ms

   There are RTCs which reset the thing on write so tinc = t2 - t1 = 1000ms

   No idea what other variants are out there, but the principle is the
   same for all of them.

   Lets assume that the event is accurate for now and ignore the fuzz
   logic, i.e. tsched == t1

   tsched must be scheduled to happen tinc before wallclock increments
   seconds so that the RTC increments seconds at the same time.

   That means newsec = t1.tv_sec.

   So now the fuzz logic for the legacy cmos path does:

      newtime = t1 - tinc;

      if (newtime.tv_nsec < FUZZ)
          newsec = newtime.tv_sec;
      else if (newtime.tv_nsec > NSEC_PER_SEC - FUZZ)
          newsec = newtime.tv_sec + 1;
      else
          goto fail;

   The first condition handles the case where t1 >= tsched and the second
   one where t1 < tsched.

   We need the same logic for rtc_cmos() when the update goes through
   the RTC path, which is broken today. See below.

2) I2C/SPI ...

   tsched t0                 t1                     t2
          transfer(newsec)   RTC update (newsec)    RTC increments seconds

   Lets assume that ttransfer = t1 - t0 is known.

   tinc is the same as above = t2 - t1

   Again, lets assume that the event is accurate for now and ignore the fuzz
   logic, i.e. tsched == t0

   So tsched has to be ttot = t2 - t0 _before_ wallclock reaches t2 and
   increments seconds.

   In this case newsec = t1.tv_sec = (t0 + ttransfer).tv_sec

   So now the fuzz logic for this is:

      newtime = t0 + ttransfer;

      if (newtime.tv_nsec < FUZZ)
          newsec = newtime.tv_sec;
      else if (newtime.tv_nsec > NSEC_PER_SEC - FUZZ)
          newsec = newtime.tv_sec + 1;
      else
          goto fail;

   Again the first condition handles the case where t1 >= tsched and the
   second one where t1 < tsched.

So now we have two options to fix this:

   1) Use a negative sync_offset for devices which need #1 above
      (rtc_cmos & similar)

      That requires setting tsched to t2 - abs(sync_offset)

   2) Use always a positive sync_offset and a flag which tells
      rtc_tv_nsec_ok() whether it needs to add or subtract.

#1 is good enough. All it takes is a comment at the timer start code why
abs() is required.

Let me hack that up along with the hrtimer muck.

Thanks,

        tglx
