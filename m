Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE23512FC7
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Apr 2022 11:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231552AbiD1JtV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 Apr 2022 05:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345655AbiD1Jbb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 28 Apr 2022 05:31:31 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498857E584;
        Thu, 28 Apr 2022 02:28:17 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id y3so2990973qtn.8;
        Thu, 28 Apr 2022 02:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UzgLlvHeKfXdKa9mQi9Qa9I2XaZoaDHqGD6rpDfkfEM=;
        b=ICIxQ6Ra0y19lwtKgEbxgiiEGbGJ487TZHEFBxb7pxQUyx9XB0xsGOAcHhqEqVrJFU
         beVvRpyE4WNgVL16VOLHnjYWup2wIGIiYdCanLiHbbVTJZmas9GI53W2QzCBy2SEI+Cw
         8oKG6+vMH8yQAYdNO3wAUxAHvPm+pRwfgI9Vz6/MIXfzZmPTHlcMAkcl+m8/nAufxoW2
         Lb/lodOuET7JexZfAUwpwTJzGQpV1AhyWrK6f/wWCZk1HOyuVn0aHzpRAF88tx1YbvjW
         5jmpuiUosdKn7+CpcrbNMUmspZE+SmHaY5dOMDqJOkRLkCJe1ddt6/8izSPfjjW2n6fH
         HIEg==
X-Gm-Message-State: AOAM5334krQut+OxOixwweXwNaaXYFWn2n6fr33th4leVytAr2Ocv6Fh
        anOmZlmuG6b4XJ3bVRMkPhZ8Nr3iv/W+jA==
X-Google-Smtp-Source: ABdhPJy9RHWxQ86Wi805QX8YiNPLgMfv+NELSifNF8ZS/vCB4/IncOVs71Y7bX1llGU+j1+C+BBfWA==
X-Received: by 2002:a05:622a:253:b0:2e2:33fb:a583 with SMTP id c19-20020a05622a025300b002e233fba583mr22049621qtx.92.1651138096115;
        Thu, 28 Apr 2022 02:28:16 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id u18-20020a05622a011200b002f38843e32asm949761qtw.35.2022.04.28.02.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 02:28:15 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-2f7c424c66cso46324977b3.1;
        Thu, 28 Apr 2022 02:28:15 -0700 (PDT)
X-Received: by 2002:a81:e10d:0:b0:2f7:bb2a:6529 with SMTP id
 w13-20020a81e10d000000b002f7bb2a6529mr28455005ywh.62.1651138095015; Thu, 28
 Apr 2022 02:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220421090016.79517-1-miquel.raynal@bootlin.com>
 <20220421090016.79517-4-miquel.raynal@bootlin.com> <CAMuHMdVBxeH=G8Dj0d=vS80c356Z+D2fsxRr6n+bzMxXX=D9+Q@mail.gmail.com>
 <20220428110917.6b1a19ce@xps13>
In-Reply-To: <20220428110917.6b1a19ce@xps13>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 11:28:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPuut+c7ujTPgSvquRXyB=6r9GqXzVG+RPZLkEmL2oSw@mail.gmail.com>
Message-ID: <CAMuHMdVPuut+c7ujTPgSvquRXyB=6r9GqXzVG+RPZLkEmL2oSw@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] rtc: rzn1: Add new RTC driver
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-rtc@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Michel Pollet <michel.pollet@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Miquel,

On Thu, Apr 28, 2022 at 11:09 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> geert@linux-m68k.org wrote on Thu, 28 Apr 2022 10:58:03 +0200:
> > On Thu, Apr 21, 2022 at 11:00 AM Miquel Raynal
> > <miquel.raynal@bootlin.com> wrote:
> > > From: Michel Pollet <michel.pollet@bp.renesas.com>
> > >
> > > Add a basic RTC driver for the RZ/N1.
> > >
> > > Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> > > Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

> > > --- /dev/null
> > > +++ b/drivers/rtc/rtc-rzn1.c
> >
> > > +static int rzn1_rtc_probe(struct platform_device *pdev)
> > > +{
> > > +       struct rzn1_rtc *rtc;
> > > +       int ret;
> > > +
> > > +       rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> > > +       if (!rtc)
> > > +               return -ENOMEM;
> > > +
> > > +       platform_set_drvdata(pdev, rtc);
> > > +
> > > +       rtc->clk = devm_clk_get(&pdev->dev, "hclk");
> > > +       if (IS_ERR(rtc->clk))
> > > +               return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk), "Missing hclk\n");
> >
> > As you don't care about the clock rate, only about enabling/disabling
> > the clock, I recommend using Runtime PM instead of explicit clock
> > handling.
>
> That's right.
>
> > That does depend on:
> > [PATCH v3 4/8] soc: renesas: rzn1: Select PM and PM_GENERIC_DOMAINS configs[1]
> > [PATCH v3 5/8] ARM: dts: r9a06g032: Add missing '#power-domain-cells'[2]
>
> There should not be any dependency with the RTC tree so that should not
> be too complex to handle.

Agreed.

> > and on documenting the power-domains property to the RTC DT bindings,
> > and on adding a proper power-domains property to the RTC node in DTS.
>
> Right.
>
> Do we need to define these properties in the UART, DMA and NAND
> controller nodes as well? I seem to remember that you mentioned it but
> I don't recall for which one and I was too focused (lazy?) on other
> features so I forgot about it.

It would be good to have them everywhere.  The initial RZ/N1D DTS
lacked them, as it only had the uart driver, which is not a Renesas
IP core.

The dw-dmac and 8250_dw drivers already use Runtime PM.
The renesas-nand-controller driver can be updated later, after the
power-domains properties have been added to the DTS.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
