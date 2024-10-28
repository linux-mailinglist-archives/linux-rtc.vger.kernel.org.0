Return-Path: <linux-rtc+bounces-2353-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA579B3575
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Oct 2024 16:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6685B2109F
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Oct 2024 15:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033901DE4FE;
	Mon, 28 Oct 2024 15:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4Hhh8hk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FFC1DE3A5;
	Mon, 28 Oct 2024 15:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730130966; cv=none; b=DbKVrajP0PhtbTQwxaW89y8FbLr7TNGWG+pkfAIsMMnKrsNpK+ZdUm8P5fxPsWyoNyoXtNTXs0pgcKlvcQSi/vmy9Vgw2csWgcEUmh6NKQttwqKJkGaYv1sWnBJqwyAESnimYuK4LISO6RNdjjth6lh9ic7sd9LFhWY4rGLTc0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730130966; c=relaxed/simple;
	bh=kcXWaumbyr6t9IiJrYzk+TPHTKWPNQ77yjGbTntrxF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaWO1ZRjFTvAd4etSG5kTfdu2lYvw9OI1+r1CJJM4BXCS0uumJxSmyOL9xUhFCWB5gbo0I5RLHMulQZGHVWVAcx8c0Sh8+EmaTZ4hE8j1g5wCcaqYSi9cN6niZUKVuGnIUIJgyAXfxMEt0w7VHtone2LzXIULGI+uK07n8cz0jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4Hhh8hk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532EEC4CEE4;
	Mon, 28 Oct 2024 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730130966;
	bh=kcXWaumbyr6t9IiJrYzk+TPHTKWPNQ77yjGbTntrxF8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m4Hhh8hk6UHucwbmmDc1eLa33P29mZ7Euls3901pvUa+9D/8PFlBkSbSA3cQGLeMt
	 1RGrIOnLy4lMAxogmyLe62GYwGk7uy8vfBSn2Kl0eI9ZApONcepc2ubnAUmjqjTg4y
	 b9Ll994UtRSIpsPR1tb0nUFVRmBWcAhPnQZ3K29l5zKWTEh8b7eT0Py9ICd3pDEwd/
	 YJma2y6m20fDbrOV2Bg2U+z7GWq56ZPlnzsBIcUetlgV1LUrEb+PtsAR38C/FhT4RB
	 zUGmQLCXFBzu+Abi1fcvL2L2EOBtNo4sFILAeyxIj1ZSAWHOO6E+F2khA3EcXxWrgM
	 d9Sr28VQfL7Ww==
Message-ID: <cf8dd3ec-e1e6-4750-b0c6-ceff710dce97@kernel.org>
Date: Mon, 28 Oct 2024 16:55:59 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: pcf2127: Add
 nxp,battery-switch-over property
To: Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc: Conor Dooley <conor@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>
References: <20241022092855.1609427-1-p.rosenberger@kunbus.com>
 <20241022092855.1609427-2-p.rosenberger@kunbus.com>
 <20241022-radiator-blemish-3819dd4d94e0@spud>
 <36f46d44-8852-4988-9ff9-5b8bf49e2aa8@kunbus.com>
 <pj3tgtsdsjsqqznxgzzmxrcozibqie6ubtythou7t23tfgde5w@t6nwxob4rjah>
 <b8c28db1-11b2-498d-a2d8-0302c7081251@kunbus.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <b8c28db1-11b2-498d-a2d8-0302c7081251@kunbus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/10/2024 15:54, Philipp Rosenberger wrote:
> On 24.10.24 09:25, Krzysztof Kozlowski wrote:
>> On Thu, Oct 24, 2024 at 09:11:04AM +0200, Philipp Rosenberger wrote:
>>> On 22.10.24 18:35, Conor Dooley wrote:
>>>> On Tue, Oct 22, 2024 at 11:28:54AM +0200, Philipp Rosenberger wrote:
>>>>> The nxp,battery-switch-over property is used to control the switch-over,
>>>>> battery low detection and extra power fail detection functions.
>>>>>
>>>>> The PCF2131 has a different default value for the PWRMNG bits. It is set
>>>>> to 0x7: battery switch-over function is disabled, only one power supply
>>>>> (VDD); battery low detection function is disabled.
>>>>> This is the opposite of the default of the PCF2127/PCA2129 and PCF2129.
>>>>> With the nxp,battery-switch-over the behavior can be controlled through
>>>>> the device tree.
>>>>>
>>>>> Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
>>>>> ---
>>>>>    Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 10 ++++++++++
>>>>>    1 file changed, 10 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
>>>>> index 2d9fe5a75b06..5739c3e371e7 100644
>>>>> --- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
>>>>> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
>>>>> @@ -30,6 +30,16 @@ properties:
>>>>>      reset-source: true
>>>>> +  nxp,battery-switch-over:
>>>>> +    description:
>>>>> +      Battery and power related configuration. This property is used to set the
>>>>> +      PWRMNG bits of the Control_3 register to control the battery switch-over,
>>>>> +      battery low detection and extra power fail detection functions.
>>>>> +      The actual supported functions depend on the device capabilities.
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint8
>>>>> +    minimum: 0
>>>>> +    maximum: 7
>>>>
>>>> Beyond the fact that I dislike register-content properties like this, where
>>>> it is not possible to grok the meaning by reading the property, what
>>>
>>> Yes, I'm not satisfied with this solution myself.
>>> There are three different functions, which can be configured in the
>>> register:
>>> - battery switch-over mode: standard; direct; disabled
>>> - battery low detection: enabled; disabled
>>> - extra power fail detection: enabled; disabled
>>>
>>> I'm not sure what a proper way is to implement this in the devicetree.
>>>
>>>> even makes this suitable for DT in the first place? Reading the commit
>>>> message this sounds like software policy, and that different users of
>>>> the same board might want to configure these register bits in different
>>>> ways.
>>>
>>> It is less a software policy, but a configuration how the hardware is
>>> implemented. If the device has no battery, it is possible to disable the
>>> battery switch-over function. In this case the V_BAT must be connected to
>>> ground.
>>
>> monitored-battery property already tells you this.
> 
> If I understand this correctly, the monitored-battery property is meant 
> for rechargeable batteries, not for a simple button cell to back up an RTC.

Uh, right, this is not a charger. Then property, when described as real
hardware characteristic, is fine, e.g. "nxp,no-backup-battery".

> 
>>
>>> If a battery is connected, the battery switchover will only work if the
>>> battery switch-over function is in standard mode or direct switching mode.
>>> Until now the driver has just ignored the PWRMNG bits. As the default was
>>> battery switching in standard mode. Thus all use cases worked good enough.
>>> Battery switching was working if a battery was connected. If no battery was
>>> connected it did no real harm (the rtc may have used a tiny bit more power
>>> then needed, I guess).
>>
>> Why driver cannot use standard mode always? Or other way?
> 
> This would overwrite any configuration set by a bootloader/firmware. For 
> the older chips (pre PCF2131) this was no problem. As the reset default, 
> was "battery switch-over in standard mode". The driver just left the 
> whole battery switch-over configuration untouched.
> If we decide to change the battery switch-over configuration 
> unconditionally, this could overwrite any third-party configuration.

I still don't get why this is a problem. Why device cannot be configured
completely?

> 
>>> With the new PCF2131 the default has changed to battery switch-over
>>> disabled. Now even with a battery attached, the rtc will lose time after a
>>> power cycle.
>>> I guess I should describe this better in the commit message.
>>
>> In any case this is pcf2131 related, right? So compatible implies it.
> 
> The reason, why this property is necessary for our devices is the new 
> PCF2131. But the function is not limited to this device.
> 
> I’m considering simplifying this to just a property that informs the 
> driver that a backup battery is available. If the property is available, 
> the driver will enable the battery switch-over function; otherwise, it 
> will not touch the configuration.

Sure.

Best regards,
Krzysztof


