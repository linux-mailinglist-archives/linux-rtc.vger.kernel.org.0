Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C13D138C4C
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2020 08:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728598AbgAMHZs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Jan 2020 02:25:48 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37920 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbgAMHZs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Jan 2020 02:25:48 -0500
Received: by mail-ot1-f67.google.com with SMTP id z9so5943959oth.5;
        Sun, 12 Jan 2020 23:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eyihv1VUwTMBsf8Vdp+9W+NVjjmwvawqQpBne2QlYnM=;
        b=Kqp/4dpxAjj2w91RsWLg1cJuuC6W9XVQcsy7bUjFQqIK5Ja8h8gurovv/KCibSsb1W
         YperoAf/UJO9EGb8SyxUwUDa2Sjh6tXUaEXTOMgZpQ6oK0/h05oMrdkHeMnLyyEVJPMO
         MprsgdvcUyKLQFd/gOWNG5H4mMsUPABx5aM+uDyW7tFrtWtJZM4TcABRUxAMufEYD7d2
         yJd+WTXbeNBaJ4lMtp+qFqXNIYV0Y4DaW3POEO34pCQlm5As+UMvjyJJDDpBHcxhjQF7
         kxU1svIxtTwqvylg/PG+XH1Mg4rXNV0+ghTRvIgTOAHj6fXZ71j9hvh24jhr2LW4RcJf
         dvLA==
X-Gm-Message-State: APjAAAVOhZHBOzBzE+kiqaxmdoPM8npA+X/pRzdrwb0TIvnA5kMi2JpI
        /PDX9lUqpohBfjdFfX8/0CUycsYHAcMn0deNraM=
X-Google-Smtp-Source: APXvYqxVzBCz2z5lqzdxpNmw8G28OvwDLnSjW/jq4i9r6CTFqX3Rh2cIc7OoM7I6Ne/jzVD78lZQVrIa5iSUffAmF6U=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr12522971otm.297.1578900348041;
 Sun, 12 Jan 2020 23:25:48 -0800 (PST)
MIME-Version: 1.0
References: <20200112171349.22268-1-geert@linux-m68k.org> <9286d81a883f4795176182fdb9e69bc19a8232c7.camel@perches.com>
In-Reply-To: <9286d81a883f4795176182fdb9e69bc19a8232c7.camel@perches.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Jan 2020 08:25:36 +0100
Message-ID: <CAMuHMdXRpKJNm6tFjccO67dQr=_Hc4rD1NmJzzrHPDEyja0R5w@mail.gmail.com>
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

On Mon, Jan 13, 2020 at 7:36 AM Joe Perches <joe@perches.com> wrote:
> On Sun, 2020-01-12 at 18:13 +0100, Geert Uytterhoeven wrote:
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
>
> Hi Geert
>
> What are you doing to get this changed output?

scripts/get_maintainer.pl
0001-rtc-i2c-spi-Avoid-inclusion-of-REGMAP-support-when-n.patch

> I get the same get_maintainer address output either way
> with only with the 'blamed_fixes:' content added.

Thanks, I can confirm it's fixed in next-20200110.
With v5.5-rc6, it still gives the old addresss.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
