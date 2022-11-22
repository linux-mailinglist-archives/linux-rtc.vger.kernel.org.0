Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D271A633E09
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Nov 2022 14:47:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233855AbiKVNrX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 22 Nov 2022 08:47:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbiKVNrX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 22 Nov 2022 08:47:23 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBF75E3EA
        for <linux-rtc@vger.kernel.org>; Tue, 22 Nov 2022 05:47:21 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 912FB240002;
        Tue, 22 Nov 2022 13:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1669124840;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=//TrGobn0H5PivFJxECTQEmUUrWbW5PP50WG/NO0nk8=;
        b=fPvMHNO8YgyH4K62k79MJoa+F9HGGYomgHPZ66DU6bDsFvMAGDvLBg4BCF3JDGxuiIcx/t
        rvGc/YS0Nvp/nvFvTlQDOXvkjoh5icQs1xqEvDBzGn8IYSb3zrCiW/W50MD9tjyhLnoe1h
        Hbtl0CULe65KCaKhTryhhs8TFE07d3MljYvZIljA1bJgYlwFQhDDVTSyxLHLYSfJloWCQ+
        qWkEi98a5d5W9JaQJE6knYgPb+JWI4KFYWnzck0CEAzN6/dKCt7BNUEpVt75vf4JCEcdgB
        2mWy95ZDaW/VqqxvbKjigZlZRL/LiK4/rDHMlU6mfE4HQLIGYhjWhpaGFivdKg==
Date:   Tue, 22 Nov 2022 14:47:20 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: pic32: Add error handling in pic32_rtc_probe()
Message-ID: <Y3zS6BryxxQJDcT0@mail.local>
References: <20221122121721.1647168-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122121721.1647168-1-cuigaosheng1@huawei.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 22/11/2022 20:17:21+0800, Gaosheng Cui wrote:
> The pic32_rtc_enable(pdata, 0) and clk_disable_unprepare(pdata->clk)
> should be called in the error handling of devm_rtc_allocate_device(),
> fix it.
> 
> Fixes: 6515e23b9fde ("rtc: pic32: convert to devm_rtc_allocate_device")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  drivers/rtc/rtc-pic32.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pic32.c b/drivers/rtc/rtc-pic32.c
> index 7fb9145c43bd..258136e3fe96 100644
> --- a/drivers/rtc/rtc-pic32.c
> +++ b/drivers/rtc/rtc-pic32.c
> @@ -331,8 +331,10 @@ static int pic32_rtc_probe(struct platform_device *pdev)
>  	device_init_wakeup(&pdev->dev, 1);
>  
>  	pdata->rtc = devm_rtc_allocate_device(&pdev->dev);

A better solution is to move this call earlier in .probe

> -	if (IS_ERR(pdata->rtc))
> -		return PTR_ERR(pdata->rtc);
> +	if (IS_ERR(pdata->rtc)) {
> +		ret = PTR_ERR(pdata->rtc);
> +		goto err_nortc;
> +	}
>  
>  	pdata->rtc->ops = &pic32_rtcops;
>  	pdata->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
