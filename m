Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64662FC203
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Jan 2021 22:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388263AbhASVLx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Jan 2021 16:11:53 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:50365 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729476AbhASVLs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Jan 2021 16:11:48 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id AE848C0008;
        Tue, 19 Jan 2021 21:10:41 +0000 (UTC)
Date:   Tue, 19 Jan 2021 22:10:41 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 16/17] rtc: bd70528: Support RTC on ROHM BD71815
Message-ID: <20210119211041.GS3666@piout.net>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
 <948164eb1c3053c3dc31c9b46de92b1c9b7224ae.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <948164eb1c3053c3dc31c9b46de92b1c9b7224ae.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 19/01/2021 09:31:36+0200, Matti Vaittinen wrote:
> BD71815 contains similar RTC block as BD71828. Only the address offsets
> seem different. Support also BD71815 RTC using rtc-bd70528.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
> No changes since v1
> 
>  drivers/rtc/Kconfig       |  6 +++---
>  drivers/rtc/rtc-bd70528.c | 45 ++++++++++++++++++++++++++++++++-------
>  2 files changed, 40 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 6123f9f4fbc9..1e48424a4729 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -501,11 +501,11 @@ config RTC_DRV_M41T80_WDT
>  	  watchdog timer in the ST M41T60 and M41T80 RTC chips series.
>  
>  config RTC_DRV_BD70528
> -	tristate "ROHM BD70528 PMIC RTC"
> -	depends on MFD_ROHM_BD70528 && (BD70528_WATCHDOG || !BD70528_WATCHDOG)
> +	tristate "ROHM BD70528, BD71815 and BD71828 PMIC RTC"
> +	depends on MFD_ROHM_BD71828 || MFD_ROHM_BD70528 && (BD70528_WATCHDOG || !BD70528_WATCHDOG)
>  	help
>  	  If you say Y here you will get support for the RTC
> -	  block on ROHM BD70528 and BD71828 Power Management IC.
> +	  block on ROHM BD70528, BD71815 and BD71828 Power Management IC.
>  
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-bd70528.
> diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
> index fb4476bb5ab6..6454afca02a6 100644
> --- a/drivers/rtc/rtc-bd70528.c
> +++ b/drivers/rtc/rtc-bd70528.c
> @@ -6,6 +6,7 @@
>  
>  #include <linux/bcd.h>
>  #include <linux/mfd/rohm-bd70528.h>
> +#include <linux/mfd/rohm-bd71815.h>
>  #include <linux/mfd/rohm-bd71828.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -13,6 +14,12 @@
>  #include <linux/regmap.h>
>  #include <linux/rtc.h>
>  
> +/*
> + * On BD71828 and BD71815 the ALM0 MASK is 14 bytes after the ALM0
> + * block start
> + */
> +#define BD718XX_ALM_EN_OFFSET 14
> +
>  /*
>   * We read regs RTC_SEC => RTC_YEAR
>   * this struct is ordered according to chip registers.
> @@ -55,6 +62,7 @@ struct bd70528_rtc {
>  	struct regmap *regmap;
>  	struct device *dev;
>  	u8 reg_time_start;
> +	u8 bd718xx_alm_block_start;
>  	bool has_rtc_timers;
>  };
>  
> @@ -236,8 +244,8 @@ static int bd71828_set_alarm(struct device *dev, struct rtc_wkalrm *a)
>  	struct bd71828_rtc_alm alm;
>  	struct bd70528_rtc *r = dev_get_drvdata(dev);
>  
> -	ret = regmap_bulk_read(r->regmap, BD71828_REG_RTC_ALM_START,
> -			       &alm, sizeof(alm));
> +	ret = regmap_bulk_read(r->regmap, r->bd718xx_alm_block_start, &alm,
> +			       sizeof(alm));
>  	if (ret) {
>  		dev_err(dev, "Failed to read alarm regs\n");
>  		return ret;
> @@ -250,8 +258,8 @@ static int bd71828_set_alarm(struct device *dev, struct rtc_wkalrm *a)
>  	else
>  		alm.alm_mask |= BD70528_MASK_ALM_EN;
>  
> -	ret = regmap_bulk_write(r->regmap, BD71828_REG_RTC_ALM_START,
> -				&alm, sizeof(alm));
> +	ret = regmap_bulk_write(r->regmap, r->bd718xx_alm_block_start, &alm,
> +				sizeof(alm));
>  	if (ret)
>  		dev_err(dev, "Failed to set alarm time\n");
>  
> @@ -311,8 +319,8 @@ static int bd71828_read_alarm(struct device *dev, struct rtc_wkalrm *a)
>  	struct bd71828_rtc_alm alm;
>  	struct bd70528_rtc *r = dev_get_drvdata(dev);
>  
> -	ret = regmap_bulk_read(r->regmap, BD71828_REG_RTC_ALM_START,
> -			       &alm, sizeof(alm));
> +	ret = regmap_bulk_read(r->regmap, r->bd718xx_alm_block_start, &alm,
> +			       sizeof(alm));
>  	if (ret) {
>  		dev_err(dev, "Failed to read alarm regs\n");
>  		return ret;
> @@ -453,8 +461,9 @@ static int bd71828_alm_enable(struct device *dev, unsigned int enabled)
>  	if (!enabled)
>  		enableval = 0;
>  
> -	ret = regmap_update_bits(r->regmap, BD71828_REG_RTC_ALM0_MASK,
> -				 BD70528_MASK_ALM_EN, enableval);
> +	ret = regmap_update_bits(r->regmap, r->bd718xx_alm_block_start +
> +				 BD718XX_ALM_EN_OFFSET, BD70528_MASK_ALM_EN,
> +				 enableval);
>  	if (ret)
>  		dev_err(dev, "Failed to change alarm state\n");
>  
> @@ -524,9 +533,28 @@ static int bd70528_probe(struct platform_device *pdev)
>  		enable_main_irq = true;
>  		rtc_ops = &bd70528_rtc_ops;
>  		break;
> +	case ROHM_CHIP_TYPE_BD71815:
> +		irq_name = "bd71815-rtc-alm-0";
> +		bd_rtc->reg_time_start = BD71815_REG_RTC_START;
> +
> +		/*
> +		 * See also BD718XX_ALM_EN_OFFSET:
> +		 * This works for BD71828 and BD71815 as they have same offset
> +		 * between ALM0 start and ALM0_MASK. If new ICs are to be
> +		 * added this requires proper check as ALM0_MASK is not located
> +		 * at the end of ALM0 block - but after all ALM blocks so if
> +		 * amount of ALMs differ the offset to enable/disable is likely
> +		 * to be incorrect and enable/disable must be given as own
> +		 * reg address here.
> +		 */
> +		bd_rtc->bd718xx_alm_block_start = BD71815_REG_RTC_ALM_START;
> +		hour_reg = BD71815_REG_HOUR;
> +		rtc_ops = &bd71828_rtc_ops;
> +		break;
>  	case ROHM_CHIP_TYPE_BD71828:
>  		irq_name = "bd71828-rtc-alm-0";
>  		bd_rtc->reg_time_start = BD71828_REG_RTC_START;
> +		bd_rtc->bd718xx_alm_block_start = BD71828_REG_RTC_ALM_START;
>  		hour_reg = BD71828_REG_RTC_HOUR;
>  		rtc_ops = &bd71828_rtc_ops;
>  		break;
> @@ -605,6 +633,7 @@ static int bd70528_probe(struct platform_device *pdev)
>  static const struct platform_device_id bd718x7_rtc_id[] = {
>  	{ "bd70528-rtc", ROHM_CHIP_TYPE_BD70528 },
>  	{ "bd71828-rtc", ROHM_CHIP_TYPE_BD71828 },
> +	{ "bd71815-rtc", ROHM_CHIP_TYPE_BD71815 },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(platform, bd718x7_rtc_id);
> -- 
> 2.25.4
> 
> 
> -- 
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
> 
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =] 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
