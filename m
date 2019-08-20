Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 772A496A05
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Aug 2019 22:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729833AbfHTURv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Aug 2019 16:17:51 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:44169 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbfHTURv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 20 Aug 2019 16:17:51 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 0D46760007;
        Tue, 20 Aug 2019 20:17:44 +0000 (UTC)
Date:   Tue, 20 Aug 2019 22:17:44 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Ran Bi <ran.bi@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        YT Shen <yt.shen@mediatek.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Flora Fu <flora.fu@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH v2 2/4] rtc: Add support for the MediaTek MT2712 RTC
Message-ID: <20190820201744.GZ3545@piout.net>
References: <20190801110122.26834-1-ran.bi@mediatek.com>
 <20190801110122.26834-3-ran.bi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190801110122.26834-3-ran.bi@mediatek.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 01/08/2019 19:01:20+0800, Ran Bi wrote:
> diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
> new file mode 100644
> index 000000000000..1eb71ca64c2c
> --- /dev/null
> +++ b/drivers/rtc/rtc-mt2712.c
> @@ -0,0 +1,444 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Ran Bi <ran.bi@mediatek.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/irqdomain.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/rtc.h>
> +
> +#define MTK_RTC_DEV		KBUILD_MODNAME

You probably shouldn't do that and have a static string for the driver
name. I probably doesn't matter much though because DT is used to probe
the driver.

> +#define MT2712_WRTGR		0x0078
> +
> +/* we map HW YEAR 0 to 2000 because 2000 is the leap year */
> +#define MT2712_MIN_YEAR		2000
> +#define MT2712_BASE_YEAR	1900
> +#define MT2712_MIN_YEAR_OFFSET	(MT2712_MIN_YEAR - MT2712_BASE_YEAR)
> +#define MT2712_MAX_YEAR_OFFSET	(MT2712_MIN_YEAR_OFFSET + 127)
> +

All those defines are unecessary, see below.


> +struct mt2712_rtc {
> +	struct device		*dev;

Looking at the code closely, it seems this is only used for debug and
error messages. Maybe you could use rtc_dev->dev instead.

> +	struct rtc_device	*rtc_dev;
> +	void __iomem		*base;
> +	int			irq;
> +	u8			irq_wake_enabled;
> +};
> +
> +static inline u32 mt2712_readl(struct mt2712_rtc *rtc, u32 reg)
> +{
> +	return readl(rtc->base + reg);
> +}
> +
> +static inline void mt2712_writel(struct mt2712_rtc *rtc, u32 reg, u32 val)
> +{
> +	writel(val, rtc->base + reg);
> +}
> +
> +static void mt2712_rtc_write_trigger(struct mt2712_rtc *rtc)
> +{
> +	unsigned long timeout = jiffies + HZ/10;
> +
> +	mt2712_writel(rtc, MT2712_WRTGR, 1);
> +	while (1) {
> +		if (!(mt2712_readl(rtc, MT2712_BBPU) & MT2712_BBPU_CBUSY))
> +			break;
> +
> +		if (time_after(jiffies, timeout)) {
> +			dev_err(rtc->dev, "%s time out!\n", __func__);
> +			break;
> +		}
> +		cpu_relax();
> +	}
> +}
> +
> +static void mt2712_rtc_writeif_unlock(struct mt2712_rtc *rtc)
> +{
> +	mt2712_writel(rtc, MT2712_PROT, MT2712_PROT_UNLOCK1);
> +	mt2712_rtc_write_trigger(rtc);
> +	mt2712_writel(rtc, MT2712_PROT, MT2712_PROT_UNLOCK2);
> +	mt2712_rtc_write_trigger(rtc);
> +}
> +
> +static irqreturn_t rtc_irq_handler_thread(int irq, void *data)
> +{
> +	struct mt2712_rtc *rtc = data;
> +	u16 irqsta, irqen;
> +
> +	mutex_lock(&rtc->rtc_dev->ops_lock);
> +
> +	irqsta = mt2712_readl(rtc, MT2712_IRQ_STA);

Do you have to lock that read? Is the register cleared on read?

> +	if (irqsta & MT2712_IRQ_STA_AL) {
> +		rtc_update_irq(rtc->rtc_dev, 1, RTC_IRQF | RTC_AF);
> +		irqen = irqsta & ~MT2712_IRQ_EN_AL;
> +
> +		mt2712_writel(rtc, MT2712_IRQ_EN, irqen);
> +		mt2712_rtc_write_trigger(rtc);
> +
> +		mutex_unlock(&rtc->rtc_dev->ops_lock);
> +		return IRQ_HANDLED;
> +	}
> +
> +	mutex_unlock(&rtc->rtc_dev->ops_lock);
> +	return IRQ_NONE;
> +}
> +
> +static void __mt2712_rtc_read_time(struct mt2712_rtc *rtc,
> +				   struct rtc_time *tm, int *sec)
> +{
> +	tm->tm_sec  = mt2712_readl(rtc, MT2712_TC_SEC) & MT2712_SEC_MASK;
> +	tm->tm_min  = mt2712_readl(rtc, MT2712_TC_MIN) & MT2712_MIN_MASK;
> +	tm->tm_hour = mt2712_readl(rtc, MT2712_TC_HOU) & MT2712_HOU_MASK;
> +	tm->tm_mday = mt2712_readl(rtc, MT2712_TC_DOM) & MT2712_DOM_MASK;
> +	tm->tm_mon  = mt2712_readl(rtc, MT2712_TC_MTH) & MT2712_MTH_MASK;
> +	tm->tm_year = mt2712_readl(rtc, MT2712_TC_YEA) & MT2712_YEA_MASK;
> +
> +	*sec = mt2712_readl(rtc, MT2712_TC_SEC) & MT2712_SEC_MASK;
> +}
> +
> +static int mt2712_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
> +	int sec;
> +
> +	do {
> +		__mt2712_rtc_read_time(rtc, tm, &sec);
> +	} while (sec < tm->tm_sec);	/* SEC has carried */

Shouldn't that be while (tm->tm_sec < sec)?

> +
> +	/* HW register use 7 bits to store year data, minus
> +	 * MT2712_MIN_YEAR_OFFSET brfore write year data to register, and plus
> +	 * MT2712_MIN_YEAR_OFFSET back after read year from register
> +	 */
> +	tm->tm_year += MT2712_MIN_YEAR_OFFSET;

Simply add 100 in __mt2712_rtc_read_time

> +
> +	/* HW register start mon from one, but tm_mon start from zero. */
> +	tm->tm_mon--;
> +

You can also do that in __mt2712_rtc_read_time.

> +	if (rtc_valid_tm(tm)) {

This check is unnecessary, the validity is always checked by the core.

> +		dev_dbg(rtc->dev, "%s: invalid time %ptR\n", __func__, tm);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mt2712_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
> +
> +	if (tm->tm_year > MT2712_MAX_YEAR_OFFSET) {
> +		dev_dbg(rtc->dev, "Set year %d out of range. (%d - %d)\n",
> +			1900 + tm->tm_year, 1900 + MT2712_MIN_YEAR_OFFSET,
> +			1900 + MT2712_MAX_YEAR_OFFSET);
> +		return -EINVAL;
> +	}

This check is unnecessary, see below.

> +
> +	tm->tm_year -= MT2712_MIN_YEAR_OFFSET;
> +	tm->tm_mon++;

You should probably avoid modifying tm, move the substraction and
addition in the mt2712_writel calls.

> +
> +	mt2712_writel(rtc, MT2712_TC_SEC, tm->tm_sec  & MT2712_SEC_MASK);
> +	mt2712_writel(rtc, MT2712_TC_MIN, tm->tm_min  & MT2712_MIN_MASK);
> +	mt2712_writel(rtc, MT2712_TC_HOU, tm->tm_hour & MT2712_HOU_MASK);
> +	mt2712_writel(rtc, MT2712_TC_DOM, tm->tm_mday & MT2712_DOM_MASK);
> +	mt2712_writel(rtc, MT2712_TC_MTH, tm->tm_mon  & MT2712_MTH_MASK);
> +	mt2712_writel(rtc, MT2712_TC_YEA, tm->tm_year & MT2712_YEA_MASK);
> +
> +	mt2712_rtc_write_trigger(rtc);
> +
> +	return 0;
> +}
> +
> +static int mt2712_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
> +{
> +	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
> +	struct rtc_time *tm = &alm->time;
> +	u16 irqen;
> +
> +	irqen = mt2712_readl(rtc, MT2712_IRQ_EN);
> +	alm->enabled = !!(irqen & MT2712_IRQ_EN_AL);
> +
> +	tm->tm_sec  = mt2712_readl(rtc, MT2712_AL_SEC) & MT2712_SEC_MASK;
> +	tm->tm_min  = mt2712_readl(rtc, MT2712_AL_MIN) & MT2712_MIN_MASK;
> +	tm->tm_hour = mt2712_readl(rtc, MT2712_AL_HOU) & MT2712_HOU_MASK;
> +	tm->tm_mday = mt2712_readl(rtc, MT2712_AL_DOM) & MT2712_DOM_MASK;
> +	tm->tm_mon  = mt2712_readl(rtc, MT2712_AL_MTH) & MT2712_MTH_MASK;
> +	tm->tm_year = mt2712_readl(rtc, MT2712_AL_YEA) & MT2712_YEA_MASK;
> +
> +	tm->tm_year += MT2712_MIN_YEAR_OFFSET;
> +	tm->tm_mon--;
> +
> +	if (rtc_valid_tm(tm)) {
> +		dev_dbg(rtc->dev, "%s: invalid alarm %ptR\n", __func__, tm);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mt2712_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
> +{
> +	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
> +	struct rtc_time *tm = &alm->time;
> +	u16 irqen;
> +
> +	if (tm->tm_year > MT2712_MAX_YEAR_OFFSET) {
> +		dev_dbg(rtc->dev, "Set year %d out of range. (%d - %d)\n",
> +			1900 + tm->tm_year, 1900 + MT2712_MIN_YEAR_OFFSET,
> +			1900 + MT2712_MAX_YEAR_OFFSET);
> +		return -EINVAL;
> +	}
> +

Unnecessary check.

> +	dev_dbg(rtc->dev, "set al time: %ptR, alm en: %d\n", tm, alm->enabled);
> +
> +	tm->tm_year -= MT2712_MIN_YEAR_OFFSET;
> +	tm->tm_mon++;
> +
> +	irqen = mt2712_readl(rtc, MT2712_IRQ_EN) & ~(MT2712_IRQ_EN_ONESHOT_AL);
> +	mt2712_writel(rtc, MT2712_IRQ_EN, irqen);
> +	mt2712_rtc_write_trigger(rtc);
> +
> +	mt2712_writel(rtc, MT2712_AL_SEC,
> +		      (mt2712_readl(rtc, MT2712_AL_SEC) & ~(MT2712_SEC_MASK)) |
> +		      (tm->tm_sec  & MT2712_SEC_MASK));
> +	mt2712_writel(rtc, MT2712_AL_MIN,
> +		      (mt2712_readl(rtc, MT2712_AL_MIN) & ~(MT2712_MIN_MASK)) |
> +		      (tm->tm_min  & MT2712_MIN_MASK));
> +	mt2712_writel(rtc, MT2712_AL_HOU,
> +		      (mt2712_readl(rtc, MT2712_AL_HOU) & ~(MT2712_HOU_MASK)) |
> +		      (tm->tm_hour & MT2712_HOU_MASK));
> +	mt2712_writel(rtc, MT2712_AL_DOM,
> +		      (mt2712_readl(rtc, MT2712_AL_DOM) & ~(MT2712_DOM_MASK)) |
> +		      (tm->tm_mday & MT2712_DOM_MASK));
> +	mt2712_writel(rtc, MT2712_AL_MTH,
> +		      (mt2712_readl(rtc, MT2712_AL_MTH) & ~(MT2712_MTH_MASK)) |
> +		      (tm->tm_mon  & MT2712_MTH_MASK));
> +	mt2712_writel(rtc, MT2712_AL_YEA,
> +		      (mt2712_readl(rtc, MT2712_AL_YEA) & ~(MT2712_YEA_MASK)) |
> +		      (tm->tm_year & MT2712_YEA_MASK));
> +
> +	mt2712_writel(rtc, MT2712_AL_MASK, MT2712_AL_MASK_DOW);	/* mask DOW */
> +
> +	if (alm->enabled) {
> +		irqen = mt2712_readl(rtc, MT2712_IRQ_EN) |
> +				     MT2712_IRQ_EN_ONESHOT_AL;
> +		mt2712_writel(rtc, MT2712_IRQ_EN, irqen);
> +	} else {
> +		irqen = mt2712_readl(rtc, MT2712_IRQ_EN) &
> +				     ~(MT2712_IRQ_EN_ONESHOT_AL);
> +		mt2712_writel(rtc, MT2712_IRQ_EN, irqen);
> +	}
> +	mt2712_rtc_write_trigger(rtc);
> +
> +	return 0;
> +}
> +
> +/* Init RTC register */
> +static void mt2712_rtc_hw_init(struct mt2712_rtc *rtc)
> +{
> +	u32 p1, p2;
> +
> +	mt2712_writel(rtc, MT2712_BBPU, MT2712_BBPU_KEY | MT2712_BBPU_RELOAD);
> +
> +	mt2712_writel(rtc, MT2712_CII_EN, 0);
> +	mt2712_writel(rtc, MT2712_AL_MASK, 0);
> +	/* necessary before set MT2712_POWERKEY */
> +	mt2712_writel(rtc, MT2712_CON0, 0x4848);
> +	mt2712_writel(rtc, MT2712_CON1, 0x0048);
> +
> +	mt2712_rtc_write_trigger(rtc);
> +
> +	mt2712_readl(rtc, MT2712_IRQ_STA);	/* read clear */
> +
> +	p1 = mt2712_readl(rtc, MT2712_POWERKEY1);
> +	p2 = mt2712_readl(rtc, MT2712_POWERKEY2);
> +	if (p1 != MT2712_POWERKEY1_KEY || p2 != MT2712_POWERKEY2_KEY)
> +		dev_dbg(rtc->dev, "powerkey not set (lost power)\n");
> +

This info is valuable, you should check that when reading the time and
return -EINVAL if power was lost.


> +	/* RTC need POWERKEY1/2 match, then goto normal work mode */
> +	mt2712_writel(rtc, MT2712_POWERKEY1, MT2712_POWERKEY1_KEY);
> +	mt2712_writel(rtc, MT2712_POWERKEY2, MT2712_POWERKEY2_KEY);

This should be written when setting the time after power was lost.

> +	mt2712_rtc_write_trigger(rtc);
> +
> +	mt2712_rtc_writeif_unlock(rtc);
> +}
> +
> +static const struct rtc_class_ops mt2712_rtc_ops = {
> +	.read_time	= mt2712_rtc_read_time,
> +	.set_time	= mt2712_rtc_set_time,
> +	.read_alarm	= mt2712_rtc_read_alarm,
> +	.set_alarm	= mt2712_rtc_set_alarm,

For proper operations, you should also provide the .alarm_irq_enable
callback.

> +};
> +
> +static int mt2712_rtc_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct mt2712_rtc *rtc;
> +	int ret;
> +
> +	rtc = devm_kzalloc(&pdev->dev, sizeof(struct mt2712_rtc), GFP_KERNEL);
> +	if (!rtc)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	rtc->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(rtc->base))
> +		return PTR_ERR(rtc->base);
> +
> +	rtc->irq = platform_get_irq(pdev, 0);
> +	if (rtc->irq < 0) {
> +		dev_err(&pdev->dev, "No IRQ resource\n");
> +		return rtc->irq;
> +	}
> +
> +	rtc->dev = &pdev->dev;
> +	platform_set_drvdata(pdev, rtc);
> +
> +	rtc->rtc_dev = devm_rtc_allocate_device(rtc->dev);
> +	if (IS_ERR(rtc->rtc_dev))
> +		return PTR_ERR(rtc->rtc_dev);
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
> +					rtc_irq_handler_thread,
> +					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
> +					dev_name(rtc->dev), rtc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
> +			rtc->irq, ret);
> +		return ret;
> +	}
> +
> +	/* rtc hw init */
> +	mt2712_rtc_hw_init(rtc);
> +
> +	device_init_wakeup(&pdev->dev, true);
> +
> +	rtc->rtc_dev->ops = &mt2712_rtc_ops;

If you set the range properly here using rtc_dev->range_min and
rtc_dev->range_max, then the core will be able to do range checking and
will also take care of the year offset/windowing calculations instead of
having to hardcode that in the driver.

> +
> +	ret = rtc_register_device(rtc->rtc_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "register rtc device failed\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int mt2712_rtc_suspend(struct device *dev)
> +{
> +	int wake_status = 0;
> +	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev)) {
> +		wake_status = enable_irq_wake(rtc->irq);
> +		if (!wake_status)
> +			rtc->irq_wake_enabled = true;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mt2712_rtc_resume(struct device *dev)
> +{
> +	int wake_status = 0;
> +	struct mt2712_rtc *rtc = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev) && rtc->irq_wake_enabled) {
> +		wake_status = disable_irq_wake(rtc->irq);
> +		if (!wake_status)
> +			rtc->irq_wake_enabled = false;
> +	}
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(mt2712_pm_ops, mt2712_rtc_suspend,
> +			 mt2712_rtc_resume);
> +#endif
> +
> +static const struct of_device_id mt2712_rtc_of_match[] = {
> +	{ .compatible = "mediatek,mt2712-rtc", },
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, mt2712_rtc_of_match)
> +
> +static struct platform_driver mt2712_rtc_driver = {
> +	.driver = {
> +		.name = MTK_RTC_DEV,
> +		.of_match_table = mt2712_rtc_of_match,
> +		.pm = &mt2712_pm_ops,
> +	},
> +	.probe  = mt2712_rtc_probe,
> +};
> +
> +module_platform_driver(mt2712_rtc_driver);
> +
> +MODULE_DESCRIPTION("MediaTek MT2712 SoC based RTC Driver");
> +MODULE_AUTHOR("Ran Bi <ran.bi@mediatek.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.21.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
