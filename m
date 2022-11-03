Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36A29617E1E
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Nov 2022 14:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbiKCNk7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Nov 2022 09:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231694AbiKCNku (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Nov 2022 09:40:50 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 272BF15A3F
        for <linux-rtc@vger.kernel.org>; Thu,  3 Nov 2022 06:40:50 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id z30so1076270qkz.13
        for <linux-rtc@vger.kernel.org>; Thu, 03 Nov 2022 06:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrBdog9lkCg/z6c6w3sdVLrJt7ldcLjb7HMDG5AhIBE=;
        b=lMdsI4n1ENmodwQ0dQXAkMKrKrjSJrR4AhoBtu3OKR9QJgMsSItp8zZQdp0vPuXhrP
         DTGtJ57DZDbiT5U01qBia1BKHcntGoBP/rTkUzccAORbhmViSQiIGheALr6cZGjyiPGl
         /McOvAhgtIbWmvO0Ub85QXT7/kgi+7BYsmYBchYwnMw1swNERiq5ngsZa3rBuMg07sKe
         C1AP3nNtJDK4MX+3IlsQZorR7wtq+27Ti7unLlHHXRaaNbxyLzJ/hU7F0E6RZ8aEQwX7
         qgumtE7n0aV98WpEdDCCxhTGIuOGD8GfxzFQ9fKL0jn+sh3ayjHXytUojkQCTXm1h84P
         vNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrBdog9lkCg/z6c6w3sdVLrJt7ldcLjb7HMDG5AhIBE=;
        b=3qQJ0p2MtKWLNRKWvZb2Ftr0NXn4VTiCTPcvDWIM9JDGryIM5V2vlBVKQJAhC9+GdB
         ujtU2vQXYPPhSLDgjq2Xd2BduvXqVTwv9+mBr/R140bbm4cNhlhCcKgNpUy7pxUv9SIR
         /Zg792J0YGr+DMSpVxBWfpWEJn1urvsMXAMhINZihWWCUCTfA39EpVlcBnCS8ivrll3w
         9lf8tqC/MbY10/sqyy2n4QSZVdjlNQAuxUJu0EVDk2bn8Np2luZ6yxgVibmtInLvqQZJ
         pbu9zs3H1iSLCZaoJ7xrw/Xnuu6Np4HhmzBg8wCOlOj8NqNpqLF7vN2wO723vS0esuLM
         KpOA==
X-Gm-Message-State: ACrzQf3sSOpIolFdLYBtwOmE2RN1p+HObzRt6kDolVpq2U901zIy5csO
        pYGRjwzUHWKteO7aZX0/sWWKmZ92VKUzJA==
X-Google-Smtp-Source: AMsMyM7R2dF4D16Gq3z67Y3u5JBXQs+hHf2PAMiH7ZnLURNcbPzjcJbZgD+cq5dr/NfByhWVHGHWcA==
X-Received: by 2002:a37:c205:0:b0:6fa:18aa:c514 with SMTP id i5-20020a37c205000000b006fa18aac514mr20000581qkm.549.1667482849216;
        Thu, 03 Nov 2022 06:40:49 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb? ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id m25-20020ae9e719000000b006bbf85cad0fsm785166qka.20.2022.11.03.06.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 06:40:48 -0700 (PDT)
Message-ID: <abbccd73-7e49-b70b-d552-c1ff9426ea8c@linaro.org>
Date:   Thu, 3 Nov 2022 09:40:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/2] dt-bindings: rtc: m41t80: Convert text schema to YAML
 one
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-rtc@vger.kernel.org
References: <20221102225943.157344-1-marex@denx.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102225943.157344-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 02/11/2022 18:59, Marek Vasut wrote:
> Convert the m41t80 text schema to YAML schema.
> No functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-rtc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/rtc/rtc-m41t80.txt    | 39 ----------
>  .../devicetree/bindings/rtc/rtc-m41t80.yaml   | 75 +++++++++++++++++++
>  2 files changed, 75 insertions(+), 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-m41t80.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> deleted file mode 100644
> index cdd196b1e9bdb..0000000000000
> --- a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -ST M41T80 family of RTC and compatible
> -
> -Required properties:
> -- compatible: should be one of:
> -	"st,m41t62",
> -	"st,m41t65",
> -	"st,m41t80",
> -	"st,m41t81",
> -	"st,m41t81s",
> -	"st,m41t82",
> -	"st,m41t83",
> -	"st,m41t84",
> -	"st,m41t85",
> -	"st,m41t87",
> -	"microcrystal,rv4162",
> -- reg: I2C bus address of the device
> -
> -Optional properties:
> -- interrupts: rtc alarm interrupt.
> -- clock-output-names: From common clock binding to override the default output
> -                      clock name
> -- wakeup-source: Enables wake up of host system on alarm
> -
> -Optional child node:
> -- clock: Provide this if the square wave pin is used as boot-enabled fixed clock.
> -
> -Example:
> -	rtc@68 {
> -		compatible = "st,m41t80";
> -		reg = <0x68>;
> -		interrupt-parent = <&UIC0>;
> -		interrupts = <0x9 0x8>;
> -
> -		clock {
> -			compatible = "fixed-clock";
> -			#clock-cells = <0>;
> -			clock-frequency = <32768>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-m41t80.yaml b/Documentation/devicetree/bindings/rtc/rtc-m41t80.yaml
> new file mode 100644
> index 0000000000000..7f31a22caec9b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-m41t80.yaml

Filename based on compatibles (more or less), so could be:
st,m41t80.yaml
or:
st,m41txx.yaml

The "rtc" name can be skipped as it is implied from subsystem folder,
unless st,m41txx is a name of some SoC?


> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/rtc-m41t80.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ST M41T80 family of RTC and compatible
> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,m41t62
> +      - st,m41t65
> +      - st,m41t80
> +      - st,m41t81
> +      - st,m41t81s
> +      - st,m41t82
> +      - st,m41t83
> +      - st,m41t84
> +      - st,m41t85
> +      - st,m41t87
> +      - microcrystal,rv4162
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1

Hm, why do you have it?

> +
> +  clock-output-names:
> +    description: From common clock binding to override the default output clock name.

You need maxItems

> +
> +  wakeup-source:
> +    description: Enables wake up of host system on alarm.

Skip the property - it comes from rtc.yaml.

> +
> +  clock:
> +    type: object
> +    $ref: /schemas/clock/fixed-clock.yaml#
> +    properties:
> +      clock-frequency:
> +        const: 32768
> +

Best regards,
Krzysztof

