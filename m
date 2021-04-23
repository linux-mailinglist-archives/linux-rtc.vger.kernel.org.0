Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFB4369B5B
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Apr 2021 22:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhDWUfD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Apr 2021 16:35:03 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:45103 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232689AbhDWUfA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 23 Apr 2021 16:35:00 -0400
X-Originating-IP: 176.182.47.85
Received: from localhost (static-176-182-47-85.ncc.abo.bbox.fr [176.182.47.85])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 58AC760005;
        Fri, 23 Apr 2021 20:34:18 +0000 (UTC)
Date:   Fri, 23 Apr 2021 22:34:17 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dianlong Li <long17.cool@aliyun.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: sd3078: add alarm support
Message-ID: <YIMvSVoaOxu/kjun@piout.net>
References: <20201230130615.6417-1-long17.cool@aliyun.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230130615.6417-1-long17.cool@aliyun.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

Sorry for the late review, I was note sure how it was related to the
previous one as it was not labelled v2.

On 30/12/2020 13:06:15+0000, Dianlong Li wrote:
> Add alarm support for the sd3078.
> 
> Signed-off-by: Dianlong Li <long17.cool@aliyun.com>
> ---
>  drivers/rtc/rtc-sd3078.c | 235 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 235 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c
> index a7aa943c1183..d80e7033e005 100644
> --- a/drivers/rtc/rtc-sd3078.c
> +++ b/drivers/rtc/rtc-sd3078.c
> @@ -27,6 +27,31 @@
>  #define KEY_WRITE2		0x04
>  #define KEY_WRITE3		0x80
>  
> +#define SD3078_ALARM_SC			0x07
> +#define SD3078_ALARM_MN			0x08
> +#define SD3078_ALARM_HR			0x09
> +#define SD3078_ALARM_DW			0x0A
> +#define SD3078_ALARM_DM			0x0B
> +#define SD3078_ALARM_MO			0x0C
> +#define SD3078_ALARM_YR			0x0D
> +#define SD3078_ALARM_EN			0x0E
> +
> +#define BIT_IM					0x40
> +#define BIT_INTS1				0x20
> +#define BIT_INTS0				0x10
> +#define BIT_INTDE				0x04
> +#define BIT_INTAE				0x02
> +#define BIT_INTFE				0x01
> +#define BIT_INTAF				0x20
> +
> +#define BIT_EN_EAD				0x10
> +#define BIT_EN_EAH				0x04
> +#define BIT_EN_EAMN				0x02
> +#define BIT_EN_EAS				0x01
> +


Please use BIT() for all of those defines

> +#define INT_BITS	(BIT_IM | BIT_INTS1 | BIT_INTS0 | \
> +			BIT_INTDE | BIT_INTAE | BIT_INTFE)
> +

You can use GENMASK and the name should probably be INT_MSK.

>  #define NUM_TIME_REGS   (SD3078_REG_YR - SD3078_REG_SC + 1)
>  
>  /*
> @@ -39,6 +64,8 @@
>  struct sd3078 {
>  	struct rtc_device	*rtc;
>  	struct regmap		*regmap;
> +	bool			suspended;

Is this variable really useful?

> +	struct i2c_client	*client;
>  };
>  
>  /*
> @@ -152,9 +179,156 @@ static int sd3078_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	return 0;
>  }
>  
> +static int sd3078_alarm_irq_enable(struct device *dev, unsigned int enabled)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct sd3078 *sd3078 = i2c_get_clientdata(client);
> +
> +	if (client->irq <= 0)
> +		return -EINVAL;
> +

This check is unnecessary

> +	if (enabled) {
> +		/*
> +		 * CTRL2
> +		 * :IM(bit6)
> +		 *    0 : single event alarm
> +		 *        Output low level until INTAF bit is cleared.
> +		 *    1 : periodic alarm
> +		 *        Output low-level active pulses with 250ms width
> +		 *        until the interrupt enable bit is cleared
> +		 *
> +		 * :INTS1(bit5) :INTS0(bit4)
> +		 *       0          0     : battery alarm
> +		 *       0          1     : alarm interrupt output
> +		 *       1          0     : frequency interrupt output
> +		 *       1          1     : countdown interrupt output
> +		 *
> +		 * :INTDE(bit2)
> +		 *       0/1 : enable/disable countdown interrupt
> +		 *
> +		 * :INTFE(bit1)
> +		 *       0/1 : enable/disable frequency interrupt
> +		 *
> +		 * :INTAE(bit0)
> +		 *       0/1 : enable/disable alarm interrupt
> +		 */
> +
> +		regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL2,
> +				   INT_BITS, BIT_INTS0 | BIT_INTAE);
> +		enable_irq(client->irq);

You should not have to enable and disable irqs.

> +	} else {
> +		regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL2,
> +				   INT_BITS, 0);
> +		disable_irq(client->irq);
> +	}
> +
> +	return 0;
> +}
> +
> +static int sd3078_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
> +{
> +	unsigned char hour;
> +	int value;
> +	unsigned char alarm_data[NUM_TIME_REGS] = {0};
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct sd3078 *sd3078 = i2c_get_clientdata(client);
> +	int ret;
> +
> +	ret = regmap_bulk_read(sd3078->regmap, SD3078_ALARM_SC, alarm_data,
> +			       NUM_TIME_REGS);
> +	if (ret < 0)
> +		return ret;
> +
> +	alarm->time.tm_sec = bcd2bin(alarm_data[SD3078_ALARM_SC - SD3078_ALARM_SC] & 0x7F);
> +	alarm->time.tm_min = bcd2bin(alarm_data[SD3078_ALARM_MN - SD3078_ALARM_SC] & 0x7F);
> +
> +	/*
> +	 * The sd3078 supports 12/24 hour mode.
> +	 * When getting time,
> +	 * we need to convert the 12 hour mode to the 24 hour mode.
> +	 */
> +	hour = alarm_data[SD3078_ALARM_HR - SD3078_ALARM_SC];
> +	if (hour & 0x80) /* 24H MODE */
> +		alarm->time.tm_hour = bcd2bin(hour & 0x3F);
> +	else if (hour & 0x20) /* 12H MODE PM */
> +		alarm->time.tm_hour = bcd2bin(hour & 0x1F) + 12;
> +	else /* 12H MODE AM */
> +		alarm->time.tm_hour = bcd2bin(hour & 0x1F);
> +
> +	alarm->time.tm_mday = bcd2bin(alarm_data[SD3078_ALARM_DM - SD3078_ALARM_SC] & 0x3F);
> +	alarm->time.tm_wday = alarm_data[SD3078_ALARM_DW - SD3078_ALARM_SC] & 0x07;
> +	alarm->time.tm_mon  = bcd2bin(alarm_data[SD3078_ALARM_MO - SD3078_ALARM_SC] & 0x1F) - 1;
> +	alarm->time.tm_year = bcd2bin(alarm_data[SD3078_ALARM_YR - SD3078_ALARM_SC]) + 100;
> +
> +	ret = regmap_read(sd3078->regmap, SD3078_REG_CTRL2, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	if ((value & (INT_BITS)) == (BIT_INTS0 | BIT_INTAE))
> +		alarm->enabled = 1;
> +	else
> +		alarm->enabled = 0;
> +
> +	ret = regmap_read(sd3078->regmap, SD3078_REG_CTRL1, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	if ((value & (BIT_INTAF)) == BIT_INTAF)
> +		alarm->pending = 1;
> +	else
> +		alarm->pending = 0;
> +
> +	return 0;
> +}
> +
> +static int sd3078_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
> +{
> +	unsigned char alarm_data[NUM_TIME_REGS];
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct sd3078 *sd3078 = i2c_get_clientdata(client);
> +	int ret;
> +
> +	alarm_data[SD3078_ALARM_SC - SD3078_ALARM_SC] = bin2bcd(alarm->time.tm_sec);
> +	alarm_data[SD3078_ALARM_MN - SD3078_ALARM_SC] = bin2bcd(alarm->time.tm_min);
> +	alarm_data[SD3078_ALARM_HR - SD3078_ALARM_SC] = bin2bcd(alarm->time.tm_hour) | 0x80;
> +	alarm_data[SD3078_ALARM_DM - SD3078_ALARM_SC] = bin2bcd(alarm->time.tm_mday);
> +
> +#if WRITE_PROTECT_EN
> +	sd3078_enable_reg_write(sd3078);
> +#endif
> +
> +	ret = regmap_bulk_write(sd3078->regmap, SD3078_ALARM_SC, alarm_data,
> +				SD3078_ALARM_DM - SD3078_ALARM_SC + 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * set the day, hour, minute and second alarm enable
> +	 * this operation will clear the alarm interrupt flag
> +	 */
> +	ret = regmap_update_bits(sd3078->regmap, SD3078_ALARM_EN,
> +				 BIT_EN_EAD | BIT_EN_EAH | BIT_EN_EAMN | BIT_EN_EAS,
> +				 BIT_EN_EAD | BIT_EN_EAH | BIT_EN_EAMN | BIT_EN_EAS);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = sd3078_alarm_irq_enable(dev, alarm->enabled);
> +	if (ret < 0)
> +		return ret;
> +
> +#if WRITE_PROTECT_EN
> +	sd3078_disable_reg_write(sd3078);
> +#endif
> +
> +	return 0;
> +}
> +
>  static const struct rtc_class_ops sd3078_rtc_ops = {
>  	.read_time	= sd3078_rtc_read_time,
>  	.set_time	= sd3078_rtc_set_time,
> +	.read_alarm	= sd3078_rtc_read_alarm,
> +	.set_alarm	= sd3078_rtc_set_alarm,
> +	.alarm_irq_enable = sd3078_alarm_irq_enable,
>  };
>  
>  static const struct regmap_config regmap_config = {
> @@ -163,6 +337,19 @@ static const struct regmap_config regmap_config = {
>  	.max_register = 0x11,
>  };
>  
> +static irqreturn_t sd3078_threaded_irq(int irq, void *dev_id)
> +{
> +	struct i2c_client *client = dev_id;
> +	struct sd3078 *sd3078 = i2c_get_clientdata(client);
> +
> +	/* clean interrupt flag */
> +	regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL1,
> +			   BIT_INTAF, 0);

You should probably check whether the interrupt really happened, that
would allow to share the interrupt line.

> +
> +	rtc_update_irq(sd3078->rtc, 1, RTC_AF | RTC_IRQF);
> +	return IRQ_HANDLED;
> +}
> +
>  static int sd3078_probe(struct i2c_client *client,
>  			const struct i2c_device_id *id)
>  {
> @@ -176,6 +363,8 @@ static int sd3078_probe(struct i2c_client *client,
>  	if (!sd3078)
>  		return -ENOMEM;
>  
> +	sd3078->client = client;
> +
>  	sd3078->regmap = devm_regmap_init_i2c(client, &regmap_config);
>  	if (IS_ERR(sd3078->regmap)) {
>  		dev_err(&client->dev, "regmap allocation failed\n");
> @@ -183,6 +372,7 @@ static int sd3078_probe(struct i2c_client *client,
>  	}
>  
>  	i2c_set_clientdata(client, sd3078);
> +	dev_set_drvdata(&client->dev, sd3078);
>  
>  	sd3078->rtc = devm_rtc_allocate_device(&client->dev);
>  	if (IS_ERR(sd3078->rtc))
> @@ -196,11 +386,55 @@ static int sd3078_probe(struct i2c_client *client,
>  	if (ret)
>  		return ret;
>  
> +	if (client->irq) {
> +		ret = devm_request_threaded_irq(&client->dev, client->irq,
> +						NULL, sd3078_threaded_irq,
> +						IRQF_ONESHOT | IRQF_TRIGGER_FALLING,

I don't have the datasheet but are you sure this shouldn't be
IRQF_TRIGGER_LOW.

> +						client->name, client);
> +		if (ret)
> +			dev_err(&client->dev, "unable to request IRQ\n");
> +	}
> +
> +	if (!device_can_wakeup(&client->dev))
> +		device_init_wakeup(&client->dev, 1);

You should call that only if the irq is present and has been requested

You should also
clear_bit(RTC_FEATURE_ALARM, sd3078->rtc->features) when there is no
alarm.

> +
>  	sd3078_enable_reg_write(sd3078);
>  
>  	return 0;
>  }
>  
> +#if CONFIG_PM_SLEEP
> +static int sd3078_suspend(struct device *dev)
> +{
> +	struct sd3078 *sd3078 = dev_get_drvdata(dev);
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	if (client->irq >= 0 && device_may_wakeup(dev)) {
> +		sd3078->suspended = true;
> +		enable_irq_wake(client->irq);
> +	}
> +
> +	return 0;
> +}
> +
> +static int sd3078_resume(struct device *dev)
> +{
> +	struct sd3078 *sd3078 = dev_get_drvdata(dev);
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	if (client->irq >= 0 && device_may_wakeup(dev)) {
> +		sd3078->suspended = false;
> +		disable_irq_wake(client->irq);
> +	}
> +
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops sd3078_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(sd3078_suspend, sd3078_resume)
> +};
> +
>  static const struct i2c_device_id sd3078_id[] = {
>  	{"sd3078", 0},
>  	{ }
> @@ -217,6 +451,7 @@ static struct i2c_driver sd3078_driver = {
>  	.driver     = {
>  		.name   = "sd3078",
>  		.of_match_table = of_match_ptr(rtc_dt_match),
> +		.pm = &sd3078_pm_ops,
>  	},
>  	.probe      = sd3078_probe,
>  	.id_table   = sd3078_id,
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
