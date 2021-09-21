Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2EDF412F4E
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Sep 2021 09:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbhIUHY1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 21 Sep 2021 03:24:27 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:60872
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230157AbhIUHY0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 21 Sep 2021 03:24:26 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F262B40293
        for <linux-rtc@vger.kernel.org>; Tue, 21 Sep 2021 07:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632208977;
        bh=Cve5VR1QaxZM6zIVHTuhZn6XwrsbWxHHOPyFzizDJOw=;
        h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=LSaX+NNYmtKaMHZc+jMNh4LhvdiDlQ/00FmmBttIsHz4Y/Ako8b9QQh4eIfUxOrlw
         B4fh/vPlUzc5UA4G0DVRJrFMFaU9QCoWksfkw2/h+4eOFpbgHWCEEibf79nql9343W
         YbbTUv+h6kKTYCc2YLD4852GuwHKUI6FvvGQ5KPbeOEwIgYNvi4hmRcej5yvPqDxx6
         s+2RXlcO+NfK/QOa6+ZboKadWRppvDdB6pYxptW7Qz4iYfjdrbV+A1dzrK/zxlbP8R
         F+gE7NkWY3oXyYlrCI2kRxib6iyqi+mkHY+SvLj+FxPzky9BwaUPo7Nsj+OgbrHal6
         vS2kBkdSsG9uw==
Received: by mail-wr1-f70.google.com with SMTP id m1-20020a056000180100b0015e1ec30ac3so8039745wrh.8
        for <linux-rtc@vger.kernel.org>; Tue, 21 Sep 2021 00:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Cve5VR1QaxZM6zIVHTuhZn6XwrsbWxHHOPyFzizDJOw=;
        b=4+q4If0MJ5f3AbAUhhC7teLWSGEAu0NUmXtK4vmmg7wSr8jib92DcFvEwJNLUZxMEy
         1uxPzucpjgdRe/rFGRehHklL1DOJjGKP9gTsSR6Jlvz/BVcbSXsXdy5jbXAllMujDS3K
         LuZMKGujVjVg7K5jwIcpg+YDo391kwc7wDH2e4plHu62HikDjjGY/+CkOU7wQkAMTT09
         RTq822nZVV5zEOPSOjPCg5dCaN+xxJMzKHhXyM5e5T950oVjq6pmaQnkDFB0JuTB9X+p
         lGCZXPFfCyZBlxPB6iyJBo11SufyN+UsDZ7DrOdiRziKp1OJCJnUyRGpy5TbS9dV2cZk
         nWtA==
X-Gm-Message-State: AOAM5337+/NoZTI7PWgyDH3ZCRRX73jHv0VOAoG6sbey+9J3E97Ub159
        VsQ3dHvz4nrPYkwne/D2Uq3bRmj2gydYQyanVwEeuWk5AzI3EW0+9bWS+OeP3TgXMmIc9yHY3WT
        nwDwDcVxfsuZf616RgMSPRgm4YiUCbkjLUFKEiw==
X-Received: by 2002:adf:dcc1:: with SMTP id x1mr33377416wrm.415.1632208977238;
        Tue, 21 Sep 2021 00:22:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQw4dtnG2X2Nu2HkIk4oUuLyQI/VIi+qePjIbZ3WhkVu2uRQwXc5Ujx3o3WSA5Z6k2UAzRxA==
X-Received: by 2002:adf:dcc1:: with SMTP id x1mr33377384wrm.415.1632208977082;
        Tue, 21 Sep 2021 00:22:57 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id r9sm10592653wru.2.2021.09.21.00.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 00:22:56 -0700 (PDT)
Subject: Re: [PATCH v1 0/4] arm64: Kconfig: Update ARCH_EXYNOS select configs
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Lee Jones <lee.jones@linaro.org>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <7735b09c-cf1c-5e37-a737-9a330fbacf1e@canonical.com>
Message-ID: <96e7f057-c505-e5d7-d89a-345b98d44448@canonical.com>
Date:   Tue, 21 Sep 2021 09:22:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7735b09c-cf1c-5e37-a737-9a330fbacf1e@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/09/2021 09:19, Krzysztof Kozlowski wrote:
> On 20/09/2021 21:03, Will McVicker wrote:
>> This patch series tries to address the issue of ARCH_EXYNOS force selecting
>> a handful of drivers without allowing the vendor to override any of the
>> default configs. This takes away from the flexibilty of compiling a generic
>> kernel with exynos kernel modules. For example, it doesn't allow vendors to
>> modularize these drivers out of the core kernel in order to share a generic
>> kernel image across multiple devices that require device-specific kernel
>> modules.
> 
> You do not address the issue in these patches. The problem you describe
> is that drivers are not modules and you are not changing them into modules.
> 
>>
>> To address this without impacting the existing behavior, this series
>> switches the default config logic for the offending configs to use "default
>> y if ARCH_EXYNOS" versus having ARCH_EXYNOS directly select them. I have
>> verified that these patches do not impact the default aarch64 .config.
> 
> Yep, this is what you did but it does not match the described problem.
> You are not solving it but doing something else.
> 
>>
>> Will McVicker (4):
>>   clk: samsung: change COMMON_CLK_SAMSUNG default config logic
>>   soc: samsung: change SOC_SAMSUNG default config logic
>>   pinctrl: samsung: change PINCTRL_EXYNOS default config logic
>>   rtc: change HAVE_S3C_RTC default config logic
>>
> 
> 
> I received only two patches from this set. Please resend following
> get_maintainers.pl script.

For the record - samsung-soc list also did not get all your patches.

NAK, please use get_maintainers.pl.

Best regards,
Krzysztof
