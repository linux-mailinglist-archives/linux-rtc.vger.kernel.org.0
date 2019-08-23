Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDFC9B320
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 17:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395546AbfHWPM0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Aug 2019 11:12:26 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39164 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbfHWPMZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 23 Aug 2019 11:12:25 -0400
Received: by mail-ed1-f68.google.com with SMTP id g8so13935206edm.6;
        Fri, 23 Aug 2019 08:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JoGdLrC3EvZUqi2gbY94UkjQTiA3x5eqpgLZ2Pse0sI=;
        b=IQm6d4iLkYzHr+O6p+z3NdWwgH56Ey0SNSwgc4Ew8Z51xVmz49yJ27EqgckIJTWvDF
         TmUmpKCa/2eGrr1koNrGSxlELm1YW45Z5gJ69Baud00M2z8o3+IKRWTQI/u6+w+dRBLK
         KpNQMJdrv1UY9K3EQvmoiX9YAEdR1JA6C8xUYAfGS3WQ6o37ph668ILOK2uX71AdIFr/
         1qbz5Cv2Q1ZnMNxC4NXOuaB8CzunGx/ufSFYAWGQgRzXlTRttRobi1begjO6GeanA4V8
         /K9Jmwf1jd4p3bY55rp32rjbsGn77musQRsE7PEcaB1az/SKAdkck9KtkFNDNeybk+nm
         QRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=JoGdLrC3EvZUqi2gbY94UkjQTiA3x5eqpgLZ2Pse0sI=;
        b=YgdScIwfZ/rclBQlxcw2IugjBO28OSBonuqYqs3dOQZdVRAQsb3vOpwsEjNayul8cy
         VzpFgZrG3ab9RCZ6zNt5wRkwFzBEjJbMtYTFn4EhunLD5MvWsKbWDdCIDl5V2Fj+TfqA
         ge2oqtnLswrHweG28SvIeVXRJWxfD1kvQvVtsMuijL1RbB5UCC7UzLm7Tg7QhaX7shEy
         Z8dNRC9dBA/3AHuX6Eqy2BRLonZiaKH+OhQ4roSKBsaZYEMZCzmonQhjnBOrhyJ/+RUU
         4jzE3kqRO4rwoS4xjbN8yc76J+cgNkFGDIKXSrl3e2mQO5AMpGZ2iKGlxG3TAwn9ufb4
         eFYQ==
X-Gm-Message-State: APjAAAV7dAksYa4LqYjjNbw+r6O6zV3fZghJI6GuDJNfY8/Ih4YNWkku
        G+zQ5mSJYaGFQJP3woLTioQ=
X-Google-Smtp-Source: APXvYqwLArA9O8RyF4HUnW7Ze7YcFpvlS3J54RiXdyPWMI0f9TNdWQgR4sYWYrfGOIzssBcCYs8tOg==
X-Received: by 2002:a17:906:11d6:: with SMTP id o22mr4875515eja.60.1566573141505;
        Fri, 23 Aug 2019 08:12:21 -0700 (PDT)
Received: from ziggy.stardust ([37.223.137.147])
        by smtp.gmail.com with ESMTPSA id h10sm587257edh.64.2019.08.23.08.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2019 08:12:20 -0700 (PDT)
Subject: Re: [PATCH v5 03/10] mfd: mt6397: modify suspend/resume behavior
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1566531931-9772-4-git-send-email-hsin-hsiung.wang@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
 jrHWeQEI2ucSKsNa8FllDmG/fQ==
Message-ID: <53bed53c-13a5-b745-25a0-0c8720f64441@gmail.com>
Date:   Fri, 23 Aug 2019 17:12:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566531931-9772-4-git-send-email-hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On 23/08/2019 05:45, Hsin-Hsiung Wang wrote:
> Some pmics don't need backup interrupt settings, so we change to use
> pm notifier for the pmics which are necessary to store settings.
> 
> Acked-for-mfd-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/mfd/mt6397-core.c       | 89 +++++++++++++++++------------------------
>  drivers/mfd/mt6397-irq.c        | 33 +++++++++++++++
>  include/linux/mfd/mt6397/core.h |  3 ++
>  3 files changed, 73 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 93c8881..8f94187 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -4,7 +4,6 @@
>   * Author: Flora Fu, MediaTek
>   */
>  
> -#include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
> @@ -82,40 +81,27 @@
>  	}
>  };
>  
> -#ifdef CONFIG_PM_SLEEP
> -static int mt6397_irq_suspend(struct device *dev)
> -{
> -	struct mt6397_chip *chip = dev_get_drvdata(dev);
> -
> -	regmap_write(chip->regmap, chip->int_con[0], chip->wake_mask[0]);
> -	regmap_write(chip->regmap, chip->int_con[1], chip->wake_mask[1]);
> -
> -	enable_irq_wake(chip->irq);
> -
> -	return 0;
> -}
> -
> -static int mt6397_irq_resume(struct device *dev)
> -{
> -	struct mt6397_chip *chip = dev_get_drvdata(dev);
> -
> -	regmap_write(chip->regmap, chip->int_con[0], chip->irq_masks_cur[0]);
> -	regmap_write(chip->regmap, chip->int_con[1], chip->irq_masks_cur[1]);
> -
> -	disable_irq_wake(chip->irq);
> +struct chip_data {
> +	u32 cid_addr;
> +	u32 cid_shift;
> +};
>  
> -	return 0;
> -}
> -#endif
> +static const struct chip_data mt6323_core = {
> +	.cid_addr = MT6323_CID,
> +	.cid_shift = 0,
> +};
>  
> -static SIMPLE_DEV_PM_OPS(mt6397_pm_ops, mt6397_irq_suspend,
> -			mt6397_irq_resume);
> +static const struct chip_data mt6397_core = {
> +	.cid_addr = MT6397_CID,
> +	.cid_shift = 0,
> +};
>  
>  static int mt6397_probe(struct platform_device *pdev)
>  {
>  	int ret;
>  	unsigned int id;
>  	struct mt6397_chip *pmic;
> +	const struct chip_data *pmic_core;
>  
>  	pmic = devm_kzalloc(&pdev->dev, sizeof(*pmic), GFP_KERNEL);
>  	if (!pmic)
> @@ -131,28 +117,30 @@ static int mt6397_probe(struct platform_device *pdev)
>  	if (!pmic->regmap)
>  		return -ENODEV;
>  
> -	platform_set_drvdata(pdev, pmic);
> +	pmic_core = of_device_get_match_data(&pdev->dev);
> +	if (!pmic_core)
> +		return -ENODEV;
>  
> -	ret = regmap_read(pmic->regmap, MT6397_CID, &id);
> +	ret = regmap_read(pmic->regmap, pmic_core->cid_addr, &id);
>  	if (ret) {
> -		dev_err(pmic->dev, "Failed to read chip id: %d\n", ret);
> +		dev_err(&pdev->dev, "Failed to read chip id: %d\n", ret);
>  		return ret;
>  	}
>  
> +	pmic->chip_id = (id >> pmic_core->cid_shift) & 0xff;
> +
> +	platform_set_drvdata(pdev, pmic);
> +

What do this changes have to do with the commit message/subject?

>  	pmic->irq = platform_get_irq(pdev, 0);
>  	if (pmic->irq <= 0)
>  		return pmic->irq;
>  
> -	switch (id & 0xff) {
> -	case MT6323_CHIP_ID:
> -		pmic->int_con[0] = MT6323_INT_CON0;
> -		pmic->int_con[1] = MT6323_INT_CON1;
> -		pmic->int_status[0] = MT6323_INT_STATUS0;
> -		pmic->int_status[1] = MT6323_INT_STATUS1;
> -		ret = mt6397_irq_init(pmic);
> -		if (ret)
> -			return ret;

This looks to me as if it should be part of 02/10.

> +	ret = mt6397_irq_init(pmic);
> +	if (ret)
> +		return ret;
>  
> +	switch (pmic->chip_id) {
> +	case MT6323_CHIP_ID:
>  		ret = devm_mfd_add_devices(&pdev->dev, -1, mt6323_devs,
>  					   ARRAY_SIZE(mt6323_devs), NULL,
>  					   0, pmic->irq_domain);
> @@ -160,21 +148,13 @@ static int mt6397_probe(struct platform_device *pdev)
>  
>  	case MT6391_CHIP_ID:
>  	case MT6397_CHIP_ID:
> -		pmic->int_con[0] = MT6397_INT_CON0;
> -		pmic->int_con[1] = MT6397_INT_CON1;
> -		pmic->int_status[0] = MT6397_INT_STATUS0;
> -		pmic->int_status[1] = MT6397_INT_STATUS1;
> -		ret = mt6397_irq_init(pmic);
> -		if (ret)
> -			return ret;
> -

Same here.

Regards,
Matthias

>  		ret = devm_mfd_add_devices(&pdev->dev, -1, mt6397_devs,
>  					   ARRAY_SIZE(mt6397_devs), NULL,
>  					   0, pmic->irq_domain);
>  		break;
>  
>  	default:
> -		dev_err(&pdev->dev, "unsupported chip: %d\n", id);
> +		dev_err(&pdev->dev, "unsupported chip: %d\n", pmic->chip_id);
>  		return -ENODEV;
>  	}
>  
> @@ -187,9 +167,15 @@ static int mt6397_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id mt6397_of_match[] = {
> -	{ .compatible = "mediatek,mt6397" },
> -	{ .compatible = "mediatek,mt6323" },
> -	{ }
> +	{
> +		.compatible = "mediatek,mt6323",
> +		.data = &mt6323_core,
> +	}, {
> +		.compatible = "mediatek,mt6397",
> +		.data = &mt6397_core,
> +	}, {
> +		/* sentinel */
> +	}
>  };
>  MODULE_DEVICE_TABLE(of, mt6397_of_match);
>  
> @@ -204,7 +190,6 @@ static int mt6397_probe(struct platform_device *pdev)
>  	.driver = {
>  		.name = "mt6397",
>  		.of_match_table = of_match_ptr(mt6397_of_match),
> -		.pm = &mt6397_pm_ops,
>  	},
>  	.id_table = mt6397_id,
>  };
> diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
> index b2d3ce1..669e93d 100644
> --- a/drivers/mfd/mt6397-irq.c
> +++ b/drivers/mfd/mt6397-irq.c
> @@ -9,6 +9,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/suspend.h>
>  #include <linux/mfd/mt6323/core.h>
>  #include <linux/mfd/mt6323/registers.h>
>  #include <linux/mfd/mt6397/core.h>
> @@ -128,6 +129,36 @@ static int mt6397_irq_domain_map(struct irq_domain *d, unsigned int irq,
>  	.map = mt6397_irq_domain_map,
>  };
>  
> +static int mt6397_irq_pm_notifier(struct notifier_block *notifier,
> +				  unsigned long pm_event, void *unused)
> +{
> +	struct mt6397_chip *chip =
> +		container_of(notifier, struct mt6397_chip, pm_nb);
> +
> +	switch (pm_event) {
> +	case PM_SUSPEND_PREPARE:
> +		regmap_write(chip->regmap,
> +			     chip->int_con[0], chip->wake_mask[0]);
> +		regmap_write(chip->regmap,
> +			     chip->int_con[1], chip->wake_mask[1]);
> +		enable_irq_wake(chip->irq);
> +		break;
> +
> +	case PM_POST_SUSPEND:
> +		regmap_write(chip->regmap,
> +			     chip->int_con[0], chip->irq_masks_cur[0]);
> +		regmap_write(chip->regmap,
> +			     chip->int_con[1], chip->irq_masks_cur[1]);
> +		disable_irq_wake(chip->irq);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
>  int mt6397_irq_init(struct mt6397_chip *chip)
>  {
>  	int ret;
> @@ -159,6 +190,7 @@ int mt6397_irq_init(struct mt6397_chip *chip)
>  	regmap_write(chip->regmap, chip->int_con[0], 0x0);
>  	regmap_write(chip->regmap, chip->int_con[1], 0x0);
>  
> +	chip->pm_nb.notifier_call = mt6397_irq_pm_notifier;
>  	chip->irq_domain = irq_domain_add_linear(chip->dev->of_node,
>  						 MT6397_IRQ_NR,
>  						 &mt6397_irq_domain_ops,
> @@ -177,5 +209,6 @@ int mt6397_irq_init(struct mt6397_chip *chip)
>  		return ret;
>  	}
>  
> +	register_pm_notifier(&chip->pm_nb);
>  	return 0;
>  }
> diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
> index 9320c2a..23e21da 100644
> --- a/include/linux/mfd/mt6397/core.h
> +++ b/include/linux/mfd/mt6397/core.h
> @@ -7,6 +7,8 @@
>  #ifndef __MFD_MT6397_CORE_H__
>  #define __MFD_MT6397_CORE_H__
>  
> +#include <linux/notifier.h>
> +
>  enum chip_id {
>  	MT6323_CHIP_ID = 0x23,
>  	MT6391_CHIP_ID = 0x91,
> @@ -52,6 +54,7 @@ enum mt6397_irq_numbers {
>  struct mt6397_chip {
>  	struct device *dev;
>  	struct regmap *regmap;
> +	struct notifier_block pm_nb;
>  	int irq;
>  	struct irq_domain *irq_domain;
>  	struct mutex irqlock;
> 
