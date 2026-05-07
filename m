Return-Path: <linux-rtc+bounces-6476-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LvpDiXC/GnSTAAAu9opvQ
	(envelope-from <linux-rtc+bounces-6476-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 07 May 2026 18:47:33 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E40BC4EC68F
	for <lists+linux-rtc@lfdr.de>; Thu, 07 May 2026 18:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBB62302FEB6
	for <lists+linux-rtc@lfdr.de>; Thu,  7 May 2026 16:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B0A44DB62;
	Thu,  7 May 2026 16:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJBw5Skc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5941A44CF5B;
	Thu,  7 May 2026 16:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778172422; cv=none; b=l49J78QtGx82QQqLanBH6rdmkVwksq78UcGKKKxOz0oC763FRtqdf+5yeu1KvNwnch+gRqwsFXm3xHrLrbiUvxsiATwRVgqLAI1E5nKyJTiXjc0dREqlfNegKjMUC0pH+2XcJG0HZ4yDM4JCWmfIuE4iiP38OF2xQwhq15u92IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778172422; c=relaxed/simple;
	bh=Akg/ShJGcJqW3BEnqMHNf2sf5RY/BNv6aSZYiYE1FZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZF2Z08Pz0O1GLO6gD2dbGMyk1+RupiG15R7gCZ+sssoYuZ75YWhBaKZlQipQ9xvKnEYZKcZ613AH77UxyfgvSdb/B3c9Z0t3m7oJmAYH0grunjyLG9kiZnoc2oRBZ3TP5hsytnjiP3JNDn58KOwDGunSCuaoPVaGyqebKv3VdCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJBw5Skc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88008C2BCB2;
	Thu,  7 May 2026 16:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778172421;
	bh=Akg/ShJGcJqW3BEnqMHNf2sf5RY/BNv6aSZYiYE1FZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hJBw5SkcUSNSbwEm8Kn/HDEoz6EiNI+p7SBYcmMfetEVtuyxXBfTvV2NnZ4yJEuuC
	 1c0QJAg/fsYE0dOTYH2TK2+LmKXB+DTkiysyGCxjO6toFSP1OsJZyJT0I1lVAGjSAa
	 vhqI8XBKzbZI9OVAJvi7Sqc4/wmnlnZh+T5S2T4rgkAQu9O/2c0oM5DzuoDpKmxjsu
	 sJYXIXzde30Pr4s94PAhpZnH01zaOFQvCB8HN4yrFe/3ujwiUSBsBN3oBzNeQlogud
	 SUh/1zGOvN5wOFjxpivz+QDP0m9VqBG4ZP3wc7y0/ljBsZXxLBffU04+zh7o2s2bb4
	 UySPP4pAvomaw==
Date: Thu, 7 May 2026 17:46:54 +0100
From: Lee Jones <lee@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Sebastian Reichel <sre@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Nam Tran <trannamatk@gmail.com>,
	=?utf-8?B?xYF1a2FzeiBMZWJpZWR6acWEc2tp?= <kernel@lvkasz.us>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 07/11] leds: flash: add support for Samsung S2M series
 PMIC flash LED device
Message-ID: <20260507164654.GS305027@google.com>
References: <20260424-s2mu005-pmic-v5-0-fcbc9da5a004@disroot.org>
 <20260424-s2mu005-pmic-v5-7-fcbc9da5a004@disroot.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-s2mu005-pmic-v5-7-fcbc9da5a004@disroot.org>
X-Rspamd-Queue-Id: E40BC4EC68F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6476-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri, 24 Apr 2026, Kaustabh Chakraborty wrote:

> Add support for flash LEDs in certain Samsung S2M series PMICs.
> The device has two channels for LEDs, typically for the back and front
> cameras in mobile devices. Both channels can be independently
> controlled, and can be operated in torch or flash modes.
> 
> The driver includes initial support for the S2MU005 PMIC flash LEDs.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/leds/flash/Kconfig          |  12 ++
>  drivers/leds/flash/Makefile         |   1 +
>  drivers/leds/flash/leds-s2m-flash.c | 358 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 371 insertions(+)
> 
> diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
> index 5e08102a67841..be62e05277429 100644
> --- a/drivers/leds/flash/Kconfig
> +++ b/drivers/leds/flash/Kconfig
> @@ -114,6 +114,18 @@ config LEDS_RT8515
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called leds-rt8515.
>  
> +config LEDS_S2M_FLASH
> +	tristate "Samsung S2M series PMICs flash/torch LED support"
> +	depends on LEDS_CLASS
> +	depends on MFD_SEC_CORE
> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS

The `|| !V4L2_FLASH_LED_CLASS` part of this dependency makes it
unconditionally true. Was this intended? Perhaps this dependency can be
removed entirely.

> +	select REGMAP_IRQ
> +	help
> +	  This option enables support for the flash/torch LEDs found in
> +	  certain Samsung S2M series PMICs, such as the S2MU005. It has
> +	  a LED channel dedicated for every physical LED. The LEDs can
> +	  be controlled in flash and torch modes.
> +
>  config LEDS_SGM3140
>  	tristate "LED support for the SGM3140"
>  	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
> index 712fb737a428e..44e6c1b4beb37 100644
> --- a/drivers/leds/flash/Makefile
> +++ b/drivers/leds/flash/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_LEDS_MAX77693)	+= leds-max77693.o
>  obj-$(CONFIG_LEDS_QCOM_FLASH)	+= leds-qcom-flash.o
>  obj-$(CONFIG_LEDS_RT4505)	+= leds-rt4505.o
>  obj-$(CONFIG_LEDS_RT8515)	+= leds-rt8515.o
> +obj-$(CONFIG_LEDS_S2M_FLASH)	+= leds-s2m-flash.o
>  obj-$(CONFIG_LEDS_SGM3140)	+= leds-sgm3140.o
>  obj-$(CONFIG_LEDS_SY7802)	+= leds-sy7802.o
>  obj-$(CONFIG_LEDS_TPS6131X)	+= leds-tps6131x.o
> diff --git a/drivers/leds/flash/leds-s2m-flash.c b/drivers/leds/flash/leds-s2m-flash.c
> new file mode 100644
> index 0000000000000..177d23b432ce6
> --- /dev/null
> +++ b/drivers/leds/flash/leds-s2m-flash.c
> @@ -0,0 +1,358 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Flash and Torch LED Driver for Samsung S2M series PMICs.
> + *
> + * Copyright (c) 2015 Samsung Electronics Co., Ltd
> + * Copyright (c) 2026 Kaustabh Chakraborty <kauschluss@disroot.org>
> + */
> +
> +#include <linux/container_of.h>
> +#include <linux/led-class-flash.h>
> +#include <linux/mfd/samsung/core.h>
> +#include <linux/mfd/samsung/s2mu005.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <media/v4l2-flash-led-class.h>
> +
> +#define MAX_CHANNELS	2
> +
> +struct s2m_led {
> +	struct regmap *regmap;
> +	struct led_classdev_flash fled;
> +	struct v4l2_flash *v4l2_flash;
> +	/*
> +	 * The mutex object prevents the concurrent access of flash control
> +	 * registers by the LED and V4L2 subsystems.
> +	 */
> +	struct mutex lock;
> +	unsigned int reg_enable;
> +	u8 channel;
> +	u8 flash_brightness;
> +	u8 flash_timeout;
> +};
> +
> +static struct s2m_led *to_s2m_led(struct led_classdev_flash *fled)
> +{
> +	return container_of(fled, struct s2m_led, fled);
> +}
> +
> +static struct led_classdev_flash *to_s2m_fled(struct led_classdev *cdev)
> +{
> +	return container_of(cdev, struct led_classdev_flash, led_cdev);
> +}
> +
> +static int s2m_fled_flash_brightness_set(struct led_classdev_flash *fled, u32 brightness)
> +{
> +	struct s2m_led *led = to_s2m_led(fled);
> +	struct led_flash_setting *setting = &fled->brightness;
> +
> +	led->flash_brightness = (brightness - setting->min) / setting->step;
> +
> +	return 0;
> +}
> +
> +static int s2m_fled_flash_timeout_set(struct led_classdev_flash *fled, u32 timeout)
> +{
> +	struct s2m_led *led = to_s2m_led(fled);
> +	struct led_flash_setting *setting = &fled->timeout;
> +
> +	led->flash_timeout = (timeout - setting->min) / setting->step;
> +
> +	return 0;
> +}
> +
> +#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
> +static int s2m_fled_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, bool enable)
> +{
> +	struct s2m_led *led = to_led(v4l2_flash->fled_cdev);

What is to_led()?

Was this tested?

> +	mutex_lock(&led->lock);
> +
> +	led->fled.ops->strobe_set(&led->fled, enable);
> +
> +	mutex_unlock(&led->lock);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_flash_ops s2m_fled_v4l2_flash_ops = {
> +	.external_strobe_set = s2m_fled_flash_external_strobe_set,
> +};
> +#else
> +static const struct v4l2_flash_ops s2m_fled_v4l2_flash_ops;
> +#endif
> +
> +static void s2m_fled_v4l2_flash_release(void *v4l2_flash)
> +{
> +	v4l2_flash_release(v4l2_flash);
> +}
> +
> +static int s2mu005_fled_torch_brightness_set(struct led_classdev *cdev, enum led_brightness value)
> +{
> +	struct s2m_led *led = to_s2m_led(to_s2m_fled(cdev));
> +	int ret;
> +
> +	mutex_lock(&led->lock);
> +
> +	if (!value) {
> +		ret = regmap_clear_bits(led->regmap, led->reg_enable,
> +					S2MU005_FLED_TORCH_EN(led->channel));
> +		if (ret < 0)
> +			dev_err(cdev->dev, "failed to disable torch LED\n");
> +		goto unlock;
> +	}
> +
> +	ret = regmap_update_bits(led->regmap, S2MU005_REG_FLED_CH_CTRL1(led->channel),
> +				 S2MU005_FLED_TORCH_IOUT,
> +				 FIELD_PREP(S2MU005_FLED_TORCH_IOUT, value - 1));
> +	if (ret < 0) {

Is a positive number even possible?

> +		dev_err(cdev->dev, "failed to set torch current\n");
> +		goto unlock;
> +	}
> +
> +	ret = regmap_set_bits(led->regmap, led->reg_enable, S2MU005_FLED_TORCH_EN(led->channel));
> +	if (ret < 0) {
> +		dev_err(cdev->dev, "failed to enable torch LED\n");
> +		goto unlock;
> +	}
> +
> +unlock:
> +	mutex_unlock(&led->lock);
> +
> +	return ret;
> +}
> +
> +static int s2mu005_fled_flash_strobe_set(struct led_classdev_flash *fled, bool state)
> +{
> +	struct s2m_led *led = to_s2m_led(fled);
> +	int ret;
> +
> +	mutex_lock(&led->lock);
> +
> +	ret = regmap_clear_bits(led->regmap, led->reg_enable, S2MU005_FLED_FLASH_EN(led->channel));
> +	if (ret < 0) {
> +		dev_err(fled->led_cdev.dev, "failed to disable flash LED\n");
> +		goto unlock;
> +	}
> +
> +	if (!state)
> +		goto unlock;
> +
> +	ret = regmap_update_bits(led->regmap, S2MU005_REG_FLED_CH_CTRL0(led->channel),
> +				 S2MU005_FLED_FLASH_IOUT,
> +				 FIELD_PREP(S2MU005_FLED_FLASH_IOUT, led->flash_brightness));
> +	if (ret < 0) {
> +		dev_err(fled->led_cdev.dev, "failed to set flash brightness\n");
> +		goto unlock;
> +	}
> +
> +	ret = regmap_update_bits(led->regmap, S2MU005_REG_FLED_CH_CTRL3(led->channel),
> +				 S2MU005_FLED_FLASH_TIMEOUT,
> +				 FIELD_PREP(S2MU005_FLED_FLASH_TIMEOUT, led->flash_timeout));
> +	if (ret < 0) {
> +		dev_err(fled->led_cdev.dev, "failed to set flash timeout\n");
> +		goto unlock;
> +	}
> +
> +	ret = regmap_set_bits(led->regmap, led->reg_enable, S2MU005_FLED_FLASH_EN(led->channel));
> +	if (ret < 0) {
> +		dev_err(fled->led_cdev.dev, "failed to enable flash LED\n");
> +		goto unlock;
> +	}
> +
> +unlock:
> +	mutex_unlock(&led->lock);
> +
> +	return 0;

It seems like this function swallows error codes.

Better if they're propagated properly.

> +}
> +
> +static int s2mu005_fled_flash_strobe_get(struct led_classdev_flash *fled, bool *state)
> +{
> +	struct s2m_led *led = to_s2m_led(fled);
> +	u32 val;
> +	int ret;
> +
> +	mutex_lock(&led->lock);
> +
> +	ret = regmap_read(led->regmap, S2MU005_REG_FLED_STATUS, &val);
> +	if (ret < 0) {
> +		dev_err(fled->led_cdev.dev, "failed to fetch LED status");

Missed '/n'.

> +		goto unlock;
> +	}
> +
> +	*state = !!(val & S2MU005_FLED_FLASH_STATUS(led->channel));
> +
> +unlock:
> +	mutex_unlock(&led->lock);
> +
> +	return ret;
> +}
> +
> +static const struct led_flash_ops s2mu005_fled_flash_ops = {
> +	.flash_brightness_set = s2m_fled_flash_brightness_set,
> +	.timeout_set = s2m_fled_flash_timeout_set,
> +	.strobe_set = s2mu005_fled_flash_strobe_set,
> +	.strobe_get = s2mu005_fled_flash_strobe_get,
> +};
> +
> +static int s2mu005_fled_init(struct s2m_led *led, struct device *dev, struct regmap *regmap,
> +			     unsigned int nr_channels)
> +{
> +	unsigned int val;
> +	int i, ret;
> +
> +	/* Enable the LED channels. */
> +	ret = regmap_set_bits(regmap, S2MU005_REG_FLED_CTRL1, S2MU005_FLED_CH_EN);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to enable LED channels\n");
> +
> +	ret = regmap_read(regmap, S2MU005_REG_ID, &val);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to read revision\n");
> +
> +	for (i = 0; i < nr_channels; i++) {

for (int i = 0; i < nr_channels; i++)

> +		/*
> +		 * Read the revision register. Revision EVT0 has the register
> +		 * at CTRL4, while EVT1 and higher have it at CTRL6.
> +		 */
> +		if (FIELD_GET(S2MU005_ID_MASK, val) == 0)

Why not remove the " == 0" and reverse the branches?

> +			led[i].reg_enable = S2MU005_REG_FLED_CTRL4;
> +		else
> +			led[i].reg_enable = S2MU005_REG_FLED_CTRL6;
> +	}
> +
> +	return 0;
> +}
> +
> +static int s2mu005_fled_init_channel(struct s2m_led *led, struct device *dev,
> +				     struct fwnode_handle *fwnp)
> +{
> +	struct led_classdev *cdev = &led->fled.led_cdev;
> +	struct led_init_data init_data = {};
> +	struct v4l2_flash_config v4l2_cfg = {};
> +	int ret;
> +
> +	cdev->max_brightness = 16;
> +	cdev->brightness_set_blocking = s2mu005_fled_torch_brightness_set;
> +	cdev->flags |= LED_DEV_CAP_FLASH;
> +
> +	led->fled.timeout.min = 62000;
> +	led->fled.timeout.step = 62000;
> +	led->fled.timeout.max = 992000;
> +	led->fled.timeout.val = 992000;
> +
> +	led->fled.brightness.min = 25000;
> +	led->fled.brightness.step = 25000;
> +	led->fled.brightness.max = 375000; /* 400000 causes flickering */
> +	led->fled.brightness.val = 375000;
> +
> +	s2m_fled_flash_timeout_set(&led->fled, led->fled.timeout.val);
> +	s2m_fled_flash_brightness_set(&led->fled, led->fled.brightness.val);
> +
> +	led->fled.ops = &s2mu005_fled_flash_ops;
> +
> +	init_data.fwnode = fwnp;
> +	ret = devm_led_classdev_flash_register_ext(dev, &led->fled, &init_data);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to create LED flash device\n");
> +
> +	v4l2_cfg.intensity.min = led->fled.timeout.min;
> +	v4l2_cfg.intensity.step = led->fled.timeout.step;
> +	v4l2_cfg.intensity.max = led->fled.timeout.max;
> +	v4l2_cfg.intensity.val = led->fled.timeout.val;

Is it correct to configure the V4L2 intensity settings from the timeout
values?  I would expect these to be based on the brightness settings.

> +
> +	v4l2_cfg.has_external_strobe = true;
> +
> +	led->v4l2_flash = v4l2_flash_init(dev, fwnp, &led->fled, &s2m_fled_v4l2_flash_ops,
> +					  &v4l2_cfg);
> +	if (IS_ERR(led->v4l2_flash)) {
> +		v4l2_flash_release(led->v4l2_flash);

So you're going to try and release an error?

> +		return dev_err_probe(dev, PTR_ERR(led->v4l2_flash),
> +				     "failed to create V4L2 flash device\n");
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, (void *)s2m_fled_v4l2_flash_release, led->v4l2_flash);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to add cleanup action\n");
> +
> +	return 0;
> +}
> +
> +static int s2m_fled_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct sec_pmic_dev *ddata = dev_get_drvdata(dev->parent);
> +	struct s2m_led *led;
> +	int ret;
> +
> +	led = devm_kzalloc(dev, sizeof(*led) * MAX_CHANNELS, GFP_KERNEL);
> +	if (!led)
> +		return -ENOMEM;
> +
> +	switch (platform_get_device_id(pdev)->driver_data) {
> +	case S2MU005:
> +		ret = s2mu005_fled_init(led, dev, ddata->regmap_pmic, MAX_CHANNELS);
> +		if (ret)
> +			return ret;
> +		break;
> +	default:
> +		return dev_err_probe(dev, -ENODEV, "device type %d is not supported by driver\n",
> +				     ddata->device_type);
> +	}

Will this be expanded in the very near future?

If not, having a switch () with only one entry seems odd.


if (platform_get_device_id(pdev)->driver_data != S2MU005)
	dev_err_probe()

> +	device_for_each_child_node_scoped(dev, child) {
> +		u32 reg;
> +
> +		if (fwnode_property_read_u32(child, "reg", &reg))
> +			continue;
> +
> +		if (led[reg].regmap) {
> +			dev_warn(dev, "duplicate node for channel %d\n", reg);
> +			continue;
> +		}

If reg > MAX_CHANNELS, you just created an OOB condition.

> +
> +		led[reg].regmap = ddata->regmap_pmic;
> +		led[reg].channel = (u8)reg;
> +
> +		ret = devm_mutex_init(dev, &led[reg].lock);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to create mutex\n");
> +
> +		switch (platform_get_device_id(pdev)->driver_data) {
> +		case S2MU005:
> +			ret = s2mu005_fled_init_channel(led + reg, dev, child);
> +			if (ret < 0)
> +				return ret;
> +			break;
> +		}

This is even more odd!

> +	}
> +
> +	return 0;
> +}
> +
> +static const struct platform_device_id s2m_fled_id_table[] = {
> +	{ "s2mu005-flash", S2MU005 },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(platform, s2m_fled_id_table);
> +
> +static const struct of_device_id s2m_fled_of_match_table[] = {
> +	{ .compatible = "samsung,s2mu005-flash", .data = (void *)S2MU005 },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, s2m_fled_of_match_table);
> +
> +static struct platform_driver s2m_fled_driver = {
> +	.driver = {
> +		.name = "s2m-flash",
> +	},
> +	.probe = s2m_fled_probe,
> +	.id_table = s2m_fled_id_table,
> +};
> +module_platform_driver(s2m_fled_driver);
> +
> +MODULE_DESCRIPTION("Flash/Torch LED Driver For Samsung S2M Series PMICs");
> +MODULE_AUTHOR("Kaustabh Chakraborty <kauschluss@disroot.org>");
> +MODULE_LICENSE("GPL");

-- 
Lee Jones

