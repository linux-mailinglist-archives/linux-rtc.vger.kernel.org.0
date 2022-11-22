Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB7D8633E00
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Nov 2022 14:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbiKVNpQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 22 Nov 2022 08:45:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbiKVNpP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 22 Nov 2022 08:45:15 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EAD359FF1
        for <linux-rtc@vger.kernel.org>; Tue, 22 Nov 2022 05:45:14 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id DD7151BF20C;
        Tue, 22 Nov 2022 13:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1669124713;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4/zvmVkIjakCyfdAi4wAkE5jMdoJxa8ZztwxunheeDU=;
        b=BVMsnt3KxZ8Lz/W8GQwC1n34D4/Btx0ZVqxChfaahKVphifHCnLNbtr7o0TyzekUhu6MUj
        8GFwpbK3YEi9jGX2m7HXrGSF4JRukANlfj+BOAagjTFCMWM1CrOYr4c2BZ7tjygqHJNC/7
        ycrOdb/C1VfpFKi/32Cv65Gt3uHMr/Gqw84Wwu3Bbu4fc0T5KCtC+UBBo1aFE5e8B64dmT
        apl6yp+TcTuqKUmmt77N0AQSP6thGL8LxqWF4oBkacgNV57y7YczO3VXDs6vz/I7X7iYRm
        2YAUnHD1kMVAt9L4/x56vY93jGbE2ZTRygwzHVN+tRKKOSQ/cNuJOYiQ1h3Xbg==
Date:   Tue, 22 Nov 2022 14:45:11 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     patrice.chotard@foss.st.com, a.zummo@towertech.it,
        lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: st-lpc: Add missing clk_disable_unprepare in
 st_rtc_probe()
Message-ID: <Y3zSZ3ixpiEnsow1@mail.local>
References: <20221122121907.1648044-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122121907.1648044-1-cuigaosheng1@huawei.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 22/11/2022 20:19:07+0800, Gaosheng Cui wrote:
> The clk_get_rate() should be called in the error handling of
> clk_get_rate(), fix it.
> 

This is not what the patch does

> Fixes: b5b2bdfc2893 ("rtc: st: Add new driver for ST's LPC RTC")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  drivers/rtc/rtc-st-lpc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/rtc-st-lpc.c b/drivers/rtc/rtc-st-lpc.c
> index bdb20f63254e..0f8e4231098e 100644
> --- a/drivers/rtc/rtc-st-lpc.c
> +++ b/drivers/rtc/rtc-st-lpc.c
> @@ -238,6 +238,7 @@ static int st_rtc_probe(struct platform_device *pdev)
>  
>  	rtc->clkrate = clk_get_rate(rtc->clk);
>  	if (!rtc->clkrate) {
> +		clk_disable_unprepare(rtc->clk);
>  		dev_err(&pdev->dev, "Unable to fetch clock rate\n");
>  		return -EINVAL;
>  	}
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
