Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D10B6F7E8E
	for <lists+linux-rtc@lfdr.de>; Fri,  5 May 2023 10:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbjEEIRQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Fri, 5 May 2023 04:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbjEEIRP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 May 2023 04:17:15 -0400
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77064160B0;
        Fri,  5 May 2023 01:17:13 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-b9d8730fe5aso2016154276.1;
        Fri, 05 May 2023 01:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683274632; x=1685866632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2Fr1q2Z/5djJnHNDczEpfmdeuoZiikwsxBLMccGUGY=;
        b=JYV6LcVbefTZ3NhWLXFycIKotPgFCoUDk6IEJb7p7kx3cvMUmP6JeY/nSS6CigW99i
         PxlChq807nLWKUVVvjlHvQV+FM60IMXpMuHlM+fdlGlQ1FFFsyQh7yOIQQOISRGp12mc
         Pvn44dv4Y7w3v8z3Othp6hBU4JT3fKeE+mxDU724JcWUU7QY+UMLf04FEJpIRVGpdxV8
         1MCGOu8tyfxwtSoJ8UruwcR8uCR/e7/TuGGrzS4b2Bz/9U1DHZL3f+pk731QAFuG71FU
         gvLH3MJnOceyIZAf71xkKsWG9Aw148t+2578Of1AMtHORC88RZt1+qjJ4K1JwhhIzTnp
         7+yQ==
X-Gm-Message-State: AC+VfDw1KwXW6j9h8sXKfCAq2kJhYYDFdzfELXoOt9pe8OBEtzC6FvL7
        GgcpanpTWezAaB49fTas91m5HSmK3lmpVQ==
X-Google-Smtp-Source: ACHHUZ4w4dPkAptvoWV/bDDgnbUmydNcTUXsmCfuWgnxjunON8KDAl3ve2VEDM3wL+WRQ91fje1lsg==
X-Received: by 2002:a81:8494:0:b0:55a:1c7b:2dc4 with SMTP id u142-20020a818494000000b0055a1c7b2dc4mr737892ywf.15.1683274632396;
        Fri, 05 May 2023 01:17:12 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id b64-20020a0dd943000000b0055a8e67d55dsm334604ywe.23.2023.05.05.01.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 01:17:10 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-b996127ec71so2030501276.0;
        Fri, 05 May 2023 01:17:09 -0700 (PDT)
X-Received: by 2002:a25:abac:0:b0:ba1:d06d:fb6b with SMTP id
 v41-20020a25abac000000b00ba1d06dfb6bmr827844ybi.33.1683274629641; Fri, 05 May
 2023 01:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230505080621.96646-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230505080621.96646-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 5 May 2023 10:16:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMtMhrPMqMS77t6dJLPCr+Uu2F-hQPybWijbFyz6KCCQ@mail.gmail.com>
Message-ID: <CAMuHMdVMtMhrPMqMS77t6dJLPCr+Uu2F-hQPybWijbFyz6KCCQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: rtc: isl1208: Convert to json-schema
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Trent Piepho <tpiepho@gmail.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Fri, May 5, 2023 at 10:06 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Convert the isl1208 RTC device tree binding documentation to json-schema.
>
> Update the example to match reality.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> RFC->v2:
>  * Updated maintainers list
>  * Updated description from original bindings
>  * removed default from isil,ev-evienb properties to match with the original
>    bindings.
>  * Added conditional check for interrupts.

Thanks for the update!

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
> index 000000000000..ca72f64a655c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/isil,isl1208.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intersil ISL1209/19 I2C RTC/Alarm chip with event in
> +
> +maintainers:
> +  - Trent Piepho <tpiepho@gmail.com>
> +
> +description: |
> +  ISL12X9 have additional pins EVIN and #EVDET for tamper detection, while the
> +  ISL1208 and ISL1218 do not.
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
> +  interrupt-names: true

Please keep the list of names here.

> +
> +  isil,ev-evienb:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +    description: |
> +      Enable or disable internal pull on EVIN pin
> +      Default will leave the non-volatile configuration of the pullup
> +      as is.
> +        <0> : Enables internal pull-up on evin pin
> +        <1> : Disables internal pull-up on evin pin
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
> +      properties:
> +        interrupts:
> +          maxItems: 2
> +        interrupt-names:
> +          items:
> +            - const: irq
> +            - const: evdet
> +      required:
> +        - interrupts
> +        - interrupt-names

Interrupts are not required (may not be wired), and are considered
optional by the driver, too.

> +        - isil,ev-evienb

Also not required, as per the default (leave as-is).

> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
