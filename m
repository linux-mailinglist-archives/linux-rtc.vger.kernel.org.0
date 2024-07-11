Return-Path: <linux-rtc+bounces-1478-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE16892EA19
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 16:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D0C81F22DE0
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 14:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D351607AF;
	Thu, 11 Jul 2024 14:02:03 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E247148FE8;
	Thu, 11 Jul 2024 14:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720706523; cv=none; b=Dt+uhmm18pMmweQxr2MvVGqX/S8dNgIhTchJoFwJ051LBAqL/zLYMqkAO4I+hshvRPsK+ij/HUVQe0WQ2oh7+aOb0KJBJ6WulQMC2mfND5N46Kkh7W9j3Weph2CkskyILTpLgzYyDmjSAEjEeJt73j7ggY2SdsSLxn073nhLqnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720706523; c=relaxed/simple;
	bh=2JKn8yTk+sDGYeVvGEuG8XwEYm6R1GQpA2r8MI+me6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HY7yYTPSI/OdYl2jEuwJN7DVI2gCM7zfybHT4gcXAZKkDd0KxQ0RzeDpw54TmJ1ptrvlkH7uJbsIvbCqEUju9323AuiSOvU92yaNNHq4OMFHGo3r81uOWd0/2kpvFTGFUvqOG2HAbBVL3El7AxbN+JuTNaYu4ycYcqJUOeL4d/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0928FFEC;
	Thu, 11 Jul 2024 07:02:26 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF2C23F766;
	Thu, 11 Jul 2024 07:01:57 -0700 (PDT)
Date: Thu, 11 Jul 2024 15:01:55 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 7/7] input: keyboard: support i.MX95 BBM module
Message-ID: <Zo_l02sbfjv_64B2@pluto>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
 <20240621-imx95-bbm-misc-v2-v5-7-b85a6bf778cb@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621-imx95-bbm-misc-v2-v5-7-b85a6bf778cb@nxp.com>

On Fri, Jun 21, 2024 at 03:04:42PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The BBM module provides BUTTON feature. To i.MX95, this module
> is managed by System Manager and exported using System Management
> Control Interface(SCMI). Linux could use i.MX SCMI BBM Extension
> protocol to use BUTTON feature.

Hi Peng,

one remarks down below.

> 
> This driver is to use SCMI interface to enable pwrkey.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/input/keyboard/Kconfig          |  11 ++
>  drivers/input/keyboard/Makefile         |   1 +
>  drivers/input/keyboard/imx-sm-bbm-key.c | 225 ++++++++++++++++++++++++++++++++
>  3 files changed, 237 insertions(+)
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 1d0c5f4c0f99..1c3fef7d34af 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -466,6 +466,17 @@ config KEYBOARD_IMX
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
> index aecef00c5d09..624c90adde89 100644
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
> index 000000000000..907dad383b8f
> --- /dev/null
> +++ b/drivers/input/keyboard/imx-sm-bbm-key.c
> @@ -0,0 +1,225 @@
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
> +	schedule_delayed_work(&bbnsm->check_work, msecs_to_jiffies(DEBOUNCE_TIME));
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

To stay on the safe side I would issue a cancel_delayed_work_sync()
somewhere along the remove() path of this driver...just to be sure
there is not an  actively scheduled deleayed work queued while we are
shutting down.....I maybe overly paranoic...but seems a safe thing to do O_o

Thanks,
Cristian

