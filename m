Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF0F512EEE
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Apr 2022 10:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344825AbiD1Iuv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 Apr 2022 04:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344267AbiD1Itr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 28 Apr 2022 04:49:47 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E46A5E773;
        Thu, 28 Apr 2022 01:45:18 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id j6so3088632qkp.9;
        Thu, 28 Apr 2022 01:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NsvCiErbKX2TatD2CWV4KQZYhmPlqRnfIwZ5STUtAP4=;
        b=fM/fmt3cxEfUJVPjBPxWgd1Buu4RemT3tQVr7tG5eWq0Y4B/aBdzvJw6QbCKZqX35g
         j9nRaT7yhAbGPdmy/TinvbpLuwt3w8wKfhN8TUERaLYVW6M2g9VVI6wA2KmmriqZiTzn
         cTZKUrYsGn1KAMSPvuKbOPNT8aoOkQbPEJmYmmROArCuFWFbwlQXnfNPAwoQjExqP97m
         8SJh3IZyLkS1/nnJTeRLwBghPFUVQhAha2HUuGKk8VNHWD/S5Cj4gQyZMdi18PLd44D/
         /Nayeq2pzLm9u6K1kL8aT/gBRZCn3RDvKcbyRZ7hR8DCW8SUHD0j1yKggeDMhkKwhaTG
         Tnyw==
X-Gm-Message-State: AOAM532RB338y4Rs9L7hu/Pd/M4beU7J59rrwSYJwdMdlteYxVHzwV8f
        1sMSLA2V6Ll4gmb7IUqO4w2q8GsENHSxtA==
X-Google-Smtp-Source: ABdhPJwYfy7NpKtfP2j76shLvkTHXaWgqsI0aqFrm6lJDgrC567ZLuQYfFDKgV551+/gyOMa8M/+Og==
X-Received: by 2002:a37:750:0:b0:69f:a05d:6d21 with SMTP id 77-20020a370750000000b0069fa05d6d21mr966033qkh.676.1651135516626;
        Thu, 28 Apr 2022 01:45:16 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id x13-20020a05620a258d00b0069c7468e123sm9663972qko.122.2022.04.28.01.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 01:45:16 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2f7ca2ce255so44931897b3.7;
        Thu, 28 Apr 2022 01:45:15 -0700 (PDT)
X-Received: by 2002:a81:4782:0:b0:2eb:1cb1:5441 with SMTP id
 u124-20020a814782000000b002eb1cb15441mr29794472ywa.479.1651135515554; Thu, 28
 Apr 2022 01:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220421090016.79517-1-miquel.raynal@bootlin.com> <20220421090016.79517-2-miquel.raynal@bootlin.com>
In-Reply-To: <20220421090016.79517-2-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 10:45:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWXimtXT+3YsQd=WqWgQGiM7h=ZT1VZOy3myrMWuPvk5A@mail.gmail.com>
Message-ID: <CAMuHMdWXimtXT+3YsQd=WqWgQGiM7h=ZT1VZOy3myrMWuPvk5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: rtc: rzn1: Describe the RZN1 RTC
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Apr 21, 2022 at 11:00 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> Add new binding file for this RTC.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
