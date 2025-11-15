Return-Path: <linux-rtc+bounces-5386-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C74C60387
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Nov 2025 12:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id E0A6A24110
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Nov 2025 11:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22963274B39;
	Sat, 15 Nov 2025 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l7YGNUfx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD491DD9AC;
	Sat, 15 Nov 2025 11:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763204550; cv=none; b=ADKh/BxOysPXVJZ2RH//IENft8/fXsktUHm3GAnj2do8mX/omQXdkQ0dpuWJoWrpzBaEVif+xz4vVXG6NOIBR4Qy8svs8kxKMxfR3CLdLEpafwej8oX2vNg6aqgkgYxycF2xl+/Xia+yT6k5MmwdnzSuMgFBatb1EQFmbgA301I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763204550; c=relaxed/simple;
	bh=fk3Yf3vgxdY2Vstuti+gUga4wrihsyR8QlnO8YqAAlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbHDixMBJgbnBBkZmbEY8it4gDpbOvzSgC8fvQzAnq/FXEpcqhGJGaQCdnaewqv2+DgJCkry52qdX8/qAhup2HZmR0eocZ7g/n4EEYhcIFrfw0cOYlLa7dKKTQhpo8HCqMWpmsDCdoGkpoOMzsdTOs9msRh2de10s8StEsSe+1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l7YGNUfx; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 76E5FC0F570;
	Sat, 15 Nov 2025 11:01:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 518B1606F6;
	Sat, 15 Nov 2025 11:02:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A6C7102F213A;
	Sat, 15 Nov 2025 12:02:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763204537; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=gmh2kXhOsil0G4wZplBqeFlOI8ZvAZ5A/i0XuzZIOSo=;
	b=l7YGNUfxMwlTcj0W7TI5nNP91RGDgJZ+EPDAbtFLAlRdYvv2sku+btFE7vaZxuLRR+Lciz
	quLJ+ZC6QPFsN24WeS1Svo370rw2UEU1Wg9Sa/SPg1QTfF9BsMDoHB3ZkVXGQuh79PHHlk
	oO82eGA/mjbyfO4OP+dIYbLt0vUqIZqiupiQvBDitQf66BD6zpCFYklCYjCsFDEf8cynKh
	HsCezrE4u4/IvRetMB4Iuy176yi8eCE5Lm3RG+gChTl6wMbDsLPxAjHrctExjzuuD4aS52
	wPLuBd6cWDVHuClPIYP2Y9TzhHx6kbJvunEhyHIf/7RxuRBOtOCdQyH+pk3IBQ==
Date: Sat, 15 Nov 2025 12:02:14 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, pankit.garg@nxp.com,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com,
	Daniel Aguirre <daniel.aguirre@nxp.com>
Subject: Re: [PATCH v6 2/2] rtc: Add NXP PCF85053 driver support
Message-ID: <20251115110214a009e085@mail.local>
References: <20251113054243.4045820-1-lakshay.piplani@nxp.com>
 <20251113054243.4045820-2-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113054243.4045820-2-lakshay.piplani@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On 13/11/2025 11:12:43+0530, Lakshay Piplani wrote:
> +#define PCF85053_REG_BAT_MASK	0x07 /* Battery mask */
> +#define PCF85053A_BVL_MASK 0x07
> +#define PCF85053A_BVL_LOW_THRESHOLD 0x02
> +#define PCF85053_REG_CLKO_F_MASK	0x03 /* Frequenc mask */
> +#define PCF85053_REG_CLKO_CKE	0x80 /* clock out enabled */
> +#define PCF85053_BIT_OF	BIT(6)
> +
> +#define PCF85053_HR_PM	BIT(7)
> +#define PCF85053_HR_24H_MASK	GENMASK(5, 0)
> +
> +struct pcf85053_config {
> +	const struct regmap_config regmap;
> +	unsigned has_alarms:1;
> +};
> +
> +struct pcf85053 {
> +	struct rtc_device *rtc;
> +	struct i2c_client *client;

This member is probably not necessary

> +	struct regmap	*regmap;
> +#ifdef CONFIG_COMMON_CLK
> +	struct clk_hw clkout_hw;
> +#endif
> +	bool is_primary;
> +};
> +
> +static inline int pcf85053_read_two_bit(struct pcf85053 *pcf85053, bool *two)
> +{
> +	unsigned int ctrl;
> +	int err;
> +
> +	err = regmap_read(pcf85053->regmap, PCF85053_REG_CTRL, &ctrl);
> +	if (err)
> +		return err;
> +
> +	*two = !!(ctrl & PCF85053_BIT_TWO);
> +
> +	return 0;
> +}
> +
> +static inline bool pcf85053_time_write_access(struct pcf85053 *pcf85053)
> +{
> +	bool two;
> +
> +	if (pcf85053_read_two_bit(pcf85053, &two))
> +		return false;
> +
> +	/* Primary writes iff TWO=1; secondary writes iff TWO=0 */
> +	return pcf85053->is_primary ? two : !two;
> +}
> +
> +static int pcf85053_set_alarm_mode(struct device *dev, bool on)

This should take the regmap as a parameter, you have multiple extra
level of indirection when calling this function.

> +{
> +	struct pcf85053 *pcf85053 = dev_get_drvdata(dev);
> +	unsigned int val;
> +	int err;
> +
> +	val = on ? PCF85053_BIT_AIE : 0;
> +	val &= ~(PCF85053_BIT_CIE | PCF85053_BIT_OFIE);

This doesn't do anything

> +
> +	err = regmap_update_bits(pcf85053->regmap, PCF85053_REG_CTRL,
> +				 PCF85053_BIT_AIE | PCF85053_BIT_CIE | PCF85053_BIT_OFIE,
> +				 val);
> +	if (err)
> +		return err;
> +
> +	return regmap_update_bits(pcf85053->regmap, PCF85053_REG_ST,
> +				  PCF85053_BIT_AF, 0);
> +}
> +
> +static int pcf85053_get_alarm_mode(struct device *dev,
> +				   unsigned char *alarm_enable, unsigned char *alarm_flag)
> +{
> +	struct pcf85053 *pcf85053 = dev_get_drvdata(dev);
> +	unsigned int val;
> +	int err;
> +
> +	if (alarm_enable) {
> +		err = regmap_read(pcf85053->regmap, PCF85053_REG_CTRL, &val);
> +		if (err)
> +			return err;
> +
> +		*alarm_enable = val & PCF85053_BIT_AIE;
> +	}
> +
> +	if (alarm_flag) {
> +		err = regmap_read(pcf85053->regmap, PCF85053_REG_ST, &val);
> +		if (err)
> +			return err;
> +
> +		*alarm_flag = val & PCF85053_BIT_AF;
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t pcf85053_irq(int irq, void *dev_id)
> +{
> +	struct pcf85053 *pcf85053 = i2c_get_clientdata(dev_id);
> +	unsigned char alarm_flag;
> +	unsigned char alarm_enable;
> +	int err;
> +
> +	err = pcf85053_get_alarm_mode(&pcf85053->client->dev, &alarm_enable, &alarm_flag);
> +	if (err)
> +		return IRQ_NONE;
> +
> +	if (!alarm_flag)
> +		return IRQ_NONE;
> +
> +	rtc_update_irq(pcf85053->rtc, 1, RTC_IRQF | RTC_AF);
> +	pcf85053_set_alarm_mode(&pcf85053->client->dev, false);

I feel like this is reading and writing way too much, you could probably
only test and clear PCF85053_REG_ST, with a single
regmap_update_bits_check call

> +
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> + * In the routines that deal directly with the PCF85053 hardware, we use
> + * rtc_time -- month 0-11, hour 0-23, yr = calendar year-epoch.
> + */
> +static int pcf85053_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct pcf85053 *pcf85053 = dev_get_drvdata(dev);
> +	unsigned int ctrl, st, h12;
> +	bool is_24h, is_bin;
> +	u8 regs[10], hr;
> +	int err;
> +
> +	err = regmap_read(pcf85053->regmap, PCF85053_REG_CTRL, &ctrl);
> +	if (err)
> +		return err;
> +
> +	err = regmap_read(pcf85053->regmap, PCF85053_REG_ST, &st);
> +	if (err)
> +		return err;
> +
> +	if (ctrl & PCF85053_BIT_ST)
> +		dev_warn(dev, "RTC is stopped; time may be invalid\n");

no message needed but return -EINVAL

> +
> +	err = regmap_bulk_read(pcf85053->regmap, PCF85053_REG_SC, regs, sizeof(regs));
> +	if (err)
> +		return err;
> +
> +	if (ctrl & PCF85053_BIT_DM) {
> +		tm->tm_sec = regs[PCF85053_REG_SC] & 0x7F;
> +		tm->tm_min = regs[PCF85053_REG_MN] & 0x7F;
> +		tm->tm_mday = regs[PCF85053_REG_DM] & 0x3F;
> +		tm->tm_mon = (regs[PCF85053_REG_MO] & 0x1F) - 1;
> +		tm->tm_year = regs[PCF85053_REG_YR] + 100;
> +	} else {
> +		tm->tm_sec = bcd2bin(regs[PCF85053_REG_SC] & 0x7F);
> +		tm->tm_min = bcd2bin(regs[PCF85053_REG_MN] & 0x7F);
> +		tm->tm_mday = bcd2bin(regs[PCF85053_REG_DM] & 0x3F);
> +		tm->tm_mon = bcd2bin(regs[PCF85053_REG_MO] & 0x1F) - 1;
> +		tm->tm_year = bcd2bin(regs[PCF85053_REG_YR]) + 100;
> +	}
> +	tm->tm_wday = regs[PCF85053_REG_DW] & 0x07;
> +
> +	hr = regs[PCF85053_REG_HR];
> +	is_24h = ctrl & PCF85053_BIT_HF;
> +	is_bin = ctrl & PCF85053_BIT_DM;
> +
> +	if (is_24h) {
> +		tm->tm_hour = is_bin
> +		? (hr & PCF85053_HR_24H_MASK)
> +		: bcd2bin(hr & PCF85053_HR_24H_MASK);
> +	} else {
> +		if (is_bin) {
> +			h12 = hr & PCF85053_HR_24H_MASK;

This doesn't do anything

> +		} else {
> +			h12 = is_bin ? (hr & PCF85053_HR_24H_MASK) :
> +					   bcd2bin(hr & PCF85053_HR_24H_MASK);
> +
> +			tm->tm_hour = (h12 == 12) ? ((hr & PCF85053_HR_PM) ? 12 : 0) :
> +				       ((hr & PCF85053_HR_PM) ? h12 + 12 : h12);
> +			}
> +		}
> +
> +	return 0;
> +}
> +
> +static int pcf85053_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +
> +{
> +	struct pcf85053 *pcf85053 = dev_get_drvdata(dev);
> +	unsigned int ctrl, h12;
> +	int err, ret;
> +	u8 buf[10];
> +	bool pm;
> +
> +	/*
> +	 * By default, secondary have write access to time registers as TWO
> +	 * bit is 0 by default, if we set nxp,interface = "primary" and the
> +	 * nxp,write-access in device tree, then TWO bits gets set and primary
> +	 * gets write access to time registers.
> +	 */
> +	if (!pcf85053_time_write_access(pcf85053))
> +		return -EACCES;
> +
> +	err = regmap_read(pcf85053->regmap, PCF85053_REG_CTRL, &ctrl);
> +	if (err)
> +		return err;
> +
> +	buf[0] = tm->tm_sec & 0x7F;
> +	buf[1] = 0;
> +	buf[2] = tm->tm_min & 0x7F;
> +	buf[3] = 0;
> +	buf[5] = 0;
> +	buf[6] = tm->tm_wday & 0x07;
> +	buf[7] = tm->tm_mday & 0x3F;
> +	buf[8] = (tm->tm_mon + 1) & 0x1F;
> +	buf[9] = (tm->tm_year - 100) & 0xFF;
> +
> +	if (ctrl & PCF85053_BIT_HF) {
> +		buf[4] = tm->tm_hour & PCF85053_HR_24H_MASK;
> +	} else {
> +		pm = tm->tm_hour >= 12;
> +		h12 = (tm->tm_hour % 12) ? (tm->tm_hour % 12) : 12;
> +		buf[4] = (h12 & PCF85053_HR_24H_MASK) | (pm << 7);
> +	}
> +
> +	if (!(ctrl & PCF85053_BIT_DM)) {
> +		buf[0] = bin2bcd(buf[0]);
> +		buf[2] = bin2bcd(buf[2]);
> +		buf[4] = bin2bcd(buf[4] & PCF85053_HR_24H_MASK) | (buf[4] & PCF85053_HR_PM);
> +		buf[7] = bin2bcd(buf[7]);
> +		buf[8] = bin2bcd(buf[8]);
> +		buf[9] = bin2bcd(buf[9]);
> +	}
> +

You have write access, simply set the date to the simplest format
instead of supporting all of them.

> +	if (pcf85053->is_primary) {
> +		err = regmap_update_bits(pcf85053->regmap, PCF85053_REG_CTRL,
> +					 PCF85053_BIT_ST, PCF85053_BIT_ST);
> +		if (err)
> +			return err;
> +
> +		ret = regmap_bulk_write(pcf85053->regmap, PCF85053_REG_SC, buf, sizeof(buf));
> +		err = regmap_update_bits(pcf85053->regmap, PCF85053_REG_CTRL,
> +					 PCF85053_BIT_ST, 0);
> +		return ret ? ret : err;
> +	}
> +
> +	return regmap_bulk_write(pcf85053->regmap, PCF85053_REG_SC, buf, sizeof(buf));
> +}
> +
> +static int pcf85053_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
> +{
> +	struct pcf85053 *pcf85053 = dev_get_drvdata(dev);
> +	unsigned int ctrl, h12;
> +	bool is_24h, is_bin, pm;
> +	u8 buf[5];
> +	u8 hr;
> +	int err;
> +
> +	err = regmap_read(pcf85053->regmap, PCF85053_REG_CTRL, &ctrl);
> +	if (err)
> +		return err;
> +
> +	err = regmap_bulk_read(pcf85053->regmap, PCF85053_REG_SCA, buf, sizeof(buf));
> +	if (err)
> +		return err;
> +
> +	if (ctrl & PCF85053_BIT_DM) {
> +		tm->time.tm_sec = buf[0] & 0x7F; /* SCA */
> +		tm->time.tm_min = buf[2] & 0x7F; /* MNA */
> +	} else {
> +		tm->time.tm_sec = bcd2bin(buf[0] & 0x7F);
> +		tm->time.tm_min = bcd2bin(buf[2] & 0x7F);
> +	}
> +
> +	hr = buf[4];
> +	is_24h = !!(ctrl & PCF85053_BIT_HF);
> +	is_bin = !!(ctrl & PCF85053_BIT_DM);
> +
> +	if (is_24h) {
> +		tm->time.tm_hour = is_bin
> +		? (hr & PCF85053_HR_24H_MASK)
> +		: bcd2bin(hr & PCF85053_HR_24H_MASK);
> +	} else {
> +		pm = !!(hr & PCF85053_HR_PM);
> +
> +		if (is_bin)
> +			h12 = (hr & PCF85053_HR_24H_MASK);
> +		else
> +			h12 = (bcd2bin(hr & PCF85053_HR_24H_MASK));
> +
> +		if (h12 == 12)
> +			h12 = 0;
> +		tm->time.tm_hour = pm ? (h12 + 12) : h12;
> +	}
> +
> +	return pcf85053_get_alarm_mode(dev, &tm->enabled, &tm->pending);
> +}
> +
> +static int pcf85053_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
> +{
> +	struct pcf85053 *pcf85053 = dev_get_drvdata(dev);
> +	bool is_24h, is_bin, pm;
> +	unsigned int ctrl, h12;
> +	u8 sec, min, hra;
> +	int err;
> +
> +	/*
> +	 * Only primary can set alarm, as secondary have read only access
> +	 * to alarm, control and status registers
> +	 */
> +	if (!pcf85053->is_primary)
> +		return -EACCES;
> +
> +	err = regmap_read(pcf85053->regmap, PCF85053_REG_CTRL, &ctrl);
> +	if (err)
> +		return err;
> +
> +	err = regmap_update_bits(pcf85053->regmap, PCF85053_REG_ST,
> +				 PCF85053_BIT_AF, 0);
> +	if (err)
> +		return err;
> +
> +	is_24h = !!(ctrl & PCF85053_BIT_HF);
> +	is_bin = !!(ctrl & PCF85053_BIT_DM);
> +
> +	sec = tm->time.tm_sec & 0x7F;
> +	min = tm->time.tm_min & 0x7F;
> +
> +	if (is_24h) {
> +		hra = tm->time.tm_hour & PCF85053_HR_24H_MASK;
> +		if (!is_bin)
> +			hra = bin2bcd(hra) & PCF85053_HR_24H_MASK;
> +	} else {
> +		h12 = tm->time.tm_hour % 12;
> +		pm = tm->time.tm_hour >= 12;
> +		if (h12 == 0)
> +			h12 = 12;
> +
> +		if (is_bin)
> +			hra = (h12 & PCF85053_HR_24H_MASK) | (pm << 7);
> +		else
> +			hra = (bin2bcd(h12) & PCF85053_HR_24H_MASK) | (pm << 7);
> +	}
> +
> +	if (!is_bin) {
> +		sec = bin2bcd(sec);
> +		min = bin2bcd(min);
> +	}
> +

Same here.

> +	err = regmap_write(pcf85053->regmap, PCF85053_REG_SCA, sec);
> +	if (err)
> +		return err;
> +
> +	err = regmap_write(pcf85053->regmap, PCF85053_REG_MNA, min);
> +	if (err)
> +		return err;
> +
> +	err = regmap_write(pcf85053->regmap, PCF85053_REG_HRA, hra);
> +	if (err)
> +		return err;
> +
> +	return pcf85053_set_alarm_mode(dev, tm->enabled);
> +}
> +
> +static int pcf85053_irq_enable(struct device *dev, unsigned int enabled)
> +{
> +	dev_dbg(dev, "%s: alarm enable=%d\n", __func__, enabled);
> +
> +	return pcf85053_set_alarm_mode(dev, enabled);
> +}
> +
> +static int pcf85053_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
> +{
> +	struct pcf85053 *pcf85053 = dev_get_drvdata(dev);
> +	unsigned int val = 0, vl_status = 0;
> +	unsigned int bvl;
> +	int status;
> +
> +	switch (cmd) {
> +	case RTC_VL_READ:
> +		status = regmap_read(pcf85053->regmap, PCF85053_REG_ST, &val);
> +		if (status)
> +			return status;
> +
> +		if (val & PCF85053_BIT_OF)
> +			vl_status |= RTC_VL_DATA_INVALID;
> +
> +		bvl = val & PCF85053A_BVL_MASK;
> +
> +		if (bvl == 0x00)
> +			vl_status |= RTC_VL_BACKUP_EMPTY;
> +		else if (bvl <= PCF85053A_BVL_LOW_THRESHOLD)
> +			vl_status |= RTC_VL_BACKUP_LOW;
> +
> +		return put_user(vl_status, (unsigned int __user *)arg);
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
> +#define clkout_hw_to_pcf85053(_hw) container_of(_hw, struct pcf85053, clkout_hw)
> +
> +static const int clkout_rates[] = {
> +	32768,
> +	1024,
> +	32,
> +	1,
> +};
> +
> +static unsigned long pcf85053_clkout_recalc_rate(struct clk_hw *hw,
> +						 unsigned long parent_rate)
> +{
> +	struct pcf85053 *pcf85053 = clkout_hw_to_pcf85053(hw);
> +	unsigned int val = 0;
> +	int err;
> +
> +	err = regmap_read(pcf85053->regmap, PCF85053_REG_CLKO, &val);
> +	if (err)
> +		return 0;
> +
> +	val &= PCF85053_REG_CLKO_F_MASK;
> +	return clkout_rates[val];
> +}
> +
> +static int pcf85053_clkout_determine_rate(struct clk_hw *hw,
> +					  struct clk_rate_request *req)
> +{
> +	int i;
> +	unsigned long best = 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++) {
> +		if (clkout_rates[i] <= req->rate) {
> +			best = clkout_rates[i];
> +			break;
> +		}
> +	}
> +	if (!best)
> +		best = clkout_rates[ARRAY_SIZE(clkout_rates) - 1];
> +
> +	req->rate = best;
> +	return 0;
> +}
> +
> +static int pcf85053_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
> +				    unsigned long parent_rate)
> +{
> +	struct pcf85053 *pcf85053 = clkout_hw_to_pcf85053(hw);
> +	unsigned int val = 0;
> +	int err, i;
> +
> +	err = regmap_read(pcf85053->regmap, PCF85053_REG_CLKO, &val);
> +	if (err)
> +		return err;
> +
> +	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
> +		if (clkout_rates[i] == rate) {
> +			val &= ~PCF85053_REG_CLKO_F_MASK;
> +			val |= i;
> +			return regmap_write(pcf85053->regmap, PCF85053_REG_CLKO, val);
> +		}
> +
> +	return -EINVAL;
> +}
> +
> +static int pcf85053_clkout_control(struct clk_hw *hw, bool enable)
> +{
> +	struct pcf85053 *pcf85053 = clkout_hw_to_pcf85053(hw);
> +	unsigned int val = 0;
> +	int err;
> +
> +	if (!pcf85053->is_primary)
> +		return -EACCES;
> +
> +	val = PCF85053_BIT_XCLK;
> +	err = regmap_write(pcf85053->regmap, PCF85053_REG_ACC, val);
> +	if (err)
> +		return err;
> +
> +	err = regmap_read(pcf85053->regmap, PCF85053_REG_CLKO, &val);
> +	if (err)
> +		return err;
> +
> +	if (enable)
> +		val |= PCF85053_REG_CLKO_CKE;
> +	else
> +		val &= ~PCF85053_REG_CLKO_CKE;
> +
> +	return regmap_write(pcf85053->regmap, PCF85053_REG_CLKO, val);
> +}
> +
> +static int pcf85053_clkout_prepare(struct clk_hw *hw)
> +{
> +	return pcf85053_clkout_control(hw, 1);
> +}
> +
> +static void pcf85053_clkout_unprepare(struct clk_hw *hw)
> +{
> +	pcf85053_clkout_control(hw, 0);
> +}
> +
> +static int pcf85053_clkout_is_prepared(struct clk_hw *hw)
> +{
> +	struct pcf85053 *pcf85053 = clkout_hw_to_pcf85053(hw);
> +	unsigned int val = 0;
> +	int err;
> +
> +	err = regmap_read(pcf85053->regmap, PCF85053_REG_CLKO, &val);
> +	if (err)
> +		return err;
> +
> +	return val & PCF85053_REG_CLKO_CKE;
> +}
> +
> +static const struct clk_ops pcf85053_clkout_ops = {
> +	.prepare = pcf85053_clkout_prepare,
> +	.unprepare = pcf85053_clkout_unprepare,
> +	.is_prepared = pcf85053_clkout_is_prepared,
> +	.recalc_rate = pcf85053_clkout_recalc_rate,
> +	.determine_rate = pcf85053_clkout_determine_rate,
> +	.set_rate = pcf85053_clkout_set_rate,
> +};
> +
> +static struct clk *pcf85053_clkout_register_clk(struct pcf85053 *pcf85053)
> +{
> +	struct i2c_client *client = pcf85053->client;
> +	struct device_node *node = client->dev.of_node;
> +	struct clk *clk;
> +	struct clk_init_data init;
> +
> +	init.name = "pcf85053-clkout";
> +	init.ops = &pcf85053_clkout_ops;
> +	init.flags = 0;
> +	init.parent_names = NULL;
> +	init.num_parents = 0;
> +	pcf85053->clkout_hw.init = &init;
> +
> +	/* optional override of the clockname */
> +	of_property_read_string(node, "clock-output-names", &init.name);
> +
> +	/* register the clock */
> +	clk = devm_clk_register(&client->dev, &pcf85053->clkout_hw);
> +
> +	if (!IS_ERR(clk))
> +		of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +
> +	return clk;
> +}
> +#endif
> +
> +static const struct rtc_class_ops pcf85053_rtc_ops = {
> +	.read_time	= pcf85053_rtc_read_time,
> +	.set_time	= pcf85053_rtc_set_time,
> +	.read_alarm	= pcf85053_rtc_read_alarm,
> +	.set_alarm	= pcf85053_rtc_set_alarm,
> +	.alarm_irq_enable = pcf85053_irq_enable,
> +	.ioctl		= pcf85053_ioctl,
> +};
> +
> +static const struct pcf85053_config config_pcf85053 = {
> +	.regmap = {
> +		.reg_bits = 8,
> +		.val_bits = 8,
> +		.max_register = 0x1D,
> +	},
> +	.has_alarms = 1,
> +};
> +
> +static int pcf85053_probe(struct i2c_client *client)
> +{
> +	struct pcf85053 *pcf85053;
> +	const struct pcf85053_config *config;
> +	const char *iface = NULL;
> +	int err;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
> +				     I2C_FUNC_SMBUS_BYTE |
> +				     I2C_FUNC_SMBUS_BLOCK_DATA))
> +		return -ENODEV;
> +
> +	pcf85053 = devm_kzalloc(&client->dev, sizeof(struct pcf85053),
> +				GFP_KERNEL);
> +	if (!pcf85053)
> +		return -ENOMEM;
> +
> +	config = i2c_get_match_data(client);
> +	if (!config)
> +		return -ENODEV;
> +
> +	pcf85053->regmap = devm_regmap_init_i2c(client, &config->regmap);
> +	if (IS_ERR(pcf85053->regmap))
> +		return PTR_ERR(pcf85053->regmap);
> +
> +	i2c_set_clientdata(client, pcf85053);
> +
> +	pcf85053->client = client;
> +	device_set_wakeup_capable(&client->dev, 1);
> +
> +	pcf85053->is_primary = true;
> +
> +	if (of_property_read_string(client->dev.of_node, "nxp,interface", &iface))
> +		return dev_err_probe(&client->dev, -EINVAL,
> +				     "Missing mandatory property: nxp,interface\n");
> +	if (!strcmp(iface, "primary"))
> +		pcf85053->is_primary = true;
> +	else if (!strcmp(iface, "secondary"))
> +		pcf85053->is_primary = false;
> +	else
> +		return dev_err_probe(&client->dev, -EINVAL,
> +				     "Invalid value for nxp,interface: %s\n", iface);
> +
> +	if (pcf85053->is_primary) {
> +		unsigned int ctrl;
> +		int err;
> +
> +		err = regmap_read(pcf85053->regmap, PCF85053_REG_CTRL, &ctrl);
> +		if (err)
> +			return err;
> +
> +		if (of_property_read_bool(client->dev.of_node, "nxp,write-access")) {
> +			if (!(ctrl & PCF85053_BIT_TWO)) {
> +				err = regmap_update_bits(pcf85053->regmap, PCF85053_REG_CTRL,
> +							 PCF85053_BIT_TWO, PCF85053_BIT_TWO);
> +				if (err)
> +					return err;
> +			}
> +			dev_dbg(&client->dev, "Ownership set: TWO=1 (primary writes)\n");
> +		} else {
> +			/* TWO (Time Write Ownership) bit defaults to 0 (Secondary) */
> +			dev_dbg(&client->dev, "Default ownership set: TWO=0 (secondary writes)\n");
> +		}
> +	}
> +
> +	pcf85053->rtc = devm_rtc_allocate_device(&client->dev);
> +	if (IS_ERR(pcf85053->rtc))
> +		return PTR_ERR(pcf85053->rtc);
> +
> +	pcf85053->rtc->ops = &pcf85053_rtc_ops;
> +	pcf85053->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;

Was 2000 a leap year for this RTC? The datasheet would say it is.

> +	pcf85053->rtc->range_max = RTC_TIMESTAMP_END_2099;
> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, pcf85053->rtc->features);
> +	clear_bit(RTC_FEATURE_ALARM, pcf85053->rtc->features);
> +
> +	if (config->has_alarms && client->irq > 0) {
> +		err = devm_request_threaded_irq(&client->dev, client->irq,
> +						NULL, pcf85053_irq,
> +						IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
> +						"pcf85053", client);
> +		if (err) {
> +			dev_err(&client->dev, "unable to request IRQ %d\n", client->irq);
> +		} else {
> +			set_bit(RTC_FEATURE_ALARM, pcf85053->rtc->features);
> +			device_init_wakeup(&client->dev, true);

Use devm_device_init_wakeup

> +			err = dev_pm_set_wake_irq(&client->dev, client->irq);
> +			if (err)
> +				dev_err(&client->dev, "failed to enable irq wake\n");
> +		}
> +	}
> +
> +#ifdef CONFIG_COMMON_CLK
> +	/* register clk in common clk framework */
> +	pcf85053_clkout_register_clk(pcf85053);
> +#endif
> +
> +	return devm_rtc_register_device(pcf85053->rtc);
> +}
> +
> +static const struct i2c_device_id pcf85053_id[] = {
> +	{ "pcf85053", .driver_data = (kernel_ulong_t)&config_pcf85053 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, pcf85053_id);
> +
> +static const struct of_device_id pcf85053_of_match[] = {
> +	{ .compatible = "nxp,pcf85053", .data = &config_pcf85053 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, pcf85053_of_match);
> +
> +static struct i2c_driver pcf85053_driver = {
> +	.driver		= {
> +		.name	= "rtc-pcf85053",
> +		.of_match_table = of_match_ptr(pcf85053_of_match),
> +	},
> +	.probe		= pcf85053_probe,
> +	.id_table	= pcf85053_id,
> +};
> +
> +module_i2c_driver(pcf85053_driver);
> +
> +MODULE_AUTHOR("Pankit Garg <pankit.garg@nxp.com>");
> +MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
> +MODULE_DESCRIPTION("NXP pcf85053 RTC driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

