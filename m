Return-Path: <linux-rtc+bounces-5714-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D109ED08AC6
	for <lists+linux-rtc@lfdr.de>; Fri, 09 Jan 2026 11:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 48FE7301CD14
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Jan 2026 10:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6E833ADB5;
	Fri,  9 Jan 2026 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jWORgZjP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DA433ADA1;
	Fri,  9 Jan 2026 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767955541; cv=none; b=cQ7DgrpNM2DnLxNW/Timkl/1k3JzLFWF19skMtwekCyOgoG6vCDoxKRzPOq2L2ltJupjub/wvL7lJOY4/3mouuOdmmy9a8W1ImGOE/qYrhZ5c1wsnfqzPkW6ZH2A8F3ViGbcchiijLAl889irPhZxQx5c4Juej1CdiOflDbE3V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767955541; c=relaxed/simple;
	bh=Q9mIsLwP/WOQcpRD5JztTR95nAw1C5c4vkMXy+4o5EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YViKA5wq0lz78riIzG9s5vOaApU32VCn3VdzzkbbCgbXuhovMFYzMzN3YUhzixBMYcygIS9FARs3cPYkcZI19KI31hePSbw0jJMf8PLrF3ASYVw8yWgdr4xVUUCANETX7HCF/KKXMzcsEpL5y0H5/h1nICGt3RYuenQvBn6wpW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jWORgZjP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1836C4CEF1;
	Fri,  9 Jan 2026 10:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767955540;
	bh=Q9mIsLwP/WOQcpRD5JztTR95nAw1C5c4vkMXy+4o5EU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jWORgZjPZoFkg5KwGkbe3uzzv9Un2vuP4I1TMpKEL86WN3fNZwU/xDg2+9/zp7xLa
	 Arz+MLiYl8xmmTWEwBj4PP3aJlRiJ00sgGZw1d/pGDy1up6SfRjcHPXVOlt3IYihfd
	 EcDuf2KUmtOFH6DPJbrjrt6MLrVbuuv/7gjd2NGBwzm277somIWxScBsprzXC3OakV
	 EjiBrkEthqEIy0/jpUdsOb/VEjdyjZI1OFb6+T6yCY4QJyZ9Z88C0SJ30eUjP42e2I
	 ByJQnM9CUXGZhbPcGA0DTjrL9bYtX/iovG5OnKs+KniOSiRXBXJzBroXJQaxgc+PD7
	 5kvFcHAM1W+XA==
Date: Fri, 9 Jan 2026 10:45:34 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>,
	Douglas Anderson <dianders@chromium.org>, kernel-team@android.com,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH RESEND v2 3/3] mfd: sec: drop now unused struct
 sec_pmic_dev::irq_data
Message-ID: <20260109104534.GF1118061@google.com>
References: <20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org>
 <20251217-s5m-alarm-v2-3-b7bff003e94c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251217-s5m-alarm-v2-3-b7bff003e94c@linaro.org>

On Wed, 17 Dec 2025, André Draszik wrote:

> This was used only to allow the s5m RTC driver to deal with the alarm
> IRQ. That driver now uses a different approach to acquire that IRQ, and
> ::irq_data doesn't need to be kept around anymore.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/mfd/sec-common.c         |  9 +++---
>  drivers/mfd/sec-core.h           |  2 +-
>  drivers/mfd/sec-irq.c            | 63 ++++++++++++++++++----------------------
>  include/linux/mfd/samsung/core.h |  1 -
>  4 files changed, 35 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> index 77370db52a7ba81234136b29f85892f4b197f429..0021f9ae8484fd0afc2e47c813a953c91fa38546 100644
> --- a/drivers/mfd/sec-common.c
> +++ b/drivers/mfd/sec-common.c
> @@ -163,6 +163,7 @@ sec_pmic_parse_dt_pdata(struct device *dev)
>  int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
>  		   struct regmap *regmap, struct i2c_client *client)
>  {
> +	struct regmap_irq_chip_data *irq_data;
>  	struct sec_platform_data *pdata;
>  	const struct mfd_cell *sec_devs;
>  	struct sec_pmic_dev *sec_pmic;
> @@ -187,9 +188,9 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
>  
>  	sec_pmic->pdata = pdata;
>  
> -	ret = sec_irq_init(sec_pmic);
> -	if (ret)
> -		return ret;
> +	irq_data = sec_irq_init(sec_pmic);
> +	if (IS_ERR(irq_data))
> +		return PTR_ERR(irq_data);
>  
>  	pm_runtime_set_active(sec_pmic->dev);
>  
> @@ -240,7 +241,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
>  				     sec_pmic->device_type);
>  	}
>  	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
> -				   NULL, 0, regmap_irq_get_domain(sec_pmic->irq_data));
> +				   NULL, 0, regmap_irq_get_domain(irq_data));
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
> index 92c7558ab8b0de44a52e028eeb7998e38358cb4c..8d85c70c232612d1f7e5fb61b2acd25bf03a62e0 100644
> --- a/drivers/mfd/sec-core.h
> +++ b/drivers/mfd/sec-core.h
> @@ -18,6 +18,6 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
>  		   struct regmap *regmap, struct i2c_client *client);
>  void sec_pmic_shutdown(struct device *dev);
>  
> -int sec_irq_init(struct sec_pmic_dev *sec_pmic);
> +struct regmap_irq_chip_data *sec_irq_init(struct sec_pmic_dev *sec_pmic);
>  
>  #endif /* __SEC_CORE_INT_H */
> diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> index d992e41e716dcdc060421e1db8475523842a12be..96f53c3617da4cb54f650f9b98c0b934b823ceda 100644
> --- a/drivers/mfd/sec-irq.c
> +++ b/drivers/mfd/sec-irq.c
> @@ -268,26 +268,28 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
>  	.ack_base = S5M8767_REG_INT1,
>  };
>  
> -static int s2mpg1x_add_chained_irq_chip(struct device *dev, struct regmap *regmap, int pirq,
> -					struct regmap_irq_chip_data *parent,
> -					const struct regmap_irq_chip *chip,
> -					struct regmap_irq_chip_data **data)
> +static struct regmap_irq_chip_data *
> +s2mpg1x_add_chained_irq_chip(struct device *dev, struct regmap *regmap, int pirq,
> +			     struct regmap_irq_chip_data *parent,
> +			     const struct regmap_irq_chip *chip)
>  {
> +	struct regmap_irq_chip_data *data;
>  	int irq, ret;
>  
>  	irq = regmap_irq_get_virq(parent, pirq);
>  	if (irq < 0)
> -		return dev_err_probe(dev, irq, "Failed to get parent vIRQ(%d) for chip %s\n", pirq,
> -				     chip->name);
> +		return dev_err_ptr_probe(dev, irq, "Failed to get parent vIRQ(%d) for chip %s\n",
> +					 pirq, chip->name);
>  
> -	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT | IRQF_SHARED, 0, chip, data);
> +	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT | IRQF_SHARED, 0, chip,
> +				       &data);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to add %s IRQ chip\n", chip->name);
> +		return dev_err_ptr_probe(dev, ret, "Failed to add %s IRQ chip\n", chip->name);
>  
> -	return 0;
> +	return data;
>  }
>  
> -static int sec_irq_init_s2mpg1x(struct sec_pmic_dev *sec_pmic)
> +static struct regmap_irq_chip_data *sec_irq_init_s2mpg1x(struct sec_pmic_dev *sec_pmic)
>  {
>  	const struct regmap_irq_chip *irq_chip, *chained_irq_chip;
>  	struct regmap_irq_chip_data *irq_data;
> @@ -302,27 +304,28 @@ static int sec_irq_init_s2mpg1x(struct sec_pmic_dev *sec_pmic)
>  		chained_pirq = S2MPG10_COMMON_IRQ_PMIC;
>  		break;
>  	default:
> -		return dev_err_probe(sec_pmic->dev, -EINVAL, "Unsupported device type %d\n",
> -				     sec_pmic->device_type);
> +		return dev_err_ptr_probe(sec_pmic->dev, -EINVAL, "Unsupported device type %d\n",
> +					 sec_pmic->device_type);
>  	};
>  
>  	regmap_common = dev_get_regmap(sec_pmic->dev, "common");
>  	if (!regmap_common)
> -		return dev_err_probe(sec_pmic->dev, -EINVAL, "No 'common' regmap %d\n",
> -				     sec_pmic->device_type);
> +		return dev_err_ptr_probe(sec_pmic->dev, -EINVAL, "No 'common' regmap %d\n",
> +					 sec_pmic->device_type);
>  
>  	ret = devm_regmap_add_irq_chip(sec_pmic->dev, regmap_common, sec_pmic->irq, IRQF_ONESHOT, 0,
>  				       irq_chip, &irq_data);
>  	if (ret)
> -		return dev_err_probe(sec_pmic->dev, ret, "Failed to add %s IRQ chip\n",
> -				     irq_chip->name);
> +		return dev_err_ptr_probe(sec_pmic->dev, ret, "Failed to add %s IRQ chip\n",
> +					 irq_chip->name);
>  
>  	return s2mpg1x_add_chained_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic, chained_pirq,
> -					    irq_data, chained_irq_chip, &sec_pmic->irq_data);
> +					    irq_data, chained_irq_chip);

That's a shame.

By keeping irq_data, you could have cleaned-up a bunch of these ugly
calls by simply passing around sec_pmic or better yet dev (then extract
sec_pmic from there).

Thus:

    return s2mpg1x_add_chained_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic, chained_pirq,
                                        irq_data, chained_irq_chip, &sec_pmic->irq_data);
                                        irq_data, chained_irq_chip);

Becomes:

    return s2mpg1x_add_chained_irq_chip(dev, chained_pirq, irq_data, chained_irq_chip);

>  }
>  
> -int sec_irq_init(struct sec_pmic_dev *sec_pmic)
> +struct regmap_irq_chip_data *sec_irq_init(struct sec_pmic_dev *sec_pmic)
>  {
> +	struct regmap_irq_chip_data *sec_irq_chip_data;
>  	const struct regmap_irq_chip *sec_irq_chip;
>  	int ret;
>  
> @@ -331,7 +334,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
>  		sec_irq_chip = &s5m8767_irq_chip;
>  		break;
>  	case S2DOS05:
> -		return 0;
> +		return NULL;
>  	case S2MPA01:
>  		sec_irq_chip = &s2mps14_irq_chip;
>  		break;
> @@ -356,30 +359,22 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
>  		sec_irq_chip = &s2mpu05_irq_chip;
>  		break;
>  	default:
> -		return dev_err_probe(sec_pmic->dev, -EINVAL,
> -				     "Unsupported device type %d\n",
> -				     sec_pmic->device_type);
> +		return dev_err_ptr_probe(sec_pmic->dev, -EINVAL, "Unsupported device type %d\n",
> +					 sec_pmic->device_type);
>  	}
>  
>  	if (!sec_pmic->irq) {
>  		dev_warn(sec_pmic->dev,
>  			 "No interrupt specified, no interrupts\n");
> -		return 0;
> +		return NULL;
>  	}
>  
>  	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
>  				       sec_pmic->irq, IRQF_ONESHOT,
> -				       0, sec_irq_chip, &sec_pmic->irq_data);
> +				       0, sec_irq_chip, &sec_irq_chip_data);
>  	if (ret)
> -		return dev_err_probe(sec_pmic->dev, ret,
> -				     "Failed to add %s IRQ chip\n",
> -				     sec_irq_chip->name);
> +		return dev_err_ptr_probe(sec_pmic->dev, ret, "Failed to add %s IRQ chip\n",
> +					 sec_irq_chip->name);
>  
> -	/*
> -	 * The rtc-s5m driver requests S2MPS14_IRQ_RTCA0 also for S2MPS11
> -	 * so the interrupt number must be consistent.
> -	 */
> -	BUILD_BUG_ON(((enum s2mps14_irq)S2MPS11_IRQ_RTCA0) != S2MPS14_IRQ_RTCA0);
> -
> -	return 0;
> +	return sec_irq_chip_data;
>  }
> diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
> index d785e101fe795a5d8f9cccf4ccc4232437e89416..c7c3c8cd8d5f99ef0cc3188e1c3b49031f4750f2 100644
> --- a/include/linux/mfd/samsung/core.h
> +++ b/include/linux/mfd/samsung/core.h
> @@ -69,7 +69,6 @@ struct sec_pmic_dev {
>  
>  	int device_type;
>  	int irq;
> -	struct regmap_irq_chip_data *irq_data;
>  };
>  
>  struct sec_platform_data {
> 
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

-- 
Lee Jones [李琼斯]

