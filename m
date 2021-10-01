Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5EB41E89B
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Oct 2021 10:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352641AbhJAIDd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 1 Oct 2021 04:03:33 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:38878
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1352630AbhJAIDc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 1 Oct 2021 04:03:32 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6A567402CE
        for <linux-rtc@vger.kernel.org>; Fri,  1 Oct 2021 08:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633075294;
        bh=uaaKTJ0cQrh7xMJybw70gv2lO5lfz55pljrjd+/j8E8=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=OVCUzV6fvhi0pUssEH2uHAvp8dx42eH1SZtDmC7CddYV3yMIaMyU0EFS8lq1P6tIw
         Mvwhqot2NvZFJCsT0Sfkhs6jDSr8lotJ6rQSsh5Gd4SnBIx0/RYt7w5NaZ7DI0GRf8
         6+ZvQOKCeWp3iMH1Nx4Cnw3whI6216Q4GmNzf9hb7oL02T479NBgEXP12H7ScWwykm
         INslo2bu2PyuV4mJEWsVThOyyNkxdM0yVCEsa2ASkIMBCZxQPb9ZFZD/J7YFRcaKwU
         ToS4vjIlYet3RC9SAxdgB41aZGaA+u6hV0et0nxXgVl8KWk+g1VtbxgUR2a7qf05oD
         sYVH0UG474LWg==
Received: by mail-lf1-f69.google.com with SMTP id c24-20020ac25318000000b003f257832dfdso8142717lfh.20
        for <linux-rtc@vger.kernel.org>; Fri, 01 Oct 2021 01:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uaaKTJ0cQrh7xMJybw70gv2lO5lfz55pljrjd+/j8E8=;
        b=ShHdVK4iYVEJEQ1v6gQOJqBU6OkS2SEpEOImFL41k2QFXiJmphenPKKLMvZfhQ18KN
         xMO4iGUKCDBlDe65/10nwQBaX1T4KyCm97rI/L3AhkIz2CkPViwGWBY++GR5ACyPDs5C
         HPIiNH5TupSJxUlbzHoxyhrMdI1S/IF5688WYAt674dyz5SRIWpOqOSIlemmf/FsPRlM
         WgibKwuA4wQJVPo43B1u190XpI8Z2ot347uTjQcOVHpUh3GQ5bVuCbbMfmHZXJPZfzxv
         gd3DoYoPsfzDEEZgVJECn73kT6M5vhyunwTTYCexq4Gj7MNpi1GLSUEu5sbVRmTLS2pT
         WL9g==
X-Gm-Message-State: AOAM533XMtpbX6oSnaysCd8D93j8KkMqSX4J+WqD5M2eBbWtPpKfQCnd
        mE8JkmKHzJhIQ1a21Drs0WqUbktSXoIVOud+vriSW/8VW0eEAysrMmJIlV53eGigD73dbJhtMvz
        phG6KvZ/I7AJ9VV+IEvwIIX8BFBlanyANzZ0krw==
X-Received: by 2002:a05:6512:22c3:: with SMTP id g3mr3831330lfu.577.1633075283348;
        Fri, 01 Oct 2021 01:01:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnC0TWRcbTXzIlivq6kGBHxv6PT9DERXp0Gp0NMumXyFOXyX+j61vGOxB9oQtxeW3iWZpGuA==
X-Received: by 2002:a05:6512:22c3:: with SMTP id g3mr3831286lfu.577.1633075283077;
        Fri, 01 Oct 2021 01:01:23 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id t17sm642232lft.296.2021.10.01.01.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 01:01:22 -0700 (PDT)
To:     Will McVicker <willmcvicker@google.com>,
        Olof Johansson <olof@lixom.net>
Cc:     Saravana Kannan <saravanak@google.com>,
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
        Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
 <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com>
 <CAOesGMhQ3YsLJeQ7aUfb=0oNa3uPCx42wO1U7-ArqJTAUq1G3Q@mail.gmail.com>
 <CABYd82b7umA2h=b2NTMU7X0u8ABOjMcmh5cHOH_gyWr=QeFFTA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
Message-ID: <5d22846b-b2d8-e646-4b5c-732127e37f3a@canonical.com>
Date:   Fri, 1 Oct 2021 10:01:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CABYd82b7umA2h=b2NTMU7X0u8ABOjMcmh5cHOH_gyWr=QeFFTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 01/10/2021 07:59, Will McVicker wrote:
> On Thu, Sep 30, 2021 at 10:36 PM Olof Johansson <olof@lixom.net> wrote:
>>
>>>>
>>>> GKI is a fantastic effort, since it finally seems like Google has the
>>>> backbone to put pressure on the vendors to upstream all their stuff.
>>>>
>>>> This patcheset dilutes and undermines all of that by opening up a
>>>> truck-size loophole, reducing the impact of GKI, and overall removes
>>>> leverage to get vendors to do the right thing.
>>>>
>>>> It's against our interest as a community to have this happen, since
>>>> there's no other reasonably justifiable reason to do this.
> 
> Are you saying that modularizing drivers is opening up a loophole? How
> is this different from Krysztof pushing changes to modularize the
> Exynos ChipId driver just last week [1].  

Modularizing drivers, which can work as modules or even can be disabled
because they are not essential for platform boot, is not opening
loophole and is helping upstream platforms. Modularizing everything,
even essential drivers, because downstream does not want to contribute
rest of its drivers, is not beneficial to the upstream project. Since
downstream does want to contribute its platforms and drivers, it decides
to change mainline project to fits its needs. Only its needs, not others.

I was repeating this multiple times - there is no point, no incentive
for the mainline to allow disabling essential SoC drivers. It's only
downstream interest without any benefit to the upstream.


Best regards,
Krzysztof
