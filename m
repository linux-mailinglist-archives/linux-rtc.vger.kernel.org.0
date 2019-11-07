Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83835F2C16
	for <lists+linux-rtc@lfdr.de>; Thu,  7 Nov 2019 11:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387612AbfKGKYo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 Nov 2019 05:24:44 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:39195 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727707AbfKGKYo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 Nov 2019 05:24:44 -0500
X-Originating-IP: 92.137.17.54
Received: from localhost (alyon-657-1-975-54.w92-137.abo.wanadoo.fr [92.137.17.54])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A94921C0005;
        Thu,  7 Nov 2019 10:24:39 +0000 (UTC)
Date:   Thu, 7 Nov 2019 11:24:37 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        John Collis <john.collis@alliedtelesis.co.nz>
Subject: Re: [PATCH] rtc: ds1307: check for oscillator fault on ds1388
Message-ID: <20191107102437.GO8309@piout.net>
References: <20191107011245.26796-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191107011245.26796-1-chris.packham@alliedtelesis.co.nz>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 07/11/2019 14:12:45+1300, Chris Packham wrote:
> Ensure that the oscillator is running and check the OSF bit for the
> ds1388 variant. The FLAG and CONTROL registers are at a different
> location to the other supported RTCs so this requires an extra case in
> the existing switch statement.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  drivers/rtc/rtc-ds1307.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index 1f7e8aefc1eb..865c06347d0a 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -101,6 +101,10 @@ enum ds_type {
>  #	define DS1337_BIT_A2I		0x02
>  #	define DS1337_BIT_A1I		0x01
>  #define DS1339_REG_ALARM1_SECS	0x07
> +#define DS1388_REG_FLAG		0x0b
> +#	define DS1388_BIT_OSF		0x80
> +#define DS1388_REG_CONTROL	0x0c
> +#	define DS1388_BIT_nEOSC		0x80
>  
>  #define DS13XX_TRICKLE_CHARGER_MAGIC	0xa0
>  
> @@ -1688,6 +1692,26 @@ static int ds1307_probe(struct i2c_client *client,
>  		}
>  		break;
>  
> +	case ds_1388:
> +		err = regmap_bulk_read(ds1307->regmap, DS1388_REG_FLAG,
> +				       regs, 2);
> +		if (err) {
> +			dev_dbg(ds1307->dev, "read error %d\n", err);
> +			goto exit;
> +		}
> +
> +		if (regs[1] & DS1388_BIT_nEOSC) {
> +			regmap_write(ds1307->regmap, DS1388_REG_CONTROL,
> +				     regs[1] & ~DS1388_BIT_nEOSC);
> +		}
> +
> +		if (regs[0] & DS1388_BIT_OSF) {
> +			regmap_write(ds1307->regmap, DS1388_REG_FLAG,
> +				     regs[0]  & ~DS1388_BIT_OSF);
> +			dev_warn(ds1307->dev, "SET TIME!\n");

This is not the correct way to handle that. This information is valuable
in .read_time where you should return -EINVAL when the time is know to
be invalid. Then the bit can be reset in .set_time.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
