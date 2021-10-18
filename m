Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AF74326F4
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Oct 2021 20:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhJRS7b (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Oct 2021 14:59:31 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:58791 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhJRS7a (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Oct 2021 14:59:30 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id D2BAC240006;
        Mon, 18 Oct 2021 18:57:16 +0000 (UTC)
Date:   Mon, 18 Oct 2021 20:57:16 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: s3c: Remove usage of devm_rtc_device_register()
Message-ID: <YW3DjEuszEZ1Uw6/@piout.net>
References: <20211018173201.2166-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018173201.2166-1-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 18/10/2021 20:32:01+0300, Sam Protsenko wrote:
> devm_rtc_device_register() is deprecated. Use devm_rtc_allocate_device()
> and devm_rtc_register_device() API instead.
> 

If you do that, please also set the range properly, either in the same
patch or as a follow-up.

> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/rtc/rtc-s3c.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index e57d3ca70a78..10e591794276 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -447,15 +447,18 @@ static int s3c_rtc_probe(struct platform_device *pdev)
>  
>  	device_init_wakeup(&pdev->dev, 1);
>  
> -	/* register RTC and exit */
> -	info->rtc = devm_rtc_device_register(&pdev->dev, "s3c", &s3c_rtcops,
> -					     THIS_MODULE);
> +	info->rtc = devm_rtc_allocate_device(&pdev->dev);
>  	if (IS_ERR(info->rtc)) {
> -		dev_err(&pdev->dev, "cannot attach rtc\n");
>  		ret = PTR_ERR(info->rtc);
>  		goto err_nortc;
>  	}
>  
> +	info->rtc->ops = &s3c_rtcops;
> +
> +	ret = devm_rtc_register_device(info->rtc);
> +	if (ret)
> +		goto err_nortc;
> +
>  	ret = devm_request_irq(&pdev->dev, info->irq_alarm, s3c_rtc_alarmirq,
>  			       0, "s3c2410-rtc alarm", info);
>  	if (ret) {
> -- 
> 2.30.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
