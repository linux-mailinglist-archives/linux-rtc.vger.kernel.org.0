Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E97B3512EF2
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Apr 2022 10:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233691AbiD1IwY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 Apr 2022 04:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbiD1IwX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 28 Apr 2022 04:52:23 -0400
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6624E39;
        Thu, 28 Apr 2022 01:49:09 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id e17so2746172qvj.11;
        Thu, 28 Apr 2022 01:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IBi5WBTdEbYqU1V6BFZ8Gs02JhkXoeQPLmgUcm2a+lo=;
        b=w7wR9Yo3oi+OeB5/M/OsCt/3sb9h3Pb7cVfnwHb1twRxxhveaKrBuZ+hjjv2RNlArK
         K6gcLOyI15G4uEoJbY2orNfSpO+UduuDugaaNOVpfdxxzUc9LcBeSUsTQ3qjvFIEU9Us
         GNa5H+xUVcCwsfS3XWAE+t4fxvw+3j5Mn+++p4RcrE4aA4pgU6wdJn9iUeuUG0GPSLrx
         dbVrsr7bAdJ7Vn8qCQ5B/V14glmVgzGQM4jX6AQ/h5AjD07btBlEbkXqC5izzVkC+G6D
         9xVbwaKkK8IgQfaz8zNNcLx8YBgGw1umjn5ssCSwwMKanyyqI7A/4jTegRIYcr8cIvMn
         E/XQ==
X-Gm-Message-State: AOAM532xAPttlC3ax5Byj23VH2jY2r8N6J4zDQFQ6QlW/TNfHbincaOA
        mpw9CmaHbjL6umUS7IBkLV8R+RPySSoWFA==
X-Google-Smtp-Source: ABdhPJxNS4PbZp+grglgp3SAxUNkjJZetVrnmqQZpl0eEy3X+1yQRJg8uoCitc0UdteknBwxNOwOig==
X-Received: by 2002:a05:6214:d47:b0:456:53cd:d96a with SMTP id 7-20020a0562140d4700b0045653cdd96amr4252264qvr.128.1651135748875;
        Thu, 28 Apr 2022 01:49:08 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id d1-20020a05622a15c100b002f373d233d3sm5309539qty.71.2022.04.28.01.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 01:49:08 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-2f7bb893309so44786117b3.12;
        Thu, 28 Apr 2022 01:49:08 -0700 (PDT)
X-Received: by 2002:a81:1cd5:0:b0:2f4:c3fc:2174 with SMTP id
 c204-20020a811cd5000000b002f4c3fc2174mr32203225ywc.512.1651135747944; Thu, 28
 Apr 2022 01:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220421090016.79517-1-miquel.raynal@bootlin.com> <20220421090016.79517-8-miquel.raynal@bootlin.com>
In-Reply-To: <20220421090016.79517-8-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 10:48:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoKpKbOvi9dRHL=Ld8fnBOdCfe6kd2MrHqo7BSu-YrOQ@mail.gmail.com>
Message-ID: <CAMuHMdWoKpKbOvi9dRHL=Ld8fnBOdCfe6kd2MrHqo7BSu-YrOQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] ARM: dts: r9a06g032: Describe the RTC
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
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Apr 21, 2022 at 11:00 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> Describe the SoC RTC which counts time and provides alarm support.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
