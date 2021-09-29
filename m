Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEBB41CD12
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Sep 2021 22:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245133AbhI2UDd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 29 Sep 2021 16:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345675AbhI2UDc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 29 Sep 2021 16:03:32 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10CB8C06161C
        for <linux-rtc@vger.kernel.org>; Wed, 29 Sep 2021 13:01:51 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id x7so12785105edd.6
        for <linux-rtc@vger.kernel.org>; Wed, 29 Sep 2021 13:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QVoV53fmEUeXJCW4y56wBFPMYAfyeaHxeC0GyF+IsHY=;
        b=WFb2peLCM29bT5fbZcRB1U1qwkmqtZpPMoiIUeVEM+cFVB1Pqfaa7JcXjT4vRxCxaE
         JMZ+Y6UbyxD+/o6VARqaK7WDFv6cdUhWIDwb4YSQTVV4Xd4qJ1++jl7QlH3R3cN4Hhda
         CMd3R4O/jkL8PK5rvcU5Sc8JC/tYvGThln9yHqwTqZ8MgExUKyFBya7UOiSX9fnjXNs/
         3oQms6XsgLw5dZkH4QZ9aWd32To0Xf/9lPgvK2dRN1LZCdAULaNBTjcl+lpZ2sd75vff
         fS0VJb3UJy4PvbIjpXj5Lrqinvu4UVhNYmfBmILb9ieH3ZIbeBqkCCcydiKrjYnKe0pZ
         UIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QVoV53fmEUeXJCW4y56wBFPMYAfyeaHxeC0GyF+IsHY=;
        b=j7aZ2B5Bcvlvm6znpBUZSWN/a2laiZoCMLp8CUsw+hmJpso8M0yRkkQHPzf/ueRo5+
         d3hYZ+QZIzrmgJRqLWhPLvxhjUFWpW3RDAjslfuB1xlonEpLQQ9HfKzd2oFcsvvsCjmm
         tBNqSN8faOOoAvN7VGtd4eX6iQ51Ve5Gzb9Nxovsqz1JNTOxzDSklb7l4ycdNJHjzTeM
         n0sWkzCAx+oIecZOP/4wfxmWpxQNRkj3MCT4npf2qrOZitrV4wXZqw5msZbJF5COTUBf
         k5aD6Aa49IucO1dsFczwci3b0ad7esiE1EN+dyR81lGsXQVo9S3Br/ZYgd9UTE0QV1Uz
         42+w==
X-Gm-Message-State: AOAM532jFMdwc3v4ySl3uJ2Lq7vhCYlQjPBQGAKKIU/bO9biqEIVxarj
        V0z+i22enx8475H8tYnn4eJYorYA8t0ymv8N+3Nmkw==
X-Google-Smtp-Source: ABdhPJxW/5c5Zm0f6VzlmAE5ubXryikV3fZZQv6MmG3s5nD+j3ke3SZ3s5Of1FQgOZu0GnjUf+fda8e2ZNlPw37L3uQ=
X-Received: by 2002:a05:6402:1b8d:: with SMTP id cc13mr2169435edb.235.1632945707418;
 Wed, 29 Sep 2021 13:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <20210928235635.1348330-3-willmcvicker@google.com> <CALAqxLUju1Bw0dDpi_oK6-eOiP6B2Xm1MV19G53WaRFm3Z_AWw@mail.gmail.com>
In-Reply-To: <CALAqxLUju1Bw0dDpi_oK6-eOiP6B2Xm1MV19G53WaRFm3Z_AWw@mail.gmail.com>
From:   Will McVicker <willmcvicker@google.com>
Date:   Wed, 29 Sep 2021 13:01:31 -0700
Message-ID: <CABYd82Z4pgJpYVhJEGjgbWgSQp7if_=Rf03VmTu+U9D3b=dVzA@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] timekeeping: add API for getting timekeeping_suspended
To:     John Stultz <john.stultz@linaro.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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
        Thomas Gleixner <tglx@linutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Android Kernel Team <kernel-team@android.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Sep 28, 2021 at 8:42 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Tue, Sep 28, 2021 at 4:56 PM Will McVicker <willmcvicker@google.com> wrote:
> >
> > This allows modules to access the value of timekeeping_suspended without
> > giving them write access to the variable.
> >
>
> It's important to cover "the why" not "the what" in these commit
> messages, so you might add a note as to what code will be the user of
> this (the samsung/clk-pll.c code changed later in this series).
>
> thanks
> -john

Thanks John for the tip. I will try to be better at that in the followup.

For this specific patch, I am adding this new API because the Samsung
PLL driver (drivers/clk/samsung/clk-pll.c) currently is using the
variable 'timekeeping_suspended' to detect timeouts before the
clocksource is initialized or timekeeping itself is suspended. My
patch series aims to modularize the Samsung PLL driver. So to keep the
driver's functionality intact, I need to add this additional API.

--Will
