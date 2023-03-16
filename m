Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAFAB6BC7F0
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Mar 2023 08:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjCPH5u (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Mar 2023 03:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbjCPH5r (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Mar 2023 03:57:47 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958AD26C3D
        for <linux-rtc@vger.kernel.org>; Thu, 16 Mar 2023 00:57:43 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id o12so4021422edb.9
        for <linux-rtc@vger.kernel.org>; Thu, 16 Mar 2023 00:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678953462;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUKmVZD4P10t9tCmWsV/xiC2I1YN3U8W6JtlRyatjRg=;
        b=Xw3+Kvfeto5589ehWRE9jW0zXPLkt2pJPGHn5kE4sK3UiSZwo1y2drS68wpgBezbB+
         1dinfQ+75yEZ0KBV8/Kt3mbU+0xEGHZgjac1ZvICtx22VfgEzgz27zxIzutLSXFjR41+
         wkscuqTlOgdtfcxI9p+qjR/T7XIZHsSUdNF91ofT7xiLS3wS2uA6rYCwkE/Ogg16Vn1i
         mRekwGuCl0X2oWJ80vZaDaxjnl/ypF3AS889xftnE8gYdS3WUxEGhpIR7skjfTZYMW6V
         o0ZkPt2R4xJWJ49HLME6fAQWazlVB1USC2qu+X5OnE+IVZKrYoJmqIxRP5p7Cf9+bGsF
         jZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678953462;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUKmVZD4P10t9tCmWsV/xiC2I1YN3U8W6JtlRyatjRg=;
        b=V+W9xJqpppWONs297Priaz4KLWrlUEM12+KNbeneP9AD3RlLeD/ifHAiwJpr2pUVb9
         0a1RNOtEfLC3vTBkuVOPBeGs6R8smKHtP0T8Kvc9Mk5F8OXRsTk+hJdDWwzZ1bZpNAbh
         3VnsC/IQwz+imEcWuT1t6hObqKAW90RrWsIt5GME1DhBakHSy7ky+/4Kxew5Rwmw0Jjc
         lpmuccQNLw+hznHkoQiEq3C70bSKUZgYtzKmrMUwxOJcXD29t8k//6KiTXyPTINPyMzl
         rAyRWgZ8VH+yh814Ljooumj2QWsR1ax6XNqOuRhlYcAbmwoKpeumHyxVTyDYMPdZm3cj
         odQg==
X-Gm-Message-State: AO0yUKVWoBhhy2e3E48vWITmA95+SDdrEtugf8I+a8Yv3mJwnUFrChdF
        JRsQC0Y79+WiZ6K0aYewm4XYBg==
X-Google-Smtp-Source: AK7set/44q+f7ezrCJo9lEFuuMwzHC04K9dAbeiAfdMqxRNZv/8E6WRomtaxUYP5ax2gWHBVMu1gJw==
X-Received: by 2002:a17:906:2290:b0:8f0:9566:c1ff with SMTP id p16-20020a170906229000b008f09566c1ffmr9886317eja.69.1678953462052;
        Thu, 16 Mar 2023 00:57:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id v10-20020a170906858a00b008d173604d72sm3531809ejx.174.2023.03.16.00.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 00:57:41 -0700 (PDT)
Message-ID: <c441cab6-09a1-864b-d857-0c22e15b029e@linaro.org>
Date:   Thu, 16 Mar 2023 08:57:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/2] dt-bindings: rtc: add max313xx RTCs
Content-Language: en-US
To:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Zeynep Arslanbenzer <Zeynep.Arslanbenzer@analog.com>
References: <20230315161626.247-1-Ibrahim.Tilki@analog.com>
 <20230315161626.247-3-Ibrahim.Tilki@analog.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315161626.247-3-Ibrahim.Tilki@analog.com>
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

On 15/03/2023 17:16, Ibrahim Tilki wrote:
> Devicetree binding documentation for Analog Devices MAX313XX RTCs
> 
> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> Signed-off-by: Zeynep Arslanbenzer <Zeynep.Arslanbenzer@analog.com>
> ---
>  .../devicetree/bindings/rtc/adi,max313xx.yaml | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/adi,max313xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/adi,max313xx.yaml b/Documentation/devicetree/bindings/rtc/adi,max313xx.yaml
> new file mode 100644
> index 000000000..bed6d0bc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/adi,max313xx.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2022 Analog Devices Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/adi,max313xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices MAX313XX series I2C RTCs
> +
> +maintainers:
> +  - Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> +  - Zeynep Arslanbenzer <Zeynep.Arslanbenzer@analog.com>
> +
> +description: Analog Devices MAX313XX series I2C RTCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,max31328
> +      - adi,max31329
> +      - adi,max31331
> +      - adi,max31334
> +      - adi,max31341
> +      - adi,max31342
> +      - adi,max31343
> +
> +  reg:
> +    description: I2C address of the RTC
> +    items:
> +      - enum: [0x68, 0x69]
> +
> +  interrupts:
> +    description: |
> +      Alarm1 interrupt line of the RTC. Some of the RTCs have two interrupt
> +      lines and alarm1 interrupt muxing depends on the clockin/clockout
> +      configuration.
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    description: |
> +      RTC can be used as a clock source through its clock output pin when
> +      supplied.
> +    const: 0
> +
> +  clocks:
> +    description: |
> +      RTC uses this clock for clock input when supplied. Clock has to provide
> +      one of these four frequencies: 1Hz, 50Hz, 60Hz or 32.768kHz.
> +    maxItems: 1
> +
> +  aux-voltage-chargeable: true

Drop, coming from rtc.yaml.

> +
> +  trickle-resistor-ohms:
> +    description: Enables trickle charger with specified resistor value.
> +    enum: [3000, 6000, 11000]
> +
> +  adi,trickle-diode-enable:
> +    description: Charge the auxiliary voltage with a diode.
> +    type: boolean
> +
> +additionalProperties: false

Use order like in example-schema, so required, allOf then
unevaluatedProperties: false.


Best regards,
Krzysztof

