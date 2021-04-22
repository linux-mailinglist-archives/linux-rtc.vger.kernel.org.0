Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B2036825F
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Apr 2021 16:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236544AbhDVOXQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Apr 2021 10:23:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236496AbhDVOXQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Apr 2021 10:23:16 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE4BC06174A;
        Thu, 22 Apr 2021 07:22:41 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso40377787otb.13;
        Thu, 22 Apr 2021 07:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wbd3vjdy2RrNuiyqEnvxIliUqVhGcWSSHlpzvvmiqlY=;
        b=ZKy0c3rmUshdEI3T848CjhdPWhZmkmrhHw916AwCUQQao22SRdR1VsyDv1WtBi4ryu
         GVaaYyUxJnoDqXGL8tT8v0f3PkT71hD0Wfrl3guiHSxSe3bok5P8PaGY0IKsF33SGqNA
         zI53l7hXQL6FwGe2jCq0oR3vvH9kgq6j9i8d65l/OpqJWomM+wi0CH3fpDZTnrGyzDDj
         6t86Gs+nsP9gfZsePJO3UoGO/YWJcKGgD1Kjq5vXWMRWpPJoGH6sCFpgcqy6D44OXyml
         xK/siPL4kZcXyfxp6gYxThCLPbJZtRNNWcvGdjPIB9/zUStQEgygtdZR+gjKgPXE8GAh
         j+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wbd3vjdy2RrNuiyqEnvxIliUqVhGcWSSHlpzvvmiqlY=;
        b=IriHPKlCjfomLJyh8+KPZQPHnP4DcTWbDRR5RiiDiuWCH1bPXy5jp/snC9edHjWi7O
         YXo9IhB71zxv8I5vwzmqAovkZMwIeNUQF8wtioUm4gfU5GJCvt6iAN4guklzDKSbIsfD
         EdwkmFu1Rcq2eP/xCtRCLccUTbiCF06iVhFzHRBZDUIWEUjVjaqoeElXZaslkq8rB6RA
         boIG22vI/QlFsUnpyL5UBaoS3IABL7CyMKtxwn6Vtl2KzrQ6DEpDwCiJpHs/OKAw35MJ
         c0joybmBKvnchMhdVNybj/KGmXlHbAQTtvFk0IkIeMo0pIrPG043LOCrb21afeLs2kmJ
         6Q7g==
X-Gm-Message-State: AOAM532kBHsZKrlDjEhOEqynqzKz6WyaUUPQ4VBwgUJHLrVHa29uAn5/
        0TQGbNVIlvTmnivLx/z+8GSMkrv8r9k=
X-Google-Smtp-Source: ABdhPJwZv0aB0Lm74TF/R1jqmbbwP6mtkK6evbIlqVQjFZuZzqem9UCEZ6QvFFi8xBoRa0Jkekrzww==
X-Received: by 2002:a9d:6b15:: with SMTP id g21mr3070094otp.189.1619101360261;
        Thu, 22 Apr 2021 07:22:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r17sm585923oos.39.2021.04.22.07.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 07:22:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] rtc: bd70528: fix BD71815 watchdog dependency
To:     Arnd Bergmann <arnd@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210422133307.1710832-1-arnd@kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <82120164-c12a-bf12-0838-c3d926fe4eaf@roeck-us.net>
Date:   Thu, 22 Apr 2021 07:22:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210422133307.1710832-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 4/22/21 6:32 AM, Arnd Bergmann wrote:
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
> The problem is that it allows to be built-in if any of the other
> drivers are built-in, even when the watchdog is a loadable module.
> 
> Rework this so that having the watchdog as a loadable module always
> forces the rtc to be a module as well instead of built-in, regardless
> of the other ones.
> 
> Fixes: c56dc069f268 ("rtc: bd70528: Support RTC on ROHM BD71815")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/rtc/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index d8c13fded164..91cc106e2bf6 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -502,7 +502,8 @@ config RTC_DRV_M41T80_WDT
>  
>  config RTC_DRV_BD70528
>  	tristate "ROHM BD70528, BD71815 and BD71828 PMIC RTC"
> -	depends on MFD_ROHM_BD71828 || MFD_ROHM_BD70528 && (BD70528_WATCHDOG || !BD70528_WATCHDOG)
> +	depends on MFD_ROHM_BD71828 || MFD_ROHM_BD70528 || BD70528_WATCHDOG

Is the "|| BD70528_WATCHDOG" above correct ? Seems odd to me, since
it makes the depend statement true even if neither MFD_ROHM_BD71828
nor MFD_ROHM_BD70528 is enabled.

I think the condition needs to be something like
	depends on (MFD_ROHM_BD71828 || MFD_ROHM_BD70528) && (BD70528_WATCHDOG || !BD70528_WATCHDOG)
or, in two lines,
	depends on MFD_ROHM_BD71828 || MFD_ROHM_BD70528
	depends on BD70528_WATCHDOG || !BD70528_WATCHDOG

Thanks,
Guenter

> +	depends on BD70528_WATCHDOG || !BD70528_WATCHDOG
>  	help
>  	  If you say Y here you will get support for the RTC
>  	  block on ROHM BD70528, BD71815 and BD71828 Power Management IC.
> 

