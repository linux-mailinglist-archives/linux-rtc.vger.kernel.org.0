Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0BFB41C545
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Sep 2021 15:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344069AbhI2NNY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 29 Sep 2021 09:13:24 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:48902
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344051AbhI2NNX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 29 Sep 2021 09:13:23 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E78F4401A9
        for <linux-rtc@vger.kernel.org>; Wed, 29 Sep 2021 13:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632921101;
        bh=JoiXgeyDu/wDtKgvXig0JAW/2J/oGkuZPAkmrTfmVCU=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=jXAR1n/X2s3GIC4gnE/l3SOyDz24/MtZvXmeK/SOmYMlYTkxnmxeZ+6unr2FifLEt
         fyofQj6oBTD2BMIIKITn5dDWR3FV83cNICId3+i+6dZKxdFDdBSNBd+GWUboOSda3C
         BllOqqrL9WKxRuvBUpHqWUp0SuZXOojVNSM5pQE+khBdldjdHHrcR9paU1RzY3Naw/
         E2EdXgLYTAQUyRpITwgJhthSaykO3WwFmEbPuOUxejLZMB59vAhCU//d3SNa5FElXn
         BnpvLBWnQ04VUNSUfb+fWPkJA53P8m2/40wB0Onh2RBjsrXVYXcwtUpyClwZBndSg0
         cOCk3uOQmu8WQ==
Received: by mail-lf1-f70.google.com with SMTP id a28-20020a056512021c00b003f5883dcd4bso2368782lfo.1
        for <linux-rtc@vger.kernel.org>; Wed, 29 Sep 2021 06:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JoiXgeyDu/wDtKgvXig0JAW/2J/oGkuZPAkmrTfmVCU=;
        b=DHFhL2J8p2xWxXuSwbsuvboBofi6WtngbuVAVJB2OyLuIK5cnpwu5UlK+7GgI9ynkv
         8Ab3QYjM/E0LOD9ulOnoRcQtSAuKsA5Hpot2d5RMuz/YNN8SEj9/HGZGUC3eOYO73seh
         KrEX9tZ4jJMiRjFnTdYAxoWr55Vr4kWyULCmjr2LpWzdXXxLurRMgh33N+paQhBMCudL
         wI8NGhpNvPyESBhb9j9hZ51bYKIExcOziygU+lQRxU8kwBjvfxLIX5ThrOdfgxRpacrs
         3/mI11COyZyHjkJAY/aNxXPjKC2EEz/HdgsqAR7bWvUF+w3fOvbKXn2IQj5/QTXGSt5a
         FtQw==
X-Gm-Message-State: AOAM531X8yfyxWBZVgwu2snYRfz83b7OwlMhvr4Cji+OuwSBvEPTPe0E
        youQs6+evNiBsnLkcctzsRKtqKDqtpobl3TmriRDzfYZqo2bNzl2XhZdq6e5rQMsLhvvKLUrDFy
        lE0BkWw8cXtGTlYzbdMdWET2cnT/z3bIE4z8wpw==
X-Received: by 2002:ac2:46d8:: with SMTP id p24mr11266979lfo.227.1632921100548;
        Wed, 29 Sep 2021 06:11:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznWesDGlVbpOGXmNoUHyfQm6C1LgrsZRBRFXcHyHVZjVJqCslONob7x8cEIpVteArjBrrBoQ==
X-Received: by 2002:ac2:46d8:: with SMTP id p24mr11266954lfo.227.1632921100386;
        Wed, 29 Sep 2021 06:11:40 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id d9sm240427lfl.175.2021.09.29.06.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 06:11:39 -0700 (PDT)
Subject: Re: [PATCH v2 10/12] soc: samsung: pmu: modularize the Exynos ARMv8
 PMU driver
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
 <20210928235635.1348330-11-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3a507f39-5ac7-1b4b-62b2-7c98a76118d7@canonical.com>
Date:   Wed, 29 Sep 2021 15:11:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928235635.1348330-11-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 29/09/2021 01:56, Will McVicker wrote:
> In order to only modularize the Exynos ARMv8 PMU driver, we have to
> split it up from the ARM PMU driver. So make the following Kconfig
> changes:
>   * EXYNOS_PMU -> EXYNOS_PMU_ARM64
>   * EXYNOS_PMU_ARM_DRIVERS -> EXYNOS_PMU_ARM
> 
> This patch also includes the necessary modularization changes.
> 
> Lastly, have EXYNOS_PMU_ARM64 use "default y if ARCH_EXYNOS && ARM64"
> instead of having ARCH_EXYNOS select it directly.

The same comments as for clocks patch:
1. You missed to explain the most important change - removed enforcing
of built-in.
2. You ignored Geert's comments and broke distros configs for Exynos
platforms.



Best regards,
Krzysztof
