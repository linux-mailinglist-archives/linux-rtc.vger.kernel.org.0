Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D99E313A6D7
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jan 2020 11:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731272AbgANKNz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Jan 2020 05:13:55 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43443 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732780AbgANKNz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Jan 2020 05:13:55 -0500
Received: by mail-oi1-f194.google.com with SMTP id p125so11253149oif.10;
        Tue, 14 Jan 2020 02:13:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nhe4dMBdqgwPpYNP5VrSeiAttuOEW9ljKsXuKn1iChg=;
        b=sNkZANb+6cMkW/MdRr2TBpC84lkb7QU4+O+DLFEoXyUO6x0PZkXoXWfIz3zpA+pn1S
         UDNH96DvWbnkC2lpWLPJjJBaIxeEZ8Y1iwKjalHGRXfPLngZOY1h8l0K+FXuUnmremuk
         DrhpWXJSqEWqvg+UCik2bfr0XD3+YUTtDxwzYV8KyacPh3kwW1oEyk/Wqtd/i/nfNKfd
         /ZARfRzXg0Y2ud/boUK/GaZWg4TSaU10widJhZXcvUO2rd4HMn34RakxcPWBiroaUgua
         UDSaif53x71iIdpFXgtD6btw4iA6/Wbl+7zMjk6a5SXtgP06bTBx2LEGtXoiF1x2C9+g
         KUAg==
X-Gm-Message-State: APjAAAWyTGi33U1WcIQNQ3tZXM/nGfM9l9413ODRm4uLPjZZTtt+n84h
        9jy09679ILsoXRc670snytNM03GYoomrrrAQ/ks=
X-Google-Smtp-Source: APXvYqw2cwreTjljPyr23TVCVlo2wOgU8C19eiIuaafERo+Id9ZxnBa3lQRu20TGmFd/ChK3R4hRPWnIqfUdtHP/8BA=
X-Received: by 2002:a05:6808:292:: with SMTP id z18mr15395171oic.131.1578996834671;
 Tue, 14 Jan 2020 02:13:54 -0800 (PST)
MIME-Version: 1.0
References: <20200112171349.22268-1-geert@linux-m68k.org> <9286d81a883f4795176182fdb9e69bc19a8232c7.camel@perches.com>
 <CAMuHMdXRpKJNm6tFjccO67dQr=_Hc4rD1NmJzzrHPDEyja0R5w@mail.gmail.com>
 <f35928f4e8f78be59617c0d49308001d92b314c7.camel@perches.com>
 <CAMuHMdVPFCiPtwuEhG9rd8c=aw=HnMBf+nCjftwux3m81W7igg@mail.gmail.com> <b72846874d5ee367bf86e787ca2152f90d814a34.camel@perches.com>
In-Reply-To: <b72846874d5ee367bf86e787ca2152f90d814a34.camel@perches.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Jan 2020 11:13:42 +0100
Message-ID: <CAMuHMdUpRmccLvm7S3e5x0xXJ9XVm8WGbgpbhxSQvwXXT4YzeQ@mail.gmail.com>
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

On Mon, Jan 13, 2020 at 9:13 AM Joe Perches <joe@perches.com> wrote:
> On Mon, 2020-01-13 at 08:57 +0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 13, 2020 at 8:41 AM Joe Perches <joe@perches.com> wrote:
> > > On Mon, 2020-01-13 at 08:25 +0100, Geert Uytterhoeven wrote:
> > > > On Mon, Jan 13, 2020 at 7:36 AM Joe Perches <joe@perches.com> wrote:
> > > > > On Sun, 2020-01-12 at 18:13 +0100, Geert Uytterhoeven wrote:
> > > > > > Merely enabling I2C and RTC selects REGMAP_I2C and REGMAP_SPI, even when
> > > > > > no driver needs it.  While the former can be moduler, the latter cannot,
> > > > > > and thus becomes built-in.
> > > > > >
> > > > > > Fix this by moving the select statements for REGMAP_I2C and REGMAP_SPI
> > > > > > from the RTC_I2C_AND_SPI helper to the individual drivers that depend on
> > > > > > it.
> > > > > >
> > > > > > Note that the comment for RTC_I2C_AND_SPI refers to SND_SOC_I2C_AND_SPI
> > > > > > for more information, but the latter does not select REGMAP_{I2C,SPI}
> > > > > > itself, and defers that to the individual drivers, too.
> > > > > >
> > > > > > Fixes: 080481f54ef62121 ("rtc: merge ds3232 and ds3234")
> > > > > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > > ---
> > > > > > Joe: When merging addresses, scripts/get_maintainer.pl replaces
> > > > > >      Alexandre's authoritative email address from MAINTAINERS by the
> > > > > >      obsolete address in the SoB-line of the commit referred to by the
> > > > > >      Fixes-line.
> > > > > What are you doing to get this changed output?
> > > >
> > > > scripts/get_maintainer.pl
> > > > 0001-rtc-i2c-spi-Avoid-inclusion-of-REGMAP-support-when-n.patch
> > > >
> > > > > I get the same get_maintainer address output either way
> > > > > with only with the 'blamed_fixes:' content added.
> > > >
> > > > Thanks, I can confirm it's fixed in next-20200110.
> > > > With v5.5-rc6, it still gives the old addresss.
> > >
> > > Well, OK, get_maintainer is the same but there is a
> > > different .mailmap in -next
> >
> > Indeed.
> >
> > However, I think the precedence should be
> >
> >     MAINTAINERS > .mailmap > SoB in referenced commit
> >
> > instead of
> >
> >     .mailmap > SoB in referenced commit > MAINTAINERS
> >
> > Do you agree?
>
> Well, not really.  Priority is:
>
>         1 .mailmap address
>         2 SoB address in commit message
>         2 SoB
> address in referenced Fixes: commits
>         3 MAINTAINERS address
>
> MAINTAINER entries are sometimes stale and .mailmap
> is generally more current so perhaps it should be
>
>         1 .mailmap address
>         2 SoB address in commit message
>         3 MAINTAINERS address
>         4 SoB address in referenced Fixes: commits
>
> But it seems a restructuring of get_maintainer
> would be required to do that as the Fixes: line is
> parsed before any filenames in a patch and I'm not
> too bothered by the precedence and output right
> now to muck around in get_maintainer's internals.

Exactly. There's a reason I just reported the issue, instead of sending a
patch ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
