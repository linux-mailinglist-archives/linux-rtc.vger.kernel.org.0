Return-Path: <linux-rtc+bounces-6477-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C5kGTvb/Gl9UgAAu9opvQ
	(envelope-from <linux-rtc+bounces-6477-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 07 May 2026 20:34:35 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C44014ED7CB
	for <lists+linux-rtc@lfdr.de>; Thu, 07 May 2026 20:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B21083035268
	for <lists+linux-rtc@lfdr.de>; Thu,  7 May 2026 18:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906F04508F2;
	Thu,  7 May 2026 18:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HsTxio2y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ED4466B63;
	Thu,  7 May 2026 18:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778178841; cv=none; b=BP1q05JL1RNvfvkp9GXG3x3UsryytAeaZe7NBc5g4LCWml/syYkvSwBGdXpUrtb/jzTNoGl+pTmtBWST2yZMP+kB13hNWbPvRwTnvXvh/KpCOBGf+dqFQYDz3ndJHDsq9r03Z/3ffWqLLtx9hToOlVkCYYavTGn9oqbB2XAacpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778178841; c=relaxed/simple;
	bh=D4dt37yXLL0edwzLumYtDYUeQFmnkqCrsicPXx941mY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DurnlrZh860NqiYyWmzD0G6rHGYaGYPBjs3Ixy6t1Qto0vctUpTKQnvT0+JoK9g1ys5mRJmqL/7sql1Q2RvZtZ5+VmR2UyMoOw9VeKphLEgxzHtG3sPxSEKkGoj9hy+w4t3L/dJJPfcAr7hLa4vlg9vOl9ydxcwrrK2S+RhnDmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HsTxio2y; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 41BD227174;
	Thu,  7 May 2026 20:33:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9KnIYgvsfA0; Thu,  7 May 2026 20:33:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778178828; bh=D4dt37yXLL0edwzLumYtDYUeQFmnkqCrsicPXx941mY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=HsTxio2yNSFoGBeCluUZJmtcziNk9S1ev2SrHHXqrPzH/OSubIlC+/9zwXvK5PHsM
	 4wfgBuGwq9PGZEdcdMm52V70NZ1AlUjHvN/YaYA7ymwwHYsk2aRv+d198RoBWQ22G2
	 C2NbhOQkmPMmnRkxS8okC8pU5JJy0DQUK4ncKID5QUkryLIoZflpMDnabJpNnzB1ZV
	 tb54UFQa8RlU71nEnZ6+6NynJP+/kp19ot6ZJCG5RqD7tEScRdbw9k3UOb7VbC+jZ3
	 NPE/NBI2CfkVh1l6r57+ULdm0CaPLYY1gAit4Md90r/nimCCa2Gj59VaxanwJo5kv3
	 bvdzMPrcsxHvg==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 May 2026 00:03:31 +0530
Message-Id: <DICNS4WYM1BY.C1WROHZ5D687@disroot.org>
Cc: "Pavel Machek" <pavel@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "MyungJoo Ham" <myungjoo.ham@samsung.com>, "Chanwoo
 Choi" <cw00.choi@samsung.com>, "Sebastian Reichel" <sre@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Nam Tran" <trannamatk@gmail.com>,
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>,
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v5 07/11] leds: flash: add support for Samsung S2M
 series PMIC flash LED device
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Lee Jones" <lee@kernel.org>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>
References: <20260424-s2mu005-pmic-v5-0-fcbc9da5a004@disroot.org>
 <20260424-s2mu005-pmic-v5-7-fcbc9da5a004@disroot.org>
 <20260507164654.GS305027@google.com>
In-Reply-To: <20260507164654.GS305027@google.com>
X-Rspamd-Queue-Id: C44014ED7CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6477-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[disroot.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,disroot.org:email,disroot.org:mid,disroot.org:dkim]
X-Rspamd-Action: no action

On 2026-05-07 17:46 +01:00, Lee Jones wrote:
> On Fri, 24 Apr 2026, Kaustabh Chakraborty wrote:
>
>> Add support for flash LEDs in certain Samsung S2M series PMICs.
>> The device has two channels for LEDs, typically for the back and front
>> cameras in mobile devices. Both channels can be independently
>> controlled, and can be operated in torch or flash modes.
>>=20
>> The driver includes initial support for the S2MU005 PMIC flash LEDs.
>>=20
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  drivers/leds/flash/Kconfig          |  12 ++
>>  drivers/leds/flash/Makefile         |   1 +
>>  drivers/leds/flash/leds-s2m-flash.c | 358 +++++++++++++++++++++++++++++=
+++++++
>>  3 files changed, 371 insertions(+)
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
>
> The `|| !V4L2_FLASH_LED_CLASS` part of this dependency makes it
> unconditionally true. Was this intended? Perhaps this dependency can be
> removed entirely.

Right? Similar lines are also present in entries of other drivers too.
It is indeed weird, but I disregarded my doubts and added it anyway.

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
>> index 0000000000000..177d23b432ce6
>> --- /dev/null
>> +++ b/drivers/leds/flash/leds-s2m-flash.c
>> @@ -0,0 +1,358 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Flash and Torch LED Driver for Samsung S2M series PMICs.
>> + *
>> + * Copyright (c) 2015 Samsung Electronics Co., Ltd
>> + * Copyright (c) 2026 Kaustabh Chakraborty <kauschluss@disroot.org>
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
>> +struct s2m_led {
>> +	struct regmap *regmap;
>> +	struct led_classdev_flash fled;
>> +	struct v4l2_flash *v4l2_flash;
>> +	/*
>> +	 * The mutex object prevents the concurrent access of flash control
>> +	 * registers by the LED and V4L2 subsystems.
>> +	 */
>> +	struct mutex lock;
>> +	unsigned int reg_enable;
>> +	u8 channel;
>> +	u8 flash_brightness;
>> +	u8 flash_timeout;
>> +};
>> +
>> +static struct s2m_led *to_s2m_led(struct led_classdev_flash *fled)
>> +{
>> +	return container_of(fled, struct s2m_led, fled);
>> +}
>> +
>> +static struct led_classdev_flash *to_s2m_fled(struct led_classdev *cdev=
)
>> +{
>> +	return container_of(cdev, struct led_classdev_flash, led_cdev);
>> +}
>> +
>> +static int s2m_fled_flash_brightness_set(struct led_classdev_flash *fle=
d, u32 brightness)
>> +{
>> +	struct s2m_led *led =3D to_s2m_led(fled);
>> +	struct led_flash_setting *setting =3D &fled->brightness;
>> +
>> +	led->flash_brightness =3D (brightness - setting->min) / setting->step;
>> +
>> +	return 0;
>> +}
>> +
>> +static int s2m_fled_flash_timeout_set(struct led_classdev_flash *fled, =
u32 timeout)
>> +{
>> +	struct s2m_led *led =3D to_s2m_led(fled);
>> +	struct led_flash_setting *setting =3D &fled->timeout;
>> +
>> +	led->flash_timeout =3D (timeout - setting->min) / setting->step;
>> +
>> +	return 0;
>> +}
>> +
>> +#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
>> +static int s2m_fled_flash_external_strobe_set(struct v4l2_flash *v4l2_f=
lash, bool enable)
>> +{
>> +	struct s2m_led *led =3D to_led(v4l2_flash->fled_cdev);
>
> What is to_led()?
>
> Was this tested?

I honestly don't know what happened here, and yes this (well, not this
precisely) was tested. I had changed something later? Don't know, its
odd. Will fix.

>> +	mutex_lock(&led->lock);
>> +
>> +	led->fled.ops->strobe_set(&led->fled, enable);
>> +
>> +	mutex_unlock(&led->lock);
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
>> +static int s2mu005_fled_torch_brightness_set(struct led_classdev *cdev,=
 enum led_brightness value)
>> +{
>> +	struct s2m_led *led =3D to_s2m_led(to_s2m_fled(cdev));
>> +	int ret;
>> +
>> +	mutex_lock(&led->lock);
>> +
>> +	if (!value) {
>> +		ret =3D regmap_clear_bits(led->regmap, led->reg_enable,
>> +					S2MU005_FLED_TORCH_EN(led->channel));
>> +		if (ret < 0)
>> +			dev_err(cdev->dev, "failed to disable torch LED\n");
>> +		goto unlock;
>> +	}
>> +
>> +	ret =3D regmap_update_bits(led->regmap, S2MU005_REG_FLED_CH_CTRL1(led-=
>channel),
>> +				 S2MU005_FLED_TORCH_IOUT,
>> +				 FIELD_PREP(S2MU005_FLED_TORCH_IOUT, value - 1));
>> +	if (ret < 0) {
>
> Is a positive number even possible?

As per the docs, no. Will fix here and in other instances as well.

>> +		dev_err(cdev->dev, "failed to set torch current\n");
>> +		goto unlock;
>> +	}
>> +
>> +	ret =3D regmap_set_bits(led->regmap, led->reg_enable, S2MU005_FLED_TOR=
CH_EN(led->channel));
>> +	if (ret < 0) {
>> +		dev_err(cdev->dev, "failed to enable torch LED\n");
>> +		goto unlock;
>> +	}
>> +
>> +unlock:
>> +	mutex_unlock(&led->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int s2mu005_fled_flash_strobe_set(struct led_classdev_flash *fle=
d, bool state)
>> +{
>> +	struct s2m_led *led =3D to_s2m_led(fled);
>> +	int ret;
>> +
>> +	mutex_lock(&led->lock);
>> +
>> +	ret =3D regmap_clear_bits(led->regmap, led->reg_enable, S2MU005_FLED_F=
LASH_EN(led->channel));
>> +	if (ret < 0) {
>> +		dev_err(fled->led_cdev.dev, "failed to disable flash LED\n");
>> +		goto unlock;
>> +	}
>> +
>> +	if (!state)
>> +		goto unlock;
>> +
>> +	ret =3D regmap_update_bits(led->regmap, S2MU005_REG_FLED_CH_CTRL0(led-=
>channel),
>> +				 S2MU005_FLED_FLASH_IOUT,
>> +				 FIELD_PREP(S2MU005_FLED_FLASH_IOUT, led->flash_brightness));
>> +	if (ret < 0) {
>> +		dev_err(fled->led_cdev.dev, "failed to set flash brightness\n");
>> +		goto unlock;
>> +	}
>> +
>> +	ret =3D regmap_update_bits(led->regmap, S2MU005_REG_FLED_CH_CTRL3(led-=
>channel),
>> +				 S2MU005_FLED_FLASH_TIMEOUT,
>> +				 FIELD_PREP(S2MU005_FLED_FLASH_TIMEOUT, led->flash_timeout));
>> +	if (ret < 0) {
>> +		dev_err(fled->led_cdev.dev, "failed to set flash timeout\n");
>> +		goto unlock;
>> +	}
>> +
>> +	ret =3D regmap_set_bits(led->regmap, led->reg_enable, S2MU005_FLED_FLA=
SH_EN(led->channel));
>> +	if (ret < 0) {
>> +		dev_err(fled->led_cdev.dev, "failed to enable flash LED\n");
>> +		goto unlock;
>> +	}
>> +
>> +unlock:
>> +	mutex_unlock(&led->lock);
>> +
>> +	return 0;
>
> It seems like this function swallows error codes.
>
> Better if they're propagated properly.
>
>> +}
>> +
>> +static int s2mu005_fled_flash_strobe_get(struct led_classdev_flash *fle=
d, bool *state)
>> +{
>> +	struct s2m_led *led =3D to_s2m_led(fled);
>> +	u32 val;
>> +	int ret;
>> +
>> +	mutex_lock(&led->lock);
>> +
>> +	ret =3D regmap_read(led->regmap, S2MU005_REG_FLED_STATUS, &val);
>> +	if (ret < 0) {
>> +		dev_err(fled->led_cdev.dev, "failed to fetch LED status");
>
> Missed '/n'.
>
>> +		goto unlock;
>> +	}
>> +
>> +	*state =3D !!(val & S2MU005_FLED_FLASH_STATUS(led->channel));
>> +
>> +unlock:
>> +	mutex_unlock(&led->lock);
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
>> +static int s2mu005_fled_init(struct s2m_led *led, struct device *dev, s=
truct regmap *regmap,
>> +			     unsigned int nr_channels)
>> +{
>> +	unsigned int val;
>> +	int i, ret;
>> +
>> +	/* Enable the LED channels. */
>> +	ret =3D regmap_set_bits(regmap, S2MU005_REG_FLED_CTRL1, S2MU005_FLED_C=
H_EN);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to enable LED channels\n");
>> +
>> +	ret =3D regmap_read(regmap, S2MU005_REG_ID, &val);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to read revision\n");
>> +
>> +	for (i =3D 0; i < nr_channels; i++) {
>
> for (int i =3D 0; i < nr_channels; i++)

Is that allowed in the kernel source? I have never seen variable
declaration in a for loop.

>> +		/*
>> +		 * Read the revision register. Revision EVT0 has the register
>> +		 * at CTRL4, while EVT1 and higher have it at CTRL6.
>> +		 */
>> +		if (FIELD_GET(S2MU005_ID_MASK, val) =3D=3D 0)
>
> Why not remove the " =3D=3D 0" and reverse the branches?

My intention was to make it explicit that the value used is an integer
value, as opposed to a boolean.

>> +			led[i].reg_enable =3D S2MU005_REG_FLED_CTRL4;
>> +		else
>> +			led[i].reg_enable =3D S2MU005_REG_FLED_CTRL6;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int s2mu005_fled_init_channel(struct s2m_led *led, struct device=
 *dev,
>> +				     struct fwnode_handle *fwnp)
>> +{
>> +	struct led_classdev *cdev =3D &led->fled.led_cdev;
>> +	struct led_init_data init_data =3D {};
>> +	struct v4l2_flash_config v4l2_cfg =3D {};
>> +	int ret;
>> +
>> +	cdev->max_brightness =3D 16;
>> +	cdev->brightness_set_blocking =3D s2mu005_fled_torch_brightness_set;
>> +	cdev->flags |=3D LED_DEV_CAP_FLASH;
>> +
>> +	led->fled.timeout.min =3D 62000;
>> +	led->fled.timeout.step =3D 62000;
>> +	led->fled.timeout.max =3D 992000;
>> +	led->fled.timeout.val =3D 992000;
>> +
>> +	led->fled.brightness.min =3D 25000;
>> +	led->fled.brightness.step =3D 25000;
>> +	led->fled.brightness.max =3D 375000; /* 400000 causes flickering */
>> +	led->fled.brightness.val =3D 375000;
>> +
>> +	s2m_fled_flash_timeout_set(&led->fled, led->fled.timeout.val);
>> +	s2m_fled_flash_brightness_set(&led->fled, led->fled.brightness.val);
>> +
>> +	led->fled.ops =3D &s2mu005_fled_flash_ops;
>> +
>> +	init_data.fwnode =3D fwnp;
>> +	ret =3D devm_led_classdev_flash_register_ext(dev, &led->fled, &init_da=
ta);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to create LED flash device\n")=
;
>> +
>> +	v4l2_cfg.intensity.min =3D led->fled.timeout.min;
>> +	v4l2_cfg.intensity.step =3D led->fled.timeout.step;
>> +	v4l2_cfg.intensity.max =3D led->fled.timeout.max;
>> +	v4l2_cfg.intensity.val =3D led->fled.timeout.val;
>
> Is it correct to configure the V4L2 intensity settings from the timeout
> values?  I would expect these to be based on the brightness settings.

Stupid me. Admittedly, I am unable to test the v4l2 functionality
properly for now. I will remove all related code in the next revision.
Will add them back when they're needed and I'm able to test.

>> +
>> +	v4l2_cfg.has_external_strobe =3D true;
>> +
>> +	led->v4l2_flash =3D v4l2_flash_init(dev, fwnp, &led->fled, &s2m_fled_v=
4l2_flash_ops,
>> +					  &v4l2_cfg);
>> +	if (IS_ERR(led->v4l2_flash)) {
>> +		v4l2_flash_release(led->v4l2_flash);
>
> So you're going to try and release an error?
>
>> +		return dev_err_probe(dev, PTR_ERR(led->v4l2_flash),
>> +				     "failed to create V4L2 flash device\n");
>> +	}
>> +
>> +	ret =3D devm_add_action_or_reset(dev, (void *)s2m_fled_v4l2_flash_rele=
ase, led->v4l2_flash);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to add cleanup action\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static int s2m_fled_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	struct sec_pmic_dev *ddata =3D dev_get_drvdata(dev->parent);
>> +	struct s2m_led *led;
>> +	int ret;
>> +
>> +	led =3D devm_kzalloc(dev, sizeof(*led) * MAX_CHANNELS, GFP_KERNEL);
>> +	if (!led)
>> +		return -ENOMEM;
>> +
>> +	switch (platform_get_device_id(pdev)->driver_data) {
>> +	case S2MU005:
>> +		ret =3D s2mu005_fled_init(led, dev, ddata->regmap_pmic, MAX_CHANNELS)=
;
>> +		if (ret)
>> +			return ret;
>> +		break;
>> +	default:
>> +		return dev_err_probe(dev, -ENODEV, "device type %d is not supported b=
y driver\n",
>> +				     ddata->device_type);
>> +	}
>
> Will this be expanded in the very near future?
>
> If not, having a switch () with only one entry seems odd.

I have plans to introduce support for S2MU004 at one point. I'll change
it now, and re-introduce the switch block later.

> if (platform_get_device_id(pdev)->driver_data !=3D S2MU005)
> 	dev_err_probe()
>
>> +	device_for_each_child_node_scoped(dev, child) {
>> +		u32 reg;
>> +
>> +		if (fwnode_property_read_u32(child, "reg", &reg))
>> +			continue;
>> +
>> +		if (led[reg].regmap) {
>> +			dev_warn(dev, "duplicate node for channel %d\n", reg);
>> +			continue;
>> +		}
>
> If reg > MAX_CHANNELS, you just created an OOB condition.
>
>> +
>> +		led[reg].regmap =3D ddata->regmap_pmic;
>> +		led[reg].channel =3D (u8)reg;
>> +
>> +		ret =3D devm_mutex_init(dev, &led[reg].lock);
>> +		if (ret)
>> +			return dev_err_probe(dev, ret, "failed to create mutex\n");
>> +
>> +		switch (platform_get_device_id(pdev)->driver_data) {
>> +		case S2MU005:
>> +			ret =3D s2mu005_fled_init_channel(led + reg, dev, child);
>> +			if (ret < 0)
>> +				return ret;
>> +			break;
>> +		}
>
> This is even more odd!

What's exactly odd about it?

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
>> +static const struct of_device_id s2m_fled_of_match_table[] =3D {
>> +	{ .compatible =3D "samsung,s2mu005-flash", .data =3D (void *)S2MU005 }=
,
>> +	{ /* sentinel */ },
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


