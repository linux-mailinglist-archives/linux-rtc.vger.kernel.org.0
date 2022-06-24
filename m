Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8835E5597A5
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jun 2022 12:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbiFXKS2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 24 Jun 2022 06:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231428AbiFXKSZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 24 Jun 2022 06:18:25 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1A62E68D
        for <linux-rtc@vger.kernel.org>; Fri, 24 Jun 2022 03:18:23 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id fd6so2782403edb.5
        for <linux-rtc@vger.kernel.org>; Fri, 24 Jun 2022 03:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qnp6rqILNXIxfMBLypf+MkSZ3Gv/YEYzaepOxblLauQ=;
        b=aAhjCmlx7ZK5ZXSWfw1OssBCtmmsklHptaZU/HpJiqaIR0wORRMuBnvk9MmFG012tB
         6wD/ery5P+dVXaYkRZT5DFHF0Abq8RtNwsyqcITJJp6P540orXGf0yTGWWQ0qGjgt/wt
         6k2Ua8UkLzhbHTHyqjrZqso6pB9J/hTGz1M/FzIOv1G+Hj+HmP4LlPwDrO5kCOzAkUPX
         XrFdEIBgEJ9G9hs88Heilin5Wz+q5dn1uslMGLAq0k4P2o2w4Px/mvFjjsRfkOD0YOxY
         DsHIWWiHLoW64rHzV5xHV4g7hTuQtpg//0TmUz7EFc8sB84JZjeMo+ueo6T94Ku1i+En
         GlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qnp6rqILNXIxfMBLypf+MkSZ3Gv/YEYzaepOxblLauQ=;
        b=fdSd3jAXFHGtNQkiYU6/NQFCbsua9viK2I3NBSLfDVxbns8FNA+tSDkLRFx9yerKHS
         HCkkf+/gFSgvLwUHaGXNi7putl4K/xTFeiIzRo3bFzPtVEhXXACQ2s/uAKbs5mzsHqc3
         iQXZ2Ht7Cg+lFa0q7nWlva4mPLOV5uw/7ItjoLiFnejMloyIaPKChEXxhODrV2Xh9cNJ
         L9sv7fM2psydKvUKHsRfPa/acbSS8DmGpKXwM6xnzsoNJX3cUwVFSG9T9VoBQMkSePyo
         YmwXDRMHh5c8HzVY/UMGa/N8/e8V0pFVwmyVLej7vB4OkuJr2Lrp8Dy81cui7kyClNcr
         etcg==
X-Gm-Message-State: AJIora8Mgf8Qg2fLSaw/Fn8S5PMCdOGPeIgi9KMEHSTNiclifwdTkzqI
        GaN0a8S8OExyF8d0tnhcCvZrKA==
X-Google-Smtp-Source: AGRyM1tKCQdi1JAIO7I6BidT9Q/H2QmSrnzztZtGGNQLaaR3QaZ5FaM9W0eWEbDn7F4mNvAQb1/2ow==
X-Received: by 2002:a05:6402:448c:b0:435:9dcc:b8a5 with SMTP id er12-20020a056402448c00b004359dccb8a5mr16438792edb.287.1656065902422;
        Fri, 24 Jun 2022 03:18:22 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b9-20020aa7d489000000b004358243e752sm1659787edr.5.2022.06.24.03.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 03:18:21 -0700 (PDT)
Message-ID: <326d3cc2-3af7-ee08-3fd2-91dcf30ef5fa@linaro.org>
Date:   Fri, 24 Jun 2022 12:18:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 08/14] dt-bindings: thermal: Add fsl,scu-thermal yaml
 file
Content-Language: en-US
To:     Viorel Suman <viorel.suman@nxp.com>,
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
        Oliver Graute <oliver.graute@kococonnector.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Liu Ying <victor.liu@nxp.com>,
        Ming Qian <ming.qian@nxp.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Abel Vesa <abel.vesa@nxp.com>
References: <20220616164303.790379-1-viorel.suman@nxp.com>
 <20220616164303.790379-9-viorel.suman@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616164303.790379-9-viorel.suman@nxp.com>
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

On 16/06/2022 18:42, Viorel Suman wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> In order to replace the fsl,scu txt file from bindings/arm/freescale,
> we need to split it between the right subsystems. This patch documents
> separately the 'thermal' child node of the SCU main node.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> ---
>  .../bindings/thermal/fsl,scu-thermal.yaml     | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml b/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
> new file mode 100644
> index 000000000000..8f2646a18ef0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/fsl,scu-thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX SCU Client Device Node - Thermal bindings based on SCU Message Protocol
> +
> +maintainers:
> +  - Dong Aisheng <aisheng.dong@nxp.com>
> +
> +description: i.MX SCU Client Device Node
> +  Client nodes are maintained as children of the relevant IMX-SCU device node.
> +
> +allOf:
> +  - $ref: /schemas/thermal/thermal-sensor.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: fsl,imx8qxp-sc-thermal
> +      - const: fsl,imx-sc-thermal
> +
> +  '#thermal-sensor-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - '#thermal-sensor-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    thermal-sensor {

Wrong indentation.

> +             compatible = "fsl,imx8qxp-sc-thermal", "fsl,imx-sc-thermal";
> +             #thermal-sensor-cells = <1>;
> +    };


Best regards,
Krzysztof
