Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2EB618EC65
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Mar 2020 22:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgCVVFe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 22 Mar 2020 17:05:34 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:40573 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgCVVFe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 22 Mar 2020 17:05:34 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 9F9EB40008;
        Sun, 22 Mar 2020 21:05:29 +0000 (UTC)
Date:   Sun, 22 Mar 2020 22:05:29 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] rtc: ds1307: add support for watchdog timer on
 ds1388
Message-ID: <20200322210529.GB221863@piout.net>
References: <20200207031812.14424-1-chris.packham@alliedtelesis.co.nz>
 <20200207031812.14424-3-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200207031812.14424-3-chris.packham@alliedtelesis.co.nz>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 07/02/2020 16:18:12+1300, Chris Packham wrote:
> The DS1388 variant has watchdog timer capabilities. When using a DS1388
> and having enabled CONFIG_WATCHDOG_CORE register a watchdog device for
> the DS1388.
> 

As this is a watchdog related patch, you should copy the watchdog
maintainers too.

> +#ifdef CONFIG_WATCHDOG_CORE
> +static int ds1388_wdt_start(struct watchdog_device *wdt_dev)
> +{
> +	struct ds1307 *ds1307 = watchdog_get_drvdata(wdt_dev);
> +	u8 regs[2];
> +	int ret;
> +
> +	ret = regmap_update_bits(ds1307->regmap, DS1388_REG_FLAG,
> +			DS1388_BIT_WF, 0);

This is not properly aligned.

> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(ds1307->regmap, DS1388_REG_CONTROL,
> +				 DS1388_BIT_WDE|DS1388_BIT_RST, 0);
spaces around the '|' please

> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * watchdog timeouts are measured in seconds so max out hundreths of
> +	 * seconds field.
> +	 */
> +	regs[0] = 0x99;

Doesn't that give an extra second to the timeout?

> +	regs[1] = bin2bcd(wdt_dev->timeout);
> +
> +	ret = regmap_bulk_write(ds1307->regmap, DS1388_REG_WDOG_HUN_SECS, regs,
> +			sizeof(regs));

This is not properly aligned

> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(ds1307->regmap, DS1388_REG_CONTROL,
> +				  DS1388_BIT_WDE|DS1388_BIT_RST,
> +				  DS1388_BIT_WDE|DS1388_BIT_RST);

spaces around the '|'

> +}
> +
> +static int ds1388_wdt_stop(struct watchdog_device *wdt_dev)
> +{
> +	struct ds1307 *ds1307 = watchdog_get_drvdata(wdt_dev);
> +
> +	return regmap_update_bits(ds1307->regmap, DS1388_REG_CONTROL,
> +				  DS1388_BIT_WDE|DS1388_BIT_RST, 0);

ditto

> +}
> +
> +static int ds1388_wdt_ping(struct watchdog_device *wdt_dev)
> +{
> +	struct ds1307 *ds1307 = watchdog_get_drvdata(wdt_dev);
> +	u8 regs[2];
> +
> +	return regmap_bulk_read(ds1307->regmap, DS1388_REG_WDOG_HUN_SECS, regs,
> +				sizeof(regs));
> +}
> +#endif
> +
>  static const struct rtc_class_ops rx8130_rtc_ops = {
>  	.read_time      = ds1307_get_time,
>  	.set_time       = ds1307_set_time,
> @@ -880,6 +943,20 @@ static const struct rtc_class_ops m41txx_rtc_ops = {
>  	.set_offset	= m41txx_rtc_set_offset,
>  };
>  
> +#ifdef CONFIG_WATCHDOG_CORE
> +static const struct watchdog_info ds1388_wdt_info = {
> +	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
> +	.identity = "DS1388 watchdog",
> +};
> +
> +static const struct watchdog_ops ds1388_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = ds1388_wdt_start,
> +	.stop = ds1388_wdt_stop,
> +	.ping = ds1388_wdt_ping,
> +};

Both those structs should be move just before ds1307_wdt_register to
avoid the #ifdef duplication

> +#endif
> +
>  static const struct chip_desc chips[last_ds_type] = {
>  	[ds_1307] = {
>  		.nvram_offset	= 8,
> @@ -1576,6 +1653,33 @@ static void ds1307_clks_register(struct ds1307 *ds1307)
>  
>  #endif /* CONFIG_COMMON_CLK */
>  
> +#ifdef CONFIG_WATCHDOG_CORE
> +static void ds1307_wdt_register(struct ds1307 *ds1307)
> +{
> +	int ret;
> +
> +	if (ds1307->type != ds_1388)
> +		return;
> +
> +	ds1307->wdt.info = &ds1388_wdt_info;
> +	ds1307->wdt.ops = &ds1388_wdt_ops;
> +	ds1307->wdt.max_timeout = 99;
> +	ds1307->wdt.min_timeout = 1;
> +
> +	watchdog_init_timeout(&ds1307->wdt, 99, ds1307->dev);
> +	watchdog_set_drvdata(&ds1307->wdt, ds1307);
> +	ret = watchdog_register_device(&ds1307->wdt);
> +	if (ret) {
> +		dev_warn(ds1307->dev, "unable to register watchdog device %d\n",
> +			 ret);

There is already a message in case of failure in
watchdog_register_device. Is it really necessary to have a second one?

> +	}
> +}
> +#else
> +static void ds1307_wdt_register(struct ds1307 *ds1307)
> +{
> +}
> +#endif /* CONFIG_WATCHDOG_CORE */
> +
>  static const struct regmap_config regmap_config = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
> @@ -1865,6 +1969,7 @@ static int ds1307_probe(struct i2c_client *client,
>  
>  	ds1307_hwmon_register(ds1307);
>  	ds1307_clks_register(ds1307);
> +	ds1307_wdt_register(ds1307);
>  
>  	return 0;
>  
> -- 
> 2.25.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
