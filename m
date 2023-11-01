Return-Path: <linux-rtc+bounces-170-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DB67DDBEE
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Nov 2023 05:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EF8C2819BF
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Nov 2023 04:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D19E15B3;
	Wed,  1 Nov 2023 04:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=carlosaurelio.net header.i=@carlosaurelio.net header.b="Gl27MAD2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FED87F
	for <linux-rtc@vger.kernel.org>; Wed,  1 Nov 2023 04:43:19 +0000 (UTC)
Received: from h7.fbrelay.privateemail.com (h7.fbrelay.privateemail.com [162.0.218.230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A037CF4
	for <linux-rtc@vger.kernel.org>; Tue, 31 Oct 2023 21:43:14 -0700 (PDT)
Received: from MTA-09-4.privateemail.com (mta-09.privateemail.com [198.54.127.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 7DA75604A1
	for <linux-rtc@vger.kernel.org>; Wed,  1 Nov 2023 00:43:12 -0400 (EDT)
Received: from mta-09.privateemail.com (localhost [127.0.0.1])
	by mta-09.privateemail.com (Postfix) with ESMTP id 2226F18000B4;
	Wed,  1 Nov 2023 00:43:10 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=carlosaurelio.net;
	s=default; t=1698813790;
	bh=wrM4wws3GzG7Pdxz82HLUW40XAslUvqeDD096zLTAdM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gl27MAD2uUufnxa3GVRx1s1UlYp4o4xKq3ZBVs3Ywd94D5V9TJ1b8dlmzFk93KOX/
	 Cpz3YrP6exQCrfmup6ZK2ubm7IXVou7tiBg9ZHNrliyijquOiYRKwo2IaZtHIb1n4n
	 jSE7lwaS6p/1mZPrsXL9ZExT3siyv5SiDwxc0AQ/TKxdlP2MUgm3VuXJAaoJe6uslr
	 avaqjslGjETJnbdBnP7OBUu+9U562XIlkDkiR+No9KsfcENva+j4NLx/PRx9eKZbKr
	 +1ejSVQZoYAzs3rgRgcYOiQ/q/ebcMbJJMqQLGbcX7Fb1LIDLODoLaIudSlpZnnJ1S
	 CxmOkeIZuifOA==
Received: from [192.168.1.10] (unknown [152.254.207.93])
	by mta-09.privateemail.com (Postfix) with ESMTPA;
	Wed,  1 Nov 2023 00:43:03 -0400 (EDT)
Message-ID: <9f77191d-c3d7-4092-a754-baf96e664692@carlosaurelio.net>
Date: Wed, 1 Nov 2023 01:43:00 -0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: rtc: add pcf85053a
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Carlos Menin <menin@carlosaurelio.net>, linux-rtc@vger.kernel.org
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 Sergio Prado <sergio.prado@e-labworks.com>
References: <20231027162044.1011951-1-menin@carlosaurelio.net>
 <20231027162044.1011951-2-menin@carlosaurelio.net>
 <10971a4c-ac5a-4e89-8347-96b31ccd9587@kernel.org>
From: Carlos Aurelio <menin@carlosaurelio.net>
In-Reply-To: <10971a4c-ac5a-4e89-8347-96b31ccd9587@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP

On 28/10/2023 05:44, Krzysztof Kozlowski wrote:
> On 27/10/2023 18:20, Carlos Menin wrote:
>> Add YAML bindings for NXP's PCF85053A RTC chip.
>>
>> Signed-off-by: Carlos Menin <menin@carlosaurelio.net>
>> Reviewed-by: Sergio Prado <sergio.prado@e-labworks.com>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
>
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time, thus I will skip this patch entirely till you follow
> the process allowing the patch to be tested.
>
> Please kindly resend and include all necessary To/Cc entries.
>
>> ---
>>   .../bindings/rtc/nxp,pcf85053a.yaml           | 57 +++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
>> new file mode 100644
>> index 000000000000..80980377e27f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
>> @@ -0,0 +1,57 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/rtc/nxp,pcf85053a.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP PCF85053A Real Time Clock
>> +
>> +maintainers:
>> +  - Carlos Menin <menin@carlosaurelio.net>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nxp,pcf85053a
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  quartz-load-femtofarads:
>> +    description:
>> +      The quartz oscillator load capacitance.
>> +    enum: [6000, 7000, 12500]
>> +    default: 6000
>> +
>> +  quartz-drive-control:
>> +    description:
>> +      The quartz oscillator drive control.
>> +    enum: [low, normal, high]
>> +    default: normal
>> +
>> +  low-jitter:
>> +    description:
>> +      Low jitter mode.
>> +    type: boolean
>> +    default: false
> Cannot be anything else.

Sorry, I 'm not sure I understood, just to confirm before I resend the 
patch, does this mean this first part of the YAML is correct?

>> +
>> +allOf:
>> +  - $ref: rtc.yaml#
> This goes after required:
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        rtc@6f {
>> +          compatible = "nxp,pcf85053a";
> Use 4 spaces for example indentation.
>
>> +          reg = <0x6f>;
>> +        };
>> +      };
> Best regards,
> Krzysztof
>

Thanks for reviewing!

Best regards,
Carlos

