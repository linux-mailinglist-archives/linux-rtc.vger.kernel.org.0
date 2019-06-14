Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF69445C00
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2019 14:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbfFNMBU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Jun 2019 08:01:20 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35881 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727217AbfFNMBT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Jun 2019 08:01:19 -0400
Received: by mail-lj1-f196.google.com with SMTP id i21so2138546ljj.3;
        Fri, 14 Jun 2019 05:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lR5T2KEXeq4XOGHFq7lbjCsRJwpC8An/gfBQ0DcAcEE=;
        b=E426t4VpCICDnCXtg1HYnBEey+inwBiDwI5lelEkO65Q6IvL5MIGlDA3P3AZmBw3nH
         5DKawA+ypSYn12VtOASLhfAHeauczRCZAH9RmtEDGtsUdUSr50W8O5QwUiVe1QOFMfEa
         5rEevXTHZlBw54VuV90BxxtrEodpxgjID3M5Yur33Zgkc5Pd8C9JkooSP1KzG9xqMSng
         gftm2gPElKsM8bCWa6GG8y3YhJUhHdtcvop8PbR1XbQVEtIki25CRs9cntmM2pGoo93J
         BMsnRyLMPzOIa0oeuyITjzlFoUbd/MG82Wtn9hwqwhphgDgtsul1n3uwcihC/KWFIqXB
         513w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lR5T2KEXeq4XOGHFq7lbjCsRJwpC8An/gfBQ0DcAcEE=;
        b=mfOEpbQpwubqMFg09C87aXVK3no6XDHEmZ28bIGWHhNtMb7SiKIXR6lTDvUa/z6vhq
         KikiQSfJwyMfhWqmNvKJB70F4nnuQ9cdbKj0zw1EY+lSOxdMGpx5nYA1xDRgiE410IW6
         FqzWkKF/4FtcBguQYoUnjZFk/9h+W/C/C+1SApYoNYsH1rJyehVVH6DZRi9tjStR3wEs
         5jpCt5FireHcAPLO+uv69CjZXOl/F9mETk6Judm56KbAE9RDR0c1alMcjbp5Agaa38SV
         ADR39fnphC4B+nsyknqRqNvYaafBPHHtWEyw9j8aLXLg0Dmv/G0ySE0zBujO1I9Jx5jj
         Vu9A==
X-Gm-Message-State: APjAAAXAfeJ4lqdKSeGvhxJxR84ioxB/Fe30bUJtU9a7CwJkYonEK9XZ
        Y+7xzAT2uUcbK20pw6F58SM9EhsI
X-Google-Smtp-Source: APXvYqzZX4jYaTq4tl4648ISLt2u3ySc0fu1RXT6uZuTHep+24pcOdI2hEH2+aSsqiFCFVI0/Qbnag==
X-Received: by 2002:a2e:81c4:: with SMTP id s4mr39563270ljg.182.1560513675878;
        Fri, 14 Jun 2019 05:01:15 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id t21sm444989lfd.85.2019.06.14.05.01.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 05:01:14 -0700 (PDT)
Subject: Re: [PATCH 2/2] rtc: tegra: Implement suspend clock source
To:     Thierry Reding <thierry.reding@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <20190614104747.19712-2-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5a00bccf-6542-51bd-9030-99a59f14f2f9@gmail.com>
Date:   Fri, 14 Jun 2019 15:01:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614104747.19712-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

14.06.2019 13:47, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The suspend clock source for Tegra210 and earlier is currently
> implemented in the Tegra timer driver. However, the suspend clock source
> code accesses registers that are part of the RTC hardware block, so both
> can step on each others' toes. In practice this isn't an issue, but
> there is no reason why the RTC driver can't implement the clock source,
> so move the code over to the tegra-rtc driver.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clocksource/timer-tegra.c | 44 -------------------------------
>  drivers/rtc/rtc-tegra.c           | 42 +++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
> index e6608141cccb..87eac618924d 100644
> --- a/drivers/clocksource/timer-tegra.c
> +++ b/drivers/clocksource/timer-tegra.c
> @@ -21,10 +21,6 @@
>  
>  #include "timer-of.h"
>  
> -#define RTC_SECONDS		0x08
> -#define RTC_SHADOW_SECONDS	0x0c
> -#define RTC_MILLISECONDS	0x10
> -
>  #define TIMERUS_CNTR_1US	0x10
>  #define TIMERUS_USEC_CFG	0x14
>  #define TIMERUS_CNTR_FREEZE	0x4c
> @@ -164,34 +160,6 @@ static struct delay_timer tegra_delay_timer = {
>  };
>  #endif
>  
> -static struct timer_of suspend_rtc_to = {
> -	.flags = TIMER_OF_BASE | TIMER_OF_CLOCK,
> -};
> -
> -/*
> - * tegra_rtc_read - Reads the Tegra RTC registers
> - * Care must be taken that this function is not called while the
> - * tegra_rtc driver could be executing to avoid race conditions
> - * on the RTC shadow register
> - */
> -static u64 tegra_rtc_read_ms(struct clocksource *cs)
> -{
> -	void __iomem *reg_base = timer_of_base(&suspend_rtc_to);
> -
> -	u32 ms = readl_relaxed(reg_base + RTC_MILLISECONDS);
> -	u32 s = readl_relaxed(reg_base + RTC_SHADOW_SECONDS);
> -
> -	return (u64)s * MSEC_PER_SEC + ms;
> -}
> -
> -static struct clocksource suspend_rtc_clocksource = {
> -	.name	= "tegra_suspend_timer",
> -	.rating	= 200,
> -	.read	= tegra_rtc_read_ms,
> -	.mask	= CLOCKSOURCE_MASK(32),
> -	.flags	= CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_SUSPEND_NONSTOP,
> -};
> -
>  static inline unsigned int tegra_base_for_cpu(int cpu, bool tegra20)
>  {
>  	if (tegra20) {
> @@ -385,15 +353,3 @@ static int __init tegra20_init_timer(struct device_node *np)
>  	return tegra_init_timer(np, true, rating);
>  }
>  TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_timer);
> -
> -static int __init tegra20_init_rtc(struct device_node *np)
> -{
> -	int ret;
> -
> -	ret = timer_of_init(np, &suspend_rtc_to);
> -	if (ret)
> -		return ret;
> -
> -	return clocksource_register_hz(&suspend_rtc_clocksource, 1000);
> -}
> -TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
> diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
> index 8fa1b3febf69..6da54264a27a 100644
> --- a/drivers/rtc/rtc-tegra.c
> +++ b/drivers/rtc/rtc-tegra.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/clocksource.h>
>  #include <linux/delay.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
> @@ -52,8 +53,15 @@ struct tegra_rtc_info {
>  	struct clk *clk;
>  	int irq; /* alarm and periodic IRQ */
>  	spinlock_t lock;
> +
> +	struct clocksource clksrc;
>  };
>  
> +static struct tegra_rtc_info *to_tegra_rtc(struct clocksource *clksrc)
> +{
> +	return container_of(clksrc, struct tegra_rtc_info, clksrc);
> +}
> +
>  /*
>   * RTC hardware is busy when it is updating its values over AHB once every
>   * eight 32 kHz clocks (~250 us). Outside of these updates the CPU is free to
> @@ -268,6 +276,17 @@ static const struct rtc_class_ops tegra_rtc_ops = {
>  	.alarm_irq_enable = tegra_rtc_alarm_irq_enable,
>  };
>  
> +static u64 tegra_rtc_read_ms(struct clocksource *clksrc)
> +{
> +	struct tegra_rtc_info *info = to_tegra_rtc(clksrc);
> +	u32 ms, s;
> +
> +	ms = readl_relaxed(info->base + TEGRA_RTC_REG_MILLI_SECONDS);
> +	s = readl_relaxed(info->base + TEGRA_RTC_REG_SHADOW_SECONDS);
> +
> +	return (u64)s * MSEC_PER_SEC + ms;
> +}
> +
>  static const struct of_device_id tegra_rtc_dt_match[] = {
>  	{ .compatible = "nvidia,tegra20-rtc", },
>  	{}
> @@ -339,6 +358,28 @@ static int tegra_rtc_probe(struct platform_device *pdev)
>  		goto disable_clk;
>  	}
>  
> +	/*
> +	 * The Tegra RTC is the only reliable clock source that persists
> +	 * across an SC7 transition (VDD_CPU and VDD_CORE off) on Tegra210
> +	 * and earlier. Starting with Tegra186, the ARM v8 architected timer
> +	 * is in an always on power partition and its reference clock keeps
> +	 * running during SC7. Therefore, we technically don't need to have
> +	 * the RTC register as a clock source on Tegra186 and later, but it
> +	 * doesn't hurt either, so we just register it unconditionally here.
> +	 */
> +	info->clksrc.name = "tegra_rtc";
> +	info->clksrc.rating = 200;
> +	info->clksrc.read = tegra_rtc_read_ms;
> +	info->clksrc.mask = CLOCKSOURCE_MASK(32);

Hm.. shouldn't this be CLOCKSOURCE_MASK(52)? Given that there are 32 bits for seconds and
10bits for milliseconds.
