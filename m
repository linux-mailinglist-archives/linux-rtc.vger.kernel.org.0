Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C48E4184A6
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Sep 2021 23:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbhIYV1b (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 25 Sep 2021 17:27:31 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:56341 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbhIYV1a (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 25 Sep 2021 17:27:30 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 40AD3E0002;
        Sat, 25 Sep 2021 21:25:54 +0000 (UTC)
Date:   Sat, 25 Sep 2021 23:25:53 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Ramona Alexandra Nechita <ramona.nechita@analog.com>
Cc:     linux-rtc@vger.kernel.org, a.zummo@towertech.it,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Specified all the parts for DS1216
Message-ID: <YU+T4acHxHrbIcNQ@piout.net>
References: <20210915105309.17225-1-ramona.nechita@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915105309.17225-1-ramona.nechita@analog.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 15/09/2021 13:53:09+0300, Ramona Alexandra Nechita wrote:
> Included the parts supported in the description (B/C/D/E/F/H).
> 

I'm sorry, I don't get the point, those are all the ds1216 as seen on
https://www.maximintegrated.com/en/products/analog/real-time-clocks/DS1216.html
so DS1216 is probably enough anywere.

> Signed-off-by: Ramona Alexandra Nechita <ramona.nechita@analog.com>
> ---
>  drivers/rtc/Kconfig      | 2 +-
>  drivers/rtc/rtc-ds1216.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 1adf9f815652..0be9a34e75c8 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -966,7 +966,7 @@ config RTC_DRV_VRTC
>  	updates are done via IPC calls to the system controller FW.
>  
>  config RTC_DRV_DS1216
> -	tristate "Dallas DS1216"
> +	tristate "Dallas DS1216B/C/D/E/F/H"
>  	depends on SNI_RM
>  	help
>  	  If you say yes here you get support for the Dallas DS1216 RTC chips.
> diff --git a/drivers/rtc/rtc-ds1216.c b/drivers/rtc/rtc-ds1216.c
> index b225bcfef50b..ea276260d962 100644
> --- a/drivers/rtc/rtc-ds1216.c
> +++ b/drivers/rtc/rtc-ds1216.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Dallas DS1216 RTC driver
> + * Dallas DS1216B/C/D/E/F/H RTC driver
>   *
>   * Copyright (c) 2007 Thomas Bogendoerfer
>   *
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
