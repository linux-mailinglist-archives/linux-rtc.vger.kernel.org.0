Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E38C041D9E2
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Sep 2021 14:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350366AbhI3MgU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 30 Sep 2021 08:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350448AbhI3MgU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 30 Sep 2021 08:36:20 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675EBC06176E
        for <linux-rtc@vger.kernel.org>; Thu, 30 Sep 2021 05:34:37 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id i23so9828545wrb.2
        for <linux-rtc@vger.kernel.org>; Thu, 30 Sep 2021 05:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HRgJEndOuR4ynn0OPA7sKb8RToaEd1xX8/0RUVPc1gs=;
        b=PRGDsSbneH4StUFwwnRbLwzVrVS8dXAQMsfx9rpM11hullUX4XhH0L8xtDo2A/JSkh
         vfBLbBJodUO8FPeQngR5h+hr4KzarQc3FnV7xoLaGEAqs4Mq3Nxqk8Tka17mIGHBR8Od
         esOL2mV/wXFcVwgwNwRbo3Q3ZQnzpznbdz36TaU/MQyMq8aXDMshuKrRT/qvB5Sm90Uq
         GVOsPer9/U8+t0an4EcH7UcvvfTO0BqQiwyNuympdIbRjiTOy6VmqkBA9QuR13uL6a8c
         3cEBsixjLbEzKXW6P/6E1GmBNN1bveSx8Y12kRb7bitYdhJf98gFz7TxmEcyjy9XVeIp
         srug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HRgJEndOuR4ynn0OPA7sKb8RToaEd1xX8/0RUVPc1gs=;
        b=lACmpnkFoK8qcZNagerrcgoHNUuYYKPezaTEJwJbwfLUDQOj2FqDbynhqPH4z4QvWq
         Uhr26XPzTKIKiOf+Ps0j9x2fOiG9YypjIDqbVSxA1rPgh85nqt9TQPdwxSoDOqN5Ag3v
         DD1fsfnbzVv9SdHWyH+TOlRodHsuZFRBNb4VBVnGaKXNZ2sGJA4tltoDB3BWbzW70kRb
         1Jy1kRpJbdaqA6C1bWHOKzjQdRFf1WnR1jjrjVmVAr1Kr+GZbKyaOX9TuTOkBtrYjcbm
         5O19rSptdRE27P5wsedaDzQ8a0+C9zc6Mkdw/oTEMm2cYfqkjijZLPnZN4QLIkdRmlIR
         6jAA==
X-Gm-Message-State: AOAM53331vJ0xsE6wiEUNW4+vueIZTIh+BiL6Si1zI+ILBR/HoiHGbeU
        pWc5URml/TLvcD4opi4surI06w==
X-Google-Smtp-Source: ABdhPJzruR/5Ef2zjhhdSPBNA0SVjA7uVPC3/lwtP8K1MW5Z2+vlJQr3w2Z7LogtLW9jhnrPbK8iNw==
X-Received: by 2002:a5d:66d0:: with SMTP id k16mr5973546wrw.98.1633005275981;
        Thu, 30 Sep 2021 05:34:35 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id u5sm3175142wrg.57.2021.09.30.05.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 05:34:35 -0700 (PDT)
Date:   Thu, 30 Sep 2021 13:34:33 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
Message-ID: <YVWu2RoSqEzcG79I@google.com>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
 <CAK8P3a0zezKvexqvL29Oc44uQq-8QG7LwZy31VYJuYAYbh-Utw@mail.gmail.com>
 <YVWDsFE7qyH6AwxR@google.com>
 <8928290c-73d9-0843-25ed-2a4817ad32f7@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8928290c-73d9-0843-25ed-2a4817ad32f7@canonical.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> >   It sounds like a lack of testing is your main concern.
> > 
> >   How can I help here?  What H/W do I need to be able to fully test this?
> 
> The changes here need to be tested on affected platforms (ARMv7 and
> ARMv8), when built as a modules on some types of regular distros (e.g.
> Arch, Ubuntu). From each of such boot I would be happy to see number of
> new dmesg warnings/errors plus number of probe deferrals.
> 
> Since the drivers could be switched to modules (and some distros might
> do it), they might be hit by surprise regressions in boot performance
> due to probe deferrals. This should be also checked on these platforms.
> Geert pointed out before that clocks in many cases are not optional -
> driver needs them and will wait defer.
> 
> Assuming of course that boot succeeds. Minor differences in boot speed
> should not be a problem, I think, because distro anyway chosen
> all-module approach so it accepts the penalty.

Do you have any suggestions in terms of devboards?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
