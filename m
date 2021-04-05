Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72295354638
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Apr 2021 19:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239459AbhDERmZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Apr 2021 13:42:25 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:34067 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239419AbhDERmY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Apr 2021 13:42:24 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 52389C0006;
        Mon,  5 Apr 2021 17:42:16 +0000 (UTC)
Date:   Mon, 5 Apr 2021 19:42:16 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Liam Beguin <liambeguin@gmail.com>
Cc:     a.zummo@towertech.it, panfilov.artyom@gmail.com,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 3/4] rtc: ab-eoz9: add alarm support
Message-ID: <YGtL+NvwNd4gd3KQ@piout.net>
References: <20210405141334.3884528-1-liambeguin@gmail.com>
 <20210405141334.3884528-4-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210405141334.3884528-4-liambeguin@gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/04/2021 10:13:33-0400, Liam Beguin wrote:
> From: Liam Beguin <lvb@xiphos.com>
> 
> Add alarm support for the rtc-ab-eoz9.
> 
> Signed-off-by: Liam Beguin <lvb@xiphos.com>
> ---
>  drivers/rtc/rtc-ab-eoz9.c | 140 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 140 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
> index 379a231f673c..4c8ba62fb1c6 100644
> --- a/drivers/rtc/rtc-ab-eoz9.c
> +++ b/drivers/rtc/rtc-ab-eoz9.c
> @@ -11,6 +11,7 @@
>  #include <linux/bcd.h>
>  #include <linux/of.h>
>  #include <linux/regmap.h>
> +#include <linux/bitfield.h>
>  #include <linux/hwmon.h>
>  #include <linux/hwmon-sysfs.h>
>  
> @@ -57,6 +58,24 @@
>  
>  #define ABEOZ9_SEC_LEN			7
>  
> +#define ABEOZ9_REG_ALARM_SEC		0x10
> +#define ABEOZ9_BIT_ALARM_SEC		GENMASK(6, 0)
> +#define ABEOZ9_REG_ALARM_MIN		0x11
> +#define ABEOZ9_BIT_ALARM_MIN		GENMASK(6, 0)
> +#define ABEOZ9_REG_ALARM_HOURS		0x12
> +#define ABEOZ9_BIT_ALARM_HOURS_PM	BIT(5)
> +#define ABEOZ9_BIT_ALARM_HOURS		GENMASK(4, 0)
> +#define ABEOZ9_REG_ALARM_DAYS		0x13
> +#define ABEOZ9_BIT_ALARM_DAYS		GENMASK(5, 0)
> +#define ABEOZ9_REG_ALARM_WEEKDAYS	0x14
> +#define ABEOZ9_BIT_ALARM_WEEKDAYS	GENMASK(2, 0)
> +#define ABEOZ9_REG_ALARM_MONTHS		0x15
> +#define ABEOZ9_BIT_ALARM_MONTHS		GENMASK(4, 0)
> +#define ABEOZ9_REG_ALARM_YEARS		0x16
> +
> +#define ABEOZ9_ALARM_LEN		7
> +#define ABEOZ9_BIT_ALARM_AE		BIT(7)
> +
>  #define ABEOZ9_REG_REG_TEMP		0x20
>  #define ABEOZ953_TEMP_MAX		120
>  #define ABEOZ953_TEMP_MIN		-60
> @@ -182,6 +201,102 @@ static int abeoz9_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	return abeoz9_reset_validity(regmap);
>  }
>  
> +static int abeoz9_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
> +{
> +	struct abeoz9_rtc_data *data = dev_get_drvdata(dev);
> +	struct regmap *regmap = data->regmap;
> +	u8 regs[ABEOZ9_ALARM_LEN];
> +	u8 val[2];
> +	int ret;
> +
> +	ret = abeoz9_check_validity(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_bulk_read(regmap, ABEOZ9_REG_CTRL_INT, val, sizeof(val));
> +	if (ret)
> +		return ret;
> +
> +	alarm->enabled = val[0] & ABEOZ9_REG_CTRL_INT_AIE;
> +	alarm->pending = val[1] & ABEOZ9_REG_CTRL_INT_FLAG_AF;
> +
> +	ret = regmap_bulk_read(regmap, ABEOZ9_REG_ALARM_SEC, regs, sizeof(regs));
> +	if (ret)
> +		return ret;
> +
> +	alarm->time.tm_sec = bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_SEC, regs[0]));
> +	alarm->time.tm_min = bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_MIN, regs[1]));
> +	alarm->time.tm_hour = bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_HOURS, regs[2]));
> +	if (FIELD_GET(ABEOZ9_BIT_ALARM_HOURS_PM, regs[2]))
> +		alarm->time.tm_hour += 12;
> +
> +	alarm->time.tm_mday = bcd2bin(FIELD_GET(ABEOZ9_BIT_ALARM_DAYS, regs[3]));
> +
> +	return 0;
> +}
> +
> +static int abeoz9_rtc_alarm_irq_enable(struct device *dev, u32 enable)
> +{
> +	struct abeoz9_rtc_data *data = dev_get_drvdata(dev);
> +
> +	return regmap_update_bits(data->regmap, ABEOZ9_REG_CTRL_INT,
> +				  ABEOZ9_REG_CTRL_INT_AIE,
> +				  FIELD_PREP(ABEOZ9_REG_CTRL_INT_AIE, enable));
> +}
> +
> +static int abeoz9_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
> +{
> +	struct abeoz9_rtc_data *data = dev_get_drvdata(dev);
> +	u8 regs[ABEOZ9_ALARM_LEN] = {0};
> +	int ret;
> +
> +	ret = regmap_update_bits(data->regmap, ABEOZ9_REG_CTRL_INT_FLAG,
> +				 ABEOZ9_REG_CTRL_INT_FLAG_AF, 0);
> +	if (ret)
> +		return ret;
> +
> +	regs[0] = ABEOZ9_BIT_ALARM_AE | FIELD_PREP(ABEOZ9_BIT_ALARM_SEC,
> +						   bin2bcd(alarm->time.tm_sec));
> +	regs[1] = ABEOZ9_BIT_ALARM_AE | FIELD_PREP(ABEOZ9_BIT_ALARM_MIN,
> +						   bin2bcd(alarm->time.tm_min));
> +	regs[2] = ABEOZ9_BIT_ALARM_AE | FIELD_PREP(ABEOZ9_BIT_ALARM_HOURS,
> +						   bin2bcd(alarm->time.tm_hour));
> +	regs[3] = ABEOZ9_BIT_ALARM_AE | FIELD_PREP(ABEOZ9_BIT_ALARM_DAYS,
> +						   bin2bcd(alarm->time.tm_mday));
> +
> +	ret = regmap_bulk_write(data->regmap, ABEOZ9_REG_ALARM_SEC, regs,
> +				sizeof(regs));
> +	if (ret)
> +		return ret;
> +
> +	ret = abeoz9_reset_validity(data->regmap);

This is not right, this must not be used unless the time set on the RTC
is correct which you don't know at that time.

> +	if (ret)
> +		return ret;
> +
> +	return abeoz9_rtc_alarm_irq_enable(dev, alarm->enabled);
> +}
> +
> +static irqreturn_t abeoz9_rtc_irq(int irq, void *dev)
> +{
> +	struct abeoz9_rtc_data *data = dev_get_drvdata(dev);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, ABEOZ9_REG_CTRL_INT_FLAG, &val);
> +	if (ret)
> +		return IRQ_NONE;
> +
> +	if (!FIELD_GET(ABEOZ9_REG_CTRL_INT_FLAG_AF, val))
> +		return IRQ_NONE;
> +
> +	regmap_update_bits(data->regmap, ABEOZ9_REG_CTRL_INT_FLAG,
> +			   ABEOZ9_REG_CTRL_INT_FLAG_AF, 0);
> +
> +	rtc_update_irq(data->rtc, 1, RTC_IRQF | RTC_AF);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int abeoz9_trickle_parse_dt(struct device_node *node)
>  {
>  	u32 ohms = 0;
> @@ -257,6 +372,14 @@ static const struct rtc_class_ops rtc_ops = {
>  	.set_time  = abeoz9_rtc_set_time,
>  };
>  
> +static const struct rtc_class_ops rtc_alarm_ops = {
> +	.read_time = abeoz9_rtc_get_time,
> +	.set_time = abeoz9_rtc_set_time,
> +	.read_alarm = abeoz9_rtc_read_alarm,
> +	.set_alarm = abeoz9_rtc_set_alarm,
> +	.alarm_irq_enable = abeoz9_rtc_alarm_irq_enable,
> +};
> +
>  static const struct regmap_config abeoz9_rtc_regmap_config = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
> @@ -416,6 +539,23 @@ static int abeoz9_probe(struct i2c_client *client,
>  	data->rtc->ops = &rtc_ops;
>  	data->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	data->rtc->range_max = RTC_TIMESTAMP_END_2099;
> +	data->rtc->uie_unsupported = 1;
> +
> +	if (client->irq > 0) {
> +		ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +						abeoz9_rtc_irq,
> +						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> +						dev_name(dev), dev);
> +		if (ret) {
> +			dev_err(dev, "failed to request alarm irq\n");
> +			return ret;
> +		}
> +	}
> +
> +	if (client->irq > 0 || device_property_read_bool(dev, "wakeup-source")) {
> +		ret = device_init_wakeup(dev, true);
> +		data->rtc->ops = &rtc_alarm_ops;
> +	}
>  
>  	ret = devm_rtc_register_device(data->rtc);
>  	if (ret)
> -- 
> 2.30.1.489.g328c10930387
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
