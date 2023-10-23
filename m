Return-Path: <linux-rtc+bounces-120-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA367D4064
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Oct 2023 21:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 790A62816B0
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Oct 2023 19:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AD4224F2;
	Mon, 23 Oct 2023 19:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A56224D3
	for <linux-rtc@vger.kernel.org>; Mon, 23 Oct 2023 19:40:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6313D6E
	for <linux-rtc@vger.kernel.org>; Mon, 23 Oct 2023 12:40:52 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="377291959"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="377291959"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 12:40:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="828561743"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="828561743"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 12:40:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC2)
	(envelope-from <andy@kernel.org>)
	id 1qv0n7-000000081Ru-3tfk;
	Mon, 23 Oct 2023 22:40:45 +0300
Date: Mon, 23 Oct 2023 22:40:45 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 4/7] platform: cznic: turris-omnia-mcu: Add support
 for poweroff and wakeup
Message-ID: <ZTbMPcP7HmBvY4YP@smile.fi.intel.com>
References: <20231023143130.11602-1-kabel@kernel.org>
 <20231023143130.11602-5-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231023143130.11602-5-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Oct 23, 2023 at 04:31:27PM +0200, Marek Behún wrote:
> Add support for true board poweroff (MCU can disable all unnecessary
> voltage regulators) and wakeup at a specified time, implemented via a
> RTC driver so that the rtcwake utility can be used to configure it.

...

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

> +	else

Redundant 'else'.

> +		return 0;
> +}

...

> +static int omnia_power_off(struct sys_off_data *data)
> +
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

> +	tmp = cpu_to_be32(get_unaligned_le32(&cmd[1]));
> +	put_unaligned_le32(crc32_be(0xffffffff, (void *)&tmp, sizeof(tmp)),
> +			   &cmd[5]);

Hmm... Why crc32_le*() can't be used?

> +	err = omnia_cmd_write(mcu->client, cmd, sizeof(cmd));
> +	if (err)
> +		dev_err(&mcu->client->dev,
> +			"Unable to send the poweroff command: %d\n", err);
> +
> +	return NOTIFY_DONE;
> +}

...

> +	if (kstrtobool(buf, &val) < 0)
> +		return -EINVAL;

Why is the error code shadowed?

...

> +	struct device *dev = container_of(kobj, typeof(*dev), kobj);

kobj_to_dev()?

...

> +	/*
> +	 * poweroff and wakeup are available only if POWEROFF_WAKEUP feature is
> +	 * present

Missing period at the end.

> +	 */

...

> +	err = devm_rtc_register_device(mcu->rtcdev);
> +	if (err)
> +		return dev_err_probe(dev, err, "Cannot register RTC device\n");
> +
> +	mcu->front_button_poweron = true;

> +	return err;

Can it be anything than 0?

-- 
With Best Regards,
Andy Shevchenko



