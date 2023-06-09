Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37A6F7291AC
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Jun 2023 09:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239070AbjFIHsr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jun 2023 03:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239345AbjFIHsn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jun 2023 03:48:43 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8804D210C;
        Fri,  9 Jun 2023 00:48:37 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-19f36a8ac3bso347042fac.1;
        Fri, 09 Jun 2023 00:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686296917; x=1688888917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0m4FqGK/KaET0KtUBAPDzBTjTFwRfyx8ipDoFvcCwbI=;
        b=L/o+roFPUHpGnFvyTYY52iXCjCvQ//A2HUNrza2NYqcKSR1wlMMacxMOt3NZGycm19
         VIb2vBEYaNfypk7C8FK8zAKs6E3cxNl3CuwJrngb7+i1FKlp5VQYJRqrmxRs3d9oH3Ld
         5qxXkNucbhxpvc2DVu5SuLXxuQq5UOM3oqxlM8bt6U+hiI+gGN3opF3Am4K6EJ5P2wGk
         efr5XfLy9Z9W4t1dOJj2ImTrt8ZpXBQJMHpIVK9TSenhgVRaFcmLewAQQpeE59S8ykH6
         tYUt3h5An2H7Uf4tLriB8aUu2KpNZWPmYSTTpsxu31kA+VrEh9f5YyIALvKH+hpSK6p2
         /gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686296917; x=1688888917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0m4FqGK/KaET0KtUBAPDzBTjTFwRfyx8ipDoFvcCwbI=;
        b=bxQgIcBk7fPoW4STRvdQHeHFiXsyUUwaWlytCmAaHYUhmhW5mX3PJOMDoGvJ/l1iqo
         3y8FmxJQbJvzLHqLD6yi7YR0N6wAyKlRJAocAWsSm+XpEx1gk7nNYOBufN6f0IzeuTX+
         IAfUfmIxmr6uTujJMBQEXmym3nZdPhGwBCOA5/hN5XH1CUiDeuFsN5kQmLlcOWJI/3lF
         fVyDTl3QvInAI1QSq4PtVOdaltUclvxyc9jf59bDoR5acLGRYMdmYoFTYtiQS3aCEXbH
         rbEiE9Jwiluh6IZ5h7M991kpTQIWjryQbDmvUiduBeFLjWd9OMVDE6ngC9cC+xB2t/+C
         8Xtg==
X-Gm-Message-State: AC+VfDw8Hb44uW+OGIDoqaUDshka5PP6HbdhEcUYd1RpF0dqHIG1+CPs
        bmGYdqSAwnXcad+X2+LNjIJ2I5iGqcbTpBfb2do=
X-Google-Smtp-Source: ACHHUZ54K4iQwBYRiAAQInVJMD/8h5vcFklgd7joDa/osKYjfaNKTZSUSA47s8K56scDuyjIlxuJ0G0A/UvHopHorkw=
X-Received: by 2002:a05:6358:cb29:b0:125:9233:11a0 with SMTP id
 gr41-20020a056358cb2900b00125923311a0mr314065rwb.0.1686296916802; Fri, 09 Jun
 2023 00:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230602142426.438375-1-biju.das.jz@bp.renesas.com> <20230602142426.438375-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230602142426.438375-6-biju.das.jz@bp.renesas.com>
From:   Trent Piepho <tpiepho@gmail.com>
Date:   Fri, 9 Jun 2023 00:48:25 -0700
Message-ID: <CA+7tXijvF=TztybJ=ptUHvBJpENX1foY=Fa_YYrbHd5k-_K_Cw@mail.gmail.com>
Subject: Re: [PATCH v6 05/11] dt-bindings: rtc: isl1208: Convert to json-schema
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Jun 2, 2023 at 7:24=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Convert the isl1208 RTC device tree binding documentation to json-schema.
>
> Update the example to match reality.

I still don't know why you say this and changed the example to be as
simple as possible.

Did you test it and does it not work with the actual driver?  I looked
at the code for parsing OF interrupts and it does not look like
anything has changed to make it not work.  Nor do I see anything
incorrect in the original example.  Can you explain what you think is
wrong with the original example?

> +
> +        rtc_twi: rtc@6f {
> +            compatible =3D "isil,isl1208";
> +            reg =3D <0x6f>;
> +        };
> +    };
> --
> 2.25.1
>
