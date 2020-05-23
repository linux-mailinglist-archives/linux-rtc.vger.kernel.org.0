Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7301DFAC5
	for <lists+linux-rtc@lfdr.de>; Sat, 23 May 2020 21:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387924AbgEWTuM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 May 2020 15:50:12 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:30821 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387916AbgEWTuL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 23 May 2020 15:50:11 -0400
X-Originating-IP: 176.129.10.123
Received: from localhost (glg95-h02-176-129-10-123.dsl.sta.abo.bbox.fr [176.129.10.123])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5EEA7240006;
        Sat, 23 May 2020 19:50:08 +0000 (UTC)
Date:   Sat, 23 May 2020 21:50:06 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH 1/2] rtc: goldfish: Fix return value of
 goldfish_rtc_probe()
Message-ID: <20200523195006.GB3429@piout.net>
References: <1590227782-32249-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590227782-32249-1-git-send-email-yangtiezhu@loongson.cn>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 23/05/2020 17:56:21+0800, Tiezhu Yang wrote:
> When call function devm_platform_ioremap_resource(), we should use IS_ERR()
> to check the return value and return PTR_ERR() if failed.
> 
> Fixes: 89576bebbc17 ("rtc: Use devm_platform_ioremap_resource()")

This doesn't fix an issue and it was anyway not introduced by that
commit. Please correct your commit message and subject.

> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  drivers/rtc/rtc-goldfish.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-goldfish.c b/drivers/rtc/rtc-goldfish.c
> index cb6b0ad..2779715 100644
> --- a/drivers/rtc/rtc-goldfish.c
> +++ b/drivers/rtc/rtc-goldfish.c
> @@ -174,7 +174,7 @@ static int goldfish_rtc_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, rtcdrv);
>  	rtcdrv->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(rtcdrv->base))
> -		return -ENODEV;
> +		return PTR_ERR(rtcdrv->base);
>  
>  	rtcdrv->irq = platform_get_irq(pdev, 0);
>  	if (rtcdrv->irq < 0)
> -- 
> 2.1.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
