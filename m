Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987674547AB
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Nov 2021 14:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237859AbhKQNqX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Nov 2021 08:46:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237857AbhKQNqX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 17 Nov 2021 08:46:23 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 933AFC061570;
        Wed, 17 Nov 2021 05:43:24 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id 7so6417542oip.12;
        Wed, 17 Nov 2021 05:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M2K2pmwHVDblW0TtsORwx2aCcnpmPhudBPPkgio4B7A=;
        b=ibIs+ciMDGpkO3zdOfClgZiXfHaUiUi6wMNSsct7W3dX/vQkwx2qSyyIuyYWpmCr6n
         bDEfw4JRsg6OJDLeEZ4J3kvrH2YZCRdjyi9eMGmKbPEbCOHe24iZn49WtbMwTeC6eS4Z
         V7AqjvrYEFKnrBXZPCcPUC7b9OuoiZtZoK5L/bsQUjrBARo0NYaxnvVG8PawQH4IAWo2
         affw5i/B5UiSamgn01TQX9uIhg8ElbvmzSyjJCEqcRBwJ+U+7FA0U6AtQZCUbZfzv7zR
         MuW2Jy4n8TpVHN7trFAr3QV2GhMJNj2dJWY7Qysfk2LExINfNOcCR9zn48SU8RkFlwQn
         NqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=M2K2pmwHVDblW0TtsORwx2aCcnpmPhudBPPkgio4B7A=;
        b=PDz03GfoN1EbJ7t2XUlYgPgAkOJagCHML5WvCOP2NfWHyRASxmuAfQOKbuKh4VvMs2
         b+aZgEmqpzbThzRRqR1dVbdWpICEXdMtYaFYVTXpDKQRCXZpjLm4zjvATd4gWhbWNkbb
         0k0UyoHRkR9AyHfI4GrPdVwMDNixJ1T+jNsfcnT5wGkKY0yTxBYBhxE1TdkLn7/WDr82
         oZU5Gb+kI2qPiiHDUmEsu81Uyx7UZG4PGYPFt87q275lx9L6GDrwrxC2g5mwzpBvkp2D
         DO3bdd9SC5pQq4Ds0QyBQD6U6gl/6Kuurb8X+2Ue20cvozTXJe+D4vjc/PyHMqIkjJJs
         u3JA==
X-Gm-Message-State: AOAM531dlSW9TNDezFNwHOS2m0Y0l+355dPdAqhzE+iHhahVrANoLnQ7
        YvkuFT+I0OpOiwMq6iuN6q4=
X-Google-Smtp-Source: ABdhPJxeFDI6vUcgTBRgOWhNfzOK15Fhlw5ayhwGVs2a4zpmus5wHzSKAbJ4rMClXEpyEd4u3auCqA==
X-Received: by 2002:aca:de07:: with SMTP id v7mr13812436oig.28.1637156603999;
        Wed, 17 Nov 2021 05:43:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bg38sm5069080oib.40.2021.11.17.05.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 05:43:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 17 Nov 2021 05:43:22 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 6/8] watchdog: Kconfig: fix help text indentation
Message-ID: <20211117134322.GA2613433@roeck-us.net>
References: <20211111225852.3128201-1-luca@lucaceresoli.net>
 <20211111225852.3128201-7-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111225852.3128201-7-luca@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Nov 11, 2021 at 11:58:50PM +0100, Luca Ceresoli wrote:
> Some entries indent their help text with 1 tab + 1 space or 1 tab only
> instead of 1 tab + 2 spaces. Add the missing spaces.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changes in v3: none
> ---
>  drivers/watchdog/Kconfig | 48 ++++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 9d222ba17ec6..a6d97f30325a 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -680,10 +680,10 @@ config MAX77620_WATCHDOG
>  	depends on MFD_MAX77620 || COMPILE_TEST
>  	select WATCHDOG_CORE
>  	help
> -	 This is the driver for the Max77620 watchdog timer.
> -	 Say 'Y' here to enable the watchdog timer support for
> -	 MAX77620 chips. To compile this driver as a module,
> -	 choose M here: the module will be called max77620_wdt.
> +	  This is the driver for the Max77620 watchdog timer.
> +	  Say 'Y' here to enable the watchdog timer support for
> +	  MAX77620 chips. To compile this driver as a module,
> +	  choose M here: the module will be called max77620_wdt.
>  
>  config IMX2_WDT
>  	tristate "IMX2+ Watchdog"
> @@ -1440,26 +1440,26 @@ config TQMX86_WDT
>  	depends on X86
>  	select WATCHDOG_CORE
>  	help
> -	This is the driver for the hardware watchdog timer in the TQMX86 IO
> -	controller found on some of their ComExpress Modules.
> +	  This is the driver for the hardware watchdog timer in the TQMX86 IO
> +	  controller found on some of their ComExpress Modules.
>  
> -	To compile this driver as a module, choose M here; the module
> -	will be called tqmx86_wdt.
> +	  To compile this driver as a module, choose M here; the module
> +	  will be called tqmx86_wdt.
>  
> -	Most people will say N.
> +	  Most people will say N.
>  
>  config VIA_WDT
>  	tristate "VIA Watchdog Timer"
>  	depends on X86 && PCI
>  	select WATCHDOG_CORE
>  	help
> -	This is the driver for the hardware watchdog timer on VIA
> -	southbridge chipset CX700, VX800/VX820 or VX855/VX875.
> +	  This is the driver for the hardware watchdog timer on VIA
> +	  southbridge chipset CX700, VX800/VX820 or VX855/VX875.
>  
> -	To compile this driver as a module, choose M here; the module
> -	will be called via_wdt.
> +	  To compile this driver as a module, choose M here; the module
> +	  will be called via_wdt.
>  
> -	Most people will say N.
> +	  Most people will say N.
>  
>  config W83627HF_WDT
>  	tristate "Watchdog timer for W83627HF/W83627DHG and compatibles"
> @@ -1745,10 +1745,10 @@ config BCM7038_WDT
>  	depends on HAS_IOMEM
>  	depends on ARCH_BRCMSTB || BMIPS_GENERIC || COMPILE_TEST
>  	help
> -	 Watchdog driver for the built-in hardware in Broadcom 7038 and
> -	 later SoCs used in set-top boxes.  BCM7038 was made public
> -	 during the 2004 CES, and since then, many Broadcom chips use this
> -	 watchdog block, including some cable modem chips.
> +	  Watchdog driver for the built-in hardware in Broadcom 7038 and
> +	  later SoCs used in set-top boxes.  BCM7038 was made public
> +	  during the 2004 CES, and since then, many Broadcom chips use this
> +	  watchdog block, including some cable modem chips.
>  
>  config IMGPDC_WDT
>  	tristate "Imagination Technologies PDC Watchdog Timer"
> @@ -2109,12 +2109,12 @@ config KEEMBAY_WATCHDOG
>  	depends on ARCH_KEEMBAY || (ARM64 && COMPILE_TEST)
>  	select WATCHDOG_CORE
>  	help
> -	 This option enable support for an In-secure watchdog timer driver for
> -	 Intel Keem Bay SoC. This WDT has a 32 bit timer and decrements in every
> -	 count unit. An interrupt will be triggered, when the count crosses
> -	 the threshold configured in the register.
> +	  This option enable support for an In-secure watchdog timer driver for
> +	  Intel Keem Bay SoC. This WDT has a 32 bit timer and decrements in every
> +	  count unit. An interrupt will be triggered, when the count crosses
> +	  the threshold configured in the register.
>  
> -	 To compile this driver as a module, choose M here: the
> -	 module will be called keembay_wdt.
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called keembay_wdt.
>  
>  endif # WATCHDOG
