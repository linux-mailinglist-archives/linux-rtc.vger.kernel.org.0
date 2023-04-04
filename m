Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 623CC6D595A
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Apr 2023 09:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233847AbjDDHWD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Apr 2023 03:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233832AbjDDHWC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Apr 2023 03:22:02 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F8F10CA
        for <linux-rtc@vger.kernel.org>; Tue,  4 Apr 2023 00:21:59 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id i5so126867614eda.0
        for <linux-rtc@vger.kernel.org>; Tue, 04 Apr 2023 00:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680592918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kkOGx3GMkgo2fuHiMkHQxVBiCwFud00/oKdxH1oDBEc=;
        b=O9f6zymkXyi78dz6MnZvNgpiLT6OqNN2IcSZBe55KTxR7DY4OBqLPSOdBntZ8GiKCg
         b29KHZyiQRIgV50y5qkEhVDQ84NXO+qjgdnpaCG8T50xT1bXUsmGW9wu+T95KiP7zmic
         xoK+fg9nnVCOeBL4/KWUTwALfGyr0voeLteEoQlDVnunpSHSbV1T3cwpYNAxIYP3FJCS
         5VbXSrHRMESzEo2/576L8sk7BN4J2HeGgu6MU6xLe+J9Nmb4fu7/dLdnxd2dm/SD/WC5
         c53piKeosyWxb3biPPlT+S1+XS2FOZTGHMFcfiO9NZ4t9ZSK6YTW9j17Iw1h4GNSjqgp
         yHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680592918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kkOGx3GMkgo2fuHiMkHQxVBiCwFud00/oKdxH1oDBEc=;
        b=ubwzVRDSBMpku80qvS42QlWFH5VToGuN0e/zNnWtPCt5DAISi8QgtbDIn66vofyEtl
         dGGJmRcguXuGje9+o4gPKl17jeEv93bSGaTfG5khvO8O4QZTWC4J4LSN1AZf6Dnz7aQr
         dM7cyGTE2gP4VT3tpD+LMhRDKC81Z8UnVXQpKLaHodrbxDXAho90Uyucg2UD55PNXsUx
         IIZP3glFZUjrw0XVzpVcaJD8yQCuPdd1nJ8AzQa/EWf+1W+S18KrCIiDUF7Y6rWPn56N
         ge4tWUitG3Y10bcffGKIQbMmqUK1OX7FHDtentn81wstI2KK7FEPjgTkHH24EgXoHzw6
         po5w==
X-Gm-Message-State: AAQBX9dy5qwkFMbpYl8kLT2qf5c8Hk9EZBn6/+eOb6pAG8auFrYubyL4
        YSEr0NRjrwl9+OnWZLI4hVbP8w==
X-Google-Smtp-Source: AKy350apWFIq0ibEzi1DfVtXMxjGQ4ZHptStYJF0jd8bhwTpI2kqfvkHB0M7oc++tJ58JctJxwy/wg==
X-Received: by 2002:aa7:c78a:0:b0:502:9d16:fcb2 with SMTP id n10-20020aa7c78a000000b005029d16fcb2mr1432594eds.22.1680592918017;
        Tue, 04 Apr 2023 00:21:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:233a:5c18:b527:381e? ([2a02:810d:15c0:828:233a:5c18:b527:381e])
        by smtp.gmail.com with ESMTPSA id cw23-20020a056402229700b005028e87068fsm4126624edb.73.2023.04.04.00.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 00:21:57 -0700 (PDT)
Message-ID: <996b49ab-5e2e-76bc-efb1-38c6384871f6@linaro.org>
Date:   Tue, 4 Apr 2023 09:21:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 2/2] dt-bindings: rtc: add max313xx RTCs
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>, a.zummo@towertech.it,
        jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org,
        Zeynep Arslanbenzer <Zeynep.Arslanbenzer@analog.com>
References: <20230403154342.3108-1-Ibrahim.Tilki@analog.com>
 <20230403154342.3108-3-Ibrahim.Tilki@analog.com>
 <dd6f0842-519f-1bc9-f7f5-459863dc3dcd@linaro.org>
 <202304040710049c9cc01a@mail.local>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <202304040710049c9cc01a@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/04/2023 09:10, Alexandre Belloni wrote:
>>
>>> +      RTC can be used as a clock source through its clock output pin when
>>> +      supplied.
>>> +    const: 0
>>> +
>>> +  clocks:
>>> +    description: |
>>
>> Do not need '|'.
>>
>>> +      RTC uses this clock for clock input when supplied. Clock has to provide
>>> +      one of these four frequencies: 1Hz, 50Hz, 60Hz or 32.768kHz.
>>> +    maxItems: 1
>>> +
>>> +  aux-voltage-chargeable:
>>> +    enum: [0, 1, 2]
>>> +    description: |
>>> +      Enables trickle charger.
>>> +      0: Charger is disabled (default)
>>> +      1: Charger is enabled
>>> +      2: Charger is enabled with a diode
>>
>> 2 is not an allowed value. I asked to drop this property. It is coming
>> from rtc.yaml. I also do not understand "with a diode". So otherwise it
>> is charging with, I don't know, FET?
> 
> No, what is not explained here (and maybe not unsterstood by the
> submitter) is that the RTC has an extra diode so, 

Value of 2 is still not allowed and if the patch was tested, it would be
clearly visible. Unfortunately patch was not tested...

> charging will always
> enable a diode, select a resistor and then have or not an extra diode.
> Figure2 of the MAX31329 datasheet is great.

So the diode is in the max313xx? Then why enabling it is a property of
DT? Either this should be inferred from compatible or is even a policy,
not a DT property. Just because device has a register for something, is
not an argument that "something" should be in DT.


Best regards,
Krzysztof

