Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D509C30BD38
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Feb 2021 12:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbhBBLex (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 2 Feb 2021 06:34:53 -0500
Received: from guitar.tcltek.co.il ([192.115.133.116]:34438 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231336AbhBBLcw (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 2 Feb 2021 06:32:52 -0500
Received: from tarshish (unknown [10.0.8.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 9820D440DBB;
        Tue,  2 Feb 2021 13:32:04 +0200 (IST)
References: <20210202112219.3610853-1-alexandre.belloni@bootlin.com>
 <20210202112219.3610853-6-alexandre.belloni@bootlin.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/21] rtc: digicolor: quiet maybe-unused variable warning
In-reply-to: <20210202112219.3610853-6-alexandre.belloni@bootlin.com>
Date:   Tue, 02 Feb 2021 13:32:01 +0200
Message-ID: <874kiuemdq.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alex,

On Tue, Feb 02 2021, Alexandre Belloni wrote:

> When CONFIG_OF is disabled then the matching table is not referenced.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  drivers/rtc/rtc-digicolor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/rtc-digicolor.c b/drivers/rtc/rtc-digicolor.c
> index 4fdfa5b6feb2..218a6de19247 100644
> --- a/drivers/rtc/rtc-digicolor.c
> +++ b/drivers/rtc/rtc-digicolor.c
> @@ -205,7 +205,7 @@ static int __init dc_rtc_probe(struct platform_device *pdev)
>  	return devm_rtc_register_device(rtc->rtc_dev);
>  }
>  
> -static const struct of_device_id dc_dt_ids[] = {
> +static const __maybe_unused struct of_device_id dc_dt_ids[] = {
>  	{ .compatible = "cnxt,cx92755-rtc" },
>  	{ /* sentinel */ }
>  };


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
