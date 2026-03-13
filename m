Return-Path: <linux-rtc+bounces-6200-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMO1Er90tGmUoQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6200-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 21:34:07 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E16F4289C5F
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 21:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A008730219DF
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2026 20:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A2D377EA5;
	Fri, 13 Mar 2026 20:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="ioS2A3Si"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724C636EAAB;
	Fri, 13 Mar 2026 20:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773434007; cv=none; b=d39b/fcunROvBnBTB8noKtthf2NGm53CjWzrcLe1aimch5mUDKU7Icx0a4qcTjPYnZcDHqg4qsRoLj4RIwdcTL4nY5BXqcb3BXGEEGWcjWrdiSOIwSaCkHPXB9/VCqsZErw45E93VUKQmtd5MNB+gDq5w4Jj/rejF2WIA4OKbT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773434007; c=relaxed/simple;
	bh=kkMkm9YhO4xYkDf88+z9S0SoxZOq8LJ3W3seELHrHTU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IauqZ1385tbagr6jIVtco9Uuqexo/bypzm8XQOP0VrEdlzMwdIBDOTLvqCmtJY6h1WXPaW8y2iKYdNcwBXPN/h/kwTcmjYKB5PwUD12xegMR/MHcJMnoHBWpJBAkJ8TluntE3Z9ohuhOf1USlRB4Vg18ztiH1g1cuEQ3KkM2fxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=ioS2A3Si; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id F35F326FAE;
	Fri, 13 Mar 2026 21:33:15 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u456WQI8D3io; Fri, 13 Mar 2026 21:33:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1773433994; bh=kkMkm9YhO4xYkDf88+z9S0SoxZOq8LJ3W3seELHrHTU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=ioS2A3SieWznt09DUPMY/KqfJl3RDRGFA3lnn2IEs9ghpchdQ3/pt+07gRJuC/ZAZ
	 s7OCs0jUdQZRgbTgDJ9Sue5MIm8A3F2DyPeluuzRM7eCx3dCLihoccBhcnfXqXiijp
	 lmjk9oRX7uJEQdAN4wZi0qOz2OlVjTUFgHuAWwSRuuoLpHTtgeibX0lRZihTescGhg
	 8/U0P7+f346rVmMG29ZqezekwPLJCP4yvdmqypR+wFjxXIHCMbov1qBjoFWJZ4xoYm
	 wDvrnUq8O9uCx8fa9JQKOOxI+grgfD1yN9MtDNlRF3BuSFpUotPHEhjcFZNYlKrc5q
	 0UfCoCAzLKVPA==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 02:03:03 +0530
Message-Id: <DH1XVOS6IIOE.HGIH6JQRHNAM@disroot.org>
Cc: "Pavel Machek" <pavel@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "MyungJoo Ham" <myungjoo.ham@samsung.com>, "Chanwoo
 Choi" <cw00.choi@samsung.com>, "Sebastian Reichel" <sre@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Nam Tran" <trannamatk@gmail.com>,
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 09/13] leds: flash: add support for Samsung S2M
 series PMIC flash LED device
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Lee Jones" <lee@kernel.org>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>
References: <20260225-s2mu005-pmic-v3-0-b4afee947603@disroot.org>
 <20260225-s2mu005-pmic-v3-9-b4afee947603@disroot.org>
 <20260310113835.GG183676@google.com>
In-Reply-To: <20260310113835.GG183676@google.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6200-lists,linux-rtc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[disroot.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E16F4289C5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-10 11:38 +00:00, Lee Jones wrote:
> On Wed, 25 Feb 2026, Kaustabh Chakraborty wrote:
>
>> Add support for flash LEDs found in certain Samsung S2M series PMICs.
>> The device has two channels for LEDs, typically for the back and front
>> cameras in mobile devices. Both channels can be independently
>> controlled, and can be operated in torch or flash modes.
>>=20
>> The driver includes initial support for the S2MU005 PMIC flash LEDs.
>>=20
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  drivers/leds/flash/Kconfig          |  12 +
>>  drivers/leds/flash/Makefile         |   1 +
>>  drivers/leds/flash/leds-s2m-flash.c | 429 +++++++++++++++++++++++++++++=
+++++++
>>  3 files changed, 442 insertions(+)
>>=20
>> diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
>> index 5e08102a67841..be62e05277429 100644
>> --- a/drivers/leds/flash/Kconfig
>> +++ b/drivers/leds/flash/Kconfig
>> @@ -114,6 +114,18 @@ config LEDS_RT8515
>>  	  To compile this driver as a module, choose M here: the module
>>  	  will be called leds-rt8515.
>> =20
>> +config LEDS_S2M_FLASH
>> +	tristate "Samsung S2M series PMICs flash/torch LED support"
>> +	depends on LEDS_CLASS
>> +	depends on MFD_SEC_CORE
>> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
>> +	select REGMAP_IRQ
>> +	help
>> +	  This option enables support for the flash/torch LEDs found in
>> +	  certain Samsung S2M series PMICs, such as the S2MU005. It has
>> +	  a LED channel dedicated for every physical LED. The LEDs can
>> +	  be controlled in flash and torch modes.
>> +
>>  config LEDS_SGM3140
>>  	tristate "LED support for the SGM3140"
>>  	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
>> diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
>> index 712fb737a428e..44e6c1b4beb37 100644
>> --- a/drivers/leds/flash/Makefile
>> +++ b/drivers/leds/flash/Makefile
>> @@ -10,6 +10,7 @@ obj-$(CONFIG_LEDS_MAX77693)	+=3D leds-max77693.o
>>  obj-$(CONFIG_LEDS_QCOM_FLASH)	+=3D leds-qcom-flash.o
>>  obj-$(CONFIG_LEDS_RT4505)	+=3D leds-rt4505.o
>>  obj-$(CONFIG_LEDS_RT8515)	+=3D leds-rt8515.o
>> +obj-$(CONFIG_LEDS_S2M_FLASH)	+=3D leds-s2m-flash.o
>>  obj-$(CONFIG_LEDS_SGM3140)	+=3D leds-sgm3140.o
>>  obj-$(CONFIG_LEDS_SY7802)	+=3D leds-sy7802.o
>>  obj-$(CONFIG_LEDS_TPS6131X)	+=3D leds-tps6131x.o
>> diff --git a/drivers/leds/flash/leds-s2m-flash.c b/drivers/leds/flash/le=
ds-s2m-flash.c
>> new file mode 100644
>> index 0000000000000..536a529889a9c
>> --- /dev/null
>> +++ b/drivers/leds/flash/leds-s2m-flash.c
>> @@ -0,0 +1,429 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Flash and Torch LED Driver for Samsung S2M series PMICs.
>> + *
>> + * Copyright (c) 2015 Samsung Electronics Co., Ltd
>> + * Copyright (c) 2025 Kaustabh Chakraborty <kauschluss@disroot.org>
>> + */
>> +
>> +#include <linux/container_of.h>
>> +#include <linux/led-class-flash.h>
>> +#include <linux/mfd/samsung/core.h>
>> +#include <linux/mfd/samsung/s2mu005.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <media/v4l2-flash-led-class.h>
>> +
>> +#define MAX_CHANNELS	2
>> +
>> +struct s2m_fled {
>
> This is not the fled, change this to _led and call pointers to it 'led'.
>
>> +	struct device *dev;
>> +	struct regmap *regmap;
>> +	struct led_classdev_flash cdev;
>
> This is the 'fled'.  Please change all pointer to it to 'fled'.
>
>> +	struct v4l2_flash *v4l2_flash;
>> +	/*
>> +	 * The mutex object prevents the concurrent access of flash control
>> +	 * registers by the LED and V4L2 subsystems.
>> +	 */
>> +	struct mutex lock;
>> +	const struct s2m_fled_spec *spec;
>
> This should not be in here.
>
>> +	unsigned int reg_enable;
>> +	u8 channel;
>> +	u8 flash_brightness;
>> +	u8 flash_timeout;
>> +};
>> +
>> +struct s2m_fled_spec {
>> +	u8 nr_channels;
>> +	u32 torch_max_brightness;
>> +	u32 flash_min_current_ua;
>> +	u32 flash_max_current_ua;
>> +	u32 flash_min_timeout_us;
>> +	u32 flash_max_timeout_us;
>> +	int (*torch_brightness_set_blocking)(struct led_classdev *led_cdev,
>> +					     enum led_brightness brightness);
>
> I'm really not a fan of pointers to functions at the driver level.
>
> If there are differences between devices, which I cannot see here, store
> an identifier and use that to choose which call-back function is the
> most appropriate.
>
>> +	const struct led_flash_ops *flash_ops;
>
> Why do we need to store these?
>
> The same principles apply to the function pointer above.

Yes, I have done exactly that. I have moved these values in
s2m_fled_init_channel() and renamed it s2mu005_fled_init_channel(). This
function will be chosen as a result of evaluation of a switch-block.

>> +};
>> +
>> +static struct led_classdev_flash *to_cdev_flash(struct led_classdev *cd=
ev)
>> +{
>> +	return container_of(cdev, struct led_classdev_flash, led_cdev);
>> +}
>> +
>> +static struct s2m_fled *to_led_priv(struct led_classdev_flash *cdev)
>
> There is nothing private about s2m_{f}led.
>
> 'led' is the most common nomenclature.  So: led->channel, etc.
>
> Remove 'priv' throughout.
>
>> +{
>> +	return container_of(cdev, struct s2m_fled, cdev);
>
> 	return container_of(fled, struct s2m_led, fled);
>
>> +}
>> +
>> +static int s2m_fled_flash_brightness_set(struct led_classdev_flash *cde=
v,
>> +					 u32 brightness)
>> +{
>> +	struct s2m_fled *priv =3D to_led_priv(cdev);
>> +	struct led_flash_setting *setting =3D &cdev->brightness;
>> +
>> +	priv->flash_brightness =3D (brightness - setting->min) / setting->step=
;
>> +
>> +	return 0;
>> +}
>> +
>> +static int s2m_fled_flash_timeout_set(struct led_classdev_flash *cdev,
>> +				      u32 timeout)
>> +{
>> +	struct s2m_fled *priv =3D to_led_priv(cdev);
>> +	struct led_flash_setting *setting =3D &cdev->timeout;
>> +
>> +	priv->flash_timeout =3D (timeout - setting->min) / setting->step;
>> +
>> +	return 0;
>> +}
>> +
>> +#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
>> +static int s2m_fled_flash_external_strobe_set(struct v4l2_flash *v4l2_f=
lash,
>> +					      bool enable)
>> +{
>> +	struct s2m_fled *priv =3D to_led_priv(v4l2_flash->fled_cdev);
>> +
>> +	mutex_lock(&priv->lock);
>> +
>> +	priv->cdev.ops->strobe_set(&priv->cdev, enable);
>> +
>> +	mutex_unlock(&priv->lock);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_flash_ops s2m_fled_v4l2_flash_ops =3D {
>> +	.external_strobe_set =3D s2m_fled_flash_external_strobe_set,
>> +};
>> +#else
>> +static const struct v4l2_flash_ops s2m_fled_v4l2_flash_ops;
>> +#endif
>> +
>> +static void s2m_fled_v4l2_flash_release(void *v4l2_flash)
>> +{
>> +	v4l2_flash_release(v4l2_flash);
>> +}
>> +
>> +static int s2mu005_fled_torch_brightness_set(struct led_classdev *cdev,
>> +					     enum led_brightness value)
>> +{
>> +	struct s2m_fled *priv =3D to_led_priv(to_cdev_flash(cdev));
>> +	struct regmap *regmap =3D priv->regmap;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->lock);
>> +
>> +	if (value =3D=3D LED_OFF) {
>
> These defines are deprecated.
>
> From include/linux/leds.h:
>
> /* This is obsolete/useless. We now support variable maximum brightness. =
*/
> enum led_brightness {
>         LED_OFF         =3D 0,
>         LED_ON          =3D 1,
>         LED_HALF        =3D 127,
>         LED_FULL        =3D 255,
> };
>

Let me know what am I supposed to use then. The
brightness_set_blocking() function is defined as such:

	int (*brightness_set_blocking)(struct led_classdev *led_cdev,
				       enum led_brightness brightness);

Which has enum led_brightness as one of its params.

Do I just ignore the 'obsolete' param for now and replace ` =3D=3D LED_OFF`
with a logical NOT?

>> +		ret =3D regmap_clear_bits(regmap, priv->reg_enable,
>> +					S2MU005_FLED_TORCH_EN(priv->channel));
>> +		if (ret < 0)
>> +			dev_err(priv->dev, "failed to disable torch LED\n");
>> +		goto unlock;
>> +	}
>> +
>> +	ret =3D regmap_update_bits(regmap, S2MU005_REG_FLED_CH_CTRL1(priv->cha=
nnel),
> j> +				 S2MU005_FLED_TORCH_IOUT,
>> +				 FIELD_PREP(S2MU005_FLED_TORCH_IOUT, value - 1));
>> +	if (ret < 0) {
>> +		dev_err(priv->dev, "failed to set torch current\n");
>> +		goto unlock;
>> +	}
>> +
>> +	ret =3D regmap_set_bits(regmap, priv->reg_enable,
>> +			      S2MU005_FLED_TORCH_EN(priv->channel));
>> +	if (ret < 0) {
>> +		dev_err(priv->dev, "failed to enable torch LED\n");
>> +		goto unlock;
>> +	}
>> +
>> +unlock:
>> +	mutex_unlock(&priv->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int s2mu005_fled_flash_strobe_set(struct led_classdev_flash *cde=
v,
>> +					 bool state)
>> +{
>> +	struct s2m_fled *priv =3D to_led_priv(cdev);
>> +	struct regmap *regmap =3D priv->regmap;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->lock);
>> +
>> +	ret =3D regmap_clear_bits(regmap, priv->reg_enable,
>> +				S2MU005_FLED_FLASH_EN(priv->channel));
>> +	if (ret < 0) {
>> +		dev_err(priv->dev, "failed to disable flash LED\n");
>> +		goto unlock;
>> +	}
>> +
>> +	if (!state)
>> +		goto unlock;
>> +
>> +	ret =3D regmap_update_bits(regmap, S2MU005_REG_FLED_CH_CTRL0(priv->cha=
nnel),
>> +				 S2MU005_FLED_FLASH_IOUT,
>> +				 FIELD_PREP(S2MU005_FLED_FLASH_IOUT,
>> +					    priv->flash_brightness));
>> +	if (ret < 0) {
>> +		dev_err(priv->dev, "failed to set flash brightness\n");
>> +		goto unlock;
>> +	}
>> +
>> +	ret =3D regmap_update_bits(regmap, S2MU005_REG_FLED_CH_CTRL3(priv->cha=
nnel),
>> +				 S2MU005_FLED_FLASH_TIMEOUT,
>> +				 FIELD_PREP(S2MU005_FLED_FLASH_TIMEOUT,
>> +					    priv->flash_timeout));
>> +	if (ret < 0) {
>> +		dev_err(priv->dev, "failed to set flash timeout\n");
>> +		goto unlock;
>> +	}
>> +
>> +	ret =3D regmap_set_bits(regmap, priv->reg_enable,
>> +			      S2MU005_FLED_FLASH_EN(priv->channel));
>> +	if (ret < 0) {
>> +		dev_err(priv->dev, "failed to enable flash LED\n");
>> +		goto unlock;
>> +	}
>> +
>> +unlock:
>> +	mutex_unlock(&priv->lock);
>> +
>> +	return 0;
>> +}
>> +
>> +static int s2mu005_fled_flash_strobe_get(struct led_classdev_flash *cde=
v,
>> +					 bool *state)
>> +{
>> +	struct s2m_fled *priv =3D to_led_priv(cdev);
>> +	struct regmap *regmap =3D priv->regmap;
>
> Since this is only used once, I don't see anything to gain from
> utilising a local variable here.
>
>> +	u8 channel =3D priv->channel;
>
> Same here.
>
>> +	u32 val;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->lock);
>> +
>> +	ret =3D regmap_read(regmap, S2MU005_REG_FLED_STATUS, &val);
>> +	if (ret < 0) {
>> +		dev_err(priv->dev, "failed to fetch LED status");
>> +		goto unlock;
>> +	}
>> +
>> +	*state =3D !!(val & S2MU005_FLED_FLASH_STATUS(channel));
>> +
>> +unlock:
>> +	mutex_unlock(&priv->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct led_flash_ops s2mu005_fled_flash_ops =3D {
>> +	.flash_brightness_set =3D s2m_fled_flash_brightness_set,
>> +	.timeout_set =3D s2m_fled_flash_timeout_set,
>> +	.strobe_set =3D s2mu005_fled_flash_strobe_set,
>> +	.strobe_get =3D s2mu005_fled_flash_strobe_get,
>> +};
>> +
>> +static int s2mu005_fled_init(struct s2m_fled *priv)
>> +{
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	/* Enable the LED channels. */
>> +	ret =3D regmap_set_bits(priv->regmap, S2MU005_REG_FLED_CTRL1,
>> +			      S2MU005_FLED_CH_EN);
>
> Feel free to use up to 100-char to eradicate these wraps.
>
>> +	if (ret < 0)
>> +		return dev_err_probe(priv->dev, ret, "failed to enable LED channels\n=
");
>> +
>> +	/*
>> +	 * Get the LED enable register address. Revision EVT0 has the
>> +	 * register at CTRL4, while EVT1 and higher have it at CTRL6.
>> +	 */
>> +	ret =3D regmap_read(priv->regmap, S2MU005_REG_ID, &val);
>> +	if (ret < 0)
>> +		return dev_err_probe(priv->dev, ret, "failed to read revision\n");
>> +
>> +	if (FIELD_GET(S2MU005_ID_MASK, val) =3D=3D 0)
>
> A comment above to explain what this means please.

A comment is right above the regmap read. I will shift it below. (Seems
also like its a bit incorrect, will fix that too.)

>
> And/or define the zero to something obvious.
>
>> +		priv->reg_enable =3D S2MU005_REG_FLED_CTRL4;
>> +	else
>> +		priv->reg_enable =3D S2MU005_REG_FLED_CTRL6;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct s2m_fled_spec s2mu005_fled_spec =3D {
>> +	.nr_channels =3D 2,
>> +	.torch_max_brightness =3D 16,
>> +	.flash_min_current_ua =3D 25000,
>> +	.flash_max_current_ua =3D 375000, /* 400000 causes flickering */
>> +	.flash_min_timeout_us =3D 62000,
>> +	.flash_max_timeout_us =3D 992000,
>> +	.torch_brightness_set_blocking =3D s2mu005_fled_torch_brightness_set,
>> +	.flash_ops =3D &s2mu005_fled_flash_ops,
>> +};
>> +
>> +static int s2m_fled_init_channel(struct s2m_fled *priv,
>> +				 struct fwnode_handle *fwnp)
>
> Unwrap all of these that fit into 100-chars.
>
>> +{
>> +	struct led_classdev *led =3D &priv->cdev.led_cdev;
>> +	struct led_init_data init_data =3D {};
>> +	struct v4l2_flash_config v4l2_cfg =3D {};
>> +	int ret;
>> +
>> +	led->max_brightness =3D priv->spec->torch_max_brightness;
>> +	led->brightness_set_blocking =3D priv->spec->torch_brightness_set_bloc=
king;
>> +	led->flags |=3D LED_DEV_CAP_FLASH;
>> +
>> +	priv->cdev.timeout.min =3D priv->spec->flash_min_timeout_us;
>> +	priv->cdev.timeout.step =3D priv->spec->flash_min_timeout_us;
>> +	priv->cdev.timeout.max =3D priv->spec->flash_max_timeout_us;
>> +	priv->cdev.timeout.val =3D priv->spec->flash_max_timeout_us;
>> +
>> +	priv->cdev.brightness.min =3D priv->spec->flash_min_current_ua;
>> +	priv->cdev.brightness.step =3D priv->spec->flash_min_current_ua;
>> +	priv->cdev.brightness.max =3D priv->spec->flash_max_current_ua;
>> +	priv->cdev.brightness.val =3D priv->spec->flash_max_current_ua;
>
> Moving things around in priv/data tells me that something isn't right.
>
> I think the spec should be removed from what is currently called priv.
>
>> +	s2m_fled_flash_timeout_set(&priv->cdev, priv->cdev.timeout.val);
>> +	s2m_fled_flash_brightness_set(&priv->cdev, priv->cdev.brightness.val);
>> +
>> +	priv->cdev.ops =3D priv->spec->flash_ops;
>> +
>> +	init_data.fwnode =3D fwnp;
>> +	ret =3D devm_led_classdev_flash_register_ext(priv->dev, &priv->cdev,
>> +						   &init_data);
>> +	if (ret < 0)
>> +		return dev_err_probe(priv->dev, ret, "failed to create LED flash devi=
ce\n");
>> +
>> +	v4l2_cfg.intensity.min =3D priv->spec->flash_min_current_ua;
>> +	v4l2_cfg.intensity.step =3D priv->spec->flash_min_current_ua;
>> +	v4l2_cfg.intensity.max =3D priv->spec->flash_max_current_ua;
>> +	v4l2_cfg.intensity.val =3D priv->spec->flash_max_current_ua;
>> +
>> +	v4l2_cfg.has_external_strobe =3D true;
>> +
>> +	priv->v4l2_flash =3D v4l2_flash_init(priv->dev, fwnp, &priv->cdev,
>> +					   &s2m_fled_v4l2_flash_ops, &v4l2_cfg);
>> +	if (IS_ERR(priv->v4l2_flash)) {
>> +		v4l2_flash_release(priv->v4l2_flash);
>> +		return dev_err_probe(priv->dev, PTR_ERR(priv->v4l2_flash),
>> +				     "failed to create V4L2 flash device\n");
>> +	}
>> +
>> +	ret =3D devm_add_action_or_reset(priv->dev, (void *)s2m_fled_v4l2_flas=
h_release,
>> +				       priv->v4l2_flash);
>> +	if (ret < 0)
>> +		return dev_err_probe(priv->dev, ret, "failed to add cleanup action\n"=
);
>
> v4l2_flash_release()?

Why would we call flash_release here? it should be called when the
driver is unloaded.

Regarding that, I have added an action which does exactly that. The
actual function is wrapped in s2m_fled_v4l2_flash_release() so as to not
make CFI unhappy.

>
>> +	return 0;
>> +}
>> +
>> +static int s2m_fled_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	struct sec_pmic_dev *pmic_drvdata =3D dev_get_drvdata(dev->parent);
>
> s/pmic_drvdata/ddata/
>
>> +	struct s2m_fled *priv;
>> +	bool channel_initialized[MAX_CHANNELS] =3D { false };
>> +	int ret;
>> +
>> +	priv =3D devm_kzalloc(dev, sizeof(*priv) * MAX_CHANNELS, GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	platform_set_drvdata(pdev, priv);
>
> Where is this used?

>> +	priv->dev =3D dev;
>
> This is already available to you in what is currently called:
>
>   priv->cdev->led_cdev->dev

I am assuming priv->dev is to be removed so as to save space.

>
> Also, isn't this an array?
>

Yeah so, about that. It allocates n-many s2m_fled (now s2m_led) for
n-many LEDs. it does all allocations in the first struct here, and then
for subsequent LEDs it copies them over (that's the convoluted logic
below). Not the cleanest solution, maybe there's a better way to solve
it? [a solution discussed below]

>> +	priv->regmap =3D pmic_drvdata->regmap_pmic;
>> +
>> +	switch (platform_get_device_id(pdev)->driver_data) {
>> +	case S2MU005:
>> +		priv->spec =3D &s2mu005_fled_spec;
>> +		ret =3D s2mu005_fled_init(priv);
>> +		if (ret)
>> +			return ret;
>> +		break;
>> +	default:
>> +		return dev_err_probe(dev, -ENODEV,
>> +				     "device type %d is not supported by driver\n",
>> +				     pmic_drvdata->device_type);
>> +	}
>> +
>> +	if (priv->spec->nr_channels > MAX_CHANNELS)
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "number of channels specified (%u) exceeds the limit (%u)\n",
>> +				     priv->spec->nr_channels, MAX_CHANNELS);
>> +
>> +	device_for_each_child_node_scoped(dev, child) {
>> +		u32 reg;
>> +
>> +		if (fwnode_property_read_u32(child, "reg", &reg))
>> +			continue;
>> +
>> +		if (reg >=3D priv->spec->nr_channels) {
>> +			dev_warn(dev, "channel %d is non-existent\n", reg);
>> +			continue;
>> +		}
>> +
>> +		if (channel_initialized[reg]) {
>
> Do you really need a whole variable just for this?
>
> If this a risk?  If it really is, why not check (priv[reg].dev)?

Your above comment suggests an alternative approach to get dev from
priv. Assuming you implied that priv->dev be removed, doesn't this come
in conflict?

The same thing however can be done with regmap, so that's a possibility.
I will move over the `priv->regmap =3D pmic_drvdata->regmap_pmic` from
above and add it only if the channel is initialized.
As a bonus this also removes "setting pointers to the first element and
copying them over" procedure, that would be a cleaner solution as well.

>> +			dev_warn(dev, "duplicate node for channel %d\n", reg);
>> +			continue;
>> +		}
>> +
>> +		priv[reg].dev =3D priv->dev;
>
> What on earth is going on here?
>
>> +		priv[reg].regmap =3D priv->regmap;
>> +		priv[reg].spec =3D priv->spec;
>> +		priv[reg].reg_enable =3D priv->reg_enable;
>
> And why do you need ${reg} copies of the same data?
>
> Sounds like a waste of resources, no?
>
>> +		priv[reg].channel =3D (u8)reg;
>> +
>> +		ret =3D devm_mutex_init(dev, &priv[reg].lock);
>
> Why not just look the whole device?  Rather than per channel?
>
> To channels have no shared resources?

No, they are independent as far as I can tell.

>> +		if (ret)
>> +			return dev_err_probe(dev, ret, "failed to create mutex lock\n");
>
> You can drop the ' lock' part.
>
>> +
>> +		ret =3D s2m_fled_init_channel(priv + reg, child);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		channel_initialized[reg] =3D true;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct platform_device_id s2m_fled_id_table[] =3D {
>> +	{ "s2mu005-flash", S2MU005 },
>> +	{ /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(platform, s2m_fled_id_table);
>> +
>> +/*
>> + * Device is instantiated through parent MFD device and device matching
>> + * is done through platform_device_id.
>> + *
>> + * However if device's DT node contains proper compatible and driver is
>> + * built as a module, then the *module* matching will be done through D=
T
>> + * aliases. This requires of_device_id table. In the same time this wil=
l
>> + * not change the actual *device* matching so do not add .of_match_tabl=
e.
>> + */
>
> All of this is already implied.
>
> No need to have this comment on all MFD sub-devices.
>
>> +static const struct of_device_id s2m_fled_of_match_table[] =3D {
>> +	{
>> +		.compatible =3D "samsung,s2mu005-flash",
>> +		.data =3D (void *)S2MU005,
>
> These usually fit on a single line.
>
>> +	}, {
>> +		/* sentinel */
>> +	},
>> +};
>> +MODULE_DEVICE_TABLE(of, s2m_fled_of_match_table);
>> +
>> +static struct platform_driver s2m_fled_driver =3D {
>> +	.driver =3D {
>> +		.name =3D "s2m-flash",
>> +	},
>> +	.probe =3D s2m_fled_probe,
>> +	.id_table =3D s2m_fled_id_table,
>> +};
>> +module_platform_driver(s2m_fled_driver);
>> +
>> +MODULE_DESCRIPTION("Flash/Torch LED Driver For Samsung S2M Series PMICs=
");
>> +MODULE_AUTHOR("Kaustabh Chakraborty <kauschluss@disroot.org>");
>> +MODULE_LICENSE("GPL");
>>=20
>> --=20
>> 2.52.0
>>=20


