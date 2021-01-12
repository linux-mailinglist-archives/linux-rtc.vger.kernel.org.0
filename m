Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED1342F4006
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Jan 2021 01:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438422AbhALWpC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Jan 2021 17:45:02 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:6285 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438420AbhALWpC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Jan 2021 17:45:02 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F223F240008;
        Tue, 12 Jan 2021 22:44:20 +0000 (UTC)
Date:   Tue, 12 Jan 2021 23:44:20 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Daniel =?iso-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: rs5c372: let the alarm to be used as wakeup
 source
Message-ID: <20210112224420.GL3654@piout.net>
References: <2324307.0LpMOBvr9T@tool>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2324307.0LpMOBvr9T@tool>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/11/2020 11:38:48+0100, Daniel González Cabanelas wrote:
> Currently there is no use for the interrupts on the rs5c372 RTC and the
> wakealarm isn't enabled. There are some devices like NAS which use this
> RTC to wake up from the power off state when the INTR pin is activated by
> the alarm clock.
> 
> Enable the alarm and let to be used as a wakeup source. Tested on a Buffalo
> LS421DE NAS.
> 
> Signed-off-by: Daniel González Cabanelas <dgcbueu@gmail.com>
> ---
>  drivers/rtc/rtc-rs5c372.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
> index 94b778c6e..76775d66e 100644
> --- a/drivers/rtc/rtc-rs5c372.c
> +++ b/drivers/rtc/rtc-rs5c372.c
> @@ -654,6 +654,7 @@ static int rs5c372_probe(struct i2c_client *client,
>  	int err = 0;
>  	int smbus_mode = 0;
>  	struct rs5c372 *rs5c372;
> +	bool rs5c372_can_wakeup_device = false;
>  
>  	dev_dbg(&client->dev, "%s\n", __func__);
>  
> @@ -689,6 +690,12 @@ static int rs5c372_probe(struct i2c_client *client,
>  	else
>  		rs5c372->type = id->driver_data;
>  
> +#ifdef CONFIG_OF

I don't think you need to protect this section

> +	if(of_property_read_bool(client->dev.of_node,

but you'll have to check client->dev.of_node is not null.

> +					      "wakeup-source"))
> +		rs5c372_can_wakeup_device = true;
> +#endif
> +
>  	/* we read registers 0x0f then 0x00-0x0f; skip the first one */
>  	rs5c372->regs = &rs5c372->buf[1];
>  	rs5c372->smbus = smbus_mode;
> @@ -722,6 +729,8 @@ static int rs5c372_probe(struct i2c_client *client,
>  		goto exit;
>  	}
>  
> +	rs5c372->has_irq = 1;
> +
This is an unrelated change but is this actually useful? I guess you
should simply remove has_irq.

>  	/* if the oscillator lost power and no other software (like
>  	 * the bootloader) set it up, do it here.
>  	 *
> @@ -748,6 +757,10 @@ static int rs5c372_probe(struct i2c_client *client,
>  			);
>  
>  	/* REVISIT use client->irq to register alarm irq ... */
> +	if (rs5c372_can_wakeup_device) {
> +		device_init_wakeup(&client->dev, true);
> +	}
> +
>  	rs5c372->rtc = devm_rtc_device_register(&client->dev,
>  					rs5c372_driver.driver.name,
>  					&rs5c372_rtc_ops, THIS_MODULE);
> @@ -761,6 +774,9 @@ static int rs5c372_probe(struct i2c_client *client,
>  	if (err)
>  		goto exit;
>  
> +	/* the rs5c372 alarm only supports a minute accuracy */
> +	rs5c372->rtc->uie_unsupported = 1;
> +

Honestly, the whole driver would need some modernization so if you have
time to test, I can propose a set of patches.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
