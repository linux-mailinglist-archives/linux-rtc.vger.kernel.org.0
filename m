Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43FCC18ECB2
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Mar 2020 22:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgCVVb4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 22 Mar 2020 17:31:56 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:52731 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbgCVVb4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 22 Mar 2020 17:31:56 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A8C52FF805;
        Sun, 22 Mar 2020 21:31:54 +0000 (UTC)
Date:   Sun, 22 Mar 2020 22:31:54 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mohit Aggarwal <maggarwa@codeaurora.org>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc-pm8xxx: Clear Alarm register on resume
Message-ID: <20200322213154.GH221863@piout.net>
References: <1584525218-14719-1-git-send-email-maggarwa@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584525218-14719-1-git-send-email-maggarwa@codeaurora.org>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 18/03/2020 15:23:38+0530, Mohit Aggarwal wrote:
> Currently, alarm register is not cleared on resume
> leading to reboot during power off charging mode.
> 
> Signed-off-by: Mohit Aggarwal <maggarwa@codeaurora.org>
> ---
>  drivers/rtc/rtc-pm8xxx.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
> index bbe013f..bfcd878 100644
> --- a/drivers/rtc/rtc-pm8xxx.c
> +++ b/drivers/rtc/rtc-pm8xxx.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/* Copyright (c) 2010-2011, 2019, The Linux Foundation. All rights reserved. */
> +/* Copyright (c) 2010-2011, 2019-2020, The Linux Foundation. All rights reserved. */
>  

This part doesn't apply and is not based on upstream.

>  #include <linux/of.h>
>  #include <linux/module.h>
> @@ -301,6 +301,7 @@ static int pm8xxx_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
>  	struct pm8xxx_rtc *rtc_dd = dev_get_drvdata(dev);
>  	const struct pm8xxx_rtc_regs *regs = rtc_dd->regs;
>  	unsigned int ctrl_reg;
> +	u8 value[NUM_8_BIT_RTC_REGS] = {0};
>  
>  	spin_lock_irqsave(&rtc_dd->ctrl_reg_lock, irq_flags);
>  
> @@ -319,6 +320,16 @@ static int pm8xxx_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
>  		goto rtc_rw_fail;
>  	}
>  
> +	/* Clear Alarm register */
> +	if (!enable) {
> +		     rc = regmap_bulk_write(rtc_dd->regmap, regs->alarm_rw, value,
> +					sizeof(value));
> +		     if (rc) {
> +			     dev_err(dev, "Write to RTC ALARM register failed\n");
> +			     goto rtc_rw_fail;
> +		     }
> +	}
> +
>  rtc_rw_fail:
>  	spin_unlock_irqrestore(&rtc_dd->ctrl_reg_lock, irq_flags);
>  	return rc;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
