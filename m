Return-Path: <linux-rtc+bounces-1785-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 062D5965C6F
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 11:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A7BA1C2301A
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 09:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F1F16F0EF;
	Fri, 30 Aug 2024 09:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZhkbFYbm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224FE16B38B;
	Fri, 30 Aug 2024 09:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725009153; cv=none; b=NigvoMBltPpjncnPUm6BYglWpr+gP4RcZpcFUdUblf3y8iQ2fwv9LHkksbt/ucKKo3zSVvDuj/3z6B3zjSLz8FqXAs6/xiyTNVN48e7xT7w1UCSH+eL2sFW1WosP6CfuSFt9MstZhEhz7F6j9vx+dYhkfxZf9WxsVyphRUfGShQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725009153; c=relaxed/simple;
	bh=agAtE8M5kmHPbkaNmSjJdlcJf9kGlItbmXyqkA4thTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZ3GB+Eq1u5Pz+AyxxumDGJI07zE4edT6Ani2nUMDYF52x3VM8bOleBR/TPV5UxTUc0SlIdj3ABFxFzjleCdKWUJqF9LAfRYW5U2omBVplpfS5bs2wChlA2NWjtLBy6ToUKQ8oFobSUl5LNZXPSaPdkVMZeggDT9A2/jXs9qzy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZhkbFYbm; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CBD0C000C;
	Fri, 30 Aug 2024 09:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725009148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q9w4JXGVUDfCHG44p/gNqJPQzwFzQTXY2yzqJw+LRhc=;
	b=ZhkbFYbmhVT4PVdcsOJNTFZr0w2D296KUj3PlypOBQtTOzVDfSqzJHX8RmpQZPDJAwTu3X
	IkeFKeyjpPs4iIcTXmUZcIBSgRN6CMFm1pscHn7nTv2X7qz+iofcfS+CTDbtXzGaa/NSL/
	/S/BxbTMVWEZT5TtdMonmuiVJO3WuEOHTVWkTuAgmAZlvl44aZzbE0/HhTbGyGUUIpD2Vg
	Ew8XvR4gCCJocTYQEtYNCLs6p06EMCc7wXT3QQ70KQwVC0jlR+GA7vXjMYHYL3jTocK1RP
	Qy5iKt5PN53XWQ2IYIo5d5V+ufqHQuiETHuZiHIQdZ+aHn7VMqG2h9iVWvlGog==
Date: Fri, 30 Aug 2024 11:12:27 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-rtc@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v8 6/7] rtc: support i.MX95 BBM RTC
Message-ID: <2024083009122744d5f26a@mail.local>
References: <20240823-imx95-bbm-misc-v2-v8-0-e600ed9e9271@nxp.com>
 <20240823-imx95-bbm-misc-v2-v8-6-e600ed9e9271@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823-imx95-bbm-misc-v2-v8-6-e600ed9e9271@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 23/08/2024 17:05:22+0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The BBM module provides RTC feature. To i.MX95, this module is managed by
> System Manager and exported System Control Management Interface(SCMI).
> Linux could use i.MX SCMI BBM Extension protocol to use RTC feature.
> 
> This driver is to use SCMI interface to get/set RTC.
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/rtc/Kconfig          |   8 +++
>  drivers/rtc/Makefile         |   1 +
>  drivers/rtc/rtc-imx-sm-bbm.c | 162 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 171 insertions(+)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index b3469f6986e9..ea416938ad24 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1827,6 +1827,14 @@ config RTC_DRV_BBNSM
>  	   This driver can also be built as a module, if so, the module
>  	   will be called "rtc-bbnsm".
>  
> +config RTC_DRV_IMX_BBM_SCMI
> +	depends on IMX_SCMI_BBM_EXT || COMPILE_TEST
> +	default y if ARCH_MXC
> +	tristate "NXP i.MX BBM SCMI RTC support"
> +	help
> +	   If you say yes here you get support for the NXP i.MX BBSM SCMI
> +	   RTC module.
> +
>  config RTC_DRV_IMX_SC
>  	depends on IMX_SCU
>  	depends on HAVE_ARM_SMCCC
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 3004e372f25f..8ee79cb18322 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -74,6 +74,7 @@ obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) += rtc-hid-sensor-time.o
>  obj-$(CONFIG_RTC_DRV_HYM8563)	+= rtc-hym8563.o
>  obj-$(CONFIG_RTC_DRV_IMXDI)	+= rtc-imxdi.o
>  obj-$(CONFIG_RTC_DRV_IMX_SC)	+= rtc-imx-sc.o
> +obj-$(CONFIG_RTC_DRV_IMX_BBM_SCMI)	+= rtc-imx-sm-bbm.o
>  obj-$(CONFIG_RTC_DRV_ISL12022)	+= rtc-isl12022.o
>  obj-$(CONFIG_RTC_DRV_ISL12026)	+= rtc-isl12026.o
>  obj-$(CONFIG_RTC_DRV_ISL1208)	+= rtc-isl1208.o
> diff --git a/drivers/rtc/rtc-imx-sm-bbm.c b/drivers/rtc/rtc-imx-sm-bbm.c
> new file mode 100644
> index 000000000000..daa472be7c80
> --- /dev/null
> +++ b/drivers/rtc/rtc-imx-sm-bbm.c
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2024 NXP.
> + */
> +
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/rtc.h>
> +#include <linux/scmi_protocol.h>
> +#include <linux/scmi_imx_protocol.h>
> +
> +struct scmi_imx_bbm {
> +	const struct scmi_imx_bbm_proto_ops *ops;
> +	struct rtc_device *rtc_dev;
> +	struct scmi_protocol_handle *ph;
> +	struct notifier_block nb;
> +};
> +
> +static int scmi_imx_bbm_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
> +	struct scmi_protocol_handle *ph = bbnsm->ph;
> +	u64 val;
> +	int ret;
> +
> +	ret = bbnsm->ops->rtc_time_get(ph, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	rtc_time64_to_tm(val, tm);
> +
> +	return 0;
> +}
> +
> +static int scmi_imx_bbm_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
> +	struct scmi_protocol_handle *ph = bbnsm->ph;
> +	u64 val;
> +
> +	val = rtc_tm_to_time64(tm);
> +
> +	return bbnsm->ops->rtc_time_set(ph, 0, val);
> +}
> +
> +static int scmi_imx_bbm_alarm_irq_enable(struct device *dev, unsigned int enable)
> +{
> +	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
> +	struct scmi_protocol_handle *ph = bbnsm->ph;
> +
> +	/* scmi_imx_bbm_set_alarm enables the irq, just handle disable here */
> +	if (!enable)
> +		return bbnsm->ops->rtc_alarm_set(ph, 0, false, 0);
> +
> +	return 0;
> +}
> +
> +static int scmi_imx_bbm_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
> +	struct scmi_protocol_handle *ph = bbnsm->ph;
> +	struct rtc_time *alrm_tm = &alrm->time;
> +	u64 val;
> +
> +	val = rtc_tm_to_time64(alrm_tm);
> +
> +	return bbnsm->ops->rtc_alarm_set(ph, 0, true, val);
> +}
> +
> +static const struct rtc_class_ops smci_imx_bbm_rtc_ops = {
> +	.read_time = scmi_imx_bbm_read_time,
> +	.set_time = scmi_imx_bbm_set_time,
> +	.set_alarm = scmi_imx_bbm_set_alarm,
> +	.alarm_irq_enable = scmi_imx_bbm_alarm_irq_enable,
> +};
> +
> +static int scmi_imx_bbm_rtc_notifier(struct notifier_block *nb, unsigned long event, void *data)
> +{
> +	struct scmi_imx_bbm *bbnsm = container_of(nb, struct scmi_imx_bbm, nb);
> +	struct scmi_imx_bbm_notif_report *r = data;
> +
> +	if (r->is_rtc)
> +		rtc_update_irq(bbnsm->rtc_dev, 1, RTC_AF | RTC_IRQF);
> +	else
> +		pr_err("Unexpected bbm event: %s\n", __func__);
> +
> +	return 0;
> +}
> +
> +static int scmi_imx_bbm_rtc_init(struct scmi_device *sdev)
> +{
> +	const struct scmi_handle *handle = sdev->handle;
> +	struct device *dev = &sdev->dev;
> +	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
> +	int ret;
> +
> +	bbnsm->rtc_dev = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(bbnsm->rtc_dev))
> +		return PTR_ERR(bbnsm->rtc_dev);
> +
> +	bbnsm->rtc_dev->ops = &smci_imx_bbm_rtc_ops;
> +	bbnsm->rtc_dev->range_max = U32_MAX;
> +
> +	bbnsm->nb.notifier_call = &scmi_imx_bbm_rtc_notifier;
> +	ret = handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PROTOCOL_IMX_BBM,
> +							       SCMI_EVENT_IMX_BBM_RTC,
> +							       NULL, &bbnsm->nb);
> +	if (ret)
> +		return ret;
> +
> +	return devm_rtc_register_device(bbnsm->rtc_dev);
> +}
> +
> +static int scmi_imx_bbm_rtc_probe(struct scmi_device *sdev)
> +{
> +	const struct scmi_handle *handle = sdev->handle;
> +	struct device *dev = &sdev->dev;
> +	struct scmi_protocol_handle *ph;
> +	struct scmi_imx_bbm *bbnsm;
> +	int ret;
> +
> +	if (!handle)
> +		return -ENODEV;
> +
> +	bbnsm = devm_kzalloc(dev, sizeof(*bbnsm), GFP_KERNEL);
> +	if (!bbnsm)
> +		return -ENOMEM;
> +
> +	bbnsm->ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_BBM, &ph);
> +	if (IS_ERR(bbnsm->ops))
> +		return PTR_ERR(bbnsm->ops);
> +
> +	bbnsm->ph = ph;
> +
> +	device_init_wakeup(dev, true);
> +
> +	dev_set_drvdata(dev, bbnsm);
> +
> +	ret = scmi_imx_bbm_rtc_init(sdev);
> +	if (ret)
> +		device_init_wakeup(dev, false);
> +
> +	return ret;
> +}
> +
> +static const struct scmi_device_id scmi_id_table[] = {
> +	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-rtc" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(scmi, scmi_id_table);
> +
> +static struct scmi_driver scmi_imx_bbm_rtc_driver = {
> +	.name = "scmi-imx-bbm-rtc",
> +	.probe = scmi_imx_bbm_rtc_probe,
> +	.id_table = scmi_id_table,
> +};
> +module_scmi_driver(scmi_imx_bbm_rtc_driver);
> +
> +MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
> +MODULE_DESCRIPTION("IMX SM BBM RTC driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.37.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

