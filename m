Return-Path: <linux-rtc+bounces-3103-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D394A281CA
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 03:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E22D018874FA
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 02:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CBD212D7C;
	Wed,  5 Feb 2025 02:29:59 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5D678F4C;
	Wed,  5 Feb 2025 02:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738722599; cv=none; b=IPDJLtVLC/cLbkxI+s6ixszEz697lHLE1GSyGcn56zWFKy6YUX9vtt9iyMrflF9ImXmX7fvw1EVb9slMb7FS5kQtg86NYUhZjB1lGwmkOiFKPe9Z0GjQrAjfJ1lKz+MJs8sCw7nv8k1FQDdIJXYeulOov+OuV3veTt1kwZf6UXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738722599; c=relaxed/simple;
	bh=oxnH1SRs7qzqidSeh6lDtPs3UM5RE2YKmoGQtyn1w7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PC4Cp7/TtbgfKmfqZU0awPLzbjYGnW2QT8SBNMiJujbGstDPGyny+fgdMZvdw+z3twE8lYuRy5YTUtZuXQId9RoN+McDLoK0vvaa27noVMEv+DHPQI5uLO9lNcYfhHy/Tz89WR1mxRT82KEPuXipe0nl9R3+QvMjsouPB1koarc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Ynk9v3zQxz11PYG;
	Wed,  5 Feb 2025 10:06:27 +0800 (CST)
Received: from dggemv711-chm.china.huawei.com (unknown [10.1.198.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 575E11800D9;
	Wed,  5 Feb 2025 10:10:45 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Feb 2025 10:10:45 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 5 Feb
 2025 10:10:43 +0800
Message-ID: <094ebe59-debd-4cc1-c963-904d8fff14c9@huawei.com>
Date: Wed, 5 Feb 2025 10:10:43 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: (subset) [PATCH v1 8/9] w1: w1_therm: w1: Use HWMON_CHANNEL_INFO
 macro to simplify code
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <oss-drivers@corigine.com>, <matt@ranostay.sg>, <mchehab@kernel.org>,
	<irusskikh@marvell.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<louis.peens@corigine.com>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
	<kabel@kernel.org>, <alexandre.belloni@bootlin.com>, <krzk@kernel.org>,
	<zhanjie9@hisilicon.com>, <zhenglifeng1@huawei.com>,
	<liuyonglong@huawei.com>, <linux-hwmon@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <netdev@vger.kernel.org>
References: <20250124022635.16647-1-lihuisong@huawei.com>
 <20250124022635.16647-9-lihuisong@huawei.com>
 <173858376808.132674.4568544450122043067.b4-ty@linaro.org>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <173858376808.132674.4568544450122043067.b4-ty@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemn100009.china.huawei.com (7.202.194.112)


在 2025/2/3 19:56, Krzysztof Kozlowski 写道:
> On Fri, 24 Jan 2025 10:26:34 +0800, Huisong Li wrote:
>> Use HWMON_CHANNEL_INFO macro to simplify code.
>>
>>
> Applied, thanks!
>
> [8/9] w1: w1_therm: w1: Use HWMON_CHANNEL_INFO macro to simplify code
>        https://git.kernel.org/krzk/linux-w1/c/33c145297840dddf0dc23d5822159c26aba920d3
>
Thanks for picking it up.

