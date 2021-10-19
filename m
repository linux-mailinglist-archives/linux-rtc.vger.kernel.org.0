Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67DE6433BF9
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Oct 2021 18:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhJSQWo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Oct 2021 12:22:44 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:55187 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhJSQWo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Oct 2021 12:22:44 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A74DA1BF20F;
        Tue, 19 Oct 2021 16:20:29 +0000 (UTC)
Date:   Tue, 19 Oct 2021 18:20:29 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] rtc: s3c: Add time range
Message-ID: <YW7wTY5VOsPMAT3v@piout.net>
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-3-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019131724.3109-3-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 19/10/2021 16:17:22+0300, Sam Protsenko wrote:
> This RTC driver only accepts dates from 2000 to 2099 year. It starts
> counting from 2000 to avoid Y2K problem, and S3C RTC only supports 100
> years range. Provide this info to RTC framework.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/rtc/rtc-s3c.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 10e591794276..d9994efd70ef 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -454,6 +454,8 @@ static int s3c_rtc_probe(struct platform_device *pdev)
>  	}
>  
>  	info->rtc->ops = &s3c_rtcops;
> +	info->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
> +	info->rtc->range_max = RTC_TIMESTAMP_END_2099;
>  

This change is missing the if (year < 0 || year >= 100)  removal in
s3c_rtc_settime()

>  	ret = devm_rtc_register_device(info->rtc);
>  	if (ret)
> -- 
> 2.30.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
