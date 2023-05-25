Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35F6971115F
	for <lists+linux-rtc@lfdr.de>; Thu, 25 May 2023 18:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233523AbjEYQwd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Thu, 25 May 2023 12:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjEYQw0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 25 May 2023 12:52:26 -0400
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D25135;
        Thu, 25 May 2023 09:52:25 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-561afe72a73so11215097b3.0;
        Thu, 25 May 2023 09:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685033544; x=1687625544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6CgsX7rQD1imkjUmMdbmcJLBMuD7eBcXMY0NddCVYM=;
        b=RTThwB1YCiYfIVtmM6zT0dbBPPRjGDwVN4/tsXSAVl36oqAKV3xIjRxn+7VYwIsRMB
         jCuteB9KPzTGtjyahopKQUjT1GBS1xQq0Stjiud42LcbbOF0RoQHSLZrwPwHkRxy7/8M
         UqbH3Pop8W+iAgwfG/o6FG+xWcJDRPXuajPz8oE+3tWXbDnc8N4vwg9kxZgZ8C8CA+Ns
         sif8aPsUEnD2VowBPwyiKUIRrflfKHliHxNohQ3jD03BreOLPQcrADXixEndQKAjxMvL
         FKMy2kVQKkEJlS+lZ/U/FWgIYM/X4cGPd0gWxE0ftIU19edvXQXlh8d4LRRmSNfaSCIU
         C1pQ==
X-Gm-Message-State: AC+VfDxMKsFIiQw4emIo4hd+0km2C3JnuParCi2XPlb6vyvr3u6yx3c5
        dZ7ZHFmMxKu+SQ2OdDdSzsKEioh3Zp4ndQ==
X-Google-Smtp-Source: ACHHUZ4mWIFxL2PjgisU99M7M162nz30GDWzoJUBn/v0GB1NlvLfEdf0TgesUsktqAYixftO/O6qJA==
X-Received: by 2002:a25:4409:0:b0:ba8:6530:d561 with SMTP id r9-20020a254409000000b00ba86530d561mr3532258yba.30.1685033544200;
        Thu, 25 May 2023 09:52:24 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id o186-20020a0dccc3000000b00559f03541c6sm485682ywd.132.2023.05.25.09.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 09:52:23 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-561afe72a73so11214747b3.0;
        Thu, 25 May 2023 09:52:23 -0700 (PDT)
X-Received: by 2002:a25:cb4b:0:b0:b8b:e98b:cbb with SMTP id
 b72-20020a25cb4b000000b00b8be98b0cbbmr4475931ybg.38.1685033542957; Thu, 25
 May 2023 09:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com> <20230522101849.297499-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230522101849.297499-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 May 2023 18:52:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdViVBtgkd2dmBUNr1HndCDMRd=K+0J6bA81fxD_7g+dag@mail.gmail.com>
Message-ID: <CAMuHMdViVBtgkd2dmBUNr1HndCDMRd=K+0J6bA81fxD_7g+dag@mail.gmail.com>
Subject: Re: [PATCH v5 03/11] dt-bindings: rtc: isil,isl1208: Document clock
 and clock-names properties
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Trent Piepho <tpiepho@gmail.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
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

On Mon, May 22, 2023 at 12:19 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per the HW manual, XTOSCB bit setting is as follows
>
> If using an external clock signal, set the XTOSCB bit as 1 to
> disable the crystal oscillator.
>
> If using an external crystal, the XTOSCB bit needs to be set at 0
> to enable the crystal oscillator.
>
> Document clock and clock-names properties.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v4->v5:
>  * Replaced oneOf->enum for clock-names as it is simpler.
>  * Added Rb tag from Conor.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
