Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85274304C63
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Jan 2021 23:41:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729614AbhAZWkp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Jan 2021 17:40:45 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:57345 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393913AbhAZSBw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Jan 2021 13:01:52 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 22EDEE001A;
        Tue, 26 Jan 2021 18:00:42 +0000 (UTC)
Date:   Tue, 26 Jan 2021 19:00:42 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH V2] rtc: mc146818: Detect and handle broken RTCs
Message-ID: <20210126180042.GC1196852@piout.net>
References: <20201206214613.444124194@linutronix.de>
 <20201206220541.594826678@linutronix.de>
 <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net>
 <871re7hlsg.fsf@nanos.tec.linutronix.de>
 <98cb59e8-ecb4-e29d-0b8f-73683ef2bee7@digikod.net>
 <87y2gfg18p.fsf@nanos.tec.linutronix.de>
 <87tur3fx7w.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tur3fx7w.fsf@nanos.tec.linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 26/01/2021 18:02:11+0100, Thomas Gleixner wrote:
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
> Tested-by: Mickaël Salaün <mic@linux.microsoft.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
> V2: Fixed the sizeof() as spotted by Mickaël
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
> +		memset(time, 0xff, sizeof(*time));
> +		return 0;
> +	}
> +
>  	/*
>  	 * Check whether there is an update in progress during which the
>  	 * readout is unspecified. The maximum update time is ~2ms. Poll

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
