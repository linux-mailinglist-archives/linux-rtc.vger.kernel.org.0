Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E21F8511ED8
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Apr 2022 20:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239700AbiD0PgY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Apr 2022 11:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239742AbiD0PgX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 Apr 2022 11:36:23 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972413299C;
        Wed, 27 Apr 2022 08:33:12 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id t16so1378686qtr.9;
        Wed, 27 Apr 2022 08:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EMs8gAbZ1UvRp3PmAyFulYzj1qVtK1tgKYngal0laac=;
        b=fF3BrNvu0SSPHFf7gl37pkjG+DvjuxJxyUa3rr7z7hfCLJ0RiOeY4ZRR0UhGyUbWA6
         m37DW77xcaB91/08rPKaSUbVmzs9STi006+uLx1e9nrI88B6mD9ggqtgWx5dx6z7RCFO
         EZHfXEXMmePqlzXR/X/Iw4krTI2+yLYX5t9ZkuAv6sMiMrhA3i36/MXXwWmdkUVXPxX8
         bbJgWFWAWxQvcEHD+tBbrPKoRDrMbjcIvahSv5UBxwIpRSFJ1b9Ld4lZsCy4R1w67Ak9
         G3iOb1UZQ4j5G832OCqFSk8ZHnSuEFpi2DDyWCUrfXpo/dbEBs1e7fKjya4cxxHhEO6Z
         K7WA==
X-Gm-Message-State: AOAM532fZXx64I2VhljtvvhkmTwu8NqfeyXfuQFm6LxiAgfOhCQIjXE4
        PWox4hMhYYqNFWHdaS7poZasTkLloxBLrw==
X-Google-Smtp-Source: ABdhPJzngd9/qOSkpctlCyScvHI7/WSg5PvfB23tvV1D9G7PRubakomcjeS/H7eS0q/aOo9Nr1CPcA==
X-Received: by 2002:ac8:5bc5:0:b0:2f2:457:a706 with SMTP id b5-20020ac85bc5000000b002f20457a706mr19346382qtb.150.1651073591167;
        Wed, 27 Apr 2022 08:33:11 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id g10-20020ac8580a000000b002f35323f82csm9978541qtg.30.2022.04.27.08.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 08:33:10 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id w187so4088375ybe.2;
        Wed, 27 Apr 2022 08:33:10 -0700 (PDT)
X-Received: by 2002:a25:d393:0:b0:648:4871:3b91 with SMTP id
 e141-20020a25d393000000b0064848713b91mr17484020ybf.506.1651073590276; Wed, 27
 Apr 2022 08:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220421090016.79517-1-miquel.raynal@bootlin.com> <20220421090016.79517-3-miquel.raynal@bootlin.com>
In-Reply-To: <20220421090016.79517-3-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Apr 2022 17:32:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZxAu3vTbyKYu=38OZ2QmFM6S=DrFWbp=Cwt6Ya-o9HQ@mail.gmail.com>
Message-ID: <CAMuHMdUZxAu3vTbyKYu=38OZ2QmFM6S=DrFWbp=Cwt6Ya-o9HQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] soc: renesas: rzn1-sysc: Fix the RTC hclock description
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
        Clement Leger <clement.leger@bootlin.com>
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

On Thu, Apr 21, 2022 at 11:00 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> It needs to be un-gated, but also a reset must be released and an idle
> flag should also be disabled.
>
> The driver already supports all these operations, so update the
> description of the RTC hclock to fit these requirements.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks, will queue in renesas-devel for v5.19, with the prefix fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
