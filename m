Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55CE16185F8
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Nov 2022 18:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbiKCROY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Nov 2022 13:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbiKCRNw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Nov 2022 13:13:52 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 897802AEA
        for <linux-rtc@vger.kernel.org>; Thu,  3 Nov 2022 10:13:35 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id x15so1584606qvp.1
        for <linux-rtc@vger.kernel.org>; Thu, 03 Nov 2022 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TVZsy7B7v5prpCTdyV3oODVBC5t2PSAPI9K9QHFn3vY=;
        b=D3uBEEtkFPGtAHHVH6JLASDP8Tc4T3q4AWswG/NdJEPrgftqzvGuzUO3KHVSEJLWvo
         E3ANsYZdA/EfxZbFv5HdjvRKq3mDoTZYDq1RFYudnv1j+LxpTr9uVZmZXQKzo5cpgXqI
         afGqtRFbBex6pvshYqARroui7XJwY921Lj3Lhp+ZGeFZb9O90wE+ZKPhrvODIWGHdDss
         oCMrebRyszrw7ZOQ4WlPpWF1CDQJyYVQ8BdaK7H1r2LrqUgPKm5D1tO4/8c1RNvT6DSA
         9i3BaC1KNdpDnaR082vJZBS4Ec46/W1UP6wIXK4iig5WMlBigrIVyIkO7Ek9RERpsvuT
         +cEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TVZsy7B7v5prpCTdyV3oODVBC5t2PSAPI9K9QHFn3vY=;
        b=kXTEeICxgO6XOps0++C1GZhmpNMpT4hD+Crcp+qHg3vYb46xva9r58WpRQivOyjY2E
         KmydABs0gJ8woWkKFYB/GxxQwGE7VJNUUcgZ7Tk6TPqMoPtOyfTXNT7vXGEq5BszQDMq
         5Up+7wDEHTktkC01K8DaF98Up0E9G6n7+fGqKYW+7eTYyEcXNBYRWaxhf2j7V260cmMi
         fo5s15Y8MC+961sgCbyXZkjL18qWmwcceDDS/Teqzk95X5YIzuXB6HxJAv/SWXlz53ZI
         HrlzNf4sdE/eDA1LWQGEx00ODxH38+QTjM0hnsSIjW4J/q2XaefDIyZWy30WXcIMSi8g
         VQNQ==
X-Gm-Message-State: ACrzQf1tz+jPMc4Z2FXCbrWeJ7FyHODEQzKpStQOZpiSBOf2CMbBxNSC
        YN8dbkg7c9gTJg1gbKR/o4f5yw==
X-Google-Smtp-Source: AMsMyM4TW3Y0yHfKPsOpETMEfMl0d0K7+0Ax02wgM6Lc8/athEpvPdzE0tcMn/X4TVdgLi+M54yQ+A==
X-Received: by 2002:a05:6214:411e:b0:4bb:f5bc:f807 with SMTP id kc30-20020a056214411e00b004bbf5bcf807mr21221625qvb.114.1667495614741;
        Thu, 03 Nov 2022 10:13:34 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb? ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id 22-20020ac84e96000000b003a50b9f099esm896034qtp.12.2022.11.03.10.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 10:13:34 -0700 (PDT)
Message-ID: <619870ec-f068-93d5-7bf0-b34b929d43a7@linaro.org>
Date:   Thu, 3 Nov 2022 13:13:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/2] dt-bindings: rtc: m41t80: Convert text schema to YAML
 one
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-rtc@vger.kernel.org
References: <20221102225943.157344-1-marex@denx.de>
 <abbccd73-7e49-b70b-d552-c1ff9426ea8c@linaro.org>
 <b0f752a3-84ac-f6ef-a251-7dd265015d8e@denx.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b0f752a3-84ac-f6ef-a251-7dd265015d8e@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 03/11/2022 12:48, Marek Vasut wrote:
> On 11/3/22 14:40, Krzysztof Kozlowski wrote:
> 
> [...]
> 
>>> diff --git a/Documentation/devicetree/bindings/rtc/rtc-m41t80.yaml b/Documentation/devicetree/bindings/rtc/rtc-m41t80.yaml
>>> new file mode 100644
>>> index 0000000000000..7f31a22caec9b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/rtc/rtc-m41t80.yaml
>>
>> Filename based on compatibles (more or less), so could be:
>> st,m41t80.yaml
>> or:
>> st,m41txx.yaml
>>
>> The "rtc" name can be skipped as it is implied from subsystem folder,
>> unless st,m41txx is a name of some SoC?
> 
> It's dedicated I2C RTC, a discrete soic8 chip with optional coin cell 
> battery.
> 
> We cannot really call it m41txx because there are other m41txx chips 
> with different register layouts and thus different RTC drivers:
> 
> next$ ls -1 drivers/rtc/*m41t*
> drivers/rtc/rtc-m41t80.c
> drivers/rtc/rtc-m41t93.c
> drivers/rtc/rtc-m41t94.c
> 
> The m41t80 is a sane choice, the m41t80 was the first supported, the 
> other chips are just compatible to it.
> 
> Whether I should drop the rtc- prefix or not, I will defer that 
> preference to Alexandre .

so st,m41t80.yaml

Best regards,
Krzysztof

