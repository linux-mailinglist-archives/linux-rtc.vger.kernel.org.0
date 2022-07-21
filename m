Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6C1A57C616
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Jul 2022 10:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbiGUIUF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Jul 2022 04:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbiGUIUD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Jul 2022 04:20:03 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5F67D798
        for <linux-rtc@vger.kernel.org>; Thu, 21 Jul 2022 01:20:02 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id y11so1601055lfs.6
        for <linux-rtc@vger.kernel.org>; Thu, 21 Jul 2022 01:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FJ5D/KpCVhJU7PWecXfsixiLL7lhXNx134SjfsphOow=;
        b=fVVwdfnERH/ZAzKwQ8D2eh/gVhSE4+99hTRGFF297rEcuxwgTKvuvVHKZsmD/NxD8K
         pcSA4TUfRMJFoaPmevW7XRQzZKN7/wj0xIL/B9KJcpBxo9XmakLaLDn14al9Q9hFEBGb
         shvTea4/NM9tAwawQ/7PZprdS/4mmy4hYR9yxe58qeSiyyL45VUg9A5oYLalyeeJBcoo
         s+W3mgKCkJuJQ/Bw9QeZrcI+rji4IiyOWO4jqqToQMz/ie9fhQuXxO0LmVkiQcFPxk/L
         T890YELQQJ/wqMlY+G5fh0HKDbk5HmobXYw/eWBEd+ABP4kp6f2usqqVPaKyspFKOdcr
         8SIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FJ5D/KpCVhJU7PWecXfsixiLL7lhXNx134SjfsphOow=;
        b=6ePyzhkF28MnY6WClyiWVAe64miWZxE7UrhybpynxKHKvVVVmtsyUp0G3A8/LB1ut/
         nlTGuMF/B3N3b2j162+9kbS3uMPqZz3bquWd4rG4MSr5vmB3DqXBXRFTLdSYl8vN6uGC
         iDZaanB36WUHGSMPPLe2SYLUz/G48KwJBF9nv3o88NF2lhkrAoRnbPJV6CI00Nulnc1h
         eKyT9oUuoMje9N6zGHXnFTcWOS7ObqprgHz4FKhb9l5dSU8ePWslgGWEWBb2vPjTXO/E
         /b+JQuYkZWTOzbOzf7+1s1yu2vOOUnsxqL0HljRGjukGkUkgi3kc5vBoT+z7qI6hguuy
         vHZQ==
X-Gm-Message-State: AJIora9Soc24mdLRkcfFLYiaIjw/4D7GAI95J7ISuhNHHPriCLulNJi7
        ZI+epMQwhfJ4kfqq8YqLSJGUDQ==
X-Google-Smtp-Source: AGRyM1sPlMW8ZU6galDbuJDbczbMcOyN3ll8sb/vHVNn6QO/ZbKCqQJXSIFaIBWvvPBjlnXr2XDM4Q==
X-Received: by 2002:a05:6512:3f8e:b0:48a:4343:8265 with SMTP id x14-20020a0565123f8e00b0048a43438265mr8777777lfa.294.1658391600897;
        Thu, 21 Jul 2022 01:20:00 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id j7-20020a2e6e07000000b0025d53e34fe7sm336700ljc.56.2022.07.21.01.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 01:19:59 -0700 (PDT)
Message-ID: <c10033b7-69d2-64b0-66cc-62799de59a7e@linaro.org>
Date:   Thu, 21 Jul 2022 10:19:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] dt-bindings: rtc: nxp,pcf85063: Convert to DT schema
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
References: <20220721073141.1746700-1-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721073141.1746700-1-alexander.stein@ew.tq-group.com>
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

On 21/07/2022 09:31, Alexander Stein wrote:
> Convert the NXP PCF85063 RTC binding to DT schema format.
> 
> Add 'interrupts' and 'wakeup-source' as this device has an interrupt
> which was not documented, but is in use.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> checkpath.pl warns about:
> WARNING: DT binding docs and includes should be a separate patch. See:
> Documentation/devicetree/bindings/submitting-patches.rst
> 
> But this seems to be a false positive to me. Includes are not touched at
> all.
> 
>  .../devicetree/bindings/rtc/nxp,pcf85063.txt  | 32 --------
>  .../devicetree/bindings/rtc/nxp,pcf85063.yaml | 76 +++++++++++++++++++
>  2 files changed, 76 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt
> deleted file mode 100644
> index 217b7cd06c11..000000000000
> --- a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -* NXP PCF85063 Real Time Clock
> -
> -Required properties:
> -- compatible: Should one of contain:
> -	"nxp,pca85073a",
> -	"nxp,pcf85063",
> -	"nxp,pcf85063a",
> -	"nxp,pcf85063tp",
> -	"microcrystal,rv8263"
> -- reg: I2C address for chip.
> -
> -Optional property:
> -- quartz-load-femtofarads: The capacitive load of the quartz(x-tal),
> -  expressed in femto Farad (fF). Valid values are 7000 and 12500.
> -  Default value (if no value is specified) is 7000fF.
> -
> -Optional child node:
> -- clock: Provide this if the square wave pin is used as boot-enabled fixed clock.
> -
> -Example:
> -
> -pcf85063: rtc@51 {
> -	compatible = "nxp,pcf85063";
> -	reg = <0x51>;
> -	quartz-load-femtofarads = <12500>;
> -
> -		clock {
> -			compatible = "fixed-clock";
> -			#clock-cells = <0>;
> -			clock-frequency = <32768>;
> -		};
> -};
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> new file mode 100644
> index 000000000000..f46c7e5378e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nxp,pcf85063.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP PCF85063 Real Time Clock
> +
> +maintainers:
> +  - Alexander Stein <alexander.stein@ew.tq-group.com>
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,pca85073a
> +      - nxp,pcf85063
> +      - nxp,pcf85063a
> +      - nxp,pcf85063tp
> +      - microcrystal,rv8263

How about ordering the entries alphabetically?

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 0

This is an unexpected change, not mentioned in commit msg.

> +
> +  clock-output-names:
> +    maxItems: 1

The same.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    const: irq

interrupt-names was not in original bindings and should not be needed.

> +
> +  quartz-load-femtofarads:
> +    description:
> +      The capacitive load of the quartz(x-tal),

Full stop.

> +      expressed in femto Farad (fF). 

Redundant.

> Valid values are 7000 and 12500.

Use enum.

> +      Default value (if no value is specified) is 7000fF.

Use default: 7000.


Best regards,
Krzysztof
