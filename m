Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC8E43FFD5
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Oct 2021 17:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhJ2PxK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 Oct 2021 11:53:10 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:40206 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229527AbhJ2PxI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 29 Oct 2021 11:53:08 -0400
Received: from [77.244.183.192] (port=63784 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mgU9N-006Jdk-Cn; Fri, 29 Oct 2021 17:50:37 +0200
Subject: Re: [PATCH v2 5/9] dt-bindings: mfd: add Maxim MAX77714 PMIC
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
References: <20211019145919.7327-1-luca@lucaceresoli.net>
 <20211019145919.7327-6-luca@lucaceresoli.net>
 <YXjEzMYd9iYbodxo@robh.at.kernel.org>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <3ab50bfd-982a-5d78-39ba-683b687ca78f@lucaceresoli.net>
Date:   Fri, 29 Oct 2021 17:50:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YXjEzMYd9iYbodxo@robh.at.kernel.org>
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

Hi Rob,

On 27/10/21 05:17, Rob Herring wrote:
> On Tue, Oct 19, 2021 at 04:59:15PM +0200, Luca Ceresoli wrote:
>> Add bindings for the MAX77714 PMIC with GPIO, RTC and watchdog.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>
>> ---
>>
>> Changes in v2: none
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
> 
> Where's the regulators nodes and binding?

As discussed for the v1 patches [0]:

No plan to add them, sorry.

I know, complete bindings are better than incomplete bindings. But in
the foreseeable future I don't need to do anything on the regulators
(even though it might happen at some point). And since their setting is
possibly non trivial, I'm not going to study them to write a complete
bindings document and then make no use of it.

Is it a problem for you?

[0]
https://lore.kernel.org/lkml/4fc0fe37-1a25-4058-6326-a14e32ef18f5@lucaceresoli.net/

-- 
Luca
