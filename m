Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCFD2D6C3B
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Dec 2020 01:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732389AbgLKAAY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Dec 2020 19:00:24 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:31781 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389587AbgLJX7w (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Dec 2020 18:59:52 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 0C1D1240006;
        Thu, 10 Dec 2020 23:59:08 +0000 (UTC)
Date:   Fri, 11 Dec 2020 00:59:08 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch 4/8] rtc: core: Make the sync offset default more
 realistic
Message-ID: <20201210235908.GA1781038@piout.net>
References: <20201206214613.444124194@linutronix.de>
 <20201206220541.960333166@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201206220541.960333166@linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 06/12/2020 22:46:17+0100, Thomas Gleixner wrote:
> The offset which is used to steer the start of an RTC synchronization
> update via rtc_set_ntp_time() is huge. The math behind this is:
> 
>   tsched       twrite(t2.tv_sec - 1) 	 t2 (seconds increment)
> 
> twrite - tsched is the transport time for the write to hit the device.
> 
> t2 - twrite depends on the chip and is for most chips one second.
> 
> The rtc_set_ntp_time() calculation of tsched is:
> 
>     tsched = t2 - 1sec - (t2 - twrite)
> 
> The default for the sync offset is 500ms which means that twrite - tsched
> is 500ms assumed that t2 - twrite is one second.
> 
> This is 0.5 seconds off for RTCs which are directly accessible by IO writes
> and probably for the majority of i2C/SPI based RTC off by an order of
> magnitude. Set it to 10ms which should bring it closer to reality.
> 
> The default can be adjusted by drivers (rtc_cmos does so) and could be
> adjusted further by a calibration method which is an orthogonal problem.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/rtc/class.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/drivers/rtc/class.c
> +++ b/drivers/rtc/class.c
> @@ -201,7 +201,7 @@ static struct rtc_device *rtc_allocate_d
>  	device_initialize(&rtc->dev);
>  
>  	/* Drivers can revise this default after allocating the device. */
> -	rtc->set_offset_nsec =  NSEC_PER_SEC / 2;
> +	rtc->set_offset_nsec =  10 * NSEC_PER_MSEC;

I did retest, on a slow 100kHz i2c bus, with a fairly inconvenient RTC,
The maximum offset to set the RTC was 4845533ns so I'd say 10ms is too
large. Should we make that 5ms ?

Apart from that, on the series, you can add my
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
