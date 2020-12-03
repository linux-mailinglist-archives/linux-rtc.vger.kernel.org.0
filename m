Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4B32CDA3C
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Dec 2020 16:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731029AbgLCPkE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Dec 2020 10:40:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731020AbgLCPkE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Dec 2020 10:40:04 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67F4C061A4F;
        Thu,  3 Dec 2020 07:39:23 -0800 (PST)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607009962;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c5QSSZGITp++UuTR9FIHIX+EOzfhcH/jIQLDdYnHfBg=;
        b=MuY11QZgsLCvz7j8OY9G7UruMtjvConPAluUCkFEhWJ1tXmRkSsaJlJVf2NjJgs9wNllNK
        rNlJyK3GhWj7GHDRpjNbhq7AOFdeoQ/KHXVUibxOuWK2zvKFK6LtnSFbON9C0FBvbPSF8B
        akctYp73QKBLoeCuWnuFkx0+CnMbRhrkGUWMkL+vaVyhvzvSB4nnIbbC10iMNTqumA8tkR
        /Bx6uhkb1mfrprEt86SBmjZjNRJceDmUrxhk94xGwW4+AjByrVPRveR7HoTviPlx2NiNGp
        Ksb7eUB/9F05G2wuZhxRObVmeDCBuK7kcrPqpl1g1zhVSi4IIRr1nV0TxE7vBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607009962;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c5QSSZGITp++UuTR9FIHIX+EOzfhcH/jIQLDdYnHfBg=;
        b=TZrB6FfRnzwbfT9iir/ZEkMYAkXhMQhXdw0tnWcuvawQQdec3PZFfe6qZDvIG1sMJcE1Qn
        nnrATUOVCiJqMQDw==
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rtc: adapt allowed RTC update error
In-Reply-To: <20201203021047.GG3544@piout.net>
References: <20201201143835.2054508-1-mlichvar@redhat.com> <20201201161224.GF5487@ziepe.ca> <20201201171420.GN1900232@localhost> <20201201173540.GH5487@ziepe.ca> <87mtywe2zu.fsf@nanos.tec.linutronix.de> <20201202162723.GJ5487@ziepe.ca> <87a6uwdnfn.fsf@nanos.tec.linutronix.de> <20201202205418.GN5487@ziepe.ca> <874kl3eu8p.fsf@nanos.tec.linutronix.de> <87zh2vd72z.fsf@nanos.tec.linutronix.de> <20201203021047.GG3544@piout.net>
Date:   Thu, 03 Dec 2020 16:39:21 +0100
Message-ID: <87pn3qdhli.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Alexandre,

On Thu, Dec 03 2020 at 03:10, Alexandre Belloni wrote:
> On 03/12/2020 02:14:12+0100, Thomas Gleixner wrote:
>> That said, can somebody answer the one million dollar question which
>> problem is solved by all of this magic nonsense?
>> 
> The goal was to remove the 500ms offset for all the RTCs but the
> MC146818 because there are RTC that will reset properly their counter
> when setting the time, meaning they can be set very precisely.

The MC setting is halfways precise. The write resets the divider chain
and when the reset is removed then the next UIP will happen after the
magic 0.5 seconds. So yes, writing it 500ms _before_ the next second is
halfways correct assumed that there is no interference between
ktime_get_real() and the actual write which is a silly assumption as the
code is fully preemptible.

> IIRC, used in conjunction with rtc_hctosys which also adds
> inconditionnaly 500ms this can ends up with the system time
> being one second away from the wall clock time which NTP will take quite
> some time to remove.

The rtc_cmos() driver has a fun comment in cmos_set_time()....

The logic in sync_cmos_clock() and rtc_set_ntp_time() is different as I
pointed out: sync_cmos_clock() hands -500ms to rtc_tv_nsec_ok() and
rtc_set_ntp_time() uses +500ms, IOW exactly ONE second difference in
behaviour.

> Coincidentally, I was going to revert those patches for v5.11.

Which will break the rtc_cmos() driver in a different way. We should
really fix that proper and just have the 500ms offset for rtc_cmos,
aka. MC146818. When other drivers want a different offset, then they
still can do so.

The direct /dev/rtc settime ioctl is not using that logic anyway. Thats
the business of the user space application to get that straight which is
scheduling lottery as well.

Thanks,

        tglx
