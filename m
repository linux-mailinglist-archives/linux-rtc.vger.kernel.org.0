Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3E504DA7F
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Jun 2019 21:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbfFTToD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 Jun 2019 15:44:03 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:45177 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfFTToD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 Jun 2019 15:44:03 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A75011BF20A;
        Thu, 20 Jun 2019 19:43:58 +0000 (UTC)
Date:   Thu, 20 Jun 2019 21:43:58 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Dylan Howey <Dylan.Howey@tennantco.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] rtc: pcf2123: convert to devm_rtc_allocate_device
Message-ID: <20190620194358.GE23549@piout.net>
References: <20190620183433.30779-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620183433.30779-1-alexandre.belloni@bootlin.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 20/06/2019 20:34:30+0200, Alexandre Belloni wrote:
> This allows further improvement of the driver.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-pcf2123.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pcf2123.c b/drivers/rtc/rtc-pcf2123.c
> index e8100af789ef..29e09ff57f89 100644
> --- a/drivers/rtc/rtc-pcf2123.c
> +++ b/drivers/rtc/rtc-pcf2123.c
> @@ -411,14 +411,9 @@ static int pcf2123_probe(struct spi_device *spi)
>  			(spi->max_speed_hz + 500) / 1000);
>  
>  	/* Finalize the initialization */
> -	rtc = devm_rtc_device_register(&spi->dev, pcf2123_driver.driver.name,
> -			&pcf2123_rtc_ops, THIS_MODULE);
> -
> -	if (IS_ERR(rtc)) {
> -		dev_err(&spi->dev, "failed to register.\n");
> -		ret = PTR_ERR(rtc);
> -		goto kfree_exit;
> -	}
> +	rtc = devm_rtc_allocate_device(&spi->dev);
> +	if (IS_ERR(rtc))
> +		return PTR_ERR(rtc);
>  
>  	pdata->rtc = rtc;
>  
> @@ -438,7 +433,18 @@ static int pcf2123_probe(struct spi_device *spi)
>  	 * support to this driver to generate interrupts more than once
>  	 * per minute.
>  	 */
> -	pdata->rtc->uie_unsupported = 1;
> +	rtc->uie_unsupported = 1;
> +	rtc->ops = &pcf2123_rtc_ops;
> +
> +	ret = rtc_register_device(rtc);
> +	if (ret)
> +		return ret;
> +
> +	if (IS_ERR(rtc)) {
> +		dev_err(&spi->dev, "failed to register.\n");
> +		ret = PTR_ERR(rtc);
> +		goto kfree_exit;
> +	}
>  

I need to rework that part, I'll resend...

>  	return 0;
>  
> -- 
> 2.21.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
