Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A01D995FD
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 16:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731907AbfHVOLK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 10:11:10 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38767 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731783AbfHVOLJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 10:11:09 -0400
Received: by mail-pg1-f194.google.com with SMTP id e11so3749175pga.5;
        Thu, 22 Aug 2019 07:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ASZfffSNeiHyQnIAvjRD5lFZGA3QyNFhCky47G68d9Q=;
        b=KvQNpipMVLvoDA1m2bvOHh7eGiDolN2tnv2oXyGqXaJ/MdJUjo4ZeK71P/yX6IcTCM
         X6ps8FRa71GaB8PX+Gkg9v6yFHC9D9znCxGdmhJwBTVTgB1FEVC51QiQW+Z9w70AUYhb
         3TyFN0JYSktSu1ovLmdY7AIMmqAXSO168J1LRek6UpYlpjp8Mc/PHzPwuxtpQe/hy+J6
         6enT+UqqDHvwaQhrLTyTuS1M4DobJl/BOC3klZD81TT7NmmjbltjfxGuXNY3lh/JGW7R
         IBkF7szGs1wO1n4DZoiWX7PYMiseFgPokaWN5eYbStFYlzGdq89Rqpq14WQjJvi+WurM
         Po/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ASZfffSNeiHyQnIAvjRD5lFZGA3QyNFhCky47G68d9Q=;
        b=ZHp5buErF8Sr6V8LC9dXVE/nirIJ7pSdJ7+qo9PPpAO3TZ51ptWrN02u1yn2AC8uLR
         si+g6W988VAuJEckWkqexR84a/10FdbMbVp+OAgxIuWqpBXZOWMmX0exRyDJeHVuhkT/
         GJ2Q+dARzB1f0p1OFJ19GyFJOvWCrwKE91H2MIaXsKGkjPh93cyQZYzIY+mRJs84uM9l
         QwHdyzYQIpSEO3ffgp1TUzUWF/iC/mgrsHusm99skHd193SIw4tqmwXoKM9zxEhfMDfS
         8bl6BrYuGEGUGsw96lCvtqjK2SPZUivXSFv6fsJUC8PNGz5NRPnEIg8nECBIb9ia5tQL
         cSzQ==
X-Gm-Message-State: APjAAAXksUz9HsOdWsM9Zzo9qWhK6C8odq9s84k5H0iCDSv0N5GDHeVP
        TYeMiVnSZo6xjOzWWfMNNCwBrFx7Gfc=
X-Google-Smtp-Source: APXvYqyS6OwF+WEGas0nLyL12hfAvD/6yVFJZrbgj7MR2o09MZEoztUiOvl5MhTpQ2oCwuJPRxlypQ==
X-Received: by 2002:a17:90a:1b0a:: with SMTP id q10mr5670123pjq.91.1566483068553;
        Thu, 22 Aug 2019 07:11:08 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g18sm24156701pgm.9.2019.08.22.07.11.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Aug 2019 07:11:08 -0700 (PDT)
Date:   Thu, 22 Aug 2019 07:11:07 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        wim@linux-watchdog.org, u.kleine-koenig@pengutronix.de,
        bth@kamstrup.com
Subject: Re: [PATCH v3 4/5] rtc: pcf2127: add watchdog feature support
Message-ID: <20190822141107.GE8144@roeck-us.net>
References: <20190822131936.18772-1-bruno.thomsen@gmail.com>
 <20190822131936.18772-4-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822131936.18772-4-bruno.thomsen@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Aug 22, 2019 at 03:19:35PM +0200, Bruno Thomsen wrote:
> Add partial support for the watchdog functionality of
> both PCF2127 and PCF2129 chips.
> 
> The programmable watchdog timer is currently using a fixed
> clock source of 1Hz. This result in a selectable range of
> 1-255 seconds, which covers most embedded Linux use-cases.
> 
> Clock sources of 4096Hz, 64Hz and 1/60Hz is mostly useful
> in MCU use-cases.
> 
> Countdown timer not available when using watchdog feature.
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v3: removed 2 x dev_info() and 1 x dev_err() traces.
>     lowered dev_info() to dbg_info() in pcf2127_wdt_set_timeout.
>     removed unneeded ret variable in pcf2127_wdt_set_timeout.
> v2: use new watchdog api, e.g. devm_watchdog_register_device.
>     remove watchdog Kconfig option.
>     update existing Kconfig option with additional information.
> 
>  drivers/rtc/Kconfig       |   7 ++-
>  drivers/rtc/rtc-pcf2127.c | 118 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 124 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index e72f65b61176..a3bb58a08879 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -876,7 +876,12 @@ config RTC_DRV_PCF2127
>  	depends on RTC_I2C_AND_SPI
>  	help
>  	  If you say yes here you get support for the NXP PCF2127/29 RTC
> -	  chips.
> +	  chips with integrated quartz crystal for industrial applications.
> +	  Both chips also have watchdog timer and tamper switch detection
> +	  features.
> +
> +	  PCF2127 has an additional feature of 512 bytes battery backed
> +	  memory that's accessible using nvmem interface.
>  
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-pcf2127.
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index ee4921e4a47c..8d6eda455d81 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -5,6 +5,9 @@
>   *
>   * Author: Renaud Cerrato <r.cerrato@til-technologies.fr>
>   *
> + * Watchdog and tamper functions
> + * Author: Bruno Thomsen <bruno.thomsen@gmail.com>
> + *
>   * based on the other drivers in this same directory.
>   *
>   * Datasheet: http://cache.nxp.com/documents/data_sheet/PCF2127.pdf
> @@ -18,6 +21,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/regmap.h>
> +#include <linux/watchdog.h>
>  
>  /* Control register 1 */
>  #define PCF2127_REG_CTRL1		0x00
> @@ -35,6 +39,13 @@
>  #define PCF2127_REG_DW			0x07
>  #define PCF2127_REG_MO			0x08
>  #define PCF2127_REG_YR			0x09
> +/* Watchdog registers */
> +#define PCF2127_REG_WD_CTL		0x10
> +#define PCF2127_BIT_WD_CTL_TF0			BIT(0)
> +#define PCF2127_BIT_WD_CTL_TF1			BIT(1)
> +#define PCF2127_BIT_WD_CTL_CD0			BIT(6)
> +#define PCF2127_BIT_WD_CTL_CD1			BIT(7)
> +#define PCF2127_REG_WD_VAL		0x11
>  /*
>   * RAM registers
>   * PCF2127 has 512 bytes general-purpose static RAM (SRAM) that is
> @@ -45,9 +56,15 @@
>  #define PCF2127_REG_RAM_WRT_CMD		0x1C
>  #define PCF2127_REG_RAM_RD_CMD		0x1D
>  
> +/* Watchdog timer value constants */
> +#define PCF2127_WD_VAL_STOP		0
> +#define PCF2127_WD_VAL_MIN		2
> +#define PCF2127_WD_VAL_MAX		255
> +#define PCF2127_WD_VAL_DEFAULT		60
>  
>  struct pcf2127 {
>  	struct rtc_device *rtc;
> +	struct watchdog_device wdd;
>  	struct regmap *regmap;
>  };
>  
> @@ -220,6 +237,74 @@ static int pcf2127_nvmem_write(void *priv, unsigned int offset,
>  	return ret ?: bytes;
>  }
>  
> +/* watchdog driver */
> +
> +static int pcf2127_wdt_ping(struct watchdog_device *wdd)
> +{
> +	struct pcf2127 *pcf2127 = watchdog_get_drvdata(wdd);
> +
> +	return regmap_write(pcf2127->regmap, PCF2127_REG_WD_VAL, wdd->timeout);
> +}
> +
> +/*
> + * Restart watchdog timer if feature is active.
> + *
> + * Note: Reading CTRL2 register causes watchdog to stop which is unfortunate,
> + * since register also contain control/status flags for other features.
> + * Always call this function after reading CTRL2 register.
> + */
> +static int pcf2127_wdt_active_ping(struct watchdog_device *wdd)
> +{
> +	int ret = 0;
> +
> +	if (watchdog_active(wdd)) {
> +		ret = pcf2127_wdt_ping(wdd);
> +		if (ret)
> +			dev_err(wdd->parent,
> +				"%s: watchdog restart failed, ret=%d\n",
> +				__func__, ret);
> +	}
> +
> +	return ret;
> +}
> +
> +static int pcf2127_wdt_start(struct watchdog_device *wdd)
> +{
> +	return pcf2127_wdt_ping(wdd);
> +}
> +
> +static int pcf2127_wdt_stop(struct watchdog_device *wdd)
> +{
> +	struct pcf2127 *pcf2127 = watchdog_get_drvdata(wdd);
> +
> +	return regmap_write(pcf2127->regmap, PCF2127_REG_WD_VAL,
> +			    PCF2127_WD_VAL_STOP);
> +}
> +
> +static int pcf2127_wdt_set_timeout(struct watchdog_device *wdd,
> +				   unsigned int new_timeout)
> +{
> +	dev_dbg(wdd->parent, "new watchdog timeout: %is (old: %is)\n",
> +		new_timeout, wdd->timeout);
> +
> +	wdd->timeout = new_timeout;
> +
> +	return pcf2127_wdt_active_ping(wdd);
> +}
> +
> +static const struct watchdog_info pcf2127_wdt_info = {
> +	.identity = "NXP PCF2127/PCF2129 Watchdog",
> +	.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
> +};
> +
> +static const struct watchdog_ops pcf2127_watchdog_ops = {
> +	.owner = THIS_MODULE,
> +	.start = pcf2127_wdt_start,
> +	.stop = pcf2127_wdt_stop,
> +	.ping = pcf2127_wdt_ping,
> +	.set_timeout = pcf2127_wdt_set_timeout,
> +};
> +
>  static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  			const char *name, bool has_nvmem)
>  {
> @@ -242,6 +327,16 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  
>  	pcf2127->rtc->ops = &pcf2127_rtc_ops;
>  
> +	pcf2127->wdd.parent = dev;
> +	pcf2127->wdd.info = &pcf2127_wdt_info;
> +	pcf2127->wdd.ops = &pcf2127_watchdog_ops;
> +	pcf2127->wdd.min_timeout = PCF2127_WD_VAL_MIN;
> +	pcf2127->wdd.max_timeout = PCF2127_WD_VAL_MAX;
> +	pcf2127->wdd.timeout = PCF2127_WD_VAL_DEFAULT;
> +	pcf2127->wdd.min_hw_heartbeat_ms = 500;
> +
> +	watchdog_set_drvdata(&pcf2127->wdd, pcf2127);
> +
>  	if (has_nvmem) {
>  		struct nvmem_config nvmem_cfg = {
>  			.priv = pcf2127,
> @@ -253,6 +348,29 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  		ret = rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
>  	}
>  
> +	/*
> +	 * Watchdog timer enabled and reset pin /RST activated when timed out.
> +	 * Select 1Hz clock source for watchdog timer.
> +	 * Timer is not started until WD_VAL is loaded with a valid value.
> +	 * Note: Countdown timer disabled and not available.
> +	 */
> +	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_WD_CTL,
> +				 PCF2127_BIT_WD_CTL_CD1 |
> +				 PCF2127_BIT_WD_CTL_CD0 |
> +				 PCF2127_BIT_WD_CTL_TF1 |
> +				 PCF2127_BIT_WD_CTL_TF0,
> +				 PCF2127_BIT_WD_CTL_CD1 |
> +				 PCF2127_BIT_WD_CTL_CD0 |
> +				 PCF2127_BIT_WD_CTL_TF1);
> +	if (ret) {
> +		dev_err(dev, "%s: watchdog config (wd_ctl) failed\n", __func__);
> +		return ret;
> +	}
> +
> +	ret = devm_watchdog_register_device(dev, &pcf2127->wdd);
> +	if (ret)
> +		return ret;
> +
>  	return rtc_register_device(pcf2127->rtc);
>  }
>  
> -- 
> 2.21.0
> 
