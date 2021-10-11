Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1EEC429563
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Oct 2021 19:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233849AbhJKRRg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Oct 2021 13:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233171AbhJKRRf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Oct 2021 13:17:35 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF85C061749;
        Mon, 11 Oct 2021 10:15:35 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id k2-20020a056830168200b0054e523d242aso13028752otr.6;
        Mon, 11 Oct 2021 10:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PMm7yTyGN8MvXy9pUE1jPcciaJ1BXUZaMTKUAhk4xvw=;
        b=Ad5iiYZDl2vQuTIPjVq0afrynV3RmrJ6A/hH5iS9e5DK89mtq4tdnxgBouucNFcjWL
         OA3xJiJPpIZsIp9qISq4UHyDisJJFqbXSyL5HD9EH+81jKTeTQ6BsS5r3GEggEQZfQXL
         8YTCSKYUNqtbySi0uUYWxaIQ0nVjx8K6J2FmXifTDPd/3JIN3yKpaJU1Y1+MU1bkF7M3
         ocAd3nfck0uG9teCwFljeKcOCpZ5tn5l0MnEOcYenKynmANr2cG4X/Vefvkvpqy6nGwH
         O9UMwZxXtGFqhYeEH/v2A+AGs1TtiGWPYMaxQ5RQVZX1upEWx0K0W2TnO4IyAZ+3tsgd
         eUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PMm7yTyGN8MvXy9pUE1jPcciaJ1BXUZaMTKUAhk4xvw=;
        b=4ibDefy3isEpAvo9bgLbGd8xZG3tayQPO724w3d0ytXpDf6LR47E32IU8lbwYSjdGp
         rVw1bVRu91/IMjp0OBXeKulGVDHLaDBSnLDQaDy7OLvHp0bvUnXnilWe4PV7sYenZMA3
         KaVhMJR41Q5m5mgvgy5h89FfpYwB7/UjlvDMQsC8uY7ke8s4+qkFNNqyn339tDnUUFsl
         rPHhNGBHPVYiDhBe6mU8XxSSymWsOdPOFb6C2Fv1f02wmR+pACB2I+rz8chrTfaJHGqp
         8ZN6yrXfJp1zq+s3GiFwVlPy4Qs3XuE8s3RgbCwTNwYguY7FAkfCIDmKsOxunwMzDVGf
         8VlA==
X-Gm-Message-State: AOAM531UBJoZFPICIJqjOxI2e+iBS7+nY4KoaTrCve1xNu60eSDhCoKS
        THMQw4hO3wj9kI6OBluy2/I=
X-Google-Smtp-Source: ABdhPJzRxkW1ALBqJ6BansLox3VzY8kyFijHiY8XcvHiVBUtUggLzb5vjsq053QybopZcJ3pK6yCJw==
X-Received: by 2002:a05:6830:2316:: with SMTP id u22mr9368976ote.239.1633972534643;
        Mon, 11 Oct 2021 10:15:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k2sm1638358oot.37.2021.10.11.10.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 10:15:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 6/8] mfd: max77714: Add driver for Maxim MAX77714 PMIC
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
 <20211011155615.257529-7-luca@lucaceresoli.net>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e4fe193a-9581-8d9f-15d9-45ebe7a1f64c@roeck-us.net>
Date:   Mon, 11 Oct 2021 10:15:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011155615.257529-7-luca@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/11/21 8:56 AM, Luca Ceresoli wrote:
> Add a simple driver for the Maxim MAX77714 PMIC, supporting RTC and
> watchdog only.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>   MAINTAINERS                  |   2 +
>   drivers/mfd/Kconfig          |  14 ++++
>   drivers/mfd/Makefile         |   1 +
>   drivers/mfd/max77714.c       | 151 +++++++++++++++++++++++++++++++++++
>   include/linux/mfd/max77714.h |  68 ++++++++++++++++
>   5 files changed, 236 insertions(+)
>   create mode 100644 drivers/mfd/max77714.c
>   create mode 100644 include/linux/mfd/max77714.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4d0134752537..df394192f14e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11389,6 +11389,8 @@ MAXIM MAX77714 PMIC MFD DRIVER
>   M:	Luca Ceresoli <luca@lucaceresoli.net>
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
> +F:	drivers/mfd/max77714.c
> +F:	include/linux/mfd/max77714.h
>   
>   MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
>   M:	Javier Martinez Canillas <javier@dowhile0.org>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index ca0edab91aeb..b5f6e6174508 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -853,6 +853,20 @@ config MFD_MAX77693
>   	  additional drivers must be enabled in order to use the functionality
>   	  of the device.
>   
> +config MFD_MAX77714
> +	bool "Maxim Semiconductor MAX77714 PMIC Support"
> +	depends on I2C
> +	depends on OF || COMPILE_TEST
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  Say yes here to add support for Maxim Semiconductor MAX77714.
> +	  This is a Power Management IC with 4 buck regulators, 9
> +	  low-dropout regulators, 8 GPIOs, RTC, watchdog etc. This driver
> +	  provides common support for accessing the device; additional
> +	  drivers must be enabled in order to use each functionality of the
> +	  device.
> +
>   config MFD_MAX77843
>   	bool "Maxim Semiconductor MAX77843 PMIC Support"
>   	depends on I2C=y
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 2ba6646e874c..fe43f2fdd5cb 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -163,6 +163,7 @@ obj-$(CONFIG_MFD_MAX77620)	+= max77620.o
>   obj-$(CONFIG_MFD_MAX77650)	+= max77650.o
>   obj-$(CONFIG_MFD_MAX77686)	+= max77686.o
>   obj-$(CONFIG_MFD_MAX77693)	+= max77693.o
> +obj-$(CONFIG_MFD_MAX77714)	+= max77714.o
>   obj-$(CONFIG_MFD_MAX77843)	+= max77843.o
>   obj-$(CONFIG_MFD_MAX8907)	+= max8907.o
>   max8925-objs			:= max8925-core.o max8925-i2c.o
> diff --git a/drivers/mfd/max77714.c b/drivers/mfd/max77714.c
> new file mode 100644
> index 000000000000..5d6c88d4d6c0
> --- /dev/null
> +++ b/drivers/mfd/max77714.c
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Maxim MAX77714 Watchdog Driver

watchdog ?

> + *
> + * Copyright (C) 2021 Luca Ceresoli
> + * Author: Luca Ceresoli <luca@lucaceresoli.net>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/max77714.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +static const struct regmap_range max77714_readable_ranges[] = {
> +	regmap_reg_range(MAX77714_INT_TOP,     MAX77714_INT_TOP),
> +	regmap_reg_range(MAX77714_INT_TOPM,    MAX77714_INT_TOPM),
> +	regmap_reg_range(MAX77714_32K_STATUS,  MAX77714_32K_CONFIG),
> +	regmap_reg_range(MAX77714_CNFG_GLBL2,  MAX77714_CNFG2_ONOFF),
> +};
> +
> +static const struct regmap_range max77714_writable_ranges[] = {
> +	regmap_reg_range(MAX77714_INT_TOPM,    MAX77714_INT_TOPM),
> +	regmap_reg_range(MAX77714_32K_CONFIG,  MAX77714_32K_CONFIG),
> +	regmap_reg_range(MAX77714_CNFG_GLBL2,  MAX77714_CNFG2_ONOFF),
> +};
> +
> +static const struct regmap_access_table max77714_readable_table = {
> +	.yes_ranges = max77714_readable_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(max77714_readable_ranges),
> +};
> +
> +static const struct regmap_access_table max77714_writable_table = {
> +	.yes_ranges = max77714_writable_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(max77714_writable_ranges),
> +};
> +
> +static const struct regmap_config max77714_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = MAX77714_CNFG2_ONOFF,
> +	.rd_table = &max77714_readable_table,
> +	.wr_table = &max77714_writable_table,
> +};
> +
> +static const struct regmap_irq max77714_top_irqs[] = {
> +	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_ONOFF,   0, MAX77714_INT_TOP_ONOFF),
> +	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_RTC,     0, MAX77714_INT_TOP_RTC),
> +	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_GPIO,    0, MAX77714_INT_TOP_GPIO),
> +	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_LDO,     0, MAX77714_INT_TOP_LDO),
> +	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_SD,      0, MAX77714_INT_TOP_SD),
> +	REGMAP_IRQ_REG(MAX77714_IRQ_TOP_GLBL,    0, MAX77714_INT_TOP_GLBL),
> +};
> +
> +static const struct regmap_irq_chip max77714_irq_chip = {
> +	.name			= "max77714-pmic",
> +	.status_base		= MAX77714_INT_TOP,
> +	.mask_base		= MAX77714_INT_TOPM,
> +	.num_regs		= 1,
> +	.irqs			= max77714_top_irqs,
> +	.num_irqs		= ARRAY_SIZE(max77714_top_irqs),
> +};
> +
> +static const struct mfd_cell max77714_cells[] = {
> +	{ .name = "max77714-watchdog" },
> +	{ .name = "max77714-rtc" },
> +};
> +
> +/*
> + * MAX77714 initially uses the internal, low precision oscillator. Enable
> + * the external oscillator by setting the XOSC_RETRY bit. If the external
> + * oscillator is not OK (probably not installed) this has no effect.
> + */
> +static int max77714_setup_xosc(struct max77714 *chip)
> +{
> +	/* Internal Crystal Load Capacitance, indexed by value of 32KLOAD bits */
> +	static const unsigned int load_cap[4] = {0, 10, 12, 22};
> +	unsigned int load_cap_idx;
> +	unsigned int status;
> +	int err;
> +
> +	err = regmap_update_bits(chip->regmap, MAX77714_32K_CONFIG,
> +				 MAX77714_32K_CONFIG_XOSC_RETRY,
> +				 MAX77714_32K_CONFIG_XOSC_RETRY);
> +	if (err)
> +		return dev_err_probe(chip->dev, err, "cannot configure XOSC\n");
> +
> +	err = regmap_read(chip->regmap, MAX77714_32K_STATUS, &status);
> +	if (err)
> +		return dev_err_probe(chip->dev, err, "cannot read XOSC status\n");
> +
> +	load_cap_idx = (status >> MAX77714_32K_STATUS_32KLOAD_SHF)
> +		& MAX77714_32K_STATUS_32KLOAD_MSK;
> +
> +	dev_info(chip->dev, "Using %s oscillator, %d pF load cap\n",
> +		 status & MAX77714_32K_STATUS_32KSOURCE ? "internal" : "external",
> +		 load_cap[load_cap_idx]);
> +
> +	return 0;
> +}
> +
> +static int max77714_probe(struct i2c_client *client)
> +{
> +	struct max77714 *chip;
> +	int err;
> +
> +	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, chip);
> +	chip->dev = &client->dev;
> +
> +	chip->regmap = devm_regmap_init_i2c(client, &max77714_regmap_config);
> +	if (IS_ERR(chip->regmap))
> +		return dev_err_probe(chip->dev, PTR_ERR(chip->regmap),
> +				     "failed to initialise regmap\n");
> +
> +	err = max77714_setup_xosc(chip);
> +	if (err)
> +		return err;
> +
> +	err = devm_regmap_add_irq_chip(chip->dev, chip->regmap, client->irq,
> +				       IRQF_ONESHOT | IRQF_SHARED, 0,
> +				       &max77714_irq_chip, &chip->irq_data);
> +	if (err)
> +		return dev_err_probe(chip->dev, err, "failed to add PMIC irq chip\n");
> +
> +	err =  devm_mfd_add_devices(chip->dev, PLATFORM_DEVID_NONE,
> +				    max77714_cells, ARRAY_SIZE(max77714_cells),
> +				    NULL, 0, NULL);
> +	if (err)
> +		return dev_err_probe(chip->dev, err, "failed adding MFD children\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id max77714_dt_match[] = {
> +	{ .compatible = "maxim,max77714" },
> +	{},
> +};
> +
> +static struct i2c_driver max77714_driver = {
> +	.driver = {
> +		.name = "max77714",
> +		.of_match_table = of_match_ptr(max77714_dt_match),
> +	},
> +	.probe_new = max77714_probe,
> +};
> +builtin_i2c_driver(max77714_driver);
> diff --git a/include/linux/mfd/max77714.h b/include/linux/mfd/max77714.h
> new file mode 100644
> index 000000000000..ca6b747b73c2
> --- /dev/null
> +++ b/include/linux/mfd/max77714.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Maxim MAX77714 Register and data structures definition.
> + *
> + * Copyright (C) 2021 Luca Ceresoli
> + * Author: Luca Ceresoli <luca@lucaceresoli.net>
> + */
> +
> +#ifndef _MFD_MAX77714_H_
> +#define _MFD_MAX77714_H_
> +
> +#include <linux/bits.h>
> +
> +#define MAX77714_INT_TOP	0x00
> +#define MAX77714_INT_TOPM	0x07 /* Datasheet says "read only", but it is RW */
> +
> +#define MAX77714_INT_TOP_ONOFF		BIT(1)
> +#define MAX77714_INT_TOP_RTC		BIT(3)
> +#define MAX77714_INT_TOP_GPIO		BIT(4)
> +#define MAX77714_INT_TOP_LDO		BIT(5)
> +#define MAX77714_INT_TOP_SD		BIT(6)
> +#define MAX77714_INT_TOP_GLBL		BIT(7)
> +
> +#define MAX77714_32K_STATUS	0x30
> +#define MAX77714_32K_STATUS_SIOSCOK	BIT(5)
> +#define MAX77714_32K_STATUS_XOSCOK	BIT(4)
> +#define MAX77714_32K_STATUS_32KSOURCE	BIT(3)
> +#define MAX77714_32K_STATUS_32KLOAD_MSK	0x3
> +#define MAX77714_32K_STATUS_32KLOAD_SHF	1
> +#define MAX77714_32K_STATUS_CRYSTAL_CFG	BIT(0)
> +
> +#define MAX77714_32K_CONFIG	0x31
> +#define MAX77714_32K_CONFIG_XOSC_RETRY	BIT(4)
> +
> +#define MAX77714_CNFG_GLBL2	0x91
> +#define MAX77714_WDTEN			BIT(2)
> +#define MAX77714_WDTSLPC		BIT(3)
> +#define MAX77714_TWD_MASK		0x3
> +#define MAX77714_TWD_2s			0x0
> +#define MAX77714_TWD_16s		0x1
> +#define MAX77714_TWD_64s		0x2
> +#define MAX77714_TWD_128s		0x3
> +
> +#define MAX77714_CNFG_GLBL3	0x92
> +#define MAX77714_WDTC			BIT(0)
> +
> +#define MAX77714_CNFG2_ONOFF	0x94
> +#define MAX77714_WD_RST_WK		BIT(5)
> +
> +/* Interrupts */
> +enum {
> +	MAX77714_IRQ_TOP_ONOFF,
> +	MAX77714_IRQ_TOP_RTC,		/* Real-time clock */
> +	MAX77714_IRQ_TOP_GPIO,		/* GPIOs */
> +	MAX77714_IRQ_TOP_LDO,		/* Low-dropout regulators */
> +	MAX77714_IRQ_TOP_SD,		/* Step-down regulators */
> +	MAX77714_IRQ_TOP_GLBL,		/* "Global resources": Low-Battery, overtemp... */
> +};
> +
> +struct max77714 {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct regmap_irq_chip_data *irq_data;
> +
> +	int irq;
> +};
> +
> +#endif /* _MFD_MAX77714_H_ */
> 

