Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B18D374703
	for <lists+linux-rtc@lfdr.de>; Wed,  5 May 2021 19:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234117AbhEERhf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 5 May 2021 13:37:35 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:50489 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237973AbhEERfe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 5 May 2021 13:35:34 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id F23E01BF203;
        Wed,  5 May 2021 17:34:31 +0000 (UTC)
Date:   Wed, 5 May 2021 19:34:30 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Martin Kaiser <martin@kaiser.cx>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtc: imxdi: add wakeup support
Message-ID: <YJLXJgiMw6u4+rtF@piout.net>
References: <20210430093210.7034-1-martin@kaiser.cx>
 <20210505163009.14252-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505163009.14252-1-martin@kaiser.cx>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 05/05/2021 18:30:09+0200, Martin Kaiser wrote:
> The DryIce-based RTC supports alarms that trigger an interrupt.
> 
> Add an option to configure this interrupt as a wakeup source that wakes the
> system up from standby mode.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> v2:
>  - unconditionally declare rtc-imxdi as wakeup source
>  - use dev_pm_set_wake_irq instead of manually coding suspend and resume
> 
> simple test (no need to configure the wakeup source via sysfs any more)
> 
>    [root@board ]# rtcwake -s 3 -m mem
>    wakeup from "mem" at Fri Apr 30 09:23:52 2021
>    ...
>    [root@board ]#
> 
>  drivers/rtc/rtc-imxdi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-imxdi.c b/drivers/rtc/rtc-imxdi.c
> index c1806f4d68e7..4b712e5ab08a 100644
> --- a/drivers/rtc/rtc-imxdi.c
> +++ b/drivers/rtc/rtc-imxdi.c
> @@ -24,6 +24,7 @@
>  #include <linux/delay.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_wakeirq.h>
>  #include <linux/rtc.h>
>  #include <linux/sched.h>
>  #include <linux/spinlock.h>
> @@ -811,6 +812,9 @@ static int __init dryice_rtc_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, imxdi);
>  
> +	device_init_wakeup(&pdev->dev, true);
> +	dev_pm_set_wake_irq(&pdev->dev, norm_irq);
> +

That's nice and concise ;) I'll apply that once -rc1 is released


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
