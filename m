Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5284CD69E
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Mar 2022 15:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234596AbiCDOnt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Mar 2022 09:43:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236619AbiCDOnr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Mar 2022 09:43:47 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A974A18FAC5
        for <linux-rtc@vger.kernel.org>; Fri,  4 Mar 2022 06:42:57 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7353B3F5F9
        for <linux-rtc@vger.kernel.org>; Fri,  4 Mar 2022 14:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646404971;
        bh=QUzZG1KHFRSY8yqpaadJhb+c5sbI5/bUJrksOfy+R30=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=IwDM616Oxpm00HYIaDH5WtBhLkcbLwkQu5GmSZTXil0LQp0mJP0pHTraYG/FRrHYD
         7jqiMeAjDlmQ8RiAAoAwcpBBIiyx5S4vb4Dwou8MCDsCf1xZNfJwyG+X1lBFDi+yYn
         jmKBDGFvfiZGBsYtj+fQqY+iNK9nnq59RZ8byqpuLbOhWPIocvqoMNj7Xn9/3Si2Ue
         nA5RSstsXQfQbTaQJGBgeH18LetrgIIz6OnNFxgXTTWKEBXYe0KRGyvCEt+zSUMMxb
         qlsqMxCuiwl/0y3SQWimUV+jMVX7OlSDop4O0n5RJm5QdF8KLpa5fG4r1mKXOyc2eY
         R03PEZqyJBjHQ==
Received: by mail-ej1-f72.google.com with SMTP id og24-20020a1709071dd800b006dab87bec4fso1058467ejc.0
        for <linux-rtc@vger.kernel.org>; Fri, 04 Mar 2022 06:42:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QUzZG1KHFRSY8yqpaadJhb+c5sbI5/bUJrksOfy+R30=;
        b=1QFewDEihY3EQUqgkZfpCdnhHdkLxLDuv1MkRDrpx5duxPjKJM6t7D/ufz7aauWnq6
         L6dzuKSdk6IENp7612NSbNDnPNg/4z37Mq0jy2Plad45jvCl+kqP88DfNV6Uqx9j7/f+
         ckDdzIpz7bCJTl6f5rINVqgWDyxRngPupzfO+ff684WZKinZBrTzbtIgX1ArQc+FdzIa
         3o27HeDGsxUzfAsxf4+QbnSI4Ef127aNS2Sn90Vd/nTQS9mlPz73VlKTQBg6JxjtAj00
         ezGLKVU2KAhWTirR/MMvymZ9+KyT/Al6hk9kmIpOIscxbz7tdvARlyGe7DgjaPhRu4Fe
         w/tA==
X-Gm-Message-State: AOAM5322rwD2cn9Rm1QUA2+Lcf3PNwETnqK3VPf6FF7ZlN9tT8o2sZvC
        HDdAYcMNOJNA0+gjN3moGKaSiAr96LbuYSVngS7DoDbp1cgTbhI/g7SgAbesXhCnzaiQ3H/dxL3
        L40EKgpdTeRSsWu6+uZI+lkGbM2nNjg9xaiFtyA==
X-Received: by 2002:a17:906:360a:b0:6a6:a997:8297 with SMTP id q10-20020a170906360a00b006a6a9978297mr30602320ejb.180.1646404970951;
        Fri, 04 Mar 2022 06:42:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrx2g3R6Ud68BvV4gWkPPo1k1U/MwisVmn7ju2xnZT/szKCRH0WkiBUxKJZAcmjTHeut8HyQ==
X-Received: by 2002:a17:906:360a:b0:6a6:a997:8297 with SMTP id q10-20020a170906360a00b006a6a9978297mr30602297ejb.180.1646404970689;
        Fri, 04 Mar 2022 06:42:50 -0800 (PST)
Received: from [192.168.0.139] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id c6-20020a05640227c600b00415e926bbe1sm1806309ede.89.2022.03.04.06.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 06:42:49 -0800 (PST)
Message-ID: <cc55b477-9f80-fc77-f07b-de0de4812188@canonical.com>
Date:   Fri, 4 Mar 2022 15:42:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/5] dt-bindings: rtc: convert at91sam9 bindings to
 json-schema
Content-Language: en-US
To:     Sergiu Moga <sergiu.moga@microchip.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        nicolas.ferre@microchip.com, claudiu.beznea@microchip.com
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220304142746.121947-1-sergiu.moga@microchip.com>
 <20220304142746.121947-4-sergiu.moga@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220304142746.121947-4-sergiu.moga@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/03/2022 15:27, Sergiu Moga wrote:
> Convert RTC binding for Atmel/Microchip SoCs to Device Tree Schema
> format.
> 
> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
> ---
>  .../bindings/rtc/atmel,at91sam9-rtc.txt       | 25 --------
>  .../bindings/rtc/atmel,at91sam9-rtc.yaml      | 63 +++++++++++++++++++
>  2 files changed, 63 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt b/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
> deleted file mode 100644
> index 3f0e2a5950eb..000000000000
> --- a/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -Atmel AT91SAM9260 Real Time Timer
> -
> -Required properties:
> -- compatible: should be one of the following:
> -	- "atmel,at91sam9260-rtt"
> -	- "microchip,sam9x60-rtt", "atmel,at91sam9260-rtt"
> -- reg: should encode the memory region of the RTT controller
> -- interrupts: rtt alarm/event interrupt
> -- clocks: should contain the 32 KHz slow clk that will drive the RTT block.
> -- atmel,rtt-rtc-time-reg: should encode the GPBR register used to store
> -	the time base when the RTT is used as an RTC.
> -	The first cell should point to the GPBR node and the second one
> -	encode the offset within the GPBR block (or in other words, the
> -	GPBR register used to store the time base).
> -
> -
> -Example:
> -
> -rtt@fffffd20 {
> -	compatible = "atmel,at91sam9260-rtt";
> -	reg = <0xfffffd20 0x10>;
> -	interrupts = <1 4 7>;
> -	clocks = <&clk32k>;
> -	atmel,rtt-rtc-time-reg = <&gpbr 0x0>;
> -};
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.yaml
> new file mode 100644
> index 000000000000..af25cc275356
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2022 Microchip Technology, Inc. and its subsidiaries
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/atmel,at91sam9-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel AT91 RTT Device Tree Bindings
> +
> +allOf:
> +  - $ref: "rtc.yaml#"
> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: atmel,at91sam9260-rtt
> +      - items:
> +          - const: microchip,sam9x60-rtt
> +          - const: atmel,at91sam9260-rtt
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  atmel,rtt-rtc-time-reg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: Phandle to the GPBR node.
> +          - description: Offset within the GPBR block.
> +    description:
> +      Should encode the GPBR register used to store the time base when the
> +      RTT is used as an RTC. The first cell should point to the GPBR node
> +      and the second one encodes the offset within the GPBR block (or in
> +      other words, the GPBR register used to store the time base).

Don't duplicate in description what is already before, so entire part
from "The first cell" is not needed. I mentioned it last time - Instead
of describing cells here, use items. You have items, good, but you still
have description.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - atmel,rtt-rtc-time-reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    rtc@fffffd20 {
> +        compatible = "atmel,at91sam9260-rtt";
> +        reg = <0xfffffd20 0x10>;
> +        interrupts = <1 4 7>;

Could you start acknowledging comments instead of ignoring them?

> +        clocks = <&clk32k>;
> +        atmel,rtt-rtc-time-reg = <&gpbr 0x0>;
> +    };


Best regards,
Krzysztof
