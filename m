Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 531DD81812
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Aug 2019 13:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728508AbfHELWO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Mon, 5 Aug 2019 07:22:14 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35717 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfHELWO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Aug 2019 07:22:14 -0400
Received: by mail-ed1-f67.google.com with SMTP id w20so78273004edd.2;
        Mon, 05 Aug 2019 04:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=POTNxP3AjMTaPkdeyyx4Dxti+m69fQ7c9W1amjBaX2U=;
        b=Ie33/99KY7PGsEbjZw96oSZP++Tk0awAqmq2uQ0/pja4GupQtXVX3Q9R+jXkDclEkS
         bR8FBl/SvaEa8DYPEMeXNmKCcV1Or4kYuG3FS2tgvF4AN1pO+0pLBwvnI59C0tQeBQoY
         R449AEGuu94s8X2N4vK+2uWRgf36+FOEFcmtR3AdJMaFolh6OGTJW4dVKcT/MXlMdYLt
         iKJXpIC6LOhwIVkD/DMyQ3G5oPKFWOkkraM+IOYMgRkW0ei0AxWfPQQSkSet4PB/gLfl
         kBREki2zJN7FXG+4Ke2TDKSqjEnITxybN98dMuyPxQlAJyjxHNaI9hxce5D1w7kfUAJ1
         9zIA==
X-Gm-Message-State: APjAAAUg8UY6pe8MYWncCcLs/5nLZoR48SGtFsh905JoSNjrcMND7Mbk
        x9W23lZoSJF98LeSisjsbOrZzpUUrgE=
X-Google-Smtp-Source: APXvYqxANB1FEsd3js1qpgNepjCM9PtEvZwkh/WjOmfbDMrzPCnOaXmT1L74j9HlieTF6olLnVgvfg==
X-Received: by 2002:a17:906:5859:: with SMTP id h25mr118152860ejs.202.1565004130684;
        Mon, 05 Aug 2019 04:22:10 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id t7sm7247860edw.87.2019.08.05.04.22.09
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 04:22:09 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id g67so68507050wme.1;
        Mon, 05 Aug 2019 04:22:09 -0700 (PDT)
X-Received: by 2002:a05:600c:21d4:: with SMTP id x20mr16976082wmj.61.1565004129249;
 Mon, 05 Aug 2019 04:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190412120730.473-1-megous@megous.com> <20190412120730.473-3-megous@megous.com>
 <CAGb2v675j-aCLMgPJOzr9yx1XxsUvHRr_K7VnL=p8mSdwpu2jw@mail.gmail.com>
 <20190805104529.z3mex3m2tss7lzlr@core.my.home> <CAGb2v67pcxdxjdRX_HN4133A32eA566DDtUJUKV7pqzxDtOaeg@mail.gmail.com>
 <20190805111037.76vmanzcurffpbdf@core.my.home>
In-Reply-To: <20190805111037.76vmanzcurffpbdf@core.my.home>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Mon, 5 Aug 2019 19:21:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v65vEK0k3grQyXzzJ0mTXNZZQxg1FPAES6x2z8ZhyhNftA@mail.gmail.com>
Message-ID: <CAGb2v65vEK0k3grQyXzzJ0mTXNZZQxg1FPAES6x2z8ZhyhNftA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 2/3] rtc: sun6i: Add support for H6 RTC
To:     =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-rtc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Aug 5, 2019 at 7:10 PM Ondřej Jirman <megous@megous.com> wrote:
>
> On Mon, Aug 05, 2019 at 06:54:17PM +0800, Chen-Yu Tsai wrote:
> > On Mon, Aug 5, 2019 at 6:45 PM Ondřej Jirman <megous@megous.com> wrote:
> > >
> > > On Mon, Aug 05, 2019 at 06:16:14PM +0800, Chen-Yu Tsai wrote:
> > > > On Fri, Apr 12, 2019 at 8:07 PM megous via linux-sunxi
> > > > <linux-sunxi@googlegroups.com> wrote:
> > > > >
> > > > > From: Ondrej Jirman <megous@megous.com>
> > > > >
> > > > > RTC on H6 is mostly the same as on H5 and H3. It has slight differences
> > > > > mostly in features that are not yet supported by this driver.
> > > > >
> > > > > Some differences are already stated in the comments in existing code.
> > > > > One other difference is that H6 has extra bit in LOSC_CTRL_REG, called
> > > > > EXT_LOSC_EN to enable/disable external low speed crystal oscillator.
> > > > >
> > > > > It also has bit EXT_LOSC_STA in LOSC_AUTO_SWT_STA_REG, to check whether
> > > > > external low speed oscillator is working correctly.
> > > > >
> > > > > This patch adds support for enabling LOSC when necessary:
> > > > >
> > > > > - during reparenting
> > > > > - when probing the clock
> > > > >
> > > > > H6 also has capacbility to automatically reparent RTC clock from
> > > > > external crystal oscillator, to internal RC oscillator, if external
> > > > > oscillator fails. This is enabled by default. Disable it during
> > > > > probe.
> > > > >
> > > > > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > > > > ---
> > > > >  drivers/rtc/rtc-sun6i.c | 40 ++++++++++++++++++++++++++++++++++++++--
> > > > >  1 file changed, 38 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > > > > index 11f56de52179..7375a530c565 100644
> > > > > --- a/drivers/rtc/rtc-sun6i.c
> > > > > +++ b/drivers/rtc/rtc-sun6i.c
> > > > > @@ -41,9 +41,11 @@
> > > > >  /* Control register */
> > > > >  #define SUN6I_LOSC_CTRL                                0x0000
> > > > >  #define SUN6I_LOSC_CTRL_KEY                    (0x16aa << 16)
> > > > > +#define SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS                BIT(15)
> > > >
> > > > Manual says bit 14? Or is this different from LOSC_AUTO_SWT_EN?
> > > >
> > > > The rest looks ok.
> > >
> > > To give you more information. This is a new thing in H6 BSP, compared
> > > to BSPs for previous SoCs (H5/H3).
> > >
> > >  20 #define REG_CLK32K_AUTO_SWT_EN                  BIT(14)
> > >  21 #define REG_CLK32K_AUTO_SWT_BYPASS              BIT(15)
> > >
> > > Init sequence changed in H6 BSP to:
> > >
> > > 646         /*
> > > 647          * Step1: select RTC clock source
> > > 648          */
> > > 649         tmp_data = readl(chip->base + SUNXI_LOSC_CTRL);
> > > 650         tmp_data &= (~REG_CLK32K_AUTO_SWT_EN);
> > > 651
> > > 652         /* Disable auto switch function */
> > > 653         tmp_data |= REG_CLK32K_AUTO_SWT_BYPASS;
> > > 654         writel(tmp_data, chip->base + SUNXI_LOSC_CTRL);
> > > 655
> > > 656         tmp_data = readl(chip->base + SUNXI_LOSC_CTRL);
> > > 657         tmp_data |= (RTC_SOURCE_EXTERNAL | REG_LOSCCTRL_MAGIC);
> > > 658         writel(tmp_data, chip->base + SUNXI_LOSC_CTRL);
> > > 659
> > > 660         /* We need to set GSM after change clock source */
> > > 661         udelay(10);
> > > 662         tmp_data = readl(chip->base + SUNXI_LOSC_CTRL);
> > > 663         tmp_data |= (EXT_LOSC_GSM | REG_LOSCCTRL_MAGIC);
> > > 664         writel(tmp_data, chip->base + SUNXI_LOSC_CTRL);
> > > 665
> >
> > I don't have this in my H6 BSPs. One is H6 Lichee v1.1 downloaded from Pine64.
> > The link was from linux-sunxi wiki's H6 page.
> >
> > The other is a 4.9 kernel tree, which I believe is from Allwinner's github:
> >
> >     https://github.com/Allwinner-Homlet/H6-BSP4.9-linux
>
> Interesting. :) I have the BSP I was using saved here:
>
> https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.c?h=h6-4.9-bsp#n649
>
> It's based of 4.9.119
>
> https://megous.com/git/linux/log/?h=h6-4.9-bsp
>
> I don't remember where I found it. But I imported it fairly recently, and
> the code you pointed to looks like an older version that I can found in some
> beta H6 BSP, that I imported way earlier and is based on 4.9.56:
>
> https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.c?h=linux-h6
> https://megous.com/git/linux/log/?h=linux-h6
>
> Hmm, archeology. :)

That's good enough for me. I suppose if we do have any more doubts we could
ask them directly.


Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> > > For older BSPs, the init sequence looked like this:
> > >
> > > 482         /*
> > > 483          * Step1: select RTC clock source
> > > 484          */
> > > 485         tmp_data = sunxi_rtc_read(SUNXI_LOSC_CTRL_REG);
> > > 486         tmp_data &= (~REG_CLK32K_AUTO_SWT_EN);
> > > 487         tmp_data |= (RTC_SOURCE_EXTERNAL | REG_LOSCCTRL_MAGIC);
> > > 488         tmp_data |= (EXT_LOSC_GSM);
> > > 489         sunxi_rtc_write(tmp_data, SUNXI_LOSC_CTRL_REG);
> > > 490
> > >
> > > EXT_LOSC_GSM has values 4 values from low to high, and I guess it configures
> > > gain for the oscillator's amplifier in the feedback loop of the circuit.
> > >
> > > So the new code, for some reason changed from single write to sequence
> > > of individual writes/config steps:
> > >
> > > 1) disable auto-switch and enable auto-switch bypass
> > > 2) select RTC clock source (to LOSC)
> > >   (wait)
> >
> > Maybe it's possible to glitch if these two are combined?
>
> That's what I thought too. Or the programmer thought so, and was just
> programming defensively, and there's no real problem in the practice.
>
> But that specific delay() seems like someone trying to solve a real issue. Of
> course there's no knowing if it was on H6 or on some other SoC.

It's probably for the clock waveform to stabilize. Why they do it _after_
switching to the clock is weird though.

> regards,
>         o.
>
> >
> > > 3) configure gain on the LOSC
> > >
> > > regards,
> > >         o.
> > >
> > > > ChenYu
> > >
> > > --
> > > You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> > > To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> > > To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20190805104529.z3mex3m2tss7lzlr%40core.my.home.
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20190805111037.76vmanzcurffpbdf%40core.my.home.
