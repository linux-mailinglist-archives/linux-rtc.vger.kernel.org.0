Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FAA5138C8F
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2020 08:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgAMH5m (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Jan 2020 02:57:42 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40596 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728679AbgAMH5m (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Jan 2020 02:57:42 -0500
Received: by mail-oi1-f195.google.com with SMTP id c77so7407076oib.7;
        Sun, 12 Jan 2020 23:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DFM30rCzTPD/hJIn8LUYKQwpr92u3LKGP51jLhCQjVY=;
        b=ZybdAP7tfsJ8wVSBAn+5hN+2T2a6q1UYre6YwHnw42rzXxSXxS5ZdaryVwia2SPWBX
         p+VMqRf2jBdMetOOuS+3ktLU4g4GvnaH6XuDGC0dP2WwHCsRLGK6OVSzwgnxkCDFYc4z
         hZFCHsRq19lqhq9bfa+5rWW2oGu8ymu/49pekjd5W6zTxx0V8qaVE20HsKcsAOCPm96x
         WGWo3EyCcJr7nMHYFTrW5pF0mRV7cTAWGgJRRg5HIggjfRsQ0ktKuvIznjatufkx2vII
         loS7+fkGvcOnp1ENOpw2fYsJ+LDC4eOkjIs3vqEA+d9di6yZeKG0d/UuQ2UqQ2yMZNbK
         IE6A==
X-Gm-Message-State: APjAAAXR1wsGwj5vulfOONCyf5kzm81v0XYjxGd0XdNnWdsbJMdN8asQ
        M3UBnsCpCMN69Q1zQ4UwMriJ7wWa8NVmOnwMzBM=
X-Google-Smtp-Source: APXvYqxULVjUkTLzZzNE8RwsGd03pA2wKpaS8gX8AGzJf6sEPx0G/vK4vcDHJVnM41bLpOC02QyfdCvc+cIVjxwostg=
X-Received: by 2002:aca:5905:: with SMTP id n5mr12100117oib.54.1578902261273;
 Sun, 12 Jan 2020 23:57:41 -0800 (PST)
MIME-Version: 1.0
References: <20200112171349.22268-1-geert@linux-m68k.org> <9286d81a883f4795176182fdb9e69bc19a8232c7.camel@perches.com>
 <CAMuHMdXRpKJNm6tFjccO67dQr=_Hc4rD1NmJzzrHPDEyja0R5w@mail.gmail.com> <f35928f4e8f78be59617c0d49308001d92b314c7.camel@perches.com>
In-Reply-To: <f35928f4e8f78be59617c0d49308001d92b314c7.camel@perches.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Jan 2020 08:57:30 +0100
Message-ID: <CAMuHMdVPFCiPtwuEhG9rd8c=aw=HnMBf+nCjftwux3m81W7igg@mail.gmail.com>
Subject: Re: [PATCH] rtc: i2c/spi: Avoid inclusion of REGMAP support when not needed
To:     Joe Perches <joe@perches.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        linux-rtc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Joe,

On Mon, Jan 13, 2020 at 8:41 AM Joe Perches <joe@perches.com> wrote:
> On Mon, 2020-01-13 at 08:25 +0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 13, 2020 at 7:36 AM Joe Perches <joe@perches.com> wrote:
> > > On Sun, 2020-01-12 at 18:13 +0100, Geert Uytterhoeven wrote:
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
> > >
> > > Hi Geert
> > >
> > > What are you doing to get this changed output?
> >
> > scripts/get_maintainer.pl
> > 0001-rtc-i2c-spi-Avoid-inclusion-of-REGMAP-support-when-n.patch
> >
> > > I get the same get_maintainer address output either way
> > > with only with the 'blamed_fixes:' content added.
> >
> > Thanks, I can confirm it's fixed in next-20200110.
> > With v5.5-rc6, it still gives the old addresss.
>
> Well, OK, get_maintainer is the same but there is a
> different .mailmap in -next

Indeed.

However, I think the precedence should be

    MAINTAINERS > .mailmap > SoB in referenced commit

instead of

    .mailmap > SoB in referenced commit > MAINTAINERS

Do you agree?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
