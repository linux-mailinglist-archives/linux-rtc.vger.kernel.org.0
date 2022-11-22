Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D46E633678
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Nov 2022 08:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232498AbiKVH7b (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 22 Nov 2022 02:59:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbiKVH7a (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 22 Nov 2022 02:59:30 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C361D0FE
        for <linux-rtc@vger.kernel.org>; Mon, 21 Nov 2022 23:59:28 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id be13so22415211lfb.4
        for <linux-rtc@vger.kernel.org>; Mon, 21 Nov 2022 23:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+rHE42IRQEpvlYwnxD7VJSLOCSycuUnbcPRlGiT0VKU=;
        b=LpaDHiyMjzQR8FLaKdwyzVpff27TYVCfaRKzwK0kUx3JMZmRxWEClaCfEnPyuwZ8Ez
         7+qoE9IH/LdVFqIv8jr7jfgO/Kw4YjAdg3xyZMrZzID0hcsER8U9YuK7Cxq0Hv3IPxqM
         yr9qr4okK75m/wpxI9ahqrP+Hs7YGVwZ4LF/Op/2VUbXwv3RsnATf7CmdBq8TTQ781q3
         YOZTmhSzoVzENPcxqr2IjwT2uulEPnwYAjXj5McwjPJBrnZWf7dY5E1VH+NGMDCjIfkK
         Y8LygON4f9I8qaf8k5rm0ciyyxQb5XFnUQBO95jU7DtC/oThJ72GmrucpalJamrgrLDn
         rQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+rHE42IRQEpvlYwnxD7VJSLOCSycuUnbcPRlGiT0VKU=;
        b=MgqrWqH4sNDe4MyPX981/KovFGwHaYXJJcKhcvEWowoX0ZGPwz+bGwWSRCPA7WHDc9
         CGmbozhL6fzckRMODBbR4/vIV8RPZpZwakOAeyxZtC3DEQ18tImfEwkB+D1MP07BaZVl
         wV6bs1jUqva0NwN3RxqW1YlQLejMrguQiDoszw9QSKXuqfaso+NyzdCc6QRgzsnBwpPE
         cGsEjkOywOvrLTwSBBt9oxOG/D/59AVIhSSMzDuXLeHEpGGBV7koqdNcBzKl0vEZi1tS
         WLB6XgV7YDg35ObLlsV+f4XM9UMC9E1DpzbEa21YneeoSm4zoIk5nRqEoDZESNOwkgTc
         9Qqw==
X-Gm-Message-State: ANoB5pkvLqT8z3U1wbcK6YGzOt/3uxv4TkLR0CjgJ1dIFonla5Lv7t1B
        bjbCbN7Gg8XOsV3LsC4PpSfk0Q==
X-Google-Smtp-Source: AA0mqf5576Smjd5iC86BrqdWj7qdQ3v5kGphmRORCZi8Fhqujqy/nP6bb0FfF7erLI3gpEizurjsEA==
X-Received: by 2002:a05:6512:708:b0:4a2:6d30:fef2 with SMTP id b8-20020a056512070800b004a26d30fef2mr1699692lfs.324.1669103967144;
        Mon, 21 Nov 2022 23:59:27 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id l7-20020a2e7007000000b0027776efa48csm1768076ljc.91.2022.11.21.23.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 23:59:26 -0800 (PST)
Message-ID: <6bb1ee6d-ab8c-824c-4a7d-29769189e4b4@linaro.org>
Date:   Tue, 22 Nov 2022 08:59:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Content-Language: en-US
To:     Jacky Bai <ping.bai@nxp.com>, "lee@kernel.org" <lee@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-2-ping.bai@nxp.com>
 <2aeb0590-4fd0-5bb4-5e68-0378953a94c3@linaro.org>
 <AS8PR04MB864223C12564CB68F5836908870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AS8PR04MB864223C12564CB68F5836908870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
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

On 21/11/2022 11:26, Jacky Bai wrote:
>> Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
>> bbnsm
>>
>> On 21/11/2022 07:51, Jacky Bai wrote:
>>> Add binding for NXP BBNSM(Battery-Backed Non-Secure Module).
>>>
>>> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
>>> ---
> 
> ...
> 
>>> +
>>> +    properties:
>>> +      compatible:
>>> +        const: nxp,bbnsm-rtc
>>
>>
>> Missing ref to rtc.yaml.
> 
> Ok will include in v2.
>>
>>> +
>>> +      regmap:
>>
>> Use vendor prefix, descriptive name and description. Where is the type of
>> 'regmap' defined?
> 
> Type is missed. Will add a description and type define if necessary.
> 
>>
>>> +        maxItems: 1
>>
>> I don't think this is correct. Rob explained the simple-mfd means children
> do
>> not depend on anything from the parent, but taking a regmap from its
> parent
>> contradicts it.
> 
> For this BBNSM module, basically, it provides two sperate & different
> function: RTC and ON/OFF button control. But
> no separate register offset range for each of these functions. For example,
> the interrupt enable control,
> Interrupt status and basic function control are mixed in the same registers'
> different bit.
> 
> Any good suggestion on how to handle such case? ^_^

The solution for more complex common parts, dedicated device driver (MFD
driver) with its own binding. However I understand why it would be
overshoot here.

> 
>>
>>> +
>>> +      interrupts:
>>> +        maxItems: 1
>>
>> You have same interrupt and same address space used by two devices.
>>
>> Both arguments (depending on parent regmap, sharing interrupt) suggests
>> that this is one device block, so describing it with simple-mfd is quite
>> unflexible.
>>
> 
> It is depends on how SoC integrates this BBNSM module. From the BBNSM side,
> it has separate IRQ lines for RTC function and ON/OFF function. Different
> IRQ lines
> can be used for RTC and ON/OFF button. But in current i.MX93 SoC, those
> interrupts
> are ORed together at SoC level. That's why same interrupt in the example.

It's fine then.

Best regards,
Krzysztof

