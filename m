Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8056B6FCE40
	for <lists+linux-rtc@lfdr.de>; Tue,  9 May 2023 21:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235172AbjEITEd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 9 May 2023 15:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235177AbjEITEV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 9 May 2023 15:04:21 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F3B765AF;
        Tue,  9 May 2023 12:03:55 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-b9e7058d52aso1069103276.0;
        Tue, 09 May 2023 12:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683659034; x=1686251034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4pVhTnaf8Rl6eAFxrJXshWawOfUXvMxZ4DJbfzuGoM=;
        b=Y9LrrkBW+xnGZbwiVXHxWIiGMG6bEk6q3g57gDBWTCNDQ/ZHUCrlD70BcrwFEy0mSn
         D1ansrRYfwTla1W+OUslExa4rHsGq9eqYYrU15arkTpFK1szJ6Q1R8vyq6fEKuZOWdGx
         WaucgGgNKrIoveb7erEUO+8enyVwS5Ef2sen7y3KE8DziiU3brELKSq+ZlZBhdNesDZM
         uFae13J2RIBJsqTRF5Zsj9C+oBsp3iMdwAc7S/uQ2UXKubb9QLBIDBTt30vJ2fFqGdgi
         AJX9jeiD45O5uwlnWKevM0MY1vnnSqX/I6vkCqlhszdSQTU+u0iTzCec6zjCIB8O/Ww0
         cTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683659034; x=1686251034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4pVhTnaf8Rl6eAFxrJXshWawOfUXvMxZ4DJbfzuGoM=;
        b=OLDjCxQ6JGzV3rUT93c6DBbLFl8o133DnJMCTqOpC2DGmYBvp7OWKx2lnXukCJ2Lx5
         KxPpLJSiaUQjOSUj/yZSIc0BB1QEFVaMyUNa0p+zPTUHwcP78uZqVraY8UizmEBmxghH
         6o41lmbX4acdWRk8FRNe4rB5BLd1h4QOEQeak+DcX5HrKm49wI154ZFSO3SFIeLU3nU5
         XcZH0OksZY7ZFVESNhC1YwGLYHdDaBXSSJwLpyuCl47t3NY8c+AqJ456eHt6gHPJ65X/
         TVsskKCh06uDBV24DZux3guL1LKIpyxZ6YTUy5iGz83aE1tBxHA65w907kDHYexvBlz+
         gaeQ==
X-Gm-Message-State: AC+VfDy18/C9VnfkEAGk2B49Es6KoxPblXocz4wD3n2yOHds5ayZf3NV
        YMrl0xfIM+EcyBPgEVkazK58Ip888+RrwkPIRwk=
X-Google-Smtp-Source: ACHHUZ71Tzmgnmxn5VXmX3i32j1vEJ1X6Wx/UBAs56zZxdx36a7QG5VKqTKCeMr5GAvN0ZJb4WFqNWzuFo43c7aJfhA=
X-Received: by 2002:a25:c784:0:b0:b99:4a9:2f5e with SMTP id
 w126-20020a25c784000000b00b9904a92f5emr15102664ybe.0.1683659033781; Tue, 09
 May 2023 12:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230509131249.80456-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230509131249.80456-1-biju.das.jz@bp.renesas.com>
From:   Trent Piepho <tpiepho@gmail.com>
Date:   Tue, 9 May 2023 12:03:42 -0700
Message-ID: <CA+7tXig2nwCk3DKwFEKGKVko=YD4e4KCpRVUMMM2pgPRpNgiiQ@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: rtc: isl1208: Convert to json-schema
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
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

On Tue, May 9, 2023 at 6:12=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> +
> +  interrupt-names:

Shouldn't this have minItems: 1 and maxItems: 2 as well?

> +    items:
> +      - const: irq
> +      - const: evident


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

It appears this was not clear at first.  The default is not to use the
reset value, which is 0, but to leave the existing value unchanged.
The RTC settings are battery-backed and the RTC is not reset on boot
by the kernel.  The value might have been set on a previous boot, or
might have already been configured by the bootloader or BIOS.  This
was a common design in Linux RTC drivers.  The bootloader would
configure the RTC and then Linux driver was only design to be able to
get/set the time and alarms.  Stuff like programming the interrupt
pull-ups or setting calibration registers wasn't done by the kernel.

> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 2
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1

Add interrupt-names here too.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        rtc_twi: rtc@6f {
> +            compatible =3D "isil,isl1208";
> +            reg =3D <0x6f>;
> +        };
> +    };

I agree with Geert's original comment about switching from the most
complex to the simplest example.  It's better to show as much as
possible.

If it's not possible to make a valid example that shows interrupts and
evdet pull enable, then doesn't that mean the bindings don't work?
