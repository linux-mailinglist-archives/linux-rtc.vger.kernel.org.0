Return-Path: <linux-rtc+bounces-2055-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F02984214
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Sep 2024 11:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EB5A1C20A96
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Sep 2024 09:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B18315539D;
	Tue, 24 Sep 2024 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HzXl9gg4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC7C146D59;
	Tue, 24 Sep 2024 09:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727170098; cv=none; b=PgwryMvEMjXvy6jEQfY7YENjSvXXbksp/U/BG+BZuwly5dnhFTRMi3ARzxoQXJoyajPb2JNz5o6h5nOQU/ejTO8jPaDCXuTOpJ972daPSTCI0fPqlw5ko6NZkDJRx/RTX9r80zd3DTIHkt3nLmk36bbY17e8Thd4WPqzLpePh+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727170098; c=relaxed/simple;
	bh=1/4/wfBiOX9Itl+cWjkJgnZpXxgJohL7oKXK2AxqZ4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O37rT9UYMpUyR+OxkD4pDnzaSUjlNXTKC5jWC1QuY3xOf4TwGrhThE64trJouH9D3MSK262WqW69sBEV2Rez8BnysJc4GMHZ0S6aF2Znx/PfO7dU6wvKkMNJYCcrpJ8fHUp9jax9g9vEeobdpskRO3sYdQdZTZ4ocK25HANNFow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HzXl9gg4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727170094;
	bh=1/4/wfBiOX9Itl+cWjkJgnZpXxgJohL7oKXK2AxqZ4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HzXl9gg4klyu8o3pDWD018Tjo+LUnp+z2lRqTbRC4BTqWCN52XulqVHBjCxfjSRdc
	 f6fsWChFK5BnCixzG6EzVMO+0ev45jqT2M7QMnuho8TkFMADhCYtfcea3JMB1MvSMT
	 dqek7xMVpq8UbYYX90G3N0uklW3T78WVwK84O1iaYixfivyYtfAYtqYiLCG93G5jlE
	 SSKdffBPEEkqzezmr3svlXAvuhqThATsfkJOF5KvCZpN2nfFEezTGOtNua/8ZGf0Ft
	 stZVXPssgEzgVoHCU/dVjEd0ARS3wBrGKBReGicAQrB4FoKwrnll1jPemQFlxGRafv
	 +KnJ3Npf/ROzA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C6BD717E10AA;
	Tue, 24 Sep 2024 11:28:13 +0200 (CEST)
Message-ID: <0188d8cc-faad-4ef1-99fe-d1586f97d65f@collabora.com>
Date: Tue, 24 Sep 2024 11:28:13 +0200
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <0748868d-4789-fcaa-e70f-6a4508411b36@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 24/09/24 06:08, Macpaul Lin ha scritto:
> 
> On 9/23/24 18:00, AngeloGioacchino Del Regno wrote:
>> Add the RTC hardware range parameters to enable the possibility
>> of using the `start-year` devicetree property which, if present,
>> will set the start_secs parameter by overriding the defaults
>> that this driver is setting;
>>
>> To keep compatibility with (hence have the same date/time reading
>> as) the old behavior, set:
>>   - range_min to 1900-01-01 00:00:00
>>   - range_max to 2027-12-31 23:59:59 (HW year max range is 0-127)
>>   - start_secs defaulting to 1968-01-02 00:00:00
>>
>> Please note that the oddness of starting from January 2nd is not
>> a hardware quirk and it's done only to get the same date/time
>> reading as an RTC which time was set before this commit.
>>
>> Also remove the RTC_MIN_YEAR_OFFSET addition and subtraction in
>> callbacks set_time() and read_time() respectively, as now this
>> is already done by the API.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/rtc/rtc-mt6397.c | 13 ++++---------
>>   1 file changed, 4 insertions(+), 9 deletions(-)
> 
> [snip]
> 
> Thanks for helping add new patch fix for RTC.
> 
>> @@ -302,6 +293,10 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>>       device_init_wakeup(&pdev->dev, 1);
>>       rtc->rtc_dev->ops = &mtk_rtc_ops;
>> +    rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
>> +    rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
>> +    rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
>> +    rtc->rtc_dev->set_start_time = true;
>>       return devm_rtc_register_device(rtc->rtc_dev);
>>   }
> 
> Dear @Zhanhan, Please help to leave comment if you think there is something need to 
> be clarify. For example, I've found some relate origin defines
> in "include/linux/mfd/mt6397/rtc.h"
> #define RTC_MIN_YEAR    1968
> #define RTC_BASE_YEAR    1900
> #define RTC_NUM_YEAR    128
> #define RTC_MIN_YEAR_OFFSET    (RTC_MIN_YEAR - RTC_BASE_YEAR)
> 
> Should MediaTek remove RTC_MIN_YEAR and RTC_BASE_YEAR in next patch?
> And since there may not exist any smartphone/tablet/TV using mt6397
> RTC earlier than 2010? Is it possible to change
> RTC_TIMESTAMP_BEGIN_1900 to RTC_TIMESTAMP_BEGIN_2000 without breaking
> compatibility for these devices?

Adding some context:

Being clear, the RTC timestamp starting at year 1900 doesn't mean that the
last achievable date is 2027, as the time is anyway shifted by 68 years in
this case - so, by default, the year range goes from 1968 to 2095 (unless
overridden by the start-year property, of course).

This means that setting the RTC to start at a different year doesn't really
give any measurable improvement, as that would avoid just one addition and
one subtraction operation at read and write respectively, which is something
that happens "rarely in a boot life" (RTC usually gets read once at kernel
boot, and written every time you change the date/time, which normally happens
once per day, if not even less...!).

Cheers,
Angelo


