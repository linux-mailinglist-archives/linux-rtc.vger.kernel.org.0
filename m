Return-Path: <linux-rtc+bounces-5420-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 038A8C6FBBF
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Nov 2025 16:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1D269368173
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Nov 2025 15:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938E62E8B8A;
	Wed, 19 Nov 2025 15:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxy1r19Q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD07E2D8390
	for <linux-rtc@vger.kernel.org>; Wed, 19 Nov 2025 15:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566649; cv=none; b=HoOBw3FdM23Zk7qMPt/Mt45AZKi04YutWdgmAVCkckTeiVhHFlwZCKyjJXvnQ2cMyeHxH9wTsrmAZidQk/ICjWbPEojIo6KQ/IjGIxD4LlgJvBt5hFuPrubTCS2MArQ1EK6lZOpxXLo7fbHCHmYugcA/kggcbX+vZV3CbYA2xIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566649; c=relaxed/simple;
	bh=JNsHnpqqoCu9TLMATnBtnxuYup7Rli8LSx7MEXVnfyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2By/hUWrIKn+ahGP5mjN0yVxIMV2r3v4lQr3coNzMru7O32frHBZS0611dcZkcLZNg61I2HdCPD6SsBjnhdmuFaU2P1p7shjlcsthAFDlow4Gh3fBQypbfVjiHTygbQvEQC9xFsxEQcuukwQkyQc8Rmu/MDfbJ2zJIG9NLw80A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxy1r19Q; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29845b06dd2so79108835ad.2
        for <linux-rtc@vger.kernel.org>; Wed, 19 Nov 2025 07:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763566646; x=1764171446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sxmUZsoOCJ6lHkKgggTpYT42aa6xpsfZ81OfTf3Cb4Y=;
        b=bxy1r19QGnA+osPEYdILR8CyW2VW+o1QBm2R/LG7UgHHe/5VWCKtSyBobYsTrHQK4q
         lmvK+h2QshpYiRUmJPkcKSTwA7kEXicIqFzbKs+9ubq7wyMFLj/2NNgJ6fFzyMPme8B/
         qkdnnyF/GWkfCDTu0IeJ6tqh9PZKSDUc90lhCbmjzm/qkqtAkifSCOBhxSUbGsROUZSI
         LubkW/PJXjUyiyZ2eFMLhmDBtywrAnSCvTsjhz5RosVTAmOBni+llWpy9DkwU+4AXwpb
         5lxaxSN/XIMU/VsBfNEI8v5UK5HMmOMliKzySxWl9TFB6V/VfSiu+MvwIW6oqpsMszB1
         zlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566646; x=1764171446;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxmUZsoOCJ6lHkKgggTpYT42aa6xpsfZ81OfTf3Cb4Y=;
        b=k+dnWZDtbaxv9u/ayFf1uG5ZrbOo/+3IFGI89ApTa7VJjbJ/jr/1Y8l4q3ooMWUf/F
         ncF/3p+Q5ktTzciZfSzujphxJBRfgR486UbQN4JjxMgmUSMitjIx1gForJWSGrbH64Su
         nGWLNScNVaX5LbrP3iwdMRxgsPVniRbsAKxbA9yYpfu2HgzbUyw4cvsIpbz0eh2wqepX
         G9oi54k52o+BHxKcmBTG/riKt5jdhkU3Jubb/oiSiu+IxRq2vw/jz/PmAFCTYOmPkTyi
         qQkzr/FMDRTZ5H5Y3QvIgQtHwRm8/YFRZOZtam+XQQKcPckxq2KtTrvLYgX45uDwyZyT
         6qUw==
X-Forwarded-Encrypted: i=1; AJvYcCUjLUckUJZIyChV7qM+bHQ044H4C+sw+HO64Xa2FlaYFElY2eUKohPEyFH9j1+s5P+V1GdALSGmytE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+vE9kHDayNhOTSg6GTIrCYLH4K6PSlU0uCXnr++PkVVakdhgG
	D9pkT5W4iW7iVabUmi2KgiED6U+dhbd6NMtUjVO/6zAXANAnejTcTaoV
X-Gm-Gg: ASbGncv5Rn7z7IaXuDLeuAENHbRfYGh7EFfc+n1wVVa8ZdDatXq7TxScGP/rDHpLbdM
	qT1onCKuwGoecZMKBT2iCy3hj97xX+nVytSMeOjzTf8rhl6ZpH1GOlBgkxG7/K5jm19HBfPw4n7
	qMMLcAR+Vtz23Q6ZRHgj45ppLQtxLchtoyfhCUjspKoVuPg369B/pQBUY3UB4M3fN41b7gc8rgR
	3/bMYM4xxzBa1TCwNc43PaFxGKbcmkE7nNbP5bTTgN1kP2jJg927tGanNRoi8BHiEUSMUQq5585
	5ERHt4Kbxor9ZioiYkoOrDrBVM/OKWRv626Cyw8ZNd6mvHYROsR8RxWOIh8qnhpguGSsGbucFJ0
	dI0yv3JD/YLAaypalapYFrGZi0+kiQsNL/2XT68t2RzjqK1LV06DnSh6HinK8cxrbpM0+pZo2Ha
	keQTKstce+SCAHr+l43RxippWfk9JgA51uVjsqHxQg2CL6cAgaliU/GFHBFw1wSUiQGTQ11RAiL
	bvy53h9BRiQqdrkaUU=
X-Google-Smtp-Source: AGHT+IHVXFdR7cHMhK0rOfUZUByORTk73+zezC6P5A0R5dzlzFk9qnN2xEZ09nwutx6vHEJoHpqMzw==
X-Received: by 2002:a17:903:120b:b0:295:613f:3d6a with SMTP id d9443c01a7336-2986a72ca49mr231540215ad.29.1763566645884;
        Wed, 19 Nov 2025 07:37:25 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bed39sm209572605ad.77.2025.11.19.07.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:37:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <06fbcdd3-4368-44e0-9a31-6cf83fa625d5@roeck-us.net>
Date: Wed, 19 Nov 2025 07:37:23 -0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] rtc: pcf85363: add watchdog support with
 configurable step size
To: Lakshay Piplani <lakshay.piplani@nxp.com>, alexandre.belloni@bootlin.com,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Cc: vikash.bansal@nxp.com, priyanka.jain@nxp.com,
 shashank.rebbapragada@nxp.com
References: <20251119083336.2241142-1-lakshay.piplani@nxp.com>
 <20251119083336.2241142-5-lakshay.piplani@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251119083336.2241142-5-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/25 00:33, Lakshay Piplani wrote:
> Add watchdog timer support to PCF85263/PCF85363 using the linux watchdog
> subsystem. The driver programs the hardware watchdog timeout based on
> the requested period.
> 
> Also use rtc_add_group() instead of sysfs_create_group() to register
> timestamp attributes under the RTC class device (/sys/class/rtc/rtcX).
> 
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> ---
> V2 -> V3:
> - Split into separate patches as suggested:
>    - Battery switch-over detection.
>    - Timestamp recording for TS pin and battery switch-over events.
>    - Offset calibration.
>    - Watchdog timer (to be reviewed by watchdog maintainers).
> - Dropped Alarm2 support
> - Switched to rtc_add_group() for sysfs attributes
> - Removed failure paths after RTC device registration as per subsystem guidelines.
> V1 -> V2:
> - Watchdog related changes due to removal of vendor specific properties
>    from device tree
>    * remove vendor DT knobs (enable/timeout/stepsize/repeat)
>    * use watchdog_init_timeout (with 10s default)
>    * derive clock_sel from final timeout
>    * default, repeat=true (repeat mode)
> - Fixed uninitalised warning on 'ret' (reported by kernel test robot)
> - Use dev_dbg instead of dev_info for debug related print messages
> - Minor cleanup and comments
> 
>   drivers/rtc/rtc-pcf85363.c | 168 +++++++++++++++++++++++++++++++++++--
>   1 file changed, 160 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
> index 3d733375187b..34d4c2e16774 100644
> --- a/drivers/rtc/rtc-pcf85363.c
> +++ b/drivers/rtc/rtc-pcf85363.c
> @@ -5,6 +5,10 @@
>    * Driver for NXP PCF85363 real-time clock.
>    *
>    * Copyright (C) 2017 Eric Nelson
> + *
> + * Copyright 2025 NXP
> + * Added support for timestamps, battery switch-over,
> + * watchdog, offset calibration.
>    */
>   #include <linux/module.h>
>   #include <linux/i2c.h>
> @@ -17,6 +21,8 @@
>   #include <linux/device.h>
>   #include <linux/of.h>
>   #include <linux/regmap.h>
> +#include <linux/rtc.h>
> +#include <linux/watchdog.h>
>   
>   /*
>    * Date/Time registers
> @@ -127,6 +133,18 @@
>   #define OFFSET_MAXIMUM  127
>   #define OFFSET_MASK     0xFF
>   
> +#define WD_MODE_REPEAT  BIT(7)
> +#define WD_TIMEOUT_MASK GENMASK(6, 2)
> +#define WD_TIMEOUT_SHIFT        2
> +#define WD_CLKSEL_MASK  GENMASK(1, 0)
> +#define WD_CLKSEL_0_25HZ        0x00
> +#define WD_CLKSEL_1HZ   0x01
> +#define WD_CLKSEL_4HZ   0x02
> +#define WD_CLKSEL_16HZ  0x03
> +
> +#define WD_TIMEOUT_MIN  1
> +#define WD_TIMEOUT_MAX  0x1F
> +
>   struct pcf85363 {
>   	struct rtc_device	*rtc;
>   	struct regmap		*regmap;
> @@ -138,6 +156,15 @@ struct pcf85x63_config {
>   	unsigned int num_nvram;
>   };
>   
> +struct pcf85363_watchdog {
> +	struct watchdog_device wdd;
> +	struct regmap *regmap;
> +	struct device *dev;
> +	u8 timeout_val;
> +	u8 clock_sel;
> +	bool repeat;
> +};
> +
>   static int pcf85363_load_capacitance(struct pcf85363 *pcf85363, struct device_node *node)
>   {
>   	u32 load = 7000;
> @@ -323,12 +350,13 @@ static irqreturn_t pcf85363_rtc_handle_irq(int irq, void *dev_id)
>   		return IRQ_NONE;
>   
>   	if (flags) {
> -		dev_dbg(&pcf85363->rtc->dev, "IRQ flags: 0x%02x%s%s%s%s%s\n",
> +		dev_dbg(&pcf85363->rtc->dev, "IRQ flags: 0x%02x%s%s%s%s%s%s\n",
>   			flags, (flags & FLAGS_A1F) ? " [A1F]" : "",
>   			(flags & FLAGS_TSR1F) ? " [TSR1F]" : "",
>   			(flags & FLAGS_TSR2F) ? " [TSR2F]" : "",
>   			(flags & FLAGS_TSR3F) ? " [TSR3F]" : "",
> -			(flags & FLAGS_BSF) ? " [BSF]" : "");
> +			(flags & FLAGS_BSF) ? " [BSF]" : "",
> +			(flags & FLAGS_WDF) ? " [WDF]" : "");
>   	}
>   
>   	if (flags & FLAGS_A1F) {
> @@ -360,6 +388,11 @@ static irqreturn_t pcf85363_rtc_handle_irq(int irq, void *dev_id)
>   		handled = true;
>   	}
>   
> +	if (flags & FLAGS_WDF) {
> +		regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_WDF, 0);
> +		handled = true;
> +	}
> +
>   	return handled ? IRQ_HANDLED : IRQ_NONE;
>   }
>   
> @@ -503,6 +536,123 @@ static const struct pcf85x63_config pcf_85363_config = {
>   	.num_nvram = 2
>   };
>   
> +/*
> + * This function sets the watchdog control register based on the timeout,
> + * clock selection and repeat mode settings. It prepares the value to
> + * write into the watchdog control register (CTRL_WDOG).
> + */
> +static int pcf85363_wdt_reload(struct pcf85363_watchdog *wd)
> +{
> +	u8 val;
> +
> +	val = (wd->repeat ? WD_MODE_REPEAT : 0) |
> +	       ((wd->timeout_val & WD_TIMEOUT_MAX) << WD_TIMEOUT_SHIFT) |
> +	       (wd->clock_sel & WD_CLKSEL_MASK);
> +
> +	return regmap_write(wd->regmap, CTRL_WDOG, val);
> +}
> +
> +static int pcf85363_wdt_start(struct watchdog_device *wdd)
> +{
> +	struct pcf85363_watchdog *wd = watchdog_get_drvdata(wdd);
> +
> +	return pcf85363_wdt_reload(wd);
> +}
> +
> +static int pcf85363_wdt_stop(struct watchdog_device *wdd)
> +{
> +	struct pcf85363_watchdog *wd = watchdog_get_drvdata(wdd);
> +
> +	return regmap_write(wd->regmap, CTRL_WDOG, 0);
> +}
> +
> +static int pcf85363_wdt_ping(struct watchdog_device *wdd)
> +{
> +	struct pcf85363_watchdog *wd = watchdog_get_drvdata(wdd);
> +
> +	regmap_update_bits(wd->regmap, CTRL_FLAGS, FLAGS_WDF, 0);
> +
> +	return pcf85363_wdt_reload(wd);
> +}
> +
> +static int pcf85363_wdt_set_timeout(struct watchdog_device *wdd,
> +				    unsigned int timeout)
> +{
> +	struct pcf85363_watchdog *wd = watchdog_get_drvdata(wdd);
> +
> +	wd->timeout_val = clamp(timeout, WD_TIMEOUT_MIN, WD_TIMEOUT_MAX);
> +	wdd->timeout = wd->timeout_val;
> +
> +	return pcf85363_wdt_reload(wd);
> +}
> +
> +static const struct watchdog_info pcf85363_wdt_info = {
> +	.identity = "PCF85363 Watchdog",
> +	.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
> +};
> +
> +static const struct watchdog_ops pcf85363_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = pcf85363_wdt_start,
> +	.stop = pcf85363_wdt_stop,
> +	.ping = pcf85363_wdt_ping,
> +	.set_timeout = pcf85363_wdt_set_timeout,
> +};
> +
> +static int pcf85363_watchdog_init(struct device *dev, struct regmap *regmap)
> +{
> +	struct pcf85363_watchdog *wd;
> +	unsigned int timeout_sec;
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_WATCHDOG))
> +		return 0;
> +
> +	wd = devm_kzalloc(dev, sizeof(*wd), GFP_KERNEL);
> +	if (!wd)
> +		return -ENOMEM;
> +
> +	wd->regmap = regmap;
> +	wd->dev = dev;
> +
> +	wd->wdd.info = &pcf85363_wdt_info;
> +	wd->wdd.ops = &pcf85363_wdt_ops;
> +	wd->wdd.min_timeout = WD_TIMEOUT_MIN;
> +	wd->wdd.max_timeout = WD_TIMEOUT_MAX;
> +	wd->wdd.parent = dev;
> +	wd->wdd.status = WATCHDOG_NOWAYOUT_INIT_STATUS;
> +
> +	ret = watchdog_init_timeout(&wd->wdd, 10, dev);

Calling watchdog_init_timeout() with a value other than 0 means that
a parameter from devicetree won't be accepted. Calling it with a fixed
value is usually pointless unless the value is out of the valid range,
which by itself would be pointless.

watchdog_init_timeout() is normally called to pass and validate a module
parameter or to pick a timeout from devicetree. Calling it with a constant
value other than 0 is unnecessary.

> +	if (ret)
> +		wd->wdd.timeout = clamp(10U, WD_TIMEOUT_MIN, WD_TIMEOUT_MAX);

So if 10 seconds is invalid, 10 is clamped to [1, 31] and applied directly.
That is an odd and complicated way of setting the timeout to 10 seconds.

If you don't want a timeout value from devicetree to be accepted, just make this

	wd->wdd.timeout = 10;

and do not call watchdog_init_timeout() in the first place.

> +
> +	timeout_sec = wd->wdd.timeout;
> +
> +	if (timeout_sec <= 2)
> +		wd->clock_sel = WD_CLKSEL_16HZ;
> +	else if (timeout_sec <= 8)
> +		wd->clock_sel = WD_CLKSEL_4HZ;
> +	else if (timeout_sec <= 16)
> +		wd->clock_sel = WD_CLKSEL_1HZ;
> +	else
> +		wd->clock_sel = WD_CLKSEL_0_25HZ;
> +

This seems an odd location for this code. What if the timeout changes
later on to one of the other values ?

Also, the timeout is set to a fixed value of 10. That means the above
can be simplified to
	wd->clock_sel = WD_CLKSEL_1HZ;
... and that in turn means that the variable is pointless, and that
WD_CLKSEL_1HZ could be used as constant instead.

Why all that complexity ? Am I missing something ? I am quite concerned that
I may be missing trees in the forest, meaning that the real problems are hiding
behind the noise.

Guenter

> +	wd->repeat = true;

What is the purpose of this variable ? It is always set to true.
You might as well drop it.

> +
> +	ret = regmap_update_bits(regmap, CTRL_FLAGS, FLAGS_WDF, 0);
> +	if (ret) {
> +		dev_err(dev, "failed to clear WDF:%d\n", ret);
> +		return ret;
> +	}
> +
> +	watchdog_set_drvdata(&wd->wdd, wd);
> +
> +	dev_dbg(dev, "pcf85363 watchdog registered (timeout=%us, clk_sel=%u)\n",
> +		timeout_sec, wd->clock_sel);
> +
> +	return devm_watchdog_register_device(dev, &wd->wdd);
> +}
> +
>   /*
>    * Reads 6 bytes of timestamp data starting at the given base register,
>    * converts them from BCD to binary, and formats the result into a
> @@ -684,20 +834,22 @@ static int pcf85363_probe(struct i2c_client *client)
>   			   PIN_IO_TSPM | PIN_IO_TSIM,
>   			   PIN_IO_TSPM | PIN_IO_TSIM);
>   
> +	ret = pcf85363_watchdog_init(dev, pcf85363->regmap);
> +	if (ret)
> +		dev_err_probe(dev, ret, "Watchdog init failed\n");
> +
>   	if (irq_a > 0 || wakeup_source)
>   		device_init_wakeup(dev, true);
>   
>   	dev_set_drvdata(&pcf85363->rtc->dev, pcf85363);
>   
> -	ret = devm_rtc_register_device(pcf85363->rtc);
> -
> +	ret = rtc_add_group(pcf85363->rtc, &pcf85363_attr_group);
>   	if (ret)
> -		return dev_err_probe(dev, ret, "RTC registration failed\n");
> -
> -	ret = sysfs_create_group(&pcf85363->rtc->dev.kobj, &pcf85363_attr_group);
> +		return ret;
>   
> +	ret = devm_rtc_register_device(pcf85363->rtc);
>   	if (ret)
> -		return dev_err_probe(dev, ret, "Timestamp sysfs creation failed\n");
> +		return dev_err_probe(dev, ret, "RTC registration failed\n");
>   
It is not entirely obvious how those changes are related to adding watchdog support
to this driver.

>   	for (i = 0; i < config->num_nvram; i++) {
>   		nvmem_cfg[i].priv = pcf85363;


