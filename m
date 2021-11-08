Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C01E449E0E
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Nov 2021 22:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240107AbhKHVZq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Nov 2021 16:25:46 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:43302
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240138AbhKHVZo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Nov 2021 16:25:44 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F0CF33F1B6
        for <linux-rtc@vger.kernel.org>; Mon,  8 Nov 2021 21:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636406578;
        bh=LGE8LB/FBAkcB4TRIytPyRbWjgGL6X6vL5F1SRAbELY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=j2Fb333ZP38/o+d1O+XsXkvw0D8MrGLoN9n7CvXMyVcLR2r2YvOvCQqBiKpbTHAfD
         EcJcM3wdOrDvhpuUhW3eZn5NkvBucmxpTihSuxfwO8kyDXKkthG4Kq2axJx3Mjz97W
         C4vhve7AMK1kRWB8MBGdgTrbZ4nNskeI2/5EgQ9p9JxNZx3Zvi2r7U+HlckfApMK3r
         h6Ml0zZLeBswTDMZQUdrfIHiGtmXd0Twlhu4EFhbvNWhix6Yc+35E+J3NLPBPMnkUi
         ypsA2yTfMupIf7bzZ7h1l8nW8qho3BBuNFGfq8tRYS9H+I6oySlt0BlQDPvthJFKnL
         pDL4Ind6s2Tmw==
Received: by mail-lf1-f71.google.com with SMTP id c40-20020a05651223a800b004018e2f2512so6478403lfv.11
        for <linux-rtc@vger.kernel.org>; Mon, 08 Nov 2021 13:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LGE8LB/FBAkcB4TRIytPyRbWjgGL6X6vL5F1SRAbELY=;
        b=PbCaeSo9Ver8cpwzeeZxb7rCdRLgfL5iD8CnQhio24f80wYopCwiYYwipqMmlJQ0d/
         pRP/vRSFI0wp+sZeOFLejZcrJFllf4t7EDaLDzherQmPrW2LDyezZlIgy8710KDOm6It
         2p3lcNLDjraVeJFbBq+JOvg8iY20/vsQusTtAUMSlNRDUa3grl4DXIDJMlRlfag206cz
         6VFv/iftJTSBwxmzDv0Y4GXmbDijRMQ0K8JWIBw/ax+C/mhQvR5l5CHduE9m3mA4EXWI
         sjlu8UDax4goki+N6be6nxoGO5KQRUn48EqIIBpVwPKLBC6qnGPC/kHY/GX84WEXWw5l
         +kig==
X-Gm-Message-State: AOAM5313D3Qr3qKBEvHtshi0YlN8sapVORTf4CHWFBSLnO5klJwaZsWX
        KVlRof87TTsi5vETDdmC7fdXQj6ibLU7iCuXEUaRavTyn9T9WHNzccbUBSnPFukobpl2IyFy6gj
        BejXCRqCbgAFjj1reEhEgHN1cCcpusiHqhLbuEA==
X-Received: by 2002:ac2:4e98:: with SMTP id o24mr2103066lfr.295.1636406577532;
        Mon, 08 Nov 2021 13:22:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzB7FyQWj/NmtQFBLUENuBzYTo1Q2sgSi5SS19LKPFN5m1tS8X7ElRsBjIRBzYTlTUREatNxw==
X-Received: by 2002:ac2:4e98:: with SMTP id o24mr2103056lfr.295.1636406577370;
        Mon, 08 Nov 2021 13:22:57 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id t204sm318596lff.87.2021.11.08.13.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 13:22:57 -0800 (PST)
Message-ID: <d40ebfa0-2037-9480-f392-c58db885d5a1@canonical.com>
Date:   Mon, 8 Nov 2021 22:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 09/13] dt-bindings: gpio: add bindings for microchip mpfs
 gpio
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
 <20211108150554.4457-10-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-10-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the gpio controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/gpio/microchip,mpfs-gpio.yaml    | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> new file mode 100644
> index 000000000000..067019ddc1f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MPFS GPIO Controller Device Tree Bindings
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description: |
> +  This GPIO controller is found on the Microchip PolarFire SoC.

If "Microchip MPFS" means "Microchip PolarFire SoC", then this is
duplicating the title. Similarly to your previous patches. Skip it then,
there is no point to have descriptions which are obvious or duplicating
existing information.

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - microchip,mpfs-gpio
> +          - microsemi,ms-pf-mss-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
> +    minItems: 1
> +    maxItems: 32
> +
> +  interrupt-controller: true
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  ngpios:
> +    description:
> +      The number of GPIOs available.
> +    minimum: 1
> +    maximum: 32
> +    default: 32
> +
> +  gpio-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#interrupt-cells"
> +  - "#gpio-cells"
> +  - gpio-controller
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include "dt-bindings/clock/microchip,mpfs-clock.h"
> +    #include "dt-bindings/interrupt-controller/microchip,mpfs-plic.h"
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      gpio2: gpio@20122000 {
> +        compatible = "microchip,mpfs-gpio";
> +        reg = <0x0 0x20122000 0x0 0x1000>;
> +        clocks = <&clkcfg CLK_GPIO2>;
> +        interrupt-parent = <&plic>;
> +        interrupts = <PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT
> +          PLIC_INT_GPIO2_NON_DIRECT>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        status = "disabled";

Skip status=disabled.

> +      };
> +    };
> +...
> 


Best regards,
Krzysztof
