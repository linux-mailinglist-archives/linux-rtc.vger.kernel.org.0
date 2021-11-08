Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22D6449DBC
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Nov 2021 22:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239904AbhKHVP7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Nov 2021 16:15:59 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56692
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239883AbhKHVP6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Nov 2021 16:15:58 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 33B823F1EF
        for <linux-rtc@vger.kernel.org>; Mon,  8 Nov 2021 21:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636405993;
        bh=XB2KDOBpJiDTxLvN53KaY9Yfn9kq5MuLsy13SYbvRGU=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=UE+sQ5HC8SwYYYj7RcaBdm8GunNKTsOGQLbKZjuai+rkr4WLHN3crG47WIxD+fnXp
         jSo7kUuENRJCtm+foTIvhY/Aaz81prUdYLgoSARcMDeYL3Sx8vjuo5rWBVgzloPYCS
         3tiI5ks94aMQD3nuAMZ8xCvI5/yAit5u9ig49g4zW1uRjLBqXYocdi0PPqVswEUqyB
         PmtCe4YQti1t5wSAUaVEzedFOgJGkjACBYrbMghdQaLLvZoaobqJOs0rRPqlH7bXPi
         ufpUlTbLJnjQnw3TMhyFlGfz0Ur87EyHDzw0+sA2au3MX2U0+rKqv5KlJe+/gMvL9u
         ucwCabZySCP1Q==
Received: by mail-lf1-f72.google.com with SMTP id c14-20020a056512104e00b004036d17f91bso2259599lfb.17
        for <linux-rtc@vger.kernel.org>; Mon, 08 Nov 2021 13:13:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XB2KDOBpJiDTxLvN53KaY9Yfn9kq5MuLsy13SYbvRGU=;
        b=O4NpXeep/Az6Ai2SMprZMgszMAHrnFSJ4wGmLIInrjF9EHXgjLWTSwfoPZe6LofCAB
         2xPEanE48SP9/kqTXZ6mk/JgtGd0r5vt7Pv+ukBC1hr15wXAI0bNf4T031+8lxNmJ2nI
         9XiSClUyJqFOtA2w4bYUQVg4yBE2V8nWfCUhzW7YbgeiI3Ko0akWmjtcHgNoByYWb/tD
         h/LG/wFhYlmURCQHHChaOZQ5lQplY967Qg4dz4qepU4sgQakNExjFrtFjt29VaLZRY5S
         YNLorsNrN9rilXWr3fGbUQ37ZljJVxMY5EJ500/nDLpBJ5I7wWCg6VQrp2bMyorweKdP
         UGug==
X-Gm-Message-State: AOAM531+Vk4Yid1eMojJjkgzNM3waI3xwZFDE1YKG2SVCU95UBEpe9Tx
        Dj/qikPY85YUMARFcm3KNnAJl92Mow258TGrennHydczeGTV1SbtMPN0V7wBvjMNB0WbE/3KmVi
        b2MTe/n9j8f7m+Ka3hhDSX9nXcaCwjVWO7CqMJw==
X-Received: by 2002:a05:651c:10a2:: with SMTP id k2mr2206418ljn.456.1636405992510;
        Mon, 08 Nov 2021 13:13:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJoQJPfASIjl/Ea54GsJrSaswI+eaDTggcHJqauek5OKm03GQ1TdlvoYCWn2ROBLnxiDFlTg==
X-Received: by 2002:a05:651c:10a2:: with SMTP id k2mr2206383ljn.456.1636405992327;
        Mon, 08 Nov 2021 13:13:12 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id b13sm1929260lfb.145.2021.11.08.13.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 13:13:12 -0800 (PST)
Message-ID: <632cb889-114b-2b44-3a75-e4b9e5bd0bda@canonical.com>
Date:   Mon, 8 Nov 2021 22:13:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 05/13] dt-bindings: i2c: add bindings for microchip mpfs
 i2c
Content-Language: en-US
To:     conor.dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, atish.patra@wdc.com,
        ivan.griffin@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     geert@linux-m68k.org, bin.meng@windriver.com
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-6-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-6-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/i2c/microchip,mpfs-i2c.yaml      | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> new file mode 100644
> index 000000000000..bc4ea4498d35
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/microchip,mpfs-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MPFS I2C Controller Device Tree Bindings
> +
> +maintainers:
> +  - Daire McNamara <daire.mcnamara@microchip.com>
> +
> +description: |
> +  This I2C controller is found on the Microchip PolarFire SoC.
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description: Phandle of the clock feeding the I2C controller.

Skip such descriptions here and in other patches - they do not introduce
any meaningful information.

> +    minItems: 1

Define instead exact number of clocks or maxItems... but why would they
be variable?

> +
> +  clock-frequency:
> +    description: |
> +      Desired I2C bus clock frequency in Hz. As only Standard and Fast
> +      modes are supported, possible values are 100000 and 400000.
> +    enum: [100000, 400000]
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/microchip,mpfs-clock.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        i2c@2010a000 {
> +            compatible = "microchip,mpfs-i2c";
> +            reg = <0 0x2010a000 0 0x1000>;
> +            interrupts = <58>;
> +            clock-frequency = <100000>;
> +            clocks = <&clkcfg CLK_I2C0>;
> +        };
> +    };
> +  - |
> +    #include <dt-bindings/clock/microchip,mpfs-clock.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        i2c@2010b000 {
> +            compatible = "microchip,mpfs-i2c";
> +            reg = <0 0x2010b000 0 0x1000>;
> +            interrupts = <61>;
> +            clock-frequency = <100000>;
> +            clocks = <&clkcfg CLK_I2C1>;

This is the same example as above, just with changed numbers. Skip it.

> +        };
> +    };
> +...
> 


Best regards,
Krzysztof
