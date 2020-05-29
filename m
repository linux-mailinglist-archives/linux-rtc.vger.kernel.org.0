Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82B691E78D1
	for <lists+linux-rtc@lfdr.de>; Fri, 29 May 2020 10:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbgE2Iyz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 May 2020 04:54:55 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:40043 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgE2Iyy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 29 May 2020 04:54:54 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 912D4FF815;
        Fri, 29 May 2020 08:54:52 +0000 (UTC)
Date:   Fri, 29 May 2020 10:54:52 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Kevin P. Fleming" <kevin+linux@km6g.us>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: abx80x: Provide feedback for invalid dt properties
Message-ID: <20200529085452.GZ3972@piout.net>
References: <20200529001203.235304-1-kevin+linux@km6g.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529001203.235304-1-kevin+linux@km6g.us>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,


On 28/05/2020 20:12:03-0400, Kevin P. Fleming wrote:
> When the user provides an invalid value for tc-diode or
> tc-resistor generate an error message instead of silently
> ignoring it.
> 
> Signed-off-by: Kevin P. Fleming <kevin+linux@km6g.us>
> ---
>  drivers/rtc/rtc-abx80x.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> index 3521d8e8dc38..dae046e3484a 100644
> --- a/drivers/rtc/rtc-abx80x.c
> +++ b/drivers/rtc/rtc-abx80x.c
> @@ -554,7 +554,8 @@ static const struct rtc_class_ops abx80x_rtc_ops = {
>  	.ioctl		= abx80x_ioctl,
>  };
>  
> -static int abx80x_dt_trickle_cfg(struct device_node *np)
> +static int abx80x_dt_trickle_cfg(struct i2c_client *client,
> +				 struct device_node *np)

I would remove np from the parameters and use
struct device_node *np = client->dev.of_node;
in the function.
>  {
>  	const char *diode;
>  	int trickle_cfg = 0;
> @@ -565,12 +566,14 @@ static int abx80x_dt_trickle_cfg(struct device_node *np)
>  	if (ret)
>  		return ret;
>  
> -	if (!strcmp(diode, "standard"))
> +	if (!strcmp(diode, "standard")) {
>  		trickle_cfg |= ABX8XX_TRICKLE_STANDARD_DIODE;
> -	else if (!strcmp(diode, "schottky"))
> +	} else if (!strcmp(diode, "schottky")) {
>  		trickle_cfg |= ABX8XX_TRICKLE_SCHOTTKY_DIODE;
> -	else
> +	} else {
> +		dev_err(&client->dev, "Invalid tc-diode value: %s\n", diode);

Can you make that dev_dbg? This is only ever needed at board bring up/
development time, so it is not necessary to bloat the kernel with more
strings.

>  		return -EINVAL;
> +	}
>  
>  	ret = of_property_read_u32(np, "abracon,tc-resistor", &tmp);
>  	if (ret)
> @@ -580,8 +583,10 @@ static int abx80x_dt_trickle_cfg(struct device_node *np)
>  		if (trickle_resistors[i] == tmp)
>  			break;
>  
> -	if (i == sizeof(trickle_resistors))
> +	if (i == sizeof(trickle_resistors)) {
> +		dev_err(&client->dev, "Invalid tc-resistor value: %u\n", tmp);
>  		return -EINVAL;
> +	}
>  
>  	return (trickle_cfg | i);
>  }
> @@ -793,7 +798,7 @@ static int abx80x_probe(struct i2c_client *client,
>  	}
>  
>  	if (np && abx80x_caps[part].has_tc)
> -		trickle_cfg = abx80x_dt_trickle_cfg(np);
> +		trickle_cfg = abx80x_dt_trickle_cfg(client, np);
>  
>  	if (trickle_cfg > 0) {
>  		dev_info(&client->dev, "Enabling trickle charger: %02x\n",
> -- 
> 2.26.2
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
