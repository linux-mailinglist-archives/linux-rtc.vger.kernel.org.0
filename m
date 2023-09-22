Return-Path: <linux-rtc+bounces-11-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 964617AB5E1
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Sep 2023 18:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by am.mirrors.kernel.org (Postfix) with ESMTP id 289631F23041
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Sep 2023 16:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6958F41AA3;
	Fri, 22 Sep 2023 16:28:39 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A27B168B2
	for <linux-rtc@vger.kernel.org>; Fri, 22 Sep 2023 16:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04471C433CC;
	Fri, 22 Sep 2023 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695400118;
	bh=l+e3As0KqCpCpzr2ULQbisBoX10SzXzBMsfhRSdefC8=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=DAEvhkP4urg98vsRpnu/s0wYBiC8sTCRa96NfjHM014FyDMGY8PWUDms2mvCSyq5/
	 8OugtgbBPfqYAwXJLdzg6LBfNDLA3l+WKMkKhTmhB0HF//Fnp1Mn6U2sCAoGK1QMEl
	 ZRZi0E5Ha6+/B3xBPZYY6yIa1np9j4PDsF43TLlFN8RP1SNZYeWc+qnGc1qvNHmQZh
	 devnhUVaN5CLC8Odk9Yu2cdWZ7LLMHJeob4pbeeEKfuvj6VW55GLMS+HPq0P0xqUQt
	 z7ya3sKZKit05oqbmlSi3NvY+2orrfQ5PDvAKOEX6MX66HgDeCPhyqNnrIL8q/ClFc
	 LFfU1FgkEm62Q==
Date: Fri, 22 Sep 2023 18:28:35 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 4/7] platform: cznic: turris-omnia-mcu: Add support
 for poweroff and wakeup
Message-ID: <20230922182835.5c694ef1@thinkpad>
In-Reply-To: <20230919103815.16818-5-kabel@kernel.org>
References: <20230919103815.16818-1-kabel@kernel.org>
	<20230919103815.16818-5-kabel@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Allesandro, Alexandre, would you be able to find some time to review
this patch?

Marek

On Tue, 19 Sep 2023 12:38:12 +0200
Marek Beh=C3=BAn <kabel@kernel.org> wrote:

> Add support for true board poweroff (MCU can disable all unnecessary
> voltage regulators) and wakeup at a specified time, implemented via a
> RTC driver so that the rtcwake utility can be used to configure it.
>=20
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---
>  .../sysfs-bus-i2c-devices-turris-omnia-mcu    |  16 ++
>  drivers/platform/cznic/Kconfig                |   4 +
>  drivers/platform/cznic/Makefile               |   1 +
>  .../platform/cznic/turris-omnia-mcu-base.c    |   4 +
>  .../platform/cznic/turris-omnia-mcu-gpio.c    |   2 -
>  .../cznic/turris-omnia-mcu-sys-off-wakeup.c   | 245 ++++++++++++++++++
>  drivers/platform/cznic/turris-omnia-mcu.h     |  19 ++
>  7 files changed, 289 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeu=
p.c
>=20
> diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia=
-mcu b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
> index c0efdf1b3803..d668b8e999e6 100644
> --- a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
> +++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
> @@ -14,6 +14,22 @@ Description:	(RW) The front button on the Turris Omnia=
 router can be
> =20
>  		Format: %s.
> =20
> +What:		/sys/bus/i2c/devices/<mcu_device>/front_button_poweron
> +Date:		August 2023
> +KernelVersion:	6.6
> +Contact:	Marek Beh=C3=BAn <kabel@kernel.org>
> +Description:	(RW) Newer versions of the microcontroller firmware of the
> +		Turris Omnia router support powering off the router into true
> +		low power mode. The router can be powered on by pressing the
> +		front button.
> +
> +		This file configures whether front button power on is enabled.
> +
> +		This file is present only if the power off feature is supported
> +		by the firmware.
> +
> +		Format: %i.
> +
>  What:		/sys/bus/i2c/devices/<mcu_device>/fw_features
>  Date:		August 2023
>  KernelVersion:	6.6
> diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kcon=
fig
> index 3a8c3edcd7e6..0a752aa654fa 100644
> --- a/drivers/platform/cznic/Kconfig
> +++ b/drivers/platform/cznic/Kconfig
> @@ -19,10 +19,14 @@ config TURRIS_OMNIA_MCU
>  	depends on I2C
>  	select GPIOLIB
>  	select GPIOLIB_IRQCHIP
> +	select RTC_CLASS
>  	help
>  	  Say Y here to add support for the features implemented by the
>  	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
>  	  The features include:
> +	  - board poweroff into true low power mode (with voltage regulators
> +	    disabled) and the ability to configure wake up from this mode (via
> +	    rtcwake)
>  	  - GPIO pins
>  	    - to get front button press events (the front button can be
>  	      configured either to generate press events to the CPU or to change
> diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Mak=
efile
> index a6177f5b4fff..6f1470d1f673 100644
> --- a/drivers/platform/cznic/Makefile
> +++ b/drivers/platform/cznic/Makefile
> @@ -3,3 +3,4 @@
>  obj-$(CONFIG_TURRIS_OMNIA_MCU)	+=3D turris-omnia-mcu.o
>  turris-omnia-mcu-objs		:=3D turris-omnia-mcu-base.o
>  turris-omnia-mcu-objs		+=3D turris-omnia-mcu-gpio.o
> +turris-omnia-mcu-objs		+=3D turris-omnia-mcu-sys-off-wakeup.o
> diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/pla=
tform/cznic/turris-omnia-mcu-base.c
> index 2954151468e5..b507f81ebe0a 100644
> --- a/drivers/platform/cznic/turris-omnia-mcu-base.c
> +++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
> @@ -226,6 +226,10 @@ static int omnia_mcu_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D omnia_mcu_register_sys_off_and_wakeup(mcu);
> +	if (ret)
> +		return ret;
> +
>  	return 0;
>  }
> =20
> diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/pla=
tform/cznic/turris-omnia-mcu-gpio.c
> index e8d5eeb4eb31..3d34a32bc7b0 100644
> --- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
> +++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
> @@ -5,8 +5,6 @@
>   * 2023 by Marek Beh=C3=BAn <kabel@kernel.org>
>   */
> =20
> -#include <asm/unaligned.h>
> -
>  #include "turris-omnia-mcu.h"
> =20
>  static const char * const omnia_mcu_gpio_names[64] =3D {
> diff --git a/drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c b/d=
rivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c
> new file mode 100644
> index 000000000000..07ae92d819e3
> --- /dev/null
> +++ b/drivers/platform/cznic/turris-omnia-mcu-sys-off-wakeup.c
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * CZ.NIC's Turris Omnia MCU system off and RTC wakeup driver
> + *
> + * This is not a true RTC driver (in the sense that it does not provide a
> + * real-time clock), rather the MCU implements a wakeup from powered off=
 state
> + * at a specified time relative to MCU boot, and we expose this feature =
via RTC
> + * alarm, so that it can be used via the rtcwake command, which is the s=
tandard
> + * Linux command for this.
> + *
> + * 2023 by Marek Beh=C3=BAn <kabel@kernel.org>
> + */
> +
> +#include <linux/crc32.h>
> +#include <linux/delay.h>
> +#include <linux/reboot.h>
> +
> +#include "turris-omnia-mcu.h"
> +
> +static int omnia_get_uptime_wakeup(const struct i2c_client *client, u32 =
*uptime,
> +				   u32 *wakeup)
> +{
> +	u32 reply[2];
> +	int err;
> +
> +	err =3D omnia_cmd_read(client, CMD_GET_UPTIME_AND_WAKEUP, reply,
> +			     sizeof(reply));
> +	if (err)
> +		return err;
> +
> +	if (uptime)
> +		*uptime =3D le32_to_cpu(reply[0]);
> +
> +	if (wakeup)
> +		*wakeup =3D le32_to_cpu(reply[1]);
> +
> +	return 0;
> +}
> +
> +static int omnia_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	u32 uptime;
> +	int err;
> +
> +	err =3D omnia_get_uptime_wakeup(to_i2c_client(dev), &uptime, NULL);
> +	if (err)
> +		return err;
> +
> +	rtc_time64_to_tm(uptime, tm);
> +
> +	return 0;
> +}
> +
> +static int omnia_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct omnia_mcu *mcu =3D i2c_get_clientdata(client);
> +	u32 wakeup;
> +	int err;
> +
> +	err =3D omnia_get_uptime_wakeup(client, NULL, &wakeup);
> +	if (err)
> +		return err;
> +
> +	alrm->enabled =3D !!wakeup;
> +	rtc_time64_to_tm(wakeup ?: mcu->rtc_alarm, &alrm->time);
> +
> +	return 0;
> +}
> +
> +static int omnia_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct omnia_mcu *mcu =3D i2c_get_clientdata(client);
> +
> +	mcu->rtc_alarm =3D rtc_tm_to_time64(&alrm->time);
> +
> +	if (alrm->enabled)
> +		return omnia_cmd_write_u32(client, CMD_SET_WAKEUP,
> +					   mcu->rtc_alarm);
> +	else
> +		return 0;
> +}
> +
> +static int omnia_alarm_irq_enable(struct device *dev, unsigned int enabl=
ed)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct omnia_mcu *mcu =3D i2c_get_clientdata(client);
> +
> +	return omnia_cmd_write_u32(client, CMD_SET_WAKEUP,
> +				   enabled ? mcu->rtc_alarm : 0);
> +}
> +
> +static const struct rtc_class_ops omnia_rtc_ops =3D {
> +	.read_time		=3D omnia_read_time,
> +	.read_alarm		=3D omnia_read_alarm,
> +	.set_alarm		=3D omnia_set_alarm,
> +	.alarm_irq_enable	=3D omnia_alarm_irq_enable,
> +};
> +
> +static int omnia_power_off(struct sys_off_data *data)
> +{
> +	struct omnia_mcu *mcu =3D data->cb_data;
> +	u8 cmd[9];
> +	u32 tmp;
> +	u16 arg;
> +	int err;
> +
> +	if (mcu->front_button_poweron)
> +		arg =3D CMD_POWER_OFF_POWERON_BUTTON;
> +	else
> +		arg =3D 0;
> +
> +	cmd[0] =3D CMD_POWER_OFF;
> +	put_unaligned_le16(CMD_POWER_OFF_MAGIC, &cmd[1]);
> +	put_unaligned_le16(arg, &cmd[3]);
> +
> +	tmp =3D cpu_to_be32(get_unaligned_le32(&cmd[1]));
> +	put_unaligned_le32(crc32_be(0xffffffff, (void *)&tmp, sizeof(tmp)),
> +			   &cmd[5]);
> +
> +	err =3D omnia_cmd_write(mcu->client, cmd, sizeof(cmd));
> +	if (err)
> +		dev_err(&mcu->client->dev,
> +			"Unable to send the poweroff command: %d\n", err);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int omnia_restart(struct sys_off_data *data)
> +{
> +	struct omnia_mcu *mcu =3D data->cb_data;
> +	u8 cmd[3];
> +	int err;
> +
> +	cmd[0] =3D CMD_GENERAL_CONTROL;
> +
> +	if (reboot_mode =3D=3D REBOOT_HARD)
> +		cmd[1] =3D cmd[2] =3D CTL_HARD_RST;
> +	else
> +		cmd[1] =3D cmd[2] =3D CTL_LIGHT_RST;
> +
> +	err =3D omnia_cmd_write(mcu->client, cmd, sizeof(cmd));
> +	if (err)
> +		dev_err(&mcu->client->dev,
> +			"Unable to send the restart command: %d\n", err);
> +
> +	/*
> +	 * MCU needs a little bit to process the I2C command, otherwise it will
> +	 * do a light reset based on SOC SYSRES_OUT pin.
> +	 */
> +	mdelay(1);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static ssize_t front_button_poweron_show(struct device *dev,
> +					 struct device_attribute *a, char *buf)
> +{
> +	struct omnia_mcu *mcu =3D i2c_get_clientdata(to_i2c_client(dev));
> +
> +	return sysfs_emit(buf, "%d\n", mcu->front_button_poweron);
> +}
> +
> +static ssize_t front_button_poweron_store(struct device *dev,
> +					  struct device_attribute *a,
> +					  const char *buf, size_t count)
> +{
> +	struct omnia_mcu *mcu =3D i2c_get_clientdata(to_i2c_client(dev));
> +	bool val;
> +
> +	if (kstrtobool(buf, &val) < 0)
> +		return -EINVAL;
> +
> +	mcu->front_button_poweron =3D val;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(front_button_poweron);
> +
> +static struct attribute *omnia_mcu_poweroff_attrs[] =3D {
> +	&dev_attr_front_button_poweron.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group omnia_mcu_poweroff_group =3D {
> +	.attrs =3D omnia_mcu_poweroff_attrs,
> +};
> +
> +int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu)
> +{
> +	struct device *dev =3D &mcu->client->dev;
> +	int err;
> +
> +	/* MCU restart is always available */
> +	err =3D devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART,
> +					    SYS_OFF_PRIO_FIRMWARE,
> +					    omnia_restart, mcu);
> +	if (err) {
> +		dev_err(dev, "Cannot register system restart handler: %d\n",
> +			err);
> +		return err;
> +	}
> +
> +	/*
> +	 * poweroff and wakeup are available only if POWEROFF_WAKEUP feature is
> +	 * present
> +	 */
> +	if (!(mcu->features & FEAT_POWEROFF_WAKEUP))
> +		return 0;
> +
> +	err =3D devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
> +					    SYS_OFF_PRIO_FIRMWARE,
> +					    omnia_power_off, mcu);
> +	if (err) {
> +		dev_err(dev, "Cannot register system power off handler: %d\n",
> +			err);
> +		return err;
> +	}
> +
> +	mcu->rtcdev =3D devm_rtc_allocate_device(dev);
> +	if (IS_ERR(mcu->rtcdev)) {
> +		err =3D PTR_ERR(mcu->rtcdev);
> +		dev_err(dev, "Cannot allocate RTC device: %d\n", err);
> +		return err;
> +	}
> +
> +	mcu->rtcdev->ops =3D &omnia_rtc_ops;
> +	mcu->rtcdev->range_max =3D U32_MAX;
> +
> +	err =3D devm_rtc_register_device(mcu->rtcdev);
> +	if (err) {
> +		dev_err(dev, "Cannot register RTC device: %d\n", err);
> +		return err;
> +	}
> +
> +	mcu->front_button_poweron =3D true;
> +
> +	err =3D devm_device_add_group(dev, &omnia_mcu_poweroff_group);
> +	if (err)
> +		dev_err(dev, "Cannot add poweroff sysfs attribute group: %d\n",
> +			err);
> +
> +	return err;
> +}
> diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform=
/cznic/turris-omnia-mcu.h
> index b5802240aa8d..c40ac07be5f5 100644
> --- a/drivers/platform/cznic/turris-omnia-mcu.h
> +++ b/drivers/platform/cznic/turris-omnia-mcu.h
> @@ -9,10 +9,12 @@
>  #define __DRIVERS_PLATFORM_CZNIC_TURRIS_OMNIA_MCU_H
> =20
>  #include <asm/byteorder.h>
> +#include <asm/unaligned.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/i2c.h>
>  #include <linux/log2.h>
>  #include <linux/mutex.h>
> +#include <linux/rtc.h>
>  #include <linux/turris-omnia-mcu-interface.h>
>  #include <linux/workqueue.h>
> =20
> @@ -29,6 +31,11 @@ struct omnia_mcu {
>  	u16 last_status;
>  	struct delayed_work button_release_emul_work;
>  	bool button_pressed_emul;
> +
> +	/* RTC device for configuring wake-up */
> +	struct rtc_device *rtcdev;
> +	u32 rtc_alarm;
> +	bool front_button_poweron;
>  };
> =20
>  static inline int omnia_cmd_write(const struct i2c_client *client, void =
*cmd,
> @@ -39,6 +46,17 @@ static inline int omnia_cmd_write(const struct i2c_cli=
ent *client, void *cmd,
>  	return ret < 0 ? ret : 0;
>  }
> =20
> +static inline int omnia_cmd_write_u32(const struct i2c_client *client, u=
8 cmd,
> +				      u32 val)
> +{
> +	u8 buf[5];
> +
> +	buf[0] =3D cmd;
> +	put_unaligned_le32(val, &buf[1]);
> +
> +	return omnia_cmd_write(client, buf, sizeof(buf));
> +}
> +
>  static inline int omnia_cmd_read(const struct i2c_client *client, u8 cmd=
, void *reply,
>  				 unsigned int len)
>  {
> @@ -117,5 +135,6 @@ static inline int omnia_cmd_read_u8(const struct i2c_=
client *client, u8 cmd)
> =20
>  int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
>  void omnia_mcu_unregister_gpiochip(struct omnia_mcu *mcu);
> +int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu);
> =20
>  #endif /* __DRIVERS_PLATFORM_CZNIC_TURRIS_OMNIA_MCU_H */


