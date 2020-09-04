Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0DCA25DDC9
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Sep 2020 17:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgIDPcd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Sep 2020 11:32:33 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:39809 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbgIDPcb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Sep 2020 11:32:31 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 741A91BF20C;
        Fri,  4 Sep 2020 15:32:29 +0000 (UTC)
Date:   Fri, 4 Sep 2020 17:32:29 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 1/8] rtc: rx8010: remove unnecessary parentheses
Message-ID: <20200904153229.GJ230586@piout.net>
References: <20200904152116.2157-1-brgl@bgdev.pl>
 <20200904152116.2157-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904152116.2157-2-brgl@bgdev.pl>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/09/2020 17:21:09+0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Remove parentheses whenever they guard a single line.

Those would be braces or curly brackets, not parentheses ;)

> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/rtc/rtc-rx8010.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
> index fe010151ec8f..2faf5357a3a5 100644
> --- a/drivers/rtc/rtc-rx8010.c
> +++ b/drivers/rtc/rtc-rx8010.c
> @@ -181,9 +181,8 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
>  		return ret;
>  
>  	flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
> -	if (flagreg < 0) {
> +	if (flagreg < 0)
>  		return flagreg;
> -	}
>  
>  	if (flagreg & RX8010_FLAG_VLF)
>  		ret = i2c_smbus_write_byte_data(rx8010->client, RX8010_FLAG,
> @@ -284,17 +283,15 @@ static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
>  	int err;
>  
>  	flagreg = i2c_smbus_read_byte_data(client, RX8010_FLAG);
> -	if (flagreg < 0) {
> +	if (flagreg < 0)
>  		return flagreg;
> -	}
>  
>  	if (rx8010->ctrlreg & (RX8010_CTRL_AIE | RX8010_CTRL_UIE)) {
>  		rx8010->ctrlreg &= ~(RX8010_CTRL_AIE | RX8010_CTRL_UIE);
>  		err = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
>  						rx8010->ctrlreg);
> -		if (err < 0) {
> +		if (err < 0)
>  			return err;
> -		}
>  	}
>  
>  	flagreg &= ~RX8010_FLAG_AF;
> -- 
> 2.26.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
