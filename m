Return-Path: <linux-rtc+bounces-4704-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D062DB28DEA
	for <lists+linux-rtc@lfdr.de>; Sat, 16 Aug 2025 14:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91C6D3A8BEE
	for <lists+linux-rtc@lfdr.de>; Sat, 16 Aug 2025 12:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD350285066;
	Sat, 16 Aug 2025 12:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxnvmtVa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE1A29B0;
	Sat, 16 Aug 2025 12:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755348381; cv=none; b=t2qKugxL6YHANfAWLgG4HcFuEcdU3fwFNPD1MGtWicNZVaikFcatVQ0plTY/TeyULD+AqqTQ/8Dwg0jgCFmrYPK9G06dBg0/VnAOCA+ZCZp2tirN0M3DkyC4X+Osrdn8hqcle4rwt11GuN6TFMqO2wm3o3U/yEK4Dckl60LharA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755348381; c=relaxed/simple;
	bh=YIGRcpBKVSSbM4vhzjYUZ4rzj2zEpXTZdKsxWCTrydc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJO3Ktb1fCMictZmsYoJulgO+J6AIxJw1LV4F7r0/X3i7jnKUGvFMSgFhwpEIqEVp+/cjT+9N83FRVlmPaoUffxzRAk4xmFFpdomAXWuqFCPXr910cozyxNOPXK4vupxHO0JKKhhtvjqhydNshdr0fKj2d67lkzjhRd/G5BdkWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxnvmtVa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE38C4CEEF;
	Sat, 16 Aug 2025 12:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755348380;
	bh=YIGRcpBKVSSbM4vhzjYUZ4rzj2zEpXTZdKsxWCTrydc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QxnvmtVaUoGix95WDvdsuYeNUJl3WU2vXIC4UUkmEeSa39NseZlB70eHFx9XjhDcl
	 8wQdHjS5JGap/bWMaBu/Fe4ANhKQ0F71KMHia/5ROCjFbS2XOT95s+QSIJVMh1R1H5
	 0j6mgAmQ/giXKY2jSaOyaWMgEHdgfVIeG3jwKM7qOCOTLxWp6Dqq0LB2wUyvI+OzFp
	 KZgEEVBSLnETkxjQB229uVD7NAcLxMV8hFNlQdx1Tn3+qLZqLSEYtklDlqRvBlhtgS
	 LKVBYAonxROCiEP2CaQ2RymY4XUZHz27rcFS64n7v9rhYeKqKc5DnKdxOSGftlts1I
	 5Wttb4V69sZhQ==
Message-ID: <620292ee-46c7-4b9c-9047-86f8c771384a@kernel.org>
Date: Sat, 16 Aug 2025 14:46:15 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add Apple SMC RTC
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
 <20250812-wip-smc-rtc-v1-1-66a8e96dad60@kernel.org>
 <074fcd4c-0da8-42c4-a567-64fa7e173894@kernel.org>
 <20250814211928.GA3922106-robh@kernel.org>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250814211928.GA3922106-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.08.25 23:19, Rob Herring wrote:
> On Wed, Aug 13, 2025 at 08:14:51AM +0200, Krzysztof Kozlowski wrote:
>> On 12/08/2025 20:25, Sven Peter wrote:
>>> +maintainers:
>>> +  - Sven Peter <sven@kernel.org>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: apple,smc-rtc
>>> +
>>
>> No resources except nvmem? This should be folded into the parent. Don't
>> create device node to instantiate drivers.
> 
> Well, the reboot node has nvmem entries too, so probably better to keep
> this as child node.
> 
> Is there more functionality planned/needed here (for the mfd)? If so,
> please send it all at once. One child node at a time makes DT
> maintainers grumpy.

I'd very much like to avoid that!

There's one more driver (hwmon) that needs another child node and two 
more sub-devices that don't need any or expose any resources (hid for 
the power button and power/supply for batteries). I've talked to James
(who wrote hwmon) and he's going to submit the hwmon series together 
with at least rtc (and hid) so that you can see all additional bindings 
at once.


Thanks,


Sven


