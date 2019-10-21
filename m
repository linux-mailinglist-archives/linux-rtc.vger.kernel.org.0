Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA57DE762
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 11:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbfJUJHO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 05:07:14 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:55467 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfJUJHO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Oct 2019 05:07:14 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5AA8B60009;
        Mon, 21 Oct 2019 09:07:10 +0000 (UTC)
Date:   Mon, 21 Oct 2019 11:07:10 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     lee.jones@linaro.org, a.zummo@towertech.it,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        phh@phh.me, b.galvani@gmail.com, stefan@agner.ch,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH 2/5] mfd: rn5t618: add irq support
Message-ID: <20191021090710.GT3125@piout.net>
References: <20191021054104.26155-1-andreas@kemnade.info>
 <20191021054104.26155-3-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021054104.26155-3-andreas@kemnade.info>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 21/10/2019 07:41:01+0200, Andreas Kemnade wrote:
> +#if 0
> +/*
> + * REVISIT when implementing charger:
> + * according to some other implementation it needs special treatment,
> + * inverted but experiments seem not to confirm that.
> + */
> +	[RN5T618_IRQ_CHG] = {
> +		.reg_offset = 0,
> +		.mask = (1 << 6),
> +	}
> +#endif

Please avoid submitting dead code.

> +};
> +
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
> +
> +	default:
> +		irq_chip = NULL;
> +		break;
> +	}
> +
> +	if (!irq_chip) {
> +		dev_err(rn5t618->dev, "no IRQ definition known for variant\n");
> +		return -ENOENT;
> +	}
> +
> +	ret = devm_regmap_add_irq_chip(rn5t618->dev, rn5t618->regmap,
> +				rn5t618->chip_irq,
> +				IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +				0, irq_chip, &rn5t618->irq_data);
> +	if (ret != 0) {
> +		dev_err(rn5t618->dev, "Failed to register IRQ chip\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> diff --git a/include/linux/mfd/rn5t618.h b/include/linux/mfd/rn5t618.h
> index d62ef48060b5..4d680f34ad2f 100644
> --- a/include/linux/mfd/rn5t618.h
> +++ b/include/linux/mfd/rn5t618.h
> @@ -242,9 +242,27 @@ enum {
>  	RC5T619,
>  };
>  
> +
> +/* RN5T618 IRQ definitions */
> +enum {
> +	RN5T618_IRQ_SYS,
> +	RN5T618_IRQ_DCDC,
> +	RN5T618_IRQ_RTC,
> +	RN5T618_IRQ_ADC,
> +	RN5T618_IRQ_GPIO,
> +	RN5T618_IRQ_CHG,
> +	RN5T618_NR_IRQS,
> +};
> +
> +

Spurious blank line.

>  struct rn5t618 {
>  	struct regmap *regmap;
> +	struct device *dev;
>  	long variant;
> +
> +	int chip_irq;
> +	struct regmap_irq_chip_data *irq_data;
>  };
>  
> +extern int rn5t618_irq_init(struct rn5t618 *rn5t618);
>  #endif /* __LINUX_MFD_RN5T618_H */
> -- 
> 2.11.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
