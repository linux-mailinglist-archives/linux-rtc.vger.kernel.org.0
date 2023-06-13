Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF5372EE18
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jun 2023 23:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbjFMVhZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Jun 2023 17:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231499AbjFMVhY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Jun 2023 17:37:24 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7643D1BF4
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jun 2023 14:37:19 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-970028cfb6cso4898066b.1
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jun 2023 14:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686692238; x=1689284238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oip7SqC/cNKZpwuyshsaw2zREje6DYUcsApGrxnqSjc=;
        b=i1xbrWeSBBDDeChk2v1jFQ8oNrFfLHyhMK5pCcLQkja3OqbHo2bJ/wFHW7uutFX9XZ
         i6B51pldX5oeo7lYYaDlHiTKsm3/u5OCvL6YNOnA4lmfBx8a7VyTS7N9SzxKcGs57wnC
         8mxdIiwnNcJ2FlyXtMEyA/0/wBdPgaVhyqfO45QxRPAoBTT+nQbHDzy9uF69dhqIcI2W
         YetKdFtdwJTU5y2CCz1KyLhQgYgzrxUF9Vky5XdyrtXP992Uz8lCG4PAr11dJpPmNO6b
         Re0941tRW3KeLKZgV89XErY04JlNHWHSMzNtAWQ7qXUP/V8UU59V4mLSIl8GHpkHDOxN
         yVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686692238; x=1689284238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oip7SqC/cNKZpwuyshsaw2zREje6DYUcsApGrxnqSjc=;
        b=bLapKGXpB20rtOfWDv6ckSu0SmnJzggnFh4qVFfjweUEGJrzkg2c3AVLK7RIr+lNm7
         xWm/VDNPkcmRhZUQy5ZsarDEyzbdCBTheE1pNBwBtLoODKa8L7IZ6SM+7iCvup+Dzpp0
         uBShLN79VI7L4DxNzqbngEzSvuMyVQ9YqRtfif/kguofDQ+s/g63uBzefr1M5Ogjychh
         r9SwH+5LVANdGaLmlFMtsFp+UbWkY/L0Fb+Wal3bjzpVodN/gIZFKjXzhu2XgzKhOEGa
         Xx5YvDEXJmx/BVztoX4bM6ND2CJSes7pwFO5XTNtLKGgeKaQAyV1MTOlseCxEa6m2F9v
         owhg==
X-Gm-Message-State: AC+VfDzzCrBMJYW0E3r13pyR283i83PvU6s0LlSGT/15fujcXD9QM4zy
        1J++LgJQLsMnagLNw0PjPRrBBg==
X-Google-Smtp-Source: ACHHUZ6a2hnnxxgRqbHde0/z6M1zAJKLjWqTWlBx8ZNIxyQ4NWlh0GA2OLSUJCuN3o03XaigIgk1JA==
X-Received: by 2002:a17:906:ef03:b0:977:d676:d3ca with SMTP id f3-20020a170906ef0300b00977d676d3camr16308640ejs.33.1686692237898;
        Tue, 13 Jun 2023 14:37:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id gu4-20020a170906f28400b0096fbc516a93sm7107806ejb.211.2023.06.13.14.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 14:37:17 -0700 (PDT)
Message-ID: <605616cd-d0f9-a430-7cf2-b2f36d07ffe3@linaro.org>
Date:   Tue, 13 Jun 2023 23:37:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/8] dt-bindings: rtc: isl12022: add bindings for
 battery alarm trip levels
Content-Language: en-US
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230612113059.247275-1-linux@rasmusvillemoes.dk>
 <20230613130011.305589-1-linux@rasmusvillemoes.dk>
 <20230613130011.305589-4-linux@rasmusvillemoes.dk>
 <0600a505-d1bf-f4be-57ef-51d34c77501e@linaro.org>
 <dd15aaeb-04ff-126b-b524-44e30c60426b@rasmusvillemoes.dk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <dd15aaeb-04ff-126b-b524-44e30c60426b@rasmusvillemoes.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 13/06/2023 21:51, Rasmus Villemoes wrote:
>>> diff --git a/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml b/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml
>>> index 7c1e638d657a..d5d3a687a34d 100644
>>> --- a/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml
>>> +++ b/Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml
>>> @@ -22,6 +22,18 @@ properties:
>>>    interrupts:
>>>      maxItems: 1
>>>  
>>> +  isil,trip-level85-microvolt:
>>
>> Why encoding level85 in the property name? Your commit msg (datasheet)
>> suggests this is quite flexible, so why it cannot be just list of two
>> trip levels - for first and second interrupt?
> 
> Yeah, so I did consider just making it a two-element array
> isil,trip-levels-microvolt. But then I didn't know how to express the
> enum constraint, i.e. that the first must be one of the 2125000, ...,
> 4675000 values and the second one of the 1875000, ..., 4125000 ones. Is
> that possible, without providing a list of 49 possible pairs? Or is it
> sufficient to just write this out in prose?

items:
  - enum: [ a, b, c ]
  - enum: [ f, d, e ]


Best regards,
Krzysztof

