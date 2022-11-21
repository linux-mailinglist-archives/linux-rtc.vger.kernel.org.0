Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05009631C85
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Nov 2022 10:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbiKUJKI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Nov 2022 04:10:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbiKUJJp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Nov 2022 04:09:45 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABEB8FE46
        for <linux-rtc@vger.kernel.org>; Mon, 21 Nov 2022 01:09:43 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id a15so13769231ljb.7
        for <linux-rtc@vger.kernel.org>; Mon, 21 Nov 2022 01:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5iEe7fRY9UI3AIlY+2BLLJv3AGvgsuX2GD1a9szCu9I=;
        b=q7Pr41DBl6rR/A4TtHdH/roj5GaCx8EvAhpS1JRx+Tbe/ThGfLRmzQbrEh3VauzIh0
         CSEgjoGSGGpzrB3A7mokXemHhqloLKOLbxgtWvAav7It9nhHYOnS2Gpfc0rUJlw7y+dc
         p8uPnPU0IQumuIROmAsjH1O72Py6JizpXaJVzgXJm0dpr28zHm9xAhFmwxJZ45OAMEK2
         0v0WWm56qvo3+FjNKL020M0+suQ8Molq682RWRt7JHEtzdbPNo2ikUhb/OZ3TxZAwkzq
         fvP7od2XrVub1Ec4mFVA0kgNnqhj8bJLED+TslRlCMpvbi4MJ8hkVQ/qTGp1kpGuJjmy
         Pb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5iEe7fRY9UI3AIlY+2BLLJv3AGvgsuX2GD1a9szCu9I=;
        b=eJUo6fNkTM38sIVLjc0o+/9bXesQvStkO+T0HnF+4XHIbZdXNVnwBWdVI2js6emiIy
         1JOEeKeU/vAHxutepaIDaoVVxlt6ygx62I9B4fIs3Qu6xMxtgkcFEjMDmgE4/xkhBXQB
         XcydK2+r5aux+ktinoeO8tw7Vh/rbEgrQM1/Q5pkCKKHi+w4bHSrGjwydDiM8NB2fwVv
         e4d4mJ49Vk83dRGgI2QADQP/RFZRFhCJ+/r/jE/8Ys1HjKl7QRG5cqruRO1701wX/nKv
         i3erwlrfvzw/ZZv+rguPE6p0SbOx4SGIezN3WWcbSxkB4j1NKXZ/8s1nXyU3/Ov+8Y+N
         D4Qg==
X-Gm-Message-State: ANoB5pkzrI8AYwKj6bRNT83NeY2115dRssL5E9cAXJrSwWtekNdGV6gz
        gQi6kKyjZYGTffcQ0TCJAn0Bfw==
X-Google-Smtp-Source: AA0mqf65tf5iX3QXgYL+eDW+B/MJ19SGQIBINQ1kkLBTydy+/a8Q+euTpQhHxseu7DMQRo+st/RVMg==
X-Received: by 2002:a2e:bd17:0:b0:277:50a:bd5c with SMTP id n23-20020a2ebd17000000b00277050abd5cmr5364778ljq.6.1669021782081;
        Mon, 21 Nov 2022 01:09:42 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a25-20020a056512021900b004a9b9ccfbe6sm1956656lfo.51.2022.11.21.01.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 01:09:41 -0800 (PST)
Message-ID: <2aeb0590-4fd0-5bb4-5e68-0378953a94c3@linaro.org>
Date:   Mon, 21 Nov 2022 10:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Content-Language: en-US
To:     Jacky Bai <ping.bai@nxp.com>, lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-2-ping.bai@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121065144.3667658-2-ping.bai@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/11/2022 07:51, Jacky Bai wrote:
> Add binding for NXP BBNSM(Battery-Backed Non-Secure Module).
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 103 ++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> new file mode 100644
> index 000000000000..b3f22b0daea6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/nxp,bbnsm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP Battery-Backed Non-Secure Module bindings
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
> +
> +    properties:
> +      compatible:
> +        const: nxp,bbnsm-rtc


Missing ref to rtc.yaml.

> +
> +      regmap:

Use vendor prefix, descriptive name and description. Where is the type
of 'regmap' defined?

> +        maxItems: 1

I don't think this is correct. Rob explained the simple-mfd means
children do not depend on anything from the parent, but taking a regmap
from its parent contradicts it.

> +
> +      interrupts:
> +        maxItems: 1

You have same interrupt and same address space used by two devices.

Both arguments (depending on parent regmap, sharing interrupt) suggests
that this is one device block, so describing it with simple-mfd is quite
unflexible.

> +
> +    required:
> +      - compatible
> +      - regmap
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
> +      regmap:
> +        maxItems: 1
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      linux,code: true
> +
> +    required:
> +      - compatible
> +      - regmap
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
> +    bbnsm: bbnsm@44440000 {
> +      compatible = "nxp,bbnsm", "syscon", "simple-mfd";
> +      reg = <0x44440000 0x10000>;
> +
> +      bbnsm_rtc: rtc {
> +        compatible = "nxp,bbnsm-rtc";

Use 4 spaces for example indentation.

> +        regmap = <&bbnsm>;
> +        interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +      };
> +
> +      bbnsm_pwrkey: pwrkey {
> +         compatible = "nxp,bbnsm-pwrkey";
> +         regmap = <&bbnsm>;
> +         interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +         linux,code = <KEY_POWER>;
> +       };
> +    };

Best regards,
Krzysztof

