Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 764A3512F34
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Apr 2022 10:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344836AbiD1JBc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 Apr 2022 05:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344837AbiD1JBb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 28 Apr 2022 05:01:31 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F68B694A2;
        Thu, 28 Apr 2022 01:58:17 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id hh4so2949475qtb.10;
        Thu, 28 Apr 2022 01:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bf6supRnDVkLHSvB4+lTP0i1KpYHN4qgnF9DWCzHSgU=;
        b=E1kSYhVVbPRBn3jA8jdDoMa0RKmgS8bubugQlPueRA+dxZbyo2FRo3PVJb2gaCYkbJ
         gusKs1rluv6Egyo82jbN11BjHwEBX/aIZnp97LpQg1DhPRXqprc0TUNqXditFr5Fq2UM
         o2kZBORiH0BwNoesv5peZumJMQCFY1GPQsIGLNVS0MvKt89rQM1wfEC4GUe8EzUq5cfA
         AUcBQylenGe5tIP14URQ/hdQ+iOzbqpaL8QGTWwOEGiOSMX6lAmlqM3FdAVEcQDx5oCt
         Zg6ye8CX025RW4w5fcFQekBTX8KUDp2H342QgJkhL9/2WJxvDwS0JUi5pVeu3V0q+2mi
         XRUg==
X-Gm-Message-State: AOAM531qPdQEVAXu/9Sj83EIFyWx9JSeKlve6mocgUVi+QdGp6v8edNU
        d2XY6JAb3qMVQQz3NLKZuq8fWiYDx84RcQ==
X-Google-Smtp-Source: ABdhPJzbFDb9PRuwCICsKwnr+lsRn55KTJe9KPwFqFYw5Ky4INoAdinSLRElsc2U7FTf6ladjCuWrA==
X-Received: by 2002:a05:622a:5:b0:2f3:7dd0:3d13 with SMTP id x5-20020a05622a000500b002f37dd03d13mr8115214qtw.362.1651136296171;
        Thu, 28 Apr 2022 01:58:16 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id s12-20020a05622a018c00b002f2017d5652sm11559747qtw.40.2022.04.28.01.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 01:58:15 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id y2so7798978ybi.7;
        Thu, 28 Apr 2022 01:58:15 -0700 (PDT)
X-Received: by 2002:a25:8087:0:b0:641:dd06:577d with SMTP id
 n7-20020a258087000000b00641dd06577dmr29428113ybk.207.1651136295438; Thu, 28
 Apr 2022 01:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220421090016.79517-1-miquel.raynal@bootlin.com> <20220421090016.79517-4-miquel.raynal@bootlin.com>
In-Reply-To: <20220421090016.79517-4-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 10:58:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBxeH=G8Dj0d=vS80c356Z+D2fsxRr6n+bzMxXX=D9+Q@mail.gmail.com>
Message-ID: <CAMuHMdVBxeH=G8Dj0d=vS80c356Z+D2fsxRr6n+bzMxXX=D9+Q@mail.gmail.com>
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

On Thu, Apr 21, 2022 at 11:00 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> From: Michel Pollet <michel.pollet@bp.renesas.com>
>
> Add a basic RTC driver for the RZ/N1.
>
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1548,6 +1548,13 @@ config RTC_DRV_RS5C313
>         help
>           If you say yes here you get support for the Ricoh RS5C313 RTC chips.
>
> +config RTC_DRV_RZN1
> +       tristate "Renesas RZN1 RTC"

RZ/N1

> +       depends on ARCH_RZN1 || COMPILE_TEST
> +       depends on OF && HAS_IOMEM
> +       help
> +         If you say yes here you get support for the Renesas RZ/N1 RTC.
> +
>  config RTC_DRV_GENERIC
>         tristate "Generic RTC support"
>         # Please consider writing a new RTC driver instead of using the generic

> --- /dev/null
> +++ b/drivers/rtc/rtc-rzn1.c

> +static int rzn1_rtc_probe(struct platform_device *pdev)
> +{
> +       struct rzn1_rtc *rtc;
> +       int ret;
> +
> +       rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> +       if (!rtc)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, rtc);
> +
> +       rtc->clk = devm_clk_get(&pdev->dev, "hclk");
> +       if (IS_ERR(rtc->clk))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk), "Missing hclk\n");

As you don't care about the clock rate, only about enabling/disabling
the clock, I recommend using Runtime PM instead of explicit clock
handling.

That does depend on:
[PATCH v3 4/8] soc: renesas: rzn1: Select PM and PM_GENERIC_DOMAINS configs[1]
[PATCH v3 5/8] ARM: dts: r9a06g032: Add missing '#power-domain-cells'[2]
and on documenting the power-domains property to the RTC DT bindings,
and on adding a proper power-domains property to the RTC node in DTS.

[1] https://lore.kernel.org/linux-renesas-soc/20220422120850.769480-5-herve.codina@bootlin.com
[2] https://lore.kernel.org/linux-renesas-soc/20220422120850.769480-6-herve.codina@bootlin.com

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
