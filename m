Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9AB825DDFF
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Sep 2020 17:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgIDPlu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Sep 2020 11:41:50 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:3015 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgIDPlr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Sep 2020 11:41:47 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 98CE8240002;
        Fri,  4 Sep 2020 15:41:44 +0000 (UTC)
Date:   Fri, 4 Sep 2020 17:41:44 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 7/8] rtc: rx8010: fix indentation in probe()
Message-ID: <20200904154144.GL230586@piout.net>
References: <20200904152116.2157-1-brgl@bgdev.pl>
 <20200904152116.2157-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904152116.2157-8-brgl@bgdev.pl>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/09/2020 17:21:15+0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Align the arguments passed to devm_rtc_device_register() with the upper
> line.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/rtc/rtc-rx8010.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
> index 181fc21cefa8..ed8ba38b4991 100644
> --- a/drivers/rtc/rtc-rx8010.c
> +++ b/drivers/rtc/rtc-rx8010.c
> @@ -450,7 +450,7 @@ static int rx8010_probe(struct i2c_client *client,
>  	}
>  
>  	rx8010->rtc = devm_rtc_device_register(&client->dev, client->name,
> -		&rx8010_rtc_ops, THIS_MODULE);
> +					       &rx8010_rtc_ops, THIS_MODULE);
>  

You have bonus points if you replace that patch by switching from
devm_rtc_device_register to devm_rtc_allocate_device and
rtc_register_device.

More bonus points if you also set range_min and range_max and then get
rid of the range checking in set_time.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
