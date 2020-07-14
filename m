Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 522BD21F5A6
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jul 2020 17:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgGNPET (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Jul 2020 11:04:19 -0400
Received: from foss.arm.com ([217.140.110.172]:37904 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbgGNPET (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 14 Jul 2020 11:04:19 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C93D430E;
        Tue, 14 Jul 2020 08:04:18 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E13C53F792;
        Tue, 14 Jul 2020 08:04:17 -0700 (PDT)
References: <20200714124556.20294-1-sudeep.holla@arm.com>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] rtc: pl031: fix set_alarm by adding back call to alarm_irq_enable
In-reply-to: <20200714124556.20294-1-sudeep.holla@arm.com>
Date:   Tue, 14 Jul 2020 16:04:08 +0100
Message-ID: <jhjo8oijfyv.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On 14/07/20 13:45, Sudeep Holla wrote:
> Commit c8ff5841a90b ("rtc: pl031: switch to rtc_time64_to_tm/rtc_tm_to_time64")
> seemed to have accidentally removed the call to pl031_alarm_irq_enable
> from pl031_set_alarm while switching to 64-bit apis.
>
> Let us add back the same to get the set alarm functionality back.
>
> Fixes: c8ff5841a90b ("rtc: pl031: switch to rtc_time64_to_tm/rtc_tm_to_time64")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Thanks for looking into this!

CONFIG_TEST_SUSPEND with test_suspend=mem now behaves correctly (i.e. comes
back out of suspend), and

  $ rtcwake -d /dev/rtc0 -s 2 -m no

shows an increase in RTC interrupts (which remains at 0 before this patch).

Tested-by: Valentin Schneider <valentin.schneider@arm.com>

> ---
>  drivers/rtc/rtc-pl031.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
> index 40d7450a1ce4..c6b89273feba 100644
> --- a/drivers/rtc/rtc-pl031.c
> +++ b/drivers/rtc/rtc-pl031.c
> @@ -275,6 +275,7 @@ static int pl031_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>       struct pl031_local *ldata = dev_get_drvdata(dev);
>
>       writel(rtc_tm_to_time64(&alarm->time), ldata->base + RTC_MR);
> +	pl031_alarm_irq_enable(dev, alarm->enabled);
>
>       return 0;
>  }
