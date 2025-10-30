Return-Path: <linux-rtc+bounces-5218-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72298C21801
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Oct 2025 18:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 988FC3A1F0E
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Oct 2025 17:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD26368F2B;
	Thu, 30 Oct 2025 17:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QNDPuvDE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F1621D3E8;
	Thu, 30 Oct 2025 17:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761845232; cv=none; b=aKgp+dIsK0dDYHK8evoTamG8V1Ae9Sse/b7Jx2693pFX26pWRPi4kibY/Kumt+1IUg2EC6jXOdOTnFUIGNNuYNy1W0aHhFyPiTTtZjlAgbCq6x16qk2RHhGmYfyTYkasuBv/T+pfwVsG8McEB88mRjcwTqSoV24qxJp51ouTVGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761845232; c=relaxed/simple;
	bh=zVEZjXlD6E5iDUme+pF1cU1mgp+WuV0YKWaQ5xeRaJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BF3elwhlLMsgKFFHTu1cE5f6dhYCExPoK1WtbVRoHcnN0nvr+LxDzsjvEWtcSmD7j3QJlwTG5dHF4H/3p7GHihpRFGVOlKWmWHyUxIKmpz0LwGLLBGiPUIVASk1mayvP6gfYrXPyIbL5YiQUPH8Wz+NO3mEw0eyMHMgoT38R4xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QNDPuvDE; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 956734E41402;
	Thu, 30 Oct 2025 17:27:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6A2CB60331;
	Thu, 30 Oct 2025 17:27:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35BCC11808D0E;
	Thu, 30 Oct 2025 18:27:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761845226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=TJQtz8A/+7qRiC5zFJQOdwJCNZuASZgKYF8VCygcGsU=;
	b=QNDPuvDEq7WAJGugy+YfOwFyP0FpUgBwHznjkuQN+JLPE8rG+Fojb4KS5+83Ia4N6nP6a1
	re9cjQk0+yaRNofUvIlgCI3Mb0t4REaZfNFDtUcVRXhZWD4Zbh8ZZabkBbffqM32q8kGNA
	DiS+J4lmn5Jd9haTAYvJUHLzekv+u1DVZXe+s8FTWE86C5C45Sc/TKpOhvzgTN8/2Ikojl
	iAF/lM5qcngDriivuvIM1HbFfYShqRl8UYwLmWJSqAHFUxDtPmkgLWYxfvXLeTQNoMRku8
	aGgvupigCs7WM6JVxrTslRbSHcSfGO2A1KkopZ/zwUG+aGCMRQRW0jXj7hv8fA==
Date: Thu, 30 Oct 2025 18:27:03 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 2/2] rtc: Add support for MT6685 Clock IC's RTC over
 SPMI
Message-ID: <20251030172703a51e304e@mail.local>
References: <20251024083318.25890-1-angelogioacchino.delregno@collabora.com>
 <20251024083318.25890-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024083318.25890-3-angelogioacchino.delregno@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3

On 24/10/2025 10:33:18+0200, AngeloGioacchino Del Regno wrote:
> +static irqreturn_t rtc_mt6685_irq_handler_thread(int irq, void *data)
> +{
> +	u16 irqsta, irqen = 0, bbpu = RTC_BBPU_WR_UNLOCK_KEY | RTC_BBPU_PWREN;
> +	struct mt6685_rtc *rtc = data;
> +	struct device *dev = &rtc->rdev->dev;
> +	int ret;
> +
> +	ret = clk_prepare_enable(rtc->mclk);
> +	if (ret)
> +		return IRQ_NONE;
> +
> +	ret = regmap_bulk_read(rtc->regmap, RTC_REG_IRQ_STA, &irqsta, sizeof(irqsta));
> +	if (ret)
> +		goto end;
> +
> +	/* Only alarm interrupts are supported for now */
> +	if (!(irqsta & RTC_IRQ_AL)) {
> +		ret = -EINVAL;
> +		goto end;
> +	}
> +
> +	rtc_lock(rtc->rdev);
> +
> +	/* Enable BBPU power and clear the interrupt */
> +	ret = regmap_bulk_write(rtc->regmap, RTC_REG_BBPU, &bbpu, sizeof(bbpu));
> +	if (ret)
> +		goto end;
> +
> +	ret = regmap_bulk_write(rtc->regmap, RTC_REG_IRQ_EN, &irqen, sizeof(irqen));
> +	if (ret)
> +		goto end;
> +
> +	/* Trigger reset of the RTC BBPU Alarm */
> +	bbpu |= RTC_BBPU_RESET_AL;
> +	ret = regmap_bulk_write(rtc->regmap, RTC_REG_BBPU, &bbpu, sizeof(bbpu));
> +	if (ret) {
> +		dev_err(dev, "Cannot reset alarm: %d\n", ret);
> +		goto end;
> +	}
> +
> +	/* Trigger write synchronization */
> +	ret = rtc_mt6685_write_trigger(rtc);
> +	if (ret) {
> +		dev_err(dev, "Cannot synchronize write to RTC: %d\n", ret);

I'm not sure those two dev_err are necessary.

> +		goto end;
> +	}
> +	rtc_update_irq(rtc->rdev, 1, RTC_IRQF | RTC_AF);
> +end:
> +	rtc_unlock(rtc->rdev);
> +	clk_disable_unprepare(rtc->mclk);
> +	return ret ? IRQ_NONE : IRQ_HANDLED;
> +}
> +


> +static int rtc_mt6685_read_time_regs(struct mt6685_rtc *rtc, struct rtc_time *tm, u16 reg)
> +{
> +	u16 data[RTC_AL_TC_REGIDX_MAX];
> +	int ret;
> +
> +	ret = regmap_bulk_read(rtc->regmap, reg, &data,
> +			       RTC_AL_TC_REGIDX_MAX * sizeof(data[0]));
> +	if (ret) {
> +		dev_err(&rtc->rdev->dev, "Cannot read time regs\n");

Same here, there is not much the user can do and your are already
returning an error.

> +		return ret;
> +	}
> +
> +	tm->tm_sec  = FIELD_GET(RTC_AL_TC_SEC_MIN, data[RTC_AL_TC_REGIDX_SEC]);
> +	tm->tm_min  = FIELD_GET(RTC_AL_TC_SEC_MIN, data[RTC_AL_TC_REGIDX_MIN]);
> +	tm->tm_hour = FIELD_GET(RTC_AL_TC_HOUR_DOM, data[RTC_AL_TC_REGIDX_HOUR]);
> +	tm->tm_mday = FIELD_GET(RTC_AL_TC_HOUR_DOM, data[RTC_AL_TC_REGIDX_DOM]);
> +	tm->tm_wday = FIELD_GET(RTC_AL_TC_DOW, data[RTC_AL_TC_REGIDX_DOW]);
> +	tm->tm_mon  = FIELD_GET(RTC_AL_TC_MON, data[RTC_AL_TC_REGIDX_MON]);
> +	tm->tm_year = FIELD_GET(RTC_AL_TC_YEAR, data[RTC_AL_TC_REGIDX_YEAR]);
> +
> +	/* HW register start mon/wday from one, but tm_mon/tm_wday start from zero. */
> +	tm->tm_mon--;
> +	tm->tm_wday--;
> +
> +	return 0;
> +}
> +

> +static int rtc_mt6685_probe(struct platform_device *pdev)
> +{
> +	struct regmap_config mt6685_rtc_regmap_config = {
> +		.reg_bits = 16,
> +		.val_bits = 8,
> +		.max_register = 0x60,
> +		.fast_io = true,
> +		.use_single_read = true,
> +		.use_single_write = true,
> +	};
> +	struct device *dev = &pdev->dev;
> +	struct spmi_subdevice *sub_sdev;
> +	struct spmi_device *sparent;
> +	struct mt6685_rtc *rtc;
> +	int ret;
> +
> +	rtc = devm_kzalloc(dev, sizeof(struct mt6685_rtc), GFP_KERNEL);
> +	if (!rtc)
> +		return -ENOMEM;
> +
> +	sparent = to_spmi_device(dev->parent);
> +	sub_sdev = devm_spmi_subdevice_alloc_and_add(dev, sparent);
> +	if (IS_ERR(sub_sdev))
> +		return PTR_ERR(sub_sdev);
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "reg",
> +				   &mt6685_rtc_regmap_config.reg_base);
> +	if (ret)
> +		return ret;
> +
> +	rtc->irq = platform_get_irq(pdev, 0);
> +	if (rtc->irq < 0)
> +		return rtc->irq;
> +
> +	rtc->mclk = devm_clk_get(dev, 0);
> +	if (IS_ERR(rtc->mclk))
> +		return PTR_ERR(rtc->mclk);
> +
> +	rtc->regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &mt6685_rtc_regmap_config);
> +	if (IS_ERR(rtc->regmap))
> +		return PTR_ERR(rtc->regmap);
> +
> +	rtc->rdev = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(rtc->rdev))
> +		return PTR_ERR(rtc->rdev);
> +
> +	platform_set_drvdata(pdev, rtc);
> +
> +	/* Clock is required to auto-synchronize IRQ enable to RTC */
> +	ret = clk_prepare_enable(rtc->mclk);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
> +					rtc_mt6685_irq_handler_thread,
> +					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> +					"mt6685-rtc", rtc);
> +	clk_disable_unprepare(rtc->mclk);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Cannot request alarm IRQ");
> +
> +	device_init_wakeup(&pdev->dev, true);

devm_device_init_wakeup ?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

