Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB6141272E
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Sep 2021 22:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbhITUIj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 20 Sep 2021 16:08:39 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:65035 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236813AbhITUGj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 20 Sep 2021 16:06:39 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2C649240006;
        Mon, 20 Sep 2021 20:05:10 +0000 (UTC)
Date:   Mon, 20 Sep 2021 22:05:09 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Will McVicker <willmcvicker@google.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Lee Jones <lee.jones@linaro.org>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 4/4] rtc: change HAVE_S3C_RTC default config logic
Message-ID: <YUjpdcm3eUH7QmAZ@piout.net>
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-5-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920190350.3860821-5-willmcvicker@google.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 20/09/2021 19:03:49+0000, Will McVicker wrote:
> Switches the default config logic of HAVE_S3C_RTC to use "default y if
> (ARCH_EXYNOS && RTC_CLASS)" versus having ARCH_EXYNOS directly select
> it. This provides vendors flexibility to disable the config if desired
> or modularize it in the presence of a generic kernel.
> 
> Verified this change doesn't impact the .config.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  arch/arm64/Kconfig.platforms | 1 -
>  drivers/rtc/Kconfig          | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index a884e5da8b0f..f9f829aab511 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -91,7 +91,6 @@ config ARCH_BRCMSTB
>  
>  config ARCH_EXYNOS
>  	bool "ARMv8 based Samsung Exynos SoC family"
> -	select HAVE_S3C_RTC if RTC_CLASS
>  	select PINCTRL
>  	select PM_GENERIC_DOMAINS if PM
>  	help
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index e1bc5214494e..40afdb37d2a5 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1406,6 +1406,7 @@ config RTC_DRV_OMAP
>  
>  config HAVE_S3C_RTC
>  	bool
> +	default y if (ARCH_EXYNOS && RTC_CLASS)
>  	help
>  	  This will include RTC support for Samsung SoCs. If
>  	  you want to include RTC support for any machine, kindly
> -- 
> 2.33.0.464.g1972c5931b-goog
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
