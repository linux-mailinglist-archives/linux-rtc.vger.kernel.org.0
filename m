Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5AA91C6D0D
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2020 11:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbgEFJgs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 May 2020 05:36:48 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:42187 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728640AbgEFJgs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 May 2020 05:36:48 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0C349240028;
        Wed,  6 May 2020 09:34:41 +0000 (UTC)
Date:   Wed, 6 May 2020 11:34:41 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Samuel Zou <zou_wei@huawei.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] rtc: pcf8523: Use PTR_ERR_OR_ZERO() to simplify
 code
Message-ID: <20200506093441.GB34497@piout.net>
References: <1588757640-39044-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588757640-39044-1-git-send-email-zou_wei@huawei.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 06/05/2020 17:34:00+0800, Samuel Zou wrote:
> Fixes coccicheck warning:
> 
> drivers/rtc/rtc-pcf8523.c:361:1-3: WARNING: PTR_ERR_OR_ZERO can be used
> 

I'm not taking this change because it is useless and will have to be
revert as soon as the probe function changes (and it will).

Does it really simplifies the code? I very much doubt so.

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Samuel Zou <zou_wei@huawei.com>
> ---
>  drivers/rtc/rtc-pcf8523.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
> index 47e0f41..da8889a 100644
> --- a/drivers/rtc/rtc-pcf8523.c
> +++ b/drivers/rtc/rtc-pcf8523.c
> @@ -358,10 +358,8 @@ static int pcf8523_probe(struct i2c_client *client,
>  
>  	rtc = devm_rtc_device_register(&client->dev, DRIVER_NAME,
>  				       &pcf8523_rtc_ops, THIS_MODULE);
> -	if (IS_ERR(rtc))
> -		return PTR_ERR(rtc);
>  
> -	return 0;
> +	return PTR_ERR_OR_ZERO(rtc);
>  }
>  
>  static const struct i2c_device_id pcf8523_id[] = {
> -- 
> 2.6.2
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
