Return-Path: <linux-rtc+bounces-2509-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FFF9C44EF
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 19:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D07C282EBD
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 18:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC40D1A9B33;
	Mon, 11 Nov 2024 18:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="IEQp9E1O"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754CF1AA1E6;
	Mon, 11 Nov 2024 18:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731349635; cv=none; b=FTARXYhPIkxJyurSasUb430j0ltHZLtx9cO6wZedHLrBBi32OXuMEbUiHR7PlwV7BKJhq4/TiqJsYr0NXFyJ69GvzoQKfzG//L4aelmdeUXAeptXcxHLwCEInqeZUQ3akJQJOX5bstkUsE6z8OWBhYLxvJiTR5nWv4jWCo1D9HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731349635; c=relaxed/simple;
	bh=H98voKyvWfmFH5FHDNg2+2JwkogOHgxkhhXiO/Lf8BU=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:Cc:To:
	 In-Reply-To:Content-Type; b=LuWCfQzPQPbLb7EP6m5/1wjiYaOThIW149JZYYMdcsZLEQyQ+lkyFOU1MQ7F1diMsaCqBbZzDZn039wRJMUmnVi1+JB84OA+EwR8T9k6xqSSjuScpB3M3oS7wWLFjRWtex1uPqr/bi5cP8Odd3jztjosygFicNf5FCfaRnaTqKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=IEQp9E1O; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id AZ81tY9XfYmvZAZ81tRILo; Mon, 11 Nov 2024 19:27:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731349630;
	bh=6iSNGJIj/L5H1tDzc7I6XRTBhhNW/UI47rF6bdVasZw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=IEQp9E1OoraT/XXDkJ2xjg1yMoktRcZCUkI5vVAGyWVfR4GuyRP02FWtnd8HdYsP1
	 sBNmW1yT1PhkEw23gynO6IL5UlUrrFHrwC4ZzJTKgG/ya8uQJuS35A9uOFYztr4NDa
	 wytQ1iL+dnWKuHcW+xJAErMpFbnqzI4J3agA1ggXbggbg2n3MS+Uxh0aOTHfMRVDUf
	 7VMxIgT7YEU9XPK22Aa2467xw6xK7QDCfN2OtV1w9IFGQngI6P9CWwmWitZ4ovqRqJ
	 0/8kPnL7B0eFRTMPBYAdWjxf6K9BSm+IbHA6jYJCQmRvNcX+VD6h/4dUcwsGmTeakU
	 1TCaeim7tBPkg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 11 Nov 2024 19:27:10 +0100
X-ME-IP: 90.11.132.44
Message-ID: <1a27d9d1-4d18-4495-af15-b48be1f13139@wanadoo.fr>
Date: Mon, 11 Nov 2024 19:27:06 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] rtc: pcf2127: Add 'nxp,battery-switchover' DT
 property to enable battery switch-over
References: <20241111154144.163604-1-p.rosenberger@kunbus.com>
 <20241111154144.163604-3-p.rosenberger@kunbus.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Lino Sanfilippo <l.sanfilippo@kunbus.com>,
 =?UTF-8?Q?Thomas_B=C3=B6hler?= <t.boehler@kunbus.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Philipp Rosenberger <p.rosenberger@kunbus.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To: Philipp Rosenberger <p.rosenberger@kunbus.com>
In-Reply-To: <20241111154144.163604-3-p.rosenberger@kunbus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 11/11/2024 à 16:41, Philipp Rosenberger a écrit :
> The PCF2127, PCF2129, and PCA2129 RTCs have the battery switch-over function
> enabled by default. However, the newer PCF2131 RTC has the opposite default
> behavior, requiring explicit enablement for battery backup.
> 
> Add support for the `nxp,battery-backed` device tree property to enable battery
> switch-over in standard mode for the rtc-pcf2127 driver. If this property is set
> and no battery switch-over mode is already configured, the driver will enable
> standard mode; otherwise, existing configurations remain unchanged.
> 
> Signed-off-by: Philipp Rosenberger <p.rosenberger-pnUOlEj4XnTQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/rtc/rtc-pcf2127.c | 76 +++++++++++++++++++++++++++++++--------
>   1 file changed, 61 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 9c04c4e1a49c..c80e31fec134 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -48,6 +48,7 @@
>   #define PCF2127_BIT_CTRL3_BLF			BIT(2)
>   #define PCF2127_BIT_CTRL3_BF			BIT(3)
>   #define PCF2127_BIT_CTRL3_BTSE			BIT(4)
> +#define PCF2127_BIT_CTRL3_PWRMNG_MASK		(BIT(5) | BIT(6) | BIT(7))

GENMASK(7, 5)?

>   /* Time and date registers */
>   #define PCF2127_REG_TIME_BASE		0x03
>   #define PCF2127_BIT_SC_OSF			BIT(7)
> @@ -529,6 +530,64 @@ static int pcf2127_watchdog_init(struct device *dev, struct pcf2127 *pcf2127)
>   	return devm_watchdog_register_device(dev, &pcf2127->wdd);
>   }
>   
> +static int pcf2127_battery_init(struct device *dev, struct pcf2127 *pcf2127)
> +{
> +	unsigned int ctrl3;
> +	unsigned int pwrmng;
> +	int ret;
> +
> +	/*
> +	 * Disable battery low/switch-over timestamp and interrupts.
> +	 * Clear battery interrupt flags which can block new trigger events.
> +	 * Note: This is the default chip behaviour but added to ensure
> +	 * correct tamper timestamp and interrupt function.
> +	 */
> +	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
> +				 PCF2127_BIT_CTRL3_BTSE |
> +				 PCF2127_BIT_CTRL3_BIE |
> +				 PCF2127_BIT_CTRL3_BLIE, 0);
> +	if (ret) {
> +		dev_err(dev, "%s: interrupt config (ctrl3) failed\n",
> +			__func__);

dev_err_probe() could be used.

> +		return ret;
> +	}
> +
> +	if (!device_property_read_bool(dev, "nxp,battery-backed"))
> +		return 0;
> +
> +	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &ctrl3);
> +	if (ret) {
> +		dev_err(dev, "%s: read ctrl3 faild\n", __func__);

s/faild/failed/

dev_err_probe() could be used.

> +		return ret;
> +	}

...

CJ


