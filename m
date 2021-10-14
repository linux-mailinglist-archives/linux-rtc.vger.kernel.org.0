Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E61442D3DE
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Oct 2021 09:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhJNHkU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Oct 2021 03:40:20 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56042
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230081AbhJNHkT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 14 Oct 2021 03:40:19 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9C7EB3FFF0
        for <linux-rtc@vger.kernel.org>; Thu, 14 Oct 2021 07:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634197094;
        bh=B7HNXMgqTGY/qLh1YFQzQrY2kmlk2GDz9frXgPFGbwc=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=aZaaXCHdY0AktGt7qRLB8hGwXqXvdzUbBjrAIv+BkPNYxwkF5SJFXj2ObgRuwEHcc
         l5cntvKOJRLUay42pT7d+PFbcs6uJXOAQhANrcCn/KPEBu0S3bdBm8qgl1/YAbe6x8
         FnmBJy7DN39aThtBomjPiG5eV3+AKS7am59YL6bwFqYz0JG1geUEEPPhLZFIoA/aS4
         /EtWhQI8yY1/gTv42DbsUXADp2c+Z1dcuUn8IarxfRu7a27DjvJFrlTOTzmMEszMRc
         V+hKkLCEwOBwTWn5pkbmkR/DWH1RmRXT02YFCAG6dyP9NWEw4uE6FaLJIc9lTXjlb+
         DXs43Nphj/KSw==
Received: by mail-lf1-f71.google.com with SMTP id s8-20020ac25c48000000b003faf62e104eso3720336lfp.22
        for <linux-rtc@vger.kernel.org>; Thu, 14 Oct 2021 00:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B7HNXMgqTGY/qLh1YFQzQrY2kmlk2GDz9frXgPFGbwc=;
        b=KD4IDfeNCMehDu/2luPQ3SZXPiRck2RljcBxa/TOKaOJIGBTDLwWQzu27qJ1ZVybYD
         rceA8biWHdhVXVqspIrAHiGiRlox05j7bZipb165tzFyDGTdrcxFdeSnkKL3hy6X27tV
         Tfwavu+5/0mMhMrkzizC5w4uUZlAAlllb08LBtAZn0CykkAc74vPVoBG5V78kUryXd2N
         29sxoH7hnwhAboSRAM8w+S4CLQ+vUUZFJZ66kxgezvmtgXlnMYEJ4DKJesuC2YA3qiyU
         w8b78Q+2fObl5nVCS2Wj2iEfgd0RJDDBJhNFzh2Ba2th+jDCQwiMbT3oxpC5xLl1cH54
         eEnA==
X-Gm-Message-State: AOAM533++RxIMaYDJVoG4Ri0eTqavk/wVXkRpRGLwgI9gv48mrxRcz2l
        HVZHaTjp1dIXzwJ3VVDbuEZSex04PIRC0GDel0/WOZMhfKmz/EDwmZhoBTR0olhkHzm/j0oevzN
        1i3s9EccGfvJiaCuR59Rxw9s0Wg0CgF79jl4XKA==
X-Received: by 2002:a2e:a4a7:: with SMTP id g7mr4455574ljm.255.1634197094066;
        Thu, 14 Oct 2021 00:38:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzamjLEoWko/AdJDqX4dJUQRdA84fri++rZ+xFbSz7SaNFK/a9LfHbAy0kj4bgJe2Y6Mn3Axg==
X-Received: by 2002:a2e:a4a7:: with SMTP id g7mr4455553ljm.255.1634197093885;
        Thu, 14 Oct 2021 00:38:13 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s11sm153945lfd.262.2021.10.14.00.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 00:38:13 -0700 (PDT)
Subject: Re: [PATCH 5/8] dt-bindings: mfd: add Maxim MAX77714 PMIC
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-6-luca@lucaceresoli.net>
 <8ad40ebc-8430-9fa0-ae60-88e0d486e8cc@canonical.com>
 <4fc0fe37-1a25-4058-6326-a14e32ef18f5@lucaceresoli.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <88eeb15a-f5b5-0a6e-3d81-494a9c57c878@canonical.com>
Date:   Thu, 14 Oct 2021 09:38:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4fc0fe37-1a25-4058-6326-a14e32ef18f5@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 13/10/2021 23:28, Luca Ceresoli wrote:
> Hi Krzysztof,
> 
> thanks for reviewing.
> 
> On 12/10/21 10:02, Krzysztof Kozlowski wrote:
>> On 11/10/2021 17:56, Luca Ceresoli wrote:
>>> Add bindings for the MAX77714 PMIC with GPIO, RTC and watchdog.
>>>
>>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>> ---
>>>  .../bindings/mfd/maxim,max77714.yaml          | 58 +++++++++++++++++++
>>>  MAINTAINERS                                   |  5 ++
>>>  2 files changed, 63 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77714.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
>>> new file mode 100644
>>> index 000000000000..2b0ce3b9bc92
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
>>> @@ -0,0 +1,58 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/mfd/maxim,max77714.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MAX77714 PMIC with GPIO, RTC and watchdog from Maxim Integrated.
>>> +
>>> +maintainers:
>>> +  - Luca Ceresoli <luca@lucaceresoli.net>
>>> +
>>> +description: |
>>> +  MAX77714 is a Power Management IC with 4 buck regulators, 9
>>> +  low-dropout regulators, 8 GPIOs, RTC and watchdog.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: maxim,max77714
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  interrupt-controller: true
>>> +
>>> +  "#interrupt-cells":
>>> +    const: 2
>>> +    description:
>>> +      The first cell is the IRQ number, the second cell is the trigger type.
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - interrupt-controller
>>> +  - "#interrupt-cells"
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        pmic@1c {
>>> +            compatible = "maxim,max77714";
>>> +            reg = <0x1c>;
>>> +            interrupt-parent = <&gpio2>;
>>> +            interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
>>> +
>>> +            interrupt-controller;
>>> +            #interrupt-cells = <2>;
>>> +        };
>>> +    };
>>
>> Looks good to me, but what about regulators and other properties? Are
>> you planning to add them later?
> 
> No plan to add them, sorry.
> 
> I know, complete bindings are better than incomplete bindings. But in
> the foreseeable future I don't need to do anything on the regulators
> (even though it might happen at some point). And since their setting is
> possibly non trivial, I'm not going to study them to write a complete
> bindings document and then make no use of it.
> 
> Is it a problem for you?

It's OK.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
