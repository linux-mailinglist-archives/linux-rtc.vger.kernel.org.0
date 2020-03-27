Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D32619603E
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Mar 2020 22:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727702AbgC0VMY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 27 Mar 2020 17:12:24 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46893 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727352AbgC0VMX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 27 Mar 2020 17:12:23 -0400
Received: by mail-pf1-f194.google.com with SMTP id q3so5066218pff.13;
        Fri, 27 Mar 2020 14:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AvMap2oHzGADAPyLaHD1k6GQ9GPfHKezf4ZSh/78MJ8=;
        b=N6Y5HXHAnkeQ2DIEh6vJFCeE+YVmEfQbt/h9VnZXv3w7OrPSGFbPQDY3CsnlSHsRSN
         Mgb3eNw9MYKU4iwHx9dOpjEe/1HqPIid+Wg9OU0qgKp7zjb0V9ka+HnDRPlCcAcQvKHG
         S4Do2OAudEnymbMjEL0U95bJNk5628wCcKJ8qjmORvVKiH/c+xfFgW2JMmdaWGtb5GpN
         Fq8fFGpsvgiPoHQ82TOd7qv6v+WMKUvwDHMGZ875KM0iFs9ofbo/9oSOKubLVwR2Ib/S
         sOqPCn81n4nk5n4vkc6puKpHONTTT2sxmUsy9/E9a7fXYV/ubWj/zh5PHhD409sOH1Rb
         CadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=AvMap2oHzGADAPyLaHD1k6GQ9GPfHKezf4ZSh/78MJ8=;
        b=HgLCuqGH5rkUxnVugYWn9l2HeJR4sUvE3JqEzwnhEb6n22rLWKf4fy44j9r154gO2s
         Oxj9VHT/y1Ule/2jJ0xovA/Pb/fSkPwIvyCeroZPywX8jCyknhU3R7/9GqxIhwdLRdG5
         ROgRKxhqb5fDB+rCNmFWT8r7PbCMAG+C2BBZ7cCmqjVpG9gNN2ntg5tr2joakiBDrXT7
         EAcivfXbs0ziYxkS+QjQ+iEg9Yjd/GRj1M/MUiQOBrOJejPH1U+TOEznrx1Np4xL26HH
         3gB5ldzuUWR3Xhq0aYGFZi8AyUVB1murSlK7KnYxs/ejPRDEdWakZcFxSzPjq8LXUcu7
         ACLg==
X-Gm-Message-State: ANhLgQ0Wt3KKCSAN1v0Z1xhYSlyw2Iqr0pdwTOxB8wizDZvunI21g1/N
        B9Bs/lisxYfgFkgBtL4MT/VrJyk1
X-Google-Smtp-Source: ADFU+vsJOQ5Gt7WKw/I4h7UdqwUkPoZ4Pif9QREGCvZCF0aU//yKU/AbqXG0IAp+2QubtRdj539/4A==
X-Received: by 2002:a62:1a90:: with SMTP id a138mr1225151pfa.320.1585343540790;
        Fri, 27 Mar 2020 14:12:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x4sm3897352pga.54.2020.03.27.14.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2020 14:12:19 -0700 (PDT)
Subject: Re: [PATCH v2] rtc: ds1307: add support for watchdog timer on ds1388
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        wim@linux-watchdog.org
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200327041809.2029-1-chris.packham@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <4aecb77e-f635-9bfd-c2bd-21cb68fa333d@roeck-us.net>
Date:   Fri, 27 Mar 2020 14:12:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200327041809.2029-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 3/26/20 9:18 PM, Chris Packham wrote:
> The DS1388 variant has watchdog timer capabilities. When using a DS1388
> and having enabled CONFIG_WATCHDOG_CORE register a watchdog device for
> the DS1388.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> This is going to the linux-watchdog list as well this time so it's probably the
> first time the watchdog maintainers have seen it.
> 
> Changes in v2:
> - Address review comments from Alexandre, the only functional change is setting
>   the hundredths of seconds to 0 instead of 99.
> 
>  drivers/rtc/rtc-ds1307.c | 97 ++++++++++++++++++++++++++++++++++++++++

	"select WATCHDOG_CORE if WATCHDOG"

should be added to Kconfig. While it makes sense for watchdog functionality
to depend on WATCHDOG, it should not depend on the existence of another
watchdog driver in the system.

>  1 file changed, 97 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index 31a38d468378..1452982c3a6a 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -22,6 +22,7 @@
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/clk-provider.h>
>  #include <linux/regmap.h>
> +#include <linux/watchdog.h>
>  
>  /*
>   * We can't determine type by probing, but if we expect pre-Linux code
> @@ -144,8 +145,15 @@ enum ds_type {
>  #	define M41TXX_BIT_CALIB_SIGN	BIT(5)
>  #	define M41TXX_M_CALIBRATION	GENMASK(4, 0)
>  
> +#define DS1388_REG_WDOG_HUN_SECS	0x08
> +#define DS1388_REG_WDOG_SECS		0x09
>  #define DS1388_REG_FLAG			0x0b
> +#	define DS1388_BIT_WF		BIT(6)
>  #	define DS1388_BIT_OSF		BIT(7)
> +#define DS1388_REG_CONTROL		0x0c
> +#	define DS1388_BIT_RST		BIT(0)
> +#	define DS1388_BIT_WDE		BIT(1)
> +
>  /* negative offset step is -2.034ppm */
>  #define M41TXX_NEG_OFFSET_STEP_PPB	2034
>  /* positive offset step is +4.068ppm */
> @@ -166,6 +174,9 @@ struct ds1307 {
>  #ifdef CONFIG_COMMON_CLK
>  	struct clk_hw		clks[2];
>  #endif
> +#ifdef CONFIG_WATCHDOG_CORE
> +	struct watchdog_device	wdt;
> +#endif

I don't immediately see why this would be necessary. I think it would
be better to allocate struct watchdog_device in ds1307_wdt_register().

>  };
>  
>  struct chip_desc {
> @@ -854,6 +865,58 @@ static int m41txx_rtc_set_offset(struct device *dev, long offset)
>  				  ctrl_reg);
>  }
>  
> +#ifdef CONFIG_WATCHDOG_CORE
> +static int ds1388_wdt_start(struct watchdog_device *wdt_dev)
> +{
> +	struct ds1307 *ds1307 = watchdog_get_drvdata(wdt_dev);
> +	u8 regs[2];
> +	int ret;
> +
> +	ret = regmap_update_bits(ds1307->regmap, DS1388_REG_FLAG,
> +				 DS1388_BIT_WF, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(ds1307->regmap, DS1388_REG_CONTROL,
> +				 DS1388_BIT_WDE | DS1388_BIT_RST, 0);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * watchdog timeouts are measured in seconds. So ignore hundreths of

hundredths

> +	 * seconds field.
> +	 */
> +	regs[0] = 0;
> +	regs[1] = bin2bcd(wdt_dev->timeout);
> +
> +	ret = regmap_bulk_write(ds1307->regmap, DS1388_REG_WDOG_HUN_SECS, regs,
> +				sizeof(regs));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(ds1307->regmap, DS1388_REG_CONTROL,
> +				  DS1388_BIT_WDE | DS1388_BIT_RST,
> +				  DS1388_BIT_WDE | DS1388_BIT_RST);
> +}
> +
> +static int ds1388_wdt_stop(struct watchdog_device *wdt_dev)
> +{
> +	struct ds1307 *ds1307 = watchdog_get_drvdata(wdt_dev);
> +
> +	return regmap_update_bits(ds1307->regmap, DS1388_REG_CONTROL,
> +				  DS1388_BIT_WDE | DS1388_BIT_RST, 0);
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
> @@ -1576,6 +1639,39 @@ static void ds1307_clks_register(struct ds1307 *ds1307)
>  
>  #endif /* CONFIG_COMMON_CLK */
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

Maybe I am missing something, but I don't see how the timeout is updated
if it is changed while the watchdog is already running.

> +};
> +
> +static void ds1307_wdt_register(struct ds1307 *ds1307)
> +{
> +	if (ds1307->type != ds_1388)
> +		return;
> +
> +	ds1307->wdt.info = &ds1388_wdt_info;
> +	ds1307->wdt.ops = &ds1388_wdt_ops;
> +	ds1307->wdt.max_timeout = 99;
> +	ds1307->wdt.min_timeout = 1;
> +
> +	watchdog_init_timeout(&ds1307->wdt, 99, ds1307->dev);

That is quite pointless; just set wdt.timeout to 99 (assuming
that is what you want as default).

watchdog_init_timeout() only makes sense if it is used to set the
timeout from a module parameter or from a devicetree property.

> +	watchdog_set_drvdata(&ds1307->wdt, ds1307);
> +	watchdog_register_device(&ds1307->wdt);

Please call devm_watchdog_register_device().

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
> @@ -1865,6 +1961,7 @@ static int ds1307_probe(struct i2c_client *client,
>  
>  	ds1307_hwmon_register(ds1307);
>  	ds1307_clks_register(ds1307);
> +	ds1307_wdt_register(ds1307);
>  
>  	return 0;
>  
> 

