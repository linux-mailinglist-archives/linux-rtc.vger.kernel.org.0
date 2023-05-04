Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD556F663B
	for <lists+linux-rtc@lfdr.de>; Thu,  4 May 2023 09:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjEDHsN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Thu, 4 May 2023 03:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjEDHsM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 4 May 2023 03:48:12 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F63D30FB;
        Thu,  4 May 2023 00:47:59 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-55c939fb24dso582597b3.2;
        Thu, 04 May 2023 00:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683186478; x=1685778478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9LICh5eVGQYl7Vd8WDHBQlr+z/LAV3M6z3s9DeJXLI=;
        b=PmneL4HyQe9OJmf+p5P7Csog9u8zFglPGENsuKD9tzFWaFP4dLmWeGYmMi1EUTy8uJ
         gFr34CRWA/0TvY5HpTqIthSaFL6FaLFhZ5HKCAiJpAiT2NfETeNImA59pZ5WKy4WrNen
         iuEKbpB/ofWQ7+bBNOtLhModvMrzcwvIhMz1wYiU4tHxECuGjKwwqWgliAJNEU8Tw0tp
         qjzbiOtqeKtoratDY50bUyjoNnN8OXlF3jxnHRdaCzUhktqNP34kk1n//jg6Sq+BUo4C
         kLFiuNWmuESwss/hujls4H2E+n/3fXkNspDt2lmmuMJkvSifYc41XQJqI8UwMXw5+8WM
         rKQg==
X-Gm-Message-State: AC+VfDxdCUn5vgUi09QPz6VKVWwU81Vyog5NbGspuU6MAQuH9qd3TtbT
        Edl7ehIyeqI70dwTagwO6FM1wrw6xrf2bw==
X-Google-Smtp-Source: ACHHUZ5eVY5vvXBBMryU5gNR68k7hiPxdNJbaTzO6QrOEy6ivZVT1W9GlxV29CEUxxaCNsjjGhlQrQ==
X-Received: by 2002:a81:a082:0:b0:55a:2cb9:c79c with SMTP id x124-20020a81a082000000b0055a2cb9c79cmr1391983ywg.9.1683186478137;
        Thu, 04 May 2023 00:47:58 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id j137-20020a81928f000000b0055a486140b6sm2642843ywg.36.2023.05.04.00.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 00:47:57 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-b9e27684b53so164754276.0;
        Thu, 04 May 2023 00:47:57 -0700 (PDT)
X-Received: by 2002:a81:a082:0:b0:55a:2cb9:c79c with SMTP id
 x124-20020a81a082000000b0055a2cb9c79cmr1391945ywg.9.1683186476971; Thu, 04
 May 2023 00:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-5-biju.das.jz@bp.renesas.com> <db7ae5f9-393a-b892-dd6f-08c4f25ce7a8@linaro.org>
In-Reply-To: <db7ae5f9-393a-b892-dd6f-08c4f25ce7a8@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 4 May 2023 09:47:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMsdvwq3t50ifKuCJ6LvPUcDjSu14tkdrSquizA=TsTw@mail.gmail.com>
Message-ID: <CAMuHMdVMsdvwq3t50ifKuCJ6LvPUcDjSu14tkdrSquizA=TsTw@mail.gmail.com>
Subject: Re: [PATCH RFC 4/6] dt-bindings: rtc: isl1208: Document built-in RTC
 device on PMIC RAA215300
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Trent Piepho <tpiepho@impinj.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
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

Hi Krzysztof,

On Thu, May 4, 2023 at 9:11 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 03/05/2023 10:46, Biju Das wrote:
> > The Built-in RTC device found on PMIC RAA215300 is similar to the isl1208
> > IP. However, RTC is enabled by PMIC RAA215300 and the polarity of the
> > external oscillator is determined by the PMIC revision.
> >
> > Document renesas,raa215300-isl1208 compatible and renesas,raa215300-pmic
> > property to handle these differences.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/rtc/isil,isl1208.yaml       | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > index 04d51887855f..888a832ed1db 100644
> > --- a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > @@ -18,6 +18,7 @@ properties:
> >            - isil,isl1209
> >            - isil,isl1218
> >            - isil,isl1219
> > +          - renesas,raa215300-isl1208
> >
> >    reg:
> >      maxItems: 1
> > @@ -40,6 +41,10 @@ properties:
> >          <0> : Enable internal pull-up
> >          <1> : Disable internal pull-up
> >
> > +  renesas,raa215300-pmic:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to the pmic device with isl1208 built-in RTC.
>
> No. You don't need cross-linking. We do not represent one device as two
> and then fix this by cross-linking them. The existing binding does not
> have it, so it should be a hint for you.

Makes sense.
So there should be a single device node with 2 reg cells, and
a "renesas,raa215300" compatible value.

On the Linux side, the "renesas,raa215300" MFD driver can instantiate
a PMIC and an RTC cell, the latter served by the (enhanced) existing
rtc-isl1208 driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
