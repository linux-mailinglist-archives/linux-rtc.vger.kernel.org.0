Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4188DDB46
	for <lists+linux-rtc@lfdr.de>; Sun, 20 Oct 2019 00:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbfJSWFA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 19 Oct 2019 18:05:00 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:44631 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbfJSWFA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 19 Oct 2019 18:05:00 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C9A101BF204;
        Sat, 19 Oct 2019 22:04:56 +0000 (UTC)
Date:   Sun, 20 Oct 2019 00:04:56 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jinke Fan <fanjinke@hygon.cn>
Cc:     a.zummo@towertech.it, puwen@hygon.cn, thomas.lendacky@amd.com,
        kim.phillips@amd.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND RFC PATCH v3] rtc: Fix the AltCentury value on AMD/Hygon
 platform
Message-ID: <20191019220456.GP3125@piout.net>
References: <20191015080827.11589-1-fanjinke@hygon.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015080827.11589-1-fanjinke@hygon.cn>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 15/10/2019 16:08:27+0800, Jinke Fan wrote:
> When using following operations:
> date -s "21190910 19:20:00"
> hwclock -w
> to change date from 2019 to 2119 for test, it will fail on Hygon
> Dhyana and AMD Zen CPUs, while the same operations run ok on Intel i7
> platform.
> 
> MC146818 driver use function mc146818_set_time() to set register
> RTC_FREQ_SELECT(RTC_REG_A)'s bit4-bit6 field which means divider stage
> reset value on Intel platform to 0x7.
> 
> While AMD/Hygon RTC_REG_A(0Ah)'s bit4 is defined as DV0 [Reference]:
> DV0 = 0 selects Bank 0, DV0 = 1 selects Bank 1. Bit5-bit6 is defined
> as reserved.
> 
> DV0 is set to 1, it will select Bank 1, which will disable AltCentury
> register(0x32) access. As UEFI pass acpi_gbl_FADT.century 0x32
> (AltCentury), the CMOS write will be failed on code:
> CMOS_WRITE(century, acpi_gbl_FADT.century).
> 
> Correct RTC_REG_A bank select bit(DV0) to 0 on AMD/Hygon CPUs, it will
> enable AltCentury(0x32) register writing and finally setup century as
> expected.
> 
> Test results on AMD/Hygon machine show that it works as expected.
> 
> Reference:
> https://www.amd.com/system/files/TechDocs/51192_Bolton_FCH_RRG.pdf
> section: 3.13 Real Time Clock (RTC)
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Jinke Fan <fanjinke@hygon.cn>
> ---
> 
> v2->v3:
>   - Make the changes only relevant to AMD/Hygon.
> 
> v1->v2:
>   - Fix the compile errors on sparc64/alpha platform.
> 
>  drivers/rtc/rtc-mc146818-lib.c | 11 ++++++++++-
>  include/linux/mc146818rtc.h    |  6 ++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
> index 2ecd8752b088..70502881785d 100644
> --- a/drivers/rtc/rtc-mc146818-lib.c
> +++ b/drivers/rtc/rtc-mc146818-lib.c
> @@ -172,7 +172,16 @@ int mc146818_set_time(struct rtc_time *time)
>  	save_control = CMOS_READ(RTC_CONTROL);
>  	CMOS_WRITE((save_control|RTC_SET), RTC_CONTROL);
>  	save_freq_select = CMOS_READ(RTC_FREQ_SELECT);
> -	CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
> +
> +#ifdef CONFIG_X86
> +	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
> +	    boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
> +		CMOS_WRITE((save_freq_select & (~RTC_DV0)), RTC_FREQ_SELECT);

This should probably use ~RTC_DIV_RESET2.

> +	else
> +		CMOS_WRITE((save_freq_select | RTC_DIV_RESET2), RTC_FREQ_SELECT);
> +#else
> +	CMOS_WRITE((save_freq_select | RTC_DIV_RESET2), RTC_FREQ_SELECT);
> +#endif

Also, later you have:

CMOS_WRITE(save_freq_select, RTC_FREQ_SELECT);

This may write bit4 again which would make mc146818_get_time fail so you
probably want to update save_freq_select.

>  
>  #ifdef CONFIG_MACH_DECSTATION
>  	CMOS_WRITE(real_yrs, RTC_DEC_YEAR);
> diff --git a/include/linux/mc146818rtc.h b/include/linux/mc146818rtc.h
> index 0661af17a758..7066a7bced61 100644
> --- a/include/linux/mc146818rtc.h
> +++ b/include/linux/mc146818rtc.h
> @@ -86,6 +86,12 @@ struct cmos_rtc_board_info {
>     /* 2 values for divider stage reset, others for "testing purposes only" */
>  #  define RTC_DIV_RESET1	0x60
>  #  define RTC_DIV_RESET2	0x70
> +
> +#ifdef CONFIG_X86
> +   /* DV0 = 0 selects Bank 0, DV0 = 1 selects Bank 1 on AMD/Hygon platform */
> +#  define RTC_DV0		0x10
> +#endif
> +
>    /* Periodic intr. / Square wave rate select. 0=none, 1=32.8kHz,... 15=2Hz */
>  # define RTC_RATE_SELECT 	0x0F
>  
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
