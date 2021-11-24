Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4801F45D022
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Nov 2021 23:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243451AbhKXWmc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Nov 2021 17:42:32 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:59427 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242545AbhKXWmc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 24 Nov 2021 17:42:32 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id CAC05240006;
        Wed, 24 Nov 2021 22:39:20 +0000 (UTC)
Date:   Wed, 24 Nov 2021 23:39:20 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH RESEND v3 3/7] rtc-mc146818-lib: extract
 mc146818_do_avoiding_UIP
Message-ID: <YZ6/GC3xouzEZmEh@piout.net>
References: <20211119204221.66918-1-mat.jonczyk@o2.pl>
 <20211119204221.66918-4-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211119204221.66918-4-mat.jonczyk@o2.pl>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 19/11/2021 21:42:17+0100, Mateusz Jończyk wrote:
> Function mc146818_get_time() contains an elaborate mechanism of reading
> the RTC time while no RTC update is in progress. It turns out that
> reading the RTC alarm clock also requires avoiding the RTC update (see
> following patches). Therefore, the mechanism in mc146818_get_time()
> should be reused - so extract it into a separate function.
> 
> The logic in mc146818_do_avoiding_UIP() is same as in
> mc146818_get_time() except that after every
> 
>         if (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) {
> 
> there is now "mdelay(1)".
> 
> To avoid producing an unreadable diff, mc146818_get_time() will be
> refactored to use mc146818_do_avoiding_UIP() in the next patch.
> 
> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> ---
>  drivers/rtc/rtc-mc146818-lib.c | 69 ++++++++++++++++++++++++++++++++++
>  include/linux/mc146818rtc.h    |  3 ++
>  2 files changed, 72 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
> index b50612ce1a6d..946ad43a512c 100644
> --- a/drivers/rtc/rtc-mc146818-lib.c
> +++ b/drivers/rtc/rtc-mc146818-lib.c
> @@ -8,6 +8,75 @@
>  #include <linux/acpi.h>
>  #endif
>  
> +/*
> + * Execute a function while the UIP (Update-in-progress) bit of the RTC is
> + * unset.
> + *
> + * Warning: callback may be executed more then once.
> + */
> +bool mc146818_do_avoiding_UIP(mc146818_callback_t callback, void *param)

mc146818_avoid_UIP would be a simpler name. Also, I'm pretty sure we can
avoid the mc146818_callback_t typedef

> +{
> +	int i;
> +	unsigned long flags;
> +	unsigned char seconds;
> +
> +	for (i = 0; i < 10; i++) {
> +		spin_lock_irqsave(&rtc_lock, flags);
> +
> +		/*
> +		 * Check whether there is an update in progress during which the
> +		 * readout is unspecified. The maximum update time is ~2ms. Poll
> +		 * every msec for completion.
> +		 *
> +		 * Store the second value before checking UIP so a long lasting
> +		 * NMI which happens to hit after the UIP check cannot make
> +		 * an update cycle invisible.
> +		 */
> +		seconds = CMOS_READ(RTC_SECONDS);
> +
> +		if (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) {
> +			spin_unlock_irqrestore(&rtc_lock, flags);
> +			mdelay(1);
> +			continue;
> +		}
> +
> +		/* Revalidate the above readout */
> +		if (seconds != CMOS_READ(RTC_SECONDS)) {
> +			spin_unlock_irqrestore(&rtc_lock, flags);
> +			continue;
> +		}
> +
> +		if (callback)
> +			callback(seconds, param);
> +
> +		/*
> +		 * Check for the UIP bit again. If it is set now then
> +		 * the above values may contain garbage.
> +		 */
> +		if (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) {
> +			spin_unlock_irqrestore(&rtc_lock, flags);
> +			mdelay(1);
> +			continue;
> +		}
> +
> +		/*
> +		 * A NMI might have interrupted the above sequence so check
> +		 * whether the seconds value has changed which indicates that
> +		 * the NMI took longer than the UIP bit was set. Unlikely, but
> +		 * possible and there is also virt...
> +		 */
> +		if (seconds != CMOS_READ(RTC_SECONDS)) {
> +			spin_unlock_irqrestore(&rtc_lock, flags);
> +			continue;
> +		}
> +		spin_unlock_irqrestore(&rtc_lock, flags);
> +
> +		return true;
> +	}
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(mc146818_do_avoiding_UIP);
> +
>  /*
>   * If the UIP (Update-in-progress) bit of the RTC is set for more then
>   * 10ms, the RTC is apparently broken or not present.
> diff --git a/include/linux/mc146818rtc.h b/include/linux/mc146818rtc.h
> index 69c80c4325bf..c0cea97461a0 100644
> --- a/include/linux/mc146818rtc.h
> +++ b/include/linux/mc146818rtc.h
> @@ -127,4 +127,7 @@ bool mc146818_does_rtc_work(void);
>  unsigned int mc146818_get_time(struct rtc_time *time);
>  int mc146818_set_time(struct rtc_time *time);
>  
> +typedef void (*mc146818_callback_t)(unsigned char seconds, void *param);
> +bool mc146818_do_avoiding_UIP(mc146818_callback_t callback, void *param);
> +
>  #endif /* _MC146818RTC_H */
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
