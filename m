Return-Path: <linux-rtc+bounces-3618-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF84A7112A
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Mar 2025 08:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D62543B887B
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Mar 2025 07:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674ED199938;
	Wed, 26 Mar 2025 07:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nA+gFUAl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CA6C8FE;
	Wed, 26 Mar 2025 07:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742973259; cv=none; b=nugkfL/F861B3qAbVP89FRxlCy+ZZSiEzIt/fz30s3rMOigHQxvgqwHNULoKnzILWrUTD4aKGc4VQNFs7rbvkCYQMnW0TwderI0FXyUJqD+j5WdszKzNSu8tJ/wWRvgCuy4gwfem4sfFdvvpOnAty+M/8h42iU6SKu5K7gT0cpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742973259; c=relaxed/simple;
	bh=YsbW34rxDPlu0jvkYv6otWfqXQB68yTeQlvep8QoTxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbNO9tGG0UXq4EFtwWlpz3KXQEQL3AuFlgfWnPLH9Hxtgf/0kWJt4vBnEQFYBMqgs2x6iEdAlCYC9zUa+7FrxBueHKymzAIr25G44O8olUrUM7UPlMrdqSel5zd9qYHZzX25ihHtklFXTQgxLKSy7S8q/wavE2uhbOA6NTDqSDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nA+gFUAl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7B5C4CEEE;
	Wed, 26 Mar 2025 07:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742973258;
	bh=YsbW34rxDPlu0jvkYv6otWfqXQB68yTeQlvep8QoTxc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nA+gFUAlFSSnQsRW56o7/clnvtjYseNB5x6R2zngeP2JpCGsG8DzqbJUTkDQet6v3
	 iIXhezCEOYXPFMlAwKF58AtYlZZzOH5IcbyS8O5PzvoICvzaLxxHqGW0JUio3KsPtU
	 ZIeDLlLeCJ6FazXHl8kvGDJwrKnuEmhp3zm69u9PKQxeVJ3WpHgyxUSXBLhxs+sgmv
	 XqUjbfX18PIRU3W16bzllhiN79QZSdCUjotHvwtQlt3sjsNnqmjOlVaADynDT+pizH
	 y6Wmd8dd16hH4q1l55sOoNruwtmA0+1wZVsuv8HB+zHWrhIqnpOcgX2YxQuylig6uC
	 dNFbTkS9/USSg==
Message-ID: <79a2bdd7-af66-4876-9553-bb2223760880@kernel.org>
Date: Wed, 26 Mar 2025 08:14:06 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/34] mfd: sec: split into core and transport (i2c)
 drivers
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
 <20250323-s2mpg10-v1-10-d08943702707@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250323-s2mpg10-v1-10-d08943702707@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/03/2025 23:39, André Draszik wrote:
> -
> -	sec_pmic->regmap_pmic = devm_regmap_init_i2c(i2c, regmap);
> -	if (IS_ERR(sec_pmic->regmap_pmic)) {
> -		ret = PTR_ERR(sec_pmic->regmap_pmic);
> -		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
> -			ret);
> -		return ret;
> +	if (probedata) {

I don't get why this is conditional. New transport will also provide
probedata or at least it should.

> +		pdata->manual_poweroff = probedata->manual_poweroff;
> +		pdata->disable_wrstbi = probedata->disable_wrstbi;
>  	}
>  
>  	sec_irq_init(sec_pmic);
> @@ -383,9 +195,9 @@ static int sec_pmic_probe(struct i2c_client *i2c)
>  		num_sec_devs = ARRAY_SIZE(s2mpu05_devs);
>  		break;
>  	default:
> -		dev_err(&i2c->dev, "Unsupported device type (%lu)\n",
> +		dev_err(sec_pmic->dev, "Unsupported device type %lu\n",
>  			sec_pmic->device_type);
> -		return -ENODEV;
> +		return -EINVAL;
>  	}
>  	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
>  				   NULL, 0, NULL);
> @@ -397,10 +209,11 @@ static int sec_pmic_probe(struct i2c_client *i2c)
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(sec_pmic_probe);
>  
> -static void sec_pmic_shutdown(struct i2c_client *i2c)
> +void sec_pmic_shutdown(struct device *dev)
>  {
> -	struct sec_pmic_dev *sec_pmic = i2c_get_clientdata(i2c);
> +	struct sec_pmic_dev *sec_pmic = dev_get_drvdata(dev);
>  	unsigned int reg, mask;
>  
>  	if (!sec_pmic->pdata->manual_poweroff)
> @@ -424,11 +237,11 @@ static void sec_pmic_shutdown(struct i2c_client *i2c)
>  
>  	regmap_update_bits(sec_pmic->regmap_pmic, reg, mask, 0);
>  }
> +EXPORT_SYMBOL_GPL(sec_pmic_shutdown);
>  
>  static int sec_pmic_suspend(struct device *dev)
>  {
> -	struct i2c_client *i2c = to_i2c_client(dev);
> -	struct sec_pmic_dev *sec_pmic = i2c_get_clientdata(i2c);
> +	struct sec_pmic_dev *sec_pmic = dev_get_drvdata(dev);
>  
>  	if (device_may_wakeup(dev))
>  		enable_irq_wake(sec_pmic->irq);
> @@ -448,8 +261,7 @@ static int sec_pmic_suspend(struct device *dev)
>  
>  static int sec_pmic_resume(struct device *dev)
>  {
> -	struct i2c_client *i2c = to_i2c_client(dev);
> -	struct sec_pmic_dev *sec_pmic = i2c_get_clientdata(i2c);
> +	struct sec_pmic_dev *sec_pmic = dev_get_drvdata(dev);
>  
>  	if (device_may_wakeup(dev))
>  		disable_irq_wake(sec_pmic->irq);
> @@ -458,20 +270,10 @@ static int sec_pmic_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops,
> -				sec_pmic_suspend, sec_pmic_resume);
> -
> -static struct i2c_driver sec_pmic_driver = {
> -	.driver = {
> -		   .name = "sec_pmic",
> -		   .pm = pm_sleep_ptr(&sec_pmic_pm_ops),
> -		   .of_match_table = sec_dt_match,
> -	},
> -	.probe = sec_pmic_probe,
> -	.shutdown = sec_pmic_shutdown,
> -};
> -module_i2c_driver(sec_pmic_driver);
> +DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
> +EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
>  
> +MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
>  MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
> -MODULE_DESCRIPTION("Core support for the S5M MFD");
> +MODULE_DESCRIPTION("Core driver for the Samsung S5M");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
> index b3fded5f02a0ddc09a9508fd49a5d335f7ad0ee7..58e5b645f377cea5543a215c05957a2c49239a6f 100644
> --- a/drivers/mfd/sec-core.h
> +++ b/drivers/mfd/sec-core.h
> @@ -10,6 +10,23 @@
>  #ifndef __SEC_CORE_INT_H
>  #define __SEC_CORE_INT_H
>  
> +struct i2c_client;
> +
> +extern const struct dev_pm_ops sec_pmic_pm_ops;
> +
> +struct sec_pmic_probe_data {
> +	/* Whether or not manually set PWRHOLD to low during shutdown. */
> +	bool manual_poweroff;
> +	/* Disable the WRSTBI (buck voltage warm reset) when probing? */
> +	bool disable_wrstbi;
> +};
> +
> +int sec_pmic_probe(struct device *dev, unsigned long device_type,
> +		   unsigned int irq, struct regmap *regmap,
> +		   const struct sec_pmic_probe_data *probedata,
> +		   struct i2c_client *client);
> +void sec_pmic_shutdown(struct device *dev);
> +
>  int sec_irq_init(struct sec_pmic_dev *sec_pmic);
>  
>  #endif /* __SEC_CORE_INT_H */
> diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..803a46e657a5a1a639014d442941c0cdc60556a5
> --- /dev/null
> +++ b/drivers/mfd/sec-i2c.c
> @@ -0,0 +1,252 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2012 Samsung Electronics Co., Ltd
> + *                http://www.samsung.com
> + * Copyright 2025 Linaro Ltd.
> + *
> + * Samsung SxM I2C driver
> + */
> +
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/mfd/samsung/core.h>
> +#include <linux/mfd/samsung/s2mpa01.h>
> +#include <linux/mfd/samsung/s2mps11.h>
> +#include <linux/mfd/samsung/s2mps13.h>
> +#include <linux/mfd/samsung/s2mps14.h>
> +#include <linux/mfd/samsung/s2mps15.h>
> +#include <linux/mfd/samsung/s2mpu02.h>
> +#include <linux/mfd/samsung/s5m8767.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pm.h>
> +#include <linux/regmap.h>
> +#include "sec-core.h"
> +
> +static bool s2mpa01_volatile(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case S2MPA01_REG_INT1M:
> +	case S2MPA01_REG_INT2M:
> +	case S2MPA01_REG_INT3M:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
> +static bool s2mps11_volatile(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case S2MPS11_REG_INT1M:
> +	case S2MPS11_REG_INT2M:
> +	case S2MPS11_REG_INT3M:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
> +static bool s2mpu02_volatile(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case S2MPU02_REG_INT1M:
> +	case S2MPU02_REG_INT2M:
> +	case S2MPU02_REG_INT3M:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
> +static const struct regmap_config sec_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +};
> +
> +static const struct regmap_config s2mpa01_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +
> +	.max_register = S2MPA01_REG_LDO_OVCB4,
> +	.volatile_reg = s2mpa01_volatile,
> +	.cache_type = REGCACHE_FLAT,
> +};
> +
> +static const struct regmap_config s2mps11_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +
> +	.max_register = S2MPS11_REG_L38CTRL,
> +	.volatile_reg = s2mps11_volatile,
> +	.cache_type = REGCACHE_FLAT,
> +};
> +
> +static const struct regmap_config s2mps13_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +
> +	.max_register = S2MPS13_REG_LDODSCH5,
> +	.volatile_reg = s2mps11_volatile,
> +	.cache_type = REGCACHE_FLAT,
> +};
> +
> +static const struct regmap_config s2mps14_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +
> +	.max_register = S2MPS14_REG_LDODSCH3,
> +	.volatile_reg = s2mps11_volatile,
> +	.cache_type = REGCACHE_FLAT,
> +};
> +
> +static const struct regmap_config s2mps15_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +
> +	.max_register = S2MPS15_REG_LDODSCH4,
> +	.volatile_reg = s2mps11_volatile,
> +	.cache_type = REGCACHE_FLAT,
> +};
> +
> +static const struct regmap_config s2mpu02_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +
> +	.max_register = S2MPU02_REG_DVSDATA,
> +	.volatile_reg = s2mpu02_volatile,
> +	.cache_type = REGCACHE_FLAT,
> +};
> +
> +static const struct regmap_config s5m8767_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +
> +	.max_register = S5M8767_REG_LDO28CTRL,
> +	.volatile_reg = s2mps11_volatile,
> +	.cache_type = REGCACHE_FLAT,
> +};
> +
> +/*
> + * Only the common platform data elements for s5m8767 are parsed here from the
> + * device tree. Other sub-modules of s5m8767 such as pmic, rtc , charger and
> + * others have to parse their own platform data elements from device tree.
> + */
> +static void
> +sec_pmic_i2c_parse_dt_pdata(struct device *dev,
> +			    struct sec_pmic_probe_data *pd)
> +{
> +	pd->manual_poweroff =
> +		of_property_read_bool(dev->of_node,
> +				      "samsung,s2mps11-acokb-ground");
> +	pd->disable_wrstbi =
> +		of_property_read_bool(dev->of_node,
> +				      "samsung,s2mps11-wrstbi-ground");
> +}
> +
> +static int sec_pmic_i2c_probe(struct i2c_client *client)
> +{
> +	struct sec_pmic_probe_data probedata;
> +	const struct regmap_config *regmap;
> +	unsigned long device_type;
> +	struct regmap *regmap_pmic;
> +	int ret;
> +
> +	sec_pmic_i2c_parse_dt_pdata(&client->dev, &probedata);

This wasn't tested and it makes no sense. You pass random stack values.
And what is the point of:
"pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);"
in sec_pmic_probe()?


...

> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, sec_pmic_i2c_of_match);
> +
> +static struct i2c_driver sec_pmic_i2c_driver = {
> +	.driver = {
> +		.name = "sec-pmic-i2c",
> +		.pm = pm_sleep_ptr(&sec_pmic_pm_ops),
> +		.of_match_table = sec_pmic_i2c_of_match,
> +	},
> +	.probe = sec_pmic_i2c_probe,
> +	.shutdown = sec_pmic_i2c_shutdown,
> +};
> +module_i2c_driver(sec_pmic_i2c_driver);
> +
> +MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");

This belongs to the patch adding actual features. Moving existing code
or splitting it is not really reason to became the author of the code.
The code was there.

> +MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
> +MODULE_DESCRIPTION("I2C driver for the Samsung S5M");
> +MODULE_LICENSE("GPL");
> 


Best regards,
Krzysztof

