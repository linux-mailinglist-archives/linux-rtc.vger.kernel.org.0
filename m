Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85FC935707F
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Apr 2021 17:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353647AbhDGPhb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Apr 2021 11:37:31 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35640 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353625AbhDGPh3 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 7 Apr 2021 11:37:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617809839; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Ik0K/SjhCcXqnQOkZPmG01XP2qBcF5BIESklWfV0rZQ=;
 b=WgkgKJvAsFgIMy1MQw37vyJU0t1B5q1NQu/gVPU3nyGAO5NUWdWWkZtNnw0vYR2wDkFC1VFu
 SYIdPV/LEJTuTaFirX5vSktsb7xXl/bfQDn2MhMUyHe8yfcyyXW1x55B54YbAuA7xSXCR+FY
 bv2mc76L27qGIwV+XYA8ioFFhGE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJhNWYyNyIsICJsaW51eC1ydGNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 606dd19e8807bcde1d0a342f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Apr 2021 15:37:02
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0BA96C43461; Wed,  7 Apr 2021 15:37:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3FB63C433CA;
        Wed,  7 Apr 2021 15:37:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 07 Apr 2021 21:07:01 +0530
From:   skakit@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH 2/3] dt-bindings: mfd: Convert pm8xxx bindings to yaml
In-Reply-To: <YEpNV55KR2nlAXMP@builder.lan>
References: <1615447798-6959-1-git-send-email-skakit@codeaurora.org>
 <1615447798-6959-3-git-send-email-skakit@codeaurora.org>
 <YEpNV55KR2nlAXMP@builder.lan>
Message-ID: <86f8d5dbdb8d5d6627b9deece1978d07@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Bjorn,

On 2021-03-11 22:33, Bjorn Andersson wrote:
> On Thu 11 Mar 01:29 CST 2021, satya priya wrote:
> 
>> Convert pm8xxx rtc bindings from .txt to .yaml format.
>> 
> 
> Wonderful initiative, thank you!
> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>>  .../devicetree/bindings/mfd/qcom-pm8xxx.txt        |  99 
>> -------------------
>>  .../devicetree/bindings/mfd/qcom-pm8xxx.yaml       | 108 
>> +++++++++++++++++++++
>>  2 files changed, 108 insertions(+), 99 deletions(-)
>>  delete mode 100644 
>> Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
>>  create mode 100644 
>> Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt 
>> b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
>> deleted file mode 100644
>> index 9e5eba4..0000000
>> --- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
>> +++ /dev/null
>> @@ -1,99 +0,0 @@
>> -Qualcomm PM8xxx PMIC multi-function devices
>> -
>> -The PM8xxx family of Power Management ICs are used to provide 
>> regulated
>> -voltages and other various functionality to Qualcomm SoCs.
>> -
>> -= PROPERTIES
>> -
>> -- compatible:
>> -	Usage: required
>> -	Value type: <string>
>> -	Definition: must be one of:
>> -		    "qcom,pm8058"
>> -		    "qcom,pm8821"
>> -		    "qcom,pm8921"
>> -
>> -- #address-cells:
>> -	Usage: required
>> -	Value type: <u32>
>> -	Definition: must be 1
>> -
>> -- #size-cells:
>> -	Usage: required
>> -	Value type: <u32>
>> -	Definition: must be 0
>> -
>> -- interrupts:
>> -	Usage: required
>> -	Value type: <prop-encoded-array>
>> -	Definition: specifies the interrupt that indicates a subdevice
>> -		    has generated an interrupt (summary interrupt). The
>> -		    format of the specifier is defined by the binding document
>> -		    describing the node's interrupt parent.
>> -
>> -- #interrupt-cells:
>> -	Usage: required
>> -	Value type : <u32>
>> -	Definition: must be 2. Specifies the number of cells needed to 
>> encode
>> -		    an interrupt source. The 1st cell contains the interrupt
>> -		    number. The 2nd cell is the trigger type and level flags
>> -		    encoded as follows:
>> -
>> -			1 = low-to-high edge triggered
>> -			2 = high-to-low edge triggered
>> -			4 = active high level-sensitive
>> -			8 = active low level-sensitive
>> -
>> -- interrupt-controller:
>> -	Usage: required
>> -	Value type: <empty>
>> -	Definition: identifies this node as an interrupt controller
>> -
>> -= SUBCOMPONENTS
>> -
>> -The PMIC contains multiple independent functions, each described in a 
>> subnode.
>> -The below bindings specify the set of valid subnodes.
>> -
>> -== Real-Time Clock
>> -
>> -- compatible:
>> -	Usage: required
>> -	Value type: <string>
>> -	Definition: must be one of:
>> -		    "qcom,pm8058-rtc"
>> -		    "qcom,pm8921-rtc"
>> -		    "qcom,pm8941-rtc"
>> -		    "qcom,pm8018-rtc"
>> -
>> -- reg:
>> -	Usage: required
>> -	Value type: <prop-encoded-array>
>> -	Definition: single entry specifying the base address of the RTC 
>> registers
>> -
>> -- interrupts:
>> -	Usage: required
>> -	Value type: <prop-encoded-array>
>> -	Definition: single entry specifying the RTC's alarm interrupt
>> -
>> -- allow-set-time:
>> -	Usage: optional
>> -	Value type: <empty>
>> -	Definition: indicates that the setting of RTC time is allowed by
>> -		    the host CPU
>> -
>> -= EXAMPLE
>> -
>> -	pmicintc: pmic@0 {
>> -		compatible = "qcom,pm8921";
>> -		interrupts = <104 8>;
>> -		#interrupt-cells = <2>;
>> -		interrupt-controller;
>> -		#address-cells = <1>;
>> -		#size-cells = <0>;
>> -
>> -		rtc@11d {
>> -			compatible = "qcom,pm8921-rtc";
>> -			reg = <0x11d>;
>> -			interrupts = <0x27 0>;
>> -		};
>> -	};
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml 
>> b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>> new file mode 100644
>> index 0000000..b4892f1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>> @@ -0,0 +1,108 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/qcom-pm8xxx.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm PM8xxx PMIC multi-function devices
>> +
>> +maintainers:
>> +  - Lee Jones <lee.jones@linaro.org>
> 
> While Lee is maintainer of the mfd core, it would be better if this was
> someone looking out for the Qualcomm PMIC binding specifically.
> 
>> +
>> +description: |
>> +  The PM8xxx family of Power Management ICs are used to provide 
>> regulated
>> +  voltages and other various functionality to Qualcomm SoCs.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,pm8058
>> +      - qcom,pm8821
>> +      - qcom,pm8921
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#address-cells':
>> +     const: 1
>> +
>> +  '#size-cells':
>> +     const: 0
>> +
>> +  interrupts:
>> +    description: |
>> +      Specifies the interrupt that indicates a subdevice has 
>> generated an
>> +      interrupt (summary interrupt).
>> +
>> +  '#interrupt-cells':
>> +    description: |
>> +      Specifies the number of cells needed to encode an interrupt 
>> source.
>> +      The 1st cell contains the interrupt number. The 2nd cell is the
>> +      trigger type.
>> +    const: 2
>> +
>> +  interrupt-controller: true
>> +
>> +patternProperties:
>> +  "rtc@[0-9a-f]+$":
> 
> Can we somehow link this to individual binding docs instead of listing
> all the possible functions here?
> 

you mean we should split this into two:
qcom-pm8xxx.yaml and qcom-pm8xxx-rtc.yaml
Please correct me if wrong.

> Regards,
> Bjorn
> 
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - qcom,pm8058-rtc
>> +          - qcom,pm8921-rtc
>> +          - qcom,pm8941-rtc
>> +          - qcom,pm8018-rtc
>> +
>> +      reg:
>> +        description: Specifies the base address of the RTC registers
>> +
>> +      interrupts:
>> +        description: Specifies the RTC's alarm interrupts
>> +
>> +      allow-set-time:
>> +        $ref: /schemas/types.yaml#/definitions/flag
>> +        description:
>> +          Indicates that the setting of RTC time is allowed by the 
>> host CPU.
>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +      - interrupts
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - '#address-cells'
>> +  - '#size-cells'
>> +  - interrupts
>> +  - '#interrupt-cells'
>> +  - interrupt-controller
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/spmi/spmi.h>
>> +    spmi_bus: spmi@c440000 {
>> +      reg = <0x0c440000 0x1100>;
>> +      #address-cells = <2>;
>> +      #size-cells = <0>;
>> +      pmicintc: pmic@0 {
>> +        reg = <0x0 SPMI_USID>;
>> +        compatible = "qcom,pm8921";
>> +        interrupts = <104 8>;
>> +        #interrupt-cells = <2>;
>> +        interrupt-controller;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        pm8921_rtc: rtc@11d {
>> +          compatible = "qcom,pm8921-rtc";
>> +          reg = <0x11d>;
>> +          interrupts = <0x27 0>;
>> +        };
>> +      };
>> +    };
>> +...
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 
