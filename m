Return-Path: <linux-rtc+bounces-1736-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 567B095EBF3
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 10:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE9DE2810BA
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 08:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A37F149C4D;
	Mon, 26 Aug 2024 08:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pg4Ddqro"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3D9143734;
	Mon, 26 Aug 2024 08:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724660834; cv=none; b=utn0pwXQxoXbI8loAgClRy8EvTjDzesOgafgzDBTl4XjFxMlPDvPHK23GH89dMwlmeyZtpsmBxG5QKVJL0BDLsduR3VfmzLcgotzC8QuxX75mKeNwL0cXqDfw9dpD1NBwSjmFlemkm1lUuHUEeyG7OTxcuMOS2tB8UfmhR6m9x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724660834; c=relaxed/simple;
	bh=tcMAmQDb7ndwt5Ze9qrn//GNs1+TA1IzP5Fi7o/acSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZoZLfSPa8QQdC5RsLANUmHJOcXVNZge5i3/sOFlFubJY0JtaffrXbiSEJOvoTauNHPwzSitUMbjk1zlEWxtYSOAvV5nn5vc20bGa/DGdP7WXmwBWRuuV5aKNXbxL8GO9uNEVJp29MczamJN1ofJb/vJvGnpDZBHJQIhCWS/dCvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pg4Ddqro; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9097AC8CDC1;
	Mon, 26 Aug 2024 08:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724660833;
	bh=tcMAmQDb7ndwt5Ze9qrn//GNs1+TA1IzP5Fi7o/acSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pg4Ddqro7wOYMBTjrSUdaZBYjVG8bT83quhBG4vOzLSOSKxyPwbXNU6RNJoaJBxEa
	 LUDsxSo/T7w5BrKQ9Ak3ypn1X3MFpOB8FWqbdkaUAQ5g58RpNKuDidg8ZXcAu+e2Yf
	 mXuY5RY1n5GBVxBYO7owhheJ9QBx7iUn98wRc06mtPqAijSmARpqy4sOAvic8Lvrb0
	 UlBM8KZLaRHf/sYoisaDxhxN30QrfkcgJBz6/vRAVNRlUS934ebo4/yv8Ijlhg8BMx
	 Clb0c9bkKqW4Lx2wnZ4LpM3cqELzUNQyNF7uSL3hgPZ2SeFLO7TJ8CNRcBD6e9/69f
	 a8P2eym9ttGWQ==
Message-ID: <dcc28bf5-0b3e-4133-80c4-e677ecb38388@kernel.org>
Date: Mon, 26 Aug 2024 10:27:06 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rtc: support for the Amlogic on-chip RTC
To: xianwei.zhao@amlogic.com, Yiting Deng <yiting.deng@amlogic.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
 <20240823-rtc-v1-2-6f70381da283@amlogic.com>
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
In-Reply-To: <20240823-rtc-v1-2-6f70381da283@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/08/2024 11:19, Xianwei Zhao via B4 Relay wrote:
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
>  3 files changed, 602 insertions(+)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 2a95b05982ad..0dd042701c3b 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -2043,4 +2043,16 @@ config RTC_DRV_SSD202D
>  	  This driver can also be built as a module, if so, the module
>  	  will be called "rtc-ssd20xd".
>  
> +config RTC_DRV_AMLOGIC
> +	tristate "Amlogic RTC"
> +	depends on ARCH_MESON || COMPILE_TEST

So the third driver? What is wrong with existing ones? And why this one
is named so differently?

> +	select REGMAP_MMIO
> +	default y
> +	help
> +	  If you say yes here you get support for the RTC block on the
> +	  Amlogic A113L2(A4) and A113X2(A5) SoCs.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called "rtc-amlogic".
> +
>  endif # RTC_CLASS
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 3004e372f25f..d4a56ddb4246 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -26,6 +26,7 @@ obj-$(CONFIG_RTC_DRV_ABB5ZES3)	+= rtc-ab-b5ze-s3.o
>  obj-$(CONFIG_RTC_DRV_ABEOZ9)	+= rtc-ab-eoz9.o
>  obj-$(CONFIG_RTC_DRV_ABX80X)	+= rtc-abx80x.o
>  obj-$(CONFIG_RTC_DRV_AC100)	+= rtc-ac100.o
> +obj-$(CONFIG_RTC_DRV_AMLOGIC)	+= rtc-amlogic.o
>  obj-$(CONFIG_RTC_DRV_ARMADA38X)	+= rtc-armada38x.o
>  obj-$(CONFIG_RTC_DRV_AS3722)	+= rtc-as3722.o
>  obj-$(CONFIG_RTC_DRV_ASM9260)	+= rtc-asm9260.o


> +
> +static int aml_rtc_adjust_sec(struct device *dev, u32 match_counter,
> +			      int ops, int enable)
> +{
> +	struct aml_rtc_data *rtc = dev_get_drvdata(dev->parent);
> +	u32 reg_val;
> +
> +	if (!FIELD_FIT(RTC_MATCH_COUNTER, match_counter)) {
> +		pr_err("%s: invalid match_counter\n", __func__);

No, do not use pr_, but driver ones.


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

Messed kerneldoc. You have warning shere. Fix it.

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

Where is the ABI documented?

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

Document the ABI.

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

Again incorrect kerneldoc.

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
> +		usleep_range(100, 200);
> +	}
> +	regmap_write_bits(rtc->map, RTC_INT_MASK,
> +			  RTC_ALRM0_IRQ_MSK, RTC_ALRM0_IRQ_MSK);
> +	regmap_write_bits(rtc->map, RTC_CTRL, RTC_ALRM0_EN, 0);
> +}
> +
> +static int aml_rtc_probe(struct platform_device *pdev)
> +{
> +	struct aml_rtc_data *rtc;
> +	void __iomem *base;
> +	struct clk *core_clk;
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
> +	if (IS_ERR(base)) {
> +		dev_err(&pdev->dev, "resource ioremap failed\n");
> +		return PTR_ERR(base);
> +	}
> +
> +	rtc->map = devm_regmap_init_mmio(&pdev->dev, base, &aml_rtc_regmap_config);
> +	if (IS_ERR(rtc->map)) {
> +		dev_err(&pdev->dev, "regmap init failed\n");
> +		return PTR_ERR(rtc->map);
> +	}
> +
> +	rtc->irq = platform_get_irq(pdev, 0);
> +	if (rtc->irq < 0)
> +		return rtc->irq;
> +
> +	rtc->sclk = devm_clk_get(&pdev->dev, "rtc_osc");

Clock name should be: "osc"

> +	if (IS_ERR(rtc->sclk))
> +		return PTR_ERR(rtc->sclk);
> +	if (clk_get_rate(rtc->sclk) != OSC_32K && clk_get_rate(rtc->sclk) != OSC_24M) {
> +		dev_err(&pdev->dev, "Invalid clock configuration\n");
> +		return -EINVAL;
> +	}
> +
> +	core_clk = devm_clk_get(&pdev->dev, "rtc_sys_clk");

Clock name: "sys"

> +	if (IS_ERR(core_clk)) {
> +		dev_err(&pdev->dev, "failed to get rtc sys clk\n");

Syntax is return dev_err_probe.

> +		return PTR_ERR(core_clk);
> +	}
> +	clk_prepare_enable(core_clk);
> +
> +	aml_rtc_init(&pdev->dev, rtc);
> +
> +	device_init_wakeup(&pdev->dev, 1);
> +	platform_set_drvdata(pdev, rtc);
> +
> +	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(rtc->rtc_dev))
> +		return PTR_ERR(rtc->rtc_dev);
> +
> +	ret = devm_request_irq(&pdev->dev, rtc->irq, aml_rtc_handler,
> +			       IRQF_ONESHOT, "aml-rtc alarm", rtc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "IRQ%d request failed, ret = %d\n",
> +			rtc->irq, ret);

Your code is buggy. You leave with prepared clock.

Use devm_clk_get_enabled where applicable.

> +		return ret;
> +	}
> +
> +	rtc->rtc_dev->ops = &aml_rtc_ops;
> +	rtc->rtc_dev->range_min = 0;
> +	rtc->rtc_dev->range_max = U32_MAX;
> +
> +	ret = rtc_add_group(rtc->rtc_dev, &aml_rtc_sysfs_files);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to create sysfs group: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return devm_rtc_register_device(rtc->rtc_dev);
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
> +

Where is the remove to cleanup?

> +static SIMPLE_DEV_PM_OPS(aml_rtc_pm_ops,
> +			 aml_rtc_suspend, aml_rtc_resume);
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
> +	.driver = {
> +		.name = "aml-rtc",
> +		.of_match_table = of_match_ptr(aml_rtc_device_id),

Drop of_match_ptr. You have a warning here.

> +		.pm = &aml_rtc_pm_ops,
> +	},
Best regards,
Krzysztof


