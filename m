Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3448D367BA8
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Apr 2021 10:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235075AbhDVICk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Apr 2021 04:02:40 -0400
Received: from mail.thorsis.com ([92.198.35.195]:45329 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235118AbhDVIC3 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 22 Apr 2021 04:02:29 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id D9F645F8;
        Thu, 22 Apr 2021 10:01:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id YoktKLPb1cJD; Thu, 22 Apr 2021 10:01:47 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id BA3FC3267; Thu, 22 Apr 2021 10:01:47 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
X-Spam-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        * -0.0 NO_RELAYS Informational: message was not relayed via SMTP
        *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: infradead.org]
        * -0.0 NO_RECEIVED Informational: message has no Received headers
Date:   Thu, 22 Apr 2021 10:01:25 +0200
From:   Alexander Dahl <ada@thorsis.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 4/6] rtc: at91sma9: Simplify using
 devm_clk_get_enabled()
Message-ID: <YIEtVVE8ZdwbTTgM@ada-deb-carambola.ifak-system.com>
Mail-Followup-To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, linux-rtc@vger.kernel.org
References: <20210422065726.1646742-1-u.kleine-koenig@pengutronix.de>
 <20210422065726.1646742-5-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210422065726.1646742-5-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Uwe,

I think there's a typo in the subject.  It should be sam9 instead of
sma9, right?

Greets
Alex

Am Thu, Apr 22, 2021 at 08:57:24AM +0200 schrieb Uwe Kleine-König:
> devm_clk_get_enabled() returns the clk already (prepared and) enabled
> and the automatically called cleanup cares for disabling (and
> unpreparing). So simplify .probe() and .remove() accordingly.
> 
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/rtc/rtc-at91sam9.c | 22 ++++------------------
>  1 file changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
> index 2216be429ab7..b52e7bd26303 100644
> --- a/drivers/rtc/rtc-at91sam9.c
> +++ b/drivers/rtc/rtc-at91sam9.c
> @@ -374,21 +374,14 @@ static int at91_rtc_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>  
> -	rtc->sclk = devm_clk_get(&pdev->dev, NULL);
> +	rtc->sclk = devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(rtc->sclk))
>  		return PTR_ERR(rtc->sclk);
>  
> -	ret = clk_prepare_enable(rtc->sclk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Could not enable slow clock\n");
> -		return ret;
> -	}
> -
>  	sclk_rate = clk_get_rate(rtc->sclk);
>  	if (!sclk_rate || sclk_rate > AT91_RTT_RTPRES) {
>  		dev_err(&pdev->dev, "Invalid slow clock rate\n");
> -		ret = -EINVAL;
> -		goto err_clk;
> +		return -EINVAL;
>  	}
>  
>  	mr = rtt_readl(rtc, MR);
> @@ -406,7 +399,7 @@ static int at91_rtc_probe(struct platform_device *pdev)
>  	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
>  	if (IS_ERR(rtc->rtcdev)) {
>  		ret = PTR_ERR(rtc->rtcdev);
> -		goto err_clk;
> +		return ret;
>  	}
>  
>  	rtc->rtcdev->ops = &at91_rtc_ops;
> @@ -418,7 +411,7 @@ static int at91_rtc_probe(struct platform_device *pdev)
>  			       dev_name(&rtc->rtcdev->dev), rtc);
>  	if (ret) {
>  		dev_dbg(&pdev->dev, "can't share IRQ %d?\n", rtc->irq);
> -		goto err_clk;
> +		return ret;
>  	}
>  
>  	/* NOTE:  sam9260 rev A silicon has a ROM bug which resets the
> @@ -432,11 +425,6 @@ static int at91_rtc_probe(struct platform_device *pdev)
>  			 dev_name(&rtc->rtcdev->dev));
>  
>  	return devm_rtc_register_device(rtc->rtcdev);
> -
> -err_clk:
> -	clk_disable_unprepare(rtc->sclk);
> -
> -	return ret;
>  }
>  
>  /*
> @@ -450,8 +438,6 @@ static int at91_rtc_remove(struct platform_device *pdev)
>  	/* disable all interrupts */
>  	rtt_writel(rtc, MR, mr & ~(AT91_RTT_ALMIEN | AT91_RTT_RTTINCIEN));
>  
> -	clk_disable_unprepare(rtc->sclk);
> -
>  	return 0;
>  }
>  
> -- 
> 2.30.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
