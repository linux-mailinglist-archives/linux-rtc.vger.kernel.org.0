Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9994339B0
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Oct 2021 17:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232316AbhJSPIp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Oct 2021 11:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232425AbhJSPIo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Oct 2021 11:08:44 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B716C061749;
        Tue, 19 Oct 2021 08:06:31 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id o26-20020a4abe9a000000b002b74bffdef0so1070024oop.12;
        Tue, 19 Oct 2021 08:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zcKZ03bkYnpMqLmBQj5cKpbb5QeOBGTteSpOn5lkqU8=;
        b=pRdBWFWocvsPbdxj/vXSr0K5uWxqmAx4RIR1I8KNUVs2Jj2VsNhUxg5KumBIeTuTUk
         D7ETI1O1+OSPS86rIgaVaGP4oqox7fD2mHB9GBJl15H8tphw7CTmP/D3H8+6halkOMOZ
         B8qBI3TOQR7nvHcK4hLTwCj1AbwpN669xkJ8dRUZVB6COLlAIoW7dZDWTWNPb3V8eoDS
         quTGt+0szDyQFMJiG7xuNF2d6ikoKEdVcLHnxvsWpHW4hnos8SrGGLfBRnT83XUufxEh
         BVClcCb0tIRc9zYcNvuSeWOdfYEmOhSQ4IS3G15F1gjGd7RhCEDcb2NMf97xmz0NVtl6
         AjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zcKZ03bkYnpMqLmBQj5cKpbb5QeOBGTteSpOn5lkqU8=;
        b=EHWQBnNzZXHBzdgnQovNn0gNIDU0Pt11UQDTPk76L3qwj7c57fOSDykRStgyoxkw6R
         Q5kDN7oiss0hUH5AmBh3UaHmMjqc35aKjHGpK/+JHMLzKEcFpRrWjS9hRW7WlpKZLRfN
         QPLyUsjICgp30bjDq/X1J6ZYxGEgy+KpQNPFXnZMN4RtW3npoGWj6g32v+KvY319t+Ek
         qsBfoyNDTgAneCIrklLr1YfpNnlsysbyDF42kcBnevm/pJ7qPLFYvY9FV0DnCRKlX87V
         8Oq/I0pLh5X4kRLCi+PRcr5M4lU6z/kUgz6hSYib8ozp0q7xYnUx9nCwxRPj1TnnUL32
         CLIQ==
X-Gm-Message-State: AOAM530u1ZM5oPCzb6frCwYnEJKBxik0YYAuelFHXO6TjQMGSoxyhzTb
        QpCGVbMTHuW7V04YHJccJQ4=
X-Google-Smtp-Source: ABdhPJyrzFPkg70vsDxFGnNtK9DST1WieTtzxPdTinZumRssrFZ3LP85pDRG/oqrN9R/phiFzLYTMQ==
X-Received: by 2002:a4a:430c:: with SMTP id k12mr5147250ooj.43.1634655990864;
        Tue, 19 Oct 2021 08:06:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d15sm3433771oic.32.2021.10.19.08.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 08:06:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 7/9] watchdog: Kconfig: fix help text indentation
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
References: <20211019145919.7327-1-luca@lucaceresoli.net>
 <20211019145919.7327-8-luca@lucaceresoli.net>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <62fb371c-81d3-a338-624b-0e3fbade23db@roeck-us.net>
Date:   Tue, 19 Oct 2021 08:06:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019145919.7327-8-luca@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/19/21 7:59 AM, Luca Ceresoli wrote:
> Some entries indent their help text with 1 tab + 1 space or 1 tab only
> instead of 1 tab + 2 spaces. Add the missing spaces.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

FWIW, this patch should probably be handled separately, not as part
of this series.

Anyway,

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/Kconfig | 48 ++++++++++++++++++++--------------------
>   1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index bf59faeb3de1..a24385099a91 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -694,10 +694,10 @@ config MAX77620_WATCHDOG
>   	depends on MFD_MAX77620 || COMPILE_TEST
>   	select WATCHDOG_CORE
>   	help
> -	 This is the driver for the Max77620 watchdog timer.
> -	 Say 'Y' here to enable the watchdog timer support for
> -	 MAX77620 chips. To compile this driver as a module,
> -	 choose M here: the module will be called max77620_wdt.
> +	  This is the driver for the Max77620 watchdog timer.
> +	  Say 'Y' here to enable the watchdog timer support for
> +	  MAX77620 chips. To compile this driver as a module,
> +	  choose M here: the module will be called max77620_wdt.
>   
>   config IMX2_WDT
>   	tristate "IMX2+ Watchdog"
> @@ -1453,26 +1453,26 @@ config TQMX86_WDT
>   	depends on X86
>   	select WATCHDOG_CORE
>   	help
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
>   config VIA_WDT
>   	tristate "VIA Watchdog Timer"
>   	depends on X86 && PCI
>   	select WATCHDOG_CORE
>   	help
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
>   config W83627HF_WDT
>   	tristate "Watchdog timer for W83627HF/W83627DHG and compatibles"
> @@ -1758,10 +1758,10 @@ config BCM7038_WDT
>   	depends on HAS_IOMEM
>   	depends on ARCH_BRCMSTB || BMIPS_GENERIC || COMPILE_TEST
>   	help
> -	 Watchdog driver for the built-in hardware in Broadcom 7038 and
> -	 later SoCs used in set-top boxes.  BCM7038 was made public
> -	 during the 2004 CES, and since then, many Broadcom chips use this
> -	 watchdog block, including some cable modem chips.
> +	  Watchdog driver for the built-in hardware in Broadcom 7038 and
> +	  later SoCs used in set-top boxes.  BCM7038 was made public
> +	  during the 2004 CES, and since then, many Broadcom chips use this
> +	  watchdog block, including some cable modem chips.
>   
>   config IMGPDC_WDT
>   	tristate "Imagination Technologies PDC Watchdog Timer"
> @@ -2122,12 +2122,12 @@ config KEEMBAY_WATCHDOG
>   	depends on ARCH_KEEMBAY || (ARM64 && COMPILE_TEST)
>   	select WATCHDOG_CORE
>   	help
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
>   endif # WATCHDOG
> 

