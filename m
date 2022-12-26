Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97B8265655C
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Dec 2022 23:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232453AbiLZWgG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Dec 2022 17:36:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbiLZWfw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 26 Dec 2022 17:35:52 -0500
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DAE8190;
        Mon, 26 Dec 2022 14:35:50 -0800 (PST)
Received: by mail-oi1-f174.google.com with SMTP id i127so11155265oif.8;
        Mon, 26 Dec 2022 14:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6w8kKcVpFv9sHFhyQKUNJ7xPpp7eSjH01obq6G78esM=;
        b=ovl62jHwSV69gPEJpLE/RUiQIMEhivNAVzxA4dgRpDdMUo1r1SrlY2sKRQAG9LP9d+
         1FSRVHjdyhdozRNZqKDukaCA1Q4N2G2F3xnAEuwxOpt0dTr7pwIDf4NEXHQnecNEdtvg
         AeEXhyEp88QlXjachZaCRnvi6HJqPdjHimxt8OaA3rT0GDdpQ/VlahPYrDpn4I3Hc1C6
         F6Ay2GZevX0hleQ902x8ukpmlouQAl0TVDXzpUDr05lkLMnwWXWLNwZlFD/a6IbzQVmI
         4TRATkZAJC+BsFjZjr0osHehGp7Aa6+JuAfOTrKMcuZkOhxBHx63IUYtsneVIhjfzE+1
         7Egw==
X-Gm-Message-State: AFqh2kpAoRGTIm8A/lYWMRODDik3uk5v+TF3XVt8nqcTZpgwvO//AWu+
        wqMkzmrUVHGfqYjeU7MGdA==
X-Google-Smtp-Source: AMrXdXvRtMoTBhVKR/CZ79z8z3Ws/NNsoYkejNK7cfwQZWHLQkthvL9GABaHe9DhiXLxVAhJmtYeQA==
X-Received: by 2002:a05:6808:bcb:b0:355:1de9:390a with SMTP id o11-20020a0568080bcb00b003551de9390amr13711772oik.16.1672094150620;
        Mon, 26 Dec 2022 14:35:50 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80e8:2792:eb0e:539f:f657:547b])
        by smtp.gmail.com with ESMTPSA id z10-20020a9d62ca000000b00660e833baddsm5879928otk.29.2022.12.26.14.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 14:35:50 -0800 (PST)
Received: (nullmailer pid 70056 invoked by uid 1000);
        Mon, 26 Dec 2022 21:55:50 -0000
Date:   Mon, 26 Dec 2022 15:55:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     lee@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        dmitry.torokhov@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, festevam@gmail.com
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: Add nxp bbnsm
Message-ID: <20221226215550.GA67355-robh@kernel.org>
References: <20221226023942.1027270-1-ping.bai@nxp.com>
 <20221226023942.1027270-2-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221226023942.1027270-2-ping.bai@nxp.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Dec 26, 2022 at 10:39:39AM +0800, Jacky Bai wrote:
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
> ---
>  .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> new file mode 100644
> index 000000000000..8d213bce9119
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> @@ -0,0 +1,113 @@
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
> +      nxp,bbnsm-regmap:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description:
> +          phandle of the bbnsm node

You don't need this now, it's the parent node.

> +
> +      interrupts:
> +        maxItems: 1
> +
> +      start-year: true
> +
> +    required:
> +      - compatible
> +      - nxp,bbnsm-regmap
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
> +      nxp,bbnsm-regmap:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description:
> +          phandle of the bbnsm node

Same here.

> +
> +      interrupts:
> +        maxItems: 1
> +
> +      linux,code: true
> +
> +    required:
> +      - compatible
> +      - nxp,bbnsm-regmap
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
> +            nxp,bbnsm-regmap = <&bbnsm>;
> +            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +
> +        bbnsm_pwrkey: pwrkey {
> +            compatible = "nxp,bbnsm-pwrkey";
> +            nxp,bbnsm-regmap = <&bbnsm>;
> +            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +            linux,code = <KEY_POWER>;
> +        };
> +    };
> -- 
> 2.37.1
> 
> 
