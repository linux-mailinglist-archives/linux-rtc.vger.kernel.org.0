Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAC896F54A1
	for <lists+linux-rtc@lfdr.de>; Wed,  3 May 2023 11:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjECJZ5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Wed, 3 May 2023 05:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbjECJZ4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 May 2023 05:25:56 -0400
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5614C1E;
        Wed,  3 May 2023 02:25:48 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so2331626276.0;
        Wed, 03 May 2023 02:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683105947; x=1685697947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbfzAoNjB8jYAjdUZHHC8O7oxpnRTVDyZnn11hx8DhQ=;
        b=QxQzg6vEd0KG5IzDqFfKmoX+vSm7VVwC+7N3ZM5Iv0xKRCuJCXmaBWuo4NrAZO0VvU
         ZrApBEERa5WKhpJrFbNtIerOyEnM6lTWYildoc2Oc6NSZ+ym4GwZFGF9XNMcpFNNnrMR
         Hq15xJEwT+K6m97p2MgNFBBt8mOiK3tWh5EGpAEM0JEWwNksasSib72kFU/N++QHE1Dq
         Vr9qcakLOBzJ+Xh/xC53Ohb6jbnQLjD3eu5MEorKIJqV1cSbwgys4eX3tI8v0YBEwg5j
         aD9oIw61xmSN8T4djb1+pFcr6PtXxk3ZK4L7qs/7CRVcLgOlPct4Zc01m6Bti4yyV2IV
         bIPg==
X-Gm-Message-State: AC+VfDzpiVHGm9Wja6uL8j/nSR57/EOQkZsB7zjZyLcS1g7uW1QFEQLW
        /2pK72GpRnQUzDuK0nY8tRrFq8heVGmM9A==
X-Google-Smtp-Source: ACHHUZ5ZCSp7DuQltT6ALoqwKT3U1eT8Ro+5DbUh3OQaqRXXNQCwEaWmHm8j9qWYoP5XDnV7XeNxCA==
X-Received: by 2002:a81:6c8f:0:b0:54e:ac2b:8a8c with SMTP id h137-20020a816c8f000000b0054eac2b8a8cmr1283900ywc.24.1683105946831;
        Wed, 03 May 2023 02:25:46 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id p203-20020a815bd4000000b00545a08184fdsm8465032ywb.141.2023.05.03.02.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 02:25:46 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so2331524276.0;
        Wed, 03 May 2023 02:25:46 -0700 (PDT)
X-Received: by 2002:a25:3745:0:b0:b9d:72f1:df15 with SMTP id
 e66-20020a253745000000b00b9d72f1df15mr1621926yba.13.1683105946041; Wed, 03
 May 2023 02:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com> <20230503084608.14008-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230503084608.14008-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 3 May 2023 11:25:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbH5CbYO14G1aVNVhBc10+tzSYGuLoEof7tuqAHpnz=A@mail.gmail.com>
Message-ID: <CAMuHMdUbH5CbYO14G1aVNVhBc10+tzSYGuLoEof7tuqAHpnz=A@mail.gmail.com>
Subject: Re: [PATCH RFC 3/6] dt-bindings: rtc: isl1208: Convert to json-schema
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Trent Piepho <tpiepho@impinj.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
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

Hi Biju,

On Wed, May 3, 2023 at 10:46 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Convert the isl1208 RTC device tree binding documentation to json-schema.
>
> Update the example to match reality.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Intersil ISL1209/19 I2C RTC/Alarm chip with event in
> -
> -ISL12X9 have additional pins EVIN and #EVDET for tamper detection, while the
> -ISL1208 and ISL1218 do not.  They are all use the same driver with the bindings
> -described here, with chip specific properties as noted.
> -
> -Required properties supported by the device:
> - - "compatible": Should be one of the following:
> -               - "isil,isl1208"
> -               - "isil,isl1209"
> -               - "isil,isl1218"
> -               - "isil,isl1219"
> - - "reg": I2C bus address of the device
> -
> -Optional properties:
> - - "interrupt-names": list which may contains "irq" and "evdet"
> -       evdet applies to isl1209 and isl1219 only
> - - "interrupts": list of interrupts for "irq" and "evdet"
> -       evdet applies to isl1209 and isl1219 only
> - - "isil,ev-evienb": Enable or disable internal pull on EVIN pin
> -       Applies to isl1209 and isl1219 only
> -       Possible values are 0 and 1
> -       Value 0 enables internal pull-up on evin pin, 1 disables it.
> -       Default will leave the non-volatile configuration of the pullup
> -       as is.
> -
> -Example isl1219 node with #IRQ pin connected to SoC gpio1 pin12 and #EVDET pin
> -connected to SoC gpio2 pin 24 and internal pull-up enabled in EVIN pin.
> -
> -       isl1219: rtc@68 {
> -               compatible = "isil,isl1219";
> -               reg = <0x68>;
> -               interrupt-names = "irq", "evdet";
> -               interrupts-extended = <&gpio1 12 IRQ_TYPE_EDGE_FALLING>,
> -                       <&gpio2 24 IRQ_TYPE_EDGE_FALLING>;
> -               isil,ev-evienb = <1>;
> -       };
> -
> diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> new file mode 100644
> index 000000000000..04d51887855f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/isil,isl1208.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intersil ISL12{08,09,18,19} I2C RTC/Alarm chip
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +  - Trent Piepho <tpiepho@impinj.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - isil,isl1208
> +          - isil,isl1209
> +          - isil,isl1218
> +          - isil,isl1219
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: irq
> +      - const: evdet
> +
> +  isil,ev-evienb:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +    default: 0
> +    description: |
> +      Enable or disable internal pull on EVIN pin:
> +        <0> : Enable internal pull-up
> +        <1> : Disable internal pull-up
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - isil,isl1209
> +              - isil,isl1219
> +    then:
> +      required:
> +        - interrupts-extended

interrupts (-extended is handled by the tooling)

> +        - interrupt-names
> +        - isil,ev-evienb

else interrupts maxitems 1?

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        rtc_twi: rtc@6f {
> +            compatible = "isil,isl1208";
> +            reg = <0x6f>;
> +        };

Is there any specific reason you changed the example from the most
complex to the most simplest case?

> +    };
> --
> 2.25.1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
