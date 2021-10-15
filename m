Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E02B42FA69
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 19:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241353AbhJORic (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Oct 2021 13:38:32 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:40055 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238060AbhJORic (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 13:38:32 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 49116100002;
        Fri, 15 Oct 2021 17:36:23 +0000 (UTC)
Date:   Fri, 15 Oct 2021 19:36:23 +0200
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
Subject: Re: [PATCH 8/8] rtc: max77686: add MAX77714 support
Message-ID: <YWm8FwnYGhxXOAEj@piout.net>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-9-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011155615.257529-9-luca@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/10/2021 22:25:50+0200, Luca Ceresoli wrote:
> The RTC included in the MAX77714 PMIC is very similar to the one in the
> MAX77686. Reuse the rtc-max77686.c driver with the minimum required changes
> for the MAX77714 RTC.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
> 
> *** NOTE ***
> 
> This patch didn't reach most recipients having hit a limit in my service
> provider (125 e-mails per hour). I'm resending it, as far as possible with
> proper message-id etc. Apologies for any duplicate.
> 
>  drivers/rtc/Kconfig        |  2 +-
>  drivers/rtc/rtc-max77686.c | 24 ++++++++++++++++++++++++
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index e1bc5214494e..a73591ad292b 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -375,7 +375,7 @@ config RTC_DRV_MAX8997
> 
>  config RTC_DRV_MAX77686
>  	tristate "Maxim MAX77686"
> -	depends on MFD_MAX77686 || MFD_MAX77620 || COMPILE_TEST
> +	depends on MFD_MAX77686 || MFD_MAX77620 || MFD_MAX77714 || COMPILE_TEST
>  	help
>  	  If you say yes here you will get support for the
>  	  RTC of Maxim MAX77686/MAX77620/MAX77802 PMIC.
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index 9901c596998a..e6564bc2171e 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -19,6 +19,7 @@
> 
>  #define MAX77686_I2C_ADDR_RTC		(0x0C >> 1)
>  #define MAX77620_I2C_ADDR_RTC		0x68
> +#define MAX77714_I2C_ADDR_RTC		0x48
>  #define MAX77686_INVALID_I2C_ADDR	(-1)
> 
>  /* Define non existing register */
> @@ -203,6 +204,28 @@ static const struct max77686_rtc_driver_data max77686_drv_data = {
>  	.regmap_config = &max77686_rtc_regmap_config,
>  };
> 
> +static const struct regmap_irq_chip max77714_rtc_irq_chip = {
> +	.name		= "max77714-rtc",
> +	.status_base	= MAX77686_RTC_INT,
> +	.mask_base	= MAX77686_RTC_INTM,
> +	.num_regs	= 1,
> +	.irqs		= max77686_rtc_irqs,
> +	.num_irqs	= ARRAY_SIZE(max77686_rtc_irqs) - 1, /* no WTSR on 77714 */
> +};
> +
> +static const struct max77686_rtc_driver_data max77714_drv_data = {
> +	.delay = 16000,
> +	.mask  = 0x7f,
> +	.map   = max77686_map,
> +	.alarm_enable_reg = false,
> +	.rtc_irq_from_platform = false,
> +	/* On MAX77714 RTCA1 is BIT 1 of RTCINT (0x00). Not supported by this driver. */
> +	.alarm_pending_status_reg = MAX77686_INVALID_REG,
> +	.rtc_i2c_addr = MAX77714_I2C_ADDR_RTC,
> +	.rtc_irq_chip = &max77714_rtc_irq_chip,
> +	.regmap_config = &max77686_rtc_regmap_config,
> +};
> +
>  static const struct regmap_config max77620_rtc_regmap_config = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
> @@ -846,6 +869,7 @@ static const struct platform_device_id rtc_id[] = {
>  	{ "max77686-rtc", .driver_data = (kernel_ulong_t)&max77686_drv_data, },
>  	{ "max77802-rtc", .driver_data = (kernel_ulong_t)&max77802_drv_data, },
>  	{ "max77620-rtc", .driver_data = (kernel_ulong_t)&max77620_drv_data, },
> +	{ "max77714-rtc", .driver_data = (kernel_ulong_t)&max77714_drv_data, },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(platform, rtc_id);
> --
> 2.25.1

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
