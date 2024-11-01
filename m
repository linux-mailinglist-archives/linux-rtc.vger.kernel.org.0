Return-Path: <linux-rtc+bounces-2420-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A4F9B8DCA
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 10:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D68612860D9
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 09:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F6B15852F;
	Fri,  1 Nov 2024 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="E1obOpST"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB512156220;
	Fri,  1 Nov 2024 09:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730453078; cv=none; b=sLk0F2OIfmtJTJkuKHh+EgiWw2jCo53Uf7ZSEkvSQ9GIbnWLvUMRlbdsXO9HTad78rpSYJAo4TuvZ5/eyQsut8gcAPQCmWjjX9UY6Fd9UDrHXrNXMigU4vEeWHO6dK6rx9SSuGydnQW7slq56tILEoLGnJlKnAPZC+datBpt4cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730453078; c=relaxed/simple;
	bh=uqcYVKNJ/6xy8np7sEEi91+9doYOyD3x1ty9nISwXmg=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=BqCyYLQqKypkdIpkhsSrQi8glgEDvDKgqkzEVmMbsNzQis2GzDHmsznEf/XFW3IbYWlMlyL2YISiqls0abCR097uG4e0Gx1YK9byY4fhSHWTCXFYdpdWAKu3cIPvizpJGevEQ3RSsFAcSxgdTKS/ltRiWbUPSJFiZZ635G68G9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=E1obOpST; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 6nkgtkAk1e9TB6nkgto0N8; Fri, 01 Nov 2024 10:15:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1730452532;
	bh=tNM5Z7wC0Hy8iSQfrM+16FEpDBVMI2P+7p22mCHlKmI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=E1obOpSTnroH0+bBlgKK8phjigBdrvecKBIC/+WPdIsln2iR2L23v9MCWEFBTCdmt
	 UZSBz14hqXFki2hk7rhfCFoHoWwVFutfjdNHJYjQh5zK4uYyQgHKzGhodP64M2fkGM
	 wzJkJSHMucVgG4lQ0MqpKlIFZkmAVmhLZdJpPEYBZTHjzfYXQ2iNvRQI4DL106CGZ3
	 jtuBq30JrRg+75/tIQ/UyiIXxoMNEefX5jQMG9H+TM6bH3nwGM4I4u/k5MmWVXxT/x
	 M1VAguiVWwnGsIt6vYXDiBLamSfi7GV/hWdDSthpprcLdh6ItDBv4vp8y1va3m1uZR
	 2/EsBYaCShfew==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 01 Nov 2024 10:15:32 +0100
X-ME-IP: 90.11.132.44
Message-ID: <7eaaa765-d6ed-4afb-8ea3-35bec91c667e@wanadoo.fr>
Date: Fri, 1 Nov 2024 10:15:27 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 2/3] rtc: support for the Amlogic on-chip RTC
References: <20241101-rtc-v4-0-14e1ed486ed8@amlogic.com>
 <20241101-rtc-v4-2-14e1ed486ed8@amlogic.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Yiting Deng <yiting.deng@amlogic.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20241101-rtc-v4-2-14e1ed486ed8@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 01/11/2024 à 03:06, Xianwei Zhao via B4 Relay a écrit :
> From: Yiting Deng <yiting.deng-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
> 
> This is the third amlogic driver. The RTC hardware of A4 SoC is different
> from the previous one. This RTC hardware includes a timing function and
> an alarm function. But the existing has only timing function, alarm
> function is using the system clock to implement a virtual alarm. Add
> the RTC driver to support it.
> 
> Signed-off-by: Yiting Deng <yiting.deng-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Xianwei Zhao <xianwei.zhao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>

...

> diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
> new file mode 100644
> index 000000000000..decd74df225c
> --- /dev/null
> +++ b/drivers/rtc/rtc-amlogic-a4.c
> @@ -0,0 +1,473 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2024 Amlogic, Inc. All rights reserved
> + * Author: Yiting Deng <yiting.deng-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/bitfield.h>
> +#include <linux/rtc.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/time64.h>
> +#include <linux/delay.h>

Nitpick: sometimes, alphabetical order is preferred.

> +
> +/* rtc oscillator rate */
> +#define OSC_32K			(32768)
> +#define OSC_24M			(24000000)

Nitpick: maybe these () could be removed to ease reading?

> +
> +#define RTC_CTRL		(0x0 << 2)		/* Control RTC */
> +#define RTC_ALRM0_EN		BIT(0)
> +#define RTC_OSC_SEL		BIT(8)
> +#define RTC_ENABLE		BIT(12)

...

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

Should we have something like:

		if (!rtc->rtc_enabled) {
			dev_err(dev, "<something>");
			return -EINVAL;
		}

if enabling fails?

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
> +	time64_t alarm_sec = 0;

Nitpick: No need to init.

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

...

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

Nitpick: If val was initialised above, you could save 2 lines of code here.

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

...

> +static int aml_rtc_probe(struct platform_device *pdev)
> +{
> +	struct aml_rtc_data *rtc;

Nitpick: defining:
	struct device *dev = &pdev->dev;

would simplify code bellow.

> +	void __iomem *base;
> +	int ret = 0;
> +
> +	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> +	if (!rtc)
> +		return -ENOMEM;
> +
> +	rtc->config = of_device_get_match_data(&pdev->dev);
> +	if (!rtc->config)
> +		return -ENODEV;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(base), "resource ioremap failed\n");
> +
> +	rtc->map = devm_regmap_init_mmio(&pdev->dev, base, &aml_rtc_regmap_config);
> +	if (IS_ERR(rtc->map))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->map), "regmap init failed\n");
> +
> +	rtc->irq = platform_get_irq(pdev, 0);
> +	if (rtc->irq < 0)
> +		return rtc->irq;
> +
> +	rtc->rtc_clk = devm_clk_get(&pdev->dev, "osc");
> +	if (IS_ERR(rtc->rtc_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->rtc_clk),
> +				     "failed to find rtc clock\n");
> +	if (clk_get_rate(rtc->rtc_clk) != OSC_32K && clk_get_rate(rtc->rtc_clk) != OSC_24M)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "Invalid clock configuration\n");
> +
> +	rtc->sys_clk = devm_clk_get(&pdev->dev, "sys");

Maybe devm_clk_get_enabled() to simplify code below and the .remove() 
function?

> +	if (IS_ERR(rtc->sys_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->sys_clk),
> +				     "failed to get rtc sys clk\n");
> +	ret = clk_prepare_enable(rtc->sys_clk);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to enable clk!\n");
> +
> +	aml_rtc_init(rtc);
> +
> +	device_init_wakeup(&pdev->dev, 1);
> +	platform_set_drvdata(pdev, rtc);
> +
> +	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(rtc->rtc_dev)) {
> +		ret = PTR_ERR(rtc->rtc_dev);
> +		goto err_clk;
> +	}
> +
> +	ret = devm_request_irq(&pdev->dev, rtc->irq, aml_rtc_handler,
> +			       IRQF_ONESHOT, "aml-rtc alarm", rtc);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "IRQ%d request failed, ret = %d\n",
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

Should device_init_wakeup(..., 0) be called here?
(as in the remove function)

> +
> +	return ret;
> +}

...

> +static SIMPLE_DEV_PM_OPS(aml_rtc_pm_ops,
> +			 aml_rtc_suspend, aml_rtc_resume);
> +
> +static int aml_rtc_remove(struct platform_device *pdev)

Should'nt it return void?
Compilation fails with latest -next.

> +{
> +	struct aml_rtc_data *rtc = dev_get_drvdata(&pdev->dev);
> +
> +	/* disable RTC */
> +	regmap_write_bits(rtc->map, RTC_CTRL, RTC_ENABLE, 0);
> +	clk_disable_unprepare(rtc->sys_clk);
> +	device_init_wakeup(&pdev->dev, 0);
> +
> +	return 0;
> +}

...

CJ


