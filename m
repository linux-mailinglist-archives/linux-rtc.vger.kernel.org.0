Return-Path: <linux-rtc+bounces-1739-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE8395ED9B
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 11:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7201282404
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 09:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A208145A01;
	Mon, 26 Aug 2024 09:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jIr7X3Zs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5046F335B5;
	Mon, 26 Aug 2024 09:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724665525; cv=none; b=ERDmYh/hs9XfAuPKsS+DiU7jXp2H9X71sqnAJ6UASBpYyWs1VbLxmlqU3G3jMtTVRmB8n8jkSYr4dykjnRw8VGvQ0ER/RWLxd53P+vl84iJLmxGAUIRTUTVHNVNh1ep1tiJH1B6PbaMe+ZEcDF5ZQzCPEAftpBdgZwj5twRTJJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724665525; c=relaxed/simple;
	bh=PhNJCnEqWAf5tOQ3VBj/FIzLFFYPizMxoaqPArGK5Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyE2hS6llbg/y2H0DQfWKnZIEhKPRo7nEcb5j9zWVx0Fed+LLKWfToGW7ie10uU2ptse8rKwSdrm7sSXiJuIbwU50a1eBSOxtgGWRWWQo0w49ldWp/vwSi+DtsJXcgmrIGShVeQrAuP6hGO1VD9TLe1jtI0BExozHq9kXgDQPiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jIr7X3Zs; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FE78240005;
	Mon, 26 Aug 2024 09:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724665520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cm7pTcmop+B8Zg+nbYiYBBLjbkVuEU6sN7SIS3TJIAQ=;
	b=jIr7X3ZsNbaWgwn/2FZVB/qWjVAkCNv627YiNOV9EtsFgJ8rbmPK83G6X0KIU1OgmkTBur
	QOGMoEcVVWOc3XLyLft0yKn1L6Xzrs9ZBtfLa9MCBT4MZ/N3+cNM/U4TUAzwXxYr/6v6+R
	wOYm6+42QY4/T1cVe9afQNPxJr1L32STAD0qG2QvZCEzfOAzajcaK9U3PX8wson2RfEtKj
	+DtDByZNvPGY1KibzpEPyiinuXufj2Af/DkPLu2QPDiNKcVe75KY88EAqM+eWezH968g7v
	4FN/h768YMHUa+PUsP3MwlTSeqCJXw3wlrfDfiZJfwElYnd/jLyDKyixJ/KKjg==
Date: Mon, 26 Aug 2024 11:45:19 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: xianwei.zhao@amlogic.com
Cc: Yiting Deng <yiting.deng@amlogic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rtc: support for the Amlogic on-chip RTC
Message-ID: <2024082609451907fd19e2@mail.local>
References: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
 <20240823-rtc-v1-2-6f70381da283@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240823-rtc-v1-2-6f70381da283@amlogic.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 23/08/2024 17:19:45+0800, Xianwei Zhao via B4 Relay wrote:
> From: Yiting Deng <yiting.deng@amlogic.com>
> 
> Support for the on-chip RTC found in some of Amlogic's SoCs such as the
> A113L2 and A113X2.
> 
> Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  drivers/rtc/Kconfig       |  12 +
>  drivers/rtc/Makefile      |   1 +
>  drivers/rtc/rtc-amlogic.c | 589 ++++++++++++++++++++++++++++++++++++++++++++++

As pointed out, this is the third amlogic driver so the name of the file
must be more specific.

> +static void aml_set_time(struct aml_rtc_data *rtc, u32 time_sec)

Is indirection necessary, this function is used only once

> +{
> +	if (rtc->config->gray_stored)
> +		time_sec = binary_to_gray(time_sec);
> +	regmap_write(rtc->map, RTC_COUNTER_REG, time_sec);
> +}
> +
> +static u32 aml_read_time(struct aml_rtc_data *rtc)
Ditto

> +{
> +	u32 time_sec;
> +
> +	regmap_read(rtc->map, RTC_REAL_TIME, &time_sec);
> +	if (rtc->config->gray_stored)
> +		time_sec = gray_to_binary(time_sec);
> +	return time_sec;
> +}
> +
> +static u32 aml_read_alarm(struct aml_rtc_data *rtc)
Ditto

> +{
> +	u32 alarm_sec;
> +
> +	regmap_read(rtc->map, RTC_ALARM0_REG, &alarm_sec);
> +	if (rtc->config->gray_stored)
> +		alarm_sec = gray_to_binary(alarm_sec);
> +	return alarm_sec;
> +}
> +
> +static void aml_set_alarm(struct aml_rtc_data *rtc, u32 alarm_sec)
Ditto

> +{
> +	if (rtc->config->gray_stored)
> +		alarm_sec = binary_to_gray(alarm_sec);
> +	regmap_write(rtc->map, RTC_ALARM0_REG, alarm_sec);
> +}
> +
> +static int aml_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
> +{
> +	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
> +	time64_t alarm_sec;
> +
> +	if (alarm->enabled) {

Why aren't you setting the alarm when it is not enabled?

> +		regmap_update_bits(rtc->map, RTC_CTRL,
> +				   RTC_ALRM0_EN, RTC_ALRM0_EN);
> +		regmap_update_bits(rtc->map, RTC_INT_MASK,
> +				   RTC_ALRM0_IRQ_MSK, 0);
> +
> +		alarm_sec = rtc_tm_to_time64(&alarm->time);
> +		if (alarm_sec > U32_MAX) {

This is never going to happen, the test and error message are not
necessary.

> +			dev_err(dev, "alarm value invalid!\n");
> +			return -EINVAL;
> +		}
> +		aml_set_alarm(rtc, alarm_sec);
> +	}
> +	dev_dbg(dev, "%s: alarm->enabled=%d alarm_set=%llds\n", __func__,
> +		alarm->enabled, alarm_sec);
> +
> +	return 0;
> +}
> +
> +static int aml_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
> +{
> +	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
> +	u32 alarm_sec;
> +	u32 reg_val;
> +	int alarm_enable, alarm_mask;
> +
> +	alarm_sec = aml_read_alarm(rtc);
> +	rtc_time64_to_tm(alarm_sec, &alarm->time);
> +
> +	regmap_read(rtc->map, RTC_CTRL, &reg_val);
> +	alarm_enable = FIELD_GET(RTC_ALRM0_EN, reg_val);
> +
> +	regmap_read(rtc->map, RTC_INT_MASK, &reg_val);
> +	alarm_mask = FIELD_GET(RTC_ALRM0_IRQ_MSK, reg_val);
> +
> +	alarm->enabled = (alarm_enable && !alarm_mask) ? 1 : 0;
> +	dev_dbg(dev, "%s: alarm->enabled=%d alarm=%us\n", __func__,
> +		alarm->enabled, alarm_sec);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t aml_rtc_handler(int irq, void *data)
> +{
> +	struct aml_rtc_data *rtc = (struct aml_rtc_data *)data;
> +
> +	regmap_write(rtc->map, RTC_ALARM0_REG, 0);
> +	regmap_update_bits(rtc->map, RTC_INT_CLR,
> +			   RTC_ALRM0_IRQ_STATUS, RTC_ALRM0_IRQ_STATUS);

Are you sure regmap_update_bits is necessary here?

> +
> +	rtc_update_irq(rtc->rtc_dev, 1, RTC_AF | RTC_IRQF);
> +
> +	return IRQ_HANDLED;
> +}
> +


> +static int aml_rtc_adjust_sec(struct device *dev, u32 match_counter,
> +			      int ops, int enable)
> +{
> +	struct aml_rtc_data *rtc = dev_get_drvdata(dev->parent);
> +	u32 reg_val;
> +
> +	if (!FIELD_FIT(RTC_MATCH_COUNTER, match_counter)) {
> +		pr_err("%s: invalid match_counter\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	reg_val = FIELD_PREP(RTC_SEC_ADJUST_CTRL, ops)
> +		  | FIELD_PREP(RTC_MATCH_COUNTER, match_counter)
> +		  | FIELD_PREP(RTC_ADJ_VALID, enable);
> +	/* Set sec_adjust_ctrl, match_counter and Valid adjust */
> +	regmap_write(rtc->map, RTC_SEC_ADJUST_REG, reg_val);
> +
> +	return 0;
> +}
> +
> +static int aml_rtc_set_calibration(struct device *dev, u32 calibration)
> +{
> +	int cal_ops, enable, match_counter;
> +	int ret;
> +
> +	match_counter = FIELD_GET(RTC_MATCH_COUNTER, calibration);
> +	cal_ops = FIELD_GET(RTC_SEC_ADJUST_CTRL, calibration);
> +	enable = FIELD_GET(RTC_ADJ_VALID, calibration);
> +
> +	ret = aml_rtc_adjust_sec(dev, match_counter, cal_ops, enable);
> +	dev_dbg(dev, "%s: Success to store RTC calibration attribute\n",
> +		__func__);
> +
> +	return ret;
> +}
> +
> +static int aml_rtc_get_calibration(struct device *dev, u32 *calibration)
> +{
> +	struct aml_rtc_data *rtc = dev_get_drvdata(dev->parent);
> +	u32 reg_val;
> +
> +	regmap_read(rtc->map, RTC_SEC_ADJUST_REG, &reg_val);
> +	*calibration = FIELD_GET(RTC_SEC_ADJUST_CTRL | RTC_MATCH_COUNTER, reg_val);
> +	/* BIT is only UL defined，and GENMASK has no type, its' donot used together */
> +	*calibration |= FIELD_PREP(RTC_ADJ_VALID, FIELD_GET(RTC_ADJ_VALID, reg_val));
> +
> +	return 0;
> +}
> +
> +/**
> + * The calibration value transferred from buf takes bit[18:0] to represent
> + * match_counter, while takes bit[20:19] to represent sec_adjust_ctrl, bit[23]
> + * to represent adj_valid. enable/disable sec_adjust_ctrl and match_counter.
> + * @buf: Separate buf to match_counter, sec_adjust_ctrl and adj_valid
> + *	 match_counter: bit[18:0], value is 0 ~ 0x7fff
> + *	 sec_adjust_ctrl: bit[20:19], value is 0 ~ 2. 3 to insert a second once every
> + *	 match_counter+1 seconds, 2 to swallow a second once every match_counter+1 seconds
> + *	 0 or 1 to no adjustment
> + *	 adj_valid: bit[23], value is 0 or 1, 0 to disable sec_adjust_ctrl and
> + *	 match_counter, and 1 to enable them.
> + */
> +static ssize_t rtc_calibration_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	int retval;
> +	int calibration = 0;
> +
> +	if (sscanf(buf, " %i ", &calibration) != 1) {
> +		dev_err(dev, "Failed to store RTC calibration attribute\n");
> +		return -EINVAL;
> +	}
> +	retval = aml_rtc_set_calibration(dev, calibration);
> +
> +	return retval ? retval : count;
> +}
> +
> +static ssize_t rtc_calibration_show(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
> +{
> +	int  retval = 0;
> +	u32  calibration = 0;
> +
> +	retval = aml_rtc_get_calibration(dev, &calibration);
> +	if (retval < 0) {
> +		dev_err(dev, "Failed to read RTC calibration attribute\n");
> +		sprintf(buf, "0\n");
> +		return retval;
> +	}
> +
> +	return sprintf(buf, "0x%x\n", calibration);
> +}
> +static DEVICE_ATTR_RW(rtc_calibration);
> +
> +static int rtc_set_div256_adjust(struct device *dev, u32 *value)
> +{
> +	struct aml_rtc_data *rtc = dev_get_drvdata(dev->parent);
> +	u32 div256_adj;
> +
> +	div256_adj = FIELD_PREP(RTC_DIV256_ADJ_DSR | RTC_DIV256_ADJ_VAL, *value);
> +	/*
> +	 * AO_RTC_SEC_ADJUST_REG bit 24 insert/remove(1/0) a div256 cycle,
> +	 * bit 25 valid/invalid(1/0) div256_adj_val
> +	 */
> +	regmap_write_bits(rtc->map, RTC_SEC_ADJUST_REG,
> +			  RTC_DIV256_ADJ_DSR | RTC_DIV256_ADJ_VAL, div256_adj);
> +	/* rtc need about 30ms to adjust its time after written */
> +	mdelay(30);
> +
> +	return 0;
> +}
> +
> +static int rtc_get_div256_adjust(struct device *dev, u32 *value)
> +{
> +	struct aml_rtc_data *rtc = dev_get_drvdata(dev->parent);
> +	u32 reg_val;
> +
> +	regmap_read(rtc->map, RTC_SEC_ADJUST_REG, &reg_val);
> +	*value = FIELD_GET(RTC_DIV256_ADJ_DSR | RTC_DIV256_ADJ_VAL, reg_val);
> +
> +	return 0;
> +}
> +
> +/**
> + * div256 adjust function is controlled using bit[24] and bit[25].
> + * transferred buf takes bit[0] to represent div256 adj val, bit[1]
> + * to represent div256 adj enable/disable. div256 cycle means that adjust
> + * 1/32768/256 once by written once, it's val is equal to 1/128s
> + * @buf: 3: enable div256 adjust and insert a div256 cycle
> + *	 2: enable div256 adjust and remove a div256 cycle
> + *	 1 or 0: disable div256 adjust
> + */
> +static ssize_t rtc_div256_adjust_store(struct device *dev,
> +				       struct device_attribute *attr,
> +				       const char *buf, size_t count)
> +{
> +	int retval;
> +	u32 value = 0;
> +
> +	if (sscanf(buf, " %i ", &value) != 1) {
> +		dev_err(dev, "Failed to store RTC div256 adjust attribute\n");
> +		return -EINVAL;
> +	}
> +	retval = rtc_set_div256_adjust(dev, &value);
> +
> +	return retval ? retval : count;
> +}
> +
> +static ssize_t rtc_div256_adjust_show(struct device *dev,
> +				      struct device_attribute *attr, char *buf)
> +{
> +	int retval = 0;
> +	u32 value = 0;
> +
> +	retval = rtc_get_div256_adjust(dev, &value);
> +	if (retval < 0) {
> +		dev_err(dev, "Failed to read RTC div256 adjust attribute\n");
> +		sprintf(buf, "0\n");
> +		return retval;
> +	}
> +
> +	return sprintf(buf, "0x%x\n", value);
> +}
> +static DEVICE_ATTR_RW(rtc_div256_adjust);
> +
> +static struct attribute *aml_rtc_attrs[] = {
> +	&dev_attr_rtc_calibration.attr,
> +	&dev_attr_rtc_div256_adjust.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group aml_rtc_sysfs_files = {
> +	.attrs	= aml_rtc_attrs,
> +};
> +

You must use the standard RTC API to handle calibration, see
.read_offset and .set_offset

> +static void aml_rtc_init(struct device *dev, struct aml_rtc_data *rtc)
> +{
> +	u32 reg_val;
> +	u32 rtc_enable;
> +
> +	regmap_read(rtc->map, RTC_CTRL, &reg_val);
> +	rtc_enable = FIELD_GET(RTC_ENABLE, reg_val);
> +	if (!rtc_enable) {
> +		if (clk_get_rate(rtc->sclk) == OSC_24M) {
> +			/* select 24M oscillator */
> +			regmap_update_bits(rtc->map, RTC_CTRL, RTC_OSC_SEL, RTC_OSC_SEL);
> +
> +			/*
> +			 * Set RTC oscillator to freq_out to freq_in/((N0*M0+N1*M1)/(M0+M1))
> +			 * Enable clock_in gate of oscillator 24MHz
> +			 * Set N0 to 733, N1 to 732
> +			 */
> +			reg_val = FIELD_PREP(RTC_OSCIN_IN_EN, 1)
> +				  | FIELD_PREP(RTC_OSCIN_OUT_CFG, 1)
> +				  | FIELD_PREP(RTC_OSCIN_OUT_N0M0, RTC_OSCIN_OUT_32K_N0)
> +				  | FIELD_PREP(RTC_OSCIN_OUT_N1M1, RTC_OSCIN_OUT_32K_N1);
> +			regmap_write_bits(rtc->map, RTC_OSCIN_CTRL0, RTC_OSCIN_IN_EN
> +					  | RTC_OSCIN_OUT_CFG | RTC_OSCIN_OUT_N0M0
> +					  | RTC_OSCIN_OUT_N1M1, reg_val);
> +
> +			/* Set M0 to 2, M1 to 3, so freq_out = 32768 Hz*/
> +			reg_val = FIELD_PREP(RTC_OSCIN_OUT_N0M0, RTC_OSCIN_OUT_32K_M0)
> +				  | FIELD_PREP(RTC_OSCIN_OUT_N1M1, RTC_OSCIN_OUT_32K_M1);
> +			regmap_write_bits(rtc->map, RTC_OSCIN_CTRL1, RTC_OSCIN_OUT_N0M0
> +					  | RTC_OSCIN_OUT_N1M1, reg_val);
> +		} else {
> +			/* select 32K oscillator */
> +			regmap_write_bits(rtc->map, RTC_CTRL, RTC_OSC_SEL, 0);
> +		}
> +		/* Enable RTC */
> +		regmap_write_bits(rtc->map, RTC_CTRL, RTC_ENABLE, RTC_ENABLE);

		This must not be done at probe time, else you loose the
		important information taht the time has never been set. Instead,
		it should only be enabled on the first .set_time invocation do
		you could now in .read_time that the time is currently invalid.

> +		usleep_range(100, 200);
> +	}
> +	regmap_write_bits(rtc->map, RTC_INT_MASK,
> +			  RTC_ALRM0_IRQ_MSK, RTC_ALRM0_IRQ_MSK);
> +	regmap_write_bits(rtc->map, RTC_CTRL, RTC_ALRM0_EN, 0);
> +}
> +

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

