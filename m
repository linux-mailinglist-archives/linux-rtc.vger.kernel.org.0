Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5249C24396C
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Aug 2020 13:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgHMLjK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 13 Aug 2020 07:39:10 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:32987 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgHMLjK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 13 Aug 2020 07:39:10 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 210E220008;
        Thu, 13 Aug 2020 11:39:07 +0000 (UTC)
Date:   Thu, 13 Aug 2020 13:39:06 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Amit Singh Tomar <amittomer25@gmail.com>
Cc:     andre.przywara@arm.com, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: pl031: enable rtc alarm interrupt again
Message-ID: <20200813113906.GL3480@piout.net>
References: <1597317268-19537-1-git-send-email-amittomer25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597317268-19537-1-git-send-email-amittomer25@gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

Thank you for your patch. However, this is already fixed upstream:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/rtc?id=4df2ef85f0efe44505f511ca5e4455585f53a2da

On 13/08/2020 16:44:28+0530, Amit Singh Tomar wrote:
> After commit c8ff5841a90b ("rtc: pl031: switch to rtc_time64_to_tm/
> rtc_tm_to_time64"), it has been observed the rtc alarm interrupt is
> no more registered, and due to this waking up the system
> (using rtc alarm interrupt) from suspend state is no longer possible.
> 
> Besides this, we get broken output from "hwclock".
> 
> root@localhost:~# hwclock
> hwclock: select() to /dev/rtc to wait for clock tick timed out: No such file or directory
> 
> This is due to the fact that call to pl031_alarm_irq_enable(dev, alarm->enabled)
> is removed (from pl031_set_alarm()) in commit c8ff5841a90b, and alarm interrupt
> never gets enabled.
> 
> This commit fixes it by re-introduces the missing
> pl031_alarm_irq_enable(dev, alarm->enabled).
> 
> Fixes: c8ff5841a90b ("rtc: pl031: switch to rtc_time64_to_tm/rtc_tm_to_time64")
> 
> Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
> ---
> This patch is tested on QEMU ARM64 TCG guest
> 
> Without this patch:
> root@localhost:~# echo +10 > /sys/class/rtc/rtc0/wakealarm && sleep 10 && cat /proc/interrupts | grep pl031
> 39:          0          0     GICv2  34 Level     rtc-pl031
> 
> With this patch:
> root@localhost:~# echo +10 > /sys/class/rtc/rtc0/wakealarm && sleep 10 && cat /proc/interrupts | grep pl031
> 39:          1          0     GICv2  34 Level     rtc-pl031
> 
> root@localhost:~# hwclock 
> Thu Aug 13 11:00:06 2020  -1.009351 seconds
> 
> root@localhost:~# echo +30 > /sys/class/rtc/rtc0/wakealarm
> root@localhost:~# echo -n mem > /sys/power/state
> root@localhost:~# hwclock -r
> Thu Aug 13 08:59:14 2020  -1.010357 seconds
> 
> ---
>  drivers/rtc/rtc-pl031.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
> index 40d7450a1ce4..c6b89273feba 100644
> --- a/drivers/rtc/rtc-pl031.c
> +++ b/drivers/rtc/rtc-pl031.c
> @@ -275,6 +275,7 @@ static int pl031_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>  	struct pl031_local *ldata = dev_get_drvdata(dev);
>  
>  	writel(rtc_tm_to_time64(&alarm->time), ldata->base + RTC_MR);
> +	pl031_alarm_irq_enable(dev, alarm->enabled);
>  
>  	return 0;
>  }
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
