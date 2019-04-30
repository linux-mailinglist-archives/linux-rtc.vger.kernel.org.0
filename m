Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D567F577
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 13:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbfD3LZr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 07:25:47 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:58371 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726129AbfD3LZr (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 30 Apr 2019 07:25:47 -0400
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id C72FE44028D;
        Tue, 30 Apr 2019 14:25:43 +0300 (IDT)
References: <20190430093212.28425-1-alexandre.belloni@bootlin.com>
User-agent: mu4e 1.0; emacs 26.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] rtc: digicolor: fix possible race condition
In-reply-to: <20190430093212.28425-1-alexandre.belloni@bootlin.com>
Date:   Tue, 30 Apr 2019 14:25:43 +0300
Message-ID: <878svru43s.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On Tue, Apr 30 2019, Alexandre Belloni wrote:
> The IRQ is requested before the struct rtc is allocated and registered, but
> this struct is used in the IRQ handler. This may lead to a NULL pointer
> dereference.
>
> Switch to devm_rtc_allocate_device/rtc_register_device to allocate the rtc
> struct before requesting the IRQ.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Baruch Siach <baruch@tkos.co.il>

baruch

> ---
>  drivers/rtc/rtc-digicolor.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/rtc/rtc-digicolor.c b/drivers/rtc/rtc-digicolor.c
> index b253bf1b3531..5bb14c56bc9a 100644
> --- a/drivers/rtc/rtc-digicolor.c
> +++ b/drivers/rtc/rtc-digicolor.c
> @@ -192,6 +192,10 @@ static int __init dc_rtc_probe(struct platform_device *pdev)
>  	if (IS_ERR(rtc->regs))
>  		return PTR_ERR(rtc->regs);
>  
> +	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(rtc->rtc_dev))
> +		return PTR_ERR(rtc->rtc_dev);
> +
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
> @@ -200,12 +204,10 @@ static int __init dc_rtc_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	platform_set_drvdata(pdev, rtc);
> -	rtc->rtc_dev = devm_rtc_device_register(&pdev->dev, pdev->name,
> -						&dc_rtc_ops, THIS_MODULE);
> -	if (IS_ERR(rtc->rtc_dev))
> -		return PTR_ERR(rtc->rtc_dev);
>  
> -	return 0;
> +	rtc->rtc_dev->ops = &dc_rtc_ops;
> +
> +	return rtc_register_device(rtc->rtc_dev);
>  }
>  
>  static const struct of_device_id dc_dt_ids[] = {


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
