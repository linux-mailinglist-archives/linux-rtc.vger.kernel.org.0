Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 856E0511F60
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Apr 2022 20:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240271AbiD0Pqt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Apr 2022 11:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240327AbiD0Pqr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 Apr 2022 11:46:47 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E75048312;
        Wed, 27 Apr 2022 08:43:29 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id s4so1610511qkh.0;
        Wed, 27 Apr 2022 08:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SrgqakQX07n7ni6BgpqNSbo0srOXZcLE5aCHIWpgaQ0=;
        b=IFOCbi8xaPnT+d8MRdxS2+aqKrqrcophHP0bRB343UtNAzK/vN8kq9fJfQB8zIX75r
         KHIInO2ybqkoa8RgQfrhEfASsj1HTLOAO5Rm2QOpt4a4J9uJUfJDFbbXF7A7B23EAbNM
         sotFFpj8Lpp85CFtNigh13+hmpYGao7GKZur87XcfQplSbKmken2raC4pC68c4C2tFsT
         gp7IIPPJLMdINSE/HGy37hizPqZ/DmjIYKmPc0WT6lX4Bbal23M8YuSO5JsrCdAGpNR+
         78wCnMCJQoKmUC9LlbOnkSJ7+ixWUqe17WUMMj7lGMm+zXshyQ1qH+EfKdX2OxgEsNp7
         BTZA==
X-Gm-Message-State: AOAM530JFP6S8Y3GJLHirhjTkky5BN13xJ2Zu66TFnL623oK4sBcK+Wg
        OuZTg9nJPOxW8k0jk+c+OLmP+2Z5d6wHpA==
X-Google-Smtp-Source: ABdhPJysKN8q/QhmfBNNOWjeUOww/waK45RRnaesCI0lkuX0tY852aq+AnIz5yKoRdKHtUFWEnzIjg==
X-Received: by 2002:a05:620a:4503:b0:69f:78e7:d8c2 with SMTP id t3-20020a05620a450300b0069f78e7d8c2mr5132883qkp.248.1651074208189;
        Wed, 27 Apr 2022 08:43:28 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id x14-20020ac84d4e000000b002f387012858sm260482qtv.19.2022.04.27.08.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 08:43:28 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id s30so4110012ybi.8;
        Wed, 27 Apr 2022 08:43:27 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr26333630ybq.342.1651074207613; Wed, 27
 Apr 2022 08:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220421090016.79517-1-miquel.raynal@bootlin.com>
 <20220421090016.79517-3-miquel.raynal@bootlin.com> <CAMuHMdUZxAu3vTbyKYu=38OZ2QmFM6S=DrFWbp=Cwt6Ya-o9HQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUZxAu3vTbyKYu=38OZ2QmFM6S=DrFWbp=Cwt6Ya-o9HQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Apr 2022 17:43:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXiskynwPR2XOo3V0Vqm+PnWNujsM4=kKSkNq54yKqH=A@mail.gmail.com>
Message-ID: <CAMuHMdXiskynwPR2XOo3V0Vqm+PnWNujsM4=kKSkNq54yKqH=A@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] soc: renesas: rzn1-sysc: Fix the RTC hclock description
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
        Clement Leger <clement.leger@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Apr 27, 2022 at 5:32 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Apr 21, 2022 at 11:00 AM Miquel Raynal
> <miquel.raynal@bootlin.com> wrote:
> > It needs to be un-gated, but also a reset must be released and an idle
> > flag should also be disabled.
> >
> > The driver already supports all these operations, so update the
> > description of the RTC hclock to fit these requirements.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Thanks, will queue in renesas-devel for v5.19, with the prefix fixed.

Doh, renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
