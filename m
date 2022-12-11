Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD01649636
	for <lists+linux-rtc@lfdr.de>; Sun, 11 Dec 2022 21:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbiLKU02 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 11 Dec 2022 15:26:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbiLKU01 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 11 Dec 2022 15:26:27 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C04B4A4;
        Sun, 11 Dec 2022 12:26:25 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 094C38539B;
        Sun, 11 Dec 2022 21:26:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1670790383;
        bh=/FHCN17dUzIvvtB5DBIyCsgkmXDkzgU2Nf40//F0ZYA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=tjGn52H6AqH7ctmbaMvZWC2QCQj7aQesZC5kuaqpcHCdJhX2XkYowQwVoBhbTckk0
         Ds4txFmrQ1CWTAg38+L1EZ4Etq2PX/g3AnyDNUcJafblgjMwjGODBEH+maQjQu4YR+
         rYNPHefQ5qvYQY7T59XAN/pzbFf1bI6khg6AfyGCbHgsHRR00RW4XsoegJ9NpmUxbF
         nJMmfBWn+socvaAV/gYa3ZL/dyxHoUDFIsVJkrSc7QIZy+s+s2Gr8t7f6dpb2GQNJ9
         dBRECyVCyQ9RjNtbHc192BryxaK4q3i7UjTrLCMHHWt5xmNcAJ0AhHLbFO+2WvRDtV
         R4WqJL05umrZw==
Message-ID: <336cf0b4-d0a7-42b9-5116-ad792b2aceb6@denx.de>
Date:   Sun, 11 Dec 2022 21:26:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: m41t80: Convert text schema to
 YAML one
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-rtc@vger.kernel.org
References: <20221211030054.672717-1-marex@denx.de>
 <da4bc2f0-552b-5c8c-f8b2-97e84c5520d2@linaro.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <da4bc2f0-552b-5c8c-f8b2-97e84c5520d2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/11/22 21:21, Krzysztof Kozlowski wrote:
> On 11/12/2022 04:00, Marek Vasut wrote:
>> Convert the m41t80 text schema to YAML schema.
>>
>> Add "#clock-cells" requirement, which is required by clock-output-names.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alessandro Zummo <a.zummo@towertech.it>
>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> Cc: linux-rtc@vger.kernel.org
>> To: devicetree@vger.kernel.org
>> ---
>> V2: - Add maxItems:1 to clock-output-names
>>      - Skip wakeup-source property, comes from rtc.yaml
>>      - Mention the new clock-cells requirement coming from
>>        clock-output-names property.
>>      - Rename rtc-m41t80.txt to st,m41t80.yaml
>> ---
>>   .../devicetree/bindings/rtc/rtc-m41t80.txt    | 39 ----------
>>   .../devicetree/bindings/rtc/st,m41t80.yaml    | 73 +++++++++++++++++++
>>   2 files changed, 73 insertions(+), 39 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
>>   create mode 100644 Documentation/devicetree/bindings/rtc/st,m41t80.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
>> deleted file mode 100644
>> index cdd196b1e9bdb..0000000000000
>> --- a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -ST M41T80 family of RTC and compatible
>> -
>> -Required properties:
>> -- compatible: should be one of:
>> -	"st,m41t62",
>> -	"st,m41t65",
>> -	"st,m41t80",
>> -	"st,m41t81",
>> -	"st,m41t81s",
>> -	"st,m41t82",
>> -	"st,m41t83",
>> -	"st,m41t84",
>> -	"st,m41t85",
>> -	"st,m41t87",
>> -	"microcrystal,rv4162",
>> -- reg: I2C bus address of the device
>> -
>> -Optional properties:
>> -- interrupts: rtc alarm interrupt.
>> -- clock-output-names: From common clock binding to override the default output
>> -                      clock name
>> -- wakeup-source: Enables wake up of host system on alarm
>> -
>> -Optional child node:
>> -- clock: Provide this if the square wave pin is used as boot-enabled fixed clock.
>> -
>> -Example:
>> -	rtc@68 {
>> -		compatible = "st,m41t80";
>> -		reg = <0x68>;
>> -		interrupt-parent = <&UIC0>;
>> -		interrupts = <0x9 0x8>;
>> -
>> -		clock {
>> -			compatible = "fixed-clock";
>> -			#clock-cells = <0>;
>> -			clock-frequency = <32768>;
>> -		};
>> -	};
>> diff --git a/Documentation/devicetree/bindings/rtc/st,m41t80.yaml b/Documentation/devicetree/bindings/rtc/st,m41t80.yaml
>> new file mode 100644
>> index 0000000000000..9977c8954307e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/st,m41t80.yaml
>> @@ -0,0 +1,73 @@
>> +# SPDX-License-Identifier: GPL-2.0
> 
> I missed that one during previous review - why not dual license? I do
> not see here any text (hardware description) being copied. Is it because
> of DTS example?

Copy paste from -- likely --
Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml:# 
SPDX-License-Identifier: GPL-2.0

Would you prefer

(GPL-2.0-only OR BSD-2-Clause)

?
