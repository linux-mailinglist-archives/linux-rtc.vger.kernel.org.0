Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0713B45CBD
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2019 14:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727637AbfFNMYM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Jun 2019 08:24:12 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44693 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbfFNMYM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Jun 2019 08:24:12 -0400
Received: by mail-lf1-f66.google.com with SMTP id r15so1584487lfm.11;
        Fri, 14 Jun 2019 05:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=o4Nl8rjY2UzCouAOHPI/9INbLAzUgRaKqvtMbrkxiws=;
        b=WLambb/Vy6vYSOJ9jXU5eoOBs/rxyVa0+iG3a+RAAWyIuZobL2o1aDDlXtLJCmJQjA
         5V24joWsquKYP5GyQ1X8cda41MAWkdyARRj7ERRc7E/KI4bTstKdAvFkTQsZe/KMJO0X
         zkiX4BEdyZEgVyCOFjUPOf2X1jK8CyZpvDrz433VQD0clF0fMYDyWlBISdYaXZ90GG4H
         +5NUF8qv4Sa5VXP8uNKYDcUpXYayjzIGTqrWlmJrrM4s0PnN/pT5SyOWYz4WVAfbZrOZ
         vy3F9ipID7w1lvwMFIyruBjmeJXqsyV1G4yWpnIMpHSE0byeLXW2k5AKZUT02v8F+uGT
         YdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=o4Nl8rjY2UzCouAOHPI/9INbLAzUgRaKqvtMbrkxiws=;
        b=RW+WQYMNZ/zjtBHJFxATSm/ePvgfTtAAvEA/wTttM/o0TRyEmt1srSKfoEezwebRCF
         Z3nceusLFfWyzuJbmh40uWib/tet6I258Fkk7s86mB+5Wm4JTBoKnZfKFq25ExFk/lB6
         PzvMlEa3Cqntq8E8+SkPgoysSP8EVjcxWNa+96Ck9tOpsaSRlT/x/TL7uen4dMxUOwk1
         Rkx4oG533fci9XYHaUmunwX8CgPiOBG23Y447e9zpA0zy1U69AiF875RX7KtXUCTj6Qx
         sARAUktB+MWudzHY58IN7ApMILUHUmxn8t9I8WupI4k0gfZutUvva6sS3tT1nHpSRUpb
         WjbA==
X-Gm-Message-State: APjAAAWS0pLWh7/jJCa6q0Myu4Q3J5zzy1K2p5fGEKUkoqrfbFWA3sz9
        IyzgFubcjJ8zzjGPm8+Q6fH2LyD7
X-Google-Smtp-Source: APXvYqzOMXpsfHkDgK1K1A9K/9ExirOTklRHlG8QbOcQAjHjs/mt/qh4wUF+bfWc+gB1lFtdb4GJoA==
X-Received: by 2002:a19:5e4e:: with SMTP id z14mr30643718lfi.11.1560515049076;
        Fri, 14 Jun 2019 05:24:09 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id 24sm629708ljs.63.2019.06.14.05.24.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 05:24:08 -0700 (PDT)
Subject: Re: [PATCH 1/2] clocksource: tegra: Use rating when registering clock
 source
To:     Thierry Reding <thierry.reding@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190614104747.19712-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8ff5d2da-907e-611c-ec82-bbe50197c2f4@gmail.com>
Date:   Fri, 14 Jun 2019 15:24:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614104747.19712-1-thierry.reding@gmail.com>
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
> The rating is parameterized depending on SoC generation to make sure it
> takes precedence on implementations where the architected timer can't be
> used. This rating is already used for the clock event device. Use the
> same rating for the clock source to be consistent.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clocksource/timer-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
> index f6a8eb0d7322..e6608141cccb 100644
> --- a/drivers/clocksource/timer-tegra.c
> +++ b/drivers/clocksource/timer-tegra.c
> @@ -318,7 +318,7 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
>  	sched_clock_register(tegra_read_sched_clock, 32, TIMER_1MHz);
>  
>  	ret = clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
> -				    "timer_us", TIMER_1MHz, 300, 32,
> +				    "timer_us", TIMER_1MHz, rating, 32,
>  				    clocksource_mmio_readl_up);
>  	if (ret)
>  		pr_err("failed to register clocksource: %d\n", ret);
> 

Looks good. Although, could you please clarify whether arch-timer stops on T210 when CPU
enters deepest (powerdown) idle state? I'm starting to lose track a bit already. Because
if arch-timer stops in the deepest idle state, then it's a bit odd that Joseph didn't add
the clocksource for T210 in the first place and v5.1 probably shouldn't work well because
of that already.
