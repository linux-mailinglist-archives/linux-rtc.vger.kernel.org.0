Return-Path: <linux-rtc+bounces-202-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1A57E096C
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Nov 2023 20:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEC86281E86
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Nov 2023 19:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2293222EF9;
	Fri,  3 Nov 2023 19:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LWZl3gAN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BBBF508
	for <linux-rtc@vger.kernel.org>; Fri,  3 Nov 2023 19:23:23 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBDA5D51
	for <linux-rtc@vger.kernel.org>; Fri,  3 Nov 2023 12:23:18 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 038F640005;
	Fri,  3 Nov 2023 19:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699039397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=inw+zUQkXcUkUcEf97SI8dCxdTurEr/2iTCZJajeOCU=;
	b=LWZl3gANc5V5hyI9PiSaeiZrjL/carT/+SVgrpd5lBYtZss2atE/Couch9NzO90Dp2eE8z
	VEWgRXZ0vpiofe+FyATzCEl9o7e2YSBR+qMG53Bnlh74ceuKvXqP6blsH4jw2suqcb3x7R
	pptgn7m7z9QaZ+73PZvWi10vV7u8Oivi60U/wnA0iVc6bxxB9S46udL93MSuECDZ2mz0ew
	eNbcqA6cnEtm+RqwQOUt+EB4OCNUdRvOxiQ/OpNGCmKiBAm728P4mJapvt+iLLWUMbDQcm
	Y+aHApReLsATDG0teyZfDbIPR5KoVG9aXPGe+9xjZ24bLtgn+MFebcWsgmA24w==
Date: Fri, 3 Nov 2023 20:23:16 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 4/7] platform: cznic: turris-omnia-mcu: Add support
 for poweroff and wakeup
Message-ID: <202311031923161422b866@mail.local>
References: <20231026161803.16750-1-kabel@kernel.org>
 <20231026161803.16750-5-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231026161803.16750-5-kabel@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 26/10/2023 18:18:00+0200, Marek Behún wrote:
> +static int omnia_get_uptime_wakeup(const struct i2c_client *client, u32 *uptime,
> +				   u32 *wakeup)
> +{
> +	__le32 reply[2];
> +	int err;
> +
> +	err = omnia_cmd_read(client, CMD_GET_UPTIME_AND_WAKEUP, reply,
> +			     sizeof(reply));
> +	if (err)
> +		return err;
> +
> +	if (uptime)
> +		*uptime = le32_to_cpu(reply[0]);
> +
> +	if (wakeup)
> +		*wakeup = le32_to_cpu(reply[1]);
> +
> +	return 0;
> +}
> +
> +static int omnia_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	u32 uptime;
> +	int err;
> +
> +	err = omnia_get_uptime_wakeup(to_i2c_client(dev), &uptime, NULL);
> +	if (err)
> +		return err;

Does this get the real time or the board uptime?

> +
> +	rtc_time64_to_tm(uptime, tm);
> +
> +	return 0;
> +}
> +
> +static int omnia_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct omnia_mcu *mcu = i2c_get_clientdata(client);
> +	u32 wakeup;
> +	int err;
> +
> +	err = omnia_get_uptime_wakeup(client, NULL, &wakeup);
> +	if (err)
> +		return err;
> +
> +	alrm->enabled = !!wakeup;
> +	rtc_time64_to_tm(wakeup ?: mcu->rtc_alarm, &alrm->time);

I don't think this works properly as on boot, mcu->rtc_alarm will not be
set whereas wakeup could be.

Also, is wakeup actually an absolute time? I'm not sure I get how the
MCU works then.

> +
> +	return 0;
> +}
> +
> +static int omnia_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct omnia_mcu *mcu = i2c_get_clientdata(client);
> +
> +	mcu->rtc_alarm = rtc_tm_to_time64(&alrm->time);
> +
> +	if (alrm->enabled)
> +		return omnia_cmd_write_u32(client, CMD_SET_WAKEUP,
> +					   mcu->rtc_alarm);
> +
> +	return 0;
> +}
> +
> +static int omnia_alarm_irq_enable(struct device *dev, unsigned int enabled)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct omnia_mcu *mcu = i2c_get_clientdata(client);
> +
> +	return omnia_cmd_write_u32(client, CMD_SET_WAKEUP,
> +				   enabled ? mcu->rtc_alarm : 0);
> +}
> +
> +static const struct rtc_class_ops omnia_rtc_ops = {
> +	.read_time		= omnia_read_time,
> +	.read_alarm		= omnia_read_alarm,
> +	.set_alarm		= omnia_set_alarm,
> +	.alarm_irq_enable	= omnia_alarm_irq_enable,
> +};
> +
> +static int omnia_power_off(struct sys_off_data *data)
> +{
> +	struct omnia_mcu *mcu = data->cb_data;
> +	__be32 tmp;
> +	u8 cmd[9];
> +	u16 arg;
> +	int err;
> +
> +	if (mcu->front_button_poweron)
> +		arg = CMD_POWER_OFF_POWERON_BUTTON;
> +	else
> +		arg = 0;
> +
> +	cmd[0] = CMD_POWER_OFF;
> +	put_unaligned_le16(CMD_POWER_OFF_MAGIC, &cmd[1]);
> +	put_unaligned_le16(arg, &cmd[3]);
> +
> +	/*
> +	 * Although all values from and to MCU are passed in little-endian, the
> +	 * MCU's CRC unit uses big-endian CRC32 polynomial (0x04c11db7), so we
> +	 * need to use crc32_be() here.
> +	 */
> +	tmp = cpu_to_be32(get_unaligned_le32(&cmd[1]));
> +	put_unaligned_le32(crc32_be(0xffffffff, (void *)&tmp, sizeof(tmp)),
> +			   &cmd[5]);
> +
> +	err = omnia_cmd_write(mcu->client, cmd, sizeof(cmd));
> +	if (err)
> +		dev_err(&mcu->client->dev,
> +			"Unable to send the poweroff command: %d\n", err);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int omnia_restart(struct sys_off_data *data)
> +{
> +	struct omnia_mcu *mcu = data->cb_data;
> +	u8 cmd[3];
> +	int err;
> +
> +	cmd[0] = CMD_GENERAL_CONTROL;
> +
> +	if (reboot_mode == REBOOT_HARD)
> +		cmd[1] = cmd[2] = CTL_HARD_RST;
> +	else
> +		cmd[1] = cmd[2] = CTL_LIGHT_RST;
> +
> +	err = omnia_cmd_write(mcu->client, cmd, sizeof(cmd));
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
> +	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));
> +
> +	return sysfs_emit(buf, "%d\n", mcu->front_button_poweron);
> +}
> +
> +static ssize_t front_button_poweron_store(struct device *dev,
> +					  struct device_attribute *a,
> +					  const char *buf, size_t count)
> +{
> +	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));
> +	bool val;
> +	int err;
> +
> +	err = kstrtobool(buf, &val);
> +	if (err)
> +		return err;
> +
> +	mcu->front_button_poweron = val;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(front_button_poweron);
> +
> +static struct attribute *omnia_mcu_poweroff_attrs[] = {
> +	&dev_attr_front_button_poweron.attr,
> +	NULL
> +};
> +
> +static umode_t poweroff_attrs_visible(struct kobject *kobj, struct attribute *a,
> +				      int n)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));
> +
> +	if (mcu->features & FEAT_POWEROFF_WAKEUP)
> +		return a->mode;
> +
> +	return 0;
> +}
> +
> +const struct attribute_group omnia_mcu_poweroff_group = {
> +	.attrs = omnia_mcu_poweroff_attrs,
> +	.is_visible = poweroff_attrs_visible,
> +};
> +
> +int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu)
> +{
> +	struct device *dev = &mcu->client->dev;
> +	int err;
> +
> +	/* MCU restart is always available */
> +	err = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART,
> +					    SYS_OFF_PRIO_FIRMWARE,
> +					    omnia_restart, mcu);
> +	if (err)
> +		return dev_err_probe(dev, err,
> +				     "Cannot register system restart handler\n");
> +
> +	/*
> +	 * Poweroff and wakeup are available only if POWEROFF_WAKEUP feature is
> +	 * present.
> +	 */
> +	if (!(mcu->features & FEAT_POWEROFF_WAKEUP))
> +		return 0;
> +
> +	err = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
> +					    SYS_OFF_PRIO_FIRMWARE,
> +					    omnia_power_off, mcu);
> +	if (err)
> +		return dev_err_probe(dev, err,
> +				     "Cannot register system power off handler\n");
> +
> +	mcu->rtcdev = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(mcu->rtcdev))
> +		return dev_err_probe(dev, PTR_ERR(mcu->rtcdev),
> +				     "Cannot allocate RTC device\n");
> +
> +	mcu->rtcdev->ops = &omnia_rtc_ops;
> +	mcu->rtcdev->range_max = U32_MAX;

You probably need to add:

set_bit(RTC_FEATURE_ALARM_WAKEUP_ONLY, mcu->rtcdev->features);

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

