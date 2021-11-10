Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE05944C289
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Nov 2021 14:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbhKJN5J (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Nov 2021 08:57:09 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:42757 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231607AbhKJN5I (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Nov 2021 08:57:08 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 8DA7CE0009;
        Wed, 10 Nov 2021 13:54:17 +0000 (UTC)
Date:   Wed, 10 Nov 2021 14:54:17 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Camel Guo <camel.guo@axis.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, kernel@axis.com,
        Camel Guo <camelg@axis.com>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: rs5c372: Add RTC_VL_READ, RTC_VL_CLR ioctls
Message-ID: <YYvPCehWWVE5mKTy@piout.net>
References: <20211110115455.18699-1-camel.guo@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110115455.18699-1-camel.guo@axis.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 10/11/2021 12:54:54+0100, Camel Guo wrote:
> From: Camel Guo <camelg@axis.com>
> 
> In order to make it possible to get battery voltage status, this commit
> adds RTC_VL_READ, RTC_VL_CLR ioctl commands to rtc-rs5c372.
> 
> Signed-off-by: Camel Guo <camelg@axis.com>
> ---
>  drivers/rtc/rtc-rs5c372.c | 66 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
> index 80980414890c..5a96e5d3663a 100644
> --- a/drivers/rtc/rtc-rs5c372.c
> +++ b/drivers/rtc/rtc-rs5c372.c
> @@ -485,6 +485,71 @@ static int rs5c372_rtc_proc(struct device *dev, struct seq_file *seq)
>  #define	rs5c372_rtc_proc	NULL
>  #endif
>  
> +#ifdef CONFIG_RTC_INTF_DEV
> +static int rs5c372_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
> +{
> +	struct rs5c372	*rs5c = i2c_get_clientdata(to_i2c_client(dev));
> +	unsigned char	ctrl2;
> +	int		addr;
> +	unsigned int	flags;
> +
> +	dev_dbg(dev, "%s: cmd=%x\n", __func__, cmd);
> +
> +	addr = RS5C_ADDR(RS5C_REG_CTRL2);
> +	ctrl2 = i2c_smbus_read_byte_data(rs5c->client, addr);
> +
> +	switch (cmd) {
> +	case RTC_VL_READ:
> +		flags = 0;
> +
> +		switch (rs5c->type) {
> +		case rtc_r2025sd:
> +		case rtc_r2221tl:
> +			if ((rs5c->type == rtc_r2025sd && !(ctrl2 & R2x2x_CTRL2_XSTP)) ||
> +				(rs5c->type == rtc_r2221tl &&  (ctrl2 & R2x2x_CTRL2_XSTP))) {
> +				flags |= RTC_VL_DATA_INVALID;
> +			}
> +			if (ctrl2 & R2x2x_CTRL2_VDET)
> +				flags |= RTC_VL_ACCURACY_LOW;

Shouldn't that be RTC_VL_BACKUP_LOW?

> +			break;
> +		default:
> +			if (ctrl2 & RS5C_CTRL2_XSTP)
> +				flags |= RTC_VL_DATA_INVALID;
> +			break;
> +		}
> +
> +		return put_user(flags, (unsigned int __user *)arg);
> +	case RTC_VL_CLR:
> +		/* clear rtc VDET, PON and XSTP bits */
> +		switch (rs5c->type) {
> +		case rtc_r2025sd:
> +		case rtc_r2221tl:
> +			ctrl2 &= ~(R2x2x_CTRL2_VDET | R2x2x_CTRL2_PON);
> +			if (rs5c->type == rtc_r2025sd)
> +				ctrl2 |= R2x2x_CTRL2_XSTP;
> +			else
> +				ctrl2 &= ~R2x2x_CTRL2_XSTP;
> +			break;
> +		default:
> +			ctrl2 &= ~RS5C_CTRL2_XSTP;

You can clear VDET but you must nt clear PON or XSTP as they are used to
know whether the time on the RTC has been set correctly. Clearing those
can only be done in .set_time.

> +			break;
> +		}
> +
> +		if (i2c_smbus_write_byte_data(rs5c->client, addr, ctrl2) < 0) {
> +			dev_dbg(&rs5c->client->dev, "%s: write error in line %i\n",
> +					__func__, __LINE__);
> +			return -EIO;
> +		}
> +		return 0;
> +	default:
> +		return -ENOIOCTLCMD;
> +	}
> +	return 0;
> +}
> +#else
> +#define rs5c372_ioctl	NULL
> +#endif
> +
>  static const struct rtc_class_ops rs5c372_rtc_ops = {
>  	.proc		= rs5c372_rtc_proc,
>  	.read_time	= rs5c372_rtc_read_time,
> @@ -492,6 +557,7 @@ static const struct rtc_class_ops rs5c372_rtc_ops = {
>  	.read_alarm	= rs5c_read_alarm,
>  	.set_alarm	= rs5c_set_alarm,
>  	.alarm_irq_enable = rs5c_rtc_alarm_irq_enable,
> +	.ioctl		= rs5c372_ioctl,
>  };
>  
>  #if IS_ENABLED(CONFIG_RTC_INTF_SYSFS)
> -- 
> 2.20.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
