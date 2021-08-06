Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 240803E2FCA
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Aug 2021 21:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhHFTiW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Aug 2021 15:38:22 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:41229 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbhHFTiW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Aug 2021 15:38:22 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9F8D4240006;
        Fri,  6 Aug 2021 19:38:03 +0000 (UTC)
Date:   Fri, 6 Aug 2021 21:38:03 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Romain Perier <romain.perier@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] rtc: Add support for the MSTAR MSC313 RTC
Message-ID: <YQ2Pm7nrEFmdS6Ky@piout.net>
References: <20210801160921.233081-1-romain.perier@gmail.com>
 <20210801160921.233081-3-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210801160921.233081-3-romain.perier@gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 01/08/2021 18:09:20+0200, Romain Perier wrote:
> +static int msc313_rtc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct msc313_rtc *priv;
> +	int ret;
> +	int irq;
> +	unsigned long rate;
> +	u16 reg;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(struct msc313_rtc), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->rtc_base))
> +		return PTR_ERR(priv->rtc_base);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return -EINVAL;
> +
> +	priv->rtc_dev = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(priv->rtc_dev))
> +		return PTR_ERR(priv->rtc_dev);
> +
> +	priv->rtc_dev->ops = &msc313_rtc_ops;
> +	priv->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_0000;

I'm pretty sure this doesn't fit in this RTC registers, you should
probably leave range_min to 0 (i.e. not set it at all).

> +	priv->rtc_dev->range_max = U32_MAX - 1; /* 2106-02-07 06:28:14 */

I guess this one should be U32_MAX
> +
> +	ret = devm_request_irq(dev, irq, msc313_rtc_interrupt, IRQF_SHARED,
> +			       dev_name(&pdev->dev), &pdev->dev);
> +	if (ret) {
> +		dev_err(dev, "Could not request IRQ\n");
> +		return ret;
> +	}
> +
> +	priv->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk)) {
> +		dev_err(dev, "No input reference clock\n");
> +		return PTR_ERR(priv->clk);
> +	}
> +
> +	ret = clk_prepare_enable(priv->clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable the reference clock, %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare, priv->clk);
> +	if (ret)
> +		return ret;
> +
> +	rate = clk_get_rate(priv->clk);
> +	writew(rate & 0xFFFF, priv->rtc_base + REG_RTC_FREQ_CW_L);
> +	writew((rate >> 16) & 0xFFFF, priv->rtc_base + REG_RTC_FREQ_CW_H);
> +
> +	reg = readw(priv->rtc_base + REG_RTC_CTRL);
> +	reg |= CNT_EN_BIT;
> +	writew(reg, priv->rtc_base + REG_RTC_CTRL);
> +

If on POR, CNT_EN_BIT is not set, then it would be nice to use that to
know whether the RTC is properly set. You can then check CNT_EN_BIT in
.read_time and return -EINVAL if it is not set. Then you can set the bit
in .set_time. It is anyway useless to let the RTC running if it is not
set.

> +	platform_set_drvdata(pdev, priv);
> +
> +	return devm_rtc_register_device(priv->rtc_dev);
> +}
> +
> +static const struct of_device_id msc313_rtc_of_match_table[] = {
> +	{ .compatible = "mstar,msc313-rtc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ms_rtc_of_match_table);
> +
> +static struct platform_driver msc313_rtc_driver = {
> +	.probe = msc313_rtc_probe,
> +	.driver = {
> +		.name = "msc313-rtc",
> +		.of_match_table = msc313_rtc_of_match_table,
> +	},
> +};
> +
> +module_platform_driver(msc313_rtc_driver);
> +
> +MODULE_AUTHOR("Daniel Palmer <daniel@thingy.jp>");
> +MODULE_AUTHOR("Romain Perier <romain.perier@gmail.com>");
> +MODULE_DESCRIPTION("MStar RTC Driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.30.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
