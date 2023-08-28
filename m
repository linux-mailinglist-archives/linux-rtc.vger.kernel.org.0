Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2DB378A9A0
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Aug 2023 12:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbjH1KJL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Aug 2023 06:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbjH1KIp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Aug 2023 06:08:45 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E149C6;
        Mon, 28 Aug 2023 03:08:40 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39A97240002;
        Mon, 28 Aug 2023 10:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1693217319;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=i+Df2SJQG5tbnkCZ8XUr4T9mzOYmN76v+fdtNw+vEk0=;
        b=IxkR/6Uj92dU9VGKd9CwrLzD3hDjNDXkANTN7STMSl30DbY71NgxU12KKTYJMyVy1JrNj8
        guFWsLAkV3H/CWccUwB18ojGDk3gWrXDENAnZR9MVqo0dt+XWPN20bY/fz7P48U/3rZheD
        kjR+dlmnWznKN6wsIL73WyE4MRQqP5tEzOZ8heWueaLr/V0Am+pqESrM1VlhYZeAEiEUrX
        7M0dHkSqFPK9U2T0xCkHHtQnORR5EkjTXEXAvS6OgiT3gH96NCClwthXR8K2flBwGKeRak
        /4AzKjllnifa6uoAWxlBISFLTWeMkkk+c5sWSVSJqkBezbZcdjgThPS+HRqhag==
Date:   Mon, 28 Aug 2023 12:08:36 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf2127: Simplify probe()
Message-ID: <20230828100836fa0fad9c@mail.local>
References: <20230828095116.36922-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828095116.36922-1-biju.das.jz@bp.renesas.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 28/08/2023 10:51:16+0100, Biju Das wrote:
> Make similar OF and ID table for I2C and simpilfy probe() by replacing
> of_device_get_match_data() and id lookup for retrieving match data by
> i2c_get_match_data().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Note:
>  * This patch is only compile tested.

I would really prefer those kind of patches to be actually tested. Else,
I'm going to end up with 60 patches that may or may not break probing.

> ---
>  drivers/rtc/rtc-pcf2127.c | 33 ++++++++++++---------------------
>  1 file changed, 12 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 9c04c4e1a49c..ec3968e3b8ac 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -1349,15 +1349,6 @@ static const struct regmap_bus pcf2127_i2c_regmap = {
>  
>  static struct i2c_driver pcf2127_i2c_driver;
>  
> -static const struct i2c_device_id pcf2127_i2c_id[] = {
> -	{ "pcf2127", PCF2127 },
> -	{ "pcf2129", PCF2129 },
> -	{ "pca2129", PCF2129 },
> -	{ "pcf2131", PCF2131 },
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
> -
>  static int pcf2127_i2c_probe(struct i2c_client *client)
>  {
>  	struct regmap *regmap;
> @@ -1370,18 +1361,9 @@ static int pcf2127_i2c_probe(struct i2c_client *client)
>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
>  		return -ENODEV;
>  
> -	if (client->dev.of_node) {
> -		variant = of_device_get_match_data(&client->dev);
> -		if (!variant)
> -			return -ENODEV;
> -	} else {
> -		enum pcf21xx_type type =
> -			i2c_match_id(pcf2127_i2c_id, client)->driver_data;
> -
> -		if (type >= PCF21XX_LAST_ID)
> -			return -ENODEV;
> -		variant = &pcf21xx_cfg[type];
> -	}
> +	variant = i2c_get_match_data(client);
> +	if (!variant)
> +		return -ENODEV;
>  
>  	config.max_register = variant->max_register,
>  
> @@ -1396,6 +1378,15 @@ static int pcf2127_i2c_probe(struct i2c_client *client)
>  	return pcf2127_probe(&client->dev, regmap, client->irq, variant);
>  }
>  
> +static const struct i2c_device_id pcf2127_i2c_id[] = {
> +	{ "pcf2127", (kernel_ulong_t)&pcf21xx_cfg[PCF2127] },
> +	{ "pcf2129", (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
> +	{ "pca2129", (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
> +	{ "pcf2131", (kernel_ulong_t)&pcf21xx_cfg[PCF2131] },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
> +
>  static struct i2c_driver pcf2127_i2c_driver = {
>  	.driver		= {
>  		.name	= "rtc-pcf2127-i2c",
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
