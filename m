Return-Path: <linux-rtc+bounces-2841-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F3CA00A9A
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Jan 2025 15:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4E401884404
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Jan 2025 14:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875391FA245;
	Fri,  3 Jan 2025 14:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="hlgEMVwi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-66.smtpout.orange.fr [80.12.242.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E751FA158;
	Fri,  3 Jan 2025 14:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735914911; cv=none; b=r9PytzyXHyJW8qYA4WjtZyKa9q6Lx/Bx9PeMacZIG82Cznle6a4St6iGH7jEdDvBnOOpiWUgDjI55nfzN4Igi7ezvgu3bG0dkiBMPj4dlnf2cyu198t7XDsZJ1Im2yut029OobKDVfo0MPZGRY+LT9spd6xye/r/LW/39e89N1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735914911; c=relaxed/simple;
	bh=NrPS5+FtamGuYn+uwcxvi9iSPS1POnP61oNR53NMXss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S4/rCLxx0WpW9GIuskv3Q57vOUTeHj2phk4gf1SUcDP9Ddt6bAY7OZFl0tmNJ+Mvuy9momLFys5NBKnKAQV1bW4uLY7AFteKzh0Zx7BgJcb+CkcxO0aTxG8JnD3oZloUT2/gPCmn6SkdxIxSjvbozXtRhzF1eqYDANEQS4hYmCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=hlgEMVwi; arc=none smtp.client-ip=80.12.242.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id TicetCWUzPdSSTichtMCAh; Fri, 03 Jan 2025 15:26:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735914361;
	bh=tZtU8maB6BLfc0Bn8pHnrr8nYDshAGCv9k1LjGqaMHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=hlgEMVwi2xgraaR7k16n3u8aCir2DY5XjzOuAyTysEnvGLfa7Jjidf/NoYST84HL8
	 h3KNIGl7yM0u30LfZnHYbD2zv+vPKp5RC2QPTQS8tmFWoTtjypf3Ebp+82i+gJHRQK
	 qsxMwNPaTtaknl0MVYOYG/VpX6l9WXlUHN201eXe+RoDI8LTQnnS7KC9WsnVrPI7Nq
	 jhB1xSO8nzHllj5+hyKiKv8olLedn8eemMB3JCIO5mktPBcGdaVVZnZgdZSVfJ5J7l
	 W1CjZiVJtmQG2xoSrDhp+VcgZpyUz1JYb4KjwD1mw+im01O4prlFA5lsbK81lWjd21
	 itJeQZ3sCWNog==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 03 Jan 2025 15:26:01 +0100
X-ME-IP: 90.11.132.44
Message-ID: <c13ed6b7-fd44-45ce-9429-30ff1f1f15a2@wanadoo.fr>
Date: Fri, 3 Jan 2025 15:25:56 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] rtc:max31335: Add driver support for max31331
To: pavithra.u@analog.com, Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20250103-add_support_max31331_fix-v1-0-8ff3c7a81734@analog.com>
 <20250103-add_support_max31331_fix-v1-2-8ff3c7a81734@analog.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250103-add_support_max31331_fix-v1-2-8ff3c7a81734@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 03/01/2025 à 08:04, PavithraUdayakumar-adi via B4 Relay a écrit :
> From: PavithraUdayakumar-adi <pavithra.u@analog.com>
> 
> Add driver support for max31331 RTC chip.
> 
> Signed-off-by: PavithraUdayakumar-adi <pavithra.u@analog.com>
> ---
>   drivers/rtc/rtc-max31335.c | 182 ++++++++++++++++++++++++++++++++-------------
>   1 file changed, 131 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-max31335.c b/drivers/rtc/rtc-max31335.c
> index 3fbcf5f6b92ffd4581e9c4dbc87ec848867522dc..f2c094686b5a89aee8041f3f563bb2cf9fc6275b 100644
> --- a/drivers/rtc/rtc-max31335.c
> +++ b/drivers/rtc/rtc-max31335.c
> @@ -34,7 +34,7 @@
>   #define MAX31335_RTC_CONFIG2			0x06
>   #define MAX31335_TIMESTAMP_CONFIG		0x07
>   #define MAX31335_TIMER_CONFIG			0x08
> -#define MAX31335_SECONDS_1_128			0x09
> +#define MAX31335_SECONDS_1_128		0x09

No need to remove 1 tab here.
Things now look un'aligned.

>   #define MAX31335_SECONDS			0x0A
>   #define MAX31335_MINUTES			0x0B
>   #define MAX31335_HOURS				0x0C
> @@ -45,7 +45,7 @@
>   #define MAX31335_ALM1_SEC			0x11
>   #define MAX31335_ALM1_MIN			0x12
>   #define MAX31335_ALM1_HRS			0x13
> -#define MAX31335_ALM1_DAY_DATE			0x14
> +#define MAX31335_ALM1_DAY_DATE		0x14

No need to remove 1 tab here.
Things now look un'aligned.

>   #define MAX31335_ALM1_MON			0x15
>   #define MAX31335_ALM1_YEAR			0x16
>   #define MAX31335_ALM2_MIN			0x17

...

>   static bool max31335_volatile_reg(struct device *dev, unsigned int reg)
>   {
> +	struct max31335_data *max31335 = dev_get_drvdata(dev);
> +	const struct chip_desc *chip = max31335->chip;
> +
>   	/* time keeping registers */
> -	if (reg >= MAX31335_SECONDS &&
> -	    reg < MAX31335_SECONDS + MAX31335_TIME_SIZE)
> +	if (reg >= chip->sec_reg && reg < chip->sec_reg + MAX31335_TIME_SIZE)
>   		return true;
>   
>   	/* interrupt status register */
> -	if (reg == MAX31335_STATUS1)
> +	if (reg == chip->int_status_reg)
>   		return true;
>   
> -	/* temperature registers */
> -	if (reg == MAX31335_TEMP_DATA_MSB || reg == MAX31335_TEMP_DATA_LSB)
> +	/* temperature registers if valid*/

Missing space before */

> +	if (chip->temp_reg && (reg == chip->temp_reg || reg == chip->temp_reg + 1))
>   		return true;
>   
>   	return false;

...

> @@ -444,28 +511,31 @@ static int max31335_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
>   	struct max31335_data *max31335 = clk_hw_to_max31335(hw);
>   	unsigned int freq_mask;
>   	int index;
> +	int ret;
>   
>   	index = find_closest(rate, max31335_clkout_freq,
>   			     ARRAY_SIZE(max31335_clkout_freq));
>   	freq_mask = __roundup_pow_of_two(ARRAY_SIZE(max31335_clkout_freq)) - 1;
>   
> -	return regmap_update_bits(max31335->regmap, MAX31335_RTC_CONFIG2,
> -				  freq_mask, index);
> +	ret = regmap_update_bits(max31335->regmap, max31335->chip->clkout_reg,
> +				 freq_mask, index);
> +
> +	return ret;

You could keep a direct return here, instead of using a new 'ret'.

>   }
>   
>   static int max31335_clkout_enable(struct clk_hw *hw)
>   {
>   	struct max31335_data *max31335 = clk_hw_to_max31335(hw);
>   
> -	return regmap_set_bits(max31335->regmap, MAX31335_RTC_CONFIG2,
> -			       MAX31335_RTC_CONFIG2_ENCLKO);
> +	return regmap_set_bits(max31335->regmap, max31335->chip->clkout_reg,
> +			      MAX31335_RTC_CONFIG2_ENCLKO);

...

> @@ -576,9 +646,10 @@ static int max31335_clkout_register(struct device *dev)
>   	struct max31335_data *max31335 = dev_get_drvdata(dev);
>   	int ret;
>   
> -	if (!device_property_present(dev, "#clock-cells"))
> -		return regmap_clear_bits(max31335->regmap, MAX31335_RTC_CONFIG2,
> -					 MAX31335_RTC_CONFIG2_ENCLKO);
> +	if (!device_property_present(dev, "#clock-cells")) {
> +		regmap_clear_bits(max31335->regmap, max31335->chip->clkout_reg,
> +				  MAX31335_RTC_CONFIG2_ENCLKO);
> +	}

No need to add new { }.

Is it safe to change the behavior here?

If it is a fix, waybe it should be done in another patch before this one.

>   
>   	max31335->clkout.init = &max31335_clk_init;
>   
> @@ -599,12 +670,14 @@ static int max31335_clkout_register(struct device *dev)
>   	return 0;
>   }
>   
> +/* 6.1 probe() function still uses the second struct i2c_device_id argument */

Is this comment really needed?
Is this patch expected to be backported in 6.1?

>   static int max31335_probe(struct i2c_client *client)
>   {
>   	struct max31335_data *max31335;
>   #if IS_REACHABLE(HWMON)
>   	struct device *hwmon;
>   #endif

...

> @@ -648,19 +727,17 @@ static int max31335_probe(struct i2c_client *client)
>   	max31335_nvmem_cfg.priv = max31335;
>   	ret = devm_rtc_nvmem_register(max31335->rtc, &max31335_nvmem_cfg);
>   	if (ret)
> -		return dev_err_probe(&client->dev, ret,
> -				     "cannot register rtc nvmem\n");
> +		return dev_err_probe(&client->dev, ret, "cannot register rtc nvmem\n");

Unneeded clean-up.

>   
>   #if IS_REACHABLE(HWMON)
> -	hwmon = devm_hwmon_device_register_with_info(&client->dev, client->name,
> -						     max31335,
> -						     &max31335_chip_info,
> -						     NULL);
> -	if (IS_ERR(hwmon))
> -		return dev_err_probe(&client->dev, PTR_ERR(hwmon),
> -				     "cannot register hwmon device\n");
> +	if (max31335->chip->temp_reg) {
> +		hwmon = devm_hwmon_device_register_with_info(&client->dev, client->name, max31335,
> +							     &max31335_chip_info, NULL);
> +		if (IS_ERR(hwmon))
> +			return dev_err_probe(&client->dev, PTR_ERR(hwmon),
> +					     "cannot register hwmon device\n");
> +	}
>   #endif
> -
>   	ret = max31335_trickle_charger_setup(&client->dev, max31335);
>   	if (ret)
>   		return ret;
> @@ -669,15 +746,17 @@ static int max31335_probe(struct i2c_client *client)
>   }
>   
>   static const struct i2c_device_id max31335_id[] = {
> -	{ "max31335" },
> -	{ }
> +	{ "max31331", (kernel_ulong_t)&chip[ID_MAX31331] },
> +	{ "max31335", (kernel_ulong_t)&chip[ID_MAX31335] },
> +	{}

No need to remove 1 space here.

>   };
>   
>   MODULE_DEVICE_TABLE(i2c, max31335_id);
>   
>   static const struct of_device_id max31335_of_match[] = {
> -	{ .compatible = "adi,max31335" },
> -	{ }
> +	{ .compatible = "adi,max31331", .data = &chip[ID_MAX31331] },
> +	{ .compatible = "adi,max31335", .data = &chip[ID_MAX31335] },
> +	{}

No need to remove 1 space here.

>   };
>   
>   MODULE_DEVICE_TABLE(of, max31335_of_match);

...

CJ

