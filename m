Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE37C41C528
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Sep 2021 15:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344025AbhI2NEh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 29 Sep 2021 09:04:37 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:48496
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344023AbhI2NEh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 29 Sep 2021 09:04:37 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 541103F4BC
        for <linux-rtc@vger.kernel.org>; Wed, 29 Sep 2021 13:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632920574;
        bh=WQyoXTmGnA/i0/fq7CgN6IL65bEbPjXgHhQsmbo9nvw=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=IOP6aJgjMRQNikNedvoRtW5Lkb/4AFFdCsWdoQLDBC7tdp+UgvN/v+mzurtvHLWA5
         u0BwhUdWw2W56oPd4JADyMkKQJ+9Pz2boWhEnKz3uRgEVpc0M7L6bWWQQuduPmqMnR
         2rot0m3oTddNnIf05P4ZNjqr4siGpfsIvc14G7Ch9UKJxHl36ZUh4HSvkdNWSo6hml
         K2pna/KaUV3fWIrpDM5vVLp4UGlSJJ4sjkf4sYk0vC4aqVRufNTdAA4yVGVvOMyaBH
         DEuTY8VZcSDuxMKVUkISX1PQDcUlyh6yZfdgohMsjdhRby718lWBhGFbW1hEc+pgdU
         K+V5T/OTr2mLw==
Received: by mail-lf1-f72.google.com with SMTP id g9-20020a0565123b8900b003f33a027130so2290170lfv.18
        for <linux-rtc@vger.kernel.org>; Wed, 29 Sep 2021 06:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WQyoXTmGnA/i0/fq7CgN6IL65bEbPjXgHhQsmbo9nvw=;
        b=R1JB8OKD/p9J9YgsZiPRV83i61UBsq65JAaJwX9fRvGNrOVyw+N50Bcjh09XXqxnNU
         hmRItzD4uFbljgZFI6E+d2SYZV/J4m0pwM6wL/g/hStxjJSozp+0Hb3yqLFWXve0P36K
         NAG5UqOau7849QD4AbQnWondX+4+zLKJAdfb25zQzj3o1Jhgz/CoIwl9iK+a4I9pQuEu
         HswFR47JBIAkBKuNlrMviuHXsernjNB72Jtwotj10RScdsbgUTWFzL8P+jtOvd4vlnZM
         6Lk8a/dm20aR/Z1gXYBRmgpkILzXiS9GU9NKTnnDjxVdjUh9yvOjmd0yM+oyeqjmEUni
         9+Ew==
X-Gm-Message-State: AOAM530WCMLLFd7t6e/ne7i80g70V3PkDL35t+35Bk6uAVf9P4y19c62
        1evkX2c1Icp56kRMmJqPdvDLaN+NdETI2fHixLs2FHH5NDg/tTXNT5J4UMnWF1aM2j5pG7taBup
        /LzfEnVnjslEW/XZEArXvTQUEC91Dyhw9Z+7Beg==
X-Received: by 2002:ac2:5978:: with SMTP id h24mr11376899lfp.426.1632920562934;
        Wed, 29 Sep 2021 06:02:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0mrG6dmWb7waqTSD14bTgiM+wUm0WGoJ0bh+iZA1uG9aiIPJT8ie5QjhcT5bRPUqMJ0Rmww==
X-Received: by 2002:ac2:5978:: with SMTP id h24mr11376781lfp.426.1632920562152;
        Wed, 29 Sep 2021 06:02:42 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id q30sm158216lfb.108.2021.09.29.06.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 06:02:41 -0700 (PDT)
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
To:     Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20210928235635.1348330-1-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
Date:   Wed, 29 Sep 2021 15:02:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928235635.1348330-1-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 29/09/2021 01:56, Will McVicker wrote:
> This is v2 of the series of patches that modularizes a number of core
> ARCH_EXYNOS drivers. Based off of the feedback from the v1 series, I have
> modularized all of the drivers that are removed from the ARCH_EXYNOS
> series of "select XXX". This includes setting the following configs as
> tristate:
> 
>  * COMMON_CLK_SAMSUNG
>  * EXYNOS_ARM64_COMMON_CLK
>  * PINCTRL_SAMSUNG
>  * PINCTRL_EXYNOS
>  * EXYNOS_PMU_ARM64
>  * EXYNOS_PM_DOMAINS
> 
> Additionally, it introduces the config EXYNOS_PMU_ARM64 and EXYNOS_PMU_ARM
> which was previously EXYNOS_PMU and EXYNOS_PMU_ARM_DRIVERS respectively.
> The reason for these new configs is because we are not able to easily
> modularize the ARMv7 PMU driver due to built-in arch dependencies on
> pmu_base_addr under arch/arm/mach-exynos/*. So the new configs split up
> the ARM and ARM64 portions into two separate configs.
> 
> Overall, these drivers didn't require much refactoring and converted to
> modules relatively easily. However, due to my lack of exynos hardware, I
> was not able to boot test these changes. I'm mostly concerned about the
> CLK_OF_DECLARE() changes having dependencies on early timers. So I'm
> requesting help for testing these changes on the respective hardware.
> 

These are all not tested at all? In such case, since these are not
trivial changes, please mark the series as RFT.

I will not be able to test these for some days, so it must wait.


Best regards,
Krzysztof
