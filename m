Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1966FDE37
	for <lists+linux-rtc@lfdr.de>; Wed, 10 May 2023 15:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236652AbjEJNF1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 May 2023 09:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236355AbjEJNF0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 May 2023 09:05:26 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 277BA19AF
        for <linux-rtc@vger.kernel.org>; Wed, 10 May 2023 06:05:25 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so68781885a12.0
        for <linux-rtc@vger.kernel.org>; Wed, 10 May 2023 06:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683723923; x=1686315923;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mnIrfY7wG9JswRS/eckq0Sy0CDZ00GQPgS+a22cO2Kc=;
        b=d+F1N7qWXvPcqkYu1VqKSRPBXLIttpJUO1PpHDjMHJEM/0oufUsDxCK0FiKtmk/d9/
         n0ZgovaQfkBdga9FQ8Uk4oPTTnO9fkH+UsL8N14M2Xl3IoneAS9OZdC/fCg1iTTAPGFH
         xsdxOOuPrameJTnYOhO70FpUVQ1myluUxTuczT3d9aCu1WZtmWRyy26eCeN1NUiy/oeB
         eEXFQTeC1ev2ScrjjnB4dOeI5ZgV8AyT2nYhSYNIm7TOTytfDRmD3VgHhOpROocHQK+V
         0ZDGrVn8lV8zNDxvEjKKXOXE9PDTgA+ZIPI0foqjFPlOOElZgLr2A+pv2p217fU7+ae+
         iS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683723923; x=1686315923;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mnIrfY7wG9JswRS/eckq0Sy0CDZ00GQPgS+a22cO2Kc=;
        b=Y04c8lGdV3YN+BFe0W/ZS5KlWbYqGUkITPgV+NtMgtbYBp/s+EPjSMriGxZNbJ2aRG
         zSG3qyfxixMX3H0TNwTsMH/QBeseTUEq4OFpLNEroRQC3fXzD2lCsXhEP7voFJiOStb8
         qT2aBLUUtJ1ZieC2xQn/qEaTINtSQwv0Io/d5GjF9GATaWd5NxJXVicqxziD+d68NGPi
         zEcMIDgzXkYdFa4U0v06Nsfm0V+E1b2GDYhNe68aX6Ii5KlkIcQyJAFCbt2n45cUN479
         KhJZbJVj8+s3E6uY9iheaFfmU+eOBWhv63oU43iwF63nhY6yvObJS25AmLOhOgvnOB/b
         n4PA==
X-Gm-Message-State: AC+VfDw0ajErS6HIa4iq3v3ZzBdIcOOr0fc8fGXsWoMLMOkZNBURO4U0
        d8IkThDRNpuimsQIOax/lTHr8w==
X-Google-Smtp-Source: ACHHUZ7NponsOFVSpv4N8O+zgoQDoXtPKWCC0YA8Jsddu624nKYu8fUkkleWuV8g4D0ISA5uhs+AyA==
X-Received: by 2002:a17:907:7208:b0:966:550f:9bfe with SMTP id dr8-20020a170907720800b00966550f9bfemr9859466ejc.33.1683723923471;
        Wed, 10 May 2023 06:05:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id jl2-20020a17090775c200b00965cbcaf31fsm2657505ejc.99.2023.05.10.06.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 06:05:22 -0700 (PDT)
Message-ID: <7e275742-7114-25e1-b45b-ade547487fc0@linaro.org>
Date:   Wed, 10 May 2023 15:05:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4] dt-bindings: rtc: isl1208: Convert to json-schema
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Trent Piepho <tpiepho@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20230509131249.80456-1-biju.das.jz@bp.renesas.com>
 <CA+7tXig2nwCk3DKwFEKGKVko=YD4e4KCpRVUMMM2pgPRpNgiiQ@mail.gmail.com>
 <CAMuHMdUOdJrPdcx684zKaSNFMqkRWL_y3jdAor_D0AeDRpRhJQ@mail.gmail.com>
 <0620e3ef-ece5-550a-43bb-0d6e75de79bf@linaro.org>
 <OS0PR01MB59223DA1A4360CC0E97AC2A486779@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB59223DA1A4360CC0E97AC2A486779@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/05/2023 13:37, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Wednesday, May 10, 2023 7:58 AM
>> To: Geert Uytterhoeven <geert@linux-m68k.org>; Trent Piepho
>> <tpiepho@gmail.com>
>> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Alessandro Zummo
>> <a.zummo@towertech.it>; Alexandre Belloni <alexandre.belloni@bootlin.com>;
>> Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; linux-rtc@vger.kernel.org;
>> devicetree@vger.kernel.org; Geert Uytterhoeven <geert+renesas@glider.be>;
>> Fabrizio Castro <fabrizio.castro.jz@renesas.com>; linux-renesas-
>> soc@vger.kernel.org
>> Subject: Re: [PATCH v4] dt-bindings: rtc: isl1208: Convert to json-schema
>>
>> On 10/05/2023 08:52, Geert Uytterhoeven wrote:
>>> Hi Trent,
>>>
>>> On Tue, May 9, 2023 at 9:03 PM Trent Piepho <tpiepho@gmail.com> wrote:
>>>> On Tue, May 9, 2023 at 6:12 AM Biju Das <biju.das.jz@bp.renesas.com>
>> wrote:
>>>>> +
>>>>> +  interrupt-names:
>>>>
>>>> Shouldn't this have minItems: 1 and maxItems: 2 as well?
>>>
>>>>> +    then:
>>>>> +      properties:
>>>>> +        interrupts:
>>>>> +          maxItems: 2
>>>>> +    else:
>>>>> +      properties:
>>>>> +        interrupts:
>>>>> +          maxItems: 1
>>>>
>>>> Add interrupt-names here too.
>>>
>>> Isn't the relation interrupts <=> interrupt-names enforced by the
>>> tooling?
>>
>> No, every constrain or schema code for one should be duplicated for second.
>> These can be done however in different ways, e.g.
>> interrupts:
>>   minItems: 1
>>   maxitems: 2
>> interrupt-names:
>>   minItems: 1
>>   items:
>>     - foo
>>     - bar
>>
>> but the outcome - so how many items are expected - must be the same in every
>> branch/condition.
> 
> But this will result in duplication of items in 2 places right?
> 
> One like the above and other one in conditional branch.


No. Constraints must be the same, so for example minItems.

Best regards,
Krzysztof

