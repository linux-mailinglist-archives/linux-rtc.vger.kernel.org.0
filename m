Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D698736D057
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Apr 2021 03:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbhD1Bkh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 27 Apr 2021 21:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbhD1Bkh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 27 Apr 2021 21:40:37 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13027C061574;
        Tue, 27 Apr 2021 18:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=j0YMlGzHf/h6mz2607RywJBcwp3+uuEe5/I39C4Plt4=; b=WXmy1DnTJDqIRSAOvxtbULE6M7
        8kCQWqcYQETvbNwhJmVY1v7B+irbL5ezKWxXEr6OpRVNARMubEalpLzLrumXzTacTdx++gWDspJXQ
        DRYfkAuaB01eqLv0/kdZM8gnUjB9H+LKgD9R2rn8DggtzXDhnmsbouiqk35MoStzacFLvjt8IjgRo
        6oK5ZJvN6PEQzl6Y+9Y+We9mkD4FKkdeBpu0j+w1B36jCCqfxvXBE12MgfAcxCknnKdAXUszjXqbK
        x9zyXEf89Wk6knV2uvuwVlTGA2fBsV6W9kWRRGtjpPtgH3jtqdFhC1j7CsXR7HqzjmmU6/1CfvHy0
        VAhy7+RA==;
Received: from [2601:1c0:6280:3f0::df68]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lbZAu-007hVE-Ps; Wed, 28 Apr 2021 01:39:43 +0000
Subject: Re: [PATCH] [v2] rtc: bd70528: fix BD71815 watchdog dependency
To:     Arnd Bergmann <arnd@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Claudius Heine <ch@denx.de>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210422151545.2403356-1-arnd@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5bb5dc13-2637-c6b7-b681-c16eaf8af53c@infradead.org>
Date:   Tue, 27 Apr 2021 18:39:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210422151545.2403356-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 4/22/21 8:15 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The added Kconfig dependency is slightly incorrect, which can
> lead to a link failure when the watchdog is a loadable module:
> 
> arm-linux-gnueabi-ld: drivers/rtc/rtc-bd70528.o: in function `bd70528_set_rtc_based_timers':
> rtc-bd70528.c:(.text+0x6cc): undefined reference to `bd70528_wdt_set'
> arm-linux-gnueabi-ld: drivers/rtc/rtc-bd70528.o: in function `bd70528_set_time':
> rtc-bd70528.c:(.text+0xaa0): undefined reference to `bd70528_wdt_lock'
> arm-linux-gnueabi-ld: rtc-bd70528.c:(.text+0xab8): undefined reference to `bd70528_wdt_unlock'
> arm-linux-gnueabi-ld: drivers/rtc/rtc-bd70528.o: in function `bd70528_alm_enable':
> rtc-bd70528.c:(.text+0xfc0): undefined reference to `bd70528_wdt_lock'
> arm-linux-gnueabi-ld: rtc-bd70528.c:(.text+0x1030): undefined reference to `bd70528_wdt_unlock'
> 
> The problem is that it allows to be built-in if MFD_ROHM_BD71828
> is built-in, even when the watchdog is a loadable module.
> 
> Rework this so that having the watchdog as a loadable module always
> forces the rtc to be a module as well instead of built-in,
> regardless of bd71828.
> 
> Fixes: c56dc069f268 ("rtc: bd70528: Support RTC on ROHM BD71815")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: Fix as suggested by Guenter Roeck, reword description
> ---
>  drivers/rtc/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index d8c13fded164..914497abeef9 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -502,7 +502,8 @@ config RTC_DRV_M41T80_WDT
>  
>  config RTC_DRV_BD70528
>  	tristate "ROHM BD70528, BD71815 and BD71828 PMIC RTC"
> -	depends on MFD_ROHM_BD71828 || MFD_ROHM_BD70528 && (BD70528_WATCHDOG || !BD70528_WATCHDOG)
> +	depends on MFD_ROHM_BD71828 || MFD_ROHM_BD70528
> +	depends on BD70528_WATCHDOG || !BD70528_WATCHDOG
>  	help
>  	  If you say Y here you will get support for the RTC
>  	  block on ROHM BD70528, BD71815 and BD71828 Power Management IC.
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

thanks.

-- 
~Randy

