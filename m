Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4010A197FAB
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Mar 2020 17:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbgC3Pds (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 30 Mar 2020 11:33:48 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44687 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728075AbgC3Pds (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 30 Mar 2020 11:33:48 -0400
Received: by mail-pl1-f193.google.com with SMTP id h11so6855055plr.11;
        Mon, 30 Mar 2020 08:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HwKNHqn/N6RNj3lw6v7dsHjBom4XvjuTe8MPW3fG2Tw=;
        b=RkfyICSr9qxDJ5B7a6yfHVKGfdh1e4iX2dWy4mRIdTkvUqcffbCd+33XY6XP56IgwJ
         ZoDSfGuklMGSRS0RWt8mEc69B9HsZO3EH3apyTp4mFLyVY/BvhhRjPgB0iCIspesTijl
         wNnWzOVvGLDzLNi1tM6yhNx1S7APpt8cQP7jbx5PHdk/2ggSjVnL9isaZCGupEE4FQph
         98h6vMiWykNPxCIA9BrLoN1fWkjRRVSSLfuZTWR9SDPGQZ9v465+477KVMehplztezia
         Od6mJxKHJf5IwVKtDqrsXB7WiWY9cwDD4gt1geAwKgRoGU8AMAZ0mQF6GNOxQX7X1A8D
         +Z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=HwKNHqn/N6RNj3lw6v7dsHjBom4XvjuTe8MPW3fG2Tw=;
        b=qWvmZTHB+qO38r07rJ80byvEshcJQX40aioNPgnDMzT8B0Bz0RfL1LVhZX2u1wvK1N
         7mzYwn6n8ewMMY+e7vfguiFsrNDYkyYfiTLHkStQUm5Mi35rxyFLIhQ8tKKePazEa+Wf
         6c/Q3i8fgDPNTizyQdPPQVmELjPfGPUvgG/CVxo/qBEpdiq96IDQpICKu6lmc3QCD0OA
         9nHrZaELyzB95ceyYNaEueScIQmBqwJq1E7G4JpzlGof3IlCYQY6skmnWzBrR48y0kHd
         EzXz90h1RdOcDvS5DKJdARrM6d52eXSjsgfArHHpZmB2q17DLE/4Yc5skqP+Hk35zTmC
         TE4Q==
X-Gm-Message-State: ANhLgQ3tHDn+OU0eIWdgxGk3I/EUWDLnf0decHWrjyspns/wZzh3HVNG
        GVy44qSQ4xwQTC70SBfL0VO1FkT7
X-Google-Smtp-Source: ADFU+vuxYahdi//XssHReya2v5pb1kUs+UOoGpqU4Dp4B2Up/zKJh4XFE7I8UR5AEqtANbpUG9eTCA==
X-Received: by 2002:a17:90a:8e84:: with SMTP id f4mr16099547pjo.72.1585582426345;
        Mon, 30 Mar 2020 08:33:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r29sm9806495pgm.17.2020.03.30.08.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2020 08:33:45 -0700 (PDT)
Subject: Re: [PATCH v3] rtc: ds1307: add support for watchdog timer on ds1388
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        wim@linux-watchdog.org
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200330025500.6991-1-chris.packham@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <682784aa-2665-9b8e-4989-b0ef8e0b08c5@roeck-us.net>
Date:   Mon, 30 Mar 2020 08:33:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200330025500.6991-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 3/29/20 7:55 PM, Chris Packham wrote:
> The DS1388 variant has watchdog timer capabilities. When using a DS1388
> and having enabled CONFIG_WATCHDOG_CORE register a watchdog device for
> the DS1388.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v3:
> - Address review comments from Guenter. Add select WATCHDOG_CORE, remove
>   unnecessary wdt member, add set_timeout op, use devm_watchdog_register
> Changes in v2:
> - Address review comments from Alexandre, the only functional change is setting
>   the hundredths of seconds to 0 instead of 99.
> 
>  drivers/rtc/Kconfig      |   1 +
>  drivers/rtc/rtc-ds1307.c | 115 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 116 insertions(+)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 34c8b6c7e095..729851a38511 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -241,6 +241,7 @@ config RTC_DRV_AS3722
>  config RTC_DRV_DS1307
>  	tristate "Dallas/Maxim DS1307/37/38/39/40/41, ST M41T00, EPSON RX-8025, ISL12057"
>  	select REGMAP_I2C
> +	select WATCHDOG_CORE if WATCHDOG
>  	help
>  	  If you say yes here you get support for various compatible RTC
>  	  chips (often with battery backup) connected with I2C. This driver
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index 31a38d468378..fad042118862 100644
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
> @@ -854,6 +862,72 @@ static int m41txx_rtc_set_offset(struct device *dev, long offset)
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
> +	 * watchdog timeouts are measured in seconds. So ignore hundredths of
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
> +
> +static int ds1388_wdt_set_timeout(struct watchdog_device *wdt_dev,
> +				  unsigned int val)
> +{
> +	struct ds1307 *ds1307 = watchdog_get_drvdata(wdt_dev);
> +	u8 regs[2];
> +
> +	wdt_dev->timeout = val;
> +	regs[0] = 0;
> +	regs[1] = bin2bcd(wdt_dev->timeout);
> +
> +	return regmap_bulk_write(ds1307->regmap, DS1388_REG_WDOG_HUN_SECS, regs,
> +				 sizeof(regs));
> +}
> +#endif
> +
>  static const struct rtc_class_ops rx8130_rtc_ops = {
>  	.read_time      = ds1307_get_time,
>  	.set_time       = ds1307_set_time,
> @@ -1576,6 +1650,46 @@ static void ds1307_clks_register(struct ds1307 *ds1307)
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
> +	.set_timeout = ds1388_wdt_set_timeout,
> +
> +};
> +
> +static void ds1307_wdt_register(struct ds1307 *ds1307)
> +{
> +	struct watchdog_device	*wdt;
> +
> +	if (ds1307->type != ds_1388)
> +		return;
> +
> +	wdt = devm_kzalloc(ds1307->dev, sizeof(*wdt), GFP_KERNEL);
> +
> +	wdt->info = &ds1388_wdt_info;
> +	wdt->ops = &ds1388_wdt_ops;
> +	wdt->timeout = 99;
> +	wdt->max_timeout = 99;
> +	wdt->min_timeout = 1;
> +
> +	watchdog_init_timeout(wdt, 0, ds1307->dev);
> +	watchdog_set_drvdata(wdt, ds1307);
> +	devm_watchdog_register_device(ds1307->dev, wdt);
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
> @@ -1865,6 +1979,7 @@ static int ds1307_probe(struct i2c_client *client,
>  
>  	ds1307_hwmon_register(ds1307);
>  	ds1307_clks_register(ds1307);
> +	ds1307_wdt_register(ds1307);
>  
>  	return 0;
>  
> 

