Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4793042FA50
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 19:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235268AbhJORfV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Oct 2021 13:35:21 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:35925 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232596AbhJORfU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 13:35:20 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A7080240008;
        Fri, 15 Oct 2021 17:33:10 +0000 (UTC)
Date:   Fri, 15 Oct 2021 19:33:10 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 4/8] rtc: max77686: remove useless variable
Message-ID: <YWm7VpFY3LABdKmn@piout.net>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-5-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011155615.257529-5-luca@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/10/2021 17:56:11+0200, Luca Ceresoli wrote:
>> rtc_24hr_mode is set to 1 in max77686_rtc_probe()->max77686_rtc_init_reg()
> before being read and is never set back to 0 again. As such, it is de facto
> a constant.
> 
> Remove the variable and the unreachable code.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  drivers/rtc/rtc-max77686.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index 7e765207f28e..9901c596998a 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -99,7 +99,6 @@ struct max77686_rtc_info {
>  
>  	int rtc_irq;
>  	int virq;
> -	int rtc_24hr_mode;
>  };
>  
>  enum MAX77686_RTC_OP {
> @@ -278,13 +277,7 @@ static void max77686_rtc_data_to_tm(u8 *data, struct rtc_time *tm,
>  
>  	tm->tm_sec = data[RTC_SEC] & mask;
>  	tm->tm_min = data[RTC_MIN] & mask;
> -	if (info->rtc_24hr_mode) {
> -		tm->tm_hour = data[RTC_HOUR] & 0x1f;
> -	} else {
> -		tm->tm_hour = data[RTC_HOUR] & 0x0f;
> -		if (data[RTC_HOUR] & HOUR_PM_MASK)

So I guess HOUR_PM_SHIFT and HOUR_PM_MASK can also be removed

> -			tm->tm_hour += 12;
> -	}
> +	tm->tm_hour = data[RTC_HOUR] & 0x1f;
>  
>  	/* Only a single bit is set in data[], so fls() would be equivalent */
>  	tm->tm_wday = ffs(data[RTC_WEEKDAY] & mask) - 1;
> @@ -662,8 +655,6 @@ static int max77686_rtc_init_reg(struct max77686_rtc_info *info)
>  	data[0] = (1 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
>  	data[1] = (0 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
>  
> -	info->rtc_24hr_mode = 1;
> -
>  	ret = regmap_bulk_write(info->rtc_regmap,
>  				info->drv_data->map[REG_RTC_CONTROLM],
>  				data, ARRAY_SIZE(data));
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
