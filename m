Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1785607E7
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Jun 2022 19:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbiF2R4Z (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 29 Jun 2022 13:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbiF2R4X (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 29 Jun 2022 13:56:23 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4901A2558B
        for <linux-rtc@vger.kernel.org>; Wed, 29 Jun 2022 10:56:21 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id d2so22390102ejy.1
        for <linux-rtc@vger.kernel.org>; Wed, 29 Jun 2022 10:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=6oHj0nYfa4SdWnhe5zSLFghfdPLCAvgXfoVqQh8QTVE=;
        b=nsTOhN6xKSZJcuBfvJC1mk65ikH2dB2tm/ab/aZSlL8OgyU/35GBQoppOW0XGAKNhW
         GCoKc43S1AxiDGxyGH2NW8BHfHSDYMRuXvy4jU80meEZ8N7+MDCW8Zn3s895KNnB9dyI
         hFro5VU050/c/2DG8On7F4uN2QCk3pckGxxh371CUv0AFdwgvcnB6LXy3EEWvpDELVEy
         717QxY6Bk7UiIN3PFwZSNr3QkmaKya+vRgi6FSufbx3NeWcR5JqDrAdP/vIk/I1J+pbF
         WQ8pfv2fQ6U/sjZz0mC9Ae4h9mY0oeD/rcDs5xnpKZJ62t7VTWhjfNHwk0xQw3IxvFR8
         xxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6oHj0nYfa4SdWnhe5zSLFghfdPLCAvgXfoVqQh8QTVE=;
        b=BtJflo5zkgep5NdqAH6HZqAm2V1HGckyby1/X5FqwA7dyFGFSDilARkgenMgl/Hmez
         mBIFBRH5EaDe79GcnY7KMUFsyuD6kVcnuxLOdzrFF2U8eAdNhNa/59SzWvEVBJctd3Mw
         YOwIRHv7Fo8jGIVS6lpF5O3R70N1JxJDxn+XgTAgsi2eF9hPwYT9ihWQpHgCcJkO8s92
         8eVCLr1kMsaRtUzV4kGXbsiaIuify1dBjyekwxRtjKmq3fBqKl8UX7/Y9F3RauDi4QvL
         MeSqSXA2cOYMHukbS3GvqdVpJtiwEV6GP4fxMxNKA6xcE/n0tUhbjJjULuQJoOmNHcz8
         eBcA==
X-Gm-Message-State: AJIora+QuNEaZ0s6OhG/iFWQF0u2xBoVjpKvy5U0BrAM+JLeQeF19H+4
        FY7UKu/91Rc6Xe+0ZLfsyplCrw==
X-Google-Smtp-Source: AGRyM1s/T0RjbrVgdgRykZIcRKe/wPrgddPdqxDKeZuyxQfmK8nL3iIs+NQ1u0pA8nC/MKESVZ65kg==
X-Received: by 2002:a17:906:a10e:b0:6f3:e70b:b572 with SMTP id t14-20020a170906a10e00b006f3e70bb572mr4605172ejy.546.1656525379833;
        Wed, 29 Jun 2022 10:56:19 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i21-20020a508715000000b004357558a243sm11822833edb.55.2022.06.29.10.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 10:56:19 -0700 (PDT)
Message-ID: <2ad286fb-b215-9c45-ab34-54354e3bb422@linaro.org>
Date:   Wed, 29 Jun 2022 19:56:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 04/14] dt-bindings: nvmem: Add fsl,scu-ocotp yaml file
Content-Language: en-US
To:     "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Viorel Suman <viorel.suman@nxp.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Liu Ying <victor.liu@nxp.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Ming Qian <ming.qian@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220629164414.301813-1-viorel.suman@oss.nxp.com>
 <20220629164414.301813-5-viorel.suman@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629164414.301813-5-viorel.suman@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 29/06/2022 18:44, Viorel Suman (OSS) wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> In order to replace the fsl,scu txt file from bindings/arm/freescale,
> we need to split it between the right subsystems. This patch documents
> separately the 'ocotp' child node of the SCU main node.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> ---
>  .../bindings/nvmem/fsl,scu-ocotp.yaml         | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml
> new file mode 100644
> index 000000000000..a8972acb1b01
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/fsl,scu-ocotp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX SCU Client Device Node - OCOTP bindings based on SCU Message Protocol
> +
> +maintainers:
> +  - Dong Aisheng <aisheng.dong@nxp.com>
> +
> +description: i.MX SCU Client Device Node
> +  Client nodes are maintained as children of the relevant IMX-SCU device node.
> +  Detailed bindings are described in bindings/nvmem/nvmem.txt

Skip last sentence, does not make sense anymore.

> +
> +allOf:
> +  - $ref: "nvmem.yaml#"

Don't mix quotes. I mentioned it last time, although in other place.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qm-scu-ocotp
> +      - fsl,imx8qxp-scu-ocotp
> +
> +patternProperties:
> +  '^mac@[0-9a-f]*$':
> +    type: object
> +    description:
> +      MAC address.
> +
> +    properties:
> +      reg:
> +        description:
> +          Byte offset within OCOTP where the MAC address is stored
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    imx8qx-ocotp {

Just "ocotp" (generic node naming).

> +        compatible = "fsl,imx8qxp-scu-ocotp";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        fec_mac0: mac@2c4 {
> +            reg = <0x2c4 6>;
> +        };
> +    };


Best regards,
Krzysztof
