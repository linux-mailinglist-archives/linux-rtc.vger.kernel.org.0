Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 531FE51C2A8
	for <lists+linux-rtc@lfdr.de>; Thu,  5 May 2022 16:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380692AbiEEOhA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 May 2022 10:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380686AbiEEOg7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 May 2022 10:36:59 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF845AA6B
        for <linux-rtc@vger.kernel.org>; Thu,  5 May 2022 07:33:18 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id h10so7946179ybc.4
        for <linux-rtc@vger.kernel.org>; Thu, 05 May 2022 07:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mjPMNwsrp6J5GYko2SAtRJngBnVXhB8jFuWLYKEwiPY=;
        b=fewd6t0m8AlbJsOL8rMMtmdSbrblLC+tou4WQa5Ukx0fDLML8yOTTiI03IEYZHxp2c
         5W5CFU2Qo00NadwNz4fu2sdMo4N/fhzCDiGLHlJnCCs1Ua3dcldY61sEg61hMdSawUir
         7eSZQI2CebwLUn4u4p9Bz1nt0xWXEswSQ1mxvA/ee4Uu5XXGOucd4+6oSzUonl+Kg0LI
         8uOzDzX7qYjSqNbAmA90tOmmW4qdH/x0e5n5IbhGhckydFuX0s17/FQo0madWUU2q0+q
         rIcDxGLzvzfaBFeSvXHNgwp/tqsLvfCOnU4JqRfERHcRhzltPIYSlpBkJGsKowlUJZN7
         2CtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mjPMNwsrp6J5GYko2SAtRJngBnVXhB8jFuWLYKEwiPY=;
        b=PFhLyTMKA5IGVcJNkRsOt/xaE0PtZaiR9YbE4H4MOP9ki0eDa2oFU0oaTegDhiAoaW
         KKjfluq898gQO8FxKVQ4XnP7xyw5S2ueh0hVQpf8o1LGDHb2Op282PB4iWseCkHYiCOA
         L5t35I2KTLhxj7X5+KvphWqqYl//3loNWxBlgY4yssZ1onNd56qT3istskTdHmMXKRu+
         rzd1WaEWFm3ed/405xC7+EjoqZnUEhvjSuARgFPvXqVFC4NZTwf6PkJX/HFz2BDc7AJl
         p6UBmalkm1fraG4r1qP14b0nORWMwWdOzB9Pr2jnhjsjHI9G0KJeXBvIkJSp5fg19zpg
         zaaQ==
X-Gm-Message-State: AOAM5328CP0CuN13J9ysDiAF1mLS2i9l5US0RKZvG5vOkwUjKXcsffLo
        Nexo5Vbe2+JzXxFZ449vhPQBHdLKsE1AxvSzYG7D1A==
X-Google-Smtp-Source: ABdhPJwo8Hf6LSoTaiB2cHkTaFM0+gz3ZfG++D4wXVwew3EevAVlxRmwDqgoKNolEWO5oTKK+x6Cg+35P6TVPloh+u0=
X-Received: by 2002:a25:bcc7:0:b0:648:d728:d39 with SMTP id
 l7-20020a25bcc7000000b00648d7280d39mr22199185ybm.514.1651761198027; Thu, 05
 May 2022 07:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org> <20220419163810.2118169-19-arnd@kernel.org>
 <CACRpkdac8dGKSEmc-HpgooJefrDtiKK+_A1Mv7AJM8yQV9UY-w@mail.gmail.com>
 <CAK8P3a0w3gFzZoBzyRsi1Ta4prESf8Fp0=quAPSKMnaXvbXNTQ@mail.gmail.com>
 <CACRpkdZNryYkidvdKuT57RM3fz6_X+3oOzF5xaOZd+TyScfUsw@mail.gmail.com> <CAK8P3a0y0tVZODpp+GSf0EkMPWbbvMqA-4kNf0NJMc0M2=2WHw@mail.gmail.com>
In-Reply-To: <CAK8P3a0y0tVZODpp+GSf0EkMPWbbvMqA-4kNf0NJMc0M2=2WHw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 May 2022 16:33:06 +0200
Message-ID: <CACRpkdaNRX0RDYJd_uaGo5jtiXu_qGHmEDGniaCmR=TZvcHH8A@mail.gmail.com>
Subject: Re: [PATCH 18/48] ARM: pxa: hx4700: use gpio descriptors for audio
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Robert Jarzmik <robert.jarzmik@free.fr>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Paul Parsons <lost.distance@yahoo.com>,
        Tomas Cech <sleep_walker@suse.com>,
        Sergey Lapin <slapin@ossfans.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        IDE-ML <linux-ide@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-mtd <linux-mtd@lists.infradead.org>,
        linux-rtc@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, May 5, 2022 at 8:04 AM Arnd Bergmann <arnd@kernel.org> wrote:
> On Wed, May 4, 2022 at 11:59 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > Thus drop one ! in front of the expression, just !SND_SOC_DAPM_EVENT_ON(event)
>
> Ok, done. But I still leave the extra 'invert=1' in hs_jack_pin[], right?
>
> /* Headphones jack detection DAPM pin */
> static struct snd_soc_jack_pin hs_jack_pin[] = {
>         {
>                 .pin    = "Headphone Jack",
>                 .mask   = SND_JACK_HEADPHONE,
>         },
>         {
>                 .pin    = "Speaker",
>                 /* disable speaker when hp jack is inserted */
>                 .mask   = SND_JACK_HEADPHONE,
>                 .invert = 1,
>         },

Hm some ASoC thingie. No idea what that is, but I suppose another
place where a subsystem for legacy reasons try to do the gpiolib
inversion on it's own accord. That one isn't flagged as active low in the
descriptor so it's fine I guess.

Possible this should be fixed in ASoC to rely on gpiolib but we can't
fix the entire world.

Yours,
Linus Walleij
