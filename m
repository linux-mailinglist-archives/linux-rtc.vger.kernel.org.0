Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F001F35A243
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Apr 2021 17:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233599AbhDIPtf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Apr 2021 11:49:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233527AbhDIPtf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Apr 2021 11:49:35 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F65C061763
        for <linux-rtc@vger.kernel.org>; Fri,  9 Apr 2021 08:49:22 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id l12-20020a9d6a8c0000b0290238e0f9f0d8so6089437otq.8
        for <linux-rtc@vger.kernel.org>; Fri, 09 Apr 2021 08:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EqS4x/8nPde7h4Zp3FMi4ziuMpkogzvhsdKDcJrUmtY=;
        b=bZqdRC6HSjhMn/ei4MpP2ceGQc6M8X6Sp06NqZZxtxQ3Cf0kH7GHtoIuEx89ElC2bQ
         zuaFeh0Jv0GgewWU2c2w61GCdBjywtymeTqj+l8CcWzt+RIIH5AKttPIw+6LOU1ihw7v
         D9l1/Mo2jjKWZg0zdVkC87BCjxD6f3Qrr9QsK6S2PhabyjtKu+69tivwF3m948Q2lzEX
         4vcpRRgv7qE9SzSQaTUCyeN4VkhCHzKY1KIkodGdHwPP2dPXtXq4u/Mn314jGvJGIqvB
         VVlHPfDbvzFrOUAMyo07Mxr9k2m9Af/qR9/M25wuyi6tsCx+OlXfIGzlnLuNk8IhWjgW
         Llug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EqS4x/8nPde7h4Zp3FMi4ziuMpkogzvhsdKDcJrUmtY=;
        b=HU46JIaE9mFuQAVfh9V4Evb8qDaM634Jxs2VD5xuXDW/SJh/JAAeNcg5w7G+J4Sc8l
         /gMsU6caaJCXW3kgNyUycxhCQzLDjI9T374h16U9JAEqZ9yIVK5jWCzab/M2Rc6bMULO
         LaCm5LjjOtuHwEPNWBcF5UKyBOCee6IhbBP5dt/OzmSWthqqkfmB29H7BvGKBwij8xls
         gNpL1FzlbIrcN2kLW22redD+E+DK4PUjZcRCQgAYyNrW6UQvQgO8ebPydKeCnNmLYiUc
         BCVDpWHwh+kQltccjvDP2/YwNZ0lAUu3/GObys1BFwM8WWWTtlZkpzg27nTgnmWHbnVu
         aAlg==
X-Gm-Message-State: AOAM531ydAnrINAGTSXvNJFYd+jkCzXmABBSrYQxDPBYaO5Lmuy53Bp6
        HtZlvT1nBPrHAymCcOlpHbWNPwbJZFa5ww==
X-Google-Smtp-Source: ABdhPJxG2ny1GyN6RJALA65wkWapPDKT1+U/1TgktO5O3yu93NCyquEeEs+Cfdjtrr+WBUJ5NrgrIA==
X-Received: by 2002:a05:6830:802:: with SMTP id r2mr12260255ots.110.1617983361678;
        Fri, 09 Apr 2021 08:49:21 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 3sm668111otw.58.2021.04.09.08.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 08:49:21 -0700 (PDT)
Date:   Fri, 9 Apr 2021 10:49:19 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V2 3/4] dt-bindings: mfd: Convert pm8xxx bindings to yaml
Message-ID: <20210409154919.GV904837@yoga>
References: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
 <1617976766-7852-4-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617976766-7852-4-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri 09 Apr 08:59 CDT 2021, satya priya wrote:

> Convert pm8xxx bindings from .txt to .yaml format. Also,
> split this binding into two: parent binding(qcom-pm8xxx.yaml)
> and child node RTC binding(qcom-pm8xxx-rtc.yaml).
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - As per Bjorn's comments, I've split this into two, one parent binding
>    and one child node rtc binding.
>  - Fixed bot errors and changed maintainer name.
> 
>  .../devicetree/bindings/mfd/qcom-pm8xxx.txt        | 100 ---------------------
>  .../devicetree/bindings/mfd/qcom-pm8xxx.yaml       |  54 +++++++++++
>  2 files changed, 54 insertions(+), 100 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
> deleted file mode 100644
> index 07f4925..0000000
> --- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
> +++ /dev/null
> @@ -1,100 +0,0 @@
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
> -		    "qcom,pmk8350-rtc"
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
> index 0000000..9065ec5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/qcom-pm8xxx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PM8xxx PMIC multi-function devices
> +
> +maintainers:
> +  - Satya Priya <skakit@codeaurora.org>
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
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +patternProperties:
> +  "rtc@[0-9a-f]+$":
> +    type: object
> +    $ref: "../rtc/qcom-pm8xxx-rtc.yaml"

This doesn't exist, so patch 3 and 4 should come in opposite order...

Apart from tat I think this looks good.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

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
> +...
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
