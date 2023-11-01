Return-Path: <linux-rtc+bounces-171-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 042687DDD3F
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Nov 2023 08:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 356BA281771
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Nov 2023 07:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9890D5694;
	Wed,  1 Nov 2023 07:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STDzApHg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEED5680
	for <linux-rtc@vger.kernel.org>; Wed,  1 Nov 2023 07:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68159C433C7;
	Wed,  1 Nov 2023 07:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698823995;
	bh=N4kwsD/yk4aCOba0M16ocWYlu+V2dFsDK6bTGcsPRTc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=STDzApHgvZWTlPHdsFZBUUycURDqVeYQ3BN0ZSbDCts4hG2yU9SoXdSs3LNf2riSY
	 2NT1OHpcPx8EyzlB2BIZl0sILaO09srRq+QlhjvYi+oNl4LHGLIPXXaRnjtl6zJxDL
	 C9LPPlUsOpVdqDt1S382ZwRQv5wc7Yzsy4n8Jm22+HY5/GNaNRvVTX1px05XAh9ypn
	 hGv7HEFXRmVGGIitE6LkpAoXaBmtYCOg3CxyDrCi87ZV9IZ/bEdZIsEtQZLv4H9iJq
	 hILgaj9JpfqrJJmyJH1qXT38Ycn7n1YMOcOO3298Bwq2bqYAyb2+UPDUnvUObASEYT
	 A8MIF3FlCoh8A==
Message-ID: <5e885248-b863-40ee-af96-8075678ed312@kernel.org>
Date: Wed, 1 Nov 2023 08:33:10 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: rtc: add pcf85053a
Content-Language: en-US
To: Carlos Aurelio <menin@carlosaurelio.net>, linux-rtc@vger.kernel.org
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 Sergio Prado <sergio.prado@e-labworks.com>
References: <20231027162044.1011951-1-menin@carlosaurelio.net>
 <20231027162044.1011951-2-menin@carlosaurelio.net>
 <10971a4c-ac5a-4e89-8347-96b31ccd9587@kernel.org>
 <9f77191d-c3d7-4092-a754-baf96e664692@carlosaurelio.net>
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <9f77191d-c3d7-4092-a754-baf96e664692@carlosaurelio.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/11/2023 05:43, Carlos Aurelio wrote:
> On 28/10/2023 05:44, Krzysztof Kozlowski wrote:
>> On 27/10/2023 18:20, Carlos Menin wrote:
>>> Add YAML bindings for NXP's PCF85053A RTC chip.
>>>
>>> Signed-off-by: Carlos Menin <menin@carlosaurelio.net>
>>> Reviewed-by: Sergio Prado <sergio.prado@e-labworks.com>
>> Please use scripts/get_maintainers.pl to get a list of necessary people
>> and lists to CC. It might happen, that command when run on an older
>> kernel, gives you outdated entries. Therefore please be sure you base
>> your patches on recent Linux kernel.
>>
>> You missed at least devicetree list (maybe more), so this won't be
>> tested by automated tooling. Performing review on untested code might be
>> a waste of time, thus I will skip this patch entirely till you follow
>> the process allowing the patch to be tested.
>>
>> Please kindly resend and include all necessary To/Cc entries.
>>
>>> ---
>>>   .../bindings/rtc/nxp,pcf85053a.yaml           | 57 +++++++++++++++++++
>>>   1 file changed, 57 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
>>> new file mode 100644
>>> index 000000000000..80980377e27f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
>>> @@ -0,0 +1,57 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/rtc/nxp,pcf85053a.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: NXP PCF85053A Real Time Clock
>>> +
>>> +maintainers:
>>> +  - Carlos Menin <menin@carlosaurelio.net>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - nxp,pcf85053a
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  quartz-load-femtofarads:
>>> +    description:
>>> +      The quartz oscillator load capacitance.
>>> +    enum: [6000, 7000, 12500]
>>> +    default: 6000
>>> +
>>> +  quartz-drive-control:
>>> +    description:
>>> +      The quartz oscillator drive control.
>>> +    enum: [low, normal, high]
>>> +    default: normal
>>> +
>>> +  low-jitter:
>>> +    description:
>>> +      Low jitter mode.
>>> +    type: boolean
>>> +    default: false
>> Cannot be anything else.
> 
> Sorry, I 'm not sure I understood, just to confirm before I resend the 
> patch, does this mean this first part of the YAML is correct?

No, it is not correct. I just do not perform review of code which was
not even tested. It's waste of my time. You got already more than
usually for such patches...

Both properties quartz-drive-control and low-jitter do not look generic.
If they are generic, they should be defined in common schema. Since they
do not, then they miss prefixes and explanation. Explanation for example
telling me why would you like to have high jitter in other cases?

Best regards,
Krzysztof


