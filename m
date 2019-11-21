Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96BCB104D58
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Nov 2019 09:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfKUIJb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Nov 2019 03:09:31 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45203 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbfKUIJb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Nov 2019 03:09:31 -0500
Received: from erbse.hi.pengutronix.de ([2001:67c:670:100:9e5c:8eff:fece:cdfe])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1iXhWr-00043f-Vd; Thu, 21 Nov 2019 09:09:29 +0100
Subject: Re: [PATCH V2] rtc: ds1307: Enable battery backup on RX8130
To:     Marek Vasut <marex@denx.de>, linux-rtc@vger.kernel.org
Cc:     Arnaud Ebalard <arno@natisbad.org>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>
References: <20190905130336.10651-1-marex@denx.de>
From:   Bastian Krause <bst@pengutronix.de>
Message-ID: <3c07a9d4-e28e-df67-8a0b-9a6db48a9dc4@pengutronix.de>
Date:   Thu, 21 Nov 2019 09:09:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190905130336.10651-1-marex@denx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:9e5c:8eff:fece:cdfe
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 9/5/19 3:03 PM, Marek Vasut wrote:
> The battery backup can be disabled on this RTC, e.g. if populated right
> out of production. Force the battery backup bit on to enable it.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Arnaud Ebalard <arno@natisbad.org>
> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Cc: Bastian Krause <bst@pengutronix.de>

Reviewed-by: Bastian Krause <bst@pengutronix.de>

Regards,
Bastian

> ---
> V2: Drop the custom offset, let regmap handle that
> ---
>  drivers/rtc/rtc-ds1307.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index 1f7e8aefc1eb..f2d1e59478c2 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -121,6 +121,8 @@ enum ds_type {
>  #define RX8130_REG_FLAG_AF		BIT(3)
>  #define RX8130_REG_CONTROL0		0x1e
>  #define RX8130_REG_CONTROL0_AIE		BIT(3)
> +#define RX8130_REG_CONTROL1		0x1f
> +#define RX8130_REG_CONTROL1_INIEN	BIT(4)
>  
>  #define MCP794XX_REG_CONTROL		0x07
>  #	define MCP794XX_BIT_ALM0_EN	0x10
> @@ -1750,6 +1752,11 @@ static int ds1307_probe(struct i2c_client *client,
>  				     DS1307_REG_HOUR << 4 | 0x08, hour);
>  		}
>  		break;
> +	case rx_8130:
> +		/* make sure that the backup battery is enabled */
> +		regmap_write(ds1307->regmap, RX8130_REG_CONTROL1,
> +			     RX8130_REG_CONTROL1_INIEN);
> +		break;
>  	default:
>  		break;
>  	}
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
