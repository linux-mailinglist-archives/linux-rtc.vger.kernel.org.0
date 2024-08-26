Return-Path: <linux-rtc+bounces-1744-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BE295FDC9
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Aug 2024 01:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3B891F22892
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 23:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5037519AD81;
	Mon, 26 Aug 2024 23:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Cq257ckE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49883199392;
	Mon, 26 Aug 2024 23:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724714996; cv=none; b=THHRtsxFZtqBtaE2k2ADUGnXNhPKC61sC+rPxumNDFSAskX5pyhbWAEB6P1+rku5F4PDZgXVlXPd8x9fJ9Nyb39gu4mSwsGp8xfn9TFZndl8X4e6zrtyHGjS6Y0Ihby0coj9C2bpkqHzFrcJdswr+O4m9kQdUZhZyFsDZJnJRqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724714996; c=relaxed/simple;
	bh=iCRiOUaaP58Tjngce3tqWJoDvbnpuk3mIXTfCRNQ724=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMp0kmyIsaU/zCWxLcG4YgdpwzcwQ0/yhxtdg2ipZOY81W0b53v1Ow/bhg7NQnun4wVmy526NpiPS3WV+cGSA8dICOHxi2XbrdEV3a0PgmY32W/K+GdaPMxpibu/yE72kTrNcIgOuToCPFvnc+4J0iDc3nlcl8lUH/Js4dGhxIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Cq257ckE; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00E4A20002;
	Mon, 26 Aug 2024 23:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724714990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4gGMzmNkm5FiP+IrbdnCv5MnGwNVvTdL3Tijp9YVLg=;
	b=Cq257ckEFRhxzgBhJ4iTw3UBo649lnxBNoySX/Fslcb39dyjhrtddenE44+70EuU5NYC1z
	PfbX8RTK6oNVD2n9EPRZwhMdeyxl35FwuxERdXPAmyq4rj8EPYBbXMItrZ3bur9Pa7mW87
	rQdxJNNoaQQvrVa4/5kfK4Kt/PSFmPj5aFW4ehe5EJIT4kbb76VchiwwuAwGAL46zwveVZ
	3a94tlAV+dpXh7sgytAawVzicx1nWu/tq8NuhMF1K3/R0F1cDz0s2LWyqmRr2V4KyZA/Lu
	I2jsaHYzDfi5+wyJk72G1kEFGFtbJ+zmlI1YExOTiq7RjMRjD6zsHNPjVY5/lA==
Date: Tue, 27 Aug 2024 01:29:49 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: gomba007@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	csokas.bence@prolan.hu
Subject: Re: [PATCH v4] drivers: rtc: Add driver for SD2405AL.
Message-ID: <20240826232949440fe798@mail.local>
References: <20240624-rtc-sd2405al-v4-1-2b2bc759f98f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240624-rtc-sd2405al-v4-1-2b2bc759f98f@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

Please run checkpatch with --strict, you have remaining issues to fix.

On 24/06/2024 13:25:13+0200, Tóth János via B4 Relay wrote:
> diff --git a/drivers/rtc/rtc-sd2405al.c b/drivers/rtc/rtc-sd2405al.c
> new file mode 100644
> index 000000000000..5440cc1aed1d
> --- /dev/null
> +++ b/drivers/rtc/rtc-sd2405al.c
> @@ -0,0 +1,319 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * RTC driver for the SD2405AL Real-Time Clock
> + *
> + * Datasheet:
> + * https://image.dfrobot.com/image/data/TOY0021/SD2405AL%20datasheet%20(Angelo%20v0.1).pdf
> + *
> + * Copyright (C) 2024 Tóth János <gomba007@gmail.com>
> + * Copyright (C) 2018 Zoro Li <long17.cool@163.com> (rtc-sd3078.c)
> + * Copyright (C) 2005 James Chapman (rtc-ds1307.c)
Are you sure those two Copyrights apply?

> + */
> +
> +static int sd2405al_setup(struct sd2405al *sd2405al)
> +{
> +	int ret;
> +
> +	/* order of writes is important */
> +	/*
> +	 * CTR2.WRTC1 = 1, device is writable
> +	 * CTR2.IM = 0, single event alarm
> +	 * CTR2.S{1,0} = 0, disable INT pin
> +	 * CTR2.FOBAT = 0, interrupt enabled during battery backup mode
> +	 * CTR2.INTDE = 0, countdown interrupt disabled
> +	 * CTR2.INTAE = 0, alarm interrupt disabled
> +	 * CTR2.INTFE = 0, frequency interrupt disabled
> +	 */
> +	ret = regmap_write(sd2405al->regmap, SD2405AL_REG_CTR2,
> +			   SD2405AL_BIT_WRTC1);

The whole goal of an RTC is to have a life cycle that is longer than the
system. It seems that this function resets important bits (e.g disabling
interrupts and alarms) at probe time, this must be avoided.

> +	if (ret < 0) {
> +		dev_err(sd2405al->dev, "write failed: %d\n", ret);

There is nothing to learn from this kind of error message an it is not
going to be actionable for the user whereas they are bloating the kernel
for everyone.


> +		return ret;
> +	}
> +
> +	/*
> +	 * CTR2.WRTC3 = 1, device is writable
> +	 * CTR1.INTAF = 0, clear alarm interrupt flag
> +	 * CTR2.INTDF = 0, clear countdown interrupt flag
> +	 * CTR2.WRTC2 = 1, device is writable
> +	 */
> +	ret = regmap_write(sd2405al->regmap, SD2405AL_REG_CTR1,
> +			   SD2405AL_BIT_WRTC2 | SD2405AL_BIT_WRTC3);
> +	if (ret < 0) {
> +		dev_err(sd2405al->dev, "write failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * CRT3.ARTS = 0, disable auto reset of interrupt flags
> +	 * CTR3.TDS{1,0} = 0, unused, since countdown interrupt is disabled
> +	 * CTR3.FS{3,2,1,0} = 0, unused since frequency interrupt is disabled
> +	 */
> +	ret = regmap_write(sd2405al->regmap, SD2405AL_REG_CTR3, 0);
> +	if (ret < 0) {
> +		dev_err(sd2405al->dev, "write failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = sd2405al_check_writable(sd2405al);
> +	if (ret == 0) {
> +		dev_err(sd2405al->dev, "device is not writable\n");

What should the user d after seeing this message?

> +		return -EINVAL;
> +	} else if (ret < 0) {
> +		return ret;
> +	} else {
> +		dev_dbg(sd2405al->dev, "device is writable\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static int sd2405al_read_time(struct device *dev, struct rtc_time *time)
> +{
> +	u8 data[SD2405AL_NUM_T_REGS] = { 0 };
> +	struct sd2405al *sd2405al = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = regmap_bulk_read(sd2405al->regmap, SD2405AL_REG_T_SEC, data,
> +			       SD2405AL_NUM_T_REGS);
> +	if (ret < 0) {
> +		dev_err(sd2405al->dev, "read failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (data[SD2405AL_REG_T_SEC] & 0x80) {
> +		dev_err(sd2405al->dev, "invalid second\n");
> +		return -EINVAL;
> +	}
> +
> +	if (data[SD2405AL_REG_T_MIN] & 0x80) {
> +		dev_err(sd2405al->dev, "invalid minute\n");
> +		return -EINVAL;
> +	}
> +
> +	if (data[SD2405AL_REG_T_HOUR] & 0x40) {
> +		dev_err(sd2405al->dev, "invalid hour\n");
> +		return -EINVAL;
> +	}
> +
> +	if (data[SD2405AL_REG_T_WEEK] & 0xF8) {
> +		dev_err(sd2405al->dev, "invalid week\n");
> +		return -EINVAL;
> +	}
> +
> +	if (data[SD2405AL_REG_T_DAY] & 0xC0) {
> +		dev_err(sd2405al->dev, "invalid day\n");
> +		return -EINVAL;
> +	}
> +
> +	if (data[SD2405AL_REG_T_MON] & 0xE0) {
> +		dev_err(sd2405al->dev, "invalid month\n");
> +		return -EINVAL;
> +	}

Same thing for all those messages, also are the checks actually
necessary?

> +
> +	time->tm_sec = bcd2bin(data[SD2405AL_REG_T_SEC] & 0x7F);
> +	time->tm_min = bcd2bin(data[SD2405AL_REG_T_MIN] & 0x7F);
> +
> +	if (data[SD2405AL_REG_T_HOUR] & SD2405AL_BIT_24H)
> +		time->tm_hour = bcd2bin(data[SD2405AL_REG_T_HOUR] & 0x3F);
> +	else
> +		if (data[SD2405AL_REG_T_HOUR] & SD2405AL_BIT_12H_PM)
> +			time->tm_hour = bcd2bin(data[SD2405AL_REG_T_HOUR]
> +						& 0x1F) + 12;
> +		else /* 12 hour mode, AM */
> +			time->tm_hour = bcd2bin(data[SD2405AL_REG_T_HOUR]
> +						& 0x1F);
> +
> +	time->tm_wday = data[SD2405AL_REG_T_WEEK] & 0x07;
> +	time->tm_mday = bcd2bin(data[SD2405AL_REG_T_DAY] & 0x3F);
> +	time->tm_mon = bcd2bin(data[SD2405AL_REG_T_MON] & 0x1F) - 1;
> +	time->tm_year = bcd2bin(data[SD2405AL_REG_T_YEAR]) + 100;
> +
> +	dev_dbg(sd2405al->dev, "read time: %d-%02d-%02d %02d:%02d:%02d\n",
> +			       time->tm_year, time->tm_mon, time->tm_mday,
> +			       time->tm_hour, time->tm_min, time->tm_sec);

%ptR maybe?

> +
> +	return 0;
> +}
> +
> +static int sd2405al_set_time(struct device *dev, struct rtc_time *time)
> +{
> +	u8 data[SD2405AL_NUM_T_REGS];
> +	struct sd2405al *sd2405al = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = sd2405al_check_writable(sd2405al);
> +	if (ret == 0) {
> +		dev_err(sd2405al->dev, "device is not writable\n");
> +		return -EINVAL;
> +	} else if (ret < 0) {
> +		return ret;
> +	} else {
> +		dev_dbg(sd2405al->dev, "device is writable\n");
> +	}
> +
> +	data[SD2405AL_REG_T_SEC] = bin2bcd(time->tm_sec);
> +	data[SD2405AL_REG_T_MIN] = bin2bcd(time->tm_min);
> +	data[SD2405AL_REG_T_HOUR] = bin2bcd(time->tm_hour) | SD2405AL_BIT_24H;
> +	data[SD2405AL_REG_T_DAY] = bin2bcd(time->tm_mday);
> +	data[SD2405AL_REG_T_WEEK] = time->tm_wday & 0x07;
> +	data[SD2405AL_REG_T_MON] = bin2bcd(time->tm_mon) + 1;
> +	data[SD2405AL_REG_T_YEAR] = bin2bcd(time->tm_year - 100);
> +
> +	ret = regmap_bulk_write(sd2405al->regmap, SD2405AL_REG_T_SEC, data,
> +				SD2405AL_NUM_T_REGS);
> +	if (ret < 0) {
> +		dev_err(sd2405al->dev, "write failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(sd2405al->dev, "set time: %d-%02d-%02d %02d:%02d:%02d\n",
> +			       time->tm_year, time->tm_mon, time->tm_mday,
> +			       time->tm_hour, time->tm_min, time->tm_sec);
> +
> +	return 0;
> +}
> +
> +static const struct rtc_class_ops sd2405al_rtc_ops = {
> +	.read_time = sd2405al_read_time,
> +	.set_time = sd2405al_set_time,
> +};
> +
> +static const struct regmap_config sd2405al_regmap_conf = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = SD2405AL_REG_M_END,
> +};
> +
> +static int sd2405al_probe(struct i2c_client *client)
> +{
> +	struct sd2405al *sd2405al;
> +	int func;
> +	int ret;
> +
> +	func = i2c_check_functionality(client->adapter, I2C_FUNC_I2C);
> +	if (!func) {
> +		dev_err(&client->dev, "invalid adapter\n");
> +		return -ENODEV;
> +	}
> +
> +	sd2405al = devm_kzalloc(&client->dev, sizeof(*sd2405al), GFP_KERNEL);
> +	if (!sd2405al) {
> +		dev_err(&client->dev, "unable to allocate memory\n");
> +		return -ENOMEM;
> +	}
> +
> +	sd2405al->dev = &client->dev;
> +
> +	sd2405al->regmap = devm_regmap_init_i2c(client, &sd2405al_regmap_conf);
> +	if (IS_ERR(sd2405al->regmap)) {
> +		dev_err(sd2405al->dev, "unable to allocate regmap\n");
> +		return PTR_ERR(sd2405al->regmap);
> +	}
> +
> +	ret = sd2405al_setup(sd2405al);
> +	if (ret < 0) {
> +		dev_err(sd2405al->dev, "unable to setup device\n");
> +		return ret;
> +	}
> +
> +	sd2405al->rtc = devm_rtc_allocate_device(&client->dev);
> +	if (IS_ERR(sd2405al->rtc)) {
> +		dev_err(sd2405al->dev, "unable to allocate device\n");
> +		return PTR_ERR(sd2405al->rtc);
> +	}
> +
> +	sd2405al->rtc->ops = &sd2405al_rtc_ops;
> +	sd2405al->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
> +	sd2405al->rtc->range_max = RTC_TIMESTAMP_END_2099;
> +
> +	dev_set_drvdata(&client->dev, sd2405al);
> +
> +	ret = devm_rtc_register_device(sd2405al->rtc);
> +	if (ret < 0) {
> +		dev_err(sd2405al->dev, "unable to register device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id sd2405al_id[] = {
> +	{ "sd2405al", 0 },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, sd2405al_id);
> +
> +static const __maybe_unused struct of_device_id sd2405al_of_match[] = {
> +	{ .compatible = "dfrobot,sd2405al" },

This must be documented, it can probably go in trivial-rtc.yaml


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

