Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A621DFACA
	for <lists+linux-rtc@lfdr.de>; Sat, 23 May 2020 21:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbgEWTvM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 May 2020 15:51:12 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:58839 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727962AbgEWTvL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 23 May 2020 15:51:11 -0400
X-Originating-IP: 176.129.10.123
Received: from localhost (glg95-h02-176-129-10-123.dsl.sta.abo.bbox.fr [176.129.10.123])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 00CDC240006;
        Sat, 23 May 2020 19:51:09 +0000 (UTC)
Date:   Sat, 23 May 2020 21:51:09 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH 2/2] rtc: mpc5121: Fix return value of mpc5121_rtc_probe()
Message-ID: <20200523195109.GC3429@piout.net>
References: <1590227782-32249-1-git-send-email-yangtiezhu@loongson.cn>
 <1590227782-32249-2-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590227782-32249-2-git-send-email-yangtiezhu@loongson.cn>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/05/2020 17:56:22+0800, Tiezhu Yang wrote:
> When call function devm_platform_ioremap_resource(), we should use IS_ERR()
> to check the return value and return PTR_ERR() if failed.
> 

Same comment here.

> Fixes: d53d4ae981d0 ("rtc: mpc5121: simplify probe")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  drivers/rtc/rtc-mpc5121.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-mpc5121.c b/drivers/rtc/rtc-mpc5121.c
> index 3040844..5c2ce71 100644
> --- a/drivers/rtc/rtc-mpc5121.c
> +++ b/drivers/rtc/rtc-mpc5121.c
> @@ -316,7 +316,7 @@ static int mpc5121_rtc_probe(struct platform_device *op)
>  	rtc->regs = devm_platform_ioremap_resource(op, 0);
>  	if (IS_ERR(rtc->regs)) {
>  		dev_err(&op->dev, "%s: couldn't map io space\n", __func__);
> -		return -ENOSYS;
> +		return PTR_ERR(rtc->regs);
>  	}
>  
>  	device_init_wakeup(&op->dev, 1);
> -- 
> 2.1.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
