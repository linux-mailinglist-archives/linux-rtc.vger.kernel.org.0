Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69D976FC74A
	for <lists+linux-rtc@lfdr.de>; Tue,  9 May 2023 15:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235214AbjEINAC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 9 May 2023 09:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234811AbjEINAB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 9 May 2023 09:00:01 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B88E35A5
        for <linux-rtc@vger.kernel.org>; Tue,  9 May 2023 06:00:00 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50db7ec8188so1305463a12.2
        for <linux-rtc@vger.kernel.org>; Tue, 09 May 2023 06:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683637199; x=1686229199;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+9mGz2olZyp2vtJ/qJYAQmIIlfabvTCR0scDUZiAOU=;
        b=szpc91rQUSHtSFdVYHCp9IrJiVFYNxzJdu3PPOzBDFzd+8/EGzWzBMPgLbCwW1vWTD
         vGNmfDQgx97LfxfQpfwI5xkoEgUMTiZXSMeT9d5F2XfjSHb0RGbKMkesyVmEb331+atJ
         9P3NKFMTdZmuwnCWCPuGXgmeeACwzWYNIToCjstfxrzh60XzGLTe2bBmnL5Rlskou0dS
         nrxG/2d8RkW8GNWkBw3kkUuTCk2CQ15B9RD692OlsCDp7R69JUOj8rTDdRIxofxFhhMB
         UtK9kGzUJ5egTjvaIzk0heIAt2dLwfMZhIFhf80Qbq6AiwVZ1cdv2fIjrTSre/rUoyFc
         t3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683637199; x=1686229199;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+9mGz2olZyp2vtJ/qJYAQmIIlfabvTCR0scDUZiAOU=;
        b=Uk798i3nauGXQnebZpiAst/BGdhYns1GAH+AA+A3Dg2xkEsik0x33ftagspdABgfmm
         zNXG0Gbi7PRkTIldQY7f8DwmkSSpkIaTS1zaJWsrVu7Fk7zofCAkyeAmouSzoHX6Ow4J
         v2mPEfVKaFOnLkDQBMs9j2kGIfjZZR1ajdCuN7n9z6W3FSY6vfzTy7Zmzt66lbzwSHsv
         qr0suyiczfpHUqTOKph0yOi7ext5euwf8ghVdOxL9zitB2U5xQNbUUQ+DksBrw1OapwC
         M9MxmKV5zHGfRcQCn3STAo976WNjWHnH2zUvR/yS/HVMKmTj2nhkTo+17Dx9k5JAoqVx
         PfCQ==
X-Gm-Message-State: AC+VfDzItf+NQl/smsRXDZ9migRGyXhHjZ/f9BCxjoBZeUZDzeej5Tkm
        IKrnS2wgkWz9hkQzx2Dulou95g==
X-Google-Smtp-Source: ACHHUZ4SQOpesLYnHmb7Xa33pnHCKc6mVBqlA8+lVgIBhzI/j2qGHufmwenHfiKhnJrjkSG4mDyYmA==
X-Received: by 2002:aa7:d659:0:b0:508:14f2:399c with SMTP id v25-20020aa7d659000000b0050814f2399cmr12887901edr.10.1683637198938;
        Tue, 09 May 2023 05:59:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76? ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id l23-20020aa7c3d7000000b004f9e6495f94sm742609edr.50.2023.05.09.05.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 05:59:57 -0700 (PDT)
Message-ID: <78fff833-77a7-f85c-f5a1-8f956db4ff67@linaro.org>
Date:   Tue, 9 May 2023 14:59:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] dt-bindings: rtc: isl1208: Convert to json-schema
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Trent Piepho <tpiepho@gmail.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20230505091720.115675-1-biju.das.jz@bp.renesas.com>
 <a55c7ac8-1037-4509-a16e-83c7894b1a4d@linaro.org>
 <TYCPR01MB5933076BBF16DB7FE20F56C186769@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <TYCPR01MB5933CCFDDD9F1454BDE852E586769@TYCPR01MB5933.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYCPR01MB5933CCFDDD9F1454BDE852E586769@TYCPR01MB5933.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/05/2023 13:18, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
>> Subject: RE: [PATCH v3] dt-bindings: rtc: isl1208: Convert to json-schema
>>
>> Hi Krzysztof Kozlowski,
>>
>> Thanks for the feedback.
>>
>>> Subject: Re: [PATCH v3] dt-bindings: rtc: isl1208: Convert to
>>> json-schema
>>>
>>> On 05/05/2023 11:17, Biju Das wrote:
>>>> Convert the isl1208 RTC device tree binding documentation to json-
>> schema.
>>>>
>>>> Update the example to match reality.
>>>>
>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>
>>> Thank you for your patch. There is something to discuss/improve.
>>>
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>>> +---
>>>> +$id:
>>>> +
>>>> +title: Intersil ISL1209/19 I2C RTC/Alarm chip with event in
>>>> +
>>>> +maintainers:
>>>> +  - Trent Piepho <tpiepho@gmail.com>
>>>> +
>>>> +description: |
>>>
>>> Do not need '|' unless you need to preserve formatting.
>>
>> OK, will remove it.
> 
> I get an error after removing '|'. 
> 
> ./Documentation/devicetree/bindings/rtc/isil,isl1208.yaml:13:42: [error] missing starting space in comment (comments)
> ./Documentation/devicetree/bindings/rtc/isil,isl1208.yaml:14:3: [error] syntax error: expected <block end>, but found '<scalar>' (syntax)

Drop the # from the pin name.

Best regards,
Krzysztof

