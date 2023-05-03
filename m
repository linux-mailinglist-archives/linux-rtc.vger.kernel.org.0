Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13A606F54B9
	for <lists+linux-rtc@lfdr.de>; Wed,  3 May 2023 11:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjECJ3Y convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Wed, 3 May 2023 05:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbjECJ3O (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 May 2023 05:29:14 -0400
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309B34EE3;
        Wed,  3 May 2023 02:28:59 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-b9daef8681fso3608568276.1;
        Wed, 03 May 2023 02:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683106138; x=1685698138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7VQ+0x6wAeOsjvAaIQNTwjXFg6tgXPtjXTZ5/ZaXRQ=;
        b=LO8q2EWFklVpiOQxrK0DtQjZvDpCVCEfGA4zyyXHaOFiMgBuUHNGrz8eekCiv1IoyS
         sMhBa7iTZ7V/MG5BvfXJAnG0BSBt10+pOPxLDGeU2hOBsvy8MsSPneYXIzqCbDNQYov9
         Czs8Yun66g80ybhHwnxI8/E0xZxSHvvrNmm6iVGY0RQ7CNuKhRQ9lUplCJLOFKV/Hoha
         HvRYy8UUXtnQl1+mJgSgitty6inLLE57ZDnJkQPh3zNehM2tgwfHt5bsVXHibgNGf7is
         dG4Y7+kRYHi/X9l7dRQB27dQI8ukSVUqrudyV/hVoHxmWrL/nypZjhPFEMyE3fkuKtb9
         0Avw==
X-Gm-Message-State: AC+VfDyegmUyL/LqfW0sQ7qji1Qax2EPDYrcgFwOqRp2LoLuHQOcTkb8
        6WY4e8pOixG9fblgIrhWSZXIXZDBE8FEgg==
X-Google-Smtp-Source: ACHHUZ4b5l/ZcXU3e+4VtGWLkdi0j++/wilkFaKuXcMgXRjosJCCMuW+j7ZhbxSZGP+mQuUQrDjkkA==
X-Received: by 2002:a25:2fc4:0:b0:b9e:9216:f41f with SMTP id v187-20020a252fc4000000b00b9e9216f41fmr3926887ybv.52.1683106137951;
        Wed, 03 May 2023 02:28:57 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id h16-20020a25e210000000b00b9f1992112dsm454279ybe.0.2023.05.03.02.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 02:28:57 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-b9d87dffadfso4065724276.3;
        Wed, 03 May 2023 02:28:57 -0700 (PDT)
X-Received: by 2002:a25:4f03:0:b0:b9d:c27c:3441 with SMTP id
 d3-20020a254f03000000b00b9dc27c3441mr12102667ybb.21.1683106137335; Wed, 03
 May 2023 02:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-4-biju.das.jz@bp.renesas.com> <CAMuHMdUbH5CbYO14G1aVNVhBc10+tzSYGuLoEof7tuqAHpnz=A@mail.gmail.com>
In-Reply-To: <CAMuHMdUbH5CbYO14G1aVNVhBc10+tzSYGuLoEof7tuqAHpnz=A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 3 May 2023 11:28:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5ksxOzAwKAB18fioUSo6w4_5V-LW+-J7N5-c3LCPyhA@mail.gmail.com>
Message-ID: <CAMuHMdV5ksxOzAwKAB18fioUSo6w4_5V-LW+-J7N5-c3LCPyhA@mail.gmail.com>
Subject: Re: [PATCH RFC 3/6] dt-bindings: rtc: isl1208: Convert to json-schema
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, Trent Piepho <tpiepho@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

CC Trent's latest address

On Wed, May 3, 2023 at 11:25 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Biju,
>
> On Wed, May 3, 2023 at 10:46 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Convert the isl1208 RTC device tree binding documentation to json-schema.
> >
> > Update the example to match reality.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -Intersil ISL1209/19 I2C RTC/Alarm chip with event in
> > -
> > -ISL12X9 have additional pins EVIN and #EVDET for tamper detection, while the
> > -ISL1208 and ISL1218 do not.  They are all use the same driver with the bindings
> > -described here, with chip specific properties as noted.
> > -
> > -Required properties supported by the device:
> > - - "compatible": Should be one of the following:
> > -               - "isil,isl1208"
> > -               - "isil,isl1209"
> > -               - "isil,isl1218"
> > -               - "isil,isl1219"
> > - - "reg": I2C bus address of the device
> > -
> > -Optional properties:
> > - - "interrupt-names": list which may contains "irq" and "evdet"
> > -       evdet applies to isl1209 and isl1219 only
> > - - "interrupts": list of interrupts for "irq" and "evdet"
> > -       evdet applies to isl1209 and isl1219 only
> > - - "isil,ev-evienb": Enable or disable internal pull on EVIN pin
> > -       Applies to isl1209 and isl1219 only
> > -       Possible values are 0 and 1
> > -       Value 0 enables internal pull-up on evin pin, 1 disables it.
> > -       Default will leave the non-volatile configuration of the pullup
> > -       as is.
> > -
> > -Example isl1219 node with #IRQ pin connected to SoC gpio1 pin12 and #EVDET pin
> > -connected to SoC gpio2 pin 24 and internal pull-up enabled in EVIN pin.
> > -
> > -       isl1219: rtc@68 {
> > -               compatible = "isil,isl1219";
> > -               reg = <0x68>;
> > -               interrupt-names = "irq", "evdet";
> > -               interrupts-extended = <&gpio1 12 IRQ_TYPE_EDGE_FALLING>,
> > -                       <&gpio2 24 IRQ_TYPE_EDGE_FALLING>;
> > -               isil,ev-evienb = <1>;
> > -       };
> > -
> > diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > new file mode 100644
> > index 000000000000..04d51887855f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> > @@ -0,0 +1,74 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/rtc/isil,isl1208.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Intersil ISL12{08,09,18,19} I2C RTC/Alarm chip
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +  - Trent Piepho <tpiepho@impinj.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - isil,isl1208
> > +          - isil,isl1209
> > +          - isil,isl1218
> > +          - isil,isl1219
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: irq
> > +      - const: evdet
> > +
> > +  isil,ev-evienb:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1 ]
> > +    default: 0
> > +    description: |
> > +      Enable or disable internal pull on EVIN pin:
> > +        <0> : Enable internal pull-up
> > +        <1> : Disable internal pull-up
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +allOf:
> > +  - $ref: rtc.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - isil,isl1209
> > +              - isil,isl1219
> > +    then:
> > +      required:
> > +        - interrupts-extended
>
> interrupts (-extended is handled by the tooling)
>
> > +        - interrupt-names
> > +        - isil,ev-evienb
>
> else interrupts maxitems 1?
>
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        rtc_twi: rtc@6f {
> > +            compatible = "isil,isl1208";
> > +            reg = <0x6f>;
> > +        };
>
> Is there any specific reason you changed the example from the most
> complex to the most simplest case?
>
> > +    };
> > --
> > 2.25.1
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
