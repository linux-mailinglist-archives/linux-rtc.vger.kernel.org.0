Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D27B81FABC9
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jun 2020 11:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgFPJC5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Jun 2020 05:02:57 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:59061 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgFPJC5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Jun 2020 05:02:57 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D3B3E20015;
        Tue, 16 Jun 2020 09:02:54 +0000 (UTC)
Date:   Tue, 16 Jun 2020 11:02:54 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Liam Beguin <liambeguin@gmail.com>
Cc:     bruno.thomsen@gmail.com, a.zummo@towertech.it,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rtc: pcf2127: add alarm support
Message-ID: <20200616090254.GH241261@piout.net>
References: <20200614040409.30302-1-liambeguin@gmail.com>
 <20200614040409.30302-3-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200614040409.30302-3-liambeguin@gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 14/06/2020 00:04:09-0400, Liam Beguin wrote:
> From: Liam Beguin <lvb@xiphos.com>
> 
> Add alarm support for the pcf2127 RTC chip family.
> Tested on pca2129.
> 
> Signed-off-by: Liam Beguin <lvb@xiphos.com>
> ---
> Changes since v1:
> - Add calls to pcf2127_wdt_active_ping after accessing CTRL2
> - Cleanup calls to regmap_{read,write,update_bits}
> - Cleanup debug trace
> - Add interrupt handler, untested because of hardware limitations
> - Add wakeup-source devicetree option
> 
>  drivers/rtc/rtc-pcf2127.c | 169 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 166 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 396a1144a213..87ecb29247c6 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -20,6 +20,7 @@
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_irq.h>
>  #include <linux/regmap.h>
>  #include <linux/watchdog.h>
>  
> @@ -28,7 +29,9 @@
>  #define PCF2127_BIT_CTRL1_TSF1			BIT(4)
>  /* Control register 2 */
>  #define PCF2127_REG_CTRL2		0x01
> +#define PCF2127_BIT_CTRL2_AIE			BIT(1)
>  #define PCF2127_BIT_CTRL2_TSIE			BIT(2)
> +#define PCF2127_BIT_CTRL2_AF			BIT(4)
>  #define PCF2127_BIT_CTRL2_TSF2			BIT(5)
>  /* Control register 3 */
>  #define PCF2127_REG_CTRL3		0x02
> @@ -46,6 +49,12 @@
>  #define PCF2127_REG_DW			0x07
>  #define PCF2127_REG_MO			0x08
>  #define PCF2127_REG_YR			0x09
> +/* Alarm registers */
> +#define PCF2127_REG_ALARM_SC		0x0A
> +#define PCF2127_REG_ALARM_MN		0x0B
> +#define PCF2127_REG_ALARM_HR		0x0C
> +#define PCF2127_REG_ALARM_DM		0x0D
> +#define PCF2127_REG_ALARM_DW		0x0E
>  /* Watchdog registers */
>  #define PCF2127_REG_WD_CTL		0x10
>  #define PCF2127_BIT_WD_CTL_TF0			BIT(0)
> @@ -79,6 +88,8 @@
>  #define PCF2127_WD_VAL_MAX		255
>  #define PCF2127_WD_VAL_DEFAULT		60
>  
> +static int pcf2127_wdt_active_ping(struct watchdog_device *wdd);
> +

This forward declaration should be avoided.

>  struct pcf2127 {
>  	struct rtc_device *rtc;
>  	struct watchdog_device wdd;
> @@ -185,6 +196,140 @@ static int pcf2127_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	return 0;
>  }
>  
> +static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> +	unsigned int buf[5], ctrl2;
> +	int ret;
> +
> +	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
> +	if (ret) {
> +		dev_err(dev, "%s: ctrl2 read error\n", __func__);

Honestly, I would prefer avoiding adding so many strings in the driver.
The reality is that nobody will look into dmesg to know what was the
issue and even if somebody does, the solution would simply be to start
the operation again. Something that can already be deducted when
returning a simple error code. (This is valid for the subsequent
dev_err).

> +		return ret;
> +	}
> +
> +	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
> +			       sizeof(buf));
> +	if (ret) {
> +		dev_err(dev, "%s: alarm read error\n", __func__);
> +		return ret;
> +	}
> +
> +	alrm->enabled = ctrl2 & PCF2127_BIT_CTRL2_AIE;
> +	alrm->pending = ctrl2 & PCF2127_BIT_CTRL2_AF;
> +
> +	alrm->time.tm_sec = bcd2bin(buf[0] & 0x7F);
> +	alrm->time.tm_min = bcd2bin(buf[1] & 0x7F);
> +	alrm->time.tm_hour = bcd2bin(buf[2] & 0x3F);
> +	alrm->time.tm_mday = bcd2bin(buf[3] & 0x3F);
> +	alrm->time.tm_wday = buf[4] & 0x07;
> +
> +	dev_dbg(dev, "%s: alarm is %d:%d:%d, mday=%d, wday=%d\n", __func__,
> +		alrm->time.tm_hour, alrm->time.tm_min, alrm->time.tm_sec,
> +		alrm->time.tm_mday, alrm->time.tm_wday);
> +

It is generally not useful to have those debug strings anymore because
the core already provides tracepoints at the correct locations.

If you really want to keep it, then please use %ptR.

This is also valid for the other dev_dbg.

> +	return 0;
> +}
> +
> +static int pcf2127_rtc_alarm_irq_enable(struct device *dev, u32 enable)
> +{
> +	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> +				 PCF2127_BIT_CTRL2_AIE,
> +				 enable ? PCF2127_BIT_CTRL2_AIE : 0);
> +	if (ret) {
> +		dev_err(dev, "%s: failed to %s alarm (%d)\n", __func__,
> +			enable ? "enable" : "disable",
> +			ret);
> +		return ret;
> +	}
> +
> +	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> +	uint8_t buf[5];
> +	int ret;
> +
> +	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> +				 PCF2127_BIT_CTRL2_AF, 0);
> +	if (ret) {
> +		dev_err(dev, "%s: failed to clear alarm interrupt flag (%d)",
> +			__func__, ret);
> +		return ret;
> +	}
> +
> +	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
> +	if (ret)
> +		return ret;
> +
> +	buf[0] = bin2bcd(alrm->time.tm_sec);
> +	buf[1] = bin2bcd(alrm->time.tm_min);
> +	buf[2] = bin2bcd(alrm->time.tm_hour);
> +	buf[3] = bin2bcd(alrm->time.tm_mday);
> +	buf[4] = (alrm->time.tm_wday & 0x07);
> +
> +	dev_dbg(dev, "%s: alarm set for: %d:%d:%d, mday=%d, wday=%d\n",
> +		__func__, alrm->time.tm_hour, alrm->time.tm_min,
> +		alrm->time.tm_sec, alrm->time.tm_mday, alrm->time.tm_wday);
> +
> +	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
> +				sizeof(buf));
> +	if (ret) {
> +		dev_err(dev, "%s: failed to write alarm registers (%d)",
> +			__func__, ret);
> +		return ret;
> +	}
> +
> +	pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
> +{
> +	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> +	unsigned int ctrl2 = 0;
> +	int ret = 0;
> +
> +	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
> +	if (ret) {
> +		dev_err(dev, "%s: ctrl2 read error (%d)\n", __func__, ret);
> +		goto irq_err;
> +	}
> +
> +	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
> +	if (ret)
> +		goto irq_err;
> +
> +	if (ctrl2 & PCF2127_BIT_CTRL2_AF) {
> +		regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> +				   PCF2127_BIT_CTRL2_AF, 0);

In that case, I think it makes more sense to use regmap_write as this
would avoid another read of ctrl2.

> +
> +		ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
> +		if (ret)
> +			goto irq_err;
> +
> +		rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
> +	}
> +
> +	return IRQ_HANDLED;
> +irq_err:
> +	return IRQ_NONE;
> +}
> +
>  #ifdef CONFIG_RTC_INTF_DEV
>  static int pcf2127_rtc_ioctl(struct device *dev,
>  				unsigned int cmd, unsigned long arg)
> @@ -211,9 +356,12 @@ static int pcf2127_rtc_ioctl(struct device *dev,
>  #endif
>  
>  static const struct rtc_class_ops pcf2127_rtc_ops = {
> -	.ioctl		= pcf2127_rtc_ioctl,
> -	.read_time	= pcf2127_rtc_read_time,
> -	.set_time	= pcf2127_rtc_set_time,
> +	.ioctl            = pcf2127_rtc_ioctl,
> +	.read_time        = pcf2127_rtc_read_time,
> +	.set_time         = pcf2127_rtc_set_time,
> +	.read_alarm       = pcf2127_rtc_read_alarm,
> +	.set_alarm        = pcf2127_rtc_set_alarm,
> +	.alarm_irq_enable = pcf2127_rtc_alarm_irq_enable,
>  };
>  
>  static int pcf2127_nvmem_read(void *priv, unsigned int offset,
> @@ -415,6 +563,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  			const char *name, bool has_nvmem)
>  {
>  	struct pcf2127 *pcf2127;
> +	int alarm_irq = 0;
>  	u32 wdd_timeout;
>  	int ret = 0;
>  
> @@ -434,6 +583,20 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  
>  	pcf2127->rtc->ops = &pcf2127_rtc_ops;
>  
> +	alarm_irq = of_irq_get_byname(dev->of_node, "alarm");
> +	if (alarm_irq >= 0) {
> +		ret = devm_request_irq(dev, alarm_irq, pcf2127_rtc_irq,
> +				       IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> +				       dev_name(dev), dev);
> +		if (ret) {
> +			dev_err(dev, "failed to request alarm irq\n");
> +			return ret;
> +		}
> +	}
> +
> +	if (alarm_irq >= 0 || device_property_read_bool(dev, "wakeup-source"))
> +		device_init_wakeup(dev, true);

The last thing here is that you should have two different rtc_class_ops
struct, one with alarm and the other one without. at this point, you
know which one you should use. I know this is not convenient but I'm
working on a series to make things better. Until this is ready, this is
what we will have to live with.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
