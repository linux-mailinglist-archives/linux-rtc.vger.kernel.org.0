Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1549C44C1CE
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Nov 2021 14:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231830AbhKJNHE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Nov 2021 08:07:04 -0500
Received: from smtp1.axis.com ([195.60.68.17]:43568 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231679AbhKJNHD (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 10 Nov 2021 08:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636549457;
  x=1668085457;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=nU3nv8rOCy8pYPsaPbC1Tl2lc1EFo7HiiaRCokA64wI=;
  b=Rdt5pyaqRK6HVwsW5YRRhVi8Elb8G6TFpgZHGrLzGLCQtoyVGTpeh2M+
   3RZtmIJqxxshDoK+Lgvpy+12UmCMRUimxpmEWxLOpsakTkYeJwq5f603a
   RVZllvsMDf00gNJ9gWDRmp5y0JgCbVPF6SYwS2rj2HVoRD9JPQ5hyAZGo
   IVVOA3Yd9PMW/weWNAdVIGmfRmMdqGNRz297wvID81w5bcpYWRk+O/q1t
   ZJqZVRdmOB04I7vTTwyQjYeaWXJxAipoCsr5d5/B0b4xwlnCZghLZLNhh
   C9bsjnLJxd6RirpxwpqFegZGRTysc7JkJZmXC2Lg5MmNhO6pKGl3sOxRy
   A==;
Subject: Re: [PATCH] rtc: rs5c372: Add support of RTC_VL_READ ioctl
To:     Pavel Modilaynen <pavel.modilaynen@axis.com>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@axis.com>, Pavel Modilaynen <pavelmn@axis.com>
References: <20211105004049.5486-1-pavel.modilaynen@axis.com>
From:   Camel Guo <camelg@axis.com>
Message-ID: <bf954e46-700c-48f4-ee51-65733f643a18@axis.com>
Date:   Wed, 10 Nov 2021 14:03:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20211105004049.5486-1-pavel.modilaynen@axis.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail03w.axis.com
 (10.20.40.9)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

After discussion internally on this patch, we would like to abandon this 
patch and purpose this one 
https://lore.kernel.org/linux-rtc/20211110115455.18699-1-camel.guo@axis.com/T/#u 
instead. Sorry for the inconvenience and please review that patch instead.

Best Regards
Camel Guo

On 11/5/21 1:40 AM, Pavel Modilaynen wrote:
> From: Pavel Modilaynen <pavelmn@lnxpavelmn.se.axis.com>
> 
> Read, cache and expose with RTC_VL_READ ioctl low voltage
> detection flag. It is supported on all devices except RS5C372A/B,
> for which osciallation halt detection bit is interpreted
> as low voltage condition.
> Add RTC_VL_CLEAR ioctl to clear the cached value.
> 
> Signed-off-by: Pavel Modilaynen <pavelmn@lnxpavelmn.se.axis.com>
> ---
>   drivers/rtc/rtc-rs5c372.c | 46 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
> index 80980414890c..68d2ed9670c4 100644
> --- a/drivers/rtc/rtc-rs5c372.c
> +++ b/drivers/rtc/rtc-rs5c372.c
> @@ -126,6 +126,7 @@ struct rs5c372 {
>   	unsigned		smbus:1;
>   	char			buf[17];
>   	char			*regs;
> +	int			voltage_low;
>   };
>   
>   static int rs5c_get_regs(struct rs5c372 *rs5c)
> @@ -216,22 +217,40 @@ static int rs5c372_rtc_read_time(struct device *dev, struct rtc_time *tm)
>   	if (status < 0)
>   		return status;
>   
> +	/* check the warning bits */
>   	switch (rs5c->type) {
>   	case rtc_r2025sd:
>   	case rtc_r2221tl:
>   		if ((rs5c->type == rtc_r2025sd && !(ctrl2 & R2x2x_CTRL2_XSTP)) ||
>   		    (rs5c->type == rtc_r2221tl &&  (ctrl2 & R2x2x_CTRL2_XSTP))) {
>   			dev_warn(&client->dev, "rtc oscillator interruption detected. Please reset the rtc clock.\n");
> +			/* keep it as indicator of low/dead battery */
> +			rs5c->voltage_low = 1;
>   			return -EINVAL;
>   		}
>   		break;
>   	default:
>   		if (ctrl2 & RS5C_CTRL2_XSTP) {
>   			dev_warn(&client->dev, "rtc oscillator interruption detected. Please reset the rtc clock.\n");
> +			/* keep it as indicator of low/dead battery */
> +			rs5c->voltage_low = 1;
>   			return -EINVAL;
>   		}
>   	}
>   
> +
> +	switch (rs5c->type) {
> +	case rtc_rs5c372a:
> +	case rtc_rs5c372b:
> +		break;
> +	default:
> +		if (ctrl2 & R2x2x_CTRL2_VDET) {
> +			rs5c->voltage_low = 1;
> +			dev_warn(&client->dev, "low voltage detected\n");
> +		}
> +		break;
> +	}
> +
>   	tm->tm_sec = bcd2bin(rs5c->regs[RS5C372_REG_SECS] & 0x7f);
>   	tm->tm_min = bcd2bin(rs5c->regs[RS5C372_REG_MINS] & 0x7f);
>   	tm->tm_hour = rs5c_reg2hr(rs5c, rs5c->regs[RS5C372_REG_HOURS]);
> @@ -485,6 +504,32 @@ static int rs5c372_rtc_proc(struct device *dev, struct seq_file *seq)
>   #define	rs5c372_rtc_proc	NULL
>   #endif
>   
> +#ifdef CONFIG_RTC_INTF_DEV
> +static int rs5c372_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
> +{
> +	struct rs5c372	*rs5c = i2c_get_clientdata(to_i2c_client(dev));
> +
> +	dev_dbg(dev, "%s: cmd=%x\n", __func__, cmd);
> +
> +	switch (cmd) {
> +	case RTC_VL_READ:
> +		if (rs5c->voltage_low)
> +			dev_info(dev, "low voltage detected, date/time is not reliable.\n");
> +
> +		return put_user(rs5c->voltage_low, (unsigned int __user *)arg);
> +	case RTC_VL_CLR:
> +		/* Clear the cached value. */
> +		rs5c->voltage_low = 0;
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
>   static const struct rtc_class_ops rs5c372_rtc_ops = {
>   	.proc		= rs5c372_rtc_proc,
>   	.read_time	= rs5c372_rtc_read_time,
> @@ -492,6 +537,7 @@ static const struct rtc_class_ops rs5c372_rtc_ops = {
>   	.read_alarm	= rs5c_read_alarm,
>   	.set_alarm	= rs5c_set_alarm,
>   	.alarm_irq_enable = rs5c_rtc_alarm_irq_enable,
> +	.ioctl		= rs5c372_ioctl,
>   };
>   
>   #if IS_ENABLED(CONFIG_RTC_INTF_SYSFS)
> 
