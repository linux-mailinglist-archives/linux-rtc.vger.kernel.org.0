Return-Path: <linux-rtc+bounces-188-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0F87DF816
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Nov 2023 17:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5615C281BAD
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Nov 2023 16:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314861DA52;
	Thu,  2 Nov 2023 16:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YS1ZbF5v"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D1F1DA29;
	Thu,  2 Nov 2023 16:57:24 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B59FE181;
	Thu,  2 Nov 2023 09:57:16 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6356B40004;
	Thu,  2 Nov 2023 16:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698944235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NVz3G4wL1rSrk0NYhI8ac9/fbtgh/W+2BcN82pui1bE=;
	b=YS1ZbF5vPsUZVEV1gWd7BpaTy6XlyFUooET0lTUZk7BfYXMwO8LXKymhq1jnx1qLePrYXv
	k18yCMxjUwyGi+jApbW4A2AzaOZq7khKIOfIRW5S1Tqr9UEHycwe+r50v4/3CsuCro/K64
	lL4CeDsH9Sw3nQZphTqfBf/rLgJnFAQIkINRDnyY5NnUkS5x3nUiMOIc7+BLwfE6pt3H41
	SZunbBcy6SXiY9RCxwtx+6+8gQ8wYvl6TqSN3y318g0tocXPZz05apbwa2lX0Hbx+k/R7U
	iwqO4RDpVYJNbvT1/hRFLUNha1Q9wcqDlr0pWsKAlPC0yVmpSaeJJwn9KOrheQ==
Date: Thu, 2 Nov 2023 17:57:13 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Miclaus, Antoniu" <Antoniu.Miclaus@analog.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] rtc: max31335: add driver support
Message-ID: <20231102165713296ca50b@mail.local>
References: <20231101094835.51031-1-antoniu.miclaus@analog.com>
 <20231101094835.51031-2-antoniu.miclaus@analog.com>
 <202311012223422e3387b3@mail.local>
 <CY4PR03MB3399BAAA3A3F6FC4B9A7A9FB9BA6A@CY4PR03MB3399.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CY4PR03MB3399BAAA3A3F6FC4B9A7A9FB9BA6A@CY4PR03MB3399.namprd03.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 02/11/2023 13:44:16+0000, Miclaus, Antoniu wrote:
>  
> > On 01/11/2023 11:48:14+0200, Antoniu Miclaus wrote:
> > > +static int max31335_get_hour(u8 hour_reg)
> > > +{
> > > +	int hour;
> > > +
> > > +	/* 24Hr mode */
> > > +	if (!FIELD_GET(MAX31335_HOURS_F_24_12, hour_reg))
> > > +		return bcd2bin(hour_reg & 0x3f);
> > > +
> > > +	/* 12Hr mode */
> > > +	hour = bcd2bin(hour_reg & 0x1f);
> > > +	if (hour == 12)
> > > +		hour = 0;
> > > +
> > 
> > Do you really need to support 12h mode?
> 
> Is is a feature supported by the part, so I think is nice to have.
> 

Is anything on the system going to use it? This driver is not setting
12h time so if there is no other component in the system accessing the
time, there is no chance this is going to be used. Dead code is not nice
to maintain.

> > 
> > > +	if (FIELD_GET(MAX31335_HOURS_HR_20_AM_PM, hour_reg))
> > > +		hour += 12;
> > > +
> > > +	return hour;
> > > +}
> > > +
> > > +static int max31335_read_offset(struct device *dev, long *offset)
> > > +{
> > > +	struct max31335_data *max31335 = dev_get_drvdata(dev);
> > > +	u32 value;
> > > +	int ret;
> > > +
> > > +	ret = regmap_read(max31335->regmap, MAX31335_AGING_OFFSET,
> > &value);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	*offset = value;
> > 
> > This is super dubious, what is the unit of MAX31335_AGING_OFFSET ?
> > 
> 
> There is not additional information on the AGING_OFFSET register (no
> other offset registers).
> I treated it as a raw value that user can write/read. Should I drop the 
> offset implementation?
> 

The value exposed to userspace is in parts per billion. If you can't do
the conversion, then you have to drop it.

> > > +
> > > +		return 0;
> > > +	}
> > > +
> > > +	if (diode)
> > > +		i = i + 4;
> > > +	else
> > > +		i = i + 1;
> > 
> > Do you actually need to configure the trickle charger when there is
> > nothing to charge?
> 
> These are the options for the trickle chager:
> MAX31335_TRICKLE_REG_TRICKLE bits
> 
> 0x0: 3KΩ in series with a Schottky diode
> 0x1: 3KΩ in series with a Schottky diode
> 0x2: 6KΩ in series with a Schottky diode 
> 0x3: 11KΩ in series with a Schottky diode
> 0x4: 3KΩ in series with a diode+Schottky diode
> 0x5: 3KΩ in series with a diode+Schottky diode
> 0x6: 6KΩ in series with a diode+Schottky diode
> 0x7: 11KΩ in series with a diode+Schottky diode
> 

Then you need a property to select with diodes you are going to use. The
ABX80X supports something similar.

> > 
> > > +
> > > +	return regmap_write(max31335->regmap, MAX31335_TRICKLE_REG,
> > > +			    FIELD_PREP(MAX31335_TRICKLE_REG_TRICKLE, i) |
> > > +				       MAX31335_TRICKLE_REG_EN_TRICKLE);
> > > +}
> > > +
> > > +static int max31335_clkout_register(struct device *dev)
> > > +{
> > > +	struct max31335_data *max31335 = dev_get_drvdata(dev);
> > > +	int ret;
> > > +
> > > +	if (!device_property_present(dev, "#clock-cells"))
> > > +		return 0;
> > 
> > Is the clock output disabled by default?
> 
> No, I will disable it.

The CCF is responsible to disable the clock, else you will have a glitch
in the clock at boot time which will break use cases. But for this to
work, you will have to always register the clock.

> 
> > 
> > > +
> > > +static int max31335_probe(struct i2c_client *client)
> > > +{
> > > +	struct max31335_data *max31335;
> > > +	struct device *hwmon;
> > > +	int ret;
> > > +
> > > +	max31335 = devm_kzalloc(&client->dev, sizeof(*max31335),
> > GFP_KERNEL);
> > > +	if (!max31335)
> > > +		return -ENOMEM;
> > > +
> > > +	max31335->regmap = devm_regmap_init_i2c(client,
> > &regmap_config);
> > > +	if (IS_ERR(max31335->regmap))
> > > +		return PTR_ERR(max31335->regmap);
> > > +
> > > +	i2c_set_clientdata(client, max31335);
> > > +
> > > +	ret = regmap_write(max31335->regmap, MAX31335_RTC_RESET, 1);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = regmap_write(max31335->regmap, MAX31335_RTC_RESET, 0);
> > > +	if (ret)
> > > +		return ret;
> > 
> > What does this register do?
> > 
> 
> RTC Software Reset Register: 
> 0x0: Device is in normal mode.
> 0x1: Resets the digital block and the I2C programmable registers except for
> Timestamp/RAM registers and the SWRST bit. Oscillator is disabled.
> 
> The bit doesn't clear itself.
> 

Then you definitively don't want to do this, this will invalidate time
and date as the oscillator is disabled and this renders the RTC useless.
The whole point of the RTC is that it survives the reboot or shutdown of
the system.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

