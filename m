Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADA816F7000
	for <lists+linux-rtc@lfdr.de>; Thu,  4 May 2023 18:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjEDQjs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 4 May 2023 12:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbjEDQjp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 4 May 2023 12:39:45 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB3930C3
        for <linux-rtc@vger.kernel.org>; Thu,  4 May 2023 09:39:43 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so18990178a12.1
        for <linux-rtc@vger.kernel.org>; Thu, 04 May 2023 09:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683218382; x=1685810382;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wu+BPT/PK5OWIhPXpwTFPmkJWhW9/h2dLggQxSAxIY8=;
        b=qS73PrUuuBzl7XLhrxV14w2kWNHRnU+9QCtMga4AlQheBNHQs64CRoOQdT3lmHeBtx
         zfknQJ9jay5gRwEDkZSb/KABVUNRvUZKZrX/0Bqrx2bRcqMgL1ZAGjTTKnGC5oQF566G
         vKiobJ1fY6K2GVcBuYsEjC16LV2kFlePRLzGE+Aph66Od5+pARB9HIBvblAfZ+09mgA8
         3eCHG+VTKXu6/4wcrhpnnE8GiG3XwJ4v9EAC7BiiDMtvnlNkgKa00TeZeReAFJSlG0bD
         puf0SwTtvnmpji/4D1LMPoLiHmsccJJu50fmZMq62PW9u5TMCt55yZHFuQNsrcZdDjsF
         S0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683218382; x=1685810382;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wu+BPT/PK5OWIhPXpwTFPmkJWhW9/h2dLggQxSAxIY8=;
        b=PhbQySdD4x0YMrkHVbQhdTpDS/S81O/XSpCqtMpqNGlpmQ+x37GBIk/dR7loezaaBl
         0gh2qfTIp/57YoCr1PTLmxVFAB5/mQ5H7GtHDShuvt4CaQ8bDVkmtiaL7s7t9rRgjL4M
         ecakgAZq9NkSinCJwK5pfkbEzZATV5yshDLcF+WMNhBlwalWUSETN9ImSYYZBQYuyGX3
         UICdq/41lQfR8MUffKwvbKaEHcR13dpn/kgABaq6W1hDjJie6/5o0CGpnV8RgtXj6hSG
         B0Wa85sH/POriTdr2Vsn/a2QdOd+VqI9dwUtXLBXVVO9ipAGninyb684C4egw8vz6ZOx
         ddyQ==
X-Gm-Message-State: AC+VfDz3efeaNK92AR1E4Z6Zr2bErE8L0Ruq3IrRAs1s9ulXCfJ4k1Z7
        wsOOhYS/KWRJflGB3RwZmYp5+w==
X-Google-Smtp-Source: ACHHUZ6fH1oVbazZOh4UI1/8ULjm/q4hoyN+tKILu9S7JHk9IEJZ3LcRHLUmrN/BCDMCGp218zm1MQ==
X-Received: by 2002:a17:907:7b99:b0:965:5046:f446 with SMTP id ne25-20020a1709077b9900b009655046f446mr5662347ejc.9.1683218382311;
        Thu, 04 May 2023 09:39:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bdb9:99c4:33a5:6114? ([2a02:810d:15c0:828:bdb9:99c4:33a5:6114])
        by smtp.gmail.com with ESMTPSA id sb21-20020a170906edd500b0094f4d2d81d9sm18936157ejb.94.2023.05.04.09.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 09:39:41 -0700 (PDT)
Message-ID: <306f000d-6eec-cf90-b494-f391ff3d387c@linaro.org>
Date:   Thu, 4 May 2023 18:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH RFC 3/6] dt-bindings: rtc: isl1208: Convert to json-schema
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Trent Piepho <tpiepho@gmail.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-4-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922D95278CE2D1C085661C0866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922DDA5F5F112DF8B7755E5866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922E58C3A0DDF0EFD4E854F866D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB5922E58C3A0DDF0EFD4E854F866D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/05/2023 18:22, Biju Das wrote:
> Hi Krzysztof Kozlowski and  Rob,
> 
>>>> <fabrizio.castro.jz@renesas.com>; linux-renesas-soc@vger.kernel.org
>>>> Subject: [PATCH RFC 3/6] dt-bindings: rtc: isl1208: Convert to
>>>> json-schema
>>>>
>>>> Convert the isl1208 RTC device tree binding documentation to json-
>> schema.
>>>>
>>>> Update the example to match reality.
>>>>
>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>> ---
>>>>  .../devicetree/bindings/rtc/isil,isl1208.txt  | 38 ----------
>>>> .../devicetree/bindings/rtc/isil,isl1208.yaml | 74
>>>> +++++++++++++++++++
>>>>  2 files changed, 74 insertions(+), 38 deletions(-)  delete mode
>>>> 100644 Documentation/devicetree/bindings/rtc/isil,isl1208.txt
>>>>  create mode 100644
>>>> Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
>>>> b/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
>>>> deleted file mode 100644
>>>> index 51f003006f04..000000000000
>>>> --- a/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
>>>> +++ /dev/null
>>>> @@ -1,38 +0,0 @@
>>>> -Intersil ISL1209/19 I2C RTC/Alarm chip with event in
>>>> -
>>>> -ISL12X9 have additional pins EVIN and #EVDET for tamper detection,
>>>> while the
>>>> -ISL1208 and ISL1218 do not.  They are all use the same driver with
>>>> the bindings -described here, with chip specific properties as noted.
>>>> -
>>>> -Required properties supported by the device:
>>>> - - "compatible": Should be one of the following:
>>>> -		- "isil,isl1208"
>>>> -		- "isil,isl1209"
>>>> -		- "isil,isl1218"
>>>> -		- "isil,isl1219"
>>>> - - "reg": I2C bus address of the device
>>>> -
>>>> -Optional properties:
>>>> - - "interrupt-names": list which may contains "irq" and "evdet"
>>>> -	evdet applies to isl1209 and isl1219 only
>>>> - - "interrupts": list of interrupts for "irq" and "evdet"
>>>> -	evdet applies to isl1209 and isl1219 only
>>>> - - "isil,ev-evienb": Enable or disable internal pull on EVIN pin
>>>> -	Applies to isl1209 and isl1219 only
>>>> -	Possible values are 0 and 1
>>>> -	Value 0 enables internal pull-up on evin pin, 1 disables it.
>>>> -	Default will leave the non-volatile configuration of the pullup
>>>> -	as is.
>>>> -
>>>> -Example isl1219 node with #IRQ pin connected to SoC gpio1 pin12 and
>>>> #EVDET pin -connected to SoC gpio2 pin 24 and internal pull-up
>>>> enabled in
>>> EVIN pin.
>>>> -
>>>> -	isl1219: rtc@68 {
>>>> -		compatible = "isil,isl1219";
>>>> -		reg = <0x68>;
>>>> -		interrupt-names = "irq", "evdet";
>>>> -		interrupts-extended = <&gpio1 12 IRQ_TYPE_EDGE_FALLING>,
>>>> -			<&gpio2 24 IRQ_TYPE_EDGE_FALLING>;
>>>> -		isil,ev-evienb = <1>;
>>>> -	};
>>>> -
>>>> diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
>>>> b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
>>>> new file mode 100644
>>>> index 000000000000..04d51887855f
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
>>>> @@ -0,0 +1,74 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>>> +---
>>>> +$id:
>>>> +
>>>> +title: Intersil ISL12{08,09,18,19} I2C RTC/Alarm chip
>>>> +
>>>> +maintainers:
>>>> +  - Biju Das <biju.das.jz@bp.renesas.com>
>>>> +  - Trent Piepho <tpiepho@impinj.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    oneOf:
>>>> +      - enum:
>>>> +          - isil,isl1208
>>>> +          - isil,isl1209
>>>> +          - isil,isl1218
>>>> +          - isil,isl1219
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    minItems: 1
>>>> +    maxItems: 2
>>>> +
>>>> +  interrupt-names:
>>>> +    items:
>>>> +      - const: irq
>>>> +      - const: evdet
>>>> +
>>>> +  isil,ev-evienb:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    enum: [ 0, 1 ]
>>>> +    default: 0
> 
> 
> What is your thoughts on this? we should keep default or we should remove?
> 
> As per HW data sheet[1], the reset value is 0,  
> [1] https://www.renesas.com/us/en/document/dst/isl1219-datasheet
> 
> But as per text version of bindings [2], Looks like default is not needed.

Missing value has different meaning in original binding, so default is
wrong here and you should explain that meaning in description.

Best regards,
Krzysztof

