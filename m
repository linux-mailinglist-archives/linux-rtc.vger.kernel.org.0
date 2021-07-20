Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12FF3D0276
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jul 2021 22:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233467AbhGTTVM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Jul 2021 15:21:12 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:37877 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbhGTTVC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 20 Jul 2021 15:21:02 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D0275240007;
        Tue, 20 Jul 2021 20:01:37 +0000 (UTC)
Date:   Tue, 20 Jul 2021 22:01:37 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Romain Perier <romain.perier@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] rtc: Add support for the MSTAR MSC313 RTC
Message-ID: <YPcroRmHYEV9BWaJ@piout.net>
References: <20210720172251.4504-1-romain.perier@gmail.com>
 <20210720172251.4504-3-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720172251.4504-3-romain.perier@gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Romain,

On 20/07/2021 19:22:50+0200, Romain Perier wrote:
> From: Daniel Palmer <daniel@0x0f.com>
> 
> This adds support for the RTC block on the Mstar MSC313e SoCs and newer.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> Co-developed-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> ---
>  MAINTAINERS              |   1 +
>  drivers/rtc/Kconfig      |  10 ++
>  drivers/rtc/Makefile     |   1 +
>  drivers/rtc/rtc-msc313.c | 246 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 258 insertions(+)
>  create mode 100644 drivers/rtc/rtc-msc313.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6c8be735cc91..7e8d1a375e0d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2220,6 +2220,7 @@ F:	arch/arm/boot/dts/mstar-*
>  F:	arch/arm/mach-mstar/
>  F:	drivers/clk/mstar/
>  F:	drivers/gpio/gpio-msc313.c
> +F:	drivers/rtc/rtc-msc313.c
>  F:	drivers/watchdog/msc313e_wdt.c
>  F:	include/dt-bindings/clock/mstar-*
>  F:	include/dt-bindings/gpio/msc313-gpio.h
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 12153d5801ce..67870b422bc5 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1925,4 +1925,14 @@ config RTC_DRV_WILCO_EC
>  	  This can also be built as a module. If so, the module will
>  	  be named "rtc_wilco_ec".
>  
> +config RTC_DRV_MSC313
> +	tristate "MStar MSC313 RTC"
> +        depends on ARCH_MSTARV7

|| COMPILE_TEST maybe ?

> +	help
> +	  If you say yes here you get support for the Mstar MSC313e On-Chip
> +	  Real Time Clock.
> +
> +	  This driver can also be built as a module, if so, the module
> +	  will be called "rtc-msc313".
> +
>  endif # RTC_CLASS


> +static int msc313_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct msc313_rtc *priv = dev_get_drvdata(dev);
> +	u32 seconds;
> +	u16 reg;
> +
> +	reg = readw(priv->rtc_base + REG_RTC_CTRL);
> +	writew(reg | READ_EN_BIT, priv->rtc_base + REG_RTC_CTRL);
> +
> +	/* Wait for HW latch done */
> +	while (readw(priv->rtc_base + REG_RTC_CTRL) & READ_EN_BIT)
> +		udelay(1);
> +
> +	seconds = readw(priv->rtc_base + REG_RTC_CNT_VAL_L)
> +			| (readw(priv->rtc_base + REG_RTC_CNT_VAL_H) << 16);
> +
> +	rtc_time64_to_tm(seconds, tm);
> +
> +	return rtc_valid_tm(tm);

This is not necessary, tm is valid at that point (and the core will
check anyway).

> +}
> +
> +static int msc313_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct msc313_rtc *priv = dev_get_drvdata(dev);
> +	unsigned long seconds;
> +	u16 reg;
> +
> +	seconds = rtc_tm_to_time64(tm);
> +	writew(seconds & 0xFFFF, priv->rtc_base + REG_RTC_LOAD_VAL_L);
> +	writew((seconds >> 16) & 0xFFFF, priv->rtc_base + REG_RTC_LOAD_VAL_H);
> +	reg = readw(priv->rtc_base + REG_RTC_CTRL);
> +	writew(reg | LOAD_EN_BIT, priv->rtc_base + REG_RTC_CTRL);
> +
> +	/* need to check carefully if we want to clear REG_RTC_LOAD_VAL_H for customer*/
> +	while (readw(priv->rtc_base + REG_RTC_CTRL) & LOAD_EN_BIT)
> +		udelay(1);
> +	writew(0, priv->rtc_base + REG_RTC_LOAD_VAL_H);

Why is that necessary? The comment is not super useful here.

> +
> +	return 0;
> +}
> +
> +static const struct rtc_class_ops msc313_rtc_ops = {
> +	.read_time = msc313_rtc_read_time,
> +	.set_time = msc313_rtc_set_time,
> +	.read_alarm = msc313_rtc_read_alarm,
> +	.set_alarm = msc313_rtc_set_alarm,
> +	.alarm_irq_enable = msc313_rtc_alarm_irq_enable,
> +};
> +
> +static irqreturn_t msc313_rtc_interrupt(s32 irq, void *dev_id)
> +{
> +	struct msc313_rtc *priv = dev_get_drvdata(dev_id);
> +	u16 reg;
> +
> +	reg = readw_relaxed(priv->rtc_base + REG_RTC_CTRL);
> +	reg |= INT_CLEAR_BIT;
> +	reg &= ~INT_FORCE_BIT;
> +	writew_relaxed(reg, priv->rtc_base + REG_RTC_CTRL);
> +

I'm not convinced the _relaxed functions are doing the right thing here.
Also, shouldn't you check the alarm actually fired?

> +	rtc_update_irq(priv->rtc_dev, 1, RTC_IRQF | RTC_AF);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int msc313_rtc_remove(struct platform_device *pdev)
> +{
> +	struct msc313_rtc *priv = platform_get_drvdata(pdev);
> +
> +	clk_disable_unprepare(priv->clk);

With a nice devm_add_action_or_reset() in the probe, you can remove the
need for msc313_rtc_remove().

> +
> +	return 0;
> +}
> +
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
> +	ret = devm_request_irq(dev, irq, msc313_rtc_interrupt, IRQF_SHARED,
> +			       dev_name(&pdev->dev), &pdev->dev);
> +	if (ret) {
> +		dev_err(dev, "Unable to request irq\n");
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
> +	rate = clk_get_rate(priv->clk);
> +
> +	reg = readw(priv->rtc_base + REG_RTC_CTRL);
> +	if (!(reg & SOFT_RSTZ_BIT)) {
> +		reg |= SOFT_RSTZ_BIT;
> +		writew(reg, priv->rtc_base + REG_RTC_CTRL);
> +	}

What is the meaning of this bit? I would think it is better to use that
to know whether the RTC holds the correct time instead of killing the
info here.

> +
> +	writew(rate & 0xFFFF, priv->rtc_base + REG_RTC_FREQ_CW_L);
> +	writew((rate >> 16) & 0xFFFF, priv->rtc_base + REG_RTC_FREQ_CW_H);
> +
> +	reg |= CNT_EN_BIT;
> +	writew(reg, priv->rtc_base + REG_RTC_CTRL);
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->rtc_dev = devm_rtc_device_register(dev, dev_name(dev), &msc313_rtc_ops, THIS_MODULE);
> +	if (IS_ERR(priv->rtc_dev)) {
> +		dev_err(dev, "Failed to register rtc device\n");
> +		return PTR_ERR(priv->rtc_dev);
> +	}

Please switch to devm_rtc_allocate_device and devm_rtc_register_device.
Also drop the error message, it is not necessary.

You must also set the RTC range. To help you, you can use:
https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git/tree/rtc-range.c
then you must update the DT bindings as the RTC will support the
start-year property

You must also run rtctest and should include the results.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
