Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 328B86F670B
	for <lists+linux-rtc@lfdr.de>; Thu,  4 May 2023 10:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjEDIO1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 4 May 2023 04:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbjEDIMz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 4 May 2023 04:12:55 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB1340F0
        for <linux-rtc@vger.kernel.org>; Thu,  4 May 2023 01:10:34 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-50bc1612940so248955a12.2
        for <linux-rtc@vger.kernel.org>; Thu, 04 May 2023 01:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683187833; x=1685779833;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5wRI/V0QYUmMTdZtjU5QAUWi8YTe7VYR3YoE2fbr0uY=;
        b=F7JbaNf9rfAEFgyXNHxd07Nto4BeqGXHS3SMc1b3XtN3NsGlRH+sAVNfhCIQZe009O
         /8v6DZtRpVOTI5w7AGTHpEe7n32li8nbtYOVQfDcBQwcRZbecU3i9scjYa+yNlwu1iS8
         Fh0al9PHCU80mgW22f33y1HJgbjGYQJPgd5CTtJdDIDwqMLsgPCn35ifl/ilD42Bq4OH
         KKNYYmq1tiactNu+zmZ32MhRKaLmBrxgZHyFGCpQB9DKgfan4E95ZzD3JV2gqaAYgAPg
         oJFpPJWLsCzVlZChRUHgqeTQ1QgpOeB2cE1EZuib/jD+CZkUOV4sRpfkkR6SZWegljMB
         Dqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683187833; x=1685779833;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wRI/V0QYUmMTdZtjU5QAUWi8YTe7VYR3YoE2fbr0uY=;
        b=WY6IL9Bf3IxknMqtUC7pEkTVp63OidgSBg0g9rU04XhwvtBUm5uJZK6vfjTQzbKNkY
         k2pfdsdL547pYbzvxhZaWB7ShNxvG2IuMSj/uCPm1xFFeuyUUBaneI9HYKvARCm2Eusg
         XcEW1ABP4+gKZ4uqY+ZFCs2JUaGo2XwxLfmnSjFAvNpjr35bt+bwxvIN3KZtYSqEFh7B
         /DPpNqnlOmqgIb/KE/hFRo3unwG35HcYnWhRpEouqW2cYAHOuM+NpeBDrfNSPXAGIWrH
         PNxCe4x6Pw0a8IYg3c4EmnHGiOci8WMH8B+ji7dF6nzyJaFK2u44qu6dlAaxvk7FFcVs
         4x1Q==
X-Gm-Message-State: AC+VfDzwEgm3bvfKjwU+Kr60HoWik0vfFWMsLJkC1P+eI5La33QXr0iq
        mXJdxvuNwn7vfzxrvFMZKNa3DQ==
X-Google-Smtp-Source: ACHHUZ7o1xz1G094JLRpXVK8atuEDiJxNMnfsG3ePzcSVoQ7q8+HOTLwQN7AQK23FwfRuup1yiivcw==
X-Received: by 2002:a05:6402:391:b0:506:7d65:c1fb with SMTP id o17-20020a056402039100b005067d65c1fbmr811720edv.30.1683187832940;
        Thu, 04 May 2023 01:10:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id b15-20020aa7cd0f000000b005067d6b06efsm1556607edw.17.2023.05.04.01.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 01:10:32 -0700 (PDT)
Message-ID: <47f5498d-2c7c-7e27-c93d-a2787e720b42@linaro.org>
Date:   Thu, 4 May 2023 10:10:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH RFC 4/6] dt-bindings: rtc: isl1208: Document built-in RTC
 device on PMIC RAA215300
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Trent Piepho <tpiepho@impinj.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-5-biju.das.jz@bp.renesas.com>
 <db7ae5f9-393a-b892-dd6f-08c4f25ce7a8@linaro.org>
 <CAMuHMdVMsdvwq3t50ifKuCJ6LvPUcDjSu14tkdrSquizA=TsTw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdVMsdvwq3t50ifKuCJ6LvPUcDjSu14tkdrSquizA=TsTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/05/2023 09:47, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Thu, May 4, 2023 at 9:11 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 03/05/2023 10:46, Biju Das wrote:
>>> The Built-in RTC device found on PMIC RAA215300 is similar to the isl1208
>>> IP. However, RTC is enabled by PMIC RAA215300 and the polarity of the
>>> external oscillator is determined by the PMIC revision.
>>>
>>> Document renesas,raa215300-isl1208 compatible and renesas,raa215300-pmic
>>> property to handle these differences.
>>>
>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>> ---
>>>  .../devicetree/bindings/rtc/isil,isl1208.yaml       | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
>>> index 04d51887855f..888a832ed1db 100644
>>> --- a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
>>> +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
>>> @@ -18,6 +18,7 @@ properties:
>>>            - isil,isl1209
>>>            - isil,isl1218
>>>            - isil,isl1219
>>> +          - renesas,raa215300-isl1208
>>>
>>>    reg:
>>>      maxItems: 1
>>> @@ -40,6 +41,10 @@ properties:
>>>          <0> : Enable internal pull-up
>>>          <1> : Disable internal pull-up
>>>
>>> +  renesas,raa215300-pmic:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: phandle to the pmic device with isl1208 built-in RTC.
>>
>> No. You don't need cross-linking. We do not represent one device as two
>> and then fix this by cross-linking them. The existing binding does not
>> have it, so it should be a hint for you.
> 
> Makes sense.
> So there should be a single device node with 2 reg cells, and
> a "renesas,raa215300" compatible value.

Yes.

> 
> On the Linux side, the "renesas,raa215300" MFD driver can instantiate
> a PMIC and an RTC cell, the latter served by the (enhanced) existing
> rtc-isl1208 driver.

Right.

Best regards,
Krzysztof

