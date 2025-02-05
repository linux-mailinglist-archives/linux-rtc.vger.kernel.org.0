Return-Path: <linux-rtc+bounces-3101-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A27BDA2819F
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 03:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E9EB7A0F77
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 02:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF49212F97;
	Wed,  5 Feb 2025 02:11:35 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2101B13B280;
	Wed,  5 Feb 2025 02:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738721495; cv=none; b=lKWCghB/C9zjlA2VndWyP8sgB9DmQtCC8Z/+Yhupvvg6FQ1zgSO2lvDLO4GZ2kSm4SDXhBb/ZJSN10w1E2yU3vRaNjuLDGVZiQoiRLh1dqK3F8JbGNedbsWCqWnLCzO/Hsw5ymZRiErMFq0s9RgHDyr9rHW7M0/2pp6aYavPi28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738721495; c=relaxed/simple;
	bh=iF5njG1fn3RK7jVRZRE5ebhpw9cp38oi9Orwah1OZA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SdsbzuwcE65U6bYdGVO3TKua+0a9e5fCgna3eUASH7kAIua6yV6B2p10D7TjOAyc3E7YWx3Kys0IVda8DmUsCdbSyeBTAQKGloRhbmS3F1jqkJiegMEUbjnk4r4lE+VIRsrmd52JBBPRfVcYmk0v/O6Cn+Dy22j/7lXJMFfcV28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ynjsv0S4zz1l0dN;
	Wed,  5 Feb 2025 09:52:35 +0800 (CST)
Received: from dggemv711-chm.china.huawei.com (unknown [10.1.198.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 6272F1401F2;
	Wed,  5 Feb 2025 09:56:11 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Feb 2025 09:56:11 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 5 Feb
 2025 09:56:10 +0800
Message-ID: <13b36e29-de50-ef40-6483-2dc71cf780bc@huawei.com>
Date: Wed, 5 Feb 2025 09:55:58 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 0/9] Use HWMON_CHANNEL_INFO macro to simplify code
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <oss-drivers@corigine.com>, <matt@ranostay.sg>, <mchehab@kernel.org>,
	<irusskikh@marvell.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<louis.peens@corigine.com>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
	<kabel@kernel.org>, <alexandre.belloni@bootlin.com>,
	<zhanjie9@hisilicon.com>, <zhenglifeng1@huawei.com>,
	<liuyonglong@huawei.com>, <linux-hwmon@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <netdev@vger.kernel.org>
References: <20250124022635.16647-1-lihuisong@huawei.com>
 <1848ad5e-87cb-4f6b-a16d-c1b644add34f@kernel.org>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <1848ad5e-87cb-4f6b-a16d-c1b644add34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemn100009.china.huawei.com (7.202.194.112)


在 2025/1/25 0:58, Krzysztof Kozlowski 写道:
> On 24/01/2025 03:26, Huisong Li wrote:
>> The HWMON_CHANNEL_INFO macro is provided by hwmon.h and used widely by many
>> other drivers. This series use HWMON_CHANNEL_INFO macro to simplify code.
>>
> Read the feedback given to you last time. I do not see how you addressed
> this:
>
> "Avoid combining independent patches into one patch bomb. Or explain the
> dependencies and how is it supposed to be merged - that's why you have
> cover letter here."
Sorry. I got it now. Thank you for telling me again.😁
There is no any dependency for this series.
I will split these patches as Andrew suggested.

