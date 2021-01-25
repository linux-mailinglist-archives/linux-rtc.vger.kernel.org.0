Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB4E304B65
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Jan 2021 22:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbhAZEqc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 25 Jan 2021 23:46:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731183AbhAYSwy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 25 Jan 2021 13:52:54 -0500
X-Greylist: delayed 691 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 25 Jan 2021 10:52:07 PST
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [IPv6:2001:1600:4:17::42a8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97588C061573
        for <linux-rtc@vger.kernel.org>; Mon, 25 Jan 2021 10:52:07 -0800 (PST)
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
        by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4DPdwJ6l5dzMq1qY;
        Mon, 25 Jan 2021 19:40:32 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4DPdwJ0g8hzlppyn;
        Mon, 25 Jan 2021 19:40:31 +0100 (CET)
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
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net>
Date:   Mon, 25 Jan 2021 19:40:31 +0100
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <20201206220541.594826678@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

After some bisecting, I found that commit 05a0302c3548 ("rtc: mc146818:
Prevent reading garbage", this patch, introduced since v5.11-rc1) makes
my VM hang at boot. Before this commit, I got this (and didn't notice)
at every boot:
rtc_cmos rtc_cmos: registered as rtc0
rtc_cmos rtc_cmos: hctosys: unable to read the hardware clock
rtc_cmos rtc_cmos: alarms up to one day, 114 bytes nvram

I notice that this patch creates infinite loops, which my VM falls into
(cf. below).

I didn't succeed to properly fix this without a revert. I tried to set a
maximum number of jumps, but I got pvqspinlock warnings.

Regards,
 Mickaël


On 06/12/2020 22:46, Thomas Gleixner wrote:
> The MC146818 driver is prone to read garbage from the RTC. There are
> several issues all related to the update cycle of the MC146818. The chip
> increments seconds obviously once per second and indicates that by a bit in
> a register. The bit goes high 244us before the actual update starts. During
> the update the readout of the time values is undefined.
> 
> The code just checks whether the update in progress bit (UIP) is set before
> reading the clock. If it's set it waits arbitrary 20ms before retrying,
> which is ample because the maximum update time is ~2ms.
> 
> But this check does not guarantee that the UIP bit goes high and the actual
> update happens during the readout. So the following can happen
> 
>  0.997 	       UIP = False
>    -> Interrupt/NMI/preemption
>  0.998	       UIP -> True
>  0.999	       Readout	<- Undefined
> 
> To prevent this rework the code so it checks UIP before and after the
> readout and if set after the readout try again.
> 
> But that's not enough to cover the following:
> 
>  0.997 	       UIP = False
>  	       Readout seconds
>    -> NMI (or vCPU scheduled out)
>  0.998	       UIP -> True
>  	       update completes
> 	       UIP -> False
>  1.000	       Readout	minutes,....
>  	       UIP check succeeds
> 
> That can make the readout wrong up to 59 seconds.
> 
> To prevent this, read the seconds value before the first UIP check,
> validate it after checking UIP and after reading out the rest.
> 
> It's amazing that the original i386 code had this actually correct and
> the generic implementation of the MC146818 driver got it wrong in 2002 and
> it stayed that way until today.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/rtc/rtc-mc146818-lib.c |   64 ++++++++++++++++++++++++-----------------
>  1 file changed, 39 insertions(+), 25 deletions(-)
> 
> --- a/drivers/rtc/rtc-mc146818-lib.c
> +++ b/drivers/rtc/rtc-mc146818-lib.c
> @@ -8,41 +8,41 @@
>  #include <linux/acpi.h>
>  #endif
>  
> -/*
> - * Returns true if a clock update is in progress
> - */
> -static inline unsigned char mc146818_is_updating(void)
> -{
> -	unsigned char uip;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&rtc_lock, flags);
> -	uip = (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP);
> -	spin_unlock_irqrestore(&rtc_lock, flags);
> -	return uip;
> -}
> -
>  unsigned int mc146818_get_time(struct rtc_time *time)
>  {
>  	unsigned char ctrl;
>  	unsigned long flags;
>  	unsigned char century = 0;
> +	bool retry;
>  
>  #ifdef CONFIG_MACH_DECSTATION
>  	unsigned int real_year;
>  #endif
>  
> +again:
> +	spin_lock_irqsave(&rtc_lock, flags);
>  	/*
> -	 * read RTC once any update in progress is done. The update
> -	 * can take just over 2ms. We wait 20ms. There is no need to
> -	 * to poll-wait (up to 1s - eeccch) for the falling edge of RTC_UIP.
> -	 * If you need to know *exactly* when a second has started, enable
> -	 * periodic update complete interrupts, (via ioctl) and then
> -	 * immediately read /dev/rtc which will block until you get the IRQ.
> -	 * Once the read clears, read the RTC time (again via ioctl). Easy.
> +	 * Check whether there is an update in progress during which the
> +	 * readout is unspecified. The maximum update time is ~2ms. Poll
> +	 * every msec for completion.
> +	 *
> +	 * Store the second value before checking UIP so a long lasting NMI
> +	 * which happens to hit after the UIP check cannot make an update
> +	 * cycle invisible.
>  	 */
> -	if (mc146818_is_updating())
> -		mdelay(20);
> +	time->tm_sec = CMOS_READ(RTC_SECONDS);
> +
> +	if (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) {
> +		spin_unlock_irqrestore(&rtc_lock, flags);
> +		mdelay(1);

My VM loops here.
time->tm_sec is always 255.

> +		goto again;
> +	}
> +
> +	/* Revalidate the above readout */
> +	if (time->tm_sec != CMOS_READ(RTC_SECONDS)) {
> +		spin_unlock_irqrestore(&rtc_lock, flags);
> +		goto again;
> +	}
>  
>  	/*
>  	 * Only the values that we read from the RTC are set. We leave
> @@ -50,8 +50,6 @@ unsigned int mc146818_get_time(struct rt
>  	 * RTC has RTC_DAY_OF_WEEK, we ignore it, as it is only updated
>  	 * by the RTC when initially set to a non-zero value.
>  	 */
> -	spin_lock_irqsave(&rtc_lock, flags);
> -	time->tm_sec = CMOS_READ(RTC_SECONDS);
>  	time->tm_min = CMOS_READ(RTC_MINUTES);
>  	time->tm_hour = CMOS_READ(RTC_HOURS);
>  	time->tm_mday = CMOS_READ(RTC_DAY_OF_MONTH);
> @@ -66,8 +64,24 @@ unsigned int mc146818_get_time(struct rt
>  		century = CMOS_READ(acpi_gbl_FADT.century);
>  #endif
>  	ctrl = CMOS_READ(RTC_CONTROL);
> +	/*
> +	 * Check for the UIP bit again. If it is set now then
> +	 * the above values may contain garbage.
> +	 */
> +	retry = CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP;
> +	/*
> +	 * A NMI might have interrupted the above sequence so check whether
> +	 * the seconds value has changed which indicates that the NMI took
> +	 * longer than the UIP bit was set. Unlikely, but possible and
> +	 * there is also virt...
> +	 */
> +	retry |= time->tm_sec != CMOS_READ(RTC_SECONDS);
> +
>  	spin_unlock_irqrestore(&rtc_lock, flags);
>  
> +	if (retry)
> +		goto again;
> +
>  	if (!(ctrl & RTC_DM_BINARY) || RTC_ALWAYS_BCD)
>  	{
>  		time->tm_sec = bcd2bin(time->tm_sec);
> 
> 
