Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED14429F66
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Oct 2021 10:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234590AbhJLILX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Oct 2021 04:11:23 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38924
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232541AbhJLILX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Oct 2021 04:11:23 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4FA8940016
        for <linux-rtc@vger.kernel.org>; Tue, 12 Oct 2021 08:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634026161;
        bh=YDhn+HqcubjSHj/iuAe5AX6ng0CjkKazyvl8VpaTJpA=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=M7ob3Zoqdhw04WCpUMfDrC6wvvUF7wnzVICamiY8WCXhKwTlLpt+CV+JeM0q2kBFL
         aKv8fQb7Cy37Od434CVDum7DQkGOkj7yFxgtTJ+JrUwPq3Unfu5kYhw0f3a1PGp4zf
         i6u7x6KhfsAJ9s0tu2wk5CIuB9RF33UHxAyRnggL6MpCU7A6xQ9wzfgOqtX4V9BQZJ
         EdZAoxliLm5CtVpTYQdurC9ag1qHs0IK15JJxVbBPxydjVaXWgaNPamPHzQdX73JyN
         tYaIJABDJwTEiioEas8annsxHFD1VhmrdMXzSsM90oJmGNRjyrz6z5/WNIWgo7aI4f
         r42NAu94ixdLQ==
Received: by mail-lf1-f71.google.com with SMTP id br42-20020a056512402a00b003fd94a74905so3034207lfb.7
        for <linux-rtc@vger.kernel.org>; Tue, 12 Oct 2021 01:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YDhn+HqcubjSHj/iuAe5AX6ng0CjkKazyvl8VpaTJpA=;
        b=4+qBUWIAheW+IxqaCxdGFQ5hRQKwydl1FANNXP0FTksm4oEL9wdCnY5OrdXRa4a30W
         WP1motW8lJZ9QhzBcmLtnrVfxYo4fxP3PYHrsXTT/fhZKj+1F2fE+c6/5MBOxEYm6UQw
         IvI4G1SyHXsypGAlk5m2bguHEZFIck5MPT2TqN+t2TKLBTuDMyWtCJjWYIlP8vbSwqAi
         Fnt3Zy91Y0tKVsF8MejZJMWFffYq8wlGnsU/Sduzh8qJlkRXwGOR7NYfvdvKK+Jxqpi5
         uwXWhWBI0rvceeA/GX5H3jkNC7+aDHBs+H7cF1zaaNVEBXcnT0NVkOaiap131OmCEekE
         1bJA==
X-Gm-Message-State: AOAM532McN7oZ4BOQfwyjHGcXsyb+FCg1R3TJBVCHxKKx7m8dcy9TiPE
        JIpXRxFJKlEc4mAuXbnlD0wrmubcCt4PcqkY33jWPea3lhIq1upKrZVRVh1maUwxFi0kzdf14Vp
        XYvVV+hNxBL+LIAQx6vCDCZtJcGRctiHo92WgSg==
X-Received: by 2002:a2e:9e98:: with SMTP id f24mr27591149ljk.519.1634026159458;
        Tue, 12 Oct 2021 01:09:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTUELtZipU/CS7pmp2uDOqSzugzpmjeJmv7f9VugUL1VDmj3V9mlGa1x4a0T83D67UeKpxtA==
X-Received: by 2002:a2e:9e98:: with SMTP id f24mr27591127ljk.519.1634026159255;
        Tue, 12 Oct 2021 01:09:19 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p9sm958939lfe.3.2021.10.12.01.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 01:09:18 -0700 (PDT)
Subject: Re: [PATCH 6/8] mfd: max77714: Add driver for Maxim MAX77714 PMIC
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-7-luca@lucaceresoli.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <79a3c52b-ed4a-dadb-c7e2-2c96c9a58c49@canonical.com>
Date:   Tue, 12 Oct 2021 10:09:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011155615.257529-7-luca@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/10/2021 17:56, Luca Ceresoli wrote:
> Add a simple driver for the Maxim MAX77714 PMIC, supporting RTC and
> watchdog only.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  MAINTAINERS                  |   2 +
>  drivers/mfd/Kconfig          |  14 ++++
>  drivers/mfd/Makefile         |   1 +
>  drivers/mfd/max77714.c       | 151 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/max77714.h |  68 ++++++++++++++++
>  5 files changed, 236 insertions(+)
>  create mode 100644 drivers/mfd/max77714.c
>  create mode 100644 include/linux/mfd/max77714.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4d0134752537..df394192f14e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11389,6 +11389,8 @@ MAXIM MAX77714 PMIC MFD DRIVER
>  M:	Luca Ceresoli <luca@lucaceresoli.net>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
> +F:	drivers/mfd/max77714.c
> +F:	include/linux/mfd/max77714.h
>  
>  MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
>  M:	Javier Martinez Canillas <javier@dowhile0.org>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index ca0edab91aeb..b5f6e6174508 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -853,6 +853,20 @@ config MFD_MAX77693
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_MAX77714
> +	bool "Maxim Semiconductor MAX77714 PMIC Support"

Why it cannot be a tristate (module)?

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
>  config MFD_MAX77843
>  	bool "Maxim Semiconductor MAX77843 PMIC Support"
>  	depends on I2C=y
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 2ba6646e874c..fe43f2fdd5cb 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -163,6 +163,7 @@ obj-$(CONFIG_MFD_MAX77620)	+= max77620.o
>  obj-$(CONFIG_MFD_MAX77650)	+= max77650.o
>  obj-$(CONFIG_MFD_MAX77686)	+= max77686.o
>  obj-$(CONFIG_MFD_MAX77693)	+= max77693.o
> +obj-$(CONFIG_MFD_MAX77714)	+= max77714.o
>  obj-$(CONFIG_MFD_MAX77843)	+= max77843.o
>  obj-$(CONFIG_MFD_MAX8907)	+= max8907.o
>  max8925-objs			:= max8925-core.o max8925-i2c.o
> diff --git a/drivers/mfd/max77714.c b/drivers/mfd/max77714.c
> new file mode 100644
> index 000000000000..5d6c88d4d6c0
> --- /dev/null
> +++ b/drivers/mfd/max77714.c
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Maxim MAX77714 Watchdog Driver
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

Try to make it a module, so: module_i2c_driver

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

Header guard:
__LINUX_MFD_MAX77714_H_

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

Do you have to make it a public structure? If not, please put it in the
max77714.c



> +
> +#endif /* _MFD_MAX77714_H_ */
> 


Best regards,
Krzysztof
