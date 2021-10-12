Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC0BA429F25
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Oct 2021 09:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234484AbhJLIBd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Oct 2021 04:01:33 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52402
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234413AbhJLIBc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Oct 2021 04:01:32 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 43BD73FFE3
        for <linux-rtc@vger.kernel.org>; Tue, 12 Oct 2021 07:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634025570;
        bh=udP1IAy8X/njK/g0UuXAT72GSIqy69WCV4uZ074ifeI=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Kt9cvu9mk9zE+bwt9T1G7PinUsGFGdQVF8qmCQO4acJGbTzybVHA3+qWorCSaKAvY
         agwyYoQ5b0oHcsfBxhkIqHEWSzF9nTU8+DPIwXJeY4ba0gz3kZJNNsfhZInhfe6ORO
         jsroSXPWAAdzInxUgTaRyLjh+YmQ5jjayIxHYyuiyyjr5XtrudDDuuDdOzQOZCGV4z
         2+fNC2muwgspMaUzcU37ZEfSoEQvTcxbPUbSrq7BV4dWLGVy/HU+hT+ISLKfGcvWym
         LZWpz9VLTAo+Wv1DR7r86EpPZQeWcco0jXk30qj1HfirLMcv4JFwulP/aL4l7bAUSF
         +2OexUO+v6iMA==
Received: by mail-lf1-f71.google.com with SMTP id br42-20020a056512402a00b003fd94a74905so3014781lfb.7
        for <linux-rtc@vger.kernel.org>; Tue, 12 Oct 2021 00:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=udP1IAy8X/njK/g0UuXAT72GSIqy69WCV4uZ074ifeI=;
        b=5VIaeIqHLPggU8O5z2Ux5oYN1K3muc1pcX2KhMw5/5z+ShJAZ1S4YnZYg7dULWfPKR
         P+HZqWrnDE9Os7OVYVjQ4tvScbqqHItqE7W0/6Ti8k9Igq5+dgdlLgEehn8gSTm3ijXg
         CTVcEqGaKafO7U0OxSaHcERU2wSTU889UT9YTLrbm2DpecOJ0cecGO0VnUoz2GT+c5yG
         Y1zqHj0E7oXi3tPRYBVRU3mmE+1Ysk3GfM4GIXldz4lZ2QHAeDjBFzOeiviZaZM7a1Md
         HR4izewFjqJf75uZDH7mSBbYGIXOYuhQBlvk8sAlgB8Lpqw9xT4x/hUnqPT2uZBat3l7
         Wd2w==
X-Gm-Message-State: AOAM530ZdpFYK9g+tsVqGmedqXC5LKR14as0VD6CO4vE99aNA0nB8ES4
        qylGmvGv3yd8AqirXqbzl/NbIp8PzVVK9D0aKhhRkQH5HymeBW2eCSjxCL7meqLkKXEuCahi75p
        WjW69YYUAQsjjPdT3qm4+K9FMrtrbDnXpvYI2Qg==
X-Received: by 2002:ac2:58ec:: with SMTP id v12mr5219501lfo.371.1634025569551;
        Tue, 12 Oct 2021 00:59:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuGOXu93SUScai/jht0fjObEgFu5dy4JCt5WDgoRepmm92+N4gqDMUlzgRq54ku3YBBsczUg==
X-Received: by 2002:ac2:58ec:: with SMTP id v12mr5219491lfo.371.1634025569352;
        Tue, 12 Oct 2021 00:59:29 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s23sm91126lfi.139.2021.10.12.00.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 00:59:28 -0700 (PDT)
Subject: Re: [PATCH 0/8] Add MAX77714 PMIC minimal driver (RTC and watchdog
 only)
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f0602023-8d8d-d34a-3bc6-41d969a83837@canonical.com>
Date:   Tue, 12 Oct 2021 09:59:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011155615.257529-1-luca@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/10/2021 17:56, Luca Ceresoli wrote:
> Hi,
> 
> this series adds minimal drivers for the Maxim Semiconductor MAX77714
> (https://www.maximintegrated.com/en/products/power/power-management-ics/MAX77714.html).
> Only RTC and watchdog are implemented by these patches.
> 
> Note! Something seems wrong in the interrupt management code. Due to the
> fact that I'm not using interrupts on my hardware and since this is my
> first addition of an MFD driver, I was unable to understand what is wrong
> after studying the code for other MFD drivers. More details in reply to
> patch 8. Advice would be greatly appreciated on this topic.
> 
> Except for that, all implemented functionality is tested and working: RTC
> read/write, watchdog start/stop/ping/set_timeout.
> 
> The first 4 patches are trivial cleanups to the max77686 drivers and can
> probably be applied easily.
> 
> Patches 5-8 add: dt bindings, mfd driver, watchdog driver and rtc driver.
> 
> Luca
> 
> Luca Ceresoli (8):
>   mfd: max77686: Correct tab-based alignment of register addresses
>   rtc: max77686: convert comments to kernel-doc format
>   rtc: max77686: rename day-of-month defines
>   rtc: max77686: remove useless variable
>   dt-bindings: mfd: add Maxim MAX77714 PMIC
>   mfd: max77714: Add driver for Maxim MAX77714 PMIC
>   watchdog: max77714: add driver for the watchdog in the MAX77714 PMIC
>   rtc: max77686: add MAX77714 support
> 
>  .../bindings/mfd/maxim,max77714.yaml          |  58 ++++++
>  MAINTAINERS                                   |   8 +
>  drivers/mfd/Kconfig                           |  14 ++
>  drivers/mfd/Makefile                          |   1 +
>  drivers/mfd/max77714.c                        | 151 ++++++++++++++++
>  drivers/rtc/Kconfig                           |   2 +-
>  drivers/rtc/rtc-max77686.c                    |  72 +++++---
>  drivers/watchdog/Kconfig                      |   9 +
>  drivers/watchdog/Makefile                     |   1 +
>  drivers/watchdog/max77714_wdt.c               | 171 ++++++++++++++++++
>  include/linux/mfd/max77686-private.h          |  28 +--
>  include/linux/mfd/max77714.h                  |  68 +++++++
>  12 files changed, 541 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
>  create mode 100644 drivers/mfd/max77714.c
>  create mode 100644 drivers/watchdog/max77714_wdt.c
>  create mode 100644 include/linux/mfd/max77714.h
> 

Thanks for the patches.

It's awesome to see extension of existing drivers - max77686 family.

Best regards,
Krzysztof
