Return-Path: <linux-rtc+bounces-4557-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B15B0FBB6
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 22:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 066E11884036
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Jul 2025 20:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C5E248F66;
	Wed, 23 Jul 2025 20:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jXcxSJXk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ABF246BDE;
	Wed, 23 Jul 2025 20:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753302945; cv=none; b=J59zy5JY6K4PhUj0Rp4N5jdGVqkaVdVaZ/aoZXHDTKfmNpxeo9XSUt88UWC/JnovItA0JS7+fO3joSN2sMXe6uQEmhUgoqpwZV3x+G6ULGusyk45H7c3jQOV/Wa86BTxJEoCxDye72w6TVDfs2g5Kid8SmRmrE0NjdpEpKg++K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753302945; c=relaxed/simple;
	bh=NxUU7eExXUR5tfiTy8nnDM9K6YAeHuMJSE16lt0y0NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgEAyEyf1gLkbS4C9YpPNYRgM1BH/pCzy4isMKvKKv4JrhTDgV7pN50/fgKnv20rU+ipKt3t5SrXQPf3BiDJQdq51WSDNzdS0BnhxkJPf7cjIB8GVYVdH4oq0TjACtphN88t78WonAGtPJou9Y7XB9e7ro8Q71Z961siDbOywPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jXcxSJXk; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 807B244383;
	Wed, 23 Jul 2025 20:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753302933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PoTsmyg1QnpFbNevSonA2uRnG1Nt9jtLXFBf0RWZ3CQ=;
	b=jXcxSJXksWEHSwhkvgUHYn25TnXxtUEDaGmT5o99pvDkOyJ5d3jByGMn6+OHA7iU6NM/4/
	iitGLKU3X3MaMA/mnlI/4d0MieMRUyJsx+PIDbhrEYD9pnOKERLwgV/v6UYb1TIs98JbDR
	0+5WVsN37zJWIAVlulgZY6k1wNkEOWt4X+TW2F5YEtbRWvHlA9njdpFBhSf9M9T1aetdXP
	CSukBwbBcI/ZWoX1iGSej+36kfT/jT6SndEUbtPwGk3o5qQ69LD5jQqCx7pYjBke1tYO2E
	D4ehDxNu1mRyfBv5XvkWn6/fWUAZSApInmHhCcae70wE1lu5nFa7r8QC1UQX7Q==
Date: Wed, 23 Jul 2025 22:35:33 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Pankit Garg <pankit.garg@nxp.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	daniel.aguirre@nxp.com, shashank.rebbapragada@nxp.com,
	aman.kumarpandey@nxp.com
Subject: Re: [PATCH v3 2/2] rtc: Add NXP PCF85053A driver support
Message-ID: <20250723203533a51f9482@mail.local>
References: <20250507072618.153960-1-pankit.garg@nxp.com>
 <20250507072618.153960-2-pankit.garg@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507072618.153960-2-pankit.garg@nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejkeejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepphgrnhhkihhtrdhgrghrghesnhigphdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhikhgrshhhrdgsrghnshgrlhesnhigphdrtghomhdprhgtphhtthhopehprhhihigrnhhkrgdrjhgrihhnsehngihprdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,


On 07/05/2025 12:56:18+0530, Pankit Garg wrote:
> PCF85053A is i2c based RTC which supports timer and calendar
> functionality.
> 
> Features supported:
> 1. Read/Write time
> 2. Get/Set Alarm
> 3. Wakeup Source
> 4. Generate 32768Hz clock output
> 5. Secondary i2c bus
> 
> Signed-off-by: Daniel Aguirre <daniel.aguirre@nxp.com>
> Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
> ---
> V2 -> V3: Add MAINTAINERS file changes to this patch
> V1 -> V2: no changes
> 
> ---
>  MAINTAINERS                 |   6 +
>  drivers/rtc/Kconfig         |  10 +
>  drivers/rtc/Makefile        |   1 +
>  drivers/rtc/rtc-pcf85053a.c | 594 ++++++++++++++++++++++++++++++++++++

I don't think a should be part of the various names (filename, macros, structs,
functions) as all the PCF85063 variants have the same register set.

> +static int pcf85053a_set_alarm_mode(struct device *dev, bool on)
> +{
> +	struct pcf85053a *pcf85053a = dev_get_drvdata(dev);
> +	struct i2c_client *client = to_i2c_client(dev);

You can remove this from most of the functions as they already get a struct
device that uniquely identifies the device.

> +	unsigned int val;
> +	int err;
> +
> +	err = regmap_read(pcf85053a->regmap, PCF85053A_REG_CTRL, &val);
> +	if (err)
> +		return err;
> +
> +	if (on)
> +		val |= PCF85053A_BIT_AIE;
> +	else
> +		val &= ~PCF85053A_BIT_AIE;
> +
> +	val |= PCF85053A_BIT_CIE;
> +	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_CTRL, val);
> +	if (err < 0) {
> +		dev_err(&client->dev, "Unable to write PCF85053A_REG_CTRL\n");

Most of the error messages like this are not necessary because the only action
for the user would be to restart the action and anyway, they probably won't ever
be read by anyone on an embedded system.

> +		return err;
> +	}
> +
> +	err = regmap_read(pcf85053a->regmap, PCF85053A_REG_ST, &val);
> +	if (err)
> +		return err;
> +
> +	val &= ~(PCF85053A_BIT_AF);
> +	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_ST, val);

Maybe use regmap_update_bits ?

> +	if (err < 0) {
> +		dev_err(&client->dev, "Unable to write PCF85053A_REG_ST\n");
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pcf85053a_get_alarm_mode(struct device *dev,
> +				    unsigned char *alarm_enable, unsigned char *alarm_flag)
> +{
> +	struct pcf85053a *pcf85053a = dev_get_drvdata(dev);
> +	struct i2c_client *client = to_i2c_client(dev);
> +	unsigned int val;
> +	int err;
> +
> +	if (alarm_enable) {
> +		dev_dbg(&client->dev, "%s:PCF85053A_REG_CTRL\n", __func__);
> +		err = regmap_read(pcf85053a->regmap, PCF85053A_REG_CTRL, &val);
> +		if (err)
> +			return err;
> +		*alarm_enable = val & PCF85053A_BIT_AIE;
> +	}
> +
> +	if (alarm_flag) {
> +		dev_dbg(&client->dev, "%s:PCF85053A_REG_ST\n", __func__);
> +		err = regmap_read(pcf85053a->regmap, PCF85053A_REG_ST, &val);
> +		if (err)
> +			return err;
> +		*alarm_flag = val & PCF85053A_BIT_AF;
> +	}
> +
> +	dev_dbg(&client->dev, "%s:alarm_enable:%x alarm_flag:%x\n",
> +		__func__, *alarm_enable, *alarm_flag);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t pcf85053a_irq(int irq, void *dev_id)
> +{
> +	struct pcf85053a *pcf85053a = i2c_get_clientdata(dev_id);
> +	struct i2c_client *client = pcf85053a->client;
> +	int err;
> +	unsigned char alarm_flag;
> +	unsigned char alarm_enable;
> +
> +	err = pcf85053a_get_alarm_mode(&client->dev, &alarm_enable, &alarm_flag);
> +	if (err)
> +		return IRQ_NONE;
> +
> +	if (alarm_flag) {

You should probably test for !alarm_flag

> +		rtc_update_irq(pcf85053a->rtc, 1, RTC_IRQF | RTC_AF);
> +		pcf85053a_set_alarm_mode(&client->dev, 0);
> +		return IRQ_HANDLED;
> +	}
> +
> +	return IRQ_NONE;
> +}
> +
> +/*
> + * In the routines that deal directly with the PCF85053A hardware, we use
> + * rtc_time -- month 0-11, hour 0-23, yr = calendar year-epoch.
> + */
> +static int pcf85053a_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct pcf85053a *pcf85053a = dev_get_drvdata(dev);
> +	struct i2c_client *client = to_i2c_client(dev);
> +	unsigned char regs[10];
> +	unsigned int val;
> +	int err;
> +
> +	err = regmap_read(pcf85053a->regmap, PCF85053A_REG_ST, &val);
> +	if (err)
> +		return err;
> +
> +	if (0 == (val & PCF85053A_REG_BAT_MASK)) {

The 0 should be on the RHS

> +		dev_err(&client->dev, " BVL[2:0] value is 0x0 (Battery Voltage <= 1.7V), information is not reliable.\n");
> +		return -EINVAL;
> +	}

This is not correct, the battery may be empty but the time correct, you must
rather check for ST and OF

> +
> +	err = regmap_bulk_read(pcf85053a->regmap, PCF85053A_REG_SC, regs,
> +			       sizeof(regs));
> +	if (err)
> +		return err;
> +
> +	tm->tm_sec = bcd2bin(regs[PCF85053A_REG_SC] & 0x7F);
> +	tm->tm_min = bcd2bin(regs[PCF85053A_REG_MN] & 0x7F);
> +	tm->tm_hour = bcd2bin(regs[PCF85053A_REG_HR] & 0x3F);
> +	tm->tm_wday = regs[PCF85053A_REG_DW] & 0x07;
> +	tm->tm_mday = bcd2bin(regs[PCF85053A_REG_DM] & 0x3F);
> +	tm->tm_mon = bcd2bin(regs[PCF85053A_REG_MO] & 0x1F) - 1;
> +	tm->tm_year = bcd2bin(regs[PCF85053A_REG_YR]) + 100;
> +
> +	return 0;
> +}
> +
> +static int pcf85053a_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct pcf85053a *pcf85053a = dev_get_drvdata(dev);
> +	struct i2c_client *client = to_i2c_client(dev);
> +	int err;
> +
> +	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_SC, bin2bcd(tm->tm_sec));
> +	if (err < 0) {
> +		dev_err(&client->dev, "Unable to write PCF85053A_REG_SC\n");
> +		return err;
> +	}
> +
> +	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_MN, bin2bcd(tm->tm_min));
> +	if (err < 0) {
> +		dev_err(&client->dev, "Unable to write PCF85053A_REG_MN\n");
> +		return err;
> +	}
> +
> +	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_HR, bin2bcd(tm->tm_hour));
> +	if (err < 0) {
> +		dev_err(&client->dev, "Unable to write PCF85053A_REG_HR\n");
> +		return err;
> +	}
> +
> +	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_DW, tm->tm_wday & 0x07);
> +	if (err < 0) {
> +		dev_err(&client->dev, "Unable to write PCF85053A_REG_DW\n");
> +		return err;
> +	}
> +
> +	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_DM, bin2bcd(tm->tm_mday));
> +	if (err < 0) {
> +		dev_err(&client->dev, "Unable to write PCF85053A_REG_DM\n");
> +		return err;
> +	}
> +
> +	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_MO, bin2bcd(tm->tm_mon + 1));
> +	if (err < 0) {
> +		dev_err(&client->dev, "Unable to write PCF85053A_REG_MO\n");
> +		return err;
> +	}
> +
> +	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_YR, bin2bcd(tm->tm_year - 100));
> +	if (err < 0) {
> +		dev_err(&client->dev, "Unable to write PCF85053A_REG_YR\n");
> +		return err;
> +	}

For accurate timings, you must set ST, then the time registers
and then clear ST, see 7.4.1.1

> +
> +	return err;
> +}
> +
> +static int pcf85053a_irq_enable(struct device *dev, unsigned int enabled)
> +{
> +	dev_dbg(dev, "%s: alarm enable=%d\n", __func__, enabled);
> +
> +	return pcf85053a_set_alarm_mode(dev, enabled);
> +}
> +
> +static int pcf85053a_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
> +{
> +	struct pcf85053a *pcf85053a = dev_get_drvdata(dev);
> +	int status;
> +	unsigned int val = 0;
> +
> +	switch (cmd) {
> +	case RTC_VL_READ:
> +		status = regmap_read(pcf85053a->regmap, PCF85053A_REG_ST, &val);
> +		if (status)
> +			return status;
> +
> +		if (!(status & PCF85053A_REG_BAT_MASK))
> +			val |= RTC_VL_DATA_INVALID;

You need to use RTC_VL_BACKUP_EMPTY, RTC_VL_DATA_INVALID would be for OF. You
should also return RTC_VL_BACKUP_LOW for some threshold.

> +
> +		return put_user(val, (unsigned int __user *)arg);
> +
> +	default:
> +		return -ENOIOCTLCMD;
> +	}
> +}
> +
> +#ifdef CONFIG_COMMON_CLK
> +/*
> + * Handling of the clkout
> + */
> +
> +#define clkout_hw_to_pcf85053a(_hw) container_of(_hw, struct pcf85053a, clkout_hw)
> +
> +static const int clkout_rates[] = {
> +	32768,
> +	1024,
> +	32,
> +	1,
> +};
> +
> +static unsigned long pcf85053a_clkout_recalc_rate(struct clk_hw *hw,
> +						  unsigned long parent_rate)
> +{
> +	struct pcf85053a *pcf85053a = clkout_hw_to_pcf85053a(hw);
> +	int err;
> +	unsigned int val = 0;
> +
> +	err = regmap_read(pcf85053a->regmap, PCF85053A_REG_CLKO, &val);
> +	if (err)
> +		return 0;
> +
> +	val &= PCF85053A_REG_CLKO_F_MASK;
> +	return clkout_rates[val];
> +}
> +
> +static long pcf85053a_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
> +					unsigned long *prate)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
> +		if (clkout_rates[i] <= rate)
> +			return clkout_rates[i];
> +
> +	return 0;
> +}
> +
> +static int pcf85053a_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
> +				     unsigned long parent_rate)
> +{
> +	struct pcf85053a *pcf85053a = clkout_hw_to_pcf85053a(hw);
> +	int err, i;
> +	unsigned int val = 0;
> +
> +	err = regmap_read(pcf85053a->regmap, PCF85053A_REG_CLKO, &val);
> +	if (err)
> +		return err;
> +
> +	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
> +		if (clkout_rates[i] == rate) {
> +			val &= ~PCF85053A_REG_CLKO_F_MASK;
> +			val |= i;
> +			return regmap_write(pcf85053a->regmap, PCF85053A_REG_CLKO, val);
> +		}
> +
> +	return -EINVAL;
> +}
> +
> +static int pcf85053a_clkout_control(struct clk_hw *hw, bool enable)
> +{
> +	struct pcf85053a *pcf85053a = clkout_hw_to_pcf85053a(hw);
> +	int err;
> +	unsigned int val = 0;
> +
> +	val = PCF85053A_BIT_XCLK;
> +	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_ACC, val);
> +	if (err)
> +		return err;
> +
> +	err = regmap_read(pcf85053a->regmap, PCF85053A_REG_CLKO, &val);
> +	if (err)
> +		return err;
> +
> +	if (enable)
> +		val |= PCF85053A_REG_CLKO_CKE;
> +	else
> +		val &= ~PCF85053A_REG_CLKO_CKE;
> +
> +	return regmap_write(pcf85053a->regmap, PCF85053A_REG_CLKO, val);
> +}
> +
> +static int pcf85053a_clkout_prepare(struct clk_hw *hw)
> +{
> +	return pcf85053a_clkout_control(hw, 1);
> +}
> +
> +static void pcf85053a_clkout_unprepare(struct clk_hw *hw)
> +{
> +	pcf85053a_clkout_control(hw, 0);
> +}
> +
> +static int pcf85053a_clkout_is_prepared(struct clk_hw *hw)
> +{
> +	struct pcf85053a *pcf85053a = clkout_hw_to_pcf85053a(hw);
> +	int err;
> +	unsigned int val = 0;
> +
> +	err = regmap_read(pcf85053a->regmap, PCF85053A_REG_CLKO, &val);
> +	if (err)
> +		return err;
> +
> +	return val & PCF85053A_REG_CLKO_CKE;
> +}
> +
> +static const struct clk_ops pcf85053a_clkout_ops = {
> +	.prepare = pcf85053a_clkout_prepare,
> +	.unprepare = pcf85053a_clkout_unprepare,
> +	.is_prepared = pcf85053a_clkout_is_prepared,
> +	.recalc_rate = pcf85053a_clkout_recalc_rate,
> +	.round_rate = pcf85053a_clkout_round_rate,

Please use determine_rate instead, see https://lore.kernel.org/all/20250710-rtc-clk-round-rate-v1-0-33140bb2278e@redhat.com/

> +	.set_rate = pcf85053a_clkout_set_rate,
> +};
> +
> +static struct clk *pcf85053a_clkout_register_clk(struct pcf85053a *pcf85053a)
> +{
> +	struct i2c_client *client = pcf85053a->client;
> +	struct device_node *node = client->dev.of_node;
> +	struct clk *clk;
> +	struct clk_init_data init;
> +
> +	init.name = "pcf85053a-clkout";
> +	init.ops = &pcf85053a_clkout_ops;
> +	init.flags = 0;
> +	init.parent_names = NULL;
> +	init.num_parents = 0;
> +	pcf85053a->clkout_hw.init = &init;
> +
> +	/* optional override of the clockname */
> +	of_property_read_string(node, "clock-output-names", &init.name);
> +
> +	/* register the clock */
> +	clk = devm_clk_register(&client->dev, &pcf85053a->clkout_hw);
> +
> +	if (!IS_ERR(clk))
> +		of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +
> +	return clk;
> +}
> +#endif
> +
> +static const struct rtc_class_ops pcf85053a_rtc_ops = {
> +	.read_time	= pcf85053a_rtc_read_time,
> +	.set_time	= pcf85053a_rtc_set_time,
> +	.read_alarm	= pcf85053a_rtc_read_alarm,
> +	.set_alarm	= pcf85053a_rtc_set_alarm,
> +	.alarm_irq_enable = pcf85053a_irq_enable,
> +	.ioctl		= pcf85053a_ioctl,
> +};
> +
> +static const struct pcf85053a_config config_pcf85053a = {
> +	.regmap = {
> +		.reg_bits = 8,
> +		.val_bits = 8,
> +		.max_register = 0x1D,
> +	},
> +	.has_alarms = 1,
> +};
> +
> +static int pcf85053a_probe(struct i2c_client *client)
> +{
> +	struct pcf85053a *pcf85053a;
> +	int err;
> +	unsigned int flags;
> +	const struct pcf85053a_config *config;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
> +				     I2C_FUNC_SMBUS_BYTE |
> +				     I2C_FUNC_SMBUS_BLOCK_DATA))
> +		return -ENODEV;
> +
> +	pcf85053a = devm_kzalloc(&client->dev, sizeof(struct pcf85053a),
> +				 GFP_KERNEL);
> +	if (!pcf85053a)
> +		return -ENOMEM;
> +
> +	config = i2c_get_match_data(client);
> +	if (!config)
> +		return -ENODEV;
> +
> +	pcf85053a->regmap = devm_regmap_init_i2c(client, &config->regmap);
> +	if (IS_ERR(pcf85053a->regmap))
> +		return PTR_ERR(pcf85053a->regmap);
> +
> +	i2c_set_clientdata(client, pcf85053a);
> +
> +	pcf85053a->client = client;
> +	device_set_wakeup_capable(&client->dev, 1);
> +
> +	err = regmap_read(pcf85053a->regmap, PCF85053A_REG_CTRL, &flags);
> +	if (err) {
> +		dev_err(&client->dev, "RTC chip is not present\n");
> +		return err;
> +	}
> +	if (flags & PCF85053A_BIT_TWO)
> +		dev_dbg(&client->dev, "%s: PCF85053A_BIT_TWO is set\n", __func__);
> +
> +	flags = PCF85053A_BIT_TWO;
> +	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_CTRL, flags);
> +	if (err) {
> +		dev_err(&client->dev, "Unable to write PCF85053A_REG_CTRL\n");
> +		return err;
> +	}

You must not overwrite anything in PCF85053A_REG_CTRL unless it is explicitly
requested by the user. For example, ST must not be cleared unless the time is
set, also how do you know TWO must be set? 12h vs 24h must be handled in reads.

You seem to be setting the RTC in 12h mode and to set/read time in 24h mode
which probably doesn't work properly.

The interrupts should probably not be cleared, else you are going to missing
interrupts across reboots.

We probably want to clear DSM though.

Wouldn't it be nicer to have the RTC in binary vs BCD?


> +
> +	flags = 0;
> +	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_ST, flags);
> +	if (err) {
> +		dev_err(&client->dev, "%s: write error\n", __func__);
> +		return err;
> +	}
> +

Ditto, you need to be smarter with this register.


> +	pcf85053a->rtc = devm_rtc_allocate_device(&client->dev);
> +	if (IS_ERR(pcf85053a->rtc))
> +		return PTR_ERR(pcf85053a->rtc);
> +
> +	pcf85053a->rtc->ops = &pcf85053a_rtc_ops;
> +	pcf85053a->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
> +	pcf85053a->rtc->range_max = RTC_TIMESTAMP_END_2099;
> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, pcf85053a->rtc->features);
> +	clear_bit(RTC_FEATURE_ALARM, pcf85053a->rtc->features);
> +
> +	if (config->has_alarms && client->irq > 0) {
> +		err = devm_request_threaded_irq(&client->dev, client->irq,
> +						NULL, pcf85053a_irq,
> +						IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
> +						"pcf85053a", client);
> +		if (err) {
> +			dev_err(&client->dev, "unable to request IRQ %d\n", client->irq);
> +		} else {
> +			set_bit(RTC_FEATURE_ALARM, pcf85053a->rtc->features);
> +			device_init_wakeup(&client->dev, true);
> +			err = dev_pm_set_wake_irq(&client->dev, client->irq);
> +			if (err)
> +				dev_err(&client->dev, "failed to enable irq wake\n");
> +		}
> +	}
> +
> +#ifdef CONFIG_COMMON_CLK
> +	/* register clk in common clk framework */
> +	pcf85053a_clkout_register_clk(pcf85053a);
> +#endif
> +
> +	return devm_rtc_register_device(pcf85053a->rtc);
> +}
> +
> +static const struct i2c_device_id pcf85053a_id[] = {
> +	{ "pcf85053a", .driver_data = (kernel_ulong_t)&config_pcf85053a },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, pcf85053a_id);
> +
> +static const struct of_device_id pcf85053a_of_match[] = {
> +	{ .compatible = "nxp,pcf85053a", .data = &config_pcf85053a  },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, pcf85053a_of_match);
> +
> +static struct i2c_driver pcf85053a_driver = {
> +	.driver		= {
> +		.name	= "rtc-pcf85053a",
> +		.of_match_table = of_match_ptr(pcf85053a_of_match),
> +	},
> +	.probe		= pcf85053a_probe,
> +	.id_table	= pcf85053a_id,
> +};
> +
> +module_i2c_driver(pcf85053a_driver);
> +
> +MODULE_AUTHOR("Pankit Garg <pankit.garg@nxp.com>");
> +MODULE_DESCRIPTION("NXP pcf85053a RTC driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

