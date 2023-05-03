Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 168296F5794
	for <lists+linux-rtc@lfdr.de>; Wed,  3 May 2023 14:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjECMIh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Wed, 3 May 2023 08:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjECMIV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 May 2023 08:08:21 -0400
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DE95275;
        Wed,  3 May 2023 05:08:20 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-55a76ed088aso42191997b3.2;
        Wed, 03 May 2023 05:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683115699; x=1685707699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpsHFL7YRssR1zdtRWNSlgPS/yovpaWATc7ePeWkLLo=;
        b=aqkQsUX2sqZa1mn6F3g/gfPdvdXTEOvpy4l0+oUmrdWRW/FdFxjn8xydI8Ovi8FtFe
         CHVw+tMXLsBIJMw6npf0czxv1Qa9zH4XhP8YeHGfrK+Mv4oihP+r/UInBsheYtrC3PE0
         77WfRjs5CvGebJkUJCmgVvb89ZQeRVvMYLj/1xi2m+/sgkze8qkTaws9lDhPuCIILu/X
         0U1i1I0+20jsnVGp74QPBPW1rIxzdsXt8ZiZA5h8rIB5RvIOYDhCIGgP+BLnKy8ge5Lk
         VBBjl2I4zDvdUIaQjUFvyf+/oJ62SXmgw4JIzz+YQXTjr0+Ir3XqmArXk7je5199kuVb
         /4NQ==
X-Gm-Message-State: AC+VfDx9993t2thz7Mxn8a0ue0r8D5AXNrwj/MaOOw2inkicIr/gvahT
        76RlwHEV/bLLoZ48oYn8KzROcZCZnHiV3Q==
X-Google-Smtp-Source: ACHHUZ4o5vkv5oUC1O7UHYp2YTLYb4EPujz/W1vTF29uUFyxrCUTQvET4Qj/yGUOP55zaJCyTCy9Gg==
X-Received: by 2002:a25:d807:0:b0:b9d:c877:b302 with SMTP id p7-20020a25d807000000b00b9dc877b302mr13366943ybg.10.1683115699673;
        Wed, 03 May 2023 05:08:19 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id z82-20020a256555000000b00b9a82c1b070sm3611869ybb.27.2023.05.03.05.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 05:08:18 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-55a64f0053fso45269777b3.3;
        Wed, 03 May 2023 05:08:18 -0700 (PDT)
X-Received: by 2002:a0d:c783:0:b0:556:c778:9d60 with SMTP id
 j125-20020a0dc783000000b00556c7789d60mr20051582ywd.43.1683115698169; Wed, 03
 May 2023 05:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-5-biju.das.jz@bp.renesas.com> <CAMuHMdVrH5R4mAjm1c9zRqiGhNsfT7Y13xxaV-v05T-MCJ6=RQ@mail.gmail.com>
 <OS0PR01MB5922FDA33F631ADD1B9962C3866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922FDA33F631ADD1B9962C3866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 3 May 2023 14:08:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX9Dsymn530q9_qJ2ZBinx33S=kXDuiisBDJOcV4_msFA@mail.gmail.com>
Message-ID: <CAMuHMdX9Dsymn530q9_qJ2ZBinx33S=kXDuiisBDJOcV4_msFA@mail.gmail.com>
Subject: Re: [PATCH RFC 4/6] dt-bindings: rtc: isl1208: Document built-in RTC
 device on PMIC RAA215300
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Trent Piepho <tpiepho@gmail.com>
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

On Wed, May 3, 2023 at 12:08 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH RFC 4/6] dt-bindings: rtc: isl1208: Document built-in
> > RTC device on PMIC RAA215300
> > On Wed, May 3, 2023 at 10:46 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > The Built-in RTC device found on PMIC RAA215300 is similar to the
> > > isl1208 IP. However, RTC is enabled by PMIC RAA215300 and the polarity
> > > of the external oscillator is determined by the PMIC revision.
> > >
> > > Document renesas,raa215300-isl1208 compatible and
> > > renesas,raa215300-pmic property to handle these differences.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  .../devicetree/bindings/rtc/isil,isl1208.yaml       | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > > b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > > index 04d51887855f..888a832ed1db 100644
> > > --- a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > > +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > > @@ -18,6 +18,7 @@ properties:
> > >            - isil,isl1209
> > >            - isil,isl1218
> > >            - isil,isl1219
> > > +          - renesas,raa215300-isl1208
> >
> > That sounds a bit over-complicated.
> > What about just "renesas,raa215300-rtc"?
>
> OK, good to me.
>
> > If you consider them sufficiently compatible, you could add "isil,isl1208"
> > as a fallback.
>
> The pmic has to enable RTC block to make it functional.
> The registers and functionality are compatible.
> But the configuration of Oscillator polarity is different on PMIC version.
> So we need to handle it here.
>
> You mean like below?
>
> +      - items:
> +          - enum:
> +              - renesas, raa215300-rtc
> +          - const: isil,isl1208

That's indeed what I meant.  But given the inverted osc bit, I think the
fallback is not appropriate.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
