Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 990FE3020DA
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Jan 2021 04:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbhAYDfZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 24 Jan 2021 22:35:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726630AbhAYDfY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 24 Jan 2021 22:35:24 -0500
Received: from smtp.gentoo.org (smtp.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87550C061574;
        Sun, 24 Jan 2021 19:34:44 -0800 (PST)
Subject: Re: [PATCH 05/14] rtc: ds1685: use rtc_lock/rtc_unlock
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210119220653.677750-1-alexandre.belloni@bootlin.com>
 <20210119220653.677750-5-alexandre.belloni@bootlin.com>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <62b9f5fb-acc0-0418-1e44-b6d0965784a4@gentoo.org>
Date:   Sun, 24 Jan 2021 22:33:57 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20210119220653.677750-5-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 1/19/2021 17:06, Alexandre Belloni wrote:
> Avoid accessing directly rtc->ops_lock and use the RTC core helpers.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-ds1685.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
> index d69c807af29b..75db7ab654a5 100644
> --- a/drivers/rtc/rtc-ds1685.c
> +++ b/drivers/rtc/rtc-ds1685.c
> @@ -658,7 +658,6 @@ ds1685_rtc_irq_handler(int irq, void *dev_id)
>  {
>  	struct platform_device *pdev = dev_id;
>  	struct ds1685_priv *rtc = platform_get_drvdata(pdev);
> -	struct mutex *rtc_mutex;
>  	u8 ctrlb, ctrlc;
>  	unsigned long events = 0;
>  	u8 num_irqs = 0;
> @@ -667,8 +666,7 @@ ds1685_rtc_irq_handler(int irq, void *dev_id)
>  	if (unlikely(!rtc))
>  		return IRQ_HANDLED;
>  
> -	rtc_mutex = &rtc->dev->ops_lock;
> -	mutex_lock(rtc_mutex);
> +	rtc_lock(rtc->dev);
>  
>  	/* Ctrlb holds the interrupt-enable bits and ctrlc the flag bits. */
>  	ctrlb = rtc->read(rtc, RTC_CTRL_B);
> @@ -713,7 +711,7 @@ ds1685_rtc_irq_handler(int irq, void *dev_id)
>  		}
>  	}
>  	rtc_update_irq(rtc->dev, num_irqs, events);
> -	mutex_unlock(rtc_mutex);
> +	rtc_unlock(rtc->dev);
>  
>  	return events ? IRQ_HANDLED : IRQ_NONE;
>  }
> 

Acked-by: Joshua Kinard <kumba@gentoo.org>

