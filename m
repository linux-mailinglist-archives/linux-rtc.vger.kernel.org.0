Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E14ED14B13A
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Jan 2020 10:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgA1JAK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Jan 2020 04:00:10 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45422 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgA1JAK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Jan 2020 04:00:10 -0500
Received: by mail-ot1-f66.google.com with SMTP id 59so11259642otp.12;
        Tue, 28 Jan 2020 01:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0I4e/KwroyEhcD+xGDep3cpzWQGs8T/AVqrKOdPlrj4=;
        b=LQUMwshiAjzuWne5dCyeGgGmGfpp9giouJIH0Q/0L7l1BkVjJ68Ur5+NwNNupxsdJo
         HvBa9tTj6eo5GO33XHGsFzY5lkLENbWcUU9q3o5K5sC+CC+YZ32Xhee2YgOs351uEE7R
         OUuWPghiKLW3Y4EZZFmON+lBxPI9KOi6b2U9KbreTBUgcm8SsvYA9qosKsOwPW40dekA
         c+GUvDKb715CzqX8e4yRgaP/NYrmE7vY0g3m+/47RSzfECN4vsJCygv4qcZhqgv0/x4B
         ve2qH+L/ZY4XdqZgzUW9KNYKIgyJRdzUWq81bs9SC5DsqpvKmsdYu0JxFuDQpApBdMr0
         s91g==
X-Gm-Message-State: APjAAAXoyaJaZlq0cnoM7fnN8qrw6d/cX2+rxXO0gZPjxxmy2hLF9erK
        KwkPPe+839X/OqW5sK4cFAhRVoy8yP6KCBzbkjA=
X-Google-Smtp-Source: APXvYqx1GtYaysodCB7P6HEXZLEzOzOQpW2WEWzoxwkSPrcTTr1WZd7l5aoFxRaHeFJfLcgduLShhYxO13RCZA/MmEo=
X-Received: by 2002:a9d:8f1:: with SMTP id 104mr14736827otf.107.1580202009264;
 Tue, 28 Jan 2020 01:00:09 -0800 (PST)
MIME-Version: 1.0
References: <20200112171349.22268-1-geert@linux-m68k.org> <20200127224549.GC3273@piout.net>
 <CAMuHMdXFkcAn8c+rPixkN0W5G14j039shhOZcvtLP_RHA9CFtQ@mail.gmail.com> <20200128085054.GA3398@piout.net>
In-Reply-To: <20200128085054.GA3398@piout.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Jan 2020 09:59:58 +0100
Message-ID: <CAMuHMdVMb5TatztfBA5Zo_R6vmM7vBzq=zUyLEhEpa3p6JnyOA@mail.gmail.com>
Subject: Re: [PATCH] rtc: i2c/spi: Avoid inclusion of REGMAP support when not needed
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Joe Perches <joe@perches.com>, linux-rtc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On Tue, Jan 28, 2020 at 9:50 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 28/01/2020 09:33:28+0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 27, 2020 at 11:45 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > > On 12/01/2020 18:13:49+0100, Geert Uytterhoeven wrote:
> > > > Merely enabling I2C and RTC selects REGMAP_I2C and REGMAP_SPI, even when
> > > > no driver needs it.  While the former can be moduler, the latter cannot,
> > > > and thus becomes built-in.
> > > >
> > > > Fix this by moving the select statements for REGMAP_I2C and REGMAP_SPI
> > > > from the RTC_I2C_AND_SPI helper to the individual drivers that depend on
> > > > it.
> > > >
> > > > Note that the comment for RTC_I2C_AND_SPI refers to SND_SOC_I2C_AND_SPI
> > > > for more information, but the latter does not select REGMAP_{I2C,SPI}
> > > > itself, and defers that to the individual drivers, too.
> > > >
> > > > Fixes: 080481f54ef62121 ("rtc: merge ds3232 and ds3234")
> > > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > ---
> > > > Joe: When merging addresses, scripts/get_maintainer.pl replaces
> > > >      Alexandre's authoritative email address from MAINTAINERS by the
> > > >      obsolete address in the SoB-line of the commit referred to by the
> > > >      Fixes-line.
> > > >
> > > >  drivers/rtc/Kconfig | 8 ++++++--
> > > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > > >
> > > Applied, thanks.
> >
> > According to the reports from kbuild test report, some drivers are still
> > missing some selects, which is exposed by this patch.
> > But perhaps you have already fixed those in your tree?
> >
>
> I did fix a bunch of those in
> https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/commit/?h=rtc-next&id=578c2b661e2b1b474ea3571a3c3c6d57bae89e8d
>
> kbuild reported that it successfully built a few configuration with that
> patch applied so I'm hoping it is enough.

Great, thanks a lot!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
