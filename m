Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05AA820E8A9
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2020 01:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgF2WX5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 29 Jun 2020 18:23:57 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:56999 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgF2WX5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 29 Jun 2020 18:23:57 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1DBFBC0002;
        Mon, 29 Jun 2020 22:23:53 +0000 (UTC)
Date:   Tue, 30 Jun 2020 00:23:53 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] rtc: max77686: Do not allow interrupt to fire before
 system resume
Message-ID: <20200629222353.GB3800@piout.net>
References: <20200615161455.4420-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615161455.4420-1-krzk@kernel.org>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 15/06/2020 18:14:55+0200, Krzysztof Kozlowski wrote:
> The rtc-max77686 device shares the main interrupt line with parent MFD
> device (max77686 driver).  During the system suspend, the parent MFD
> device disables this IRQ to prevent an early event happening before
> resuming I2C bus controller.
> 
> The same should be done by rtc-max77686 driver because otherwise the
> interrupt handler max77686_rtc_alarm_irq() will be called before its
> resume function (max77686_rtc_resume()).  Such issue is not fatal but
> disabling shared IRQ by all users ensures correct behavior.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> If this looks ok, I guess all maxim RTC drivers should be updated?

But then, shouldn't that means that this affects all RTCs on an i2c bus?

I'm not completely proficient with PM but shouldn't using _noirq
propagate to the parents? Then you are sure that the resume is called
with interrupts disabled and this also means that the i2c driver has
resumed (hopefully with interrupts disabled).

I must admit that I don't know and I hope that the answer would also
answer whether moving all the RTC resume to resume_early is safe. (See
https://lore.kernel.org/linux-rtc/20200610132403.2539519-1-martin@geanix.com/#t)

> ---
>  drivers/rtc/rtc-max77686.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index 03ebcf1c0f3d..645de5af707b 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -805,17 +805,33 @@ static int max77686_rtc_remove(struct platform_device *pdev)
>  #ifdef CONFIG_PM_SLEEP
>  static int max77686_rtc_suspend(struct device *dev)
>  {
> +	struct max77686_rtc_info *info = dev_get_drvdata(dev);
> +	int ret = 0;
> +
>  	if (device_may_wakeup(dev)) {
>  		struct max77686_rtc_info *info = dev_get_drvdata(dev);
>  
> -		return enable_irq_wake(info->virq);
> +		ret = enable_irq_wake(info->virq);
>  	}
>  
> -	return 0;
> +	/*
> +	 * Main IRQ (not virtual) must be disabled during suspend because if it
> +	 * happens while suspended it will be handled before resuming I2C.
> +	 *
> +	 * Since Main IRQ is shared, all its users should disable it to be sure
> +	 * it won't fire while one of them is still suspended.
> +	 */
> +	disable_irq(info->rtc_irq);
> +
> +	return ret;
>  }
>  
>  static int max77686_rtc_resume(struct device *dev)
>  {
> +	struct max77686_rtc_info *info = dev_get_drvdata(dev);
> +
> +	enable_irq(info->rtc_irq);
> +
>  	if (device_may_wakeup(dev)) {
>  		struct max77686_rtc_info *info = dev_get_drvdata(dev);
>  
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
