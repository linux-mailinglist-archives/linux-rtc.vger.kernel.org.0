Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB166351B7
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Nov 2022 08:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236417AbiKWH7W (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Nov 2022 02:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236260AbiKWH7A (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Nov 2022 02:59:00 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61901C6572
        for <linux-rtc@vger.kernel.org>; Tue, 22 Nov 2022 23:58:37 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bp15so26966911lfb.13
        for <linux-rtc@vger.kernel.org>; Tue, 22 Nov 2022 23:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eIg6Rv/LOFpgj+DKWMManbiu0MfbC5FGq/xuxr/n0/w=;
        b=O/38mHTk0CPM9pVVyRJOWrliNAFqF+1lUR9wj+BJJ1xjTUPpFWP1swpYrwoKOYsG6+
         Wfno/8Y3RM2L3GU+fe0tExQzuXxi8ipqkzqI0iQD9nWP6U1VGXFOcOJ/UOHKPiidllZy
         DcXABk/ZIwhEQa9nyEy6G8U9Nh9svKgwgzpUYO+jRw9R89uM8QgNKSQdVcUfRg8cKpDR
         gIcHpd0XsFyAegMNut9QdiLn63gxpiE35ob4bBrcJGsO2pVYcJmqgygVoH0KxDLZoHlA
         T0Yqr1ladsKpyLswJzbtX+2NSnYtVZqJTzbUf9dk7jtvKz4dfAdG6hSvlFZFIBgV1J+Y
         tZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eIg6Rv/LOFpgj+DKWMManbiu0MfbC5FGq/xuxr/n0/w=;
        b=oUufS2X7LfRY5EP3ruGeP7+T1iKaCVvbP3QOkwakNF7YndHACYEkRyCYbOmUeJ6E8y
         f/+DNv/ZjAdelr8ngcvQiBfD8NL7ZeiM2FJzWLsJ50fDYNTTN1RRUYHReHjrzyX6T6Bf
         VfHiBGakN5197yxLzkyeLnCqKkX9lA0lKVyGg62aM6n57JxqqMAqo6dfNEBPGp7C+h1x
         oRFbK5v/M6AwFo9vBGGByCz4jAQlCi6nK7aEkTNBchKaggiPQ6XCO8UoQ3mkGAkeFdRK
         faTcPfnRh6oBva93s5NtCeJhTJFQ7XxnglhXJEQ75Ex/0QsARAJNdkiy3h9tmLwaY7CD
         s1jw==
X-Gm-Message-State: ANoB5pnQg748NtV2C3tXCAfq/F+DBw4mwImGOQe1byc2ANgtBtRfV41G
        6fzQlrrjM+rT1z1byl2mNb18xw==
X-Google-Smtp-Source: AA0mqf6zL4R+GgorjVgH9PoP2t6OY5S6qEA+2L8rRG2kN5zlZUkPGnPJ6ancNeSRmy+Dl5f5mxbA9Q==
X-Received: by 2002:a05:6512:3ba6:b0:4a2:2bd7:d4fd with SMTP id g38-20020a0565123ba600b004a22bd7d4fdmr3599654lfv.613.1669190315409;
        Tue, 22 Nov 2022 23:58:35 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y18-20020a05651c107200b0027741daec09sm1997549ljm.107.2022.11.22.23.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 23:58:34 -0800 (PST)
Message-ID: <8a67f8a5-0e79-45ed-3bad-0678d15910c5@linaro.org>
Date:   Wed, 23 Nov 2022 08:58:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
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
 <6bb1ee6d-ab8c-824c-4a7d-29769189e4b4@linaro.org>
 <AS8PR04MB86420CA249C3E1D800BB4404870C9@AS8PR04MB8642.eurprd04.prod.outlook.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AS8PR04MB86420CA249C3E1D800BB4404870C9@AS8PR04MB8642.eurprd04.prod.outlook.com>
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

On 23/11/2022 08:43, Jacky Bai wrote:
>> Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
>> bbnsm
>>
>> On 21/11/2022 11:26, Jacky Bai wrote:
>>>> Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for
>>>> nxp bbnsm
>>>>
>>>> On 21/11/2022 07:51, Jacky Bai wrote:
>>>>> Add binding for NXP BBNSM(Battery-Backed Non-Secure Module).
>>>>>
>>>>> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
>>>>> ---
>>>
>>> ...
>>>
>>>>> +
>>>>> +    properties:
>>>>> +      compatible:
>>>>> +        const: nxp,bbnsm-rtc
>>>>
>>>>
>>>> Missing ref to rtc.yaml.
>>>
>>> Ok will include in v2.
>>>>
>>>>> +
>>>>> +      regmap:
>>>>
>>>> Use vendor prefix, descriptive name and description. Where is the
>>>> type of 'regmap' defined?
>>>
>>> Type is missed. Will add a description and type define if necessary.
>>>
>>>>
>>>>> +        maxItems: 1
>>>>
>>>> I don't think this is correct. Rob explained the simple-mfd means
>>>> children
>>> do
>>>> not depend on anything from the parent, but taking a regmap from its
>>> parent
>>>> contradicts it.
>>>
>>> For this BBNSM module, basically, it provides two sperate & different
>>> function: RTC and ON/OFF button control. But no separate register
>>> offset range for each of these functions. For example, the interrupt
>>> enable control, Interrupt status and basic function control are mixed
>>> in the same registers'
>>> different bit.
>>>
>>> Any good suggestion on how to handle such case? ^_^
>>
>> The solution for more complex common parts, dedicated device driver (MFD
>> driver) with its own binding. However I understand why it would be overshoot
>> here.
>>
> 
> Is it ok to keep current implementation rather than reimplement a new dedicate MFD wrapper driver?

Yes

Best regards,
Krzysztof

