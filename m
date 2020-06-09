Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3731F48A0
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Jun 2020 23:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgFIVHl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 9 Jun 2020 17:07:41 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:36339 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgFIVHl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 9 Jun 2020 17:07:41 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C2183C0004;
        Tue,  9 Jun 2020 21:07:39 +0000 (UTC)
Date:   Tue, 9 Jun 2020 23:07:39 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     liambeguin@gmail.com
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 3/3] rtc: pcf2127: reset alarm interrupt at power on
Message-ID: <20200609210739.GV3720@piout.net>
References: <20200607170610.24534-1-liambeguin@gmail.com>
 <20200607170610.24534-4-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200607170610.24534-4-liambeguin@gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 07/06/2020 13:06:10-0400, liambeguin@gmail.com wrote:
> From: Liam Beguin <lvb@xiphos.com>
> 
> From: Liam Beguin <lvb@xiphos.com>

Always include a commit message.

> 
> Signed-off-by: Liam Beguin <lvb@xiphos.com>
> ---
>  drivers/rtc/rtc-pcf2127.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 3eeb085a7c72..f004a4030970 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -546,6 +546,14 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  
>  	pcf2127->rtc->ops = &pcf2127_rtc_ops;
>  
> +	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> +				 PCF2127_BIT_CTRL2_AIE, 0);
> +	if (ret) {
> +		dev_err(dev, "%s: failed to clear interrupt enable bit (%d)",
> +			__func__, ret);
> +		return ret;
> +	}
> +

The driver simply must not do that or alarms will be missed.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
