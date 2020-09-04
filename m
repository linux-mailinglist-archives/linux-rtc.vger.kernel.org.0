Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 224E525DDEB
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Sep 2020 17:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgIDPjQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Sep 2020 11:39:16 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:56707 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgIDPjQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Sep 2020 11:39:16 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5FF9F60012;
        Fri,  4 Sep 2020 15:39:13 +0000 (UTC)
Date:   Fri, 4 Sep 2020 17:39:13 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 5/8] rtc: rx8010: don't use magic values for time buffer
 length
Message-ID: <20200904153913.GK230586@piout.net>
References: <20200904152116.2157-1-brgl@bgdev.pl>
 <20200904152116.2157-6-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904152116.2157-6-brgl@bgdev.pl>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/09/2020 17:21:13+0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The time buffer len is used directly in this driver. For readability
> it's better to define a constant.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/rtc/rtc-rx8010.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
> index 67ff06a76629..f3bed7be2533 100644
> --- a/drivers/rtc/rtc-rx8010.c
> +++ b/drivers/rtc/rtc-rx8010.c
> @@ -48,6 +48,8 @@
>  
>  #define RX8010_ALARM_AE		BIT(7)
>  
> +#define RX8010_TIME_BUF_LEN	7
> +
>  static const struct i2c_device_id rx8010_id[] = {
>  	{ "rx8010", 0 },
>  	{ }
> @@ -108,7 +110,7 @@ static irqreturn_t rx8010_irq_1_handler(int irq, void *dev_id)
>  static int rx8010_get_time(struct device *dev, struct rtc_time *dt)
>  {
>  	struct rx8010_data *rx8010 = dev_get_drvdata(dev);
> -	u8 date[7];

I'm usually fine with a magic value here...

> +	u8 date[RX8010_TIME_BUF_LEN];
>  	int flagreg, err;
>  
>  	flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
> @@ -121,8 +123,8 @@ static int rx8010_get_time(struct device *dev, struct rtc_time *dt)
>  	}
>  
>  	err = i2c_smbus_read_i2c_block_data(rx8010->client, RX8010_SEC,
> -					    7, date);
> -	if (err != 7)
> +					    RX8010_TIME_BUF_LEN, date);

..as long as sizeof(date) is used here.

Even better, you could have date[RX8010_YEAR - RX8010_SEC + 1] and then
use sizeof. Or also have #define RX8010_TIME_BUF_LEN (RX8010_YEAR -
RX8010_SEC + 1) which would be safer than 7.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
