Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED3B3368463
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Apr 2021 18:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235830AbhDVQI5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Apr 2021 12:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbhDVQI5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Apr 2021 12:08:57 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44041C06174A;
        Thu, 22 Apr 2021 09:08:22 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id v6so18489146oiv.3;
        Thu, 22 Apr 2021 09:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hpPPG/oOk4La4MLBYmxeGSZRqb4rLTeasnxxz8zTebY=;
        b=DXg1L5sN+rRdJVX/5t7Ky/nAi9Q7Cb1s2ztV3tmZBYuJzwiamhnvPlg+r41NTLB0Vk
         qHOwsEq2wk4LNWjP5iTfV0xcsxmIdz3+bGPfysqb3glPBtqzc2EvCJLpA01qO9yFT/zL
         ETTxnWObj7EccGWG3IdVWvEAFGNk3aCrEX+xuFCrgEYCxhHKxp00OXpgmo2v9PsLWfOZ
         t7nbGhprflHuuFrY4Sp5mbsno3HzviBI4iAbbQ7juy60qwfdxXvPHfP1/Br/wjDG7VYK
         WJhqRw+o5AEOR0ePGmEwYB7u/i/d9PvH0RX0412XKcAwHtnDZOM2UchhoSyKjz6Rno7C
         8JtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=hpPPG/oOk4La4MLBYmxeGSZRqb4rLTeasnxxz8zTebY=;
        b=lwNy654L1MTNHEjgpNNfP9PeRCpRgtIJXut2DSkHO/X6snnhg+n3gZmB+NBqLp98e9
         66ny04rl21eHaoJzZJF1DdYDq8DjBq9CXHP1hQSS8gCXWmnhLYqoKcVkWUiMVlllwSEx
         UddC8RVIYLifnBy8Ik1yIUyBwrQIWkVIxK9hqZmQtH0yXGfqHaEZwNbjPVwSMJbAWYBF
         KiL/Wyn3OkK9p6+6NOnbDglQzkWEbA6WGdMOX/g8pHuI3JhPifgRoL0oonwi8aQ06JKb
         Le+sRnUhKmy5M9CiBGC32Cc5IoJKUgUi+Ew+2LU31mzSxWUcdQxnONh6Ht9xVBGVIBub
         yu7w==
X-Gm-Message-State: AOAM532/vt6GmELEg+ivLRQbpp5wwS/v7vv+Y3rbLJhoO1/13cfJ4oJ+
        q4VA6tenMh39eUXPQEuXqEA=
X-Google-Smtp-Source: ABdhPJwDH3Gllw7qjMRWWY2+jkTAaOey3w4JRTw0+sf6c/f3GxFcpaR1QeQoppn8hcIWIsqmo9Sjmg==
X-Received: by 2002:aca:1a0b:: with SMTP id a11mr473914oia.167.1619107701670;
        Thu, 22 Apr 2021 09:08:21 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p22sm738119otf.25.2021.04.22.09.08.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Apr 2021 09:08:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 22 Apr 2021 09:08:19 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Claudius Heine <ch@denx.de>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] rtc: bd70528: fix BD71815 watchdog dependency
Message-ID: <20210422160819.GA104045@roeck-us.net>
References: <20210422151545.2403356-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422151545.2403356-1-arnd@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Apr 22, 2021 at 05:15:21PM +0200, Arnd Bergmann wrote:
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

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
> -- 
> 2.29.2
> 
