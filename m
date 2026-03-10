Return-Path: <linux-rtc+bounces-6163-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFN2AuEFsGlAegIAu9opvQ
	(envelope-from <linux-rtc+bounces-6163-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Mar 2026 12:52:01 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 971A824BB1F
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Mar 2026 12:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5104030774D2
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Mar 2026 11:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3969538946E;
	Tue, 10 Mar 2026 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ot4xSumB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABC0387361;
	Tue, 10 Mar 2026 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142723; cv=none; b=Sx3eWTec9WEb3kNG27wrIxxPBKgFyeQAcjE5UgtRBgZqYCnxgcnYwbNC4lp8dim1xtjxubjf+uVnHOn/4FwuGAL8uxWpYlqfdAp+54LR9FpCzxITQ31BkuX9PfCKGwUJcuEvDadayp6MhbmsycShyfRK56ogfqb+HCq0jhVE3V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142723; c=relaxed/simple;
	bh=lgEKmzd/27QTSNFXuDsbHCKYYk4Nmuz/LNXBj8lWCA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBMG02jGvqYMi/juVpLE0NYwz9uwxA723biYP3+SxGIXHy52YjiHP3v66s8eezPk4cinMa2dK/lxUo6IB5dJfVTo7m76LZ5mSEw7ejjJOLJ7mrr+YnoZ+FWiG22RSmzI/Mzo4rvlGhhszHKQ2O8fVLrfpEJvkE+9ZwgkQ+Baigg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ot4xSumB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978E3C2BC9E;
	Tue, 10 Mar 2026 11:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773142722;
	bh=lgEKmzd/27QTSNFXuDsbHCKYYk4Nmuz/LNXBj8lWCA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ot4xSumBhzwOxzZ/YxNFiO9UMtjlr5NandP1eqJVqrCfml6W3rnr7nrzQ0DbICjcT
	 0/EXX4+DWa8wi4v0ICjbir4hQIQkEOLuUyKtVtx9hHhEXVikSuYa7r58cM0E0vJy3g
	 SptxlteHXBc9L06cTHM6DJ2fOHQayaNu7aOnz80wg6GO7eY7zOysj7jADad2uOMj7h
	 podjVqa1SMs2gqahNNlaCns1EKtk7CglLtdLj24UuLbEmFq8uyoIpJtuoIAeg0lhpa
	 nGF1HPKn2F5tISkUNY9K/H5gU21Gwr1TMV3EapDZbzpHW7oGHXiqT/JPsoxzQFm3oa
	 hrJqUCsWlal3A==
Date: Tue, 10 Mar 2026 11:38:35 +0000
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
	Nam Tran <trannamatk@gmail.com>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 09/13] leds: flash: add support for Samsung S2M series
 PMIC flash LED device
Message-ID: <20260310113835.GG183676@google.com>
References: <20260225-s2mu005-pmic-v3-0-b4afee947603@disroot.org>
 <20260225-s2mu005-pmic-v3-9-b4afee947603@disroot.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225-s2mu005-pmic-v3-9-b4afee947603@disroot.org>
X-Rspamd-Queue-Id: 971A824BB1F
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6163-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, 25 Feb 2026, Kaustabh Chakraborty wrote:

> Add support for flash LEDs found in certain Samsung S2M series PMICs.
> The device has two channels for LEDs, typically for the back and front
> cameras in mobile devices. Both channels can be independently
> controlled, and can be operated in torch or flash modes.
> 
> The driver includes initial support for the S2MU005 PMIC flash LEDs.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/leds/flash/Kconfig          |  12 +
>  drivers/leds/flash/Makefile         |   1 +
>  drivers/leds/flash/leds-s2m-flash.c | 429 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 442 insertions(+)
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
> index 0000000000000..536a529889a9c
> --- /dev/null
> +++ b/drivers/leds/flash/leds-s2m-flash.c
> @@ -0,0 +1,429 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Flash and Torch LED Driver for Samsung S2M series PMICs.
> + *
> + * Copyright (c) 2015 Samsung Electronics Co., Ltd
> + * Copyright (c) 2025 Kaustabh Chakraborty <kauschluss@disroot.org>
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
> +struct s2m_fled {

This is not the fled, change this to _led and call pointers to it 'led'.

> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct led_classdev_flash cdev;

This is the 'fled'.  Please change all pointer to it to 'fled'.

> +	struct v4l2_flash *v4l2_flash;
> +	/*
> +	 * The mutex object prevents the concurrent access of flash control
> +	 * registers by the LED and V4L2 subsystems.
> +	 */
> +	struct mutex lock;
> +	const struct s2m_fled_spec *spec;

This should not be in here.

> +	unsigned int reg_enable;
> +	u8 channel;
> +	u8 flash_brightness;
> +	u8 flash_timeout;
> +};
> +
> +struct s2m_fled_spec {
> +	u8 nr_channels;
> +	u32 torch_max_brightness;
> +	u32 flash_min_current_ua;
> +	u32 flash_max_current_ua;
> +	u32 flash_min_timeout_us;
> +	u32 flash_max_timeout_us;
> +	int (*torch_brightness_set_blocking)(struct led_classdev *led_cdev,
> +					     enum led_brightness brightness);

I'm really not a fan of pointers to functions at the driver level.

If there are differences between devices, which I cannot see here, store
an identifier and use that to choose which call-back function is the
most appropriate.

> +	const struct led_flash_ops *flash_ops;

Why do we need to store these?

The same principles apply to the function pointer above.

> +};
> +
> +static struct led_classdev_flash *to_cdev_flash(struct led_classdev *cdev)
> +{
> +	return container_of(cdev, struct led_classdev_flash, led_cdev);
> +}
> +
> +static struct s2m_fled *to_led_priv(struct led_classdev_flash *cdev)

There is nothing private about s2m_{f}led.

'led' is the most common nomenclature.  So: led->channel, etc.

Remove 'priv' throughout.

> +{
> +	return container_of(cdev, struct s2m_fled, cdev);

	return container_of(fled, struct s2m_led, fled);

> +}
> +
> +static int s2m_fled_flash_brightness_set(struct led_classdev_flash *cdev,
> +					 u32 brightness)
> +{
> +	struct s2m_fled *priv = to_led_priv(cdev);
> +	struct led_flash_setting *setting = &cdev->brightness;
> +
> +	priv->flash_brightness = (brightness - setting->min) / setting->step;
> +
> +	return 0;
> +}
> +
> +static int s2m_fled_flash_timeout_set(struct led_classdev_flash *cdev,
> +				      u32 timeout)
> +{
> +	struct s2m_fled *priv = to_led_priv(cdev);
> +	struct led_flash_setting *setting = &cdev->timeout;
> +
> +	priv->flash_timeout = (timeout - setting->min) / setting->step;
> +
> +	return 0;
> +}
> +
> +#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
> +static int s2m_fled_flash_external_strobe_set(struct v4l2_flash *v4l2_flash,
> +					      bool enable)
> +{
> +	struct s2m_fled *priv = to_led_priv(v4l2_flash->fled_cdev);
> +
> +	mutex_lock(&priv->lock);
> +
> +	priv->cdev.ops->strobe_set(&priv->cdev, enable);
> +
> +	mutex_unlock(&priv->lock);
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
> +static int s2mu005_fled_torch_brightness_set(struct led_classdev *cdev,
> +					     enum led_brightness value)
> +{
> +	struct s2m_fled *priv = to_led_priv(to_cdev_flash(cdev));
> +	struct regmap *regmap = priv->regmap;
> +	int ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	if (value == LED_OFF) {

These defines are deprecated.

From include/linux/leds.h:

/* This is obsolete/useless. We now support variable maximum brightness. */
enum led_brightness {
        LED_OFF         = 0,
        LED_ON          = 1,
        LED_HALF        = 127,
        LED_FULL        = 255,
};

> +		ret = regmap_clear_bits(regmap, priv->reg_enable,
> +					S2MU005_FLED_TORCH_EN(priv->channel));
> +		if (ret < 0)
> +			dev_err(priv->dev, "failed to disable torch LED\n");
> +		goto unlock;
> +	}
> +
> +	ret = regmap_update_bits(regmap, S2MU005_REG_FLED_CH_CTRL1(priv->channel),
j> +				 S2MU005_FLED_TORCH_IOUT,
> +				 FIELD_PREP(S2MU005_FLED_TORCH_IOUT, value - 1));
> +	if (ret < 0) {
> +		dev_err(priv->dev, "failed to set torch current\n");
> +		goto unlock;
> +	}
> +
> +	ret = regmap_set_bits(regmap, priv->reg_enable,
> +			      S2MU005_FLED_TORCH_EN(priv->channel));
> +	if (ret < 0) {
> +		dev_err(priv->dev, "failed to enable torch LED\n");
> +		goto unlock;
> +	}
> +
> +unlock:
> +	mutex_unlock(&priv->lock);
> +
> +	return ret;
> +}
> +
> +static int s2mu005_fled_flash_strobe_set(struct led_classdev_flash *cdev,
> +					 bool state)
> +{
> +	struct s2m_fled *priv = to_led_priv(cdev);
> +	struct regmap *regmap = priv->regmap;
> +	int ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	ret = regmap_clear_bits(regmap, priv->reg_enable,
> +				S2MU005_FLED_FLASH_EN(priv->channel));
> +	if (ret < 0) {
> +		dev_err(priv->dev, "failed to disable flash LED\n");
> +		goto unlock;
> +	}
> +
> +	if (!state)
> +		goto unlock;
> +
> +	ret = regmap_update_bits(regmap, S2MU005_REG_FLED_CH_CTRL0(priv->channel),
> +				 S2MU005_FLED_FLASH_IOUT,
> +				 FIELD_PREP(S2MU005_FLED_FLASH_IOUT,
> +					    priv->flash_brightness));
> +	if (ret < 0) {
> +		dev_err(priv->dev, "failed to set flash brightness\n");
> +		goto unlock;
> +	}
> +
> +	ret = regmap_update_bits(regmap, S2MU005_REG_FLED_CH_CTRL3(priv->channel),
> +				 S2MU005_FLED_FLASH_TIMEOUT,
> +				 FIELD_PREP(S2MU005_FLED_FLASH_TIMEOUT,
> +					    priv->flash_timeout));
> +	if (ret < 0) {
> +		dev_err(priv->dev, "failed to set flash timeout\n");
> +		goto unlock;
> +	}
> +
> +	ret = regmap_set_bits(regmap, priv->reg_enable,
> +			      S2MU005_FLED_FLASH_EN(priv->channel));
> +	if (ret < 0) {
> +		dev_err(priv->dev, "failed to enable flash LED\n");
> +		goto unlock;
> +	}
> +
> +unlock:
> +	mutex_unlock(&priv->lock);
> +
> +	return 0;
> +}
> +
> +static int s2mu005_fled_flash_strobe_get(struct led_classdev_flash *cdev,
> +					 bool *state)
> +{
> +	struct s2m_fled *priv = to_led_priv(cdev);
> +	struct regmap *regmap = priv->regmap;

Since this is only used once, I don't see anything to gain from
utilising a local variable here.

> +	u8 channel = priv->channel;

Same here.

> +	u32 val;
> +	int ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	ret = regmap_read(regmap, S2MU005_REG_FLED_STATUS, &val);
> +	if (ret < 0) {
> +		dev_err(priv->dev, "failed to fetch LED status");
> +		goto unlock;
> +	}
> +
> +	*state = !!(val & S2MU005_FLED_FLASH_STATUS(channel));
> +
> +unlock:
> +	mutex_unlock(&priv->lock);
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
> +static int s2mu005_fled_init(struct s2m_fled *priv)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	/* Enable the LED channels. */
> +	ret = regmap_set_bits(priv->regmap, S2MU005_REG_FLED_CTRL1,
> +			      S2MU005_FLED_CH_EN);

Feel free to use up to 100-char to eradicate these wraps.

> +	if (ret < 0)
> +		return dev_err_probe(priv->dev, ret, "failed to enable LED channels\n");
> +
> +	/*
> +	 * Get the LED enable register address. Revision EVT0 has the
> +	 * register at CTRL4, while EVT1 and higher have it at CTRL6.
> +	 */
> +	ret = regmap_read(priv->regmap, S2MU005_REG_ID, &val);
> +	if (ret < 0)
> +		return dev_err_probe(priv->dev, ret, "failed to read revision\n");
> +
> +	if (FIELD_GET(S2MU005_ID_MASK, val) == 0)

A comment above to explain what this means please.

And/or define the zero to something obvious.

> +		priv->reg_enable = S2MU005_REG_FLED_CTRL4;
> +	else
> +		priv->reg_enable = S2MU005_REG_FLED_CTRL6;
> +
> +	return 0;
> +}
> +
> +static const struct s2m_fled_spec s2mu005_fled_spec = {
> +	.nr_channels = 2,
> +	.torch_max_brightness = 16,
> +	.flash_min_current_ua = 25000,
> +	.flash_max_current_ua = 375000, /* 400000 causes flickering */
> +	.flash_min_timeout_us = 62000,
> +	.flash_max_timeout_us = 992000,
> +	.torch_brightness_set_blocking = s2mu005_fled_torch_brightness_set,
> +	.flash_ops = &s2mu005_fled_flash_ops,
> +};
> +
> +static int s2m_fled_init_channel(struct s2m_fled *priv,
> +				 struct fwnode_handle *fwnp)

Unwrap all of these that fit into 100-chars.

> +{
> +	struct led_classdev *led = &priv->cdev.led_cdev;
> +	struct led_init_data init_data = {};
> +	struct v4l2_flash_config v4l2_cfg = {};
> +	int ret;
> +
> +	led->max_brightness = priv->spec->torch_max_brightness;
> +	led->brightness_set_blocking = priv->spec->torch_brightness_set_blocking;
> +	led->flags |= LED_DEV_CAP_FLASH;
> +
> +	priv->cdev.timeout.min = priv->spec->flash_min_timeout_us;
> +	priv->cdev.timeout.step = priv->spec->flash_min_timeout_us;
> +	priv->cdev.timeout.max = priv->spec->flash_max_timeout_us;
> +	priv->cdev.timeout.val = priv->spec->flash_max_timeout_us;
> +
> +	priv->cdev.brightness.min = priv->spec->flash_min_current_ua;
> +	priv->cdev.brightness.step = priv->spec->flash_min_current_ua;
> +	priv->cdev.brightness.max = priv->spec->flash_max_current_ua;
> +	priv->cdev.brightness.val = priv->spec->flash_max_current_ua;

Moving things around in priv/data tells me that something isn't right.

I think the spec should be removed from what is currently called priv.

> +	s2m_fled_flash_timeout_set(&priv->cdev, priv->cdev.timeout.val);
> +	s2m_fled_flash_brightness_set(&priv->cdev, priv->cdev.brightness.val);
> +
> +	priv->cdev.ops = priv->spec->flash_ops;
> +
> +	init_data.fwnode = fwnp;
> +	ret = devm_led_classdev_flash_register_ext(priv->dev, &priv->cdev,
> +						   &init_data);
> +	if (ret < 0)
> +		return dev_err_probe(priv->dev, ret, "failed to create LED flash device\n");
> +
> +	v4l2_cfg.intensity.min = priv->spec->flash_min_current_ua;
> +	v4l2_cfg.intensity.step = priv->spec->flash_min_current_ua;
> +	v4l2_cfg.intensity.max = priv->spec->flash_max_current_ua;
> +	v4l2_cfg.intensity.val = priv->spec->flash_max_current_ua;
> +
> +	v4l2_cfg.has_external_strobe = true;
> +
> +	priv->v4l2_flash = v4l2_flash_init(priv->dev, fwnp, &priv->cdev,
> +					   &s2m_fled_v4l2_flash_ops, &v4l2_cfg);
> +	if (IS_ERR(priv->v4l2_flash)) {
> +		v4l2_flash_release(priv->v4l2_flash);
> +		return dev_err_probe(priv->dev, PTR_ERR(priv->v4l2_flash),
> +				     "failed to create V4L2 flash device\n");
> +	}
> +
> +	ret = devm_add_action_or_reset(priv->dev, (void *)s2m_fled_v4l2_flash_release,
> +				       priv->v4l2_flash);
> +	if (ret < 0)
> +		return dev_err_probe(priv->dev, ret, "failed to add cleanup action\n");

v4l2_flash_release()?

> +	return 0;
> +}
> +
> +static int s2m_fled_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct sec_pmic_dev *pmic_drvdata = dev_get_drvdata(dev->parent);

s/pmic_drvdata/ddata/

> +	struct s2m_fled *priv;
> +	bool channel_initialized[MAX_CHANNELS] = { false };
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv) * MAX_CHANNELS, GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);

Where is this used?

> +	priv->dev = dev;

This is already available to you in what is currently called:

  priv->cdev->led_cdev->dev

Also, isn't this an array?

> +	priv->regmap = pmic_drvdata->regmap_pmic;
> +
> +	switch (platform_get_device_id(pdev)->driver_data) {
> +	case S2MU005:
> +		priv->spec = &s2mu005_fled_spec;
> +		ret = s2mu005_fled_init(priv);
> +		if (ret)
> +			return ret;
> +		break;
> +	default:
> +		return dev_err_probe(dev, -ENODEV,
> +				     "device type %d is not supported by driver\n",
> +				     pmic_drvdata->device_type);
> +	}
> +
> +	if (priv->spec->nr_channels > MAX_CHANNELS)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "number of channels specified (%u) exceeds the limit (%u)\n",
> +				     priv->spec->nr_channels, MAX_CHANNELS);
> +
> +	device_for_each_child_node_scoped(dev, child) {
> +		u32 reg;
> +
> +		if (fwnode_property_read_u32(child, "reg", &reg))
> +			continue;
> +
> +		if (reg >= priv->spec->nr_channels) {
> +			dev_warn(dev, "channel %d is non-existent\n", reg);
> +			continue;
> +		}
> +
> +		if (channel_initialized[reg]) {

Do you really need a whole variable just for this?

If this a risk?  If it really is, why not check (priv[reg].dev)?

> +			dev_warn(dev, "duplicate node for channel %d\n", reg);
> +			continue;
> +		}
> +
> +		priv[reg].dev = priv->dev;

What on earth is going on here?

> +		priv[reg].regmap = priv->regmap;
> +		priv[reg].spec = priv->spec;
> +		priv[reg].reg_enable = priv->reg_enable;

And why do you need ${reg} copies of the same data?

Sounds like a waste of resources, no?

> +		priv[reg].channel = (u8)reg;
> +
> +		ret = devm_mutex_init(dev, &priv[reg].lock);

Why not just look the whole device?  Rather than per channel?

To channels have no shared resources?

> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to create mutex lock\n");

You can drop the ' lock' part.

> +
> +		ret = s2m_fled_init_channel(priv + reg, child);
> +		if (ret < 0)
> +			return ret;
> +
> +		channel_initialized[reg] = true;
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
> +/*
> + * Device is instantiated through parent MFD device and device matching
> + * is done through platform_device_id.
> + *
> + * However if device's DT node contains proper compatible and driver is
> + * built as a module, then the *module* matching will be done through DT
> + * aliases. This requires of_device_id table. In the same time this will
> + * not change the actual *device* matching so do not add .of_match_table.
> + */

All of this is already implied.

No need to have this comment on all MFD sub-devices.

> +static const struct of_device_id s2m_fled_of_match_table[] = {
> +	{
> +		.compatible = "samsung,s2mu005-flash",
> +		.data = (void *)S2MU005,

These usually fit on a single line.

> +	}, {
> +		/* sentinel */
> +	},
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
> 
> -- 
> 2.52.0
> 

-- 
Lee Jones [李琼斯]

