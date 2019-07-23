Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F180671F7B
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jul 2019 20:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733197AbfGWSmJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Jul 2019 14:42:09 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:37653 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731007AbfGWSmJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Jul 2019 14:42:09 -0400
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9CFCD100007;
        Tue, 23 Jul 2019 18:42:05 +0000 (UTC)
Date:   Tue, 23 Jul 2019 20:42:05 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux-rtc@vger.kernel.org, a.zummo@towertech.it, bth@kamstrup.com,
        u.kleine-koenig@pengutronix.de
Subject: Re: [PATCH 2/4] rtc: pcf2127: cleanup register and bit defines
Message-ID: <20190723184205.GL24911@piout.net>
References: <20190722155811.11980-1-bruno.thomsen@gmail.com>
 <20190722155811.11980-3-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722155811.11980-3-bruno.thomsen@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 22/07/2019 17:58:09+0200, Bruno Thomsen wrote:
> Cleanup defines before adding new features to driver.
> 

I think you need to elaborate on what is wrong with the current defines
because they seem fine to me as-is.

> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
> ---
>  drivers/rtc/rtc-pcf2127.c | 59 ++++++++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 58eb96506e4b..cd8def79b379 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -19,26 +19,32 @@
>  #include <linux/of.h>
>  #include <linux/regmap.h>
>  
> -#define PCF2127_REG_CTRL1       (0x00)  /* Control Register 1 */
> -#define PCF2127_REG_CTRL2       (0x01)  /* Control Register 2 */
> -
> -#define PCF2127_REG_CTRL3       (0x02)  /* Control Register 3 */
> -#define PCF2127_REG_CTRL3_BLF		BIT(2)
> -
> -#define PCF2127_REG_SC          (0x03)  /* datetime */
> -#define PCF2127_REG_MN          (0x04)
> -#define PCF2127_REG_HR          (0x05)
> -#define PCF2127_REG_DM          (0x06)
> -#define PCF2127_REG_DW          (0x07)
> -#define PCF2127_REG_MO          (0x08)
> -#define PCF2127_REG_YR          (0x09)
> -
> -/* the pcf2127 has 512 bytes nvmem, pcf2129 doesn't */
> -#define PCF2127_REG_RAM_addr_MSB       0x1a
> -#define PCF2127_REG_RAM_wrt_cmd        0x1c
> -#define PCF2127_REG_RAM_rd_cmd         0x1d
> +/* Control register 1 */
> +#define PCF2127_REG_CTRL1		0x00
> +/* Control register 2 */
> +#define PCF2127_REG_CTRL2		0x01
> +/* Control register 3 */
> +#define PCF2127_REG_CTRL3		0x02
> +#define PCF2127_BIT_CTRL3_BLF			BIT(2)
> +/* Time and date registers */
> +#define PCF2127_REG_SC			0x03
> +#define PCF2127_BIT_SC_OSF			BIT(7)
> +#define PCF2127_REG_MN			0x04
> +#define PCF2127_REG_HR			0x05
> +#define PCF2127_REG_DM			0x06
> +#define PCF2127_REG_DW			0x07
> +#define PCF2127_REG_MO			0x08
> +#define PCF2127_REG_YR			0x09
> +/*
> + * RAM registers
> + * PCF2127 has 512 bytes general-purpose static RAM (SRAM) that is
> + * battery backed and can survive a power outage.
> + * PCF2129 doesn't have this feature.
> + */
> +#define PCF2127_REG_RAM_ADDR_MSB	0x1A
> +#define PCF2127_REG_RAM_WRT_CMD		0x1C
> +#define PCF2127_REG_RAM_RD_CMD		0x1D
>  
> -#define PCF2127_OSF             BIT(7)  /* Oscillator Fail flag */
>  
>  struct pcf2127 {
>  	struct rtc_device *rtc;
> @@ -73,11 +79,12 @@ static int pcf2127_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  		return ret;
>  	}
>  
> -	if (buf[PCF2127_REG_CTRL3] & PCF2127_REG_CTRL3_BLF)
> +	if (buf[PCF2127_REG_CTRL3] & PCF2127_BIT_CTRL3_BLF)
>  		dev_info(dev,
>  			"low voltage detected, check/replace RTC battery.\n");
>  
> -	if (buf[PCF2127_REG_SC] & PCF2127_OSF) {
> +	/* Clock integrity is not guaranteed when OSF flag is set. */
> +	if (buf[PCF2127_REG_SC] & PCF2127_BIT_SC_OSF) {
>  		/*
>  		 * no need clear the flag here,
>  		 * it will be cleared once the new date is saved
> @@ -166,7 +173,7 @@ static int pcf2127_rtc_ioctl(struct device *dev,
>  		if (ret)
>  			return ret;
>  
> -		touser = touser & PCF2127_REG_CTRL3_BLF ? 1 : 0;
> +		touser = touser & PCF2127_BIT_CTRL3_BLF ? 1 : 0;
>  
>  		if (copy_to_user((void __user *)arg, &touser, sizeof(int)))
>  			return -EFAULT;
> @@ -192,12 +199,12 @@ static int pcf2127_nvmem_read(void *priv, unsigned int offset,
>  	int ret;
>  	unsigned char offsetbuf[] = { offset >> 8, offset };
>  
> -	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_addr_MSB,
> +	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_ADDR_MSB,
>  				offsetbuf, 2);
>  	if (ret)
>  		return ret;
>  
> -	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_RAM_rd_cmd,
> +	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_RAM_RD_CMD,
>  			       val, bytes);
>  
>  	return ret ?: bytes;
> @@ -210,12 +217,12 @@ static int pcf2127_nvmem_write(void *priv, unsigned int offset,
>  	int ret;
>  	unsigned char offsetbuf[] = { offset >> 8, offset };
>  
> -	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_addr_MSB,
> +	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_ADDR_MSB,
>  				offsetbuf, 2);
>  	if (ret)
>  		return ret;
>  
> -	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_wrt_cmd,
> +	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_WRT_CMD,
>  				val, bytes);
>  
>  	return ret ?: bytes;
> -- 
> 2.21.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
