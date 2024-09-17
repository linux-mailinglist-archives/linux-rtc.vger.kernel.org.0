Return-Path: <linux-rtc+bounces-2011-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C4A97B3BB
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Sep 2024 19:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC8F51C220F7
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Sep 2024 17:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF897185E6E;
	Tue, 17 Sep 2024 17:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPAT2ZBc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6B1174EFA;
	Tue, 17 Sep 2024 17:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726594854; cv=none; b=jnGw/SzOefdeY9vt3UM34wF2PJCJfEAoahaxHcaheO3eu7V0WByDyBF8Zoc3zKUDsQ3C52Y4WPIbZk05NSBnwVS5g598giJBL5wUNvXXILqBiCXqEeWD798DdYTDiI1SR/xTdHMImhVY4Hp6fS6dJus40MGHblT7Q28fgkPf1z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726594854; c=relaxed/simple;
	bh=CfyC31sh4NSND8jyoQX6OKo7Of16jGTsc/7R0TCHy14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Is58fo34ivdzc8Ah+7JG5okpHqos6xOaj0hSnIs/5QhghU/LN7q+WAhbgCpNDNxkirMZWO+W95Y+lKveEmoiXot1+WX1x3UUu+YNxv3qd6tLZD7tRXA7k9agGJoDnw95A9dNFN6OQI27sxKelVB2a5pjzTe7BXqLj8r8vQGpxDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPAT2ZBc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93371C4CEC5;
	Tue, 17 Sep 2024 17:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726594854;
	bh=CfyC31sh4NSND8jyoQX6OKo7Of16jGTsc/7R0TCHy14=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gPAT2ZBcYkkmfij4hHj6TqXn87KujkWns8I1H5A90IiyVWgQCy08tmzrGTjEMlYWU
	 26nEMVuEDNT7T1wyp3ksvQhxHRuR2SnrXDyFBFFGMpcpnXPk/zZ+8fKbU8+JxyKxd+
	 blzIQhfpehzA1xVdD8N+GAMGG8UEogQiakNY5xQh8XSsRk67uvm0+eXKrNwcovZbZU
	 eTKkF0+8Y9ELuxy/0paY4pRi0UXgStru5A5wdVjYbhbVVRcVTOY1OoS2VbirvEtmMX
	 A6vzre362IqIlhLOicebbv7IWK6DmxGR+ekn/DBOwpUGCzyyTRJdU6QO/A/JiAEJWj
	 TlmA2ApFpVJUw==
Message-ID: <51888969-5b0f-42de-8bbf-bcb325f642ea@kernel.org>
Date: Tue, 17 Sep 2024 19:40:47 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-3-ciprianmarian.costea@oss.nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240911070028.127659-3-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/09/2024 09:00, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add a RTC driver for NXP S32G2/S32G3 SoCs.
> 
> The RTC module is used to enable Suspend to RAM (STR) support
> on NXP S32G2/S32G3 SoC based boards.
> RTC tracks clock time during system suspend.
> 

...

> +	priv->div512 = !!div[0];
> +	priv->div32 = !!div[1];
> +
> +	switch (clksel) {
> +	case S32G_RTC_SOURCE_SIRC:
> +	case S32G_RTC_SOURCE_FIRC:
> +		priv->clk_source = clksel;
> +		break;
> +	default:
> +		dev_err(dev, "Unsupported clksel: %d\n", clksel);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rtc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rtc_priv *priv;
> +	int ret = 0;
> +
> +	priv = devm_kzalloc(dev, sizeof(struct rtc_priv),

sizeof(*)

> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->rtc_base)) {
> +		dev_err(dev, "Failed to map registers\n");
> +		return PTR_ERR(priv->rtc_base);

return dev_err_probe

> +	}
> +
> +	device_init_wakeup(dev, true);
> +	priv->dev = dev;
> +
> +	ret = priv_dts_init(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret = rtc_init(priv);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, priv);
> +	rtc_enable(priv);
> +
> +	priv->rdev = devm_rtc_device_register(dev, "s32g_rtc",
> +					      &rtc_ops, THIS_MODULE);
> +	if (IS_ERR_OR_NULL(priv->rdev)) {
> +		dev_err(dev, "Error registering RTC device, err: %ld\n",
> +			PTR_ERR(priv->rdev));
> +		ret = PTR_ERR(priv->rdev);
> +		goto disable_rtc;
> +	}
> +
> +	ret = devm_request_irq(dev, priv->dt_irq_id,
> +			       rtc_handler, 0, dev_name(dev), pdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Request interrupt %d failed, error: %d\n",
> +			priv->dt_irq_id, ret);
> +		goto disable_rtc;
> +	}
> +
> +	return 0;
> +
> +disable_rtc:
> +	rtc_disable(priv);
> +	return ret;
> +}
> +
> +static void rtc_remove(struct platform_device *pdev)
> +{
> +	struct rtc_priv *priv = platform_get_drvdata(pdev);
> +
> +	rtc_disable(priv);
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static void enable_api_irq(struct device *dev, unsigned int enabled)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	u32 api_irq = RTCC_APIEN | RTCC_APIIE;
> +	u32 rtcc;
> +
> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
> +	if (enabled)
> +		rtcc |= api_irq;
> +	else
> +		rtcc &= ~api_irq;
> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
> +}
> +
> +static int adjust_dividers(u32 sec, struct rtc_priv *priv)
> +{
> +	u64 rtcval_max = U32_MAX;
> +	u64 rtcval;
> +
> +	priv->div32 = 0;
> +	priv->div512 = 0;
> +
> +	rtcval = sec * priv->rtc_hz;
> +	if (rtcval < rtcval_max)
> +		return 0;
> +
> +	if (rtcval / 32 < rtcval_max) {
> +		priv->div32 = 1;
> +		return 0;
> +	}
> +
> +	if (rtcval / 512 < rtcval_max) {
> +		priv->div512 = 1;
> +		return 0;
> +	}
> +
> +	if (rtcval / (512 * 32) < rtcval_max) {
> +		priv->div32 = 1;
> +		priv->div512 = 1;
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int rtc_suspend(struct device *dev)
> +{
> +	struct rtc_priv *init_priv = dev_get_drvdata(dev);
> +	struct rtc_priv priv;
> +	long long base_sec;
> +	int ret = 0;
> +	u32 rtcval;
> +	u32 sec;
> +
> +	if (!device_may_wakeup(dev))
> +		return 0;
> +
> +	/* Save last known timestamp before we switch clocks and reinit RTC */
> +	ret = s32g_rtc_read_time(dev, &priv.base.tm);
> +	if (ret)
> +		return ret;
> +
> +	if (init_priv->clk_source == S32G_RTC_SOURCE_SIRC)
> +		return 0;
> +
> +	/*
> +	 * Use a local copy of the RTC control block to
> +	 * avoid restoring it on resume path.
> +	 */
> +	memcpy(&priv, init_priv, sizeof(priv));
> +
> +	/* Switch to SIRC */
> +	priv.clk_source = S32G_RTC_SOURCE_SIRC;
> +
> +	ret = get_time_left(dev, init_priv, &sec);
> +	if (ret)
> +		return ret;
> +
> +	/* Adjust for the number of seconds we'll be asleep */
> +	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
> +	base_sec += sec;
> +	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
> +
> +	rtc_disable(&priv);
> +
> +	ret = adjust_dividers(sec, &priv);
> +	if (ret) {
> +		dev_err(dev, "Failed to adjust RTC dividers to match a %u seconds delay\n", sec);
> +		return ret;
> +	}
> +
> +	ret = rtc_init(&priv);
> +	if (ret)
> +		return ret;
> +
> +	ret = sec_to_rtcval(&priv, sec, &rtcval);
> +	if (ret) {
> +		dev_warn(dev, "Alarm is too far in the future\n");
> +		return ret;
> +	}
> +
> +	s32g_rtc_alarm_irq_enable(dev, 0);
> +	enable_api_irq(dev, 1);
> +	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
> +	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
> +
> +	rtc_enable(&priv);
> +
> +	return ret;
> +}
> +
> +static int rtc_resume(struct device *dev)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!device_may_wakeup(dev))
> +		return 0;
> +
> +	/* Disable wake-up interrupts */
> +	enable_api_irq(dev, 0);
> +
> +	/* Reinitialize the driver using the initial settings */
> +	ret = rtc_init(priv);
> +	if (ret)
> +		return ret;
> +
> +	rtc_enable(priv);
> +
> +	/*
> +	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
> +	 * reapply the saved time settings
> +	 */
> +	return s32g_rtc_set_time(dev, &priv->base.tm);
> +}
> +#endif /* CONFIG_PM_SLEEP */
> +
> +static const struct of_device_id rtc_dt_ids[] = {
> +	{.compatible = "nxp,s32g-rtc" },
> +	{ /* sentinel */ },
> +};
> +
> +static SIMPLE_DEV_PM_OPS(rtc_pm_ops,
> +			 rtc_suspend, rtc_resume);
> +
> +static struct platform_driver rtc_driver = {
> +	.driver		= {
> +		.name			= "s32g-rtc",
> +		.pm				= &rtc_pm_ops,
> +		.of_match_table = of_match_ptr(rtc_dt_ids),

Drop of_match_ptr, you have here warning.

> +	},
> +	.probe		= rtc_probe,
> +	.remove_new	= rtc_remove,
> +};
> +module_platform_driver(rtc_driver);
> +
> +MODULE_AUTHOR("NXP");
> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
> +MODULE_LICENSE("GPL");

Best regards,
Krzysztof


