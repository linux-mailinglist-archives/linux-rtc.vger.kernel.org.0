Return-Path: <linux-rtc+bounces-5653-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6E9CF6E30
	for <lists+linux-rtc@lfdr.de>; Tue, 06 Jan 2026 07:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 364C53016AFC
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Jan 2026 06:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB71303A01;
	Tue,  6 Jan 2026 06:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="6YTLKpEG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F7C302779;
	Tue,  6 Jan 2026 06:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767680700; cv=none; b=VgW5plbSZAbkEM+0uAcgeJx8APuuIfsbAgAvBgR9aH71GXdOERwppOTWRkgG/VAORD7eS34jVzlF1F9w9ZG7HxKyi8ZMoeln2BYs4WRp0rBDZqxvkqav6yIcmqMf9Pj8dW9DMZep8GuJLTrHGfEO3sIEbtr3i+LCTKd5ZNm676k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767680700; c=relaxed/simple;
	bh=3Jgz0vOYGJvmK1uJSvGIu1jwp8hp5uzJIxfmtsVJSb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=U0rcZciIi/8Wg4p9elmbHL1OEtg12TvJ3GGeW4QuvP9sX4qrXfVj6E3m+rMyNN39OzmwRqaGdwdLLHObjsKg8d2dU2v9pjwDX5f50AFYcyIvMXbKZF8IuMiRMTm2w/aFZmiyD1pjJptqGlwK5U+/B7RnKcUfwztKYa85bM+3IDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=6YTLKpEG; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=J0fOr3S6CBm4N9avxXliC6pZ3vQG0Ze0JFLCT9vuAek=;
	b=6YTLKpEG9IMOdTRJK2gvAFBPMm11XiTwFCKqo8XAW1DKmPfoIYA4I4DdjeyocnbwqAkPl5rs+
	QI7VUQWMtWcqZ7R4WFXwuIRe+sIra8nDxfp1b5lyVQy40fWfHiw/XD2605DEWywOjMYEX7RFKkV
	rLZLoxo4dKFGQZAWFhp6gwE=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dlh0J5WSPz1T4G1;
	Tue,  6 Jan 2026 14:22:08 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id D42C42025E;
	Tue,  6 Jan 2026 14:24:48 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 6 Jan 2026 14:24:48 +0800
Message-ID: <10e7c2e6-ef7d-7de1-5f02-ea6cb56bfa1a@huawei.com>
Date: Tue, 6 Jan 2026 14:24:46 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] rtc: interface: Fix softlockup in rtc_timer_do_work()
Content-Language: en-US
To: <alexandre.belloni@bootlin.com>, <linux-rtc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20251231092321.3787542-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20251231092321.3787542-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2025/12/31 17:23, Jinjie Ruan wrote:
> On kvm qemu with cmos rtc and mc146818 chip, when the read time jump to
> a future time after set the uie timer expire with a current RTC time,
> rtc_timer_do_work() will loop for a while util softlockup because
> the expiration of the uie timer was way before the current
> RTC time and a new timer will be enqueued until the current rtc time
> is reached, as below:
> 
> Fix it by voluntarily yield the CPU in the loop in rtc_timer_do_work().
> 
> RTC_UIE_ON:
> 	read now: 2019:04:08:12:32:27, add timer0 (expire: 2019:04:08:12:32:28)
> 		 ^^^^^^^^^^^^^^^^^^^^
> ...
> rtc_timer_do_work() iterate the list in a loop:
> 	read now: 2033:12:02:07:27:15

Please ignore, this seems to be a bug in QEMU.

> 		  ^^^^^^^^^^^^^^^^^^^
> 	handle timer0, add timer1 to the list (expire: 2019:04:08:12:32:29)
> 	handle timer1, add timer2 to the list (expire: 2019:04:08:12:32:30)
> 	handle timer2, add timer3: 2019:04:08:12:32:31
> 	...
> 	-> softlockup
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/rtc/interface.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index b8b298efd9a9..9ded10e82f4b 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -964,6 +964,7 @@ void rtc_timer_do_work(struct work_struct *work)
>  			timer->enabled = 1;
>  			timerqueue_add(&rtc->timerqueue, &timer->node);
>  			trace_rtc_timer_enqueue(timer);
> +			cond_resched();
>  		}
>  	}
>  

