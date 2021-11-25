Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA43445D5F9
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Nov 2021 09:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351442AbhKYIKs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 25 Nov 2021 03:10:48 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:32961 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbhKYIIs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 25 Nov 2021 03:08:48 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id B539B200005;
        Thu, 25 Nov 2021 08:05:35 +0000 (UTC)
Date:   Thu, 25 Nov 2021 09:05:35 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH RESEND v3 4/7] rtc-mc146818-lib: refactor
 mc146818_get_time
Message-ID: <YZ9Dz8gU5yZGqUh1@piout.net>
References: <20211119204221.66918-1-mat.jonczyk@o2.pl>
 <20211119204221.66918-5-mat.jonczyk@o2.pl>
 <YZ6/mDlT92Zv4L2B@piout.net>
 <54af597c-544d-0306-15f5-91c4a78d832c@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54af597c-544d-0306-15f5-91c4a78d832c@o2.pl>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 25/11/2021 06:48:38+0100, Mateusz Jończyk wrote:
> W dniu 24.11.2021 o 23:41, Alexandre Belloni pisze:
> > On 19/11/2021 21:42:18+0100, Mateusz Jończyk wrote:
> >> Refactor mc146818_get_time() to make use of mc146818_do_avoiding_UIP().
> >>
> >> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
> >> Cc: Alessandro Zummo <a.zummo@towertech.it>
> >> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >>
> >> ---
> >>
> >>  drivers/rtc/rtc-mc146818-lib.c | 111 +++++++++++++--------------------
> >>  1 file changed, 43 insertions(+), 68 deletions(-)
> >>
> >> I'm sorry that the diff is quite difficult to read, but I was unable to
> >> fix this easily.
> >>
> >> diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
> >> index 946ad43a512c..f3178244db37 100644
> >> --- a/drivers/rtc/rtc-mc146818-lib.c
> >> +++ b/drivers/rtc/rtc-mc146818-lib.c
> >> @@ -102,50 +102,20 @@ bool mc146818_does_rtc_work(void)
> >>  }
> >>  EXPORT_SYMBOL_GPL(mc146818_does_rtc_work);
> >>  
> >> -unsigned int mc146818_get_time(struct rtc_time *time)
> >> -{
> >> +struct mc146818_get_time_callback_param {
> >> +	struct rtc_time *time;
> >>  	unsigned char ctrl;
> >> -	unsigned long flags;
> >> -	unsigned int iter_count = 0;
> >> -	unsigned char century = 0;
> >> -	bool retry;
> >> -
> >> +#ifdef CONFIG_ACPI
> >> +	unsigned char century;
> >> +#endif
> >>  #ifdef CONFIG_MACH_DECSTATION
> >>  	unsigned int real_year;
> >>  #endif
> >> +};
> >>  
> >> -again:
> >> -	if (iter_count > 10) {
> >> -		pr_err_ratelimited("Unable to read current time from RTC\n");
> >> -		memset(time, 0xff, sizeof(*time));
> >> -		return 0;
> >> -	}
> >> -	iter_count++;
> >> -
> >> -	spin_lock_irqsave(&rtc_lock, flags);
> >> -
> >> -	/*
> >> -	 * Check whether there is an update in progress during which the
> >> -	 * readout is unspecified. The maximum update time is ~2ms. Poll
> >> -	 * every msec for completion.
> >> -	 *
> >> -	 * Store the second value before checking UIP so a long lasting NMI
> >> -	 * which happens to hit after the UIP check cannot make an update
> >> -	 * cycle invisible.
> >> -	 */
> >> -	time->tm_sec = CMOS_READ(RTC_SECONDS);
> >> -
> >> -	if (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) {
> >> -		spin_unlock_irqrestore(&rtc_lock, flags);
> >> -		mdelay(1);
> >> -		goto again;
> >> -	}
> >> -
> >> -	/* Revalidate the above readout */
> >> -	if (time->tm_sec != CMOS_READ(RTC_SECONDS)) {
> >> -		spin_unlock_irqrestore(&rtc_lock, flags);
> >> -		goto again;
> >> -	}
> >> +static void mc146818_get_time_callback(unsigned char seconds, void *param_in)
> >> +{
> >> +	struct mc146818_get_time_callback_param *p = param_in;
> >>  
> >>  	/*
> >>  	 * Only the values that we read from the RTC are set. We leave
> >> @@ -153,39 +123,40 @@ unsigned int mc146818_get_time(struct rtc_time *time)
> >>  	 * RTC has RTC_DAY_OF_WEEK, we ignore it, as it is only updated
> >>  	 * by the RTC when initially set to a non-zero value.
> >>  	 */
> >> -	time->tm_min = CMOS_READ(RTC_MINUTES);
> >> -	time->tm_hour = CMOS_READ(RTC_HOURS);
> >> -	time->tm_mday = CMOS_READ(RTC_DAY_OF_MONTH);
> >> -	time->tm_mon = CMOS_READ(RTC_MONTH);
> >> -	time->tm_year = CMOS_READ(RTC_YEAR);
> >> +	p->time->tm_sec = seconds;
> >> +	p->time->tm_min = CMOS_READ(RTC_MINUTES);
> >> +	p->time->tm_hour = CMOS_READ(RTC_HOURS);
> >> +	p->time->tm_mday = CMOS_READ(RTC_DAY_OF_MONTH);
> >> +	p->time->tm_mon = CMOS_READ(RTC_MONTH);
> >> +	p->time->tm_year = CMOS_READ(RTC_YEAR);
> >>  #ifdef CONFIG_MACH_DECSTATION
> >> -	real_year = CMOS_READ(RTC_DEC_YEAR);
> >> +	p->real_year = CMOS_READ(RTC_DEC_YEAR);
> >>  #endif
> >>  #ifdef CONFIG_ACPI
> >>  	if (acpi_gbl_FADT.header.revision >= FADT2_REVISION_ID &&
> >> -	    acpi_gbl_FADT.century)
> >> -		century = CMOS_READ(acpi_gbl_FADT.century);
> >> +	    acpi_gbl_FADT.century) {
> >> +		p->century = CMOS_READ(acpi_gbl_FADT.century);
> >> +	} else {
> >> +		p->century = 0;
> >> +	}
> >>  #endif
> >> -	ctrl = CMOS_READ(RTC_CONTROL);
> >> -	/*
> >> -	 * Check for the UIP bit again. If it is set now then
> >> -	 * the above values may contain garbage.
> >> -	 */
> >> -	retry = CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP;
> >> -	/*
> >> -	 * A NMI might have interrupted the above sequence so check whether
> >> -	 * the seconds value has changed which indicates that the NMI took
> >> -	 * longer than the UIP bit was set. Unlikely, but possible and
> >> -	 * there is also virt...
> >> -	 */
> >> -	retry |= time->tm_sec != CMOS_READ(RTC_SECONDS);
> >>  
> >> -	spin_unlock_irqrestore(&rtc_lock, flags);
> >> +	p->ctrl = CMOS_READ(RTC_CONTROL);
> >> +}
> >>  
> >> -	if (retry)
> >> -		goto again;
> >> +unsigned int mc146818_get_time(struct rtc_time *time)
> >> +{
> >> +	struct mc146818_get_time_callback_param p = {
> >> +		.time = time
> >> +	};
> >>  
> >> -	if (!(ctrl & RTC_DM_BINARY) || RTC_ALWAYS_BCD)
> >> +	if (!mc146818_do_avoiding_UIP(mc146818_get_time_callback, &p)) {
> >> +		pr_err_ratelimited("Unable to read current time from RTC\n");
> >> +		memset(time, 0xff, sizeof(*time));
> >> +		return 0;
> >> +	}
> >> +
> >> +	if (!(p.ctrl & RTC_DM_BINARY) || RTC_ALWAYS_BCD)
> >>  	{
> >>  		time->tm_sec = bcd2bin(time->tm_sec);
> >>  		time->tm_min = bcd2bin(time->tm_min);
> >> @@ -193,15 +164,19 @@ unsigned int mc146818_get_time(struct rtc_time *time)
> >>  		time->tm_mday = bcd2bin(time->tm_mday);
> >>  		time->tm_mon = bcd2bin(time->tm_mon);
> >>  		time->tm_year = bcd2bin(time->tm_year);
> >> -		century = bcd2bin(century);
> >> +#ifdef CONFIG_ACPI
> >> +		p.century = bcd2bin(p.century);
> >> +#endif
> >>  	}
> >>  
> >>  #ifdef CONFIG_MACH_DECSTATION
> >> -	time->tm_year += real_year - 72;
> >> +	time->tm_year += p.real_year - 72;
> >>  #endif
> >>  
> >> -	if (century > 20)
> >> -		time->tm_year += (century - 19) * 100;
> >> +#ifdef CONFIG_ACPI
> > This is an unrelated change
> 
> Well, now, when CONFIG_ACPI is not defined, p.century does not exist, so this #ifdef
> is required. I could unconditionally define "century" in mc146818_get_time_callback_param and set
> it manually to 0 when CONFIG_ACPI is not defined. I thought that this approach is more difficult
> to analyse, so did not use it. Should I do this?
> 

No, that's fine, thanks!

> Previously, when CONFIG_ACPI was not defined, century was always 0, so
> this doesn't change behaviour.
> 
> Greetings,
> 
> Mateusz
> 
> >> +	if (p.century > 20)
> >> +		time->tm_year += (p.century - 19) * 100;
> >> +#endif
> >>  
> >>  	/*
> >>  	 * Account for differences between how the RTC uses the values
> >> -- 
> >> 2.25.1
> >>
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
