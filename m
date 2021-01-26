Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83BF0304016
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Jan 2021 15:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391790AbhAZOTd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Jan 2021 09:19:33 -0500
Received: from smtp-bc08.mail.infomaniak.ch ([45.157.188.8]:58591 "EHLO
        smtp-bc08.mail.infomaniak.ch" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405703AbhAZOSq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Jan 2021 09:18:46 -0500
X-Greylist: delayed 70626 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 Jan 2021 09:18:31 EST
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
        by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4DQ82Z31YDzMpnZb;
        Tue, 26 Jan 2021 15:17:42 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4DQ82Y3xD6zlpq0M;
        Tue, 26 Jan 2021 15:17:41 +0100 (CET)
Subject: Re: [patch 1/8] rtc: mc146818: Prevent reading garbage - bug
To:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
References: <20201206214613.444124194@linutronix.de>
 <20201206220541.594826678@linutronix.de>
 <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net>
 <871re7hlsg.fsf@nanos.tec.linutronix.de>
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <98cb59e8-ecb4-e29d-0b8f-73683ef2bee7@digikod.net>
Date:   Tue, 26 Jan 2021 15:17:40 +0100
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <871re7hlsg.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Thanks for the fix! It boots now with a new message:
rtc_cmos rtc_cmos: not accessible

I tested with rtc=on and rtc=off (which didn't make a difference before
this fix) on a microvm:
https://github.com/qemu/qemu/blob/master/docs/system/i386/microvm.rst

There is one issue with the memset though:

On 26/01/2021 14:26, Thomas Gleixner wrote:
> On Mon, Jan 25 2021 at 19:40, Mickaël Salaün wrote:
>> After some bisecting, I found that commit 05a0302c3548 ("rtc: mc146818:
>> Prevent reading garbage", this patch, introduced since v5.11-rc1) makes
>> my VM hang at boot. Before this commit, I got this (and didn't notice)
>> at every boot:
>> rtc_cmos rtc_cmos: registered as rtc0
>> rtc_cmos rtc_cmos: hctosys: unable to read the hardware clock
>> rtc_cmos rtc_cmos: alarms up to one day, 114 bytes nvram
>>
>> I notice that this patch creates infinite loops, which my VM falls into
>> (cf. below).
>>> +	time->tm_sec = CMOS_READ(RTC_SECONDS);
>>> +
>>> +	if (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) {
>>> +		spin_unlock_irqrestore(&rtc_lock, flags);
>>> +		mdelay(1);
>>
>> My VM loops here.
>> time->tm_sec is always 255.
> 
> That means there is no RTC and therefore the CMOS_READ($REG) returns
> 0xFF which makes the loop stuck because RTC_UIP is always set.
> 
> Yet another proof that VIRT creates more problems than it solves.
> 
> Fix below.
> 
> Thanks,
> 
>         tglx
> ---
> Subject: rtc: mc146818: Detect and handle broken RTCs
> From: Thomas Gleixner <tglx@linutronix.de>
> Date: Tue, 26 Jan 2021 11:38:40 +0100
> 
> The recent fix for handling the UIP bit unearthed another issue in the RTC
> code. If the RTC is advertised but the readout is straight 0xFF because
> it's not available, the old code just proceeded with crappy values, but the
> new code hangs because it waits for the UIP bit to become low.
> 
> Add a sanity check in the RTC CMOS probe function which reads the RTC_VALID
> register (Register D) which should have bit 0-6 cleared. If that's not the
> case then fail to register the CMOS.
> 
> Add the same check to mc146818_get_time(), warn once when the condition
> is true and invalidate the rtc_time data.
> 
> Reported-by: Mickaël Salaün <mic@digikod.net>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/rtc/rtc-cmos.c         |    8 ++++++++
>  drivers/rtc/rtc-mc146818-lib.c |    7 +++++++
>  2 files changed, 15 insertions(+)
> 
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -805,6 +805,14 @@ cmos_do_probe(struct device *dev, struct
>  
>  	spin_lock_irq(&rtc_lock);
>  
> +	/* Ensure that the RTC is accessible. Bit 0-6 must be 0! */
> +	if ((CMOS_READ(RTC_VALID) & 0x7f) != 0) {
> +		spin_unlock_irq(&rtc_lock);
> +		dev_warn(dev, "not accessible\n");
> +		retval = -ENXIO;
> +		goto cleanup1;
> +	}
> +
>  	if (!(flags & CMOS_RTC_FLAGS_NOFREQ)) {
>  		/* force periodic irq to CMOS reset default of 1024Hz;
>  		 *
> --- a/drivers/rtc/rtc-mc146818-lib.c
> +++ b/drivers/rtc/rtc-mc146818-lib.c
> @@ -21,6 +21,13 @@ unsigned int mc146818_get_time(struct rt
>  
>  again:
>  	spin_lock_irqsave(&rtc_lock, flags);
> +	/* Ensure that the RTC is accessible. Bit 0-6 must be 0! */
> +	if (WARN_ON_ONCE((CMOS_READ(RTC_VALID) & 0x7f) != 0)) {
> +		spin_unlock_irqrestore(&rtc_lock, flags);
> +		memset(time, 0xff, sizeof(time));

This should be: sizeof(*time)

> +		return 0;
> +	}
> +
>  	/*
>  	 * Check whether there is an update in progress during which the
>  	 * readout is unspecified. The maximum update time is ~2ms. Poll
> 

Tested-by: Mickaël Salaün <mic@linux.microsoft.com>
