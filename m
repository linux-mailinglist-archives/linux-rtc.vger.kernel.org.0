Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4143F6FD76D
	for <lists+linux-rtc@lfdr.de>; Wed, 10 May 2023 08:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235983AbjEJGw7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Wed, 10 May 2023 02:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235524AbjEJGw6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 May 2023 02:52:58 -0400
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FCF2186;
        Tue,  9 May 2023 23:52:57 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-55a83e80262so101745797b3.3;
        Tue, 09 May 2023 23:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683701576; x=1686293576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHNhcog5yZvb+qwa+23yNz4Orm9rMjJVnLW53pWGImM=;
        b=CXG9EHG0hSihIwuv+Wql+j1wMLZQii6uFAs6O13GozrwY+WlPis+Gbo4uI0T9XNsL/
         BDq5UD+ftZv6CFk240SHs5+WLSw9siE+pYIIm9tKUn7HRQYqmRxbaXQGVOVVQdy8e2MH
         LtFABxMD4Ggh7FasrK9dfV0BKFjb1hBwZpydOroo8a/oQuxGTgJH+zmC1qutZCfhZaKs
         zjyGHLWZ0EBmGN5buQkR86CBMeLbyAnJaNrs8+pr5IuhHerp+7zisBwnWP57WAgxlL73
         GHW6aX+24TxfhuauZnQz0H48GAw9kjRjUK4FKijBZFzF5697C/boztqTp4Tx9tkSAByk
         sviQ==
X-Gm-Message-State: AC+VfDxafoEMAu1ul+QCy0czPMHrbqzFhvQ52hKTkoSgigC746l/Qk3z
        ylg7lK5r1GaKRBWDXTNSn77zu3UY8uNGGQ==
X-Google-Smtp-Source: ACHHUZ6FJ2q3IfQMuuqLQo0DY4ggXV7jUGjZiBz1LA37aiiwHEAIAvhUBJEL3YwHAhBGNqEezX7P6A==
X-Received: by 2002:a0d:c641:0:b0:556:ceb2:c462 with SMTP id i62-20020a0dc641000000b00556ceb2c462mr17785352ywd.2.1683701576698;
        Tue, 09 May 2023 23:52:56 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id f3-20020a816a03000000b0054f9dc9c7f2sm3875551ywc.44.2023.05.09.23.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 23:52:56 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-55a44a2637bso101806187b3.2;
        Tue, 09 May 2023 23:52:56 -0700 (PDT)
X-Received: by 2002:a25:37d2:0:b0:b9e:e00:5ea7 with SMTP id
 e201-20020a2537d2000000b00b9e0e005ea7mr15669295yba.33.1683701576105; Tue, 09
 May 2023 23:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230509131249.80456-1-biju.das.jz@bp.renesas.com> <CA+7tXig2nwCk3DKwFEKGKVko=YD4e4KCpRVUMMM2pgPRpNgiiQ@mail.gmail.com>
In-Reply-To: <CA+7tXig2nwCk3DKwFEKGKVko=YD4e4KCpRVUMMM2pgPRpNgiiQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 May 2023 08:52:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOdJrPdcx684zKaSNFMqkRWL_y3jdAor_D0AeDRpRhJQ@mail.gmail.com>
Message-ID: <CAMuHMdUOdJrPdcx684zKaSNFMqkRWL_y3jdAor_D0AeDRpRhJQ@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: rtc: isl1208: Convert to json-schema
To:     Trent Piepho <tpiepho@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Hi Trent,

On Tue, May 9, 2023 at 9:03 PM Trent Piepho <tpiepho@gmail.com> wrote:
> On Tue, May 9, 2023 at 6:12 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > +
> > +  interrupt-names:
>
> Shouldn't this have minItems: 1 and maxItems: 2 as well?

> > +    then:
> > +      properties:
> > +        interrupts:
> > +          maxItems: 2
> > +    else:
> > +      properties:
> > +        interrupts:
> > +          maxItems: 1
>
> Add interrupt-names here too.

Isn't the relation interrupts <=> interrupt-names enforced by the
tooling?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
