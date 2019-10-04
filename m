Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8395BCC36E
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Oct 2019 21:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729141AbfJDTMJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Oct 2019 15:12:09 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:51765 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730348AbfJDTMI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Oct 2019 15:12:08 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 964B1E0006;
        Fri,  4 Oct 2019 19:12:02 +0000 (UTC)
Date:   Fri, 4 Oct 2019 21:12:02 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Yizhuo <yzhai003@ucr.edu>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: snvs: fix uninitialized usage of "lpcr" in
 snvs_rtc_enable()
Message-ID: <20191004191202.GB4106@piout.net>
References: <20191004185206.7466-1-yzhai003@ucr.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004185206.7466-1-yzhai003@ucr.edu>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/10/2019 11:52:06-0700, Yizhuo wrote:
> Inside function snvs_rtc_enable(), variable "lpcr" could be
> uninitialized if regmap_read() returns -EINVAL. However,"lpcr"
> is used later in the if statement, which is potentially unsafe.
> 

This is not true, regmap_read either lock up the cpu or not fail in this
driver.

> Similar cases happened in function snvs_rtc_irq_handler() with
> variable "lpsr" and function snvs_rtc_read_alarm() with variables
> "lptar", "lpsr". The patch for those two are not easy since
> -EINVAL is not an acceptable return value for these functions.
> 
> Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> ---
>  drivers/rtc/rtc-snvs.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
> index 757f4daa7181..dadcc3e193b2 100644
> --- a/drivers/rtc/rtc-snvs.c
> +++ b/drivers/rtc/rtc-snvs.c
> @@ -124,12 +124,16 @@ static int snvs_rtc_enable(struct snvs_rtc_data *data, bool enable)
>  {
>  	int timeout = 1000;
>  	u32 lpcr;
> +	int ret;
>  
>  	regmap_update_bits(data->regmap, data->offset + SNVS_LPCR, SNVS_LPCR_SRTC_ENV,
>  			   enable ? SNVS_LPCR_SRTC_ENV : 0);
>  
>  	while (--timeout) {
> -		regmap_read(data->regmap, data->offset + SNVS_LPCR, &lpcr);
> +		ret = regmap_read(data->regmap,
> +					data->offset + SNVS_LPCR, &lpcr);
> +		if (ret)
> +			return ret;
>  
>  		if (enable) {
>  			if (lpcr & SNVS_LPCR_SRTC_ENV)
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
