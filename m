Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 681F64FC0D8
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Apr 2022 17:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347932AbiDKPfL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Apr 2022 11:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242045AbiDKPfF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Apr 2022 11:35:05 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2635236B4C;
        Mon, 11 Apr 2022 08:32:51 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id b17so13489074qvf.12;
        Mon, 11 Apr 2022 08:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vI8B2NQEJsy0Y3l6kvTznv2x70M0aqJTxZmt3sM3f5I=;
        b=EudAcLX2aCf0voLJOxaYHF0PRCT1f17umbLtKsX6Xu+j9MeBMtE28Ury+0R3c0etCK
         hunXKkc6Jjuc18GZME2tCmFC8ODNhdrUrgkpTif9OlTY07zPJVkxT5ff4h7UWjHt/x1v
         7qqcaFzKA3dmtrOFXCOmziXS6rv5v4RkslEDhA9FH9nv35sNvttxETHMTVYxgmJct1aI
         8i+6kY7Zpv6aQ4fPyZEe+3k4wepONCy+75ECdSAOeqUBRocUX1q4nT+l8Z448WQl9zyC
         D7lyzIP1nzGk6Vk1PX35By7l1Jp65+4P291mpzYQbzAAuxYD0z4EeeIUiLCs7FH0l/Ou
         O7jQ==
X-Gm-Message-State: AOAM533PZhndpNljlJR2k983/3gP3JWg74s+7Jn4RNEoo5FTgMupXQEP
        403/9FxLHWW9JeeLVbK2iF5tDnU0xpEc1A==
X-Google-Smtp-Source: ABdhPJyb2niBOFbIx4F/ieGrq3lg4ZiA/33Fxfb0FVMVRXG5+qkTWdg8r2+2sPa2nmea+0APewdHBg==
X-Received: by 2002:a05:6214:3001:b0:443:bb87:7f9a with SMTP id ke1-20020a056214300100b00443bb877f9amr26873059qvb.13.1649691169690;
        Mon, 11 Apr 2022 08:32:49 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id f3-20020ac87f03000000b002ed137e0510sm5239725qtk.77.2022.04.11.08.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 08:32:49 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id t12so7644584ybt.10;
        Mon, 11 Apr 2022 08:32:49 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr22542847ybq.342.1649691169145; Mon, 11
 Apr 2022 08:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220405184716.1578385-1-miquel.raynal@bootlin.com> <20220405184716.1578385-8-miquel.raynal@bootlin.com>
In-Reply-To: <20220405184716.1578385-8-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Apr 2022 17:32:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHUQg3FZ29rxka1WS=0mGfNPQSuC0xr75WQ7XAxeV3CA@mail.gmail.com>
Message-ID: <CAMuHMdXHUQg3FZ29rxka1WS=0mGfNPQSuC0xr75WQ7XAxeV3CA@mail.gmail.com>
Subject: Re: [PATCH 7/7] ARM: dts: r9a06g032: Describe the RTC
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Miquel,

On Tue, Apr 5, 2022 at 8:47 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Describe the SoC RTC which counts time and provides alarm support.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/r9a06g032.dtsi
> @@ -103,6 +103,18 @@ dmamux: dma-router@a0 {
>                         };
>                 };
>
> +               rtc0: rtc@40006000 {

Please insert this before watchdog@40008000, to preserve sort
order (by unit address).

> +                       compatible = "renesas,r9a06g032-rtc", "renesas,rzn1-rtc";
> +                       reg = <0x40006000 0x1000>;
> +                       interrupts = <GIC_SPI 66 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 67 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names = "alarm", "timer", "pps";
> +                       clocks = <&sysctrl R9A06G032_HCLK_RTC>;
> +                       clock-names = "hclk";
> +                       status = "disabled";
> +               };
> +
>                 uart0: serial@40060000 {
>                         compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
>                         reg = <0x40060000 0x400>;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
