Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1EF3E1001
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Aug 2021 10:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239251AbhHEIN5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Aug 2021 04:13:57 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:38213 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237051AbhHEIN5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Aug 2021 04:13:57 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0DCF7FF804;
        Thu,  5 Aug 2021 08:13:40 +0000 (UTC)
Date:   Thu, 5 Aug 2021 10:13:40 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, dongas86@gmail.com, robh+dt@kernel.org,
        shawnguo@kernel.org, peng.fan@nxp.com,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH 2/2] rtc: imx-rpmsg: Add i.MX RPMSG RTC support
Message-ID: <YQudtCoUhjZYEt/l@piout.net>
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
> Add i.MX RPMSG RTC support.
> 

You definitively need to elaborate why this is necessary and why
rtc-imx-sc.c has not been reused. I'm not going to take a new driver for
each version of the CM4 firmware.

> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  drivers/rtc/Kconfig                |  10 +
>  drivers/rtc/Makefile               |   1 +
>  drivers/rtc/rtc-imx-rpmsg.c        | 301 +++++++++++++++++++++++++++++
>  include/linux/firmware/imx/rpmsg.h |  37 ++++
>  4 files changed, 349 insertions(+)
>  create mode 100644 drivers/rtc/rtc-imx-rpmsg.c
>  create mode 100644 include/linux/firmware/imx/rpmsg.h
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 12153d5801ce..f0e6c4dd8965 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1763,6 +1763,16 @@ config RTC_DRV_SNVS
>  	   This driver can also be built as a module, if so, the module
>  	   will be called "rtc-snvs".
>  
> +config RTC_DRV_IMX_RPMSG
> +	tristate "NXP RPMSG RTC support"
> +	select RPMSG_VIRTIO
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on IMX_REMOTEPROC
> +	depends on OF
> +	help
> +	   If you say yes here you get support for the NXP RPMSG
> +	   RTC module.
> +
>  config RTC_DRV_IMX_SC
>  	depends on IMX_SCU
>  	depends on HAVE_ARM_SMCCC
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 2dd0dd956b0e..9cebfddcc245 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -72,6 +72,7 @@ obj-$(CONFIG_RTC_DRV_GOLDFISH)	+= rtc-goldfish.o
>  obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) += rtc-hid-sensor-time.o
>  obj-$(CONFIG_RTC_DRV_HYM8563)	+= rtc-hym8563.o
>  obj-$(CONFIG_RTC_DRV_IMXDI)	+= rtc-imxdi.o
> +obj-$(CONFIG_RTC_DRV_IMX_RPMSG)	+= rtc-imx-rpmsg.o
>  obj-$(CONFIG_RTC_DRV_IMX_SC)	+= rtc-imx-sc.o
>  obj-$(CONFIG_RTC_DRV_ISL12022)	+= rtc-isl12022.o
>  obj-$(CONFIG_RTC_DRV_ISL12026)	+= rtc-isl12026.o
> diff --git a/drivers/rtc/rtc-imx-rpmsg.c b/drivers/rtc/rtc-imx-rpmsg.c
> new file mode 100644
> index 000000000000..0d6d4b18159e
> --- /dev/null
> +++ b/drivers/rtc/rtc-imx-rpmsg.c
> @@ -0,0 +1,301 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2017-2021 NXP
> + */
> +
> +#include <linux/firmware/imx/rpmsg.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pm_qos.h>
> +#include <linux/rpmsg.h>
> +#include <linux/rtc.h>
> +
> +#define RPMSG_TIMEOUT 1000
> +
> +#define RTC_RPMSG_SEND		0x0
> +#define RTC_RPMSG_RECEIVE	0x1
> +#define RTC_RPMSG_NOTIFY	0x2
> +
> +enum rtc_rpmsg_cmd {
> +	RTC_RPMSG_SET_TIME,
> +	RTC_RPMSG_GET_TIME,
> +	RTC_RPMSG_SET_ALARM,
> +	RTC_RPMSG_GET_ALARM,
> +	RTC_RPMSG_ENABLE_ALARM,
> +};
> +
> +struct rtc_rpmsg_data {
> +	struct imx_rpmsg_head header;
> +	u8 reserved0;
> +	union {
> +		u8 reserved1;
> +		u8 ret;
> +	};
> +	union {
> +		u32 reserved2;
> +		u32 sec;
> +	};
> +	union {
> +		u8 enable;
> +		u8 reserved3;
> +	};
> +	union {
> +		u8 pending;
> +		u8 reserved4;
> +	};
> +} __packed;
> +
> +struct rtc_rpmsg_info {
> +	struct rpmsg_device *rpdev;
> +	struct rtc_rpmsg_data *msg;
> +	struct pm_qos_request pm_qos_req;
> +	struct completion cmd_complete;
> +	struct mutex lock;
> +	struct rtc_device *rtc;
> +};
> +
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
> +
> +	return 0;
> +}
> +
> +static void rtc_rpmsg_remove(struct rpmsg_device *rpdev)
> +{
> +	dev_info(&rpdev->dev, "rtc rpmsg driver is removed\n");
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
