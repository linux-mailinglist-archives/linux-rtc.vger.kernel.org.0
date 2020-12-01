Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F5E2CA0D1
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Dec 2020 12:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729906AbgLALDS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 1 Dec 2020 06:03:18 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:45183 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729425AbgLALDS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 1 Dec 2020 06:03:18 -0500
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 71838240014;
        Tue,  1 Dec 2020 11:02:35 +0000 (UTC)
Date:   Tue, 1 Dec 2020 12:02:35 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biwen Li <biwen.li@oss.nxp.com>
Cc:     leoyang.li@nxp.com, anson.huang@nxp.com, aisheng.dong@nxp.com,
        linux-kernel@vger.kernel.org, jiafei.pan@nxp.com,
        linux-rtc@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: Re: [PATCH] rtc: pcf2127: clear the flag TSF1 before enabling
 interrupt generation
Message-ID: <20201201110235.GC2401593@piout.net>
References: <20201201084746.20135-1-biwen.li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201084746.20135-1-biwen.li@oss.nxp.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 01/12/2020 16:47:46+0800, Biwen Li wrote:
> From: Biwen Li <biwen.li@nxp.com>
> 
> - clear the flag TSF1 before enabling interrupt generation
> - properly set flag WD_CD for rtc chips(pcf2129, pca2129)
> 

This change has to be a separate patch.

> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  drivers/rtc/rtc-pcf2127.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 07a5630ec841..0a45e2512258 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -601,6 +601,10 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  	 * Watchdog timer enabled and reset pin /RST activated when timed out.
>  	 * Select 1Hz clock source for watchdog timer.
>  	 * Note: Countdown timer disabled and not available.
> +	 * For pca2129, pcf2129, only bit[7] is for Symbol WD_CD
> +	 * of register watchdg_tim_ctl. The bit[6] is labeled
> +	 * as T. Bits labeled as T must always be written with
> +	 * logic 0.
>  	 */
>  	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_WD_CTL,
>  				 PCF2127_BIT_WD_CTL_CD1 |
> @@ -608,7 +612,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  				 PCF2127_BIT_WD_CTL_TF1 |
>  				 PCF2127_BIT_WD_CTL_TF0,
>  				 PCF2127_BIT_WD_CTL_CD1 |
> -				 PCF2127_BIT_WD_CTL_CD0 |
> +				 has_nvmem ? (PCF2127_BIT_WD_CTL_CD0) : (0) |

I don't like that because has_nvmem has nothing to do with
PCF2127_BIT_WD_CTL_CD0 and nothing guarantees that we won't ever get an
RTC without RST but with NVRAM and that willprobbly be overlooked.

>  				 PCF2127_BIT_WD_CTL_TF1);
>  	if (ret) {
>  		dev_err(dev, "%s: watchdog config (wd_ctl) failed\n", __func__);
> @@ -659,6 +663,21 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  		return ret;
>  	}
>  
> +	/*
> +	 * Clear TSF1 field of ctrl1 register to clear interrupt
> +	 * before enabling interrupt generation when
> +	 * timestamp flag set. Unless the flag TSF1 won't
> +	 * be cleared and the interrupt(INT pin) is
> +	 * triggered continueously.
> +	 */
> +	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
> +				 PCF2127_BIT_CTRL1_TSF1,
> +				 0);
> +	if (ret) {
> +		dev_err(dev, "%s:  control and status register 1 (ctrl1) failed, ret = 0x%x\n",
> +			__func__, ret);
> +		return ret;
> +	}

Doing that means ignoring timestamps taken while the system is offline.
It also doesn't fully solve the issue because you are not clearing TSF2
here and also it never gets cleared by the driver later on so I guess
you will get the interrupt storm once a timestamp is taken.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
