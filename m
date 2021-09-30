Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A850841DED2
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Sep 2021 18:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350139AbhI3QXe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 30 Sep 2021 12:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349654AbhI3QXd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 30 Sep 2021 12:23:33 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDBCC06176A
        for <linux-rtc@vger.kernel.org>; Thu, 30 Sep 2021 09:21:50 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id z2so5127287wmc.3
        for <linux-rtc@vger.kernel.org>; Thu, 30 Sep 2021 09:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=s2jn0lHPoLf1efAId8/3xsFPAH4SRq6lPWCxoD2a7Hg=;
        b=nT6xrtibbxoYL66l6K6RhKbR7Qo67poQMUKio8scg8uJ92UJAusGxziakAJVB97fiE
         8Hp6S8h+HsyZWMl4yrRys7CmumNWur062havALobVkIJuUJbdPIG6e7gr5SjXX7hLIhi
         BL/5315OxdwWCL0aiYgANIjPuuyTQEMph2yLVzvZRk6CYpwW4pnl2twc0Aq63SUfu01/
         N4khHhOANTTB2CHSfwB4ln/QLyYp6PXdH1NeEUBRdc0VHns5BMHbAuyHGnd82RwKmO4a
         /MChGL9V+jXiVOloXH9wmxVlnsZulxbsDft+CQHlI3U2ZYN0bg4GjWimRYK0xznPcSYQ
         OyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=s2jn0lHPoLf1efAId8/3xsFPAH4SRq6lPWCxoD2a7Hg=;
        b=K61Bj/M33JU/NThxezkVQ8z8VFaQxURrHgQzPFzSvbEgsCWdEHHIqONSkuEfxJ3anK
         q++JMe4ts3J1QrfgVTYGBNwlyLrTqcAlg7fAq/eYubx/4eKlT47q0uYAxs9K6EXAT9rr
         F3IdVIoNsP+ne4+f1U6EhlDuFXYij4rrGAEENLd4uShjskqmLGPBL+HNE1sV+K6RKzDI
         7bkY7jM3G2LtB064nuIUddPkkDjRC0VyuJWnlW8Dj/t5JzVEJt0AkM5xQArMmmRxEpxQ
         u2Bpnn7BlC1KmQ4MrPj877L9b4gCV26VU3mrfHF76ofIeDcvLBZxtLdB+7Hs3zbRP5+P
         8TBw==
X-Gm-Message-State: AOAM533yO2hBRhMMVg0KKaeL0ndT5LRrowaj8o0fZlMjxDpxe6IHfn6+
        7xlDNMTq3DTE5VarXR/K7F+DVQ==
X-Google-Smtp-Source: ABdhPJxHo0kOUudQzwQSczt5IszTLeG7ot0KKPieImTMoPm6UwTfFAbyfy8S/9gWifGjvL7Mlbh+cg==
X-Received: by 2002:a1c:1d89:: with SMTP id d131mr154415wmd.10.1633018909320;
        Thu, 30 Sep 2021 09:21:49 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id x10sm1781527wmk.42.2021.09.30.09.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 09:21:48 -0700 (PDT)
Date:   Thu, 30 Sep 2021 17:21:46 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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
        Saravana Kannan <saravanak@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
Message-ID: <YVXkGiwAV3kGiBd3@google.com>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
 <YVWCK5QO331rfhJJ@google.com>
 <72d27a82-9d4d-1f91-bd1f-ebead3b75ffa@canonical.com>
 <YVWwBz8jrznqXah4@google.com>
 <8d260548-176e-d76b-6f05-d4d02ddd4f67@canonical.com>
 <YVW7xoHaLdGHBoEQ@google.com>
 <CAMuHMdU_dbQYHF=8uOZ3e_v4+Li0bHfQABdLVSpJJPG4XkwhZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU_dbQYHF=8uOZ3e_v4+Li0bHfQABdLVSpJJPG4XkwhZw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 30 Sep 2021, Geert Uytterhoeven wrote:

> Hi Lee,
> 
> On Thu, Sep 30, 2021 at 3:29 PM Lee Jones <lee.jones@linaro.org> wrote:
> > On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> > > On 30/09/2021 14:39, Lee Jones wrote:
> > > > On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> > > >> On 30/09/2021 11:23, Lee Jones wrote:
> > > >>> [0] Full disclosure: part of my role at Linaro is to keep the Android
> > > >>> kernel running as close to Mainline as possible and encourage/push the
> > > >>> upstream-first mantra, hence my involvement with this and other sets.
> > > >>> I assure you all intentions are good and honourable.  If you haven't
> > > >>> already seen it, please see Todd's most recent update on the goals and
> > > >>> status of GKI:
> > > >>>
> > > >>>   Article: https://tinyurl.com/saaen3sp
> > > >>>   Video:   https://youtu.be/O_lCFGinFPM
> > > >>>
> > > >>
> > > >> Side topic, why this patchset is in your scope or Will's/Google's scope?
> > > >> Just drop it from Android main kernel, it will not be your problem. I
> > > >> mean, really, you don't need this patchset in your tree at all. The only
> > > >> platform which needs it, the only platform which will loose something
> > > >> will be one specific vendor. Therefore this will be an incentive for
> > > >> them to join both discussions and upstream development. :)
> > > >
> > > > How would they fix this besides upstreaming support for unreleased
> > > > work-in-progress H/W?
> > > >
> > > > Haven't I explained this several times already? :)
> > >
> > > Either that way or the same as Will's doing but that's not my question.
> > > I understand you flush the queue of your GKI patches to be closer to
> > > upstream. Reduce the backlog/burden. you can achieve your goal by simply
> > > dropping such patch and making it not your problem. :)
> >
> > git reset --hard mainline/master   # job done - tea break  :)
> >
> > Seriously though, we wish to encourage the use of GKI so all vendors
> > can enjoy the benefits of more easily updateable/secure code-bases.
> >
> > I can't see how pushing back on seamlessly benign changes would
> > benefit them or anyone else.
> 
> I like your wording ;-)
> 
> Indeed, seamlessly benign changes, which are (1) not tested, and (2)
> some believed by the platform maintainer to break the platform.
> What can possibly go wrong? ;-)

William has already shown a willingness to test the series.

There is already a downstream proof-of-concept of this working.

I am hopeful. :)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
