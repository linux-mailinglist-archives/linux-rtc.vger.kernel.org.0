Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07DCE2B70E0
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Nov 2020 22:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbgKQVXY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Nov 2020 16:23:24 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:49853 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgKQVXX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Nov 2020 16:23:23 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D5D05FF802;
        Tue, 17 Nov 2020 21:23:21 +0000 (UTC)
Date:   Tue, 17 Nov 2020 22:23:21 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 2/8] Revert "rtc: sc27xx: Always read normal alarm when
 registering RTC device"
Message-ID: <20201117212321.GX4556@piout.net>
References: <20201109163409.24301-1-brgl@bgdev.pl>
 <20201109163409.24301-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109163409.24301-3-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/11/2020 17:34:03+0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This reverts commit 3822d1bb0df18aa28930f19bc46e0704aea1be0f.
> 
> The registered field in struct rtc_device is not supposed to be used by
> drivers and is going to be removed soon. In this function it will be
> always 0 so the check is useless anyway.

This is actually the opposite, rtc->rtc->registered being always 0 means
that the auxiliary alarm will never be read. I've sent the proper patch.

> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/rtc/rtc-sc27xx.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-sc27xx.c b/drivers/rtc/rtc-sc27xx.c
> index 36810dd40cd3..8e3d6be990c5 100644
> --- a/drivers/rtc/rtc-sc27xx.c
> +++ b/drivers/rtc/rtc-sc27xx.c
> @@ -415,14 +415,10 @@ static int sprd_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  	u32 val;
>  
>  	/*
> -	 * Before RTC device is registered, it will check to see if there is an
> -	 * alarm already set in RTC hardware, and we always read the normal
> -	 * alarm at this time.
> -	 *
> -	 * Or if aie_timer is enabled, we should get the normal alarm time.
> +	 * If aie_timer is enabled, we should get the normal alarm time.
>  	 * Otherwise we should get auxiliary alarm time.
>  	 */
> -	if (rtc->rtc && rtc->rtc->registered && rtc->rtc->aie_timer.enabled == 0)
> +	if (rtc->rtc && rtc->rtc->aie_timer.enabled == 0)
>  		return sprd_rtc_read_aux_alarm(dev, alrm);
>  
>  	ret = sprd_rtc_get_secs(rtc, SPRD_RTC_ALARM, &secs);
> -- 
> 2.29.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
