Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C45F85171C8
	for <lists+linux-rtc@lfdr.de>; Mon,  2 May 2022 16:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238171AbiEBOpD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 May 2022 10:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233988AbiEBOpD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 2 May 2022 10:45:03 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30ADDDCA;
        Mon,  2 May 2022 07:41:34 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id ke5so10342154qvb.5;
        Mon, 02 May 2022 07:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F3UExsrsufW/5/VNk+XHN4yCY4oOPNKng6Dv595Sda8=;
        b=oR8mgeszXl0a8q8cUUa1NNVFTxrt1fZW6wL6nsKC35clkmwirjFMACwKEWx42RPLmC
         ebk3JdepIeLrXJSYzJk+5OmqEuLid8tlAozchDmp2c57/rgOmnCFTkdrePQyLyY408a5
         mUA5dgxsHfpR7VH7rCnqGqxAIAh31EejiZ7luu3Ml2DhXmGeouo5e3HX4dr5EBCmsQ+p
         mnslg2zVXadGXTbJikentbkqmgp6D4wNoRHIz1Ztg5Rf2HJ786yROSirXoc/eziymyJO
         18i1+1mJ74/bO7x2TWxr9BH+/q+q3U+S7uumpcDdAOFym8bGEbgH+pVjsK1n+/9bySWd
         jJ0A==
X-Gm-Message-State: AOAM533g/w+pwp2AbVnPcgif6gAo8Nq8LwBfSB0Sz7gvAaIeNOdXM+/F
        iDpd5w/SZOBX0bc06O2iu68c4uEU5YrzWA==
X-Google-Smtp-Source: ABdhPJwFzJsKqvvCjfKSqksC+pcrMSVHwX7DSEeTevgzDe9f/Li/S3UM7uJwWbMG+0zlLHmoK57V4g==
X-Received: by 2002:a0c:a68a:0:b0:443:d22b:cdff with SMTP id t10-20020a0ca68a000000b00443d22bcdffmr9685830qva.47.1651502493143;
        Mon, 02 May 2022 07:41:33 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id c15-20020a05620a268f00b0069ff48599c5sm633727qkp.107.2022.05.02.07.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 07:41:32 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2f7b815ac06so150198377b3.3;
        Mon, 02 May 2022 07:41:32 -0700 (PDT)
X-Received: by 2002:a0d:d953:0:b0:2f7:d5ce:f204 with SMTP id
 b80-20020a0dd953000000b002f7d5cef204mr11206597ywe.502.1651502492441; Mon, 02
 May 2022 07:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220429104602.368055-1-miquel.raynal@bootlin.com> <20220429104602.368055-3-miquel.raynal@bootlin.com>
In-Reply-To: <20220429104602.368055-3-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 16:41:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVU2RDmPC014LjdB=L_b=Kn+htHnC0v4wAAUESbhWTA5w@mail.gmail.com>
Message-ID: <CAMuHMdVU2RDmPC014LjdB=L_b=Kn+htHnC0v4wAAUESbhWTA5w@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] rtc: rzn1: Add new RTC driver
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
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
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Miquel,

On Fri, Apr 29, 2022 at 12:46 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> From: Michel Pollet <michel.pollet@bp.renesas.com>
>
> Add a basic RTC driver for the RZ/N1.
>
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -0,0 +1,246 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Renesas RZN1 Real Time Clock interface for Linux

RZ/N1

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
> +       rtc->base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(rtc->base))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "Missing reg\n");
> +
> +       rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
> +       if (IS_ERR(rtc->rtcdev))
> +               return PTR_ERR(rtc);
> +
> +       rtc->rtcdev->range_min = RTC_TIMESTAMP_BEGIN_2000;
> +       rtc->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
> +       rtc->rtcdev->ops = &rzn1_rtc_ops;
> +       clear_bit(RTC_FEATURE_ALARM, rtc->rtcdev->features);
> +       clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
> +
> +       pm_runtime_enable(&pdev->dev);
> +       pm_runtime_get_sync(&pdev->dev);

While this call cannot really fail on this platform, you may want to
call pm_runtime_resume_and_get() instead, and check its return
value (else the janitors will make that change later ;-)

> +
> +       /*
> +        * Ensure the clock counter is enabled.
> +        * Set 24-hour mode and possible oscillator offset compensation in SUBU mode.
> +        */
> +       writel(RZN1_RTC_CTL0_CE | RZN1_RTC_CTL0_AMPM | RZN1_RTC_CTL0_SLSB_SUBU,
> +              rtc->base + RZN1_RTC_CTL0);
> +
> +       /* Disable all interrupts */
> +       writel(0, rtc->base + RZN1_RTC_CTL1);
> +
> +       ret = devm_rtc_register_device(rtc->rtcdev);
> +       if (ret)
> +               goto dis_runtime_pm;
> +
> +       return 0;
> +
> +dis_runtime_pm:
> +       pm_runtime_put_sync(&pdev->dev);

pm_runtime_put() should be fine, no need for the synchronous version.

> +       pm_runtime_disable(&pdev->dev);
> +
> +       return ret;
> +}
> +
> +static int rzn1_rtc_remove(struct platform_device *pdev)
> +{
> +       pm_runtime_put_sync(&pdev->dev);

pm_runtime_put().

> +       pm_runtime_disable(&pdev->dev);
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
