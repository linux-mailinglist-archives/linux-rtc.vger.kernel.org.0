Return-Path: <linux-rtc+bounces-2520-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 487499C48C9
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 23:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDC4B1F22A9A
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 22:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0261BC9E2;
	Mon, 11 Nov 2024 22:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ntkkyCgj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC21E7F477;
	Mon, 11 Nov 2024 22:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731362856; cv=none; b=bBbyK1uLVMWeSMp4lJXuVzDvCbzcW5EvLDyDwCLRxZ+z1+q7my7K8k4McapDeFZAnueIGrGH+iaSfokJ37HsgTOuvCLjteP5/W6IuqROXbwd77axxk0tLmDsz1Jbr0sk5+IKNcp00QZO6WXrhkALdXvErMbbh5nLf1O/wchy77c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731362856; c=relaxed/simple;
	bh=Ur6mJHOATKYegvM6PWg1gVJDzfNeMruksqIq0g4+c8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHbX95Qb+HR2kr00ctFGn3JyQNqCudYwV9tUYs6IZ76exrTJ0djfSQSqwERc54/m1Vt7Vha0PfDoL9web6CsbUGbdjuLN2P2jVFEFkgvV4dVf9tHIHFeWQNTuw1mV68bPZKnNjYGv9SHB1RJ08ae79mC+4m23J+U//DEkEq/d7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ntkkyCgj; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BC641C0002;
	Mon, 11 Nov 2024 22:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731362846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nvLBpIbXRymgph7QAAvU55QOaoId7HTwuv+sfMNt8G4=;
	b=ntkkyCgjQYaK73FYXJqWzOXfNXxT51oEVfa94QheQndXN4q3pgTot68IEr0ofUi0Ud6aDw
	6fb+pvwfewtJ/eJi+H+5bet77fU+FN9uRlfMozMp8AtuQKEOYEAqiaq3ZV0z1XFJJCbYgp
	prz4MZbxcfT6v1UrPKTc2IiXebg+Zw1hbLfXi951fsnEe/Fylbv5yJkTSxB3nsF5sx3XWu
	SSjEVYeyrMctLefS7EDvD/aOMbPck5XRL9YFCXMD+L1PY9LxU71eMpY/dqJJQph/Q6Bj+d
	+iJykkRgN74cf1wDuSsxYPjrn6nDdIfV3giY934sBiZJbLkD7ENOlcu8410EkA==
Date: Mon, 11 Nov 2024 23:07:23 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: xianwei.zhao@amlogic.com
Cc: Yiting Deng <yiting.deng@amlogic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] rtc: support for the Amlogic on-chip RTC
Message-ID: <202411112207234c96cc30@mail.local>
References: <20241108-rtc-v5-0-0194727c778b@amlogic.com>
 <20241108-rtc-v5-2-0194727c778b@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241108-rtc-v5-2-0194727c778b@amlogic.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 08/11/2024 13:54:42+0800, Xianwei Zhao via B4 Relay wrote:
> +static int aml_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
> +	u32 time_sec;
> +
> +	/* if RTC disabled, read time failed */
> +	if (!rtc->rtc_enabled) {
> +		dev_err(dev, "RTC disabled, read time failed\n");

These messages should be dropped, they probably won't be seen by any
user.

> +		return -EINVAL;
> +	}
> +
> +	regmap_read(rtc->map, RTC_REAL_TIME, &time_sec);
> +	if (rtc->config->gray_stored)
> +		time_sec = gray_to_binary(time_sec);
> +	rtc_time64_to_tm(time_sec, tm);
> +	dev_dbg(dev, "%s: read time = %us\n", __func__, time_sec);
> +
> +	return 0;
> +}
> +
> +static int aml_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
> +	u32 time_sec;
> +
> +	/* if RTC disabled, first enable it */
> +	if (!rtc->rtc_enabled) {
> +		regmap_write_bits(rtc->map, RTC_CTRL, RTC_ENABLE, RTC_ENABLE);
> +		usleep_range(100, 200);
> +		rtc->rtc_enabled = regmap_test_bits(rtc->map, RTC_CTRL, RTC_ENABLE);
> +		if (!rtc->rtc_enabled) {
> +			dev_err(dev, "RTC enable failed\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	time_sec = rtc_tm_to_time64(tm);
> +	if (rtc->config->gray_stored)
> +		time_sec = binary_to_gray(time_sec);
> +	regmap_write(rtc->map, RTC_COUNTER_REG, time_sec);
> +	dev_dbg(dev, "%s: set time = %us\n", __func__, time_sec);
> +
> +	return 0;
> +}
> +
> +static int aml_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
> +{
> +	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
> +	time64_t alarm_sec;
> +
> +	/* if RTC disabled, set alarm failed */
> +	if (!rtc->rtc_enabled) {
> +		dev_err(dev, "RTC disabled, set alarm failed\n");
> +		return -EINVAL;
> +	}
> +
> +	regmap_update_bits(rtc->map, RTC_CTRL,
> +			   RTC_ALRM0_EN, RTC_ALRM0_EN);
> +	regmap_update_bits(rtc->map, RTC_INT_MASK,
> +			   RTC_ALRM0_IRQ_MSK, 0);
> +
> +	alarm_sec = rtc_tm_to_time64(&alarm->time);
> +	if (rtc->config->gray_stored)
> +		alarm_sec = binary_to_gray(alarm_sec);
> +	regmap_write(rtc->map, RTC_ALARM0_REG, alarm_sec);
> +
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
> +	int alarm_enable;
> +	int alarm_mask;
> +
> +	/* if RTC disabled, read alarm failed */
> +	if (!rtc->rtc_enabled) {
> +		dev_err(dev, "RTC disabled, read alarm failed\n");
> +		return -EINVAL;
> +	}
> +
> +	regmap_read(rtc->map, RTC_ALARM0_REG, &alarm_sec);
> +	if (rtc->config->gray_stored)
> +		alarm_sec = gray_to_binary(alarm_sec);
> +	rtc_time64_to_tm(alarm_sec, &alarm->time);
> +
> +	alarm_enable = regmap_test_bits(rtc->map, RTC_CTRL, RTC_ALRM0_EN);
> +	alarm_mask = regmap_test_bits(rtc->map, RTC_INT_MASK, RTC_ALRM0_IRQ_MSK);
> +	alarm->enabled = (alarm_enable && !alarm_mask) ? 1 : 0;
> +	dev_dbg(dev, "%s: alarm->enabled=%d alarm=%us\n", __func__,
> +		alarm->enabled, alarm_sec);
> +
> +	return 0;
> +}
> +
> +static int aml_rtc_read_offset(struct device *dev, long *offset)
> +{
> +	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
> +	u32 reg_val;
> +	long val;
> +	int sign, match_counter, enable;
> +
> +	/* if RTC disabled, read offset failed */
> +	if (!rtc->rtc_enabled) {
> +		dev_err(dev, "RTC disabled, read offset failed\n");
> +		return -EINVAL;
> +	}
> +
> +	regmap_read(rtc->map, RTC_SEC_ADJUST_REG, &reg_val);
> +	enable = FIELD_GET(RTC_ADJ_VALID, reg_val);
> +	if (!enable) {
> +		val = 0;
> +	} else {
> +		sign = FIELD_GET(RTC_SEC_ADJUST_CTRL, reg_val);
> +		match_counter = FIELD_GET(RTC_MATCH_COUNTER, reg_val);
> +		val = 1000000000 / (match_counter + 1);
> +		if (sign == RTC_SWALLOW_SECOND)
> +			val = -val;
> +	}
> +	*offset = val;
> +
> +	return 0;
> +}
> +
> +static int aml_rtc_set_offset(struct device *dev, long offset)
> +{
> +	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
> +	int sign = 0;
> +	int match_counter = 0;
> +	int enable = 0;
> +	u32 reg_val;
> +
> +	/* if RTC disabled, set offset failed */
> +	if (!rtc->rtc_enabled) {
> +		dev_err(dev, "RTC disabled, set offset failed\n");
> +		return -EINVAL;
> +	}
> +
> +	if (offset) {
> +		enable = 1;
> +		sign = offset < 0 ? RTC_SWALLOW_SECOND : RTC_INSERT_SECOND;
> +		match_counter = 1000000000 / abs(offset) - 1;
> +		if (match_counter < 0 || match_counter > RTC_MATCH_COUNTER)
> +			return -EINVAL;
> +	}
> +
> +	reg_val = FIELD_PREP(RTC_ADJ_VALID, enable) |
> +		  FIELD_PREP(RTC_SEC_ADJUST_CTRL, sign) |
> +		  FIELD_PREP(RTC_MATCH_COUNTER, match_counter);
> +	regmap_write(rtc->map, RTC_SEC_ADJUST_REG, reg_val);
> +
> +	return 0;
> +}
> +
> +static int aml_rtc_alarm_enable(struct device *dev, unsigned int enabled)
> +{
> +	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
> +
> +	if (enabled) {
> +		regmap_update_bits(rtc->map, RTC_CTRL,
> +				   RTC_ALRM0_EN, RTC_ALRM0_EN);
> +		regmap_update_bits(rtc->map, RTC_INT_MASK,
> +				   RTC_ALRM0_IRQ_MSK, 0);
> +	} else {
> +		regmap_update_bits(rtc->map, RTC_INT_MASK,
> +				   RTC_ALRM0_IRQ_MSK, RTC_ALRM0_IRQ_MSK);
> +		regmap_update_bits(rtc->map, RTC_CTRL,
> +				   RTC_ALRM0_EN, 0);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct rtc_class_ops aml_rtc_ops = {
> +	.read_time = aml_rtc_read_time,
> +	.set_time = aml_rtc_set_time,
> +	.read_alarm = aml_rtc_read_alarm,
> +	.set_alarm = aml_rtc_set_alarm,
> +	.alarm_irq_enable = aml_rtc_alarm_enable,
> +	.read_offset = aml_rtc_read_offset,
> +	.set_offset = aml_rtc_set_offset,
> +};
> +
> +static irqreturn_t aml_rtc_handler(int irq, void *data)
> +{
> +	struct aml_rtc_data *rtc = (struct aml_rtc_data *)data;
> +
> +	regmap_write(rtc->map, RTC_ALARM0_REG, 0);
> +	regmap_write(rtc->map, RTC_INT_CLR, RTC_ALRM0_IRQ_STATUS);
> +
> +	rtc_update_irq(rtc->rtc_dev, 1, RTC_AF | RTC_IRQF);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void aml_rtc_init(struct aml_rtc_data *rtc)
> +{
> +	u32 reg_val = 0;
> +
> +	rtc->rtc_enabled = regmap_test_bits(rtc->map, RTC_CTRL, RTC_ENABLE);
> +	if (!rtc->rtc_enabled) {
> +		if (clk_get_rate(rtc->rtc_clk) == OSC_24M) {
> +			/* select 24M oscillator */
> +			regmap_write_bits(rtc->map, RTC_CTRL, RTC_OSC_SEL, RTC_OSC_SEL);
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
> +	}
> +	regmap_write_bits(rtc->map, RTC_INT_MASK,
> +			  RTC_ALRM0_IRQ_MSK, RTC_ALRM0_IRQ_MSK);
> +	regmap_write_bits(rtc->map, RTC_CTRL, RTC_ALRM0_EN, 0);
> +}
> +
> +static int aml_rtc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct aml_rtc_data *rtc;
> +	void __iomem *base;
> +	int ret = 0;
> +
> +	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
> +	if (!rtc)
> +		return -ENOMEM;
> +
> +	rtc->config = of_device_get_match_data(dev);
> +	if (!rtc->config)
> +		return -ENODEV;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return dev_err_probe(dev, PTR_ERR(base), "resource ioremap failed\n");
> +
> +	rtc->map = devm_regmap_init_mmio(dev, base, &aml_rtc_regmap_config);
> +	if (IS_ERR(rtc->map))
> +		return dev_err_probe(dev, PTR_ERR(rtc->map), "regmap init failed\n");
> +
> +	rtc->irq = platform_get_irq(pdev, 0);
> +	if (rtc->irq < 0)
> +		return rtc->irq;
> +
> +	rtc->rtc_clk = devm_clk_get(dev, "osc");
> +	if (IS_ERR(rtc->rtc_clk))
> +		return dev_err_probe(dev, PTR_ERR(rtc->rtc_clk),
> +				     "failed to find rtc clock\n");
> +	if (clk_get_rate(rtc->rtc_clk) != OSC_32K && clk_get_rate(rtc->rtc_clk) != OSC_24M)
> +		return dev_err_probe(dev, -EINVAL, "Invalid clock configuration\n");
> +
> +	rtc->sys_clk = devm_clk_get_enabled(dev, "sys");
> +	if (IS_ERR(rtc->sys_clk))
> +		return dev_err_probe(dev, PTR_ERR(rtc->sys_clk),
> +				     "failed to get_enable rtc sys clk\n");
> +	aml_rtc_init(rtc);
> +
> +	device_init_wakeup(dev, 1);
> +	platform_set_drvdata(pdev, rtc);
> +
> +	rtc->rtc_dev = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(rtc->rtc_dev)) {
> +		ret = PTR_ERR(rtc->rtc_dev);
> +		goto err_clk;
> +	}
> +
> +	ret = devm_request_irq(dev, rtc->irq, aml_rtc_handler,
> +			       IRQF_ONESHOT, "aml-rtc alarm", rtc);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "IRQ%d request failed, ret = %d\n",
> +			      rtc->irq, ret);
> +		goto err_clk;
> +	}
> +
> +	rtc->rtc_dev->ops = &aml_rtc_ops;
> +	rtc->rtc_dev->range_min = 0;
> +	rtc->rtc_dev->range_max = U32_MAX;
> +
> +	ret = devm_rtc_register_device(rtc->rtc_dev);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "Failed to register RTC device: %d\n", ret);
> +		goto err_clk;
> +	}
> +
> +	return 0;
> +err_clk:
> +	clk_disable_unprepare(rtc->sys_clk);
> +	device_init_wakeup(dev, 0);
> +
> +	return ret;
> +}
> +
> +static int aml_rtc_suspend(struct device *dev)
> +{
> +	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(rtc->irq);
> +
> +	return 0;
> +}
> +
> +static int aml_rtc_resume(struct device *dev)
> +{
> +	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(rtc->irq);
> +
> +	return 0;
> +}

Building this, i got:

drivers/rtc/rtc-amlogic-a4.c:409:12: error: ‘aml_rtc_resume’ defined but not used [-Werror=unused-function]
  409 | static int aml_rtc_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~
drivers/rtc/rtc-amlogic-a4.c:399:12: error: ‘aml_rtc_suspend’ defined but not used [-Werror=unused-function]
  399 | static int aml_rtc_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~


> +
> +static SIMPLE_DEV_PM_OPS(aml_rtc_pm_ops,
> +			 aml_rtc_suspend, aml_rtc_resume);
> +
> +static void aml_rtc_remove(struct platform_device *pdev)
> +{
> +	struct aml_rtc_data *rtc = dev_get_drvdata(&pdev->dev);
> +
> +	/* disable RTC */
> +	regmap_write_bits(rtc->map, RTC_CTRL, RTC_ENABLE, 0);

You can't do this, this defeats the purpose of the RTC. Once started an
set, it must not be stopped.

> +	clk_disable_unprepare(rtc->sys_clk);
> +	device_init_wakeup(&pdev->dev, 0);
> +}
> +
> +static const struct aml_rtc_config a5_rtc_config = {
> +};
> +
> +static const struct aml_rtc_config a4_rtc_config = {
> +	.gray_stored = true,
> +};
> +
> +static const struct of_device_id aml_rtc_device_id[] = {
> +	{
> +		.compatible = "amlogic,a4-rtc",
> +		.data = &a4_rtc_config,
> +	},
> +	{
> +		.compatible = "amlogic,a5-rtc",
> +		.data = &a5_rtc_config,
> +	},
> +};
> +MODULE_DEVICE_TABLE(of, aml_rtc_device_id);
> +
> +static struct platform_driver aml_rtc_driver = {
> +	.probe = aml_rtc_probe,
> +	.remove = aml_rtc_remove,
> +	.driver = {
> +		.name = "aml-rtc",
> +		.pm = &aml_rtc_pm_ops,
> +		.of_match_table = aml_rtc_device_id,
> +	},
> +};
> +
> +module_platform_driver(aml_rtc_driver);
> +MODULE_DESCRIPTION("Amlogic RTC driver");
> +MODULE_AUTHOR("Yiting Deng <yiting.deng@amlogic.com>");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.37.1
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

