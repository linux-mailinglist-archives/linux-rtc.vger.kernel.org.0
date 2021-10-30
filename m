Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 178EC440C3C
	for <lists+linux-rtc@lfdr.de>; Sun, 31 Oct 2021 00:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbhJ3XAd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 30 Oct 2021 19:00:33 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:33697 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbhJ3XAd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 30 Oct 2021 19:00:33 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 43347100005;
        Sat, 30 Oct 2021 22:57:58 +0000 (UTC)
Date:   Sun, 31 Oct 2021 00:57:57 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Pavel Modilaynen <pavel.modilaynen@axis.com>
Cc:     a.zummo@towertech.it, robh+dt@kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, lkml@axis.com, kernel@axis.com,
        Pavel Modilaynen <pavelmn@axis.com>
Subject: Re: [PATCH 1/2] rtc: rs5c372: Add support for trim configuration
Message-ID: <YX3N9b6P4w1kSGfp@piout.net>
References: <20211030225054.32114-1-pavel.modilaynen@axis.com>
 <20211030225054.32114-2-pavel.modilaynen@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211030225054.32114-2-pavel.modilaynen@axis.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

Please use the proper RTC interface by implementing .set_offset and
.read_offset.

On 31/10/2021 00:50:53+0200, Pavel Modilaynen wrote:
> From: Pavel Modilaynen <pavelmn@axis.com>
> 
> Add support for oscillation adjustment register RS5C372_REG_TRIM
> setting that is needed to accommodate for effective crystal
> capacitance.
> 
> Use optional property ricoh,trim that should contain
> raw value to setup this register. According to
> datasheets for RS5C372, R2025S/D, RV5C38[67] and R222[13]
> the value will be converted to a number of ticks that
> is to be subtracted or added when the second digits read
> 00, 20 or 40 seconds.
> 
> Signed-off-by: Pavel Modilaynen <pavelmn@axis.com>
> ---
>  drivers/rtc/rtc-rs5c372.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
> index 80980414890c..3a2db0326669 100644
> --- a/drivers/rtc/rtc-rs5c372.c
> +++ b/drivers/rtc/rtc-rs5c372.c
> @@ -13,6 +13,7 @@
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/of.h>
>  
>  /*
>   * Ricoh has a family of I2C based RTCs, which differ only slightly from
> @@ -560,6 +561,8 @@ static int rs5c_oscillator_setup(struct rs5c372 *rs5c372)
>  {
>  	unsigned char buf[2];
>  	int addr, i, ret = 0;
> +	struct i2c_client *client = rs5c372->client;
> +	u8 trim = 0;
>  
>  	addr   = RS5C_ADDR(RS5C_REG_CTRL1);
>  	buf[0] = rs5c372->regs[RS5C_REG_CTRL1];
> @@ -599,9 +602,22 @@ static int rs5c_oscillator_setup(struct rs5c372 *rs5c372)
>  		break;
>  	}
>  
> +	/* optional setup of xtal trimming */
> +	if (!of_property_read_u8(client->dev.of_node, "ricoh,trim", &trim)) {
> +		if (rs5c372->type != rtc_r2221tl && (trim & ~RS5C372_TRIM_MASK)) {
> +			dev_warn(&client->dev, "Erroneous setting for ricoh,trim in devicetree\n");
> +		} else {
> +			int addr = RS5C_ADDR(RS5C372_REG_TRIM);
> +			int ret = i2c_smbus_write_byte_data(client, addr, trim);
> +
> +			if (unlikely(ret < 0))
> +				return ret;
> +		}
> +	}
> +
>  	for (i = 0; i < sizeof(buf); i++) {
>  		addr = RS5C_ADDR(RS5C_REG_CTRL1 + i);
> -		ret = i2c_smbus_write_byte_data(rs5c372->client, addr, buf[i]);
> +		ret = i2c_smbus_write_byte_data(client, addr, buf[i]);
>  		if (unlikely(ret < 0))
>  			return ret;
>  	}
> -- 
> 2.20.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
