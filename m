Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB21814B0E2
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Jan 2020 09:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725867AbgA1Idl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Jan 2020 03:33:41 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42166 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgA1Idl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Jan 2020 03:33:41 -0500
Received: by mail-ot1-f66.google.com with SMTP id 66so11215657otd.9;
        Tue, 28 Jan 2020 00:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kc0VoA99mH7cpDICaAlW5aG5aA2pYr3RLdiKmmW9Dbc=;
        b=U5HYkf2siBP0VCn5ciV4U+9GFSGsss/YEJ+x4EJeex+vQIM3EpngQHOoQ9lY20c9dP
         UpDj8WdOba281q0Uiq1BwkC7g5gDA7PG/d/r0/GG7aTfYmur1dWwLJgvqtF1tTD+zL5c
         RioGpwGDtofn9YYn7G0TZElxYxXkGMiZGQxXzqRZ2gJMtTEjCR3OWVtLTeOh3dE58aBG
         85YUjb1JmD3zEY+pvzGJ9OE6bnquOhY+CsCFh6CrOObXqgokTFW1yaKqoAqXqz8G/v7h
         s4cKtbVx8iI3kvE0N/hT/hs6kROWJmex8Umk0bM/x/nlFgujUyGaGyHk5KHUbZPs1CDR
         01Hw==
X-Gm-Message-State: APjAAAVpsGyiXa2ZffgvH0ddFx+EGxaQPtNi7KG/5O/63vQZt3pG/Xu3
        Jbs1/zIFvasWS+HH4mtSugMY2O5oOK5acPcp9Ug=
X-Google-Smtp-Source: APXvYqxe3mRp7uhmTw1LXbcE50kCmrfg48p55fCdLL7DzsWNS+Aer4fw9Y7lO/VVZvgK1jbCD3X8l5Z4AkpTsfH2Qb8=
X-Received: by 2002:a9d:8f1:: with SMTP id 104mr14685226otf.107.1580200419942;
 Tue, 28 Jan 2020 00:33:39 -0800 (PST)
MIME-Version: 1.0
References: <20200112171349.22268-1-geert@linux-m68k.org> <20200127224549.GC3273@piout.net>
In-Reply-To: <20200127224549.GC3273@piout.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Jan 2020 09:33:28 +0100
Message-ID: <CAMuHMdXFkcAn8c+rPixkN0W5G14j039shhOZcvtLP_RHA9CFtQ@mail.gmail.com>
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

On Mon, Jan 27, 2020 at 11:45 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 12/01/2020 18:13:49+0100, Geert Uytterhoeven wrote:
> > Merely enabling I2C and RTC selects REGMAP_I2C and REGMAP_SPI, even when
> > no driver needs it.  While the former can be moduler, the latter cannot,
> > and thus becomes built-in.
> >
> > Fix this by moving the select statements for REGMAP_I2C and REGMAP_SPI
> > from the RTC_I2C_AND_SPI helper to the individual drivers that depend on
> > it.
> >
> > Note that the comment for RTC_I2C_AND_SPI refers to SND_SOC_I2C_AND_SPI
> > for more information, but the latter does not select REGMAP_{I2C,SPI}
> > itself, and defers that to the individual drivers, too.
> >
> > Fixes: 080481f54ef62121 ("rtc: merge ds3232 and ds3234")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > Joe: When merging addresses, scripts/get_maintainer.pl replaces
> >      Alexandre's authoritative email address from MAINTAINERS by the
> >      obsolete address in the SoB-line of the commit referred to by the
> >      Fixes-line.
> >
> >  drivers/rtc/Kconfig | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> Applied, thanks.

According to the reports from kbuild test report, some drivers are still
missing some selects, which is exposed by this patch.
But perhaps you have already fixed those in your tree?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
