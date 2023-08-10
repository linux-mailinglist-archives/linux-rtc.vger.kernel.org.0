Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 775D67772A2
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Aug 2023 10:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234109AbjHJIRV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Aug 2023 04:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232701AbjHJIRU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Aug 2023 04:17:20 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8303AED
        for <linux-rtc@vger.kernel.org>; Thu, 10 Aug 2023 01:17:19 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 033541BF204;
        Thu, 10 Aug 2023 08:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1691655438;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HCmrD7r0A+Ek1eVgzKteA6Tm7NzImOg1cvgSKQDstWM=;
        b=ZVoge4oD8nVqI5OgIWf5ehYAJ2hSBTrKiCnpPLm2pZ+mQ7Jn9H8M7CaVbOcodkpnK6t9hi
        CCM6OSjV54ME+hTrxyKwx0kV7+AmqTVJYOeCkw9Cu2yvHIrltaYZA90omTjiJcMYBip5DA
        6kVvokItcMOPTGO6YYN1+Zo0vI0P4dTO7yzFNjPZjQ30ASL+Y/M55SxU+Y8XY41Y3jtEbz
        TWIDmkwxm7YTCsnNrw56sREV+gxBHozW+b/BJ3H/ZTZlt4mXC1YUKtW408wlm027rdaoCx
        PcWoPgA8GKZZIjWaT87BOlt/Ri6h7pNahFth4dHN1MENJzz94C5UUVjXqzmMnw==
Date:   Thu, 10 Aug 2023 10:17:17 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Yuanjun Gong <ruc_gongyuanjun@163.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/1] rtc: use devm_clk_get_enabled() in mv_rtc_probe()
Message-ID: <202308100817171950180f@mail.local>
References: <20230720140814.33301-1-ruc_gongyuanjun@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720140814.33301-1-ruc_gongyuanjun@163.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 20/07/2023 22:08:14+0800, Yuanjun Gong wrote:
> in mv_rtc_probe(), the return value of function
> clk_prepare_enable() should be checked, since it may fail.
> using devm_clk_get_enabled() instead of devm_clk_get() and
> clk_prepare_enable() can avoid this problem.
> 
> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
> ---
>  drivers/rtc/rtc-mv.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-mv.c b/drivers/rtc/rtc-mv.c
> index 6c526e2ec56d..8cd33721be03 100644
> --- a/drivers/rtc/rtc-mv.c
> +++ b/drivers/rtc/rtc-mv.c
> @@ -219,17 +219,16 @@ static int __init mv_rtc_probe(struct platform_device *pdev)
>  	if (IS_ERR(pdata->ioaddr))
>  		return PTR_ERR(pdata->ioaddr);
>  
> -	pdata->clk = devm_clk_get(&pdev->dev, NULL);
> +	pdata->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  	/* Not all SoCs require a clock.*/
> -	if (!IS_ERR(pdata->clk))
> -		clk_prepare_enable(pdata->clk);
> +	if (IS_ERR(pdata->clk))
> +		return PTR_ERR(pdata->clk);

Look at the comment, "Not all SoCs require a clock.", you are breaking
the driver for multiple platforms.

>  
>  	/* make sure the 24 hour mode is enabled */
>  	rtc_time = readl(pdata->ioaddr + RTC_TIME_REG_OFFS);
>  	if (rtc_time & RTC_HOURS_12H_MODE) {
>  		dev_err(&pdev->dev, "12 Hour mode is enabled but not supported.\n");
> -		ret = -EINVAL;
> -		goto out;
> +		return -EINVAL;
>  	}
>  
>  	/* make sure it is actually functional */
> @@ -238,8 +237,7 @@ static int __init mv_rtc_probe(struct platform_device *pdev)
>  		rtc_time = readl(pdata->ioaddr + RTC_TIME_REG_OFFS);
>  		if (rtc_time == 0x01000000) {
>  			dev_err(&pdev->dev, "internal RTC not ticking\n");
> -			ret = -ENODEV;
> -			goto out;
> +			return -ENODEV;
>  		}
>  	}
>  
> @@ -249,8 +247,7 @@ static int __init mv_rtc_probe(struct platform_device *pdev)
>  
>  	pdata->rtc = devm_rtc_allocate_device(&pdev->dev);
>  	if (IS_ERR(pdata->rtc)) {
> -		ret = PTR_ERR(pdata->rtc);
> -		goto out;
> +		return PTR_ERR(pdata->rtc);
>  	}
>  
>  	if (pdata->irq >= 0) {
> @@ -275,11 +272,6 @@ static int __init mv_rtc_probe(struct platform_device *pdev)
>  	ret = devm_rtc_register_device(pdata->rtc);
>  	if (!ret)
>  		return 0;
> -out:
> -	if (!IS_ERR(pdata->clk))
> -		clk_disable_unprepare(pdata->clk);
> -
> -	return ret;
>  }
>  
>  static int __exit mv_rtc_remove(struct platform_device *pdev)
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
