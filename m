Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E017B6619BA
	for <lists+linux-rtc@lfdr.de>; Sun,  8 Jan 2023 22:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbjAHVHZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 8 Jan 2023 16:07:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236342AbjAHVGI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 8 Jan 2023 16:06:08 -0500
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B13656A;
        Sun,  8 Jan 2023 13:05:55 -0800 (PST)
Received: by mail-il1-f177.google.com with SMTP id o13so3994993ilc.7;
        Sun, 08 Jan 2023 13:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPKQ08od6rHLoq7984ZDPiViPYt1/bkoxC1qgBWseP0=;
        b=BOmy78H6U77KqOCv52K+wKm2dTT9XnAmbvWNRZBAjsbhrQdJQ/WSuUlLui62IhyiKh
         bSqPuwlpA1ayW3O/BBzr1PNDHb8XwfVu/2886Cnvk5qxf8nnZ5B+zucaIl6zIk/Xb2pp
         scylE+Q5MPvZ+xUJj/sqH5WEwuBF7sV0yMNnSMjWhNjr/IHKqyeElnX6N+tj5gAjSUAv
         +J+RygcwB45FG2+kSXdzZVfeH1ZfHvC8DVJtkPgCf5QokWV5gwsqeOGoz3cjzNuJPL3r
         pswwLdBCu2vvV71s+8/avrVcKfnnOInRDaAcT527SGxeCL5DdwLVHyNReTGtP4Usfd9J
         h2ZQ==
X-Gm-Message-State: AFqh2kreSMZWgxSXPKa3FCzlXieT7oA/wSZORq03rRKh1iYXcvMDnagd
        NvethrggAcE1Iupon1ycFw==
X-Google-Smtp-Source: AMrXdXucC5wdnbW/SytqqN4gbWqjLRgD4reAyzuMo8g6fP6Y3I4fXLE34jwZukSvHl4kryvCfxn2Ow==
X-Received: by 2002:a05:6e02:2169:b0:303:6d1e:e5d1 with SMTP id s9-20020a056e02216900b003036d1ee5d1mr60884245ilv.6.1673211954982;
        Sun, 08 Jan 2023 13:05:54 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
        by smtp.gmail.com with ESMTPSA id g20-20020a92c7d4000000b0030c661606eesm2259367ilk.63.2023.01.08.13.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 13:05:54 -0800 (PST)
Received: (nullmailer pid 275898 invoked by uid 1000);
        Sun, 08 Jan 2023 21:05:51 -0000
Date:   Sun, 8 Jan 2023 15:05:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     lee@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        dmitry.torokhov@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, festevam@gmail.com
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Add nxp bbnsm
Message-ID: <20230108210551.GA268766-robh@kernel.org>
References: <20230103074742.2324924-1-ping.bai@nxp.com>
 <20230103074742.2324924-2-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103074742.2324924-2-ping.bai@nxp.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Jan 03, 2023 at 03:47:39PM +0800, Jacky Bai wrote:
> Add binding for NXP BBNSM(Battery-Backed Non-Secure Module).
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>   - v2 changes:
>     - remove the redundant 'bindings' string
>     - add ref to rtc.yaml
>     - add start-year property
>     - rename 'regmap' to 'nxp,bbnsm-regmap' and add description & type define
>     - add header files including in the example and correct the indentation
> 
>   -v3 changes:
>     - remove the 'nxp,bbnsm-regmap' property, get the regmap directly from the
>       parent node in rtc/pwrkey driver
> ---
>  .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> new file mode 100644
> index 000000000000..bcd8fbc6e297
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/nxp,bbnsm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP Battery-Backed Non-Secure Module
> +
> +maintainers:
> +  - Jacky Bai <ping.bai@nxp.com>
> +
> +description: |
> +  NXP BBNSM serves as non-volatile logic and storage for the system.
> +  it Intergrates RTC & ON/OFF control.
> +  The RTC can retain its state and continues counting even when the
> +  main chip is power down. A time alarm is generated once the most
> +  significant 32 bits of the real-time counter match the value in the
> +  Time Alarm register.
> +  The ON/OFF logic inside the BBNSM allows for connecting directly to
> +  a PMIC or other voltage regulator device. both smart PMIC mode and
> +  Dumb PMIC mode supported.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nxp,bbnsm

Is this a standalone device or block in an SoC. In the latter case, this 
needs to be SoC specific.

> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  rtc:
> +    type: object
> +    $ref: /schemas/rtc/rtc.yaml#
> +
> +    properties:
> +      compatible:
> +        const: nxp,bbnsm-rtc
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      start-year: true
> +
> +    required:
> +      - compatible
> +      - interrupts
> +
> +    additionalProperties: false
> +
> +  pwrkey:
> +    type: object
> +    $ref: /schemas/input/input.yaml#
> +
> +    properties:
> +      compatible:
> +        const: nxp,bbnsm-pwrkey
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      linux,code: true
> +
> +    required:
> +      - compatible
> +      - interrupts
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - rtc
> +  - pwrkey
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/input/linux-event-codes.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    bbnsm: bbnsm@44440000 {
> +        compatible = "nxp,bbnsm", "syscon", "simple-mfd";
> +        reg = <0x44440000 0x10000>;
> +
> +        bbnsm_rtc: rtc {
> +            compatible = "nxp,bbnsm-rtc";
> +            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +
> +        bbnsm_pwrkey: pwrkey {
> +            compatible = "nxp,bbnsm-pwrkey";
> +            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +            linux,code = <KEY_POWER>;
> +        };
> +    };
> -- 
> 2.37.1
> 
> 
