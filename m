Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B61A2CF653
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2019 11:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730008AbfJHJoY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Oct 2019 05:44:24 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:46701 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729624AbfJHJoX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Oct 2019 05:44:23 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F0A4C240018;
        Tue,  8 Oct 2019 09:44:20 +0000 (UTC)
Date:   Tue, 8 Oct 2019 11:44:19 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jinke Fan <fanjinke@hygon.cn>
Cc:     a.zummo@towertech.it, puwen@hygon.cn, thomas.lendacky@amd.com,
        kim.phillips@amd.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtc: Fix the AltCentury value on AMD/Hygon platform
Message-ID: <20191008094419.GT4254@piout.net>
References: <20191008093712.102158-1-fanjinke@hygon.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008093712.102158-1-fanjinke@hygon.cn>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/10/2019 17:37:12+0800, Jinke Fan wrote:
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
>  drivers/rtc/rtc-mc146818-lib.c | 9 +++++++--
>  include/linux/mc146818rtc.h    | 6 ++++++
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
> index 2ecd8752b088..a821dbe215d3 100644
> --- a/drivers/rtc/rtc-mc146818-lib.c
> +++ b/drivers/rtc/rtc-mc146818-lib.c
> @@ -170,9 +170,14 @@ int mc146818_set_time(struct rtc_time *time)
>  	}
>  
>  	save_control = CMOS_READ(RTC_CONTROL);
> -	CMOS_WRITE((save_control|RTC_SET), RTC_CONTROL);
> +	CMOS_WRITE((save_control | RTC_SET), RTC_CONTROL);

Unrelated change.

>  	save_freq_select = CMOS_READ(RTC_FREQ_SELECT);
> -	CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
> +
> +#if defined(CONFIG_CPU_SUP_AMD) || defined(CONFIG_CPU_SUP_HYGON)
> +	CMOS_WRITE((save_freq_select & (~RTC_DV0)), RTC_FREQ_SELECT);

That does break all the other x86 platforms.

> +#else
> +	CMOS_WRITE((save_freq_select | RTC_DIV_RESET2), RTC_FREQ_SELECT);
> +#endif
>  
>  #ifdef CONFIG_MACH_DECSTATION
>  	CMOS_WRITE(real_yrs, RTC_DEC_YEAR);
> diff --git a/include/linux/mc146818rtc.h b/include/linux/mc146818rtc.h
> index 0661af17a758..590ac7849c78 100644
> --- a/include/linux/mc146818rtc.h
> +++ b/include/linux/mc146818rtc.h
> @@ -86,6 +86,12 @@ struct cmos_rtc_board_info {
>     /* 2 values for divider stage reset, others for "testing purposes only" */
>  #  define RTC_DIV_RESET1	0x60
>  #  define RTC_DIV_RESET2	0x70
> +
> +#if defined(CONFIG_CPU_SUP_AMD) || defined(CONFIG_CPU_SUP_HYGON)
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
