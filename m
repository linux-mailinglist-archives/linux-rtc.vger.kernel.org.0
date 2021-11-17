Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D64EA454E91
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Nov 2021 21:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhKQUeB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Nov 2021 15:34:01 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:49817 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbhKQUeA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 17 Nov 2021 15:34:00 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 13D44200008;
        Wed, 17 Nov 2021 20:30:58 +0000 (UTC)
Date:   Wed, 17 Nov 2021 21:30:58 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 2/8] rtc: max77686: rename day-of-month defines
Message-ID: <YZVmgo1PEyA3Rv6/@piout.net>
References: <20211111225852.3128201-1-luca@lucaceresoli.net>
 <20211111225852.3128201-3-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111225852.3128201-3-luca@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/11/2021 23:58:46+0100, Luca Ceresoli wrote:
> RTC_DATE and REG_RTC_DATE are used for the registers holding the day of
> month. Rename these constants to mean what they mean.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
> 
> Changes in v3: none
> 
> Changes in v2:
>  - fix drivers/mfd/max77686.c build failure due to missing rename
>    (Reported-by: kernel test robot <lkp@intel.com>)
> ---
>  drivers/mfd/max77686.c               |  2 +-
>  drivers/rtc/rtc-max77686.c           | 16 ++++++++--------
>  include/linux/mfd/max77686-private.h |  4 ++--
>  3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
> index f9e12ab2bc75..2ac64277fb84 100644
> --- a/drivers/mfd/max77686.c
> +++ b/drivers/mfd/max77686.c
> @@ -87,7 +87,7 @@ static bool max77802_rtc_is_volatile_reg(struct device *dev, unsigned int reg)
>  		reg == MAX77802_RTC_WEEKDAY ||
>  		reg == MAX77802_RTC_MONTH ||
>  		reg == MAX77802_RTC_YEAR ||
> -		reg == MAX77802_RTC_DATE);
> +		reg == MAX77802_RTC_MONTHDAY);
>  }
>  
>  static bool max77802_is_volatile_reg(struct device *dev, unsigned int reg)
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index bac52cdea97d..7e765207f28e 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -57,7 +57,7 @@ enum {
>  	RTC_WEEKDAY,
>  	RTC_MONTH,
>  	RTC_YEAR,
> -	RTC_DATE,
> +	RTC_MONTHDAY,
>  	RTC_NR_TIME
>  };
>  
> @@ -119,7 +119,7 @@ enum max77686_rtc_reg_offset {
>  	REG_RTC_WEEKDAY,
>  	REG_RTC_MONTH,
>  	REG_RTC_YEAR,
> -	REG_RTC_DATE,
> +	REG_RTC_MONTHDAY,
>  	REG_ALARM1_SEC,
>  	REG_ALARM1_MIN,
>  	REG_ALARM1_HOUR,
> @@ -150,7 +150,7 @@ static const unsigned int max77686_map[REG_RTC_END] = {
>  	[REG_RTC_WEEKDAY]    = MAX77686_RTC_WEEKDAY,
>  	[REG_RTC_MONTH]      = MAX77686_RTC_MONTH,
>  	[REG_RTC_YEAR]       = MAX77686_RTC_YEAR,
> -	[REG_RTC_DATE]       = MAX77686_RTC_DATE,
> +	[REG_RTC_MONTHDAY]   = MAX77686_RTC_MONTHDAY,
>  	[REG_ALARM1_SEC]     = MAX77686_ALARM1_SEC,
>  	[REG_ALARM1_MIN]     = MAX77686_ALARM1_MIN,
>  	[REG_ALARM1_HOUR]    = MAX77686_ALARM1_HOUR,
> @@ -233,7 +233,7 @@ static const unsigned int max77802_map[REG_RTC_END] = {
>  	[REG_RTC_WEEKDAY]    = MAX77802_RTC_WEEKDAY,
>  	[REG_RTC_MONTH]      = MAX77802_RTC_MONTH,
>  	[REG_RTC_YEAR]       = MAX77802_RTC_YEAR,
> -	[REG_RTC_DATE]       = MAX77802_RTC_DATE,
> +	[REG_RTC_MONTHDAY]   = MAX77802_RTC_MONTHDAY,
>  	[REG_ALARM1_SEC]     = MAX77802_ALARM1_SEC,
>  	[REG_ALARM1_MIN]     = MAX77802_ALARM1_MIN,
>  	[REG_ALARM1_HOUR]    = MAX77802_ALARM1_HOUR,
> @@ -288,7 +288,7 @@ static void max77686_rtc_data_to_tm(u8 *data, struct rtc_time *tm,
>  
>  	/* Only a single bit is set in data[], so fls() would be equivalent */
>  	tm->tm_wday = ffs(data[RTC_WEEKDAY] & mask) - 1;
> -	tm->tm_mday = data[RTC_DATE] & 0x1f;
> +	tm->tm_mday = data[RTC_MONTHDAY] & 0x1f;
>  	tm->tm_mon = (data[RTC_MONTH] & 0x0f) - 1;
>  	tm->tm_year = data[RTC_YEAR] & mask;
>  	tm->tm_yday = 0;
> @@ -309,7 +309,7 @@ static int max77686_rtc_tm_to_data(struct rtc_time *tm, u8 *data,
>  	data[RTC_MIN] = tm->tm_min;
>  	data[RTC_HOUR] = tm->tm_hour;
>  	data[RTC_WEEKDAY] = 1 << tm->tm_wday;
> -	data[RTC_DATE] = tm->tm_mday;
> +	data[RTC_MONTHDAY] = tm->tm_mday;
>  	data[RTC_MONTH] = tm->tm_mon + 1;
>  
>  	if (info->drv_data->alarm_enable_reg) {
> @@ -565,8 +565,8 @@ static int max77686_rtc_start_alarm(struct max77686_rtc_info *info)
>  			data[RTC_MONTH] |= (1 << ALARM_ENABLE_SHIFT);
>  		if (data[RTC_YEAR] & info->drv_data->mask)
>  			data[RTC_YEAR] |= (1 << ALARM_ENABLE_SHIFT);
> -		if (data[RTC_DATE] & 0x1f)
> -			data[RTC_DATE] |= (1 << ALARM_ENABLE_SHIFT);
> +		if (data[RTC_MONTHDAY] & 0x1f)
> +			data[RTC_MONTHDAY] |= (1 << ALARM_ENABLE_SHIFT);
>  
>  		ret = regmap_bulk_write(info->rtc_regmap, map[REG_ALARM1_SEC],
>  					data, ARRAY_SIZE(data));
> diff --git a/include/linux/mfd/max77686-private.h b/include/linux/mfd/max77686-private.h
> index b1482b3cf353..3acceeedbaba 100644
> --- a/include/linux/mfd/max77686-private.h
> +++ b/include/linux/mfd/max77686-private.h
> @@ -152,7 +152,7 @@ enum max77686_rtc_reg {
>  	MAX77686_RTC_WEEKDAY		= 0x0A,
>  	MAX77686_RTC_MONTH		= 0x0B,
>  	MAX77686_RTC_YEAR		= 0x0C,
> -	MAX77686_RTC_DATE		= 0x0D,
> +	MAX77686_RTC_MONTHDAY		= 0x0D,
>  	MAX77686_ALARM1_SEC		= 0x0E,
>  	MAX77686_ALARM1_MIN		= 0x0F,
>  	MAX77686_ALARM1_HOUR		= 0x10,
> @@ -352,7 +352,7 @@ enum max77802_rtc_reg {
>  	MAX77802_RTC_WEEKDAY		= 0xCA,
>  	MAX77802_RTC_MONTH		= 0xCB,
>  	MAX77802_RTC_YEAR		= 0xCC,
> -	MAX77802_RTC_DATE		= 0xCD,
> +	MAX77802_RTC_MONTHDAY		= 0xCD,
>  	MAX77802_RTC_AE1		= 0xCE,
>  	MAX77802_ALARM1_SEC		= 0xCF,
>  	MAX77802_ALARM1_MIN		= 0xD0,
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
