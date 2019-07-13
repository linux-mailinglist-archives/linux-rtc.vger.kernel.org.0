Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07CEF67C13
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Jul 2019 23:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727968AbfGMVZK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 13 Jul 2019 17:25:10 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:57693 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727961AbfGMVZK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 13 Jul 2019 17:25:10 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A6A021C0004;
        Sat, 13 Jul 2019 21:25:04 +0000 (UTC)
Date:   Sat, 13 Jul 2019 23:25:04 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     a.zummo@towertech.it, leoyang.li@nxp.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiaobo.xie@nxp.com, jiafei.pan@nxp.com, ran.wang_1@nxp.com,
        robh+dt@kernel.org
Subject: Re: [v3,1/2] rtc/fsl: add FTM alarm driver as the wakeup source
Message-ID: <20190713212504.GE4732@piout.net>
References: <20190711143748.10808-1-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711143748.10808-1-biwen.li@nxp.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 11/07/2019 22:37:48+0800, Biwen Li wrote:
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 9d997fa..5cccb07 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -79,6 +79,7 @@ obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) += rtc-hid-sensor-time.o
>  obj-$(CONFIG_RTC_DRV_HYM8563)	+= rtc-hym8563.o
>  obj-$(CONFIG_RTC_DRV_IMXDI)	+= rtc-imxdi.o
>  obj-$(CONFIG_RTC_DRV_IMX_SC)	+= rtc-imx-sc.o
> +obj-$(CONFIG_RTC_DRV_FSL_FTM_ALARM)	+= rtc-fsl-ftm-alarm.o

This file is sorted alphabetically.

>  obj-$(CONFIG_RTC_DRV_ISL12022)	+= rtc-isl12022.o
>  obj-$(CONFIG_RTC_DRV_ISL12026)	+= rtc-isl12026.o
>  obj-$(CONFIG_RTC_DRV_ISL1208)	+= rtc-isl1208.o
> diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
> new file mode 100644
> index 0000000..4fd0d6b
> --- /dev/null
> +++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
> @@ -0,0 +1,347 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Freescale FlexTimer Module (FTM) alarm device driver.
> + *
> + * Copyright 2014 Freescale Semiconductor, Inc.
> + * Copyright 2019 NXP
> + *
> + */
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/module.h>
> +#include <linux/fsl/ftm.h>
> +#include <linux/rtc.h>
> +#include <linux/time.h>
> +
> +#define FTM_SC_CLK(c)		((c) << FTM_SC_CLK_MASK_SHIFT)
> +
> +/*
> + * Select Fixed frequency clock (32KHz) as clock source
> + * of FlexTimer Module
> + */
> +#define FTM_SC_CLKS_FIXED_FREQ	0x02
> +#define FIXED_FREQ_CLK		32000
> +
> +/* Select 128 (2^7) as divider factor */
> +#define MAX_FREQ_DIV		(1 << FTM_SC_PS_MASK)
> +
> +/* Maximum counter value in FlexTimer's CNT registers */
> +#define MAX_COUNT_VAL		0xffff
> +
> +struct ftm_rtc {
> +	struct rtc_device *rtc_dev;
> +	void __iomem *base;
> +	bool big_endian;
> +	u32 alarm_freq;
> +};
> +
> +static inline u32 rtc_readl(struct ftm_rtc *dev, u32 reg)
> +{
> +	if (dev->big_endian)
> +		return ioread32be(dev->base + reg);
> +	else
> +		return ioread32(dev->base + reg);
> +}
> +
> +static inline void rtc_writel(struct ftm_rtc *dev, u32 reg, u32 val)
> +{
> +	if (dev->big_endian)
> +		iowrite32be(val, dev->base + reg);
> +	else
> +		iowrite32(val, dev->base + reg);
> +}
> +
> +static inline void ftm_counter_enable(struct ftm_rtc *rtc)
> +{
> +	u32 val;
> +
> +	/* select and enable counter clock source */
> +	val = rtc_readl(rtc, FTM_SC);
> +	val &= ~(FTM_SC_PS_MASK | FTM_SC_CLK_MASK);
> +	val |= (FTM_SC_PS_MASK | FTM_SC_CLK(FTM_SC_CLKS_FIXED_FREQ));
> +	rtc_writel(rtc, FTM_SC, val);
> +}
> +
> +static inline void ftm_counter_disable(struct ftm_rtc *rtc)
> +{
> +	u32 val;
> +
> +	/* disable counter clock source */
> +	val = rtc_readl(rtc, FTM_SC);
> +	val &= ~(FTM_SC_PS_MASK | FTM_SC_CLK_MASK);
> +	rtc_writel(rtc, FTM_SC, val);
> +}
> +
> +static inline void ftm_irq_acknowledge(struct ftm_rtc *rtc)
> +{
> +	unsigned int timeout = 100;
> +
> +	/*
> +	 *Fix errata A-007728 for flextimer
> +	 *	If the FTM counter reaches the FTM_MOD value between
> +	 *	the reading of the TOF bit and the writing of 0 to
> +	 *	the TOF bit, the process of clearing the TOF bit
> +	 *	does not work as expected when FTMx_CONF[NUMTOF] != 0
> +	 *	and the current TOF count is less than FTMx_CONF[NUMTOF].
> +	 *	If the above condition is met, the TOF bit remains set.
> +	 *	If the TOF interrupt is enabled (FTMx_SC[TOIE] = 1),the
> +	 *	TOF interrupt also remains asserted.
> +	 *
> +	 *	Above is the errata discription
> +	 *
> +	 *	In one word: software clearing TOF bit not works when
> +	 *	FTMx_CONF[NUMTOF] was seted as nonzero and FTM counter
> +	 *	reaches the FTM_MOD value.
> +	 *
> +	 *	The workaround is clearing TOF bit until it works
> +	 *	(FTM counter doesn't always reache the FTM_MOD anyway),
> +	 *	which may cost some cycles.
> +	 */
> +	while ((FTM_SC_TOF & rtc_readl(rtc, FTM_SC)) && timeout--)
> +		rtc_writel(rtc, FTM_SC, rtc_readl(rtc, FTM_SC) & (~FTM_SC_TOF));
> +}
> +
> +static inline void ftm_irq_enable(struct ftm_rtc *rtc)
> +{
> +	u32 val;
> +
> +	val = rtc_readl(rtc, FTM_SC);
> +	val |= FTM_SC_TOIE;
> +	rtc_writel(rtc, FTM_SC, val);
> +}
> +
> +static inline void ftm_irq_disable(struct ftm_rtc *rtc)
> +{
> +	u32 val;
> +
> +	val = rtc_readl(rtc, FTM_SC);
> +	val &= ~FTM_SC_TOIE;
> +	rtc_writel(rtc, FTM_SC, val);
> +}
> +
> +static inline void ftm_reset_counter(struct ftm_rtc *rtc)
> +{
> +	/*
> +	 * The CNT register contains the FTM counter value.
> +	 * Reset clears the CNT register. Writing any value to COUNT
> +	 * updates the counter with its initial value, CNTIN.
> +	 */
> +	rtc_writel(rtc, FTM_CNT, 0x00);
> +}
> +
> +static void ftm_clean_alarm(struct ftm_rtc *rtc)
> +{
> +	ftm_counter_disable(rtc);
> +
> +	rtc_writel(rtc, FTM_CNTIN, 0x00);
> +	rtc_writel(rtc, FTM_MOD, ~0U);
> +
> +	ftm_reset_counter(rtc);
> +}
> +
> +static irqreturn_t ftm_rtc_alarm_interrupt(int irq, void *dev)
> +{
> +	struct ftm_rtc *rtc = dev;
> +
> +	ftm_irq_acknowledge(rtc);
> +	ftm_irq_disable(rtc);
> +	ftm_clean_alarm(rtc);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int ftm_rtc_alarm_irq_enable(struct device *dev,
> +		unsigned int enabled)
> +{
> +	struct ftm_rtc *rtc = dev_get_drvdata(dev);
> +
> +	if (enabled)
> +		ftm_irq_enable(rtc);
> +	else
> +		ftm_irq_disable(rtc);
> +
> +	return 0;
> +}
> +
> +/*
> + * Note:
> + *	The function is not really getting time from the RTC
> + *	since FlexTimer is not a RTC device, but we need to
> + *	get time to setup alarm, so we are using system time
> + *	for now.
> + */
> +static int ftm_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct timespec64 ts64;
> +	unsigned long local_time;
> +
> +	ktime_get_real_ts64(&ts64);
> +	local_time = (unsigned long)(ts64.tv_sec - (sys_tz.tz_minuteswest * 60));

The RTC time is in UTC time, you should not care about the timezone
here.

> +
> +	rtc_time_to_tm(local_time, tm);
> +
> +	return 0;
> +}
> +
> +static int ftm_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
> +{
> +	return 0;
> +}
> +
> +/*
> + * 1. Select fixed frequency clock (32KHz) as clock source;
> + * 2. Select 128 (2^7) as divider factor;
> + * So clock is 250 Hz (32KHz/128).
> + *
> + * 3. FlexTimer's CNT register is a 32bit register,
> + * but the register's 16 bit as counter value,it's other 16 bit
> + * is reserved.So minimum counter value is 0x0,maximum counter
> + * value is 0xffff.
> + * So max alarm value is 262 (65536 / 250) seconds
> + */
> +static int ftm_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
> +{
> +	struct rtc_time tm;
> +	unsigned long now, alm_time, cycle;
> +	struct ftm_rtc *rtc = dev_get_drvdata(dev);
> +
> +	ftm_rtc_read_time(dev, &tm);
> +	rtc_tm_to_time(&tm, &now);
> +	rtc_tm_to_time(&alm->time, &alm_time);
> +
> +	ftm_clean_alarm(rtc);
> +	cycle = (alm_time - now) * rtc->alarm_freq;
> +	if (cycle > MAX_COUNT_VAL) {
> +		pr_err("Out of alarm range {0~262} seconds.\n");
> +		return -EINVAL;

Use -ERANGE here.

> +	}
> +
> +	ftm_irq_disable(rtc);
> +
> +	/*
> +	 * The counter increments until the value of MOD is reached,
> +	 * at which point the counter is reloaded with the value of CNTIN.
> +	 * The TOF (the overflow flag) bit is set when the FTM counter
> +	 * changes from MOD to CNTIN. So we should using the cycle - 1.
> +	 */
> +	rtc_writel(rtc, FTM_MOD, cycle - 1);
> +
> +	ftm_counter_enable(rtc);
> +	ftm_irq_enable(rtc);
> +
> +	return 0;
> +
> +}
> +
> +static const struct rtc_class_ops ftm_rtc_ops = {
> +	.read_time		= ftm_rtc_read_time,
> +	.read_alarm		= ftm_rtc_read_alarm,
> +	.set_alarm		= ftm_rtc_set_alarm,
> +	.alarm_irq_enable	= ftm_rtc_alarm_irq_enable,
> +};
> +
> +static int ftm_rtc_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct resource *r;
> +	int irq;
> +	int ret;
> +	struct ftm_rtc *rtc;
> +
> +	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> +	if (unlikely(!rtc)) {
> +		pr_err("ftm: cannot alloc memery for rtc\n");
> +		return -ENOMEM;
> +	}
> +
> +	platform_set_drvdata(pdev, rtc);
> +
> +	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!r) {
> +		pr_err("ftm: cannot get resource for rtc\n");
> +		return -ENODEV;
> +	}
> +
> +	rtc->base = devm_ioremap_resource(&pdev->dev, r);
> +	if (IS_ERR(rtc->base)) {
> +		pr_err("ftm: cannot ioremap resource for rtc\n");
> +		return PTR_ERR(rtc->base);
> +	}
> +
> +	irq = irq_of_parse_and_map(np, 0);
> +	if (irq <= 0) {
> +		pr_err("ftm: unable to get IRQ from DT, %d\n", irq);
> +		return -EINVAL;
> +	}
> +
> +	rtc->big_endian = of_property_read_bool(np, "big-endian");
> +
> +	ret = devm_request_irq(&pdev->dev, irq, ftm_rtc_alarm_interrupt,
> +			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), rtc);

There is a possible race condition here. As soon as devm_request_irq is
called, the interrupt handler may be called leading to a null pointer
dereference because rtc->rtc_dev is not yet allocated. Please use
devm_rtc_allocate_device and rtc_register_device to solve that.

> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to request irq\n");
> +		return ret;
> +	}
> +
> +	rtc->alarm_freq = (u32)FIXED_FREQ_CLK / (u32)MAX_FREQ_DIV;
> +
> +	ftm_clean_alarm(rtc);
> +

Do you really need to remove the alarm here?

> +	device_init_wakeup(&pdev->dev, true);
> +	rtc->rtc_dev = devm_rtc_device_register(&pdev->dev, "ftm-alarm",
> +							&ftm_rtc_ops,
> +							THIS_MODULE);
> +	if (IS_ERR(rtc->rtc_dev)) {
> +		dev_err(&pdev->dev, "can't register rtc device\n");
> +		return PTR_ERR(rtc->rtc_dev);
> +	}
> +	return ret;
> +}
> +
> +static const struct of_device_id ftm_rtc_match[] = {
> +	{ .compatible = "fsl,ls1012a-ftm-alarm", },
> +	{ .compatible = "fsl,ls1021a-ftm-alarm", },
> +	{ .compatible = "fsl,ls1043a-ftm-alarm", },
> +	{ .compatible = "fsl,ls1046a-ftm-alarm", },
> +	{ .compatible = "fsl,ls1088a-ftm-alarm", },
> +	{ .compatible = "fsl,ls208xa-ftm-alarm", },
> +	{ .compatible = "fsl,ls1028a-ftm-alarm", },
> +	{ },
> +};
> +
> +static struct platform_driver ftm_rtc_driver = {
> +	.probe		= ftm_rtc_probe,
> +	.driver		= {
> +		.name	= "ftm-alarm",
> +		.of_match_table = ftm_rtc_match,
> +	},
> +};
> +
> +static int __init ftm_alarm_init(void)
> +{
> +	return platform_driver_register(&ftm_rtc_driver);
> +}
> +
> +/*
> + * Ensure that the driver is initialized after
> + * any real rtc driver
> + *	- The flextimer is not a real rtc device,
> + *	  it don't have time and date registers of rtc.
> + *	- The flextimer rtc alarm driver gets time from wall time,
> + *	  but the wall time is not ready.so the time from the driver is wrong.
> + *	- If system regist it before any other real rtc device,it will
> + *	  be emulated as rtc0,date command will read wrong time for user.
> + */
> +device_initcall_sync(ftm_alarm_init);

No, please register that as a regular RTC driver and stop using
RTC_HCTOSYS or use the DT aliases to ensure it is not used as the
primary RTC.

> +
> +MODULE_DESCRIPTION("NXP/Freescale FlexTimer alarm driver");
> +MODULE_AUTHOR("Biwen Li <biwen.li@nxp.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
