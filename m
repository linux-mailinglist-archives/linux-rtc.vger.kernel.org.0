Return-Path: <linux-rtc+bounces-2024-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B607C97BAF6
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 12:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46AC22845AB
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 10:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B0D188006;
	Wed, 18 Sep 2024 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oe8fEsfa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6588B17E46E;
	Wed, 18 Sep 2024 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726655794; cv=none; b=glOrQZUMkADls+2lwYNlB/LinMrd+9wBoaNJRsptIrvVY7z7pDhgHb220BOX8H5Q6kvFN4psN624bUNMKSnXHqhzPtLbPrhcJ2qmnZev3nFAM5uFOfeVFXQbD/CllNiuV2/cLTWaCbtWGokX6rroRl+OinEk0Giul8qoJZFDem0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726655794; c=relaxed/simple;
	bh=eTS3gc/BmkF4XpBhvFZQ8aG/m3nfMsOJGf7bwOqJ/Q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCjzi2I0IFQ4LGYII1WOzMatiK6O0fH69S0zI62osu1RqzXTMRvy/BkHxiosTtMpI7oDwEMySnw0FrpM2UP4r0hEmU+DoO/p4XsErayIifKDIbKGVWimy59Rm78TntRb8zp4ja1EI0Cgb/KS/hP8LTDTh/cURRO/x/Zyo0kcitE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oe8fEsfa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB87BC4CECE;
	Wed, 18 Sep 2024 10:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726655794;
	bh=eTS3gc/BmkF4XpBhvFZQ8aG/m3nfMsOJGf7bwOqJ/Q4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Oe8fEsfajVU+mpBu5m19PkX0miGKUfcaJX51dE8Uih2n3hLW0rwlfm220XC9pUBAA
	 riYwCpwjlvDY/1UB2oppP58KVcsEDtygoZRKVE2NrNj8k/K4636+Gbs13bJxqqh+2V
	 sRHOpBKunYwjFIZ2Sy51h5eryZU0yyaSfMVQ+pKJpn30cg+2Oo1v6eNFWFvQSu4miM
	 AHUhAyf9w9irvL2iwQQYrZwQIChSTpbFLhGoeFv7I8NyBY7KtJLUZSd2MziBqa+Umh
	 WNa1P0Q5Cgg/8VvFPKd18VEbOCt6NRDIRkmasD/fNXp/OFBphwTajeQKr8vu5T1HQi
	 zmmA6R1CZ/pzQ==
Message-ID: <8406f507-ceb6-42cf-af20-62bdad0255f6@kernel.org>
Date: Wed, 18 Sep 2024 12:36:29 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] MAINTAINERS: add MAINTAINER for S32G2/S32G3 RTC
 driver
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-5-ciprianmarian.costea@oss.nxp.com>
 <56c16398-faeb-4c99-9eaf-66ac5a872072@kernel.org>
 <85a13ce0-d821-4afa-ae69-6ce8e2e3edf7@oss.nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <85a13ce0-d821-4afa-ae69-6ce8e2e3edf7@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/09/2024 10:13, Ciprian Marian Costea wrote:
> On 9/17/2024 8:37 PM, Krzysztof Kozlowski wrote:
>> On 11/09/2024 09:00, Ciprian Costea wrote:
>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>
>>> Now that a RTC driver was added for S32G2/S32G3 SoC, update
>>> the mainainters list for it.
>>
>> Why? You don't do that alone. You add yourself for entire platform!
>>
>>>
>>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>> ---
>>>   MAINTAINERS | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index f328373463b0..a6d91101ec43 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -2686,11 +2686,13 @@ ARM/NXP S32G ARCHITECTURE
>>>   R:	Chester Lin <chester62515@gmail.com>
>>>   R:	Matthias Brugger <mbrugger@suse.com>
>>>   R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>>
>> If you are touching someone's maintainer entry, at least you could do is
>> to CC them.
>>
>> And how many reviewers do you want to have in that platform? Are all
>> entries real or some are stale?
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hello Krzysztof,
> 
> My intention was to add myself as a reviewer for the S32G Architecture 
> and not as a maintainer.
> 
> I plan to send more patches targeting this architecture and I would like 
> to review any other changes to them in the future.
> 
> On the other hand I understand your point, already having a list of 
> reviewers. If its unacceptable, I can only add myself as a maintainer 
> for the S32G RTC driver, in V2 of this patchset.
> 

Folks:
1. It is okay to have more maintainers or reviewers
2. Document the express, be explicit in commit msg, provide some reasoning
3. Be sure BEFORE you talked with existing maintainers and they are
onboard, unless they are not responsive
4. Explain why the list of three has to grow to list of 5 (or you did
not align it with your colleagues, either). Yes, I see your other emails
and it is very confusing that two of such events happen independently.
It is not community task to coordinate your team activities...

Best regards,
Krzysztof


