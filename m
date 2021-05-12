Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E83E37EFA8
	for <lists+linux-rtc@lfdr.de>; Thu, 13 May 2021 01:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbhELXVx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 May 2021 19:21:53 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:39989 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443495AbhELWUG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 12 May 2021 18:20:06 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2EC4820002;
        Wed, 12 May 2021 22:18:04 +0000 (UTC)
Date:   Thu, 13 May 2021 00:18:04 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     daire.mcnamara@microchip.com
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org, palmer@dabbelt.com,
        cyril.jean@microchip.com, padmarao.begari@microchip.com,
        lewis.hanly@microchip.com, conor.dooley@microchip.com,
        david.abdurachmanov@gmail.com
Subject: Re: [PATCH v1 2/2] rtc: microchip: Add driver for Microchip
 PolarFire SoC
Message-ID: <YJxUHERhJe+hVPl6@piout.net>
References: <20210512111133.1650740-1-daire.mcnamara@microchip.com>
 <20210512111133.1650740-3-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512111133.1650740-3-daire.mcnamara@microchip.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

The subject should be:
rtc: Add driver for Microchip PolarFire SoC

On 12/05/2021 12:11:33+0100, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> Add support for built-in RTC on Microchip PolarFire SoC
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  drivers/rtc/Kconfig    |   7 +
>  drivers/rtc/Makefile   |   1 +
>  drivers/rtc/rtc-mpfs.c | 449 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 457 insertions(+)
>  create mode 100644 drivers/rtc/rtc-mpfs.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index ce723dc54aa4..12e2308423ee 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1655,6 +1655,13 @@ config RTC_DRV_MPC5121
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-mpc5121.
>  
> +config RTC_DRV_MPFS
> +	tristate "Microchip PolarFire SoC built-in RTC"
> +	depends on SOC_MICROCHIP_POLARFIRE
> +	help
> +	  If you say yes here you will get support for the
> +	  built-in RTC on MPFS.

MPFS is not really descriptive, can you spell it out completely?

> +++ b/drivers/rtc/rtc-mpfs.c

Same comment, rtc-mpfs.c is not very descriptive...

> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/rtc.h>
> +#include <linux/io.h>

Includes should be sorted alphabetically

> +
> +/*
> + * Device Specific Peripheral registers structures

Those are not structures, I don't think this comment is useful

> + */
> +#define CONTROL_REG		0x00
> +#define  CONTROL_RUNNING_BIT		BIT(0)
> +#define  CONTROL_START_BIT		BIT(0)
> +#define  CONTROL_STOP_BIT		BIT(1)
> +#define  CONTROL_ALARM_ON_BIT		BIT(2)
> +#define  CONTROL_ALARM_OFF_BIT		BIT(3)
> +#define  CONTROL_RESET_BIT		BIT(4)
> +#define  CONTROL_UPLOAD_BIT		BIT(5)
> +#define  CONTROL_WAKEUP_CLR_BIT		BIT(8)
> +#define  CONTROL_WAKEUP_SET_BIT		BIT(9)
> +#define  CONTROL_UPDATED_BIT		BIT(10)
> +#define  MPFS_RTC_NUM_IRQS		2
> +#define MODE_REG		0x04
> +#define  MODE_CLOCK_BIT			BIT(0)
> +#define   MODE_CLOCK_CALENDAR		1
> +#define  MODE_WAKE_EN_BIT		BIT(1)
> +#define  MODE_WAKE_RESET_BIT		BIT(2)
> +#define  MODE_WAKE_CONTINUE_BIT		BIT(3)
> +#define PRESCALER_REG		0x08
> +#define ALARM_LOWER_REG		0x0c
> +#define ALARM_UPPER_REG		0x10
> +#define COMPARE_LOWER_REG	0x14
> +#define COMPARE_UPPER_REG	0x18
> +#define DATETIME_LOWER_REG	0x20
> +#define DATETIME_UPPER_REG	0x24
> +#define SECONDS_REG		0x30
> +#define MINUTES_REG		0x34
> +#define HOURS_REG		0x38
> +#define DAY_REG			0x3c
> +#define MONTH_REG		0x40
> +#define YEAR_REG		0x44
> +#define WEEKDAY_REG		0x48
> +#define WEEK_REG		0x4c
> +
> +/*
> + * Linux counts from 1970 but tm_year starts at 1900, MPFS RTC counts from 2000
> + * Account for this difference
> + */
> +#define YEAR_OFFSET		(100)
> +
> +#define MAX_PRESCALER_COUNT	GENMASK(21, 0)
> +#define DEFAULT_PRESCALER	999999  /* (1Mhz / prescaler) -1 = 1Hz */
> +
> +struct mpfs_rtc_dev {
> +	struct rtc_device *rtc;
> +	void __iomem *base;
> +	int wakeup_irq;
> +	u32 prescaler;
> +};
> +
> +static void mpfs_rtc_stop(struct mpfs_rtc_dev *rtcdev)
> +{
> +	u32 ctrl;
> +
> +	ctrl = readl(rtcdev->base + CONTROL_REG);
> +	ctrl &= ~(CONTROL_STOP_BIT | CONTROL_START_BIT);
> +	ctrl |= CONTROL_STOP_BIT;
> +	ctrl |= CONTROL_ALARM_OFF_BIT;

stop and start then has the unexpected side effect that it disables the
alarm and this happens at boot time.

> +	writel(ctrl, rtcdev->base + CONTROL_REG);
> +}
> +
> +static void mpfs_rtc_start(struct mpfs_rtc_dev *rtcdev)
> +{
> +	u32 ctrl;
> +
> +	ctrl = readl(rtcdev->base + CONTROL_REG);
> +	ctrl &= ~(CONTROL_STOP_BIT | CONTROL_START_BIT);
> +	ctrl |= CONTROL_START_BIT;
> +	writel(ctrl, rtcdev->base + CONTROL_REG);
> +}
> +
> +static void mpfs_rtc_clear_irq(struct mpfs_rtc_dev *rtcdev)
> +{
> +	u32 val = readl(rtcdev->base + CONTROL_REG);
> +
> +	val &= ~(CONTROL_ALARM_ON_BIT | CONTROL_STOP_BIT);
> +	val |= CONTROL_ALARM_OFF_BIT;
> +	writel(val, rtcdev->base + CONTROL_REG);
> +	/*
> +	 * Ensure that the posted write to the CONTROL_REG register completed before
> +	 * returning from this function. Not doing this may result in the interrupt
> +	 * only being cleared some time after this function returns.
> +	 */
> +	(void)readl(rtcdev->base + CONTROL_REG);
> +}
> +
> +static void mpfs_rtc_calendar_mode(struct mpfs_rtc_dev *rtcdev)
> +{
> +	u32 val;
> +	u32 rtc_running;
> +
> +	val = readl(rtcdev->base + MODE_REG);
> +	val |= MODE_CLOCK_CALENDAR;
> +
> +	rtc_running = readl(rtcdev->base + CONTROL_REG);
> +	if (rtc_running & CONTROL_RUNNING_BIT) {
> +		/* Stop the RTC in order to change the mode register content. */
> +		mpfs_rtc_stop(rtcdev);

There is now way it is running at this point as your are stopping the
RTC unconditionally before calling the function.

> +		writel(val, rtcdev->base + MODE_REG);
> +		mpfs_rtc_start(rtcdev);
> +	} else {
> +		writel(val, rtcdev->base + MODE_REG);
> +	}
> +}
> +


> +static void mpfs_rtc_set_prescaler(struct mpfs_rtc_dev *rtcdev, unsigned int prescaler)
> +{
> +	writel(prescaler, rtcdev->base + PRESCALER_REG);
> +}
> +
> +static inline struct clk *mpfs_rtc_init_clk(struct device *dev)

Why is that inline? This should probably be simply part of the probe
function.

> +{
> +	struct clk *clk;
> +	int ret;
> +
> +	clk = devm_clk_get(dev, "rtc");
> +	if (IS_ERR(clk))
> +		return clk;
> +
> +	ret = clk_prepare_enable(clk);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare, clk);
> +
> +	return clk;
> +}
> +
> +static irqreturn_t mpfs_rtc_wakeup_irq_handler(int irq, void *d)
> +{
> +	struct mpfs_rtc_dev *rtcdev = d;
> +	unsigned long pending;
> +
> +	pending = readl(rtcdev->base + CONTROL_REG);
> +	pending &= CONTROL_ALARM_ON_BIT;
> +	mpfs_rtc_clear_irq(rtcdev);
> +
> +	/* its an alarm */

This comment is not really useful.

> +	rtc_update_irq(rtcdev->rtc, 1, RTC_IRQF | RTC_AF);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct rtc_class_ops mpfs_rtc_ops = {
> +	.read_time		= mpfs_rtc_readtime,
> +	.set_time		= mpfs_rtc_settime,
> +	.read_alarm		= mpfs_rtc_readalarm,
> +	.set_alarm		= mpfs_rtc_setalarm,
> +	.alarm_irq_enable	= mpfs_rtc_alarm_irq_enable,
> +};
> +
> +static void mpfs_rtc_init(struct mpfs_rtc_dev *rtcdev)
> +{
> +	u32 ctrl;
> +
> +	mpfs_rtc_set_prescaler(rtcdev, rtcdev->prescaler);
> +
> +	mpfs_rtc_stop(rtcdev);
> +	mpfs_rtc_calendar_mode(rtcdev);
> +
> +	writel(0, rtcdev->base + ALARM_LOWER_REG);
> +	writel(0, rtcdev->base + ALARM_UPPER_REG);
> +	writel(0, rtcdev->base + COMPARE_LOWER_REG);
> +	writel(0, rtcdev->base + COMPARE_UPPER_REG);
> +
> +	ctrl = readl(rtcdev->base + CONTROL_REG);
> +	ctrl &= ~(CONTROL_RESET_BIT | CONTROL_STOP_BIT | CONTROL_START_BIT);
> +	ctrl |= CONTROL_RESET_BIT | CONTROL_START_BIT;
> +	writel(ctrl, rtcdev->base + CONTROL_REG);

Is this resetting the RTC? If this is the case, then the RTC and the
driver are basically useless as the whole goal of the RTC is to keep
time when the platform is off.

> +}
> +
> +static int __init mpfs_rtc_probe(struct platform_device *pdev)

__init on a probe function is a bug

> +{
> +	struct mpfs_rtc_dev *rtcdev;
> +	struct clk *clk;
> +	int ret;
> +
> +	rtcdev = devm_kzalloc(&pdev->dev, sizeof(struct mpfs_rtc_dev), GFP_KERNEL);
> +	if (!rtcdev)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, rtcdev);
> +
> +	rtcdev->rtc = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(rtcdev->rtc))
> +		return PTR_ERR(rtcdev->rtc);
> +
> +	rtcdev->rtc->ops = &mpfs_rtc_ops;
> +	rtcdev->rtc->range_max = U32_MAX;

Are you sure about that? I guess this is wrong, especially since you are
opencoding the offset instead of properly setting range_min and I think
this is the whole goal of switching to calendar mode which seems to be
2000 to 2255.

Actually, I'm not sure why you are using calendar mode as binary mode
would be more efficient, won't require offsetting and goes up to year 280707

> +
> +	clk = mpfs_rtc_init_clk(&pdev->dev);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	rtcdev->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(rtcdev->base)) {
> +		dev_dbg(&pdev->dev, "invalid ioremap resources\n");
> +		return PTR_ERR(rtcdev->base);
> +	}
> +
> +	rtcdev->wakeup_irq = platform_get_irq(pdev, 0);
> +	if (rtcdev->wakeup_irq <= 0) {
> +		dev_dbg(&pdev->dev, "could not get wakeup irq\n");
> +		return rtcdev->wakeup_irq;
> +	}
> +	ret = devm_request_irq(&pdev->dev, rtcdev->wakeup_irq, mpfs_rtc_wakeup_irq_handler, 0,
> +			       dev_name(&pdev->dev), rtcdev);
> +	if (ret) {
> +		dev_dbg(&pdev->dev, "could not request wakeup irq\n");
> +		return ret;
> +	}
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "prescaler", &rtcdev->prescaler);
> +	if (ret)
> +		rtcdev->prescaler = DEFAULT_PRESCALER;
> +
> +	if (rtcdev->prescaler > MAX_PRESCALER_COUNT) {
> +		dev_dbg(&pdev->dev, "invalid prescaler %d\n", rtcdev->prescaler);
> +		return -EPERM;
> +	}
> +

You don't have to read the prescaler value from the device tree,
instead, you should provide a second clock, RTCCLK and use its rate to
calculate the prescaler.


> +	mpfs_rtc_init(rtcdev);
> +

Again don't do that, this renders the RTC useless.

> +	dev_info(&pdev->dev, "Microchip Polarfire SoC RTC\n");
> +

The core already prints out messages, don't litter the kernel logs.

> +	device_init_wakeup(&pdev->dev, 1);
> +
> +	return devm_rtc_register_device(rtcdev->rtc);
> +}
> +
> +static int mpfs_rtc_remove(struct platform_device *pdev)
> +{
> +	mpfs_rtc_alarm_irq_enable(&pdev->dev, 0);

If the RTC can power up the platform, this should not be done.

> +	device_init_wakeup(&pdev->dev, 0);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int mpfs_rtc_suspend(struct device *dev)
> +{
> +	struct mpfs_rtc_dev *rtcdev = dev_get_drvdata(dev);
> +
> +	/* leave the alarm on as a wake source */
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(rtcdev->wakeup_irq);
> +	else
> +		mpfs_rtc_alarm_irq_enable(dev, 0);

Because you call device_init_wakeup(), device_may_wakeup will always be
true.

> +
> +	return 0;
> +}
> +
> +static int mpfs_rtc_resume(struct device *dev)
> +{
> +	struct mpfs_rtc_dev *rtcdev = dev_get_drvdata(dev);
> +
> +	/* alarms were left on as a wake source, turn them off */
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(rtcdev->wakeup_irq);
> +	else
> +		mpfs_rtc_alarm_irq_enable(dev, 1);
> +

ditto

> +	return 0;
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(mpfs_rtc_pm_ops, mpfs_rtc_suspend, mpfs_rtc_resume);

Please use dev_pm_set_wake_irq to avoid opencoding all of that.

> +
> +static const struct of_device_id mpfs_rtc_of_match[] = {
> +	{ .compatible = "microchip,mpfs-rtc" },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, mpfs_rtc_of_match);
> +
> +static struct platform_driver mpfs_rtc_driver = {
> +	.probe = mpfs_rtc_probe,
> +	.remove = mpfs_rtc_remove,
> +	.driver	= {
> +		.name = "mpfs_rtc",
> +		.pm = &mpfs_rtc_pm_ops,
> +		.of_match_table = mpfs_rtc_of_match,
> +	},
> +};
> +
> +module_platform_driver(mpfs_rtc_driver);
> +
> +MODULE_DESCRIPTION("Real time clock for Microchip Polarfire SoC");
> +MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
