Return-Path: <linux-rtc+bounces-1652-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 404DD94317F
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 15:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63B941C218C3
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 13:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5024B1B3741;
	Wed, 31 Jul 2024 13:57:28 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BE61B3721;
	Wed, 31 Jul 2024 13:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722434248; cv=none; b=Y9oFIQnEmqU/U2x7XBAPS7+7gYdFuawxEhV8N81J/Qu/W69XB8aftWO5A7Al9hNGBW0D2Gtd8GAO3S8ZIM7n+hWiZ1l3Xa0Pa1boKK3pL2CdY3qgn9Dj/4ryjs7o+vDXQwawiKfnQEccJNEzkchnIK11HbEo06XLm/o3So1El0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722434248; c=relaxed/simple;
	bh=hzrRb1VEDbEgu4z8enVUXqH9fEC/Ml8eIv3eRX06X+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZ0UyvgiGx2B6W9zSE7VQ4G6OGjgwltCju8LtFia9dRFbj+7nI1aExDMv6AA/9L5/3yGrLP1ixf6JVv7ob3XyQKqP17+qp7MsBy4s4+SKsa1mvEoCHG4OtNZj2sFXl+/fptSUPDYQ7+auMuoVEnvNXQODWw1Ccjmj75joC9GRRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 711451007;
	Wed, 31 Jul 2024 06:57:51 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31DEB3F5A1;
	Wed, 31 Jul 2024 06:57:23 -0700 (PDT)
Date: Wed, 31 Jul 2024 14:57:20 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-rtc@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM module
Message-ID: <ZqpCwOhXiLzxK43-@pluto>
References: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
 <20240731-imx95-bbm-misc-v2-v7-7-a41394365602@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731-imx95-bbm-misc-v2-v7-7-a41394365602@nxp.com>

On Wed, Jul 31, 2024 at 08:56:11PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The BBM module provides BUTTON feature. To i.MX95, this module
> is managed by System Manager and exported using System Management
> Control Interface(SCMI). Linux could use i.MX SCMI BBM Extension
> protocol to use BUTTON feature.
> 
> This driver is to use SCMI interface to enable pwrkey.
> 

Hi Peng,


> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/input/keyboard/Kconfig          |  11 ++
>  drivers/input/keyboard/Makefile         |   1 +
>  drivers/input/keyboard/imx-sm-bbm-key.c | 236 ++++++++++++++++++++++++++++++++
>  3 files changed, 248 insertions(+)
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 72f9552cb571..a3301239b9a6 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -454,6 +454,17 @@ config KEYBOARD_IMX
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called imx_keypad.
>  
> +config KEYBOARD_IMX_BBM_SCMI
> +	tristate "IMX BBM SCMI Key Driver"
> +	depends on IMX_SCMI_BBM_EXT || COMPILE_TEST
> +	default y if ARCH_MXC
> +	help
> +	  This is the BBM key driver for NXP i.MX SoCs managed through
> +	  SCMI protocol.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called scmi-imx-bbm-key.
> +
>  config KEYBOARD_IMX_SC_KEY
>  	tristate "IMX SCU Key Driver"
>  	depends on IMX_SCU
> diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
> index b8d12a0524e0..5915e52eac28 100644
> --- a/drivers/input/keyboard/Makefile
> +++ b/drivers/input/keyboard/Makefile
> @@ -31,6 +31,7 @@ obj-$(CONFIG_KEYBOARD_IPAQ_MICRO)	+= ipaq-micro-keys.o
>  obj-$(CONFIG_KEYBOARD_IQS62X)		+= iqs62x-keys.o
>  obj-$(CONFIG_KEYBOARD_IMX)		+= imx_keypad.o
>  obj-$(CONFIG_KEYBOARD_IMX_SC_KEY)	+= imx_sc_key.o
> +obj-$(CONFIG_KEYBOARD_IMX_BBM_SCMI)	+= imx-sm-bbm-key.o
>  obj-$(CONFIG_KEYBOARD_HP6XX)		+= jornada680_kbd.o
>  obj-$(CONFIG_KEYBOARD_HP7XX)		+= jornada720_kbd.o
>  obj-$(CONFIG_KEYBOARD_LKKBD)		+= lkkbd.o
> diff --git a/drivers/input/keyboard/imx-sm-bbm-key.c b/drivers/input/keyboard/imx-sm-bbm-key.c
> new file mode 100644
> index 000000000000..ca430dbb61d0
> --- /dev/null
> +++ b/drivers/input/keyboard/imx-sm-bbm-key.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2024 NXP.
> + */
> +
> +#include <linux/input.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/rtc.h>
> +#include <linux/scmi_protocol.h>
> +#include <linux/scmi_imx_protocol.h>
> +#include <linux/suspend.h>
> +
> +#define DEBOUNCE_TIME		30
> +#define REPEAT_INTERVAL		60
> +
> +struct scmi_imx_bbm {
> +	struct scmi_protocol_handle *ph;
> +	const struct scmi_imx_bbm_proto_ops *ops;
> +	struct notifier_block nb;
> +	int keycode;
> +	int keystate;  /* 1:pressed */
> +	bool suspended;
> +	struct delayed_work check_work;
> +	struct input_dev *input;
> +};
> +
> +static void scmi_imx_bbm_pwrkey_check_for_events(struct work_struct *work)
> +{
> +	struct scmi_imx_bbm *bbnsm = container_of(to_delayed_work(work),
> +						  struct scmi_imx_bbm, check_work);
> +	struct scmi_protocol_handle *ph = bbnsm->ph;
> +	struct input_dev *input = bbnsm->input;
> +	u32 state = 0;
> +	int ret;
> +
> +	ret = bbnsm->ops->button_get(ph, &state);
> +	if (ret) {
> +		pr_err("%s: %d\n", __func__, ret);
> +		return;
> +	}
> +
> +	pr_debug("%s: state: %d, keystate %d\n", __func__, state, bbnsm->keystate);
> +
> +	/* only report new event if status changed */
> +	if (state ^ bbnsm->keystate) {
> +		bbnsm->keystate = state;
> +		input_event(input, EV_KEY, bbnsm->keycode, state);
> +		input_sync(input);
> +		pm_relax(bbnsm->input->dev.parent);
> +		pr_debug("EV_KEY: %x\n", bbnsm->keycode);
> +	}
> +
> +	/* repeat check if pressed long */
> +	if (state)
> +		schedule_delayed_work(&bbnsm->check_work, msecs_to_jiffies(REPEAT_INTERVAL));
> +}
> +
> +static int scmi_imx_bbm_pwrkey_event(struct scmi_imx_bbm *bbnsm)
> +{
> +	struct input_dev *input = bbnsm->input;
> +
> +	pm_wakeup_event(input->dev.parent, 0);
> +
> +	/*
> +	 * Directly report key event after resume to make no key press
> +	 * event is missed.
> +	 */
> +	if (READ_ONCE(bbnsm->suspended)) {
> +		bbnsm->keystate = 1;
> +		input_event(input, EV_KEY, bbnsm->keycode, 1);
> +		input_sync(input);
> +		WRITE_ONCE(bbnsm->suspended, false);
> +	}
> +
> +	schedule_delayed_work(&bbnsm->check_work, msecs_to_jiffies(DEBOUNCE_TIME));
> +
> +	return 0;
> +}
> +
> +static void scmi_imx_bbm_pwrkey_act(void *pdata)
> +{
> +	struct scmi_imx_bbm *bbnsm = pdata;
> +
> +	cancel_delayed_work_sync(&bbnsm->check_work);
> +}
> +
> +static int scmi_imx_bbm_key_notifier(struct notifier_block *nb, unsigned long event, void *data)
> +{
> +	struct scmi_imx_bbm *bbnsm = container_of(nb, struct scmi_imx_bbm, nb);
> +	struct scmi_imx_bbm_notif_report *r = data;
> +
> +	if (r->is_button) {
> +		pr_debug("BBM Button Power key pressed\n");
> +		scmi_imx_bbm_pwrkey_event(bbnsm);
> +	} else {
> +		/* Should never reach here */
> +		pr_err("Unexpected BBM event: %s\n", __func__);
> +	}
> +
> +	return 0;
> +}
> +
> +static int scmi_imx_bbm_pwrkey_init(struct scmi_device *sdev)
> +{
> +	const struct scmi_handle *handle = sdev->handle;
> +	struct device *dev = &sdev->dev;
> +	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
> +	struct input_dev *input;
> +	int ret;
> +
> +	if (device_property_read_u32(dev, "linux,code", &bbnsm->keycode)) {
> +		bbnsm->keycode = KEY_POWER;
> +		dev_warn(dev, "key code is not specified, using default KEY_POWER\n");
> +	}
> +
> +	INIT_DELAYED_WORK(&bbnsm->check_work, scmi_imx_bbm_pwrkey_check_for_events);
> +
> +	input = devm_input_allocate_device(dev);
> +	if (!input) {
> +		dev_err(dev, "failed to allocate the input device for SCMI IMX BBM\n");
> +		return -ENOMEM;
> +	}
> +
> +	input->name = dev_name(dev);
> +	input->phys = "bbnsm-pwrkey/input0";
> +	input->id.bustype = BUS_HOST;
> +
> +	input_set_capability(input, EV_KEY, bbnsm->keycode);
> +
> +	ret = devm_add_action_or_reset(dev, scmi_imx_bbm_pwrkey_act, bbnsm);
> +	if (ret) {
> +		dev_err(dev, "failed to register remove action\n");
> +		return ret;
> +	}
> +
> +	bbnsm->input = input;
> +
> +	bbnsm->nb.notifier_call = &scmi_imx_bbm_key_notifier;
> +	ret = handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PROTOCOL_IMX_BBM,
> +							       SCMI_EVENT_IMX_BBM_BUTTON,
> +							       NULL, &bbnsm->nb);
> +
> +	if (ret)
> +		dev_err(dev, "Failed to register BBM Button Events %d:", ret);
> +
> +	ret = input_register_device(input);
> +	if (ret) {
> +		dev_err(dev, "failed to register input device\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int scmi_imx_bbm_key_probe(struct scmi_device *sdev)
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
> +	ret = scmi_imx_bbm_pwrkey_init(sdev);
> +	if (ret)
> +		device_init_wakeup(dev, false);
> +
> +	return ret;
> +}
> +
> +static void scmi_imx_bbm_key_remove(struct scmi_device *sdev)
> +{
> +	struct device *dev = &sdev->dev;
> +	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
> +
> +	device_init_wakeup(dev, false);
> +
> +	cancel_delayed_work_sync(&bbnsm->check_work);
> +}
> +

..so in v6 I asked you to add a cancel_delayed_work_sync() on the
removal path, BUT I missed, my bad, that indeed above there was already
a call to cancel_delayed_work_sync() associated to a
devm_add_action_or_reset....so now we have 2....also you should try not
to mix devm_add_action_or_reset and plain .remove methods..use one or
the other.

Thanks,
Cristian

