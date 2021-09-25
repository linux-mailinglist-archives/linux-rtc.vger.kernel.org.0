Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250C64184CA
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Sep 2021 23:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbhIYVz0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 25 Sep 2021 17:55:26 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:56021 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbhIYVzZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 25 Sep 2021 17:55:25 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id BA05D240005;
        Sat, 25 Sep 2021 21:53:47 +0000 (UTC)
Date:   Sat, 25 Sep 2021 23:53:47 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, dongas86@gmail.com, robh+dt@kernel.org,
        shawnguo@kernel.org, peng.fan@nxp.com,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH 2/2] rtc: imx-rpmsg: Add i.MX RPMSG RTC support
Message-ID: <YU+aa52b2zptByFu@piout.net>
References: <20210805033546.1390950-1-aisheng.dong@nxp.com>
 <20210805033546.1390950-3-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805033546.1390950-3-aisheng.dong@nxp.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 05/08/2021 11:35:46+0800, Dong Aisheng wrote:
> +static int rtc_send_message(struct rtc_rpmsg_info *info,
> +			    struct rtc_rpmsg_data *msg, bool ack)
> +{
> +	struct device *dev = &info->rpdev->dev;
> +	int err;
> +
> +	mutex_lock(&info->lock);
> +
> +	cpu_latency_qos_add_request(&info->pm_qos_req, 0);
> +	reinit_completion(&info->cmd_complete);
> +
> +	err = rpmsg_send(info->rpdev->ept, (void *)msg, sizeof(*msg));
> +	if (err) {
> +		dev_err(dev, "rpmsg send failed: %d\n", err);
> +		goto err_out;
> +	}
> +
> +	if (ack) {
> +		err = wait_for_completion_timeout(&info->cmd_complete,
> +						  msecs_to_jiffies(RPMSG_TIMEOUT));
> +		if (!err) {
> +			dev_err(dev, "rpmsg send timeout\n");
> +			err = -ETIMEDOUT;
> +			goto err_out;
> +		}
> +
> +		if (info->msg->ret != 0) {
> +			dev_err(dev, "rpmsg not ack %d\n", info->msg->ret);

This is very verbose and I guess nobody will ever read those, maybe use
dev_dbg?

> +			err = -EINVAL;
> +			goto err_out;
> +		}
> +
> +		err = 0;
> +	}
> +
> +err_out:
> +	cpu_latency_qos_remove_request(&info->pm_qos_req);
> +	mutex_unlock(&info->lock);
> +
> +	return err;
> +}
> +
> +static int imx_rpmsg_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct rtc_rpmsg_info *rtc_rpmsg = dev_get_drvdata(dev);
> +	struct rtc_rpmsg_data msg;
> +	int ret;
> +
> +	msg.header.cate = IMX_RPMSG_RTC;
> +	msg.header.major = IMX_RMPSG_MAJOR;
> +	msg.header.minor = IMX_RMPSG_MINOR;
> +	msg.header.type = RTC_RPMSG_SEND;
> +	msg.header.cmd = RTC_RPMSG_GET_TIME;
> +
> +	ret = rtc_send_message(rtc_rpmsg, &msg, true);
> +	if (ret)
> +		return ret;
> +

Is there a way to know when the time is invalid (e.g. it has not been
set yet)?

> +	rtc_time64_to_tm(rtc_rpmsg->msg->sec, tm);
> +
> +	return 0;
> +}
> +
> +static int imx_rpmsg_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct rtc_rpmsg_info *rtc_rpmsg = dev_get_drvdata(dev);
> +	struct rtc_rpmsg_data msg;
> +	unsigned long time;
> +	int ret;
> +
> +	time = rtc_tm_to_time64(tm);
> +
> +	msg.header.cate = IMX_RPMSG_RTC;
> +	msg.header.major = IMX_RMPSG_MAJOR;
> +	msg.header.minor = IMX_RMPSG_MINOR;
> +	msg.header.type = RTC_RPMSG_SEND;
> +	msg.header.cmd = RTC_RPMSG_SET_TIME;
> +	msg.sec = time;
> +
> +	ret = rtc_send_message(rtc_rpmsg, &msg, true);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int imx_rpmsg_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct rtc_rpmsg_info *rtc_rpmsg = dev_get_drvdata(dev);
> +	struct rtc_rpmsg_data msg;
> +	int ret;
> +
> +	msg.header.cate = IMX_RPMSG_RTC;
> +	msg.header.major = IMX_RMPSG_MAJOR;
> +	msg.header.minor = IMX_RMPSG_MINOR;
> +	msg.header.type = RTC_RPMSG_SEND;
> +	msg.header.cmd = RTC_RPMSG_GET_ALARM;
> +
> +	ret = rtc_send_message(rtc_rpmsg, &msg, true);
> +	if (ret)
> +		return ret;
> +
> +	rtc_time64_to_tm(rtc_rpmsg->msg->sec, &alrm->time);
> +	alrm->pending = rtc_rpmsg->msg->pending;
> +
> +	return 0;
> +}
> +
> +static int imx_rpmsg_rtc_alarm_irq_enable(struct device *dev,
> +	unsigned int enable)
> +{
> +	struct rtc_rpmsg_info *rtc_rpmsg = dev_get_drvdata(dev);
> +	struct rtc_rpmsg_data msg;
> +	int ret;
> +
> +	msg.header.cate = IMX_RPMSG_RTC;
> +	msg.header.major = IMX_RMPSG_MAJOR;
> +	msg.header.minor = IMX_RMPSG_MINOR;
> +	msg.header.type = RTC_RPMSG_SEND;
> +	msg.header.cmd = RTC_RPMSG_ENABLE_ALARM;
> +	msg.enable = enable;
> +
> +	ret = rtc_send_message(rtc_rpmsg, &msg, true);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int imx_rpmsg_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct rtc_rpmsg_info *rtc_rpmsg = dev_get_drvdata(dev);
> +	struct rtc_rpmsg_data msg;
> +	unsigned long time;
> +	int ret;
> +
> +	time = rtc_tm_to_time64(&alrm->time);
> +
> +	msg.header.cate = IMX_RPMSG_RTC;
> +	msg.header.major = IMX_RMPSG_MAJOR;
> +	msg.header.minor = IMX_RMPSG_MINOR;
> +	msg.header.type = RTC_RPMSG_SEND;
> +	msg.header.cmd = RTC_RPMSG_SET_ALARM;
> +	msg.sec = time;
> +	msg.enable = alrm->enabled;
> +
> +	ret = rtc_send_message(rtc_rpmsg, &msg, true);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct rtc_class_ops imx_rpmsg_rtc_ops = {
> +	.read_time = imx_rpmsg_rtc_read_time,
> +	.set_time = imx_rpmsg_rtc_set_time,
> +	.read_alarm = imx_rpmsg_rtc_read_alarm,
> +	.set_alarm = imx_rpmsg_rtc_set_alarm,
> +	.alarm_irq_enable = imx_rpmsg_rtc_alarm_irq_enable,
> +};
> +
> +static int rtc_rpmsg_probe(struct rpmsg_device *rpdev)
> +{
> +	struct device *dev = &rpdev->dev;
> +	struct rtc_rpmsg_info *rtc_rpmsg;
> +
> +	dev_info(dev, "new channel: 0x%x -> 0x%x\n", rpdev->src, rpdev->dst);
> +

Same comment, please try to cut down on the number of strings in the
driver, your customers will thank you.

> +	rtc_rpmsg = devm_kzalloc(dev, sizeof(*rtc_rpmsg), GFP_KERNEL);
> +	if (!rtc_rpmsg)
> +		return -ENOMEM;
> +
> +	rtc_rpmsg->rpdev = rpdev;
> +	mutex_init(&rtc_rpmsg->lock);
> +	init_completion(&rtc_rpmsg->cmd_complete);
> +
> +	dev_set_drvdata(dev, rtc_rpmsg);
> +
> +	device_init_wakeup(dev, true);
> +
> +	rtc_rpmsg->rtc = devm_rtc_device_register(dev, "rtc-rpmsg",
> +						  &imx_rpmsg_rtc_ops,
> +						  THIS_MODULE);
> +	if (IS_ERR(rtc_rpmsg->rtc)) {
> +		dev_err(dev, "failed to register rtc rpmsg: %ld\n", PTR_ERR(rtc_rpmsg->rtc));
> +		return PTR_ERR(rtc_rpmsg->rtc);
> +	}

Please use devm_rtc_allocate_device/devm_rtc_register_device. Also, it
would be nice to set .range_min and .range_max if you actually know what
the underlying RTC supports.

> +
> +	return 0;
> +}
> +
> +static void rtc_rpmsg_remove(struct rpmsg_device *rpdev)
> +{
> +	dev_info(&rpdev->dev, "rtc rpmsg driver is removed\n");

Seriously, drop this function...

> +}
> +
> +static int rtc_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
> +			void *priv, u32 src)
> +{
> +	struct rtc_rpmsg_info *rtc_rpmsg = dev_get_drvdata(&rpdev->dev);
> +	struct rtc_rpmsg_data *msg = (struct rtc_rpmsg_data *)data;
> +
> +	rtc_rpmsg->msg = msg;
> +
> +	if (msg->header.type == RTC_RPMSG_RECEIVE)
> +		complete(&rtc_rpmsg->cmd_complete);
> +	else if (msg->header.type == RTC_RPMSG_NOTIFY)
> +		rtc_update_irq(rtc_rpmsg->rtc, 1, RTC_IRQF);
> +	else
> +		dev_err(&rpdev->dev, "wrong command type!\n");
> +
> +	return 0;
> +}
> +
> +static const struct rpmsg_device_id rtc_rpmsg_id_table[] = {
> +	{ .name	= "rpmsg-rtc-channel" },
> +	{ },
> +};
> +
> +static struct rpmsg_driver rtc_rpmsg_driver = {
> +	.drv.name	= "imx_rtc_rpmsg",
> +	.probe		= rtc_rpmsg_probe,
> +	.remove		= rtc_rpmsg_remove,
> +	.callback	= rtc_rpmsg_cb,
> +	.id_table	= rtc_rpmsg_id_table,
> +};
> +
> +/*
> + * imx m4 has a limitation that we can't read data during ns process.
> + * So register rtc a little bit late as rtc core will read data during
> + * register process
> + */
> +static int __init rtc_rpmsg_init(void)
> +{
> +	return register_rpmsg_driver(&rtc_rpmsg_driver);
> +}
> +late_initcall(rtc_rpmsg_init);
> +
> +MODULE_AUTHOR("Dong Aisheng <aisheng.dong@nxp.com>");
> +MODULE_DESCRIPTION("NXP i.MX RPMSG RTC Driver");
> +MODULE_ALIAS("platform:imx_rtc_rpmsg");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/firmware/imx/rpmsg.h b/include/linux/firmware/imx/rpmsg.h
> new file mode 100644
> index 000000000000..20bcce23c917
> --- /dev/null
> +++ b/include/linux/firmware/imx/rpmsg.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2019-2021 NXP.
> + */
> +
> +#ifndef __LINUX_IMX_RPMSG_H__
> +#define __LINUX_IMX_RPMSG_H__
> +
> +#include <linux/types.h>
> +
> +/*
> + * Global header file for iMX RPMSG
> + */
> +
> +/* Category define */
> +#define IMX_RMPSG_LIFECYCLE     1
> +#define IMX_RPMSG_PMIC          2
> +#define IMX_RPMSG_AUDIO         3
> +#define IMX_RPMSG_KEY           4
> +#define IMX_RPMSG_GPIO          5
> +#define IMX_RPMSG_RTC           6
> +#define IMX_RPMSG_SENSOR        7
> +
> +/* rpmsg version */
> +#define IMX_RMPSG_MAJOR         1
> +#define IMX_RMPSG_MINOR         0
> +
> +struct imx_rpmsg_head {
> +	u8 cate;
> +	u8 major;
> +	u8 minor;
> +	u8 type;
> +	u8 cmd;
> +	u8 reserved[5];
> +} __packed;
> +
> +#endif /* __LINUX_IMX_RPMSG_H__ */
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
