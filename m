Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE73A23BD1F
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Aug 2020 17:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729648AbgHDPUr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Aug 2020 11:20:47 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:46135 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728586AbgHDPUr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Aug 2020 11:20:47 -0400
X-Originating-IP: 86.202.118.225
Received: from localhost (lfbn-lyo-1-23-225.w86-202.abo.wanadoo.fr [86.202.118.225])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id CF81A1C0008;
        Tue,  4 Aug 2020 15:20:44 +0000 (UTC)
Date:   Tue, 4 Aug 2020 17:20:44 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] RTC: Implement pretimeout watchdog for DS1307
Message-ID: <20200804152044.GB10725@piout.net>
References: <20200804051743.19115-1-mark.tomlinson@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200804051743.19115-1-mark.tomlinson@alliedtelesis.co.nz>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

The subject prefix is not correct, it should be rtc: ds1307:

Also, shouldn't that kind of software timeout which doesn't actually
depend on the hardware better be handled in the watchdog core? Then this
will benefit all the watchdog and will certainly avoid a lot of code
duplication.

On 04/08/2020 17:17:43+1200, Mark Tomlinson wrote:
> If the hardware watchdog in the clock chip simply pulls the reset line
> of the CPU, then there is no chance to write a stack trace to help
> determine what may have been blocking the CPU.
> 
> This patch adds a pretimeout to the watchdog, which, if enabled, sets
> a timer to go off before the hardware watchdog kicks in, and calls
> the standard pretimeout function, which can (for example) call panic.
> 
> Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
> ---
>  drivers/rtc/rtc-ds1307.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index 49702942bb08..647f8659d0bd 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -23,6 +23,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/regmap.h>
>  #include <linux/watchdog.h>
> +#include <linux/timer.h>
>  
>  /*
>   * We can't determine type by probing, but if we expect pre-Linux code
> @@ -174,6 +175,10 @@ struct ds1307 {
>  #ifdef CONFIG_COMMON_CLK
>  	struct clk_hw		clks[2];
>  #endif
> +#ifdef CONFIG_WATCHDOG_CORE
> +	struct timer_list	soft_timer;
> +	struct watchdog_device	*wdt;
> +#endif
>  };
>  
>  struct chip_desc {
> @@ -863,12 +868,34 @@ static int m41txx_rtc_set_offset(struct device *dev, long offset)
>  }
>  
>  #ifdef CONFIG_WATCHDOG_CORE
> +static void ds1388_soft_wdt_expire(struct timer_list *soft_timer)
> +{
> +	struct ds1307 *ds1307 = container_of(soft_timer, struct ds1307, soft_timer);
> +
> +	watchdog_notify_pretimeout(ds1307->wdt);
> +}
> +
> +static void ds1388_soft_timer_set(struct watchdog_device *wdt_dev)
> +{
> +	struct ds1307 *ds1307 = watchdog_get_drvdata(wdt_dev);
> +	int soft_timeout;
> +
> +	if (wdt_dev->pretimeout > 0) {
> +		soft_timeout = wdt_dev->timeout - wdt_dev->pretimeout;
> +		mod_timer(&ds1307->soft_timer, jiffies + soft_timeout * HZ);
> +	} else {
> +		del_timer(&ds1307->soft_timer);
> +	}
> +}
> +
>  static int ds1388_wdt_start(struct watchdog_device *wdt_dev)
>  {
>  	struct ds1307 *ds1307 = watchdog_get_drvdata(wdt_dev);
>  	u8 regs[2];
>  	int ret;
>  
> +	ds1388_soft_timer_set(wdt_dev);
> +
>  	ret = regmap_update_bits(ds1307->regmap, DS1388_REG_FLAG,
>  				 DS1388_BIT_WF, 0);
>  	if (ret)
> @@ -900,6 +927,7 @@ static int ds1388_wdt_stop(struct watchdog_device *wdt_dev)
>  {
>  	struct ds1307 *ds1307 = watchdog_get_drvdata(wdt_dev);
>  
> +	del_timer(&ds1307->soft_timer);
>  	return regmap_update_bits(ds1307->regmap, DS1388_REG_CONTROL,
>  				  DS1388_BIT_WDE | DS1388_BIT_RST, 0);
>  }
> @@ -909,6 +937,7 @@ static int ds1388_wdt_ping(struct watchdog_device *wdt_dev)
>  	struct ds1307 *ds1307 = watchdog_get_drvdata(wdt_dev);
>  	u8 regs[2];
>  
> +	ds1388_soft_timer_set(wdt_dev);
>  	return regmap_bulk_read(ds1307->regmap, DS1388_REG_WDOG_HUN_SECS, regs,
>  				sizeof(regs));
>  }
> @@ -923,6 +952,7 @@ static int ds1388_wdt_set_timeout(struct watchdog_device *wdt_dev,
>  	regs[0] = 0;
>  	regs[1] = bin2bcd(wdt_dev->timeout);
>  
> +	ds1388_soft_timer_set(wdt_dev);
>  	return regmap_bulk_write(ds1307->regmap, DS1388_REG_WDOG_HUN_SECS, regs,
>  				 sizeof(regs));
>  }
> @@ -1652,7 +1682,8 @@ static void ds1307_clks_register(struct ds1307 *ds1307)
>  
>  #ifdef CONFIG_WATCHDOG_CORE
>  static const struct watchdog_info ds1388_wdt_info = {
> -	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
> +	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
> +		   WDIOF_MAGICCLOSE | WDIOF_PRETIMEOUT,
>  	.identity = "DS1388 watchdog",
>  };
>  
> @@ -1681,6 +1712,8 @@ static void ds1307_wdt_register(struct ds1307 *ds1307)
>  	wdt->timeout = 99;
>  	wdt->max_timeout = 99;
>  	wdt->min_timeout = 1;
> +	ds1307->wdt = wdt;
> +	timer_setup(&ds1307->soft_timer, ds1388_soft_wdt_expire, 0);
>  
>  	watchdog_init_timeout(wdt, 0, ds1307->dev);
>  	watchdog_set_drvdata(wdt, ds1307);
> -- 
> 2.28.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
