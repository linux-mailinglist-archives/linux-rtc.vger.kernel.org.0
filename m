Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38189709745
	for <lists+linux-rtc@lfdr.de>; Fri, 19 May 2023 14:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjESMgH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Fri, 19 May 2023 08:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjESMgG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 May 2023 08:36:06 -0400
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B9BC4;
        Fri, 19 May 2023 05:36:03 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-ba8cf3cb34fso1199632276.1;
        Fri, 19 May 2023 05:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684499762; x=1687091762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVpGxtPV/5zH7gZigHRWqwwkAYdOfCIFqk5Eo57CTOw=;
        b=d1HbcAZzxq+AfnTQ8t8fY5keuIBY5Z24fn7vC9sDYXhhh3sDj7/jw7U7RM5L4JlfAq
         918esMteOsamHqbyGID+AHGMK1SsM0bSuLiLbGtFKErd1h2pYijc6iAeOcjLrgRV3cQB
         775B7y3WRQhXFHBRxErIMJFLgSUVPEmJ2nSXNH+hNncpuXZC4yVcAsOF6YR61/bhUa5L
         mhFjMTQ6ojA+kzRv49btsIJf2DZ3Wn919mJinWLFk+s0Z2m0RVJyEWpMhm1psky1OaFV
         VsEmgWs0vBgd5Fb4S7989VvlGGuN3nQ2AdAbjeB1AVGD8ZBJPTD6np57sSWIrqbGtfPe
         G8Xg==
X-Gm-Message-State: AC+VfDwQqd9oSvmC4EcoXfZ1s4ELPWZHNNWoZsNY5TiZaLJ98JObooxJ
        NZ4dIbJhj2cc0pwHShm9vR6BVXI/sRD/cA==
X-Google-Smtp-Source: ACHHUZ4sdhY2ST+CPexXEX/KtoiXLc59OyMCBumXS356s5zSPHYAd7hA9cKqdnhy7cjvHEvMALy17w==
X-Received: by 2002:a25:f83:0:b0:ba8:28ab:684b with SMTP id 125-20020a250f83000000b00ba828ab684bmr1580880ybp.11.1684499762600;
        Fri, 19 May 2023 05:36:02 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id x184-20020a8187c1000000b0055a486140b6sm1134230ywf.36.2023.05.19.05.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 05:36:01 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-ba8cf3cb34fso1199565276.1;
        Fri, 19 May 2023 05:36:00 -0700 (PDT)
X-Received: by 2002:a25:140a:0:b0:ba8:2a74:155 with SMTP id
 10-20020a25140a000000b00ba82a740155mr1381964ybu.32.1684499760349; Fri, 19 May
 2023 05:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com> <20230518113643.420806-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230518113643.420806-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 May 2023 14:35:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWugibN6BDGfaNdJvi5+MQ8C0utPQJAym1gk61TEHdOdA@mail.gmail.com>
Message-ID: <CAMuHMdWugibN6BDGfaNdJvi5+MQ8C0utPQJAym1gk61TEHdOdA@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] dt-bindings: rtc: isil,isl1208: Document clock
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

On Thu, May 18, 2023 at 1:37 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
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
> ---
> v4:
>  * New patch

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> @@ -25,6 +25,19 @@ properties:
>    reg:
>      maxItems: 1
>
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description: |
> +      Use xin, if connected to an external crystal.
> +      Use clkin, if connected to an external clock signal.
> +    oneOf:
> +      - items:
> +          - const: xin
> +      - items:
> +          - const: clkin
> +

I guess that oneOf scheme is equivalent to the simpler

    enum:
      - xin
      - clkin

?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
