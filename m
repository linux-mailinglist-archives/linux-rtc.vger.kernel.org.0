Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB893687870
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Feb 2023 10:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232484AbjBBJKm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Feb 2023 04:10:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232049AbjBBJKR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 Feb 2023 04:10:17 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26E58002A
        for <linux-rtc@vger.kernel.org>; Thu,  2 Feb 2023 01:10:07 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id o36so845496wms.1
        for <linux-rtc@vger.kernel.org>; Thu, 02 Feb 2023 01:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GuHqxHFmMDzLu09crUNJ3iVIgq0Eo+XKZ1UhzXbjGWY=;
        b=y6m5QULbu4jNV5tebNlgGWntIbntCPYG8aX60ks12N3geKsIihcX9z19Y4nqRXvGjE
         AUVwhql2QqiBWVet+4bDO4tXJhOKGTf3Glgm421z8gQ1iqZ61seX6SBCHY0JJlP9uzhb
         I0nNgGmhOjq9kVRPhQNUjewmLbOHKUKK1B1AVqslbLZk4/P+3sIVbi7BKF98+XPevHKG
         y9Y+4x1M7BaElF2emPWqrAXSXmMOUuUKx9xq2sdGLuyYtwfSbB/gSOwfwwdcxsBb5lMO
         PdbGHI7+vRSz9G7+imxZ7j/9Z95I3KySDZ/GWwFXRJaAw/L/uKppe/9gSLE2tcS231vo
         oJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GuHqxHFmMDzLu09crUNJ3iVIgq0Eo+XKZ1UhzXbjGWY=;
        b=kbZEGCtzG4BQrCIXMIzNqd8JAUCCh1VJXyhlaKcSXWWgD+7L1UaonKV7ofMfe7h0w3
         NXVfZ+E7QDjj/etQMVaGagimQPu3sJT8fErPr0n0Rs4NyvyuKCo5cwkRPOwKBZ6xwROG
         pFCXOodt3jmU2a/EuZjIcHOfOUM2j3xg59nwaxij622qDIrDzqS9fiGnFU+dFEEvozOC
         lVdjAwzvSgD5lN9dmKjdt9HyhA15Fh7rmhiwy7bjes0pjCrYwmEhnJ4ZYRnhXxL7X92Y
         6wInO74NJ3ZKpt0KhU2tTI1YUbwLlaKhkf6QlHnJ7fAPDFoPFPnCDVR+z2kHCzVV6LYW
         b5CQ==
X-Gm-Message-State: AO0yUKX0gGA+mNVV3LSbIUBZdS7pQgMZljxgy7pT8MEmvW9sTmbv/QVn
        7BKvYJd3Olp+lrTsk6k+vP/M03YjVwNhPP1X
X-Google-Smtp-Source: AK7set9K7JX00ufo3veGqKxE4YjIj8gUfpXxTTBR+WIGPUu7UI16cfzONV2wgp8xVOk6CMHqvUKP8w==
X-Received: by 2002:a7b:c8c6:0:b0:3df:9858:c03b with SMTP id f6-20020a7bc8c6000000b003df9858c03bmr1306017wml.16.1675329006288;
        Thu, 02 Feb 2023 01:10:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t1-20020a1c7701000000b003b47b80cec3sm4046965wmi.42.2023.02.02.01.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 01:10:05 -0800 (PST)
Message-ID: <50b797aa-adfe-b3d8-79db-c3ee2cb72f6a@linaro.org>
Date:   Thu, 2 Feb 2023 10:10:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/7] dt-bindings: rtc: Move RV3028 to separate binding
 file
Content-Language: en-US
To:     Frieder Schrempf <frieder@fris.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Cc:     Frieder Schrempf <frieder.schrempf@kontron.de>,
        Rob Herring <robh@kernel.org>,
        Thierry Reding <treding@nvidia.com>
References: <20230201143431.863784-1-frieder@fris.de>
 <20230201143431.863784-2-frieder@fris.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201143431.863784-2-frieder@fris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 01/02/2023 15:34, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> The RV3028 driver uses properties that are not covered by the
> trivial-rtc bindings. Use custom bindings for it.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  .../bindings/rtc/microcrystal,rv3028.yaml     | 56 +++++++++++++++++++
>  .../devicetree/bindings/rtc/trivial-rtc.yaml  |  2 -
>  2 files changed, 56 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
> new file mode 100644
> index 000000000000..4667ba86fd0c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/microcrystal,rv3028.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip RV-3028 RTC
> +
> +allOf:
> +  - $ref: "rtc.yaml#"

Drop quotes

> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +
> +properties:
> +  compatible:
> +    const: microcrystal,rv3028
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  start-year: true

This should be dropped as well and then...

> +
> +  trickle-resistor-ohms:
> +    enum:
> +      - 3000
> +      - 5000
> +      - 9000
> +      - 15000
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

...switch to unevaluatedProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        rtc@51 {

Rob's pointed missing testing.

But more important - please rebase your patches on current tree. Looks
like all the changes are already done...

Best regards,
Krzysztof

