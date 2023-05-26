Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5AD27120C6
	for <lists+linux-rtc@lfdr.de>; Fri, 26 May 2023 09:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236274AbjEZHVA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Fri, 26 May 2023 03:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbjEZHVA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 26 May 2023 03:21:00 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC12699;
        Fri, 26 May 2023 00:20:57 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-56190515833so9268537b3.0;
        Fri, 26 May 2023 00:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685085657; x=1687677657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUDBoh1hXwNOTGqMEugtcAGO4vzK+p0VYicK7HiX7E8=;
        b=ep6/aOY1DQqV2CsBv7KVrAiJ7LqILZVfU0naTiKtCHruMZP96OFu5gcsQnxmBLRWN7
         FrMOOM5grtIDx3XV6UI/d5Zms9i0s7kxjRmE+DBqAXIgKqIZWrVDj+6vcZm0dUndjYhk
         4c1BcNexjCXN6f2j4/DeeON+wnyikyOd9xgrF4Fyz4M5sFbBTSiCISbOx/Kq8XlYoIW7
         xCccjD7YYYjSeCRtaaPnP+o/rcDDwf3PLqjtNb6yDgU4xk3xlcSoMY2H8iiVLSqSctKd
         Kvyvjvt1BctQC+Z6ZHOee16dWNqvAZ0EW13qNwBK70/z1euCn7H5W5td+OI2a9gdYGVC
         8O3Q==
X-Gm-Message-State: AC+VfDx3bKu4T819kCiFD3cozNrf6jVK1JNqHg6izMPkRoLPJo0XJHLQ
        OruzM27+vPwoEBEwwkpFSMvqDeX/NgJAGQ==
X-Google-Smtp-Source: ACHHUZ6qcNQgtY8tsanmFPQSlgnHopA7yEEgpTx1W4VE732SvqqKqob9t2Y/wKkKQ+SCfophbUghGw==
X-Received: by 2002:a0d:e2c3:0:b0:565:b76d:82c8 with SMTP id l186-20020a0de2c3000000b00565b76d82c8mr623189ywe.5.1685085656891;
        Fri, 26 May 2023 00:20:56 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id g134-20020a0ddd8c000000b00565b1b3f9c3sm231244ywe.76.2023.05.26.00.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 00:20:55 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5621a279cbbso9084337b3.1;
        Fri, 26 May 2023 00:20:55 -0700 (PDT)
X-Received: by 2002:a81:78d7:0:b0:561:94a9:f9f7 with SMTP id
 t206-20020a8178d7000000b0056194a9f9f7mr1699938ywc.20.1685085655327; Fri, 26
 May 2023 00:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com> <20230522101849.297499-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230522101849.297499-8-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 May 2023 09:20:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_9JNusQ3USMHam5D9fu93CgBD46w-oMb6MQ-V=33Xnw@mail.gmail.com>
Message-ID: <CAMuHMdW_9JNusQ3USMHam5D9fu93CgBD46w-oMb6MQ-V=33Xnw@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] rtc: isl1208: Add isl1208_set_xtoscb()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Biju,

On Mon, May 22, 2023 at 12:19 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per the HW manual, set the XTOSCB bit as follows:
>
> If using an external clock signal, set the XTOSCB bit as 1 to
> disable the crystal oscillator.
>
> If using an external crystal, the XTOSCB bit needs to be set at 0
> to enable the crystal oscillator.
>
> Add isl1208_set_xtoscb() to set XTOSCB bit based on the clock-names
> property. Fallback is enabling the internal crystal oscillator.
>
> While at it, introduce a variable "sr" for reading the status register
> in probe() as it is reused for writing.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
>  * Fixed the typo in commit description.
>  * Replaced the variable int_osc_en->xtosb_val for isl1208_set_xtoscb() and
>    changed the data type from bool->u8.

You might as well just use int.

>  * Replaced devm_clk_get->devm_clk_get_optional() in probe.
>  * IS_ERR() related error is propagated and check for NULL to find out
>    if a clock is present.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
