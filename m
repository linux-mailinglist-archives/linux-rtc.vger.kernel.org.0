Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2EF618690F
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2020 11:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730582AbgCPK3y (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Mar 2020 06:29:54 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:43853 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730550AbgCPK3y (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Mar 2020 06:29:54 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 74FA720003B;
        Mon, 16 Mar 2020 10:29:05 +0000 (UTC)
Date:   Mon, 16 Mar 2020 11:29:05 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mohit Aggarwal <maggarwa@codeaurora.org>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc-pm8xxx: Clear Alarm register on resume
Message-ID: <20200316102905.GN4518@piout.net>
References: <1584342688-14035-1-git-send-email-maggarwa@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584342688-14035-1-git-send-email-maggarwa@codeaurora.org>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 16/03/2020 12:41:28+0530, Mohit Aggarwal wrote:
> Currently, alarm register is not cleared on resume
> leading to reboot during power off charging mode.
> 
> Change-Id: Ie2e6bbab8aa46e4e9b9cc984181ffab557cbbdae

No Change-Id upstream please.

> Signed-off-by: Mohit Aggarwal <maggarwa@codeaurora.org>
> ---
>  drivers/rtc/rtc-pm8xxx.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
> index bbe013f..96e7985 100644
> --- a/drivers/rtc/rtc-pm8xxx.c
> +++ b/drivers/rtc/rtc-pm8xxx.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/* Copyright (c) 2010-2011, 2019, The Linux Foundation. All rights reserved. */
> +/* Copyright (c) 2010-2011, 2019-2020, The Linux Foundation. All rights reserved. */
>  
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
> +		rc = regmap_bulk_write(rtc_dd->regmap, regs->alarm_rw, value,
> +					sizeof(value));

This is not properly aligned.

> +		if (rc) {
> +			dev_err(dev, "Write to RTC ALARM register failed\n");

Is that error message necessary? What would be the user action after
seeing that in the logs? Will the logs actually be seen?

> +			goto rtc_rw_fail;
> +		}
> +	}
> +

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
