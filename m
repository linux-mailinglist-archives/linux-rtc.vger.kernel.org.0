Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04CA911839B
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Dec 2019 10:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfLJJcd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Dec 2019 04:32:33 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37092 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727016AbfLJJcd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 Dec 2019 04:32:33 -0500
Received: by mail-wm1-f68.google.com with SMTP id f129so2306590wmf.2
        for <linux-rtc@vger.kernel.org>; Tue, 10 Dec 2019 01:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=PSQScSDnlo93GQoR20fpTB0eabm3bHRkOsN6d+uG2Do=;
        b=eNIDMvR7jYjMDJ33K7agoubEz5UWh0Io+iFSLRF9tX5UlGsDktzRU0FsSJKS5TNhDd
         qlzsjbcqiNxRwHPUyzOfiW/xjVrOT7IYd7PwcsGg3vGI/IPjT4UKIhjz5w2JP8ToV1si
         cZg+la7VhwCun03B5aBU3ewEWjmWEL5W4OWNJ0Sb2ZL5KCCSf4FYxREbcOYL1I9L8wIX
         2USnsNPJ13f9zZmRgzK7Br5OyU5kNS+VF4hokDJBl2ARoUAn6vaIlrqpHSwm/4BhIz5u
         1mRXLGPXvGNYdg+npJP0+Gnuoz8JTm6CgmlmIJ/bFSKZ3zUuZN6dZy61nRO83mixc+r0
         qdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=PSQScSDnlo93GQoR20fpTB0eabm3bHRkOsN6d+uG2Do=;
        b=jABaPGdV6XeEZCONRlH7dAlvMWauNORrz89OnaZp6qW03tDYvhES4Utuwpt0oBydjl
         XfPMS09pRX0LJOAgTq05Zj1VB7by3QNOTQHKeALGee5fo3IZ9gAGdUDoOA4CTjT1Y9Y9
         gDdIiA5VzyApVGIdIAZW3dn+W6uLI3q+pbxUqO9Ho6+kT0dcfFvXTT3/lanXTe5/w0Vk
         IVTpqSmG9aX8GPTo5skP6Nrg89g5dK5NCTbw8nIcz6sZ8+BW0ENZFocdAU96BjTDsXnI
         CwIb+MDK9MtjV43IUOrWYk9j8Df1CzqGqaA9Uk6NJyjkaz/dlH69eX89c98WEVvYQe6H
         MeBQ==
X-Gm-Message-State: APjAAAVZEfUy/o3/ddon9n5fvZQYxzNZOzx9/pJlph5fqEYgBIVITUJM
        8atQx2GV5Mgxx5fXbuRPJ9ZViw==
X-Google-Smtp-Source: APXvYqxd7XdmmKIlfxIhihp8NUrV17zAGt34iW5Yzln3ZQcnD4qVroNU36dFKANfT88q64YCiOxP0g==
X-Received: by 2002:a1c:407:: with SMTP id 7mr3889627wme.29.1575970351127;
        Tue, 10 Dec 2019 01:32:31 -0800 (PST)
Received: from dell (h185-20-99-176.host.redstation.co.uk. [185.20.99.176])
        by smtp.gmail.com with ESMTPSA id f1sm2517194wrp.93.2019.12.10.01.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 01:32:30 -0800 (PST)
Date:   Tue, 10 Dec 2019 09:32:25 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v3 3/6] mfd: rn5t618: add irq support
Message-ID: <20191210093225.GT3468@dell>
References: <20191129212045.18325-1-andreas@kemnade.info>
 <20191129212045.18325-4-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191129212045.18325-4-andreas@kemnade.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 29 Nov 2019, Andreas Kemnade wrote:

> This adds support for irq handling in the rc5t619 which is required

Please capitalise abbreviations and device names (as they do in the
datasheet).

> for properly implementing subdevices like rtc.

"RTC"

> For now only definitions for the variant rc5t619 are included.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Changes in v3:
> alignment cleanup
> 
> Changes in v2:
> - no dead code, did some more testing and thinking for that
> - remove extra empty lines
> 
>  drivers/mfd/Kconfig         |  1 +
>  drivers/mfd/Makefile        |  2 +-
>  drivers/mfd/rn5t618-core.c  | 34 ++++++++++++++-
>  drivers/mfd/rn5t618-irq.c   | 85 +++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/rn5t618.h | 16 +++++++
>  5 files changed, 136 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/mfd/rn5t618-irq.c
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index ae24d3ea68ea..522e068d0082 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1057,6 +1057,7 @@ config MFD_RN5T618
>  	depends on OF
>  	select MFD_CORE
>  	select REGMAP_I2C
> +	select REGMAP_IRQ
>  	help
>  	  Say yes here to add support for the Ricoh RN5T567,
>  	  RN5T618, RC5T619 PMIC.
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 110ea700231b..2906d5db67d0 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -217,7 +217,7 @@ obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
>  obj-$(CONFIG_MFD_RC5T583)	+= rc5t583.o rc5t583-irq.o
>  obj-$(CONFIG_MFD_RK808)		+= rk808.o
>  
> -rn5t618-objs			:= rn5t618-core.o
> +rn5t618-objs			:= rn5t618-core.o rn5t618-irq.o
>  obj-$(CONFIG_MFD_RN5T618)	+= rn5t618.o
>  obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
>  obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
> diff --git a/drivers/mfd/rn5t618-core.c b/drivers/mfd/rn5t618-core.c
> index da5cd9c92a59..1e2326217681 100644
> --- a/drivers/mfd/rn5t618-core.c
> +++ b/drivers/mfd/rn5t618-core.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
> +#include <linux/interrupt.h>
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/rn5t618.h>
>  #include <linux/module.h>
> @@ -105,7 +106,8 @@ static int rn5t618_i2c_probe(struct i2c_client *i2c,
>  
>  	i2c_set_clientdata(i2c, priv);
>  	priv->variant = (long)of_id->data;
> -
> +	priv->chip_irq = i2c->irq;
> +	priv->dev = &i2c->dev;

'\n'

>  	priv->regmap = devm_regmap_init_i2c(i2c, &rn5t618_regmap_config);
>  	if (IS_ERR(priv->regmap)) {
>  		ret = PTR_ERR(priv->regmap);
> @@ -137,6 +139,11 @@ static int rn5t618_i2c_probe(struct i2c_client *i2c,
>  		return ret;
>  	}
>  
> +	if (priv->chip_irq > 0) {
> +		if (rn5t618_irq_init(priv))
> +			priv->chip_irq = 0;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -154,15 +161,40 @@ static int rn5t618_i2c_remove(struct i2c_client *i2c)
>  	return 0;
>  }
>  
> +static int __maybe_unused rn5t618_i2c_suspend(struct device *dev)
> +{
> +	struct rn5t618 *priv = dev_get_drvdata(dev);
> +
> +	if (priv->chip_irq)
> +		disable_irq(priv->chip_irq);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused rn5t618_i2c_resume(struct device *dev)
> +{
> +	struct rn5t618 *priv = dev_get_drvdata(dev);
> +
> +	if (priv->chip_irq)
> +		enable_irq(priv->chip_irq);
> +
> +	return 0;
> +}
> +
>  static const struct i2c_device_id rn5t618_i2c_id[] = {
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, rn5t618_i2c_id);

Not this patch I know, but it's strange to see this empty.

> +static SIMPLE_DEV_PM_OPS(rn5t618_i2c_dev_pm_ops,
> +			rn5t618_i2c_suspend,
> +			rn5t618_i2c_resume);
> +
>  static struct i2c_driver rn5t618_i2c_driver = {
>  	.driver = {
>  		.name = "rn5t618",
>  		.of_match_table = of_match_ptr(rn5t618_of_match),
> +		.pm = &rn5t618_i2c_dev_pm_ops,
>  	},
>  	.probe = rn5t618_i2c_probe,
>  	.remove = rn5t618_i2c_remove,
> diff --git a/drivers/mfd/rn5t618-irq.c b/drivers/mfd/rn5t618-irq.c

Why does this need to be separate from the core file?

> new file mode 100644
> index 000000000000..8a4c56429768
> --- /dev/null
> +++ b/drivers/mfd/rn5t618-irq.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2019 Andreas Kemnade
> + */
> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +
> +#include <linux/mfd/rn5t618.h>
> +
> +static const struct regmap_irq rc5t619_irqs[] = {
> +	[RN5T618_IRQ_SYS] = {
> +		.reg_offset = 0,
> +		.mask = (0 << 1)
> +	},
> +	[RN5T618_IRQ_DCDC] = {
> +		.reg_offset = 0,
> +		.mask = (1 << 1)

BIT()

> +	},
> +	[RN5T618_IRQ_RTC]  = {
> +		.reg_offset = 0,
> +		.mask = (1 << 2)
> +	},
> +	[RN5T618_IRQ_ADC] = {
> +		.reg_offset = 0,
> +		.mask = (1 << 3)
> +	},
> +	[RN5T618_IRQ_GPIO] = {
> +		.reg_offset = 0,
> +		.mask = (1 << 4)
> +	},
> +	[RN5T618_IRQ_CHG] = {
> +		.reg_offset = 0,
> +		.mask = (1 << 6),
> +	}
> +};

There are probably macros available to tidy this up.

Take a look in include/linux/regmap.h

> +static const struct regmap_irq_chip rc5t619_irq_chip = {
> +	.name = "rc5t619",
> +	.irqs = rc5t619_irqs,
> +	.num_irqs = ARRAY_SIZE(rc5t619_irqs),
> +	.num_regs = 1,
> +	.status_base = RN5T618_INTMON,
> +	.mask_base = RN5T618_INTEN,
> +	.mask_invert = true,
> +};
> +
> +int rn5t618_irq_init(struct rn5t618 *rn5t618)
> +{
> +	const struct regmap_irq_chip *irq_chip;
> +	int ret;
> +
> +	if (!rn5t618->chip_irq)
> +		return 0;
> +
> +	switch (rn5t618->variant) {
> +	case RC5T619:
> +		irq_chip = &rc5t619_irq_chip;
> +		break;
> +
> +		/* TODO: check irq definitions for other variants */

No need for this.  It's implied.

OOI, when support for more variants be added?

> +	default:
> +		irq_chip = NULL;
> +		break;
> +	}
> +
> +	if (!irq_chip) {
> +		dev_err(rn5t618->dev, "no IRQ definition known for variant\n");

How about '"Variant %d not currently supported", rn5t618->variant'

> +		return -ENOENT;
> +	}
> +
> +	ret = devm_regmap_add_irq_chip(rn5t618->dev, rn5t618->regmap,
> +				       rn5t618->chip_irq,
> +				       IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +				       0, irq_chip, &rn5t618->irq_data);
> +	if (ret != 0) {

if (ret)

> +		dev_err(rn5t618->dev, "Failed to register IRQ chip\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> diff --git a/include/linux/mfd/rn5t618.h b/include/linux/mfd/rn5t618.h
> index d62ef48060b5..edd2b6485e3b 100644
> --- a/include/linux/mfd/rn5t618.h
> +++ b/include/linux/mfd/rn5t618.h
> @@ -242,9 +242,25 @@ enum {
>  	RC5T619,
>  };
>  
> +/* RN5T618 IRQ definitions */
> +enum {
> +	RN5T618_IRQ_SYS,

= 0?

> +	RN5T618_IRQ_DCDC,
> +	RN5T618_IRQ_RTC,
> +	RN5T618_IRQ_ADC,
> +	RN5T618_IRQ_GPIO,
> +	RN5T618_IRQ_CHG,
> +	RN5T618_NR_IRQS,
> +};
> +
>  struct rn5t618 {
>  	struct regmap *regmap;
> +	struct device *dev;
>  	long variant;
> +
> +	int chip_irq;

Are there any other kinds of IRQ?

If you don't have to differentiate between multiple, just 'irq' will
do.

This could also get confused with 'irq_chip'.

> +	struct regmap_irq_chip_data *irq_data;
>  };
>  
> +extern int rn5t618_irq_init(struct rn5t618 *rn5t618);
>  #endif /* __LINUX_MFD_RN5T618_H */

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
