Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A5F42CCCE
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Oct 2021 23:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbhJMVai (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Oct 2021 17:30:38 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:46203 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229706AbhJMVai (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Oct 2021 17:30:38 -0400
Received: from [77.244.183.192] (port=64956 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1malnc-0028zC-EO; Wed, 13 Oct 2021 23:28:32 +0200
Subject: Re: [PATCH 5/8] dt-bindings: mfd: add Maxim MAX77714 PMIC
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org
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
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <4fc0fe37-1a25-4058-6326-a14e32ef18f5@lucaceresoli.net>
Date:   Wed, 13 Oct 2021 23:28:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8ad40ebc-8430-9fa0-ae60-88e0d486e8cc@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Krzysztof,

thanks for reviewing.

On 12/10/21 10:02, Krzysztof Kozlowski wrote:
> On 11/10/2021 17:56, Luca Ceresoli wrote:
>> Add bindings for the MAX77714 PMIC with GPIO, RTC and watchdog.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> ---
>>  .../bindings/mfd/maxim,max77714.yaml          | 58 +++++++++++++++++++
>>  MAINTAINERS                                   |  5 ++
>>  2 files changed, 63 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77714.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
>> new file mode 100644
>> index 000000000000..2b0ce3b9bc92
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/maxim,max77714.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MAX77714 PMIC with GPIO, RTC and watchdog from Maxim Integrated.
>> +
>> +maintainers:
>> +  - Luca Ceresoli <luca@lucaceresoli.net>
>> +
>> +description: |
>> +  MAX77714 is a Power Management IC with 4 buck regulators, 9
>> +  low-dropout regulators, 8 GPIOs, RTC and watchdog.
>> +
>> +properties:
>> +  compatible:
>> +    const: maxim,max77714
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  "#interrupt-cells":
>> +    const: 2
>> +    description:
>> +      The first cell is the IRQ number, the second cell is the trigger type.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-controller
>> +  - "#interrupt-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        pmic@1c {
>> +            compatible = "maxim,max77714";
>> +            reg = <0x1c>;
>> +            interrupt-parent = <&gpio2>;
>> +            interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
>> +
>> +            interrupt-controller;
>> +            #interrupt-cells = <2>;
>> +        };
>> +    };
> 
> Looks good to me, but what about regulators and other properties? Are
> you planning to add them later?

No plan to add them, sorry.

I know, complete bindings are better than incomplete bindings. But in
the foreseeable future I don't need to do anything on the regulators
(even though it might happen at some point). And since their setting is
possibly non trivial, I'm not going to study them to write a complete
bindings document and then make no use of it.

Is it a problem for you?

-- 
Luca
