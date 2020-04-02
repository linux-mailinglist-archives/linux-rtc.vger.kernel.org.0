Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB8B419C32C
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Apr 2020 15:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733292AbgDBNw2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Apr 2020 09:52:28 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:38823 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733252AbgDBNw2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 Apr 2020 09:52:28 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 25DE720006;
        Thu,  2 Apr 2020 13:52:24 +0000 (UTC)
Date:   Thu, 2 Apr 2020 15:52:23 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] rtc: ds1307: check for failed memory allocation on
 wdt
Message-ID: <20200402135223.GI3683@piout.net>
References: <20200402131441.539088-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402131441.539088-1-colin.king@canonical.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 02/04/2020 14:14:41+0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently a failed memory allocation will lead to a null pointer
> dereference on point wdt.  Fix this by checking for a failed allocation
> and adding error return handling to function ds1307_wdt_register.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: fd90d48db037 ("rtc: ds1307: add support for watchdog timer on ds1388")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/rtc/rtc-ds1307.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index fad042118862..95c5b6facc59 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -1665,14 +1665,16 @@ static const struct watchdog_ops ds1388_wdt_ops = {
>  
>  };
>  
> -static void ds1307_wdt_register(struct ds1307 *ds1307)
> +static int ds1307_wdt_register(struct ds1307 *ds1307)
>  {
>  	struct watchdog_device	*wdt;
>  
>  	if (ds1307->type != ds_1388)
> -		return;
> +		return 0;
>  
>  	wdt = devm_kzalloc(ds1307->dev, sizeof(*wdt), GFP_KERNEL);
> +	if (!wdt)
> +		return -ENOMEM;
>  
>  	wdt->info = &ds1388_wdt_info;
>  	wdt->ops = &ds1388_wdt_ops;
> @@ -1683,10 +1685,13 @@ static void ds1307_wdt_register(struct ds1307 *ds1307)
>  	watchdog_init_timeout(wdt, 0, ds1307->dev);
>  	watchdog_set_drvdata(wdt, ds1307);
>  	devm_watchdog_register_device(ds1307->dev, wdt);
> +
> +	return 0;
>  }
>  #else
> -static void ds1307_wdt_register(struct ds1307 *ds1307)
> +static int ds1307_wdt_register(struct ds1307 *ds1307)
>  {
> +	return 0;
>  }
>  #endif /* CONFIG_WATCHDOG_CORE */
>  
> @@ -1979,9 +1984,9 @@ static int ds1307_probe(struct i2c_client *client,
>  
>  	ds1307_hwmon_register(ds1307);
>  	ds1307_clks_register(ds1307);
> -	ds1307_wdt_register(ds1307);
> +	err = ds1307_wdt_register(ds1307);
>  
> -	return 0;
> +	return err;

As the watchdog is optional and the RTC can work properly without the
watchdog driver being compiled, my opinion is that the error should not
be returned.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
