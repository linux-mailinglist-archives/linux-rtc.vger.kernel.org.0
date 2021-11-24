Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51EBA45D017
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Nov 2021 23:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245010AbhKXWeo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Nov 2021 17:34:44 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:43953 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242784AbhKXWeo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 24 Nov 2021 17:34:44 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 54322200008;
        Wed, 24 Nov 2021 22:31:32 +0000 (UTC)
Date:   Wed, 24 Nov 2021 23:31:32 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH RESEND v3 2/7] rtc-mc146818-lib: fix RTC presence check
Message-ID: <YZ69RB0ePgaHcqVm@piout.net>
References: <20211119204221.66918-1-mat.jonczyk@o2.pl>
 <20211119204221.66918-3-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211119204221.66918-3-mat.jonczyk@o2.pl>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

By moving this patch later on in the series, you'd avoid the subsequent
refactor. I think this would be better for bisection later on.

On 19/11/2021 21:42:16+0100, Mateusz Jończyk wrote:
> To prevent an infinite loop in mc146818_get_time(),
> commit 211e5db19d15 ("rtc: mc146818: Detect and handle broken RTCs")
> added a check for RTC availability. Together with a later fix, it
> checked if bit 6 in register 0x0d is cleared. This, however, caused a
> false negative on a motherboard with an AMD SB710 southbridge; according
> to the specification [1], bit 6 of register 0x0d of this chipset is a
> scratchbit.
> 
> This caused a regression in Linux 5.11 - the RTC was determined broken
> by the kernel and not used by rtc-cmos.c [3].
> 
> As a better alternative, check whether the UIP ("Update-in-progress")
> bit is set for longer then 10ms. If that is the case, then apparently
> the RTC is either absent (and all register reads return 0xff) or broken.
> Also limit the number of loop iterations in mc146818_get_time() to 10 to
> prevent an infinite loop there.
> 
> In a previous approach to this problem, I implemented a check whether
> the RTC_HOURS register contains a value <= 24. This, however, sometimes
> did not work correctly on my Intel Kaby Lake laptop. According to
> Intel's documentation [2], "the time and date RAM locations (0-9) are
> disconnected from the external bus" during the update cycle so reading
> this register without checking the UIP bit is incorrect.
> 
> [1] AMD SB700/710/750 Register Reference Guide, page 308,
> https://developer.amd.com/wordpress/media/2012/10/43009_sb7xx_rrg_pub_1.00.pdf
> 
> [2] 7th Generation Intel ® Processor Family I/O for U/Y Platforms [...] Datasheet
> Volume 1 of 2, page 209
> Intel's Document Number: 334658-006,
> https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/7th-and-8th-gen-core-family-mobile-u-y-processor-lines-i-o-datasheet-vol-1.pdf
> 
> [3] Functions in arch/x86/kernel/rtc.c apparently were using it.
> 
> Fixes: 211e5db19d15 ("rtc: mc146818: Detect and handle broken RTCs")
> Fixes: ebb22a059436 ("rtc: mc146818: Dont test for bit 0-5 in Register D")
> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> v2: Tweak commit description, remove "Cc: stable" (I'll send it manually
> after more regression testing).
> 
> v3: - add "EXPORT_SYMBOL_GPL(mc146818_does_rtc_work)",
>     - change return type from mc146818_does_rtc_work to bool

This changelog should come after the --- marker

> ---
>  drivers/rtc/rtc-cmos.c         | 10 ++++------
>  drivers/rtc/rtc-mc146818-lib.c | 35 ++++++++++++++++++++++++++++++----
>  include/linux/mc146818rtc.h    |  1 +
>  3 files changed, 36 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
> index dc3f8b0dde98..9404f58ee01d 100644
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -793,16 +793,14 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
>  
>  	rename_region(ports, dev_name(&cmos_rtc.rtc->dev));
>  
> -	spin_lock_irq(&rtc_lock);
> -
> -	/* Ensure that the RTC is accessible. Bit 6 must be 0! */
> -	if ((CMOS_READ(RTC_VALID) & 0x40) != 0) {
> -		spin_unlock_irq(&rtc_lock);
> -		dev_warn(dev, "not accessible\n");
> +	if (!mc146818_does_rtc_work()) {
> +		dev_warn(dev, "broken or not accessible\n");
>  		retval = -ENXIO;
>  		goto cleanup1;
>  	}
>  
> +	spin_lock_irq(&rtc_lock);
> +
>  	if (!(flags & CMOS_RTC_FLAGS_NOFREQ)) {
>  		/* force periodic irq to CMOS reset default of 1024Hz;
>  		 *
> diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
> index dcfaf09946ee..b50612ce1a6d 100644
> --- a/drivers/rtc/rtc-mc146818-lib.c
> +++ b/drivers/rtc/rtc-mc146818-lib.c
> @@ -8,10 +8,36 @@
>  #include <linux/acpi.h>
>  #endif
>  
> +/*
> + * If the UIP (Update-in-progress) bit of the RTC is set for more then
> + * 10ms, the RTC is apparently broken or not present.
> + */
> +bool mc146818_does_rtc_work(void)
> +{
> +	int i;
> +	unsigned char val;
> +	unsigned long flags;
> +
> +	for (i = 0; i < 10; i++) {
> +		spin_lock_irqsave(&rtc_lock, flags);
> +		val = CMOS_READ(RTC_FREQ_SELECT);
> +		spin_unlock_irqrestore(&rtc_lock, flags);
> +
> +		if ((val & RTC_UIP) == 0)
> +			return true;
> +
> +		mdelay(1);
> +	}
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(mc146818_does_rtc_work);
> +
>  unsigned int mc146818_get_time(struct rtc_time *time)
>  {
>  	unsigned char ctrl;
>  	unsigned long flags;
> +	unsigned int iter_count = 0;
>  	unsigned char century = 0;
>  	bool retry;
>  
> @@ -20,13 +46,14 @@ unsigned int mc146818_get_time(struct rtc_time *time)
>  #endif
>  
>  again:
> -	spin_lock_irqsave(&rtc_lock, flags);
> -	/* Ensure that the RTC is accessible. Bit 6 must be 0! */
> -	if (WARN_ON_ONCE((CMOS_READ(RTC_VALID) & 0x40) != 0)) {
> -		spin_unlock_irqrestore(&rtc_lock, flags);
> +	if (iter_count > 10) {
> +		pr_err_ratelimited("Unable to read current time from RTC\n");

I'd prefer if we could avoid adding strings in the lib.

>  		memset(time, 0xff, sizeof(*time));
>  		return 0;
>  	}
> +	iter_count++;
> +
> +	spin_lock_irqsave(&rtc_lock, flags);
>  
>  	/*
>  	 * Check whether there is an update in progress during which the
> diff --git a/include/linux/mc146818rtc.h b/include/linux/mc146818rtc.h
> index 0661af17a758..69c80c4325bf 100644
> --- a/include/linux/mc146818rtc.h
> +++ b/include/linux/mc146818rtc.h
> @@ -123,6 +123,7 @@ struct cmos_rtc_board_info {
>  #define RTC_IO_EXTENT_USED      RTC_IO_EXTENT
>  #endif /* ARCH_RTC_LOCATION */
>  
> +bool mc146818_does_rtc_work(void);
>  unsigned int mc146818_get_time(struct rtc_time *time);
>  int mc146818_set_time(struct rtc_time *time);
>  
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
