Return-Path: <linux-rtc+bounces-3946-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EECAEA87E80
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Apr 2025 13:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5D293B2C3E
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Apr 2025 11:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1706C28FFD5;
	Mon, 14 Apr 2025 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bm83xP1t"
X-Original-To: linux-rtc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D207BDF42;
	Mon, 14 Apr 2025 11:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744628961; cv=none; b=nXSy1s99Pg6nm/gVRyijlkjIxYFKwPBZw9FP/1hLb5CI5nQP795U+RvN5s3ltIdIrvaU7FwccNHVzFYEuIWLznc0W3ODk4uVoc14FjUyJk783ZeAR3rmgYlZMb55kAbPU6HxOwLUJByZ56eYNo95VykaLoXyPyCKV46aL/Mifms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744628961; c=relaxed/simple;
	bh=wjnJnWMkojXnEo1V8ScaOLq3IF7OMdLybc1gyWhzlmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISiavuy50rncFW8y6kSXqKMOeB1BDly7yS5kV96Ob4Lsfja0kMVXE8dYAAtN4w1ZUyVxmp/ef2YdceSGfXDl+84aD+gvMybpZ6iEJtDRDVg4pwqxLQuPb7QHTGEj/wu4irE33ssYq9QQht3b+nCBrrITyp7ZRJ3v49JJ27oGQKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bm83xP1t; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744628955;
	bh=wjnJnWMkojXnEo1V8ScaOLq3IF7OMdLybc1gyWhzlmI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bm83xP1tD0JnIrATrbQIMEtpktlE/Z1bIw1eXJGyGVv1ngWG1Hro9fHFlmCy7g/GX
	 Qn2A4ntb4XnkqFJO0J+0h6YAodB5abD4pjeEQFiWvtwApTKkShnIIGIWWCNW9JZRQk
	 FofNz1nxl8itoPV4dRoHgYmBdVqvdpesiUk6Rdaq/ElUPqHUry2ysa2Vvyjef3+Izj
	 mG6OX0Zp9gSUX/IM5z5qt4kRMKAFCJO+JXeaKmZ9wJ1ltT0atdhHTWMI8ql3yYLIv8
	 vBUTkP96MILKzAH01LORDHQipJUWx60mLLoLArD2OGq9ubX64BsrE44tyo780JFp8j
	 rreUitkY3193w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 224D717E00AC;
	Mon, 14 Apr 2025 13:09:15 +0200 (CEST)
Message-ID: <968001f7-96d1-4ad5-8c36-28cac5dc30f1@collabora.com>
Date: Mon, 14 Apr 2025 13:09:14 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] rtc: mt6397: Remove start time parameters
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
 <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
 <20250411133609a1295543@mail.local> <202504111339359e840246@mail.local>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <202504111339359e840246@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/04/25 15:39, Alexandre Belloni ha scritto:
> On 11/04/2025 15:36:12+0200, Alexandre Belloni wrote:
>> On 11/04/2025 14:35:57+0200, Alexandre Mergnat wrote:
>>> The start time parameters is currently hardcoded to the driver, but
>>> it may not fit with all equivalent RTC that driver is able to support.
>>>
>>> Remove the start_secs and set_start_time value setup because it
>>> will be handled by the rtc_device_get_offset function using the
>>> start-year DTS property.
>>>
>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>> ---
>>>   drivers/rtc/rtc-mt6397.c | 2 --
>>>   1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
>>> index 692c00ff544b2..d47626d47602f 100644
>>> --- a/drivers/rtc/rtc-mt6397.c
>>> +++ b/drivers/rtc/rtc-mt6397.c
>>> @@ -291,8 +291,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>>>   	rtc->rtc_dev->ops = &mtk_rtc_ops;
>>>   	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
>>>   	rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
>>> -	rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
>>> -	rtc->rtc_dev->set_start_time = true;
>>>   
>>
>> This is going to break the time for people upgrading their kernel, you
>> are unfortunately stuck with this.
>>
> 
> To be clear, the breakage will happen when upgrading the kernel but not
> the device tree with 5/5
> 

Yes, you're stuck with this. Devicetree has to be retrocompatible.

Besides, this start_secs is what gets used by default, and the start-year
devicetree property should take precedence and effectively override the
start_secs default.

Just keep it there.... :-)

Cheers,
Angelo

>>>   	return devm_rtc_register_device(rtc->rtc_dev);
>>>   }
>>>
>>> -- 
>>> 2.25.1
>>>
>>
>> -- 
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
> 




