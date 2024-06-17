Return-Path: <linux-rtc+bounces-1339-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E59090A8D0
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 10:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FA9A1C229D3
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 08:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38713190685;
	Mon, 17 Jun 2024 08:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQ9MBm2P"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11043190684
	for <linux-rtc@vger.kernel.org>; Mon, 17 Jun 2024 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718614492; cv=none; b=YtsG9jYtuuzpUf+EezOcFuoTSQ2lKtL1Jx5xfNLVOO5fRSrMX+OrTKbVYwJzEsi0q6E2pq8OM/gEu94NpP+lx6zDhAw3+uTx92ZkuU81+X18/XxG4DJkV5B5jJ8FDoaQzKzYaXCCLWPKEFOi+rgdtrHr49rgwFZyHIGf3Js8DcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718614492; c=relaxed/simple;
	bh=dpYFQGh9hAjPzFIaHuP0UnxFK9MeTkOELy5F/qotEPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHim2MdKTDt1ZmBcF7gywECfO7QHCpTtUhxqSKrsQD5z7BwMY35Uhi94+QX35oyXaflH/D2LgHLYxlA5YaQ/A6mQPe62b0QWbKetPAD4AXqa59ZUe2b7EUiK6IJz+CziEiu4iPuaabexz3z2dljh1tcuKLlvXWuks4Kj2wiuWk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQ9MBm2P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DFBFC3277B;
	Mon, 17 Jun 2024 08:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718614491;
	bh=dpYFQGh9hAjPzFIaHuP0UnxFK9MeTkOELy5F/qotEPM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JQ9MBm2PuAuavIDdYX9EowkK53h8tS4HKIRNib9/YF205yfFxT+yG8L2aWvYT2OQv
	 3wOuKPZI/XgBU5MKpphCHonrFi1LwAlS1XPKWSdv0wBcQb7NSo7JC8QjP/XX6aqEKQ
	 AkCcFQ1p8yzld0i/7LxkwSp4dPVD2hxllTlB1yBawX6rGAJcpzjhYRCH0ZDHoGBM21
	 S5WgHV+qurzqXUTBuCFbbABWvVq+WhCKOFzA7NNEFSncUO8PiZYOZ1pynRlznRK14m
	 nn8y8J/azP03/uqAbK33C4v9f2YRouqxjI4/saPPZXDM/Egw4rDH6OwTP2qtenb7Rq
	 Ur7RaVIBdnqew==
Message-ID: <f99e1b56-1870-49fb-ad6a-8d828548df02@kernel.org>
Date: Mon, 17 Jun 2024 10:54:48 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] rtc: atcrtc100: Add andes atcrtc100 RTC driver
To: CL Wang <cl634@andestech.com>, alexandre.belloni@bootlin.com,
 linux-rtc@vger.kernel.org
Cc: tim609@andestech.com
References: <20240617082507.3968910-1-cl634@andestech.com>
 <20240617082507.3968910-3-cl634@andestech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20240617082507.3968910-3-cl634@andestech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/06/2024 10:25, CL Wang wrote:
> The atcrtc100 module includes a real time counter with alarm.
> Add a RTC driver for this function.
> 
> Signed-off-by: CL Wang <cl634@andestech.com>


...

> +
> +static int atc_rtc_probe(struct platform_device *pdev)
> +{
> +	struct atc_rtc *atc_rtc;
> +	void __iomem *reg_base;
> +	int ret = 0;
> +
> +	atc_rtc = devm_kzalloc(&pdev->dev, sizeof(*atc_rtc), GFP_KERNEL);
> +	if (!atc_rtc)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, atc_rtc);
> +	spin_lock_init(&atc_rtc->lock);
> +
> +	reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(reg_base)) {
> +		dev_err(&pdev->dev, "couldn't map io space\n");
> +		return PTR_ERR(atc_rtc->regmap);
> +	}
> +
> +	atc_rtc->regmap = devm_regmap_init_mmio(&pdev->dev, reg_base,
> +						&atc_rtc_regmap_config);
> +	if (IS_ERR(atc_rtc->regmap)) {
> +		dev_err(&pdev->dev, "regmap init failed\n");
> +		ret = PTR_ERR(atc_rtc->regmap);
> +	}
> +
> +	ret = atc_rtc_hw_init(atc_rtc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "atc_rtc HW initialize failed\n");
> +		return ret;
> +	}
> +
> +	atc_rtc->alarm_irq = platform_get_irq(pdev, 1);
> +	if (atc_rtc->alarm_irq < 0) {
> +		dev_err(&pdev->dev, "failed to get irq %d for alarm\n",
> +			atc_rtc->alarm_irq);
> +	}
> +	atc_rtc->time_irq = platform_get_irq(pdev, 0);
> +	if (atc_rtc->time_irq < 0) {
> +		dev_err(&pdev->dev, "failed to get irq %d for RTC\n",
> +			atc_rtc->time_irq);
> +	}
> +
> +	ret = devm_request_irq(&pdev->dev, atc_rtc->alarm_irq, rtc_alarm,
> +			       0, "rtc alarm", atc_rtc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to request irq %d: %d for alarm\n",
> +			atc_rtc->alarm_irq, ret);
> +		return ret;
> +	}
> +
> +	ret = devm_request_irq(&pdev->dev, atc_rtc->time_irq, rtc_interrupt,
> +			       0, "rtc time", atc_rtc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to request irq %d: %d\n",
> +			atc_rtc->time_irq, ret);
> +		return ret;
> +	}
> +
> +	atc_rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(atc_rtc->rtc_dev)) {
> +		dev_err(&pdev->dev, "Could not allocate rtc device\n");
> +		return PTR_ERR(atc_rtc->rtc_dev);
> +	}
> +
> +	if (of_property_read_bool(pdev->dev.of_node, "wakeup-source")) {

Test your DTS (dtbs_check). This should fail.


> +		device_init_wakeup(&pdev->dev, true);
> +		ret = dev_pm_set_wake_irq(&pdev->dev, atc_rtc->alarm_irq);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to enable irq wake\n");
> +			device_init_wakeup(&pdev->dev, false);
> +			atc_alarm_wakeup_enable(&pdev->dev, false);
> +			clear_bit(RTC_FEATURE_ALARM, atc_rtc->rtc_dev->features);
> +		} else {
> +			atc_alarm_wakeup_enable(&pdev->dev, true);
> +			set_bit(RTC_FEATURE_ALARM, atc_rtc->rtc_dev->features);
> +		}
> +	} else {
> +		atc_alarm_wakeup_enable(&pdev->dev, false);
> +		clear_bit(RTC_FEATURE_ALARM, atc_rtc->rtc_dev->features);
> +	}
> +	atc_rtc->rtc_dev->ops = &rtc_ops;
> +	atc_rtc->rtc_dev->range_min = ATCRTC_RTC_TIMESTAMP_BEGIN_2000;
> +	atc_rtc->rtc_dev->range_max = ATCRTC_RTC_TIMESTAMP_END_2089;
> +
> +	return devm_rtc_register_device(atc_rtc->rtc_dev);
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int atc_rtc_resume(struct device *dev)
> +{
> +	struct atc_rtc *rtc = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(rtc->alarm_irq);
> +
> +	return 0;
> +}
> +
> +static int atc_rtc_suspend(struct device *dev)
> +{
> +	struct atc_rtc *rtc = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(rtc->alarm_irq);
> +
> +	return 0;
> +}
> +#endif
> +static SIMPLE_DEV_PM_OPS(atc_rtc_pm_ops, atc_rtc_suspend, atc_rtc_resume);
> +
> +static const struct of_device_id atc_rtc_dt_match[] = {
> +	{ .compatible = "andestech,atcrtc100" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, atc_rtc_dt_match);
> +
> +static struct platform_driver atc_rtc_platform_driver = {
> +	.driver		= {
> +		.name	= "atcrtc100",
> +		.of_match_table	= of_match_ptr(atc_rtc_dt_match),

Drop of_match_ptr(), leads to warnings.

> +		.pm = &atc_rtc_pm_ops,
> +	},
> +	.probe		= atc_rtc_probe,
> +};
> +
> +module_platform_driver(atc_rtc_platform_driver);
> +
> +MODULE_AUTHOR("CL Wang <cl634@andestech.com>");
> +MODULE_DESCRIPTION("Andes ATCRTC100 driver");
> +MODULE_LICENSE("GPL");

Best regards,
Krzysztof


