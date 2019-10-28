Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7908CE6FD8
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Oct 2019 11:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732891AbfJ1Kqv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Oct 2019 06:46:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:41562 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730796AbfJ1Kqv (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 28 Oct 2019 06:46:51 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 2A7BBB1B0;
        Mon, 28 Oct 2019 10:46:49 +0000 (UTC)
Subject: Re: [PATCH v2 2/8] dt-bindings: rtc: realtek: Convert RTD119x to
 schema
To:     Rob Herring <robh@kernel.org>
Cc:     linux-realtek-soc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191020040817.16882-1-afaerber@suse.de>
 <20191020040817.16882-3-afaerber@suse.de> <20191025212015.GA29978@bogus>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <5491f3ed-93bf-1c4d-60f8-5d646c3bd2fb@suse.de>
Date:   Mon, 28 Oct 2019 11:46:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191025212015.GA29978@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Am 25.10.19 um 23:20 schrieb Rob Herring:
> On Sun, Oct 20, 2019 at 06:08:11AM +0200, Andreas Färber wrote:
>> Convert the RTD119x binding to a YAML schema.
>>
>> Signed-off-by: Andreas Färber <afaerber@suse.de>
>> ---
>>  v2: New
>>  
>>  .../devicetree/bindings/rtc/realtek,rtd119x.txt    | 16 ---------
>>  .../devicetree/bindings/rtc/realtek,rtd119x.yaml   | 38 ++++++++++++++++++++++
>>  2 files changed, 38 insertions(+), 16 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/rtc/realtek,rtd119x.txt
>>  create mode 100644 Documentation/devicetree/bindings/rtc/realtek,rtd119x.yaml
> 
> 
>> diff --git a/Documentation/devicetree/bindings/rtc/realtek,rtd119x.yaml b/Documentation/devicetree/bindings/rtc/realtek,rtd119x.yaml
>> new file mode 100644
>> index 000000000000..71b7396bd469
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/realtek,rtd119x.yaml

While renaming the file to .yaml I would like to also rename it to 1195.
It would need to be 1x9x to cover RTD1195 and e.g. RTD1296, and looking
forward the wildcard may need to be 1xxx to cover also RTD1619, which
quickly becomes unrecognizable.

>> @@ -0,0 +1,38 @@
>> +# SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
> 
> Missing ()

Fixed.

> 
> Though I'm not sure it matters other than consistency.
> 
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/rtc/realtek,rtd119x.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Realtek RTD129x Real-Time Clock
>> +
>> +allOf:
>> +  - $ref: "rtc.yaml#"
>> +
>> +maintainers:
>> +  - Andreas Färber <afaerber@suse.de>
>> +
>> +properties:
>> +  compatible:
>> +    const: realtek,rtd1295-rtc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: Specifies the clock gate
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +
>> +examples:
>> +  - |
>> +	rtc@9801b600 {
>> +		compatible = "realtek,rtd1295-clk";

This reveals a bug in the original binding example. Fixed to -rtc.

>> +		reg = <0x9801b600 0x100>;
>> +		clocks = <&clkc RTD1295_CLK_EN_MISC_RTC>;
> 
> You need the include file here or the example won't build (run 'make 
> dt_binding_check').

We can't. You acked the clk binding but the driver never got any review,
so it didn't get merged and cannot be depended on here.

I've changed it to an artificial 42 so that dt_binding_check passes.
I've also needed to fix the indentation to 4 spaces.

Regards,
Andreas

> 
>> +	};
>> +...
>> -- 
>> 2.16.4
>>


-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
