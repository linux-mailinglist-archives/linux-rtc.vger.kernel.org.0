Return-Path: <linux-rtc+bounces-2056-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9531C984244
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Sep 2024 11:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A269B2A1CB
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Sep 2024 09:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65CB1537D4;
	Tue, 24 Sep 2024 09:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JmAz/RIM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC85684A2C;
	Tue, 24 Sep 2024 09:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727170230; cv=none; b=BG7HEuL6zAmceOzZXUn/pLR+Ilk/0hWD5wSd5D49k/oLB2QMFLvO+M8kcb6IIBE1qXlsP0h7xqFy1+Q/R3LX1iGPDuSyOABdIbmM54AveSiYCPfOJz4ODpCt5US8mBtF+8q6CU3HjTTWu3VwcVeDZjvdwlclqfm9ZFzx0STpZxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727170230; c=relaxed/simple;
	bh=yYGyQa85Hiy1PX0vqwd7dAOmJNDEEsVqTrx6k8biPY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KOFpATO8Tvrcu1agb6Tsv5kkJZrpXhWQFCBp5c10Cr0Zz5yuOvewec1evBpXnH2PCgRaqEBAIBs9IuNhTz8dH31zcMDIcDbq7sOiPfBxUPQdAMx+iN8tZw8gfgaPFXLODXS0re3f+vZAoQPwiXnXx3cSMQvvsYc6Cszqr8+wYrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JmAz/RIM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727170226;
	bh=yYGyQa85Hiy1PX0vqwd7dAOmJNDEEsVqTrx6k8biPY0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JmAz/RIMcfvnkfrzc76Ve42Qwh1mrdn89jlizJg0cYIOINFLr+kOfLxDbtn0fs3u8
	 4C5At/kPvKrNwaHCBU90aVOFzE03G6vd9Wo4u+Q7SZula5SDL7lMK1rjztXLm5l7QZ
	 DmhRUtN0KEP/DlFZULU20Gz8ucEb7FEGqaQYPd852giT16O8fXik2ff3BQT72XIBd8
	 zbiNL9HGNPhpTvZaplBZmMo0vipYN72q3OckbhUEOjALMmeax5aR4k0ACtshCC2vPL
	 3KbUCcuc5xfh3VwzuWx57oXXpu3VIa7a9vH/9skGPjGJXhw9rN2LieXPc+Raab7uiQ
	 kzxm9x570OxHQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E1AA17E10AA;
	Tue, 24 Sep 2024 11:30:26 +0200 (CEST)
Message-ID: <72ce817e-63de-40a7-b7e9-a5b44b67e207@collabora.com>
Date: Tue, 24 Sep 2024 11:30:25 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] rtc: mt6359: Add RTC hardware range and add
 support for start-year
To: Macpaul Lin <macpaul.lin@mediatek.com>, lee@kernel.org,
 ZhanZhan.ge@mediatek.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, eddie.huang@mediatek.com, sean.wang@mediatek.com,
 alexandre.belloni@bootlin.com, sen.chu@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rtc@vger.kernel.org, kernel@collabora.com, yong.mao@mediatek.com
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
 <20240923100010.97470-3-angelogioacchino.delregno@collabora.com>
 <0748868d-4789-fcaa-e70f-6a4508411b36@mediatek.com>
 <247abc15-d82f-3e8f-5202-edc6099707df@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <247abc15-d82f-3e8f-5202-edc6099707df@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 24/09/24 09:05, Macpaul Lin ha scritto:
> 
> On 9/24/24 12:08, Macpaul Lin wrote:
>>
>> On 9/23/24 18:00, AngeloGioacchino Del Regno wrote:
>>> Add the RTC hardware range parameters to enable the possibility
>>> of using the `start-year` devicetree property which, if present,
>>> will set the start_secs parameter by overriding the defaults
>>> that this driver is setting;
>>>
>>> To keep compatibility with (hence have the same date/time reading
>>> as) the old behavior, set:
>>>   - range_min to 1900-01-01 00:00:00
>>>   - range_max to 2027-12-31 23:59:59 (HW year max range is 0-127)
>>>   - start_secs defaulting to 1968-01-02 00:00:00
>>>
>>> Please note that the oddness of starting from January 2nd is not
>>> a hardware quirk and it's done only to get the same date/time
>>> reading as an RTC which time was set before this commit.
>>>
>>> Also remove the RTC_MIN_YEAR_OFFSET addition and subtraction in
>>> callbacks set_time() and read_time() respectively, as now this
>>> is already done by the API.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   drivers/rtc/rtc-mt6397.c | 13 ++++---------
>>>   1 file changed, 4 insertions(+), 9 deletions(-)
>>
>> [snip]
>>
>> Thanks for helping add new patch fix for RTC.
>>
>>> @@ -302,6 +293,10 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>>>       device_init_wakeup(&pdev->dev, 1);
>>>       rtc->rtc_dev->ops = &mtk_rtc_ops;
>>> +    rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
>>> +    rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
>>> +    rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
>>> +    rtc->rtc_dev->set_start_time = true;
>>>       return devm_rtc_register_device(rtc->rtc_dev);
>>>   }
>>
>> Dear @Zhanhan, Please help to leave comment if you think there is something need 
>> to be clarify. For example, I've found some relate origin defines
>> in "include/linux/mfd/mt6397/rtc.h"
>> #define RTC_MIN_YEAR    1968
>> #define RTC_BASE_YEAR    1900
>> #define RTC_NUM_YEAR    128
>> #define RTC_MIN_YEAR_OFFSET    (RTC_MIN_YEAR - RTC_BASE_YEAR)
>>
>> Should MediaTek remove RTC_MIN_YEAR and RTC_BASE_YEAR in next patch?
>> And since there may not exist any smartphone/tablet/TV using mt6397
>> RTC earlier than 2010? Is it possible to change
>> RTC_TIMESTAMP_BEGIN_1900 to RTC_TIMESTAMP_BEGIN_2000 without breaking
>> compatibility for these devices?
>>
>> Thanks
>> Macpaul Lin
>>
> 
> After discussing these change with ZhanZhan, MediaTek think use 
> RTC_TIMESTAMP_BEGIN_1900 and the other changes are okay.
> 
> Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Reviewed-by: ZhanZhan Ge <zhanzhan.ge@mediatek.com>
> 

Thank you Macpaul, ZhanZhan :-)

Cheers,
Angelo

