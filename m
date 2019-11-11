Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2AFEF79A3
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2019 18:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbfKKRTS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Nov 2019 12:19:18 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:50953 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbfKKRTS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Nov 2019 12:19:18 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-1-1723-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id BD89E1BF205;
        Mon, 11 Nov 2019 17:19:15 +0000 (UTC)
Date:   Mon, 11 Nov 2019 18:19:15 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: tps65910: allow using RTC without alarm interrupt
Message-ID: <20191111171915.GA3572@piout.net>
References: <20191109154652.7419-1-andrej.skvortzov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191109154652.7419-1-andrej.skvortzov@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

This needs a proper commit message.

On 09/11/2019 18:46:52+0300, Andrey Skvortsov wrote:
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> ---
>  drivers/rtc/rtc-tps65910.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-tps65910.c b/drivers/rtc/rtc-tps65910.c
> index 2c0467a9e717..aa3a001ef413 100644
> --- a/drivers/rtc/rtc-tps65910.c
> +++ b/drivers/rtc/rtc-tps65910.c
> @@ -361,6 +361,13 @@ static const struct rtc_class_ops tps65910_rtc_ops = {
>  	.set_offset	= tps65910_set_offset,
>  };
>  
> +static const struct rtc_class_ops tps65910_rtc_ops_noirq = {
> +	.read_time	= tps65910_rtc_read_time,
> +	.set_time	= tps65910_rtc_set_time,
> +	.read_offset	= tps65910_read_offset,
> +	.set_offset	= tps65910_set_offset,
> +};
> +
>  static int tps65910_rtc_probe(struct platform_device *pdev)
>  {
>  	struct tps65910 *tps65910 = NULL;
> @@ -415,13 +422,17 @@ static int tps65910_rtc_probe(struct platform_device *pdev)
>  		tps65910_rtc_interrupt, IRQF_TRIGGER_LOW,
>  		dev_name(&pdev->dev), &pdev->dev);
>  	if (ret < 0) {
> -		dev_err(&pdev->dev, "IRQ is not free.\n");
> -		return ret;
> +		dev_err(&pdev->dev, "request IRQ:%d failed, err = %d\n",
> +			 irq, ret);

Do we actually need an error message here?

> +		irq = -1;
>  	}
>  	tps_rtc->irq = irq;
> -	device_set_wakeup_capable(&pdev->dev, 1);
> +	if (irq != -1) {
> +		device_set_wakeup_capable(&pdev->dev, 1);
> +		tps_rtc->rtc->ops = &tps65910_rtc_ops;
> +	} else
> +		tps_rtc->rtc->ops = &tps65910_rtc_ops_noirq;
>  
> -	tps_rtc->rtc->ops = &tps65910_rtc_ops;
>  	tps_rtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	tps_rtc->rtc->range_max = RTC_TIMESTAMP_END_2099;
>  
> -- 
> 2.20.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
