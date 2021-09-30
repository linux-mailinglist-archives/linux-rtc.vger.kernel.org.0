Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B74841D9F9
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Sep 2021 14:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350948AbhI3Mk0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 30 Sep 2021 08:40:26 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:43946
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350938AbhI3Mk0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 30 Sep 2021 08:40:26 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AC2E140606
        for <linux-rtc@vger.kernel.org>; Thu, 30 Sep 2021 12:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633005522;
        bh=9UEPWfr7ebPMheyY1ItfdUf+trBF8Xkd/Vl6hTzqSXw=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=v/Hhpuo4muIpVpv52hZR7Pjg4/TlIYvyM5MyzbieesJ4pOKTpP/UJUGBL4YO5NF2i
         Ly7owuwG/5FyWPNwnDJry2WxhfSVun5wNHx9tILglX0/rGGLwS4lc7Bc8iRogqAkoW
         0o3kd2MXUG5+I5FgE9+0OvmvUvKvyaxHjXTCCQJE0MDFDUT87qfRkOhiRH7sVj1dA0
         mqJJ4QbAnhonsv6GbhrchXvRExKmviWMNybpf5auH8SpzqGKAYRjfD1ZHiuedhhOQp
         /V6B9KkXIbHPDuq8LR/rHI+9hE17IqYEK6uRFJZBq5mTmdRPpz0Xvtag5BiTy5pF21
         JQD6KE+BuwdvQ==
Received: by mail-lf1-f70.google.com with SMTP id n22-20020a0565120ad600b003fcc09af59fso5462515lfu.21
        for <linux-rtc@vger.kernel.org>; Thu, 30 Sep 2021 05:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9UEPWfr7ebPMheyY1ItfdUf+trBF8Xkd/Vl6hTzqSXw=;
        b=BPS6k/F10XMTCV+QdKqChoLEu72k4YabsZ1D9FjiF0TX56fD+W8PAJJ6F0kwrflAkc
         4KUdEUX6rEEvF/OYBfIJPeMcH87ovcpgpwPjD5VK3pSBtsQVrDQvTYT21QC0kQ/C+7Uf
         OTEFGwMiunMUrZVoVsSW7pQgom4qjqC+B1FiKhUjDYyyFNcLkFiLLEvxpRK/m0PIQ5Vu
         n7GmXHcngB29iYyRMop1Np3qZvXGO33vOpM+DRD5ybRdiY6wEhHCfsFxHC8KklBmKRuu
         ZyyaZzSTSDEBFF3zdpfQgMAWkD9MS8B/Km+QEWgmGrwgpdziX1LNanvz/Zn7oTk6EK8f
         NqdA==
X-Gm-Message-State: AOAM5329iBx/B+j6s7wVxyONmcaV+19L6Sub/EXcNIZFEmgQwt8dJyF8
        NQ/cYJ4cqP1ZxqcbRvQFd6jXVUDoilhABw0kNtZEIg22KHuQvTWwN2UWDK3ovCNt9BmjTAh2Oww
        wuHm6AG9pkMMVt5BnaTu7RvFQ7ePkW4jLehbdLg==
X-Received: by 2002:a2e:98c4:: with SMTP id s4mr5529049ljj.316.1633005521795;
        Thu, 30 Sep 2021 05:38:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4VmVl8yLsL1J3X6zPeVy08Dz03yCtDXig4BMfZlB5TReP45Vy4ZGUWpipnx+5aVpp7cIQEg==
X-Received: by 2002:a2e:98c4:: with SMTP id s4mr5529018ljj.316.1633005521617;
        Thu, 30 Sep 2021 05:38:41 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id x9sm152040lfr.246.2021.09.30.05.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 05:38:41 -0700 (PDT)
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Will McVicker <willmcvicker@google.com>,
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
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Olof Johansson <olof@lixom.net>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
 <CAK8P3a0zezKvexqvL29Oc44uQq-8QG7LwZy31VYJuYAYbh-Utw@mail.gmail.com>
 <YVWDsFE7qyH6AwxR@google.com>
 <8928290c-73d9-0843-25ed-2a4817ad32f7@canonical.com>
 <YVWu2RoSqEzcG79I@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <5eb551d9-a26e-f4eb-6641-3264c2398adc@canonical.com>
Date:   Thu, 30 Sep 2021 14:38:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVWu2RoSqEzcG79I@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/09/2021 14:34, Lee Jones wrote:
> On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
>>>   It sounds like a lack of testing is your main concern.
>>>
>>>   How can I help here?  What H/W do I need to be able to fully test this?
>>
>> The changes here need to be tested on affected platforms (ARMv7 and
>> ARMv8), when built as a modules on some types of regular distros (e.g.
>> Arch, Ubuntu). From each of such boot I would be happy to see number of
>> new dmesg warnings/errors plus number of probe deferrals.
>>
>> Since the drivers could be switched to modules (and some distros might
>> do it), they might be hit by surprise regressions in boot performance
>> due to probe deferrals. This should be also checked on these platforms.
>> Geert pointed out before that clocks in many cases are not optional -
>> driver needs them and will wait defer.
>>
>> Assuming of course that boot succeeds. Minor differences in boot speed
>> should not be a problem, I think, because distro anyway chosen
>> all-module approach so it accepts the penalty.
> 
> Do you have any suggestions in terms of devboards?

Minimal set:
1. Something with Exynos4 (e.g. Odroid U3 with Exynos4412).
2. Something with Exynos 5422/5800 (e.g. Odroid XU3/XU4/HC1/MC1 or
Chromebook Peach Pi).
3. Exynos5433 - TM2 or TM2E. Boards are not widely available, so we need
to rely on provided testing by Samsung.

What would be good is to also test Exynos3 boards, but this is also not
widely available.


Best regards,
Krzysztof
