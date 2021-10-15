Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3449142FA3F
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 19:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbhJORbi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Oct 2021 13:31:38 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:33099 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234715AbhJORbi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 13:31:38 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id BE204100009;
        Fri, 15 Oct 2021 17:29:28 +0000 (UTC)
Date:   Fri, 15 Oct 2021 19:29:28 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 2/8] rtc: max77686: convert comments to kernel-doc format
Message-ID: <YWm6eHTmG63smTZz@piout.net>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-3-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011155615.257529-3-luca@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/10/2021 17:56:09+0200, Luca Ceresoli wrote:
> Convert the comments documenting this struct to kernel-doc format for
> standardization and readability.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/rtc/rtc-max77686.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index eae7cb9faf1e..bac52cdea97d 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -61,24 +61,27 @@ enum {
>  	RTC_NR_TIME
>  };
>  
> +/**
> + * struct max77686_rtc_driver_data - model-specific configuration
> + * @delay: Minimum usecs needed for a RTC update
> + * @mask: Mask used to read RTC registers value
> + * @map: Registers offset to I2C addresses map
> + * @alarm_enable_reg: Has a separate alarm enable register?
> + * @rtc_i2c_addr: I2C address for RTC block
> + * @rtc_irq_from_platform: RTC interrupt via platform resource
> + * @alarm_pending_status_reg: Pending alarm status register
> + * @rtc_irq_chip: RTC IRQ CHIP for regmap
> + * @regmap_config: regmap configuration for the chip
> + */
>  struct max77686_rtc_driver_data {
> -	/* Minimum usecs needed for a RTC update */
>  	unsigned long		delay;
> -	/* Mask used to read RTC registers value */
>  	u8			mask;
> -	/* Registers offset to I2C addresses map */
>  	const unsigned int	*map;
> -	/* Has a separate alarm enable register? */
>  	bool			alarm_enable_reg;
> -	/* I2C address for RTC block */
>  	int			rtc_i2c_addr;
> -	/* RTC interrupt via platform resource */
>  	bool			rtc_irq_from_platform;
> -	/* Pending alarm status register */
>  	int			alarm_pending_status_reg;
> -	/* RTC IRQ CHIP for regmap */
>  	const struct regmap_irq_chip *rtc_irq_chip;
> -	/* regmap configuration for the chip */
>  	const struct regmap_config *regmap_config;
>  };
>  
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
