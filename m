Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A531E7833
	for <lists+linux-rtc@lfdr.de>; Fri, 29 May 2020 10:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725562AbgE2IXh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 May 2020 04:23:37 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:42059 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgE2IXh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 29 May 2020 04:23:37 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0556FFF819;
        Fri, 29 May 2020 08:23:34 +0000 (UTC)
Date:   Fri, 29 May 2020 10:23:34 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Ran Wang <ran.wang_1@nxp.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>, Li Biwen <biwen.li@nxp.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: fsl-ftm-alarm: fix freeze(s2idle) doesnot wake
Message-ID: <20200529082334.GY3972@piout.net>
References: <20200529061035.18912-1-ran.wang_1@nxp.com>
 <20200529061035.18912-2-ran.wang_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529061035.18912-2-ran.wang_1@nxp.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 29/05/2020 14:10:35+0800, Ran Wang wrote:
> Use dev_pm_set_wake_irq() instead of flag IRQF_NO_SUSPEND to enable
> wakeup system feature for both freeze(s2idle) and mem(deep).
> 
> Use property 'wakeup-source' to control this feature.
> 
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
>  drivers/rtc/rtc-fsl-ftm-alarm.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
> index 756af62..c6945d84 100644
> --- a/drivers/rtc/rtc-fsl-ftm-alarm.c
> +++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
> @@ -21,6 +21,7 @@
>  #include <linux/rtc.h>
>  #include <linux/time.h>
>  #include <linux/acpi.h>
> +#include <linux/pm_wakeirq.h>
>  
>  #define FTM_SC_CLK(c)		((c) << FTM_SC_CLK_MASK_SHIFT)
>  
> @@ -41,6 +42,7 @@ struct ftm_rtc {
>  	struct rtc_device *rtc_dev;
>  	void __iomem *base;
>  	bool big_endian;
> +	bool wakeup;
>  	u32 alarm_freq;
>  };
>  
> @@ -267,6 +269,9 @@ static int ftm_rtc_probe(struct platform_device *pdev)
>  		return PTR_ERR(rtc->base);
>  	}
>  
> +	rtc->wakeup =
> +		device_property_read_bool(&pdev->dev, "wakeup-source");
> +
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
>  		dev_err(&pdev->dev, "can't get irq number\n");
> @@ -274,7 +279,7 @@ static int ftm_rtc_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = devm_request_irq(&pdev->dev, irq, ftm_rtc_alarm_interrupt,
> -			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), rtc);
> +			       0, dev_name(&pdev->dev), rtc);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "failed to request irq\n");
>  		return ret;
> @@ -286,7 +291,10 @@ static int ftm_rtc_probe(struct platform_device *pdev)
>  	rtc->alarm_freq = (u32)FIXED_FREQ_CLK / (u32)MAX_FREQ_DIV;
>  	rtc->rtc_dev->ops = &ftm_rtc_ops;
>  
> -	device_init_wakeup(&pdev->dev, true);
> +	device_init_wakeup(&pdev->dev, rtc->wakeup);

As long as you have an irq, you should be able to wakeup, do you really
need the wakeup-source property?

Usually, wakeup-source is used when the RTC interrupt line is not
connected directly to the SoC but is still able to wake it up.

In your case, is it to cover the  case of the flex timers that can't
wake the CPU? If so, then please be more explicit in your commit
message.

> +	ret = dev_pm_set_wake_irq(&pdev->dev, irq);
> +	if (ret)
> +		dev_err(&pdev->dev, "irq wake enable failed.\n");
>  
>  	ret = rtc_register_device(rtc->rtc_dev);
>  	if (ret) {
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
