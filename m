Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60C1541C639
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Sep 2021 16:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245078AbhI2OCp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 29 Sep 2021 10:02:45 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:57332
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244995AbhI2OCo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 29 Sep 2021 10:02:44 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F169A40279
        for <linux-rtc@vger.kernel.org>; Wed, 29 Sep 2021 14:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632924062;
        bh=WjyM9zf1nCEYn+RK+0ge3r02uUICdD54a8plMbZb68M=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=PIoqAaaEqUtjG6jr89w24F+jSOEvNfdyveRLYouEIjMpTjzNAcV75BcPXb9Ukgkon
         Dh73uEy0vDHcT6kUDvLQgI0bfyRuLX50zqHvos+HOfhLlqF85QEZ2CzrIBsrzl6U41
         QosksenwsAHMueSMn4gV2hsRvN5EvH/YY/thmehM3E6K/yC+lb4PKgkjnEml9s4Ktc
         iBVx0Ge2EvehKkphFwT472uJEhtSSzhX0omSdyBleeDYPWx7la6LzRM6K7gcPLLXVb
         tJvknk2WX6VFAWcEJH1q4P90bDDm3Y6JpJqmwAEYDWrpT7+s7BFXTpoXBLoGO0PtJH
         l3EI9hjLCkjtQ==
Received: by mail-ed1-f71.google.com with SMTP id e21-20020a50a695000000b003daa0f84db2so2457504edc.23
        for <linux-rtc@vger.kernel.org>; Wed, 29 Sep 2021 07:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WjyM9zf1nCEYn+RK+0ge3r02uUICdD54a8plMbZb68M=;
        b=OgPNvThBt9MkB3d79MPNEN+tXHL5C1EwpVA+2Ntik0Q19pwp03KgzR/yPz5FkXzZpl
         1wi2CtgY1yO5jakom0Guk7s6pq7t/82eEytrDT8IJ9878v3mudHLVGjsHANJ6rXE75Xm
         2DkGO/Xe4pEHIhhPSSmZTbWJRupW/i3yCDCi+IYk0BBHIn2c6XCDjnkD3b6WKs9eNbks
         3HD3rJjgqcwk3jQGHjn+rE5O4RGIPrP1JxTijyrTufjs5uBML9GHh9eo9TpasznS5M47
         fB3hW38X9UglpmqaxUgp/3uV//LCAMDZ4GANb5fOwx0tePrgx81DTX4ZoX53bbj4c7eR
         FP5w==
X-Gm-Message-State: AOAM530EkxQfiuThX+mFXCBX9CTAax1jUII0z2xq3H91jA7N6dDaHmyt
        FZ/3HWNCByFCcoSfsyZ6e9yN11JXJ4CNIw6CsbMOFQHRsU+wS9fXzJr6He4bTmXuaD7nxjtH6eT
        oTFGdaUtxkc11TGHrGOPvS3IPby4f1AXD512KXA==
X-Received: by 2002:a05:6512:220f:: with SMTP id h15mr11115770lfu.398.1632924051609;
        Wed, 29 Sep 2021 07:00:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcRnIuhOY7CK9oDbVjvF9edjRx8oUhEpxRb6E1YojrS2Sfi3b7BVTyNWXrzfXxMSAityt0PQ==
X-Received: by 2002:a05:6512:220f:: with SMTP id h15mr11115725lfu.398.1632924051401;
        Wed, 29 Sep 2021 07:00:51 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id 8sm763ljr.10.2021.09.29.07.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 07:00:50 -0700 (PDT)
Subject: Re: [PATCH v2 01/12] arm64: don't have ARCH_EXYNOS select
 EXYNOS_CHIPID
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
 <20210928235635.1348330-2-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3274ed53-6058-323f-be3b-a90de479183c@canonical.com>
Date:   Wed, 29 Sep 2021 16:00:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928235635.1348330-2-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 29/09/2021 01:56, Will McVicker wrote:
> Now that EXYNOS_CHIPID can be a module and is enabled by default via
> ARCH_EXYNOS, we don't need to have ARCH_EXYNOS directly select it. So
> remove that.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  arch/arm64/Kconfig.platforms | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index b0ce18d4cc98..90c5cf4856e1 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -92,7 +92,6 @@ config ARCH_BRCMSTB
>  config ARCH_EXYNOS
>  	bool "ARMv8 based Samsung Exynos SoC family"
>  	select COMMON_CLK_SAMSUNG
> -	select EXYNOS_CHIPID
>  	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
>  	select EXYNOS_PMU
>  	select HAVE_S3C_RTC if RTC_CLASS
> 

This actually should be part of my series converting ChipID driver to a
module:
https://lore.kernel.org/linux-samsung-soc/4aee1b0d-91a1-75ac-d2b7-6dab3d7a301f@kernel.org/T/#t

Applied it, thanks.

Best regards,
Krzysztof
