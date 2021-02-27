Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCB87326C31
	for <lists+linux-rtc@lfdr.de>; Sat, 27 Feb 2021 09:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhB0IJI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 27 Feb 2021 03:09:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbhB0IJG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 27 Feb 2021 03:09:06 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2A3C06174A;
        Sat, 27 Feb 2021 00:08:22 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id k12so4281983ljg.9;
        Sat, 27 Feb 2021 00:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ml3mDD0xY/VjmOnKUym0KmbG6rdyhQ3p6qFu1Ts6+ss=;
        b=kzVxjYPsxjFuHzRp7sCPtajEW8sPI6n46NLkyHoCEm6qA6lfO6w5Y+Ql7x/fcFZ5Vp
         A9E82/aQxKz+Na17wdrVxUo1+IGCU3AFe1npmcTa5/yxHq5acaqit8fq4MKh2rtonmJl
         NzBCF6lufw3SXvfHOefyaUCBpJcpbOIvhbnrpJwINPT3oBoZrKi2XnuAtFpeSSjf19cf
         OjDof4HC63HCXoqyVeuLOw507kGLKanCS5PzwPtilEvzWn08n3KvUSrMuRicMiL0unVl
         ihxhclsw7r/fM0o6O/JbYphB+VsOnv/95I66z8tFoVTHIoq4mBc//YfZpQSlZlLPO2U9
         dW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ml3mDD0xY/VjmOnKUym0KmbG6rdyhQ3p6qFu1Ts6+ss=;
        b=POOPlQrhQ3OSqFROKZxN2Yo5Bf03pcOpxT4jn4res09RvMgjyu4JwI5698DtSI6oWY
         bsHocbATHINYoz4edkiGagtt38IuJ6vEMVeraaeqXLh54vfHZuDLcD2FfZ76YpfQ6O5J
         q0SGd+oW56yXICafyf7kk2mEWrGMHuhOVtlCqFROhmnAHVTEW5m70LsY5bWVB6M/OdyC
         PmwVmghdfepg+6yP3/2FYCb+Kob4auG9xIzUN+oCGNzwkawOxSErzesDD6jh3XeLxEBL
         KXOVa/K7FkQwD9LDnRVqpoqfzvwJkUB7kyUkqo5PY5nyem0fTRtytn8c6UwiQcCn2lWD
         8IqQ==
X-Gm-Message-State: AOAM533DCaYcnnOTrLimZQduwpHok5ogoGtD4NXGUAskiag2MizkS2jV
        rQOHAF99DjV44tVkXYtRfsHBuTor+Pk=
X-Google-Smtp-Source: ABdhPJzSWD9ri8pIU3PeN1AuuFpUfz2deqxrZ1wUhr+g4qJEQTcZa7SGuXcmTsUfK4gUmnI6z2hBQw==
X-Received: by 2002:a2e:8157:: with SMTP id t23mr3780650ljg.214.1614413297661;
        Sat, 27 Feb 2021 00:08:17 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id d1sm1626499lfq.156.2021.02.27.00.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Feb 2021 00:08:17 -0800 (PST)
Subject: Re: [PATCH] rtc: tps65910: include linux/property.h
To:     Arnd Bergmann <arnd@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210225134215.2263694-1-arnd@kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b267c5da-a6ea-7d18-265c-7f63ed7e60f9@gmail.com>
Date:   Sat, 27 Feb 2021 11:08:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210225134215.2263694-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

25.02.2021 16:42, Arnd Bergmann пишет:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The added device_property_present() call causes a build
> failure in some configurations because of the missing header:
> 
> drivers/rtc/rtc-tps65910.c:422:7: error: implicit declaration of function 'device_property_present' [-Werror,-Wimplicit-function-declaration]
> 
> Fixes: 454ba154a62c ("rtc: tps65910: Support wakeup-source property")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/rtc/rtc-tps65910.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/rtc-tps65910.c b/drivers/rtc/rtc-tps65910.c
> index 288abb1abdb8..bc89c62ccb9b 100644
> --- a/drivers/rtc/rtc-tps65910.c
> +++ b/drivers/rtc/rtc-tps65910.c
> @@ -18,6 +18,7 @@
>  #include <linux/rtc.h>
>  #include <linux/bcd.h>
>  #include <linux/math64.h>
> +#include <linux/property.h>
>  #include <linux/platform_device.h>
>  #include <linux/interrupt.h>
>  #include <linux/mfd/tps65910.h>
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
