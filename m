Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91458709767
	for <lists+linux-rtc@lfdr.de>; Fri, 19 May 2023 14:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjESMlz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Fri, 19 May 2023 08:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjESMlz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 May 2023 08:41:55 -0400
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9479D10D9;
        Fri, 19 May 2023 05:41:32 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-ba6d024a196so2818342276.2;
        Fri, 19 May 2023 05:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684500047; x=1687092047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFmSAJcL9N8nEF+kFKLtW5aG5I3dG26qUlE85kJEnag=;
        b=iBNRU9BFX7jTMKBgLCaAniCdv2IbhhZfnXOybFi48IVuvYW+bsXJwSqImde1ISpLz+
         tbZMk6vRPujZyjnd+QupDULQx0Ry/jQ2nr5LLWhhGlYZF0m7J7koD68LEM/NmUY71erF
         GYV/NXLi7pugr9UQArMkND4zbd/h2/LLQgp92pCMB/BWAMXBawR6hKlv48pRxwtX89dw
         nIc0xAouRYnftPNf0FnvW5t0cOPQhp3t80dTh7SbGfi3x1ad03PIa9MNqJKpDFH+Z6Bf
         IYeE6Vzzj7VWq5UTvdmvqpS0iMtbbmMp7INiGCZwWjJZ9S8qDJFka84w235JSEVnz9Z9
         WiWA==
X-Gm-Message-State: AC+VfDxJmDu4qpcxCY1s3WsTjhdJDEHVLHlu6po4zE4dqilWe3FfftgV
        UjBVHUNwYePjWtpOpSGmS/s3fKlmJxpLEQ==
X-Google-Smtp-Source: ACHHUZ7IVB1lS2FyxG5gxorisRWLvT07hdWrgTDh9O6ry/7KMGJd04GdSd/KnE0ci7qNQ8gMTJWR/w==
X-Received: by 2002:a0d:cc81:0:b0:561:b783:fb76 with SMTP id o123-20020a0dcc81000000b00561b783fb76mr1598628ywd.51.1684500046981;
        Fri, 19 May 2023 05:40:46 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id v191-20020a8148c8000000b0055d7f00d4f7sm1125330ywa.22.2023.05.19.05.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 05:40:46 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-ba1815e12efso2812341276.3;
        Fri, 19 May 2023 05:40:46 -0700 (PDT)
X-Received: by 2002:a25:b31c:0:b0:b8b:dd05:b60 with SMTP id
 l28-20020a25b31c000000b00b8bdd050b60mr1477777ybj.45.1684500045986; Fri, 19
 May 2023 05:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com> <20230518113643.420806-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230518113643.420806-7-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 May 2023 14:40:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPddoG7r8FASToPVsCXcva8_3+-JjsE7bXNkUX=Hb8Nw@mail.gmail.com>
Message-ID: <CAMuHMdUPddoG7r8FASToPVsCXcva8_3+-JjsE7bXNkUX=Hb8Nw@mail.gmail.com>
Subject: Re: [PATCH v4 06/11] rtc: isl1208: Drop enum isl1208_id and split isl1208_configs[]
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

On Thu, May 18, 2023 at 1:37 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Drop enum isl1208_id and split the array isl1208_configs[] as individual
> variables, and make lines shorter by referring to e.g. &config_isl1219
> instead of &isl1208_configs[TYPE_ISL1219].
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4:
>  * New patch

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
