Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F178F429570
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Oct 2021 19:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233900AbhJKRTv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Oct 2021 13:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232954AbhJKRTu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Oct 2021 13:19:50 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC8BC061570;
        Mon, 11 Oct 2021 10:17:50 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id c26-20020a056830349a00b0054d96d25c1eso22504242otu.9;
        Mon, 11 Oct 2021 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3vP0uybHMoI06MhLMU0+davaaxi5gh7/XLEaEM3Vsyc=;
        b=jyeJQI4LYEgDF+ydhID4Ng+zRer2RPpQa/muIs0mHGKaenR1+4LYA7o1ps419WXwAb
         1Pe3TP650dMvb7zUALzRrKPcAeq2cbFuOo4n7rvWYsZF7P+tlVieJ+OvGyHN7G5fClWz
         pidG6PkvW5I23u2LnJohYbZOcO9JfW6lNhZJ3L9T2JtExE8LXidKRlVtbhIPtjAuNG5O
         F0hhHPqRzLcHeEtZuhBLnme6A59RIgC3AP+yLPufLo4NbPByBwpWGoHBHG8qRc1ea+0m
         U98Msty0tJ4xBPH0N0fLsAGQU04j9x9xYjWybMxrJlrHQCr6/nKk9zFnqelgkC6XdRg1
         GH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3vP0uybHMoI06MhLMU0+davaaxi5gh7/XLEaEM3Vsyc=;
        b=G1Wj5j4zn7daSlMT1QD6uBdeUdwyfi6P44hk4VehVR7AyVq9WaXxjJxQv5JOYV/CJI
         lRrbBLOqszHgWohf6UI2Zq+GPpL9tbOgFUQ17ffGoZGkbgBNjML1iD0L9Gqee2k+C4+T
         BzKNM8fVqfRgrY7y9zkN9yVvTDX0wSiWbmh76xdp3odnMaMZXTiA9NlJdBGwHMLdGopr
         83eHP4xVEhL5/h3bc+LxhU1cPFrg4hX7hXWj4xQmMwjTI4v8idkMpYO/tUMxwltGpw0+
         /Id0LSPwXxPYQaYGPbJOjibdngEVA6naT57JN5PJjW3uIo2JiQU0KzLsXmuPnL9Jhd9J
         juag==
X-Gm-Message-State: AOAM530gtzdOodCgBc9Kuv2lYHyrEr9cA9oVh3fVkXA39QCZYzy/+iUi
        Ipxd+7h/rULzKTZEbusyKG0=
X-Google-Smtp-Source: ABdhPJzNh6kc3Iz3W9ExqXkzNYwgaMa3szTFccsGRrIzJ8cI0WU2ZNJTNQOiEIj+ftV0wZ0ibpOCRA==
X-Received: by 2002:a05:6830:909:: with SMTP id v9mr21587485ott.95.1633972669486;
        Mon, 11 Oct 2021 10:17:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k3sm1839364otn.16.2021.10.11.10.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 10:17:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 7/8] watchdog: max77714: add driver for the watchdog in
 the MAX77714 PMIC
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-8-luca@lucaceresoli.net>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <8ce6ed51-7963-0279-f771-66226e6b5a6d@roeck-us.net>
Date:   Mon, 11 Oct 2021 10:17:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011155615.257529-8-luca@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/11/21 8:56 AM, Luca Ceresoli wrote:
> Add a simple driver to suppor the watchdog embedded in the Maxim MAX77714
> PMIC.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>   MAINTAINERS                     |   1 +
>   drivers/watchdog/Kconfig        |   9 ++
>   drivers/watchdog/Makefile       |   1 +
>   drivers/watchdog/max77714_wdt.c | 171 ++++++++++++++++++++++++++++++++
>   4 files changed, 182 insertions(+)
>   create mode 100644 drivers/watchdog/max77714_wdt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index df394192f14e..08900b5729a5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11390,6 +11390,7 @@ M:	Luca Ceresoli <luca@lucaceresoli.net>
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
>   F:	drivers/mfd/max77714.c
> +F:	drivers/watchdog/max77714_wdt.c
>   F:	include/linux/mfd/max77714.h
>   
>   MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index bf59faeb3de1..00bc3f932a6c 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -699,6 +699,15 @@ config MAX77620_WATCHDOG
>   	 MAX77620 chips. To compile this driver as a module,
>   	 choose M here: the module will be called max77620_wdt.
>   
> +config MAX77714_WATCHDOG
> +	tristate "Maxim MAX77714 Watchdog Timer"
> +	depends on MFD_MAX77714 || COMPILE_TEST
> +	help
> +	 This is the driver for watchdog timer in the MAX77714 PMIC.
> +	 Say 'Y' here to enable the watchdog timer support for
> +	 MAX77714 chips. To compile this driver as a module,
> +	 choose M here: the module will be called max77714_wdt.
> +
>   config IMX2_WDT
>   	tristate "IMX2+ Watchdog"
>   	depends on ARCH_MXC || ARCH_LAYERSCAPE || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 1bd2d6f37c53..268a942311a0 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -215,6 +215,7 @@ obj-$(CONFIG_WM831X_WATCHDOG) += wm831x_wdt.o
>   obj-$(CONFIG_WM8350_WATCHDOG) += wm8350_wdt.o
>   obj-$(CONFIG_MAX63XX_WATCHDOG) += max63xx_wdt.o
>   obj-$(CONFIG_MAX77620_WATCHDOG) += max77620_wdt.o
> +obj-$(CONFIG_MAX77714_WATCHDOG) += max77714_wdt.o
>   obj-$(CONFIG_ZIIRAVE_WATCHDOG) += ziirave_wdt.o
>   obj-$(CONFIG_SOFT_WATCHDOG) += softdog.o
>   obj-$(CONFIG_MENF21BMC_WATCHDOG) += menf21bmc_wdt.o
> diff --git a/drivers/watchdog/max77714_wdt.c b/drivers/watchdog/max77714_wdt.c
> new file mode 100644
> index 000000000000..2d468db849f9
> --- /dev/null
> +++ b/drivers/watchdog/max77714_wdt.c
> @@ -0,0 +1,171 @@
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
> +unsigned int max77714_margin_value[] = { 2, 16, 64, 128 };

static

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
> +static struct platform_driver max77714_wdt_driver = {
> +	.driver	= {
> +		.name	= "max77714-watchdog",
> +	},
> +	.probe	= max77714_wdt_probe,
> +};
> +
> +module_platform_driver(max77714_wdt_driver);
> +
> +MODULE_DESCRIPTION("MAX77714 watchdog timer driver");
> +MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
> +MODULE_LICENSE("GPL v2");
> 

