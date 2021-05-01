Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 139733706C1
	for <lists+linux-rtc@lfdr.de>; Sat,  1 May 2021 12:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbhEAKGp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 1 May 2021 06:06:45 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:53007 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbhEAKGp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 1 May 2021 06:06:45 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 56A7340007;
        Sat,  1 May 2021 10:05:51 +0000 (UTC)
Date:   Sat, 1 May 2021 12:05:51 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Martin Kaiser <martin@kaiser.cx>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: imxdi: add wakeup support
Message-ID: <YI0n/7M3Ke4DAwG2@piout.net>
References: <20210430093210.7034-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430093210.7034-1-martin@kaiser.cx>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 30/04/2021 11:32:10+0200, Martin Kaiser wrote:
> The DryIce-based RTC supports alarms that trigger an interrupt.
> 
> Add an option to configure this interrupt as a wakeup source that wakes
> the system up from standby mode.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> 
> simple test
> 
>    [root@board ]# echo enabled > /sys/class/rtc/rtc0/device/power/wakeup
>    [root@board ]# rtcwake -s 3 -m mem
>    wakeup from "mem" at Fri Apr 30 09:23:52 2021
>    ...
>    [root@board ]#
> 
>  drivers/rtc/rtc-imxdi.c | 39 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-imxdi.c b/drivers/rtc/rtc-imxdi.c
> index c1806f4d68e7..63957be25759 100644
> --- a/drivers/rtc/rtc-imxdi.c
> +++ b/drivers/rtc/rtc-imxdi.c
> @@ -98,6 +98,7 @@
>   * @pdev: pointer to platform dev
>   * @rtc: pointer to rtc struct
>   * @ioaddr: IO registers pointer
> + * @norm_irq: irq number of the "normal" irq
>   * @clk: input reference clock
>   * @dsr: copy of the DSR register
>   * @irq_lock: interrupt enable register (DIER) lock
> @@ -109,6 +110,7 @@ struct imxdi_dev {
>  	struct platform_device *pdev;
>  	struct rtc_device *rtc;
>  	void __iomem *ioaddr;
> +	int norm_irq;
>  	struct clk *clk;
>  	u32 dsr;
>  	spinlock_t irq_lock;
> @@ -741,7 +743,7 @@ static void dryice_work(struct work_struct *work)
>  static int __init dryice_rtc_probe(struct platform_device *pdev)
>  {
>  	struct imxdi_dev *imxdi;
> -	int norm_irq, sec_irq;
> +	int sec_irq;
>  	int rc;
>  
>  	imxdi = devm_kzalloc(&pdev->dev, sizeof(*imxdi), GFP_KERNEL);
> @@ -756,9 +758,9 @@ static int __init dryice_rtc_probe(struct platform_device *pdev)
>  
>  	spin_lock_init(&imxdi->irq_lock);
>  
> -	norm_irq = platform_get_irq(pdev, 0);
> -	if (norm_irq < 0)
> -		return norm_irq;
> +	imxdi->norm_irq = platform_get_irq(pdev, 0);
> +	if (imxdi->norm_irq < 0)
> +		return imxdi->norm_irq;
>  
>  	/* the 2nd irq is the security violation irq
>  	 * make this optional, don't break the device tree ABI
> @@ -795,7 +797,7 @@ static int __init dryice_rtc_probe(struct platform_device *pdev)
>  	if (rc != 0)
>  		goto err;
>  
> -	rc = devm_request_irq(&pdev->dev, norm_irq, dryice_irq,
> +	rc = devm_request_irq(&pdev->dev, imxdi->norm_irq, dryice_irq,
>  			      IRQF_SHARED, pdev->name, imxdi);
>  	if (rc) {
>  		dev_warn(&pdev->dev, "interrupt not available.\n");
> @@ -811,6 +813,8 @@ static int __init dryice_rtc_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, imxdi);
>  
> +	device_set_wakeup_capable(&pdev->dev, true);

Maybe it makes sense to simply use device_init_wakeup here.

> +
>  	imxdi->rtc->ops = &dryice_rtc_ops;
>  	imxdi->rtc->range_max = U32_MAX;
>  
> @@ -830,6 +834,8 @@ static int __exit dryice_rtc_remove(struct platform_device *pdev)
>  {
>  	struct imxdi_dev *imxdi = platform_get_drvdata(pdev);
>  
> +	device_set_wakeup_capable(&pdev->dev, false);
> +
>  	flush_work(&imxdi->work);
>  
>  	/* mask all interrupts */
> @@ -847,10 +853,33 @@ static const struct of_device_id dryice_dt_ids[] = {
>  
>  MODULE_DEVICE_TABLE(of, dryice_dt_ids);
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int dryice_suspend(struct device *dev)
> +{
> +	struct imxdi_dev *imxdi = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(imxdi->norm_irq);
> +	return 0;
> +}
> +
> +static int dryice_resume(struct device *dev)
> +{
> +	struct imxdi_dev *imxdi = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(imxdi->norm_irq);
> +	return 0;
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(dryice_pm, dryice_suspend, dryice_resume);
> +

I'm wondering, can't you use dev_pm_set_wake_irq to avoid having to
keep the changes to a minimum?

>  static struct platform_driver dryice_rtc_driver = {
>  	.driver = {
>  		   .name = "imxdi_rtc",
>  		   .of_match_table = dryice_dt_ids,
> +		   .pm = &dryice_pm,
>  		   },
>  	.remove = __exit_p(dryice_rtc_remove),
>  };
> -- 
> 2.20.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
