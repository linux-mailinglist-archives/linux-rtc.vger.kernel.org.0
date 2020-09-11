Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96ECE26678E
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Sep 2020 19:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbgIKRox (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Sep 2020 13:44:53 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:9337 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgIKMd7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 11 Sep 2020 08:33:59 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1CA5B240010;
        Fri, 11 Sep 2020 12:33:45 +0000 (UTC)
Date:   Fri, 11 Sep 2020 14:33:45 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 09/11] rtc: rx8010: switch to using the preferred RTC
 API
Message-ID: <20200911123345.GD230586@piout.net>
References: <20200910130446.5689-1-brgl@bgdev.pl>
 <20200910130446.5689-10-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910130446.5689-10-brgl@bgdev.pl>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/09/2020 15:04:44+0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Use devm_rtc_allocate_device() + rtc_register_device() instead of the
> deprecated devm_rtc_device_register().
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/rtc/rtc-rx8010.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
> index 0665878e8843..bb6578aad972 100644
> --- a/drivers/rtc/rtc-rx8010.c
> +++ b/drivers/rtc/rtc-rx8010.c
> @@ -447,16 +447,21 @@ static int rx8010_probe(struct i2c_client *client,
>  		}
>  	}
>  
> -	rx8010->rtc = devm_rtc_device_register(dev, client->name,
> -		&rx8010_rtc_ops, THIS_MODULE);
> -
> +	rx8010->rtc = devm_rtc_allocate_device(dev);
>  	if (IS_ERR(rx8010->rtc)) {
> -		dev_err(dev, "unable to register the class device\n");
> +		dev_err(dev, "unable to allocate rtc device\n");
>  		return PTR_ERR(rx8010->rtc);
>  	}
>  
> +	rx8010->rtc->ops = &rx8010_rtc_ops;
>  	rx8010->rtc->max_user_freq = 1;
>  
> +	err = rtc_register_device(rx8010->rtc);
> +	if (err) {
> +		dev_err(dev, "unable to register the class device\n");

There is no path were this would fail silently so I prefer cutting down
on the number of strings in the drivers. So you can just:

	return rtc_register_device(rx8010->rtc);

> +		return err;
> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.26.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
