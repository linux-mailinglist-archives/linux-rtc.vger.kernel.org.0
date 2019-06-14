Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1FE345F68
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2019 15:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728713AbfFNNtu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Jun 2019 09:49:50 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34037 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728369AbfFNNtt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Jun 2019 09:49:49 -0400
Received: by mail-lf1-f68.google.com with SMTP id y198so1820242lfa.1;
        Fri, 14 Jun 2019 06:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bx0oK5iXDXAR0ACHKVc3wkvY2oc5wIxpV3aMMzcLoWk=;
        b=IxJRP9SIWSFqDuzRlmodYsVoykZppSz5c4MwdiXpmbrSEYoOYKbrNWQo7kX54C8M/y
         +vOLErSIt1cJU/Muq+d9DOdaC1bxFSt8lR9Is1nhb8fIsuJlSLC9J7PLVqYnmBiaxSID
         XSOW+fmCa5cWbR2aXGueawVcmRsnBGfUZ20jGAkpJR4Fo4R2TNk09EtMgrjr9QWA5nta
         fEzXtG/KkXW81LAVMdskL7VReCgtXn8Nl/AKTGljiGcqjx0Qjcv6cTex5VSqMD85KDud
         B9iSMIxW8xhPTumsV2qTIoDrm4pYpDAqtTm7RbHYbyFWiEjHvdDW0myjQ+8Oy9dLiw7Y
         Plyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bx0oK5iXDXAR0ACHKVc3wkvY2oc5wIxpV3aMMzcLoWk=;
        b=BphidraXCtC6dETC2N2vS+3kMZ380x53xSXkhfl1Fa60ffZPDpELxJX88OiWZlBF+Z
         067LHCH3HAEHJ695QWa2ikwxupweXmX/6uOHLJwf12Lnrhpx+yaQBA+4m8ZV3g/zPWRR
         esRhaQBv6TF9S2GlLBcoKjoLYg7HzTxRaVEoGYjKjoPcjn++zxpXE58I8KzAxRSAXVQM
         F6/lL0+PdxdbfqCcYDTuA22Ejt1ZpdFdDT19aWPQ9s1axLza7drTpcSuSsQvo3lqbx4Z
         U4pYYUd5YU9qedXWXZLtvQzeHshDkEi5fUfBskAdhYdxhxAKw0h5Io0tx38GBzYvxBFw
         WN/A==
X-Gm-Message-State: APjAAAUHO90ztHBWej6WboinO6yOEADHcW3ohDLJy5SOhNYN49xlm6pH
        wlU3tRH2+X1g32wF0NgfBqRGKZhH
X-Google-Smtp-Source: APXvYqwKS9/E7DpuXAU81U6CB3YYhLKCUfQ9+07i9WPwAlNNxVs3ioDZO6RllpBUElOLbvtiTrjyBw==
X-Received: by 2002:a19:9f84:: with SMTP id i126mr48172391lfe.142.1560520185830;
        Fri, 14 Jun 2019 06:49:45 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id q7sm664113ljc.45.2019.06.14.06.49.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 06:49:45 -0700 (PDT)
Subject: Re: [PATCH 2/2] rtc: tegra: Implement suspend clock source
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <20190614104747.19712-2-thierry.reding@gmail.com>
 <5a00bccf-6542-51bd-9030-99a59f14f2f9@gmail.com>
 <20190614134110.GF15526@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d9b65fd9-ecad-b241-a0d6-251a648488aa@gmail.com>
Date:   Fri, 14 Jun 2019 16:49:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614134110.GF15526@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

14.06.2019 16:41, Thierry Reding пишет:
> On Fri, Jun 14, 2019 at 03:01:13PM +0300, Dmitry Osipenko wrote:
>> 14.06.2019 13:47, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> The suspend clock source for Tegra210 and earlier is currently
>>> implemented in the Tegra timer driver. However, the suspend clock source
>>> code accesses registers that are part of the RTC hardware block, so both
>>> can step on each others' toes. In practice this isn't an issue, but
>>> there is no reason why the RTC driver can't implement the clock source,
>>> so move the code over to the tegra-rtc driver.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  drivers/clocksource/timer-tegra.c | 44 -------------------------------
>>>  drivers/rtc/rtc-tegra.c           | 42 +++++++++++++++++++++++++++++
>>>  2 files changed, 42 insertions(+), 44 deletions(-)
>>>
>>> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
>>> index e6608141cccb..87eac618924d 100644
>>> --- a/drivers/clocksource/timer-tegra.c
>>> +++ b/drivers/clocksource/timer-tegra.c
>>> @@ -21,10 +21,6 @@
>>>  
>>>  #include "timer-of.h"
>>>  
>>> -#define RTC_SECONDS		0x08
>>> -#define RTC_SHADOW_SECONDS	0x0c
>>> -#define RTC_MILLISECONDS	0x10
>>> -
>>>  #define TIMERUS_CNTR_1US	0x10
>>>  #define TIMERUS_USEC_CFG	0x14
>>>  #define TIMERUS_CNTR_FREEZE	0x4c
>>> @@ -164,34 +160,6 @@ static struct delay_timer tegra_delay_timer = {
>>>  };
>>>  #endif
>>>  
>>> -static struct timer_of suspend_rtc_to = {
>>> -	.flags = TIMER_OF_BASE | TIMER_OF_CLOCK,
>>> -};
>>> -
>>> -/*
>>> - * tegra_rtc_read - Reads the Tegra RTC registers
>>> - * Care must be taken that this function is not called while the
>>> - * tegra_rtc driver could be executing to avoid race conditions
>>> - * on the RTC shadow register
>>> - */
>>> -static u64 tegra_rtc_read_ms(struct clocksource *cs)
>>> -{
>>> -	void __iomem *reg_base = timer_of_base(&suspend_rtc_to);
>>> -
>>> -	u32 ms = readl_relaxed(reg_base + RTC_MILLISECONDS);
>>> -	u32 s = readl_relaxed(reg_base + RTC_SHADOW_SECONDS);
>>> -
>>> -	return (u64)s * MSEC_PER_SEC + ms;
>>> -}
>>> -
>>> -static struct clocksource suspend_rtc_clocksource = {
>>> -	.name	= "tegra_suspend_timer",
>>> -	.rating	= 200,
>>> -	.read	= tegra_rtc_read_ms,
>>> -	.mask	= CLOCKSOURCE_MASK(32),
>>> -	.flags	= CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_SUSPEND_NONSTOP,
>>> -};
>>> -
>>>  static inline unsigned int tegra_base_for_cpu(int cpu, bool tegra20)
>>>  {
>>>  	if (tegra20) {
>>> @@ -385,15 +353,3 @@ static int __init tegra20_init_timer(struct device_node *np)
>>>  	return tegra_init_timer(np, true, rating);
>>>  }
>>>  TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_timer);
>>> -
>>> -static int __init tegra20_init_rtc(struct device_node *np)
>>> -{
>>> -	int ret;
>>> -
>>> -	ret = timer_of_init(np, &suspend_rtc_to);
>>> -	if (ret)
>>> -		return ret;
>>> -
>>> -	return clocksource_register_hz(&suspend_rtc_clocksource, 1000);
>>> -}
>>> -TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
>>> diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
>>> index 8fa1b3febf69..6da54264a27a 100644
>>> --- a/drivers/rtc/rtc-tegra.c
>>> +++ b/drivers/rtc/rtc-tegra.c
>>> @@ -6,6 +6,7 @@
>>>   */
>>>  
>>>  #include <linux/clk.h>
>>> +#include <linux/clocksource.h>
>>>  #include <linux/delay.h>
>>>  #include <linux/init.h>
>>>  #include <linux/io.h>
>>> @@ -52,8 +53,15 @@ struct tegra_rtc_info {
>>>  	struct clk *clk;
>>>  	int irq; /* alarm and periodic IRQ */
>>>  	spinlock_t lock;
>>> +
>>> +	struct clocksource clksrc;
>>>  };
>>>  
>>> +static struct tegra_rtc_info *to_tegra_rtc(struct clocksource *clksrc)
>>> +{
>>> +	return container_of(clksrc, struct tegra_rtc_info, clksrc);
>>> +}
>>> +
>>>  /*
>>>   * RTC hardware is busy when it is updating its values over AHB once every
>>>   * eight 32 kHz clocks (~250 us). Outside of these updates the CPU is free to
>>> @@ -268,6 +276,17 @@ static const struct rtc_class_ops tegra_rtc_ops = {
>>>  	.alarm_irq_enable = tegra_rtc_alarm_irq_enable,
>>>  };
>>>  
>>> +static u64 tegra_rtc_read_ms(struct clocksource *clksrc)
>>> +{
>>> +	struct tegra_rtc_info *info = to_tegra_rtc(clksrc);
>>> +	u32 ms, s;
>>> +
>>> +	ms = readl_relaxed(info->base + TEGRA_RTC_REG_MILLI_SECONDS);
>>> +	s = readl_relaxed(info->base + TEGRA_RTC_REG_SHADOW_SECONDS);
>>> +
>>> +	return (u64)s * MSEC_PER_SEC + ms;
>>> +}
>>> +
>>>  static const struct of_device_id tegra_rtc_dt_match[] = {
>>>  	{ .compatible = "nvidia,tegra20-rtc", },
>>>  	{}
>>> @@ -339,6 +358,28 @@ static int tegra_rtc_probe(struct platform_device *pdev)
>>>  		goto disable_clk;
>>>  	}
>>>  
>>> +	/*
>>> +	 * The Tegra RTC is the only reliable clock source that persists
>>> +	 * across an SC7 transition (VDD_CPU and VDD_CORE off) on Tegra210
>>> +	 * and earlier. Starting with Tegra186, the ARM v8 architected timer
>>> +	 * is in an always on power partition and its reference clock keeps
>>> +	 * running during SC7. Therefore, we technically don't need to have
>>> +	 * the RTC register as a clock source on Tegra186 and later, but it
>>> +	 * doesn't hurt either, so we just register it unconditionally here.
>>> +	 */
>>> +	info->clksrc.name = "tegra_rtc";
>>> +	info->clksrc.rating = 200;
>>> +	info->clksrc.read = tegra_rtc_read_ms;
>>> +	info->clksrc.mask = CLOCKSOURCE_MASK(32);
>>
>> Hm.. shouldn't this be CLOCKSOURCE_MASK(52)? Given that there are 32 bits for seconds and
>> 10bits for milliseconds.
> 
> Did you mean to say CLOCKSOURCE_MASK(42)? Yeah, that's probably better
> here.

Yes, 42 :)
