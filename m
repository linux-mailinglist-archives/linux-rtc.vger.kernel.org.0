Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE4611EE6B
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 00:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfLMXZY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 13 Dec 2019 18:25:24 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39879 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfLMXZY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 13 Dec 2019 18:25:24 -0500
Received: by mail-oi1-f196.google.com with SMTP id a67so2075424oib.6;
        Fri, 13 Dec 2019 15:25:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dLfBlRiHKWoew0reabXfa/MbAeC9Mc4ikeTkPhntb9g=;
        b=eDKWVU/bMyFbkGbT+ctHZ2p4R79oCo2q5vuBAegVEEH4BUx1EbBJvedqh6USdzdV6Q
         jGfkDz6BW80ELHG54V3s2/ZwE0VZpnJR5FWoF6s4MPVrcBjn1GxAQDbjRiDQBfEF6xEd
         P8OYvzLtAblJ5JVsSyOFzwRH8hd10nqrqWo1lstNq0YBvGEv3mp6FdnZse5EiiZOw67s
         UNLaQnb8UNTN230uhJ+Tof7mFFMOy+n4+d3CY7jTz+fSbKyJXpKIxY2JERqKgY4PwGIO
         RyDyK2qcL5PHhPY9rtuNVByeEUPNGDJKOi2zOEK5awJPcenVmKLfZpq8MT8xD+8796QS
         WESw==
X-Gm-Message-State: APjAAAUFTY9Tcimall73qMm+tsdEtu2Mvp+Vapvor7qarT9/SjQI9q8I
        UEWi9XTb5v4s+TiTFfzeaw==
X-Google-Smtp-Source: APXvYqwoHMOiga8bgQ2raABQGFJaX4uqduovQEJFvsdi+ExC6o+PYKI9rlCu3Kwb/ygG5liYl0HTJQ==
X-Received: by 2002:aca:4eca:: with SMTP id c193mr7743827oib.37.1576279522531;
        Fri, 13 Dec 2019 15:25:22 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n15sm3855369otr.67.2019.12.13.15.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 15:25:21 -0800 (PST)
Date:   Fri, 13 Dec 2019 17:25:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        mark.rutland@arm.com, alexandre.torgue@st.com,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: Convert stm32 rtc bindings to
 json-schema
Message-ID: <20191213232521.GA20953@bogus>
References: <20191202145740.29123-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191202145740.29123-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Dec 02, 2019 at 03:57:40PM +0100, Benjamin Gaignard wrote:
> Convert the STM32 RTC binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/rtc/st,stm32-rtc.txt       |  61 ---------
>  .../devicetree/bindings/rtc/st,stm32-rtc.yaml      | 152 +++++++++++++++++++++
>  2 files changed, 152 insertions(+), 61 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml


> diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> new file mode 100644
> index 000000000000..80c445005bfb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/st,stm32-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Real Time Clock Bindings
> +
> +maintainers:
> +  - Gabriel Fernandez <gabriel.fernandez@st.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32-rtc
> +      - st,stm32h7-rtc
> +      - st,stm32mp1-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: rtc_ck
> +
> +  interrupts:
> +    maxItems: 1
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32-rtc
> +              - st,stm32h7-rtc
> +    then:
> +      properties:
> +        st,syscfg:
> +          allOf:
> +            - $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +            - items:
> +                minItems: 3
> +                maxItems: 3
> +          description: |
> +            Phandle/offset/mask triplet. The phandle to pwrcfg used to
> +            access control register at offset, and change the dbp (Disable Backup
> +            Protection) bit represented by the mask, mandatory to disable/enable backup
> +            domain (RTC registers) write protection.
> +
> +        assigned-clocks:
> +          allOf:
> +            - $ref: "/schemas/types.yaml#/definitions/phandle-array"

Already has a type, so drop this.

> +          description: |
> +            override default rtc_ck parent clock reference to the rtc_ck clock entry
> +          maxItems: 1
> +
> +        assigned-clock-parents:
> +          allOf:
> +           - $ref: "/schemas/types.yaml#/definitions/phandle-array"

Same here.

Since you have the false schema below, I think these can go in base 
schema rather than under the if.

> +          description: |
> +            override default rtc_ck parent clock phandle of the new parent clock of rtc_ck
> +          maxItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32-rtc
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          maxItems: 1
> +
> +        clock-names: false
> +
> +      required:
> +        - st,syscfg
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32h7-rtc
> +
> +    then:
> +       properties:
> +         clocks:
> +           minItems: 2
> +           maxItems: 2
> +
> +       required:
> +         - clock-names
> +         - st,syscfg
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp1-rtc
> +
> +    then:
> +       properties:
> +         clocks:
> +           minItems: 2
> +           maxItems: 2
> +
> +         assigned-clocks: false
> +         assigned-clock-parents: false
> +
> +       required:
> +         - clock-names
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +examples:
> +  - |
> +    #include <dt-bindings/mfd/stm32f4-rcc.h>
> +    #include <dt-bindings/clock/stm32fx-clock.h>
> +    rtc@40002800 {
> +      compatible = "st,stm32-rtc";
> +      reg = <0x40002800 0x400>;
> +      clocks = <&rcc 1 CLK_RTC>;
> +      assigned-clocks = <&rcc 1 CLK_RTC>;
> +      assigned-clock-parents = <&rcc 1 CLK_LSE>;
> +      interrupt-parent = <&exti>;
> +      interrupts = <17 1>;
> +      st,syscfg = <&pwrcfg 0x00 0x100>;
> +    };
> +
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    rtc@5c004000 {
> +      compatible = "st,stm32mp1-rtc";
> +      reg = <0x5c004000 0x400>;
> +      clocks = <&rcc RTCAPB>, <&rcc RTC>;
> +      clock-names = "pclk", "rtc_ck";
> +      interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +...
> -- 
> 2.15.0
> 
