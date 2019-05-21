Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38C50254A0
	for <lists+linux-rtc@lfdr.de>; Tue, 21 May 2019 17:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbfEUPyb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 21 May 2019 11:54:31 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:48569 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbfEUPyb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 21 May 2019 11:54:31 -0400
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5003F200015;
        Tue, 21 May 2019 15:54:25 +0000 (UTC)
Date:   Tue, 21 May 2019 17:54:24 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Richard Leitner <richard.leitner@skidata.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] rtc: s35390a: clarify INT2 pin output modes
Message-ID: <20190521155424.GH3274@piout.net>
References: <20190521142024.25894-1-richard.leitner@skidata.com>
 <20190521142024.25894-2-richard.leitner@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521142024.25894-2-richard.leitner@skidata.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

This seems good to me but...

On 21/05/2019 16:20:22+0200, Richard Leitner wrote:
> Fix the INT2 mode mask to not include the "TEST" flag. Furthermore
> remove the not needed reversion of bits when parsing the INT2 modes.
> Instead reverse the INT2_MODE defines.
> 
> Additionally mention the flag names from the datasheet for the different
> modes in the comments.
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  drivers/rtc/rtc-s35390a.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
> index 3c64dbb08109..6fb6d835b178 100644
> --- a/drivers/rtc/rtc-s35390a.c
> +++ b/drivers/rtc/rtc-s35390a.c
> @@ -45,12 +45,13 @@
>  /* flag for STATUS2 */
>  #define S35390A_FLAG_TEST	0x01
>  
> -#define S35390A_INT2_MODE_MASK		0xF0
> -
> +/* INT2 pin output mode */
> +#define S35390A_INT2_MODE_MASK		0x0E
>  #define S35390A_INT2_MODE_NOINTR	0x00
> -#define S35390A_INT2_MODE_FREQ		0x10
> -#define S35390A_INT2_MODE_ALARM		0x40
> -#define S35390A_INT2_MODE_PMIN_EDG	0x20
> +#define S35390A_INT2_MODE_ALARM		0x02 /* INT2AE */
> +#define S35390A_INT2_MODE_PMIN_EDG	0x04 /* INT2ME */
> +#define S35390A_INT2_MODE_FREQ		0x08 /* INT2FE */
> +#define S35390A_INT2_MODE_PMIN		0x0C /* INT2ME | INT2FE */
>  

While you are at it you may as well use BIT().

>  static const struct i2c_device_id s35390a_id[] = {
>  	{ "s35390a", 0 },
> @@ -303,9 +304,6 @@ static int s35390a_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
>  	else
>  		sts = S35390A_INT2_MODE_NOINTR;
>  
> -	/* This chip expects the bits of each byte to be in reverse order */
> -	sts = bitrev8(sts);
> -
>  	/* set interupt mode*/
>  	err = s35390a_set_reg(s35390a, S35390A_CMD_STATUS2, &sts, sizeof(sts));
>  	if (err < 0)
> @@ -343,7 +341,7 @@ static int s35390a_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
>  	if (err < 0)
>  		return err;
>  
> -	if ((bitrev8(sts) & S35390A_INT2_MODE_MASK) != S35390A_INT2_MODE_ALARM) {
> +	if ((sts & S35390A_INT2_MODE_MASK) != S35390A_INT2_MODE_ALARM) {
>  		/*
>  		 * When the alarm isn't enabled, the register to configure
>  		 * the alarm time isn't accessible.
> -- 
> 2.20.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
