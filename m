Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9F545FED
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2019 16:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbfFNOCw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Jun 2019 10:02:52 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50335 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbfFNOCv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Jun 2019 10:02:51 -0400
Received: by mail-wm1-f68.google.com with SMTP id c66so2512797wmf.0;
        Fri, 14 Jun 2019 07:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ab+7WbbGf5PhIxhkR1bg6m+bqcq4jiWui2KFmmYCI+8=;
        b=U7yOv1Bcy7aFKyWnB9RORxdvJ91mtpfB8TlE6lFsAUfxCmMPEXLeufCKLiyL3zpvfz
         t/17WnfXiJsIbF3Z7rknKpHwAz1b5O7+exjv/QdmvG1Mn2knADV321AIyWQGkmdTV7bT
         c6PjCWKXvIeIQ/E0HHqWAKR22KcSy4tcWfLPnm8zxW57omxqnDjkZc8jcRmzeR/RgswX
         X2ff1SraugpVtBsrobqEOFhhH+K/fSsdmvcNKWRx8SBOPdWkRriKR/TgdbPWv9nQo2KS
         sBBLjrcgNZ0klKcQ0Dt3B7Nx2VCTYEg3XEO+W0VWlRT81LLIstXqdzwwqGM/IZEWLuSP
         aQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ab+7WbbGf5PhIxhkR1bg6m+bqcq4jiWui2KFmmYCI+8=;
        b=O8YNp5oTZsWmZJ5sICBp1bRK++JTkHrJAKqQqEuSkbOnDv4scP3InPZdb1fY61FZoJ
         zPJ4jclo12v211sDco1baeawuthuTvJfGWOHxi3/LKs/PMqkeYSqjKxVYboWYbntPzqL
         n0kHjHe7F6iaBUfmeXI1ttItvrvmHYErN7p8xff//k3sSNOgn0PMLF7LJTxnbo2f3y8q
         OmzHzahklqBtVJbMb3sy92YZSCq8nSTv2/yaeug/mrqXjVxGkXEfOsGaSYw5MIfuu/VC
         S1DPAIzeWeeX/kxyBj3tvMmk5yjOAeN7qOywr91nkxGMDN2w3U2l4k1axbbDpzozDw5j
         KqgA==
X-Gm-Message-State: APjAAAWSY8eGzekZW1j5fGOCpfpnM+xzNmgmc8KI9U0dUNVXIGRmpb3f
        Ns3lLEDTlyY4/PeFlDA8rtRsuqOB
X-Google-Smtp-Source: APXvYqz9tSqsbyB3xUAbblCgqlwCQphGUOZUA5FiLpVMO/kemEdLUrtYPEVsdoyu7QbxQv79qxcx5Q==
X-Received: by 2002:a1c:f102:: with SMTP id p2mr7537469wmh.60.1560520968459;
        Fri, 14 Jun 2019 07:02:48 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id t15sm2859004wrx.84.2019.06.14.07.02.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 07:02:47 -0700 (PDT)
Subject: Re: [PATCH 1/2] clocksource: tegra: Use rating when registering clock
 source
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <8ff5d2da-907e-611c-ec82-bbe50197c2f4@gmail.com>
 <20190614132253.GE15526@ulmo>
 <3c339341-e77a-38aa-702a-1aef6c229eed@gmail.com>
 <20190614135353.GH15526@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <286cb0b7-1c8a-1a61-517e-1a9eee08e614@gmail.com>
Date:   Fri, 14 Jun 2019 17:02:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614135353.GH15526@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

14.06.2019 16:53, Thierry Reding пишет:
> On Fri, Jun 14, 2019 at 04:29:17PM +0300, Dmitry Osipenko wrote:
>> 14.06.2019 16:22, Thierry Reding пишет:
>>> On Fri, Jun 14, 2019 at 03:24:07PM +0300, Dmitry Osipenko wrote:
>>>> 14.06.2019 13:47, Thierry Reding пишет:
>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>
>>>>> The rating is parameterized depending on SoC generation to make sure it
>>>>> takes precedence on implementations where the architected timer can't be
>>>>> used. This rating is already used for the clock event device. Use the
>>>>> same rating for the clock source to be consistent.
>>>>>
>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>>> ---
>>>>>  drivers/clocksource/timer-tegra.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
>>>>> index f6a8eb0d7322..e6608141cccb 100644
>>>>> --- a/drivers/clocksource/timer-tegra.c
>>>>> +++ b/drivers/clocksource/timer-tegra.c
>>>>> @@ -318,7 +318,7 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
>>>>>  	sched_clock_register(tegra_read_sched_clock, 32, TIMER_1MHz);
>>>>>  
>>>>>  	ret = clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
>>>>> -				    "timer_us", TIMER_1MHz, 300, 32,
>>>>> +				    "timer_us", TIMER_1MHz, rating, 32,
>>>>>  				    clocksource_mmio_readl_up);
>>>>>  	if (ret)
>>>>>  		pr_err("failed to register clocksource: %d\n", ret);
>>>>>
>>>>
>>>> Looks good. Although, could you please clarify whether arch-timer stops on T210 when CPU
>>>> enters deepest (powerdown) idle state? I'm starting to lose track a bit already. Because
>>>> if arch-timer stops in the deepest idle state, then it's a bit odd that Joseph didn't add
>>>> the clocksource for T210 in the first place and v5.1 probably shouldn't work well because
>>>> of that already.
>>>
>>> Yes, the architected timer doesn't work across an SC7 (which is what the
>>> deepest idle state is called on Tegra210) transition, hence why we can't
>>> use it as a suspend clocksource. I actually sent out a patch to do that,
>>> earlier.
>>>
>>> And yes, it's entirely possible that v5.1 doesn't work in this regard,
>>> but we're not noticing that because we don't have suspend/resume support
>>> for Tegra210 anyway. There are a couple of missing pieces that we need
>>> in order to make it work.
>>>
>>> This change in particular is only going to affect the CPU idle state
>>> (CC7). Since the architected timer doesn't survive that either, we need
>>> the Tegra timer to be preferred over the architected timer for normal
>>> operation.
>>>
>>> All of these issues go away on Tegra186 and later, where the architected
>>> timer is in an always-on partition and has a PLL that remains on during
>>> SC7 (and CC7).
>>
>> Thank you very much for the clarification. But then what about the
>> sched_clock? I suppose sched_clock will suffer on T210 as well and it's
>> a bit trickier case because apparently arch-timer always wins since it
>> has a higher precision. I guess the best solution will be to just bail
>> out from arch-timer's driver probe in a case of T210.
>>
>> if (of_machine_is_compatible("nvidia,tegra210"))
>> 	return 0.
> 
> I don't think there's any issue with the scheduler clock on Tegra210.
> Before the CPU can be turned off, all tasks scheduled on that CPU have
> to be migrated to another CPU, right? Conversely, before any tasks can
> be scheduled on a CPU that CPU needs to be brought online, at which
> point the architected timer should work fine again.

Is SC7 a CPU-idle state that cpuidle driver may enter or it's a
system-wide suspend state? It's still not clear to me.
