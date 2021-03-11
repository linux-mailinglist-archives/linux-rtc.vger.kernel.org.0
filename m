Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78059337A52
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Mar 2021 18:04:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbhCKRDo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Mar 2021 12:03:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhCKRDW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 Mar 2021 12:03:22 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C73C061574
        for <linux-rtc@vger.kernel.org>; Thu, 11 Mar 2021 09:03:22 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id a17so2132952oto.5
        for <linux-rtc@vger.kernel.org>; Thu, 11 Mar 2021 09:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qGxyq/OsSt/o7LyIZAAEj40X+K46fz4kxPQNOyp5WN0=;
        b=YQAA+CBo8FPmMQf8eonpzUx3U0ffhI7sf9+4EKYIEcWGAoWN5gWnj/dxxrQkYddRo+
         Q6V4msqXj5whx+2oYD35rtmZGputUkihnjpjtXQAGl1n/QWxgOUyE6SX1161xMlryvhn
         oeglqfJ2hIQS4oxy943R68GmAw8vl1sUXuPRpcFESfA8FhNYwjPZd4HTyoS+2aABEdcx
         8taRYMfmZHCBZdv2SIqQmDOacpa2OBtPfRl+uhjE2wjTYE+4vdVLBAXt0CS5gOMzCWyd
         n8TIfT/ZkN1m+IRQYucfI7Ky0KJTq9RGAoKN4rMLVaC7MmtVpwW6ShVEtKcViivWxMGG
         lVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qGxyq/OsSt/o7LyIZAAEj40X+K46fz4kxPQNOyp5WN0=;
        b=kWBDC1A0OSr8rt2F6Zl4KgPfNIF+EcE9zs7SWtoiNQo3ZWr4ntB3pU0gJLwcZKQlhX
         rSslLsdBiSnoluf50f8R+I9vGimMAWs7w02OVrkLunFRKFbi0EIk7nn4ko2Y/9tBTdBq
         Uch2KZNCDA46i/WfZdo2Ppvc/JBTLrB4fpulhP1gkRyEZb5Y84HAXQ13ZI34t1GZmiaO
         St+Rc+rNZ6lXQKk79yUV36Dwj7jRcT7MGJsYKoI+EMoKcEdl+/k+MT/BmduWKpRguyzM
         UabrNQyOsxmOWdleQjycyNOE3Qsi4a8Yapdjm10m1n/VSBA44GonNZvaAFSSn2tqGXG7
         jLTQ==
X-Gm-Message-State: AOAM5314lGGBPtk/n4BRmmU8v/Alp5Hpmb6nODaYqPK107KaQXe7o7w5
        j3ENkZLV90NPlQNDysT5GwXjhPAeU66g8g==
X-Google-Smtp-Source: ABdhPJw+wQnQabYkrCKgIqFPKFTSR/Rk/TQLyy8utAEvbuPIE3KXqE8uEzXhXrkJap6Ivpf+6mll2g==
X-Received: by 2002:a9d:187:: with SMTP id e7mr7783538ote.175.1615482201711;
        Thu, 11 Mar 2021 09:03:21 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c9sm174985ooq.31.2021.03.11.09.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 09:03:21 -0800 (PST)
Date:   Thu, 11 Mar 2021 11:03:19 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH 2/3] dt-bindings: mfd: Convert pm8xxx bindings to yaml
Message-ID: <YEpNV55KR2nlAXMP@builder.lan>
References: <1615447798-6959-1-git-send-email-skakit@codeaurora.org>
 <1615447798-6959-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615447798-6959-3-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu 11 Mar 01:29 CST 2021, satya priya wrote:

> Convert pm8xxx rtc bindings from .txt to .yaml format.
> 

Wonderful initiative, thank you!

> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>  .../devicetree/bindings/mfd/qcom-pm8xxx.txt        |  99 -------------------
>  .../devicetree/bindings/mfd/qcom-pm8xxx.yaml       | 108 +++++++++++++++++++++
>  2 files changed, 108 insertions(+), 99 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
> deleted file mode 100644
> index 9e5eba4..0000000
> --- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -Qualcomm PM8xxx PMIC multi-function devices
> -
> -The PM8xxx family of Power Management ICs are used to provide regulated
> -voltages and other various functionality to Qualcomm SoCs.
> -
> -= PROPERTIES
> -
> -- compatible:
> -	Usage: required
> -	Value type: <string>
> -	Definition: must be one of:
> -		    "qcom,pm8058"
> -		    "qcom,pm8821"
> -		    "qcom,pm8921"
> -
> -- #address-cells:
> -	Usage: required
> -	Value type: <u32>
> -	Definition: must be 1
> -
> -- #size-cells:
> -	Usage: required
> -	Value type: <u32>
> -	Definition: must be 0
> -
> -- interrupts:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: specifies the interrupt that indicates a subdevice
> -		    has generated an interrupt (summary interrupt). The
> -		    format of the specifier is defined by the binding document
> -		    describing the node's interrupt parent.
> -
> -- #interrupt-cells:
> -	Usage: required
> -	Value type : <u32>
> -	Definition: must be 2. Specifies the number of cells needed to encode
> -		    an interrupt source. The 1st cell contains the interrupt
> -		    number. The 2nd cell is the trigger type and level flags
> -		    encoded as follows:
> -
> -			1 = low-to-high edge triggered
> -			2 = high-to-low edge triggered
> -			4 = active high level-sensitive
> -			8 = active low level-sensitive
> -
> -- interrupt-controller:
> -	Usage: required
> -	Value type: <empty>
> -	Definition: identifies this node as an interrupt controller
> -
> -= SUBCOMPONENTS
> -
> -The PMIC contains multiple independent functions, each described in a subnode.
> -The below bindings specify the set of valid subnodes.
> -
> -== Real-Time Clock
> -
> -- compatible:
> -	Usage: required
> -	Value type: <string>
> -	Definition: must be one of:
> -		    "qcom,pm8058-rtc"
> -		    "qcom,pm8921-rtc"
> -		    "qcom,pm8941-rtc"
> -		    "qcom,pm8018-rtc"
> -
> -- reg:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: single entry specifying the base address of the RTC registers
> -
> -- interrupts:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: single entry specifying the RTC's alarm interrupt
> -
> -- allow-set-time:
> -	Usage: optional
> -	Value type: <empty>
> -	Definition: indicates that the setting of RTC time is allowed by
> -		    the host CPU
> -
> -= EXAMPLE
> -
> -	pmicintc: pmic@0 {
> -		compatible = "qcom,pm8921";
> -		interrupts = <104 8>;
> -		#interrupt-cells = <2>;
> -		interrupt-controller;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		rtc@11d {
> -			compatible = "qcom,pm8921-rtc";
> -			reg = <0x11d>;
> -			interrupts = <0x27 0>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> new file mode 100644
> index 0000000..b4892f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/qcom-pm8xxx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PM8xxx PMIC multi-function devices
> +
> +maintainers:
> +  - Lee Jones <lee.jones@linaro.org>

While Lee is maintainer of the mfd core, it would be better if this was
someone looking out for the Qualcomm PMIC binding specifically.

> +
> +description: |
> +  The PM8xxx family of Power Management ICs are used to provide regulated
> +  voltages and other various functionality to Qualcomm SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,pm8058
> +      - qcom,pm8821
> +      - qcom,pm8921
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +     const: 1
> +
> +  '#size-cells':
> +     const: 0
> +
> +  interrupts:
> +    description: |
> +      Specifies the interrupt that indicates a subdevice has generated an
> +      interrupt (summary interrupt).
> +
> +  '#interrupt-cells':
> +    description: |
> +      Specifies the number of cells needed to encode an interrupt source.
> +      The 1st cell contains the interrupt number. The 2nd cell is the
> +      trigger type.
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +patternProperties:
> +  "rtc@[0-9a-f]+$":

Can we somehow link this to individual binding docs instead of listing
all the possible functions here?

Regards,
Bjorn

> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,pm8058-rtc
> +          - qcom,pm8921-rtc
> +          - qcom,pm8941-rtc
> +          - qcom,pm8018-rtc
> +
> +      reg:
> +        description: Specifies the base address of the RTC registers
> +
> +      interrupts:
> +        description: Specifies the RTC's alarm interrupts
> +
> +      allow-set-time:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Indicates that the setting of RTC time is allowed by the host CPU.
> +
> +    required:
> +      - compatible
> +      - reg
> +      - interrupts
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - '#address-cells'
> +  - '#size-cells'
> +  - interrupts
> +  - '#interrupt-cells'
> +  - interrupt-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +    spmi_bus: spmi@c440000 {
> +      reg = <0x0c440000 0x1100>;
> +      #address-cells = <2>;
> +      #size-cells = <0>;
> +      pmicintc: pmic@0 {
> +        reg = <0x0 SPMI_USID>;
> +        compatible = "qcom,pm8921";
> +        interrupts = <104 8>;
> +        #interrupt-cells = <2>;
> +        interrupt-controller;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pm8921_rtc: rtc@11d {
> +          compatible = "qcom,pm8921-rtc";
> +          reg = <0x11d>;
> +          interrupts = <0x27 0>;
> +        };
> +      };
> +    };
> +...
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
