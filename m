Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD11B60DE3
	for <lists+linux-rtc@lfdr.de>; Sat,  6 Jul 2019 00:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbfGEWgY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 Jul 2019 18:36:24 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:53881 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfGEWgX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 Jul 2019 18:36:23 -0400
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7A95A200006;
        Fri,  5 Jul 2019 22:36:17 +0000 (UTC)
Date:   Sat, 6 Jul 2019 00:36:17 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Michal Simek <michal.simek@xilinx.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtc: zynqmp: One function call less in
 xlnx_rtc_alarm_irq_enable()
Message-ID: <20190705223617.GC12409@piout.net>
References: <6f1db217-cb0a-9f6c-0e2e-5d932103f6ef@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f1db217-cb0a-9f6c-0e2e-5d932103f6ef@web.de>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/07/2019 22:45:39+0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 Jul 2019 22:37:58 +0200
> 
> Avoid an extra function call by using a ternary operator instead of
> a conditional statement for a setting selection.
> 

Please elaborate on why this is a good thing.

> This issue was detected by using the Coccinelle software.
> 

Unless you use an upstream coccinelle script or you share the one you
are using, this is not a useful information.

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/rtc/rtc-zynqmp.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> index 00639594de0c..4631019a54e2 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -124,11 +124,8 @@ static int xlnx_rtc_alarm_irq_enable(struct device *dev, u32 enabled)
>  {
>  	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
> 
> -	if (enabled)
> -		writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_EN);
> -	else
> -		writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_DIS);
> -
> +	writel(RTC_INT_ALRM,
> +	       xrtcdev->reg_base + (enabled ? RTC_INT_EN : RTC_INT_DIS));

This makes the code less readable.

>  	return 0;
>  }
> 
> --
> 2.22.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
