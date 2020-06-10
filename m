Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 502891F57A9
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jun 2020 17:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730131AbgFJPWI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Jun 2020 11:22:08 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:38813 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728424AbgFJPWI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Jun 2020 11:22:08 -0400
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 81AD5240007;
        Wed, 10 Jun 2020 15:22:04 +0000 (UTC)
Date:   Wed, 10 Jun 2020 17:22:04 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Kevin P. Fleming" <kevin+linux@km6g.us>
Cc:     devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] rtc: abx80x: Add support for autocalibration filter
 capacitor
Message-ID: <20200610152204.GX3720@piout.net>
References: <20200530124900.363399-1-kevin+linux@km6g.us>
 <20200530124900.363399-2-kevin+linux@km6g.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200530124900.363399-2-kevin+linux@km6g.us>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/05/2020 08:49:00-0400, Kevin P. Fleming wrote:
> All of the parts supported by this driver can make use of a
> small capacitor to improve the accuracy of the autocalibration
> process for their RC oscillators. If a capacitor is connected,
> a configuration register must be set to enable its use, so a
> new Device Tree property has been added for that purpose.
> 
> Signed-off-by: Kevin P. Fleming <kevin+linux@km6g.us>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> To: linux-rtc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
>  drivers/rtc/rtc-abx80x.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> index 3521d8e8dc38..be5a814e8c0b 100644
> --- a/drivers/rtc/rtc-abx80x.c
> +++ b/drivers/rtc/rtc-abx80x.c
> @@ -76,6 +76,9 @@
>  #define ABX8XX_CFG_KEY_OSC	0xa1
>  #define ABX8XX_CFG_KEY_MISC	0x9d
>  
> +#define ABX8XX_REG_AFCTRL	0x26
> +#define ABX8XX_AUTOCAL_FILTER_ENABLE	0xa0
> +
>  #define ABX8XX_REG_ID0		0x28
>  
>  #define ABX8XX_REG_OUT_CTRL	0x30
> @@ -130,6 +133,31 @@ static int abx80x_is_rc_mode(struct i2c_client *client)
>  	return (flags & ABX8XX_OSS_OMODE) ? 1 : 0;
>  }
>  
> +static int abx80x_enable_autocal_filter(struct i2c_client *client)
> +{
> +	int err;
> +
> +	/*
> +	 * Write the configuration key register to enable access to the AFCTRL
> +	 * register
> +	 */
> +	err = i2c_smbus_write_byte_data(client, ABX8XX_REG_CFG_KEY,
> +					ABX8XX_CFG_KEY_MISC);
> +	if (err < 0) {
> +		dev_err(&client->dev, "Unable to write configuration key\n");
> +		return -EIO;
> +	}

I'd like to avoid having more error messages in the driver (and whole
subsystem). Can you move the ABX8XX_REG_CFG_KEY setting earlier in
abx80x_probe so you don't have to do it here and avoid duplication the
error message?

This would also make the separate function superfluous.

> +
> +	err = i2c_smbus_write_byte_data(client, ABX8XX_REG_AFCTRL,
> +					ABX8XX_AUTOCAL_FILTER_ENABLE);
> +	if (err < 0) {
> +		dev_err(&client->dev, "Unable to write autocal filter register\n");
> +		return -EIO;

The RTC can still work if this fails and the rror is transient, maybe
just warn and continue. It will be set on the next probe.


> +	}
> +
> +	return 0;
> +}
> +
>  static int abx80x_enable_trickle_charger(struct i2c_client *client,
>  					 u8 trickle_cfg)
>  {
> @@ -825,6 +853,12 @@ static int abx80x_probe(struct i2c_client *client,
>  			return err;
>  	}
>  
> +	if (of_property_read_bool(np, "abracon,autocal_filter")) {
> +		err = abx80x_enable_autocal_filter(client);
> +		if (err)
> +			return err;
> +	}
> +
>  	if (client->irq > 0) {
>  		dev_info(&client->dev, "IRQ %d supplied\n", client->irq);
>  		err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> -- 
> 2.26.2
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
