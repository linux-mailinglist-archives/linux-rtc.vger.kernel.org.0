Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8CB3ED02A
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Aug 2021 10:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234645AbhHPIYf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Aug 2021 04:24:35 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:55833 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbhHPIYe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Aug 2021 04:24:34 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2ABE7E0007;
        Mon, 16 Aug 2021 08:24:01 +0000 (UTC)
Date:   Mon, 16 Aug 2021 10:24:01 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, TimGuo-oc@zhaoxin.com,
        CooperYan@zhaoxin.com, QiyuanWang@zhaoxin.com,
        HerryYang@zhaoxin.com, CobeChen@zhaoxin.com, YanchenSun@zhaoxin.com
Subject: Re: [PATCH] rtc: Fix set RTC time delay 500ms on some Zhaoxin SOCs
Message-ID: <YRogod0HB4d7Og4E@piout.net>
References: <1629121638-3246-1-git-send-email-TonyWWang-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1629121638-3246-1-git-send-email-TonyWWang-oc@zhaoxin.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 16/08/2021 21:47:18+0800, Tony W Wang-oc wrote:
> When the RTC divider is changed from reset to an operating time base,
> the first update cycle should be 500ms later. But on some Zhaoxin SOCs,
> this first update cycle is one second later.
> 
> So set RTC time on these Zhaoxin SOCs will causing 500ms delay.
> 

Can you explain what is the relationship between writing the divider and
the 500ms delay?

Isn't the issue that you are using systohc and set_offset_nsec is set to
NSEC_PER_SEC / 2 ?

> Skip setup RTC divider on these SOCs in mc146818_set_time to fix it.
> 
> Signed-off-by: Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
> ---
>  drivers/rtc/rtc-mc146818-lib.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
> index dcfaf09..322f94b 100644
> --- a/drivers/rtc/rtc-mc146818-lib.c
> +++ b/drivers/rtc/rtc-mc146818-lib.c
> @@ -190,8 +190,18 @@ int mc146818_set_time(struct rtc_time *time)
>  	spin_lock_irqsave(&rtc_lock, flags);
>  	save_control = CMOS_READ(RTC_CONTROL);
>  	CMOS_WRITE((save_control|RTC_SET), RTC_CONTROL);
> +
> +#ifdef CONFIG_X86
> +	if (!((boot_cpu_data.x86_vendor == X86_VENDOR_CENTAUR ||
> +		boot_cpu_data.x86_vendor == X86_VENDOR_ZHAOXIN) &&
> +		(boot_cpu_data.x86 <= 7 && boot_cpu_data.x86_model <= 59))) {
> +		save_freq_select = CMOS_READ(RTC_FREQ_SELECT);
> +		CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
> +	}
> +#else
>  	save_freq_select = CMOS_READ(RTC_FREQ_SELECT);
>  	CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
> +#endif
>  
>  #ifdef CONFIG_MACH_DECSTATION
>  	CMOS_WRITE(real_yrs, RTC_DEC_YEAR);
> @@ -209,7 +219,15 @@ int mc146818_set_time(struct rtc_time *time)
>  #endif
>  
>  	CMOS_WRITE(save_control, RTC_CONTROL);
> +
> +#ifdef CONFIG_X86
> +	if (!((boot_cpu_data.x86_vendor == X86_VENDOR_CENTAUR ||
> +		boot_cpu_data.x86_vendor == X86_VENDOR_ZHAOXIN) &&
> +		(boot_cpu_data.x86 <= 7 && boot_cpu_data.x86_model <= 59)))
> +		CMOS_WRITE(save_freq_select, RTC_FREQ_SELECT);
> +#else
>  	CMOS_WRITE(save_freq_select, RTC_FREQ_SELECT);
> +#endif
>  
>  	spin_unlock_irqrestore(&rtc_lock, flags);
>  
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
