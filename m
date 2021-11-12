Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A21944E951
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Nov 2021 15:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235262AbhKLPAt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 12 Nov 2021 10:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235074AbhKLPAs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 12 Nov 2021 10:00:48 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7478C061766;
        Fri, 12 Nov 2021 06:57:57 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id o83so18316624oif.4;
        Fri, 12 Nov 2021 06:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gmcVAwEFDslQ9/FE04vXQvy8yBkVm86dx3l5hyVpjB4=;
        b=nr0/dBeQTvhxNetRpHLNIgg0gq4z6EP3e5Fw/U+YnRG7mF25Ar3np4f/zE12v8Xts5
         z4ze1SIM/okYx9hrWl0idbz34liln3kx2/ML3qroVvs7BB0oF6rZEG4CIyBVeNKO5cmB
         sDoG4XmgmP1mQE/gkcRJf4Z3itwXD8WoLiW9MdIt8LMrOPKHnG+3lKg9PIp2/1bQSBcJ
         zTlRuiaNS++3LnKShE5Zv/+BxGdhB3lMJ0QidQFhwX/CwgMnNdKBwu07XJy0AZxja2v7
         yrEFUMwXl/XjCnbrEQ8m/nWT9gDZKiV8o0SrNiyOPbVm5OAMBm4/jBLqqHipaU0BWqkE
         1nWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gmcVAwEFDslQ9/FE04vXQvy8yBkVm86dx3l5hyVpjB4=;
        b=4d3RCmQo7pY6yId50sVTlSAH5s7Fh9Z6OsoVWhdJDoqhrGXg0rwnpXdQZw2+jkMh80
         aWqnos/YYisYLqM7apIhUFaWWOtWGSgQDrKbcHr7Yk/uaJQlczLRghIFJrBwqrfXs2EE
         78aDmJC8mAItQxAIUPO2P35UhW6lk2kN+2aYFv9ScDmLvaDa/NXND/6hPWtnUIo+Gez9
         SRsW11HFIOMyzHRDbFqpV8r1TmfQeTNIa//vuERzAE4n9fHmWZX0Yx3z2z2Do2xt3juF
         hmufHblc63QvB2AGZ89U3a2qZ7JoCc+aqtSFbLjrcRUv9n1cwlUt9yMw8BRzj2g0XcRV
         jVIw==
X-Gm-Message-State: AOAM531xN0pjE9pkeAvsDHE2oKi3zarStGKVCuWyRECe/heuW7+cjRw0
        rnlAsYCSTSi63o2CFWUXVIs=
X-Google-Smtp-Source: ABdhPJyAJBq4/WUmoHrzcqRo1+Qenbw3jgtuCERJBY0HW2xwh+m0nZ5KJrzc4bsvIw4kplH5XTU9/w==
X-Received: by 2002:aca:df04:: with SMTP id w4mr27496742oig.95.1636729076712;
        Fri, 12 Nov 2021 06:57:56 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t9sm1243785otd.57.2021.11.12.06.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 06:57:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
References: <20211111225852.3128201-1-luca@lucaceresoli.net>
 <20211111225852.3128201-8-luca@lucaceresoli.net>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 7/8] watchdog: max77714: add driver for the watchdog in
 the MAX77714 PMIC
Message-ID: <0f278280-27d0-4d43-8065-76ec1f7c19b5@roeck-us.net>
Date:   Fri, 12 Nov 2021 06:57:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111225852.3128201-8-luca@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/11/21 2:58 PM, Luca Ceresoli wrote:
> Add a simple driver to support the watchdog embedded in the Maxim MAX77714
> PMIC.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 

I just realized that this is effectively a rewrite of drivers/watchdog/max77620_wdt.c.
The only difference I can see is is the register offsets (0x91 and 0x92
vs. 1 and 2) and some implementation details. Please add support for this
watchdog to the other driver or provide a _really_ good reason why that
is not possible.

> ---
> 
> Changes in v3: none
> 
> Changes in v2:
>   - fix Kconfig help indentation (Randy Dunlap)
>   - make max77714_margin_value static const (Guenter Roeck)
>   - fix platform module instantiation
> ---
>   MAINTAINERS                     |   1 +
>   drivers/watchdog/Kconfig        |   9 ++
>   drivers/watchdog/Makefile       |   1 +
>   drivers/watchdog/max77714_wdt.c | 179 ++++++++++++++++++++++++++++++++
>   4 files changed, 190 insertions(+)
>   create mode 100644 drivers/watchdog/max77714_wdt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1a37b9422c5f..d182231b4bbf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11573,6 +11573,7 @@ M:	Luca Ceresoli <luca@lucaceresoli.net>
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
>   F:	drivers/mfd/max77714.c
> +F:	drivers/watchdog/max77714_wdt.c
>   F:	include/linux/mfd/max77714.h
>   
>   MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index a6d97f30325a..f5100b731927 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -685,6 +685,15 @@ config MAX77620_WATCHDOG
>   	  MAX77620 chips. To compile this driver as a module,
>   	  choose M here: the module will be called max77620_wdt.
>   
> +config MAX77714_WATCHDOG
> +	tristate "Maxim MAX77714 Watchdog Timer"
> +	depends on MFD_MAX77714 || COMPILE_TEST
> +	help
> +	  This is the driver for watchdog timer in the MAX77714 PMIC.
> +	  Say 'Y' here to enable the watchdog timer support for MAX77714
> +	  chips. To compile this driver as a module, choose M here: the
> +	  module will be called max77714_wdt.
> +
>   config IMX2_WDT
>   	tristate "IMX2+ Watchdog"
>   	depends on ARCH_MXC || ARCH_LAYERSCAPE || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 2ee97064145b..575be33c52b8 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -214,6 +214,7 @@ obj-$(CONFIG_WM831X_WATCHDOG) += wm831x_wdt.o
>   obj-$(CONFIG_WM8350_WATCHDOG) += wm8350_wdt.o
>   obj-$(CONFIG_MAX63XX_WATCHDOG) += max63xx_wdt.o
>   obj-$(CONFIG_MAX77620_WATCHDOG) += max77620_wdt.o
> +obj-$(CONFIG_MAX77714_WATCHDOG) += max77714_wdt.o
>   obj-$(CONFIG_ZIIRAVE_WATCHDOG) += ziirave_wdt.o
>   obj-$(CONFIG_SOFT_WATCHDOG) += softdog.o
>   obj-$(CONFIG_MENF21BMC_WATCHDOG) += menf21bmc_wdt.o
> diff --git a/drivers/watchdog/max77714_wdt.c b/drivers/watchdog/max77714_wdt.c
> new file mode 100644
> index 000000000000..cce6c13d76eb
> --- /dev/null
> +++ b/drivers/watchdog/max77714_wdt.c
> @@ -0,0 +1,179 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Maxim MAX77714 Watchdog Driver
> + *
> + * Copyright (C) 2021 Luca Ceresoli
> + * Author: Luca Ceresoli <luca@lucaceresoli.net>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/max77714.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/watchdog.h>
> +
> +struct max77714_wdt {
> +	struct device		*dev;
> +	struct regmap		*rmap;
> +	struct watchdog_device	wd_dev;
> +};
> +
> +/* Timeout in seconds, indexed by TWD bits of CNFG_GLBL2 register */
> +static const unsigned int max77714_margin_value[] = { 2, 16, 64, 128 };
> +
> +static int max77714_wdt_start(struct watchdog_device *wd_dev)
> +{
> +	struct max77714_wdt *wdt = watchdog_get_drvdata(wd_dev);
> +
> +	return regmap_update_bits(wdt->rmap, MAX77714_CNFG_GLBL2,
> +				  MAX77714_WDTEN, MAX77714_WDTEN);
> +}
> +
> +static int max77714_wdt_stop(struct watchdog_device *wd_dev)
> +{
> +	struct max77714_wdt *wdt = watchdog_get_drvdata(wd_dev);
> +
> +	return regmap_update_bits(wdt->rmap, MAX77714_CNFG_GLBL2,
> +				  MAX77714_WDTEN, 0);
> +}
> +
> +static int max77714_wdt_ping(struct watchdog_device *wd_dev)
> +{
> +	struct max77714_wdt *wdt = watchdog_get_drvdata(wd_dev);
> +
> +	return regmap_update_bits(wdt->rmap, MAX77714_CNFG_GLBL3,
> +				  MAX77714_WDTC, 1);
> +}
> +
> +static int max77714_wdt_set_timeout(struct watchdog_device *wd_dev,
> +				    unsigned int timeout)
> +{
> +	struct max77714_wdt *wdt = watchdog_get_drvdata(wd_dev);
> +	unsigned int new_timeout, new_twd;
> +	int err;
> +
> +	for (new_twd = 0; new_twd < ARRAY_SIZE(max77714_margin_value) - 1; new_twd++)
> +		if (timeout <= max77714_margin_value[new_twd])
> +			break;
> +
> +	/* new_wdt is not out of bounds here due to the "- 1" in the for loop */
> +	new_timeout = max77714_margin_value[new_twd];
> +
> +	/*
> +	 * "If the value of TWD needs to be changed, clear the system
> +	 * watchdog timer first [...], then change the value of TWD."
> +	 * (MAX77714 datasheet)
> +	 */
> +	err = regmap_update_bits(wdt->rmap, MAX77714_CNFG_GLBL3,
> +				 MAX77714_WDTC, 1);
> +	if (err)
> +		return err;
> +
> +	err = regmap_update_bits(wdt->rmap, MAX77714_CNFG_GLBL2,
> +				 MAX77714_TWD_MASK, new_twd);
> +	if (err)
> +		return err;
> +
> +	wd_dev->timeout = new_timeout;
> +
> +	dev_dbg(wdt->dev, "New timeout = %u s (WDT = 0x%x)", new_timeout, new_twd);
> +
> +	return 0;
> +}
> +
> +static const struct watchdog_info max77714_wdt_info = {
> +	.identity = "max77714-watchdog",
> +	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
> +};
> +
> +static const struct watchdog_ops max77714_wdt_ops = {
> +	.start		= max77714_wdt_start,
> +	.stop		= max77714_wdt_stop,
> +	.ping		= max77714_wdt_ping,
> +	.set_timeout	= max77714_wdt_set_timeout,
> +};
> +
> +static int max77714_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct max77714_wdt *wdt;
> +	struct watchdog_device *wd_dev;
> +	unsigned int regval;
> +	int err;
> +
> +	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> +	if (!wdt)
> +		return -ENOMEM;
> +
> +	wdt->dev = dev;
> +
> +	wd_dev = &wdt->wd_dev;
> +	wd_dev->info = &max77714_wdt_info;
> +	wd_dev->ops = &max77714_wdt_ops;
> +	wd_dev->min_timeout = 2;
> +	wd_dev->max_timeout = 128;
> +
> +	platform_set_drvdata(pdev, wdt);
> +	watchdog_set_drvdata(wd_dev, wdt);
> +
> +	wdt->rmap = dev_get_regmap(dev->parent, NULL);
> +	if (!wdt->rmap)
> +		return dev_err_probe(wdt->dev, -ENODEV, "Failed to get parent regmap\n");
> +
> +	/* WD_RST_WK: if 1 wdog restarts; if 0 wdog shuts down */
> +	err = regmap_update_bits(wdt->rmap, MAX77714_CNFG2_ONOFF,
> +				 MAX77714_WD_RST_WK, MAX77714_WD_RST_WK);
> +	if (err)
> +		return dev_err_probe(wdt->dev, err, "Error updating CNFG2_ONOFF\n");
> +
> +	err = regmap_read(wdt->rmap, MAX77714_CNFG_GLBL2, &regval);
> +	if (err)
> +		return dev_err_probe(wdt->dev, err, "Error reading CNFG_GLBL2\n");
> +
> +	/* enable watchdog | enable auto-clear in sleep state */
> +	regval |= (MAX77714_WDTEN | MAX77714_WDTSLPC);
> +
> +	err = regmap_write(wdt->rmap, MAX77714_CNFG_GLBL2, regval);
> +	if (err)
> +		return dev_err_probe(wdt->dev, err, "Error writing CNFG_GLBL2\n");
> +
> +	wd_dev->timeout = max77714_margin_value[regval & MAX77714_TWD_MASK];
> +
> +	dev_dbg(wdt->dev, "Timeout = %u s (WDT = 0x%x)",
> +		wd_dev->timeout, regval & MAX77714_TWD_MASK);
> +
> +	set_bit(WDOG_HW_RUNNING, &wd_dev->status);
> +
> +	watchdog_stop_on_unregister(wd_dev);
> +
> +	err = devm_watchdog_register_device(dev, wd_dev);
> +	if (err)
> +		return dev_err_probe(dev, err, "Cannot register watchdog device\n");
> +
> +	dev_info(dev, "registered as /dev/watchdog%d\n", wd_dev->id);
> +
> +	return 0;
> +}
> +
> +static const struct platform_device_id max77714_wdt_platform_id[] = {
> +	{ .name = "max77714-watchdog", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(platform, max77714_wdt_platform_id);
> +
> +static struct platform_driver max77714_wdt_driver = {
> +	.driver	= {
> +		.name	= "max77714-watchdog",
> +	},
> +	.probe	= max77714_wdt_probe,
> +	.id_table = max77714_wdt_platform_id,
> +};
> +
> +module_platform_driver(max77714_wdt_driver);
> +
> +MODULE_DESCRIPTION("MAX77714 watchdog timer driver");
> +MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
> +MODULE_LICENSE("GPL v2");
> 

