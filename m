Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31E6345D030
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Nov 2021 23:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbhKXWr2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Nov 2021 17:47:28 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:49275 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231645AbhKXWr2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 24 Nov 2021 17:47:28 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8782F200002;
        Wed, 24 Nov 2021 22:44:16 +0000 (UTC)
Date:   Wed, 24 Nov 2021 23:44:16 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH RESEND v3 6/7] rtc-cmos: avoid UIP when reading alarm time
Message-ID: <YZ7AQM/KCwC4iz6k@piout.net>
References: <20211119204221.66918-1-mat.jonczyk@o2.pl>
 <20211119204221.66918-7-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211119204221.66918-7-mat.jonczyk@o2.pl>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 19/11/2021 21:42:20+0100, Mateusz Jończyk wrote:
> Some Intel chipsets disconnect the time and date RTC registers when the
> clock update is in progress: during this time reads may return bogus
> values and writes fail silently. This includes the RTC alarm registers.
> [1]
> 
> cmos_read_alarm() did not take account for that, which caused alarm time
> reads to sometimes return bogus values. This can be shown with a test
> patch that I am attaching to this patch series.
> 
> [1] 7th Generation Intel ® Processor Family I/O for U/Y Platforms [...]
> Datasheet, Volume 1 of 2 (Intel's Document Number: 334658-006)
> Page 208
> https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/7th-and-8th-gen-core-family-mobile-u-y-processor-lines-i-o-datasheet-vol-1.pdf
>         "If a RAM read from the ten time and date bytes is attempted
>         during an update cycle, the value read do not necessarily
>         represent the true contents of those locations. Any RAM writes
>         under the same conditions are ignored."
> 
> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> ---
>  drivers/rtc/rtc-cmos.c | 72 ++++++++++++++++++++++++++++--------------
>  1 file changed, 49 insertions(+), 23 deletions(-)
> 

You have a few checkpatch --strict issues in this patch and the next one
that I would be grateful if you could correct them.

> diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
> index 9404f58ee01d..2def331e88b6 100644
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -242,10 +242,46 @@ static int cmos_set_time(struct device *dev, struct rtc_time *t)
>  	return mc146818_set_time(t);
>  }
>  
> +struct cmos_read_alarm_callback_param {
> +	struct cmos_rtc *cmos;
> +	struct rtc_time *time;
> +	unsigned char	rtc_control;
> +};
> +
> +static void cmos_read_alarm_callback(unsigned char __always_unused seconds,
> +		void *param_in)
> +{
> +	struct cmos_read_alarm_callback_param *p =
> +		(struct cmos_read_alarm_callback_param *) param_in;
> +	struct rtc_time *time = p->time;
> +
> +	time->tm_sec = CMOS_READ(RTC_SECONDS_ALARM);
> +	time->tm_min = CMOS_READ(RTC_MINUTES_ALARM);
> +	time->tm_hour = CMOS_READ(RTC_HOURS_ALARM);
> +
> +	if (p->cmos->day_alrm) {
> +		/* ignore upper bits on readback per ACPI spec */
> +		time->tm_mday = CMOS_READ(p->cmos->day_alrm) & 0x3f;
> +		if (!time->tm_mday)
> +			time->tm_mday = -1;
> +
> +		if (p->cmos->mon_alrm) {
> +			time->tm_mon = CMOS_READ(p->cmos->mon_alrm);
> +			if (!time->tm_mon)
> +				time->tm_mon = -1;
> +		}
> +	}
> +
> +	p->rtc_control = CMOS_READ(RTC_CONTROL);
> +}
> +
>  static int cmos_read_alarm(struct device *dev, struct rtc_wkalrm *t)
>  {
>  	struct cmos_rtc	*cmos = dev_get_drvdata(dev);
> -	unsigned char	rtc_control;
> +	struct cmos_read_alarm_callback_param p = {
> +		.cmos = cmos,
> +		.time = &(t->time)
> +	};
>  
>  	/* This not only a rtc_op, but also called directly */
>  	if (!is_valid_irq(cmos->irq))
> @@ -256,28 +292,18 @@ static int cmos_read_alarm(struct device *dev, struct rtc_wkalrm *t)
>  	 * the future.
>  	 */
>  
> -	spin_lock_irq(&rtc_lock);
> -	t->time.tm_sec = CMOS_READ(RTC_SECONDS_ALARM);
> -	t->time.tm_min = CMOS_READ(RTC_MINUTES_ALARM);
> -	t->time.tm_hour = CMOS_READ(RTC_HOURS_ALARM);
> -
> -	if (cmos->day_alrm) {
> -		/* ignore upper bits on readback per ACPI spec */
> -		t->time.tm_mday = CMOS_READ(cmos->day_alrm) & 0x3f;
> -		if (!t->time.tm_mday)
> -			t->time.tm_mday = -1;
> -
> -		if (cmos->mon_alrm) {
> -			t->time.tm_mon = CMOS_READ(cmos->mon_alrm);
> -			if (!t->time.tm_mon)
> -				t->time.tm_mon = -1;
> -		}
> -	}
> -
> -	rtc_control = CMOS_READ(RTC_CONTROL);
> -	spin_unlock_irq(&rtc_lock);
> +	/* Some Intel chipsets disconnect the alarm registers when the clock
> +	 * update is in progress - during this time reads return bogus values
> +	 * and writes may fail silently. See for example "7th Generation Intel®
> +	 * Processor Family I/O for U/Y Platforms [...] Datasheet", section
> +	 * 27.7.1
> +	 *
> +	 * Use the mc146818_do_avoiding_UIP() function to avoid this.
> +	 */
> +	if (!mc146818_do_avoiding_UIP(cmos_read_alarm_callback, &p))
> +		return -EIO;
>  
> -	if (!(rtc_control & RTC_DM_BINARY) || RTC_ALWAYS_BCD) {
> +	if (!(p.rtc_control & RTC_DM_BINARY) || RTC_ALWAYS_BCD) {
>  		if (((unsigned)t->time.tm_sec) < 0x60)
>  			t->time.tm_sec = bcd2bin(t->time.tm_sec);
>  		else
> @@ -306,7 +332,7 @@ static int cmos_read_alarm(struct device *dev, struct rtc_wkalrm *t)
>  		}
>  	}
>  
> -	t->enabled = !!(rtc_control & RTC_AIE);
> +	t->enabled = !!(p.rtc_control & RTC_AIE);
>  	t->pending = 0;
>  
>  	return 0;
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
