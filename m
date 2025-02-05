Return-Path: <linux-rtc+bounces-3102-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D91DA281BC
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 03:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2A663A25BB
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 02:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFD2211A10;
	Wed,  5 Feb 2025 02:23:56 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA48025A65D;
	Wed,  5 Feb 2025 02:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738722236; cv=none; b=RftUyUwtUapNk637ouaIxgKEXTZhzKIT3VNHiGXFHte4MW3GiHNKw3tois15kOPUBhsr0v1l2byTUfWMGf/EqpRTNAfQIgNe0elhE0mWTshsT1BDLiF2uDRmHMb3uraOhpzJz3JSF2IPFqQGFE4O1Z6ZQ+POj5F1nwr6j0GB2Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738722236; c=relaxed/simple;
	bh=p8vQGlVfdVKj9VZZn4Wj5rhVsvLVygb3V8gJ24z44vU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XNdBhoUaVp01jZd2wr/hUYZyvLnYR7C4TTi87d18jXPKdAqzpq7IgvOAU/kxyDHY/3YYrRcaFUVJGN6yJ8kLZlb2tZcpnkFmKPr2tYp2yi4hBvJBQAD9awylbSApFIphXbfDW3zaoR7yDnIQ32ah0LwVWh36ttyZZsWWZJev0LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Ynk875fYQz1V64K;
	Wed,  5 Feb 2025 10:04:55 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id DF14518001B;
	Wed,  5 Feb 2025 10:08:32 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 5 Feb 2025 10:08:32 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 5 Feb
 2025 10:08:31 +0800
Message-ID: <c447e37b-57b5-f4c5-d34b-86b8430d36da@huawei.com>
Date: Wed, 5 Feb 2025 10:08:31 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 0/9] Use HWMON_CHANNEL_INFO macro to simplify code
To: Guenter Roeck <linux@roeck-us.net>, Andrew Lunn <andrew@lunn.ch>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <oss-drivers@corigine.com>, <matt@ranostay.sg>,
	<mchehab@kernel.org>, <irusskikh@marvell.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <louis.peens@corigine.com>, <hkallweit1@gmail.com>,
	<linux@armlinux.org.uk>, <kabel@kernel.org>, <alexandre.belloni@bootlin.com>,
	<krzk@kernel.org>, <zhanjie9@hisilicon.com>, <zhenglifeng1@huawei.com>,
	<liuyonglong@huawei.com>
References: <20250124022635.16647-1-lihuisong@huawei.com>
 <fca9ca93-16e4-44db-8fbb-90bc6af952e7@lunn.ch>
 <ca9e3821-b793-499c-8ae8-abc677adf375@roeck-us.net>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <ca9e3821-b793-499c-8ae8-abc677adf375@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemn100009.china.huawei.com (7.202.194.112)


在 2025/1/24 23:41, Guenter Roeck 写道:
> On 1/24/25 07:08, Andrew Lunn wrote:
>> On Fri, Jan 24, 2025 at 10:26:26AM +0800, Huisong Li wrote:
>>> The HWMON_CHANNEL_INFO macro is provided by hwmon.h and used widely 
>>> by many
>>> other drivers. This series use HWMON_CHANNEL_INFO macro to simplify 
>>> code.
>>>
>>> Huisong Li (9):
>>>    media: video-i2c: Use HWMON_CHANNEL_INFO macro to simplify code
>>>    net: aquantia: Use HWMON_CHANNEL_INFO macro to simplify code
>>>    net: nfp: Use HWMON_CHANNEL_INFO macro to simplify code
>>>    net: phy: marvell: Use HWMON_CHANNEL_INFO macro to simplify code
>>>    net: phy: marvell10g: Use HWMON_CHANNEL_INFO macro to simplify code
>>>    rtc: ab-eoz9: Use HWMON_CHANNEL_INFO macro to simplify code
>>>    rtc: ds3232: Use HWMON_CHANNEL_INFO macro to simplify code
>>>    w1: w1_therm: w1: Use HWMON_CHANNEL_INFO macro to simplify code
>>>    net: phy: aquantia: Use HWMON_CHANNEL_INFO macro to simplify code
>>
>> Please split these patches per subsystem. Maintainers generally have
>> scripts to accept patches, and those scripts don't work when there are
>> patches for other Maintainers mixed in. So you need 4 patchsets,
>> media, net, rtc and w1.
>>
>> I would also like to see the HWMON Maintainers opinion on these. A
>> patchset containing these have already been NACKed once. These patches
>> do however look like valid cleanups. But are they just so you can do
>> something bad in your vendor tree, which will never make it to
>> mainline?
>>
>
> I no longer comment on hwmon related changes outside drivers/hwmon/
> unless there are blatant problems such as someone trying to use an 
> obsolete
> API or abusing the current API.
>
>
All right. Let subsystem maintainer to decide if need to pick it up.
>
> .

