Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D69D4355452
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Apr 2021 14:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243400AbhDFMzv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 6 Apr 2021 08:55:51 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:36472 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243382AbhDFMzu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 6 Apr 2021 08:55:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617713742; x=1649249742;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=N/4f2546iodJQOZLG1ZCIU8Qga5gaWd9MkNRYugDGrU=;
  b=LQ2H/RKoGtCucBy8tc4YPjjqahvUTMoLGFDs3rUrA/WWDzbEYly2QFBL
   Q3myFW47tO+/KMhjLy+cKvyYMbDlY1LW5EXGpWbpIUxmcQW0zMMcFi4dP
   ToYl8sktBBUfQ/yj9zYBGWPzTrYd0Xg8HbE6PyRjeoNj64B+QtqomT0An
   eoStc44VOZzmxJCLqkDt6xnW2C0kXmrPGt7FbD6N391KydFjBs/VzxBa8
   Js10pSv0REnnGnDSBp2cs+rzdVDnpkQXJ/W/2VL/Ztsqidt3IxDGD2UzF
   up6crPLYNDUqZ+1rXgIMfW49wkAKaKLBC9FT13YAM9Xzj8E3KcuUbPBvL
   g==;
IronPort-SDR: hGU0ApbNK2WitOMYcbFP76HcU2Lb4otIIK4jZEscz7qsBbSaFj24kNInd0ZMxhEEvcf3FxdclY
 t0Aqzxa2R8PUEHsNRUL1uRtf6pfMRBcyWOyyXF4EKNVb/zW3kpIK3kYmkOxfDAO5t7pqqa1ogH
 CEsBJy/MNi6ZfqD19CHG8qBjkAQaWdhnBXb/vIV14dC4NXj/oVEKmVTL2O7semFRrPqUWWIP1I
 oKxEfV87I5uGR3asRZnEp/A2kAVEjNHL/50XDxERu/wchfo3916F5yaRzUMiDgOhgCU8JZh3qa
 AzA=
X-IronPort-AV: E=Sophos;i="5.81,309,1610434800"; 
   d="scan'208";a="121946896"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Apr 2021 05:55:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 6 Apr 2021 05:55:41 -0700
Received: from [10.12.73.192] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 6 Apr 2021 05:55:39 -0700
Subject: Re: [PATCH v4 4/6] rtc: at91sma9: Simplify using
 devm_clk_get_enabled()
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
CC:     <linux-clk@vger.kernel.org>, <kernel@pengutronix.de>,
        <linux-rtc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20210330181755.204339-1-u.kleine-koenig@pengutronix.de>
 <20210330181755.204339-5-u.kleine-koenig@pengutronix.de>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <cacffd33-0df6-9c96-78bf-8313821daaee@microchip.com>
Date:   Tue, 6 Apr 2021 14:55:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210330181755.204339-5-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/03/2021 at 20:17, Uwe Kleine-König wrote:
> devm_clk_get_enabled() returns the clk already (prepared and) enabled
> and the automatically called cleanup cares for disabling (and
> unpreparing). So simplify .probe() and .remove() accordingly.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

I do see the benefit:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Uwe for taking these drivers as examples! Best regards,
   Nicolas

> ---
>   drivers/rtc/rtc-at91sam9.c | 22 ++++------------------
>   1 file changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
> index 2216be429ab7..b52e7bd26303 100644
> --- a/drivers/rtc/rtc-at91sam9.c
> +++ b/drivers/rtc/rtc-at91sam9.c
> @@ -374,21 +374,14 @@ static int at91_rtc_probe(struct platform_device *pdev)
>                  return -ENOMEM;
>          }
> 
> -       rtc->sclk = devm_clk_get(&pdev->dev, NULL);
> +       rtc->sclk = devm_clk_get_enabled(&pdev->dev, NULL);
>          if (IS_ERR(rtc->sclk))
>                  return PTR_ERR(rtc->sclk);
> 
> -       ret = clk_prepare_enable(rtc->sclk);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Could not enable slow clock\n");
> -               return ret;
> -       }
> -
>          sclk_rate = clk_get_rate(rtc->sclk);
>          if (!sclk_rate || sclk_rate > AT91_RTT_RTPRES) {
>                  dev_err(&pdev->dev, "Invalid slow clock rate\n");
> -               ret = -EINVAL;
> -               goto err_clk;
> +               return -EINVAL;
>          }
> 
>          mr = rtt_readl(rtc, MR);
> @@ -406,7 +399,7 @@ static int at91_rtc_probe(struct platform_device *pdev)
>          rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
>          if (IS_ERR(rtc->rtcdev)) {
>                  ret = PTR_ERR(rtc->rtcdev);
> -               goto err_clk;
> +               return ret;
>          }
> 
>          rtc->rtcdev->ops = &at91_rtc_ops;
> @@ -418,7 +411,7 @@ static int at91_rtc_probe(struct platform_device *pdev)
>                                 dev_name(&rtc->rtcdev->dev), rtc);
>          if (ret) {
>                  dev_dbg(&pdev->dev, "can't share IRQ %d?\n", rtc->irq);
> -               goto err_clk;
> +               return ret;
>          }
> 
>          /* NOTE:  sam9260 rev A silicon has a ROM bug which resets the
> @@ -432,11 +425,6 @@ static int at91_rtc_probe(struct platform_device *pdev)
>                           dev_name(&rtc->rtcdev->dev));
> 
>          return devm_rtc_register_device(rtc->rtcdev);
> -
> -err_clk:
> -       clk_disable_unprepare(rtc->sclk);
> -
> -       return ret;
>   }
> 
>   /*
> @@ -450,8 +438,6 @@ static int at91_rtc_remove(struct platform_device *pdev)
>          /* disable all interrupts */
>          rtt_writel(rtc, MR, mr & ~(AT91_RTT_ALMIEN | AT91_RTT_RTTINCIEN));
> 
> -       clk_disable_unprepare(rtc->sclk);
> -
>          return 0;
>   }
> 
> --
> 2.30.2
> 


-- 
Nicolas Ferre
