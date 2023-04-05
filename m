Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECC896D7449
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Apr 2023 08:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237024AbjDEGQJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 5 Apr 2023 02:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236670AbjDEGQJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 5 Apr 2023 02:16:09 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D9530C4
        for <linux-rtc@vger.kernel.org>; Tue,  4 Apr 2023 23:16:06 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id r11so138440266edd.5
        for <linux-rtc@vger.kernel.org>; Tue, 04 Apr 2023 23:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680675365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SB6X/HPTBevD11u4QesH1uUiIVJAKhGlwM+UoQhXDmQ=;
        b=qJhxInXHBw/oSbV9tNmfcQFbtnUx6E7N2r9k3ZFHgcpcgdbTB/BheZcrVZk2ompKf6
         QZvCAW+W7dLo/vGw09DONctdVUzN5Y6zpsklyAvSWyMTGkzCvNtXkm+LBctimMZP3ebj
         41EW9FJvirGU86VygdOFV42YVmrch4kbTp6z8JBsh/Zg5Q3rwHrPnQ9TufpF5CJhUWvb
         +GQ92fsVA4uwK6V92UHDLVKb5n8cWo5zlwlWZ/M2zccjH+6IDfpL+IEKg57BeYpmRScp
         BImKfkvu/EQKNwltoGoKP1AgIF032xnerm0u2isVkdbwmq7TZlYenDjOIf6kL3dbZwGI
         qH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680675365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SB6X/HPTBevD11u4QesH1uUiIVJAKhGlwM+UoQhXDmQ=;
        b=x+p5C2gdI7yrCDGFRI+Dm9C1WZmkmdAR1k+rNP5+qQJkOdyZcqkeq3KqGuPE/UE0KU
         1v+O8NueAc43zluad6/t7SL4lzfbcX3zz9TgSR79tkwCnjCMe1lkZOi9NzbaNS2veXkg
         bbWqyEBAcrc151zb8VVZB6U2hm9iK+uFbLZpnbYfoSYuZwT59EhB8+DbHukvx2wPHTbg
         XD/iE0367BIpVrjHoDQ4YMbzKJvFZGsomSq6kowEauQvsoYkJQ2xhIoRf7zwmniRpu78
         64PUszF9/IPN7/0W/JWi1hhvWHNPRSu/eNtc/AM+9nNhmM78ZEvXburPn6n7FoC1XTed
         6h4g==
X-Gm-Message-State: AAQBX9cy3b9jc3tGwljkGKfVA1E+j6uQIPCaPfUg5TdkaNtub32Jj6YI
        DHyagVLIHda2LD9h5QK0SUqH5A==
X-Google-Smtp-Source: AKy350ZqXgpOtVx4SPo6LBhpRXn1qmcne+hCujVIv/eRRqCcdGlsUSwBk4dJbc9hzj2xOu33Zw/2UA==
X-Received: by 2002:a17:906:ef2:b0:93f:9ef3:945b with SMTP id x18-20020a1709060ef200b0093f9ef3945bmr1889689eji.17.1680675365315;
        Tue, 04 Apr 2023 23:16:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3f:6b2:54cd:498e? ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id l23-20020a170906079700b0093338259b2bsm6772861ejc.207.2023.04.04.23.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 23:16:04 -0700 (PDT)
Message-ID: <fe580065-9ad3-3d28-522d-3905a9e9e518@linaro.org>
Date:   Wed, 5 Apr 2023 08:16:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 2/2] dt-bindings: rtc: add max313xx RTCs
Content-Language: en-US
To:     "Tilki, Ibrahim" <Ibrahim.Tilki@analog.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>
Cc:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Arslanbenzer, Zeynep" <Zeynep.Arslanbenzer@analog.com>
References: <20230403154342.3108-1-Ibrahim.Tilki@analog.com>
 <20230403154342.3108-3-Ibrahim.Tilki@analog.com>
 <7d5c4407-3198-c39a-2c30-fbaeb5c53b08@linaro.org>
 <CY4PR03MB2488D9CED963C26DB7D9709B96939@CY4PR03MB2488.namprd03.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CY4PR03MB2488D9CED963C26DB7D9709B96939@CY4PR03MB2488.namprd03.prod.outlook.com>
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

On 04/04/2023 17:40, Tilki, Ibrahim wrote:
>>> +  interrupts:
>>> +    description: |
>>> +      Alarm1 interrupt line of the RTC. Some of the RTCs have two interrupt
>>> +      lines and alarm1 interrupt muxing depends on the clockin/clockout
>>> +      configuration.
>>> +    maxItems: 1
>>> +
>>> +  "#clock-cells":
>>> +    description: |
>>> +      RTC can be used as a clock source through its clock output pin when
>>> +      supplied.
>>
>> This part is correct, but your implementation is not. I don't think you
>> can disable or enable interrupts, based on usage of clock. Either this
>> is clock (gated or not) or interrupt, not both.
>>
> 
> The driver doesn't enable or disable interrupts based on clock usage. It checks
> whether the IRQ is possible or not. Enablement of interrupt depends on the 
> "interrupts" property. The tricky part is that interrupt muxing depends on
> clock configuration.

I think it is not what your driver is doing. It checks if clock-cells...

> 
> Let me briefly explain the behavior of RTCs and the driver[v4]
> 
> MAX31328:
>   - Has a single pin which is either used as IRQ or clock output.
>   - Driver aborts probe with "-EOPNOTSUPP" when user requests irq and clockout
>     at the same time. In other words, when both "interrupts" and "#clock-cells"
>     properties are present. Otherwise, we are fine.

Why? These are fixed properties of the device. It is always a clock
controller and always has interrupt line. The choice between them is
depending on pins, so pin control.

> 
> MAX31331:
> MAX31334:
>   - Has two pins: INTA and INTB/CLOCKOUT. INTA pin is dedicated for interrupt.
>     INTB pin is used as either interrupt or clockout. The Alarm1 interrupt is
>     muxed into INTB by default. If the CLOCKOUT is enabled, Alarm1 irq is muxed
>     into INTA. We don't have further control over interrupt muxing.
>   - Driver checks for "#clock-cells". If it is present, it enables the clockout
>     so that we can get interrupt from INTA.
> 
> The Rest:
>   - Has two pins: INTA/CLKIN and INTB/CLOCKOUT. Alarm1 interrupt is muxed into
>     INTA by default, muxed into INTB if and only if we enable CLKIN.
>   - Driver aborts probe with -EOPNOTSUPP when user requests interrupt, clockin
>     and clockout at the same time. We can't have all three with two pins.
> 	
> 
> Unfortunately we don't have control over the interrupt muxing other than clock
> configuration. How should the driver approach this?

Pinmux with two states - interrupt or clock.

Best regards,
Krzysztof

