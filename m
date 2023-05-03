Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4716F54DB
	for <lists+linux-rtc@lfdr.de>; Wed,  3 May 2023 11:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjECJgf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Wed, 3 May 2023 05:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjECJge (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 May 2023 05:36:34 -0400
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E843C14;
        Wed,  3 May 2023 02:36:33 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-b9dcd91a389so6225109276.2;
        Wed, 03 May 2023 02:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683106592; x=1685698592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DO3OiKhgV1UuDV72p/Gb85s0jVsqtaRbi+yl4EZNxWM=;
        b=IfiWGqVqim8W0dgIWrTCrIXV0UfD/5LLv3NeDEa70EcRuhkVlSCROhv7pHUwqtN78s
         HG8Uyj71DhCYQy5z3uyk5+BlQb+YGeHLPtpfO1OlbeJqK3yfsA3gfwNICTK17PS1AJYJ
         PcaKlwuTQBUxfJCDsyFo49g0/wnWItgW4Rqm1yvUMTG29bsbPVUXD1ikUe7tb9daBN9p
         PX+EFuhc+L5XHNMI9k9Y2bv/2+p1Y8N4adb28SNKJM8kC/9KHkegKgyX6OUajitq4zn9
         91gGFJyHAsaY8eGLOSRMqiMvf3FrWn9/4nnzUuH0EUXG0AINTF9+6WS18uRLzMwcghmd
         umvQ==
X-Gm-Message-State: AC+VfDwCh2unQqZeXRnA+9nbNKTcOf92TlQj3yhv+Qsk8Dh9l30umF1D
        9kllrsJ/JF22jqM35mqt4SGOLGnU2EHNEQ==
X-Google-Smtp-Source: ACHHUZ7i8Mpz4+g/GB7wHaFypKEUNE/HU+Gyz/8DmVZbyUtIlCkxln4k3V5Sbq5OcSHwKZyon/vMhA==
X-Received: by 2002:a25:d7d7:0:b0:b9a:66b7:673e with SMTP id o206-20020a25d7d7000000b00b9a66b7673emr21768668ybg.43.1683106592089;
        Wed, 03 May 2023 02:36:32 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id e2-20020a251e02000000b00b9def138173sm1906541ybe.1.2023.05.03.02.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 02:36:31 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-b9246a5f3feso7900170276.1;
        Wed, 03 May 2023 02:36:31 -0700 (PDT)
X-Received: by 2002:a25:51c1:0:b0:ba1:67e4:e62b with SMTP id
 f184-20020a2551c1000000b00ba167e4e62bmr465115ybb.13.1683106590911; Wed, 03
 May 2023 02:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com> <20230503084608.14008-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230503084608.14008-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 3 May 2023 11:36:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrH5R4mAjm1c9zRqiGhNsfT7Y13xxaV-v05T-MCJ6=RQ@mail.gmail.com>
Message-ID: <CAMuHMdVrH5R4mAjm1c9zRqiGhNsfT7Y13xxaV-v05T-MCJ6=RQ@mail.gmail.com>
Subject: Re: [PATCH RFC 4/6] dt-bindings: rtc: isl1208: Document built-in RTC
 device on PMIC RAA215300
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
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

CC Trent's latest address

On Wed, May 3, 2023 at 10:46 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The Built-in RTC device found on PMIC RAA215300 is similar to the isl1208
> IP. However, RTC is enabled by PMIC RAA215300 and the polarity of the
> external oscillator is determined by the PMIC revision.
>
> Document renesas,raa215300-isl1208 compatible and renesas,raa215300-pmic
> property to handle these differences.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../devicetree/bindings/rtc/isil,isl1208.yaml       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> index 04d51887855f..888a832ed1db 100644
> --- a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> @@ -18,6 +18,7 @@ properties:
>            - isil,isl1209
>            - isil,isl1218
>            - isil,isl1219
> +          - renesas,raa215300-isl1208

That sounds a bit over-complicated.
What about just "renesas,raa215300-rtc"?
If you consider them sufficiently compatible, you could add
"isil,isl1208" as a fallback.

>
>    reg:
>      maxItems: 1
> @@ -40,6 +41,10 @@ properties:
>          <0> : Enable internal pull-up
>          <1> : Disable internal pull-up
>
> +  renesas,raa215300-pmic:

"renesas,pmic"?

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the pmic device with isl1208 built-in RTC.
> +
>  required:
>    - compatible
>    - reg
> @@ -58,6 +63,14 @@ allOf:
>          - interrupts-extended
>          - interrupt-names
>          - isil,ev-evienb
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,raa215300-isl1208
> +    then:
> +      required:
> +        - renesas,raa215300-pmic
>
>  unevaluatedProperties: false

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
