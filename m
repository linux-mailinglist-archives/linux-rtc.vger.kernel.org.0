Return-Path: <linux-rtc+bounces-3100-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D50DFA2818B
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 03:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B66FE18870EB
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 02:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F51212B04;
	Wed,  5 Feb 2025 02:05:51 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938DF13B280;
	Wed,  5 Feb 2025 02:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738721151; cv=none; b=usozRnVYIKTfYBlbYiGFsUjyuOThz+CFApvoeVG54xiBzKdzktVG6xu83Vj3sCcuFpIieTuTDJaj5fG0md3+LwRNNHy2ye5C1EUAag5/HaiomVhtpkZ1mVlISaL/vDM+BfYqLT4o9/c++y8cW7lpWWgBqA0ApY0unjfS+00RZFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738721151; c=relaxed/simple;
	bh=IlZQBea16DaPKe4dix0OXj6Acx1xWi+omT+MmAlB39w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l35aiWkG/leKXGa4zNzPvAPWDukFjHPiMYJckWzWflnVc7gckU04QH8IqisYrps2tBByoJgcsl6o/slKhY6lmH4PpAokhe9cUX8Er0S2kVPzX3iN+AiO6mDfp4qCde0RDoiHAA21XQSV3I2Y8BlVzzqMwXbJJgswN2aoF8cpJt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Ynk5w5fftz22mKF;
	Wed,  5 Feb 2025 10:03:00 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id AC45E1A016C;
	Wed,  5 Feb 2025 10:05:45 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 5 Feb 2025 10:05:45 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 5 Feb
 2025 10:05:44 +0800
Message-ID: <0af59f13-7b88-3ede-ef90-00457d105c3c@huawei.com>
Date: Wed, 5 Feb 2025 10:05:43 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 0/9] Use HWMON_CHANNEL_INFO macro to simplify code
To: Andrew Lunn <andrew@lunn.ch>
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
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <fca9ca93-16e4-44db-8fbb-90bc6af952e7@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemn100009.china.huawei.com (7.202.194.112)

Hi Andrew,

在 2025/1/24 23:08, Andrew Lunn 写道:
> On Fri, Jan 24, 2025 at 10:26:26AM +0800, Huisong Li wrote:
>> The HWMON_CHANNEL_INFO macro is provided by hwmon.h and used widely by many
>> other drivers. This series use HWMON_CHANNEL_INFO macro to simplify code.
>>
>> Huisong Li (9):
>>    media: video-i2c: Use HWMON_CHANNEL_INFO macro to simplify code
>>    net: aquantia: Use HWMON_CHANNEL_INFO macro to simplify code
>>    net: nfp: Use HWMON_CHANNEL_INFO macro to simplify code
>>    net: phy: marvell: Use HWMON_CHANNEL_INFO macro to simplify code
>>    net: phy: marvell10g: Use HWMON_CHANNEL_INFO macro to simplify code
>>    rtc: ab-eoz9: Use HWMON_CHANNEL_INFO macro to simplify code
>>    rtc: ds3232: Use HWMON_CHANNEL_INFO macro to simplify code
>>    w1: w1_therm: w1: Use HWMON_CHANNEL_INFO macro to simplify code
>>    net: phy: aquantia: Use HWMON_CHANNEL_INFO macro to simplify code
> Please split these patches per subsystem. Maintainers generally have
> scripts to accept patches, and those scripts don't work when there are
> patches for other Maintainers mixed in. So you need 4 patchsets,
> media, net, rtc and w1.
Many thanks for your reply and good suggestion.
I will split them.
>
> I would also like to see the HWMON Maintainers opinion on these. A
> patchset containing these have already been NACKed once. These patches
> do however look like valid cleanups. But are they just so you can do
> something bad in your vendor tree, which will never make it to
> mainline?
>
> 	Andrew
>
> .

