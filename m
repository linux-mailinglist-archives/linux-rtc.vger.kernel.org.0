Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35A4218E17D
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Mar 2020 14:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgCUNV2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 21 Mar 2020 09:21:28 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:44125 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbgCUNV2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 21 Mar 2020 09:21:28 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 01069200003;
        Sat, 21 Mar 2020 13:21:25 +0000 (UTC)
Date:   Sat, 21 Mar 2020 14:21:25 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     =?utf-8?B?6Z+p56eR5omN?= <hankecai@vivo.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, trivial@kernel.org, kernel@vivo.com
Subject: Re: [PATCH] rtc: pm8xxx: clear alarm register when alarm is not
 enabled
Message-ID: <20200321132125.GV5504@piout.net>
References: <APoAZgAaCEiRpKG6PlzreaqE.1.1584791417367.Hmail.hankecai@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <APoAZgAaCEiRpKG6PlzreaqE.1.1584791417367.Hmail.hankecai@vivo.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

Isn't that the same as:
https://patchwork.ozlabs.org/patch/1257381/ ?

On 21/03/2020 19:50:17+0800, 韩科才 wrote:
> Clear alarm register when alarm is not enabled otherwise the consumer
> may still start alarm timer if it find the alarm register is not zero.
> 
> Signed-off-by: hankecai <hankecai@vivo.com>
> ---
>  drivers/rtc/rtc-pm8xxx.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
> index 07ea1be3abb9..3fa5416ad90d 100644
> --- a/drivers/rtc/rtc-pm8xxx.c
> +++ b/drivers/rtc/rtc-pm8xxx.c
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
> +				sizeof(value));
> +		if (rc) {
> +			dev_err(dev, "Clear RTC ALARM register failed\n");
> +			goto rtc_rw_fail;
> +		}
> +	}
> +
>  rtc_rw_fail:
>  	spin_unlock_irqrestore(&rtc_dd->ctrl_reg_lock, irq_flags);
>  	return rc;
> -- 
> 2.21.0
> 
> 
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
