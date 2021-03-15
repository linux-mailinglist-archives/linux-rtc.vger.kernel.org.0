Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C1033C8F8
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Mar 2021 23:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhCOWBh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Mar 2021 18:01:37 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:8319 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232290AbhCOWBU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 15 Mar 2021 18:01:20 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F1F19240006;
        Mon, 15 Mar 2021 22:01:18 +0000 (UTC)
Date:   Mon, 15 Mar 2021 23:01:18 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] rtc: ds1307: set uie_unsupported if no interrupt is
 available
Message-ID: <YE/ZLtdK0ZlVFOhp@piout.net>
References: <CGME20210305174419eucas1p1639ed3bbcbc37ab3e3619e9c5d1e1629@eucas1p1.samsung.com>
 <20210305174411.9657-1-l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210305174411.9657-1-l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 05/03/2021 18:44:11+0100, Łukasz Stelmach wrote:
> For an RTC without an IRQ assigned rtc_update_irq_enable() should
> return -EINVAL.  It will, when uie_unsupported is set.
> 

I'm surprised this is an issue because the current code seems to cover
all cases:

 - no irq and not wakeup-source => set_alarm should fail
 - no irq and wakeup-source => uie_unsupported is set
 - irq => UIE should work

Can you elaborate on your failing use case?

> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> ---
>  drivers/rtc/rtc-ds1307.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index cd8e438bc9c4..b08a9736fa77 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -1973,13 +1973,6 @@ static int ds1307_probe(struct i2c_client *client,
>  	if (IS_ERR(ds1307->rtc))
>  		return PTR_ERR(ds1307->rtc);
>  
> -	if (ds1307_can_wakeup_device && !want_irq) {
> -		dev_info(ds1307->dev,
> -			 "'wakeup-source' is set, request for an IRQ is disabled!\n");
> -		/* We cannot support UIE mode if we do not have an IRQ line */
> -		ds1307->rtc->uie_unsupported = 1;
> -	}
> -
>  	if (want_irq) {
>  		err = devm_request_threaded_irq(ds1307->dev, client->irq, NULL,
>  						chip->irq_handler ?: ds1307_irq,
> @@ -1993,6 +1986,13 @@ static int ds1307_probe(struct i2c_client *client,
>  		} else {
>  			dev_dbg(ds1307->dev, "got IRQ %d\n", client->irq);
>  		}
> +	} else {
> +		if (ds1307_can_wakeup_device)
> +			dev_info(ds1307->dev,
> +				 "'wakeup-source' is set, request for an IRQ is disabled!\n");
> +

Honestly, just drop this message, it should have been removed by 82e2d43f6315


> +		/* We cannot support UIE mode if we do not have an IRQ line */
> +		ds1307->rtc->uie_unsupported = 1;
>  	}
>  
>  	ds1307->rtc->ops = chip->rtc_ops ?: &ds13xx_rtc_ops;
> -- 
> 2.26.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
