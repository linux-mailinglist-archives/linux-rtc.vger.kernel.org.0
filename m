Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB21B52F06C
	for <lists+linux-rtc@lfdr.de>; Fri, 20 May 2022 18:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347554AbiETQTt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 20 May 2022 12:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbiETQTs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 20 May 2022 12:19:48 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61AF384A05
        for <linux-rtc@vger.kernel.org>; Fri, 20 May 2022 09:19:47 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 984E8100007;
        Fri, 20 May 2022 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1653063586;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=twx5Nb38K4nE0qC7jQM3s5f/W4tlMVf9Nz1Y2ag8Kto=;
        b=isvkgAh5OhsVS0sJhO70VCoKvfzkvhx8WuAWDUAGCcQG5LLkHLZttFCG2pccv/s++2nuOK
        Mzqwpy35LJcc5n2Yjivv64C8/E1gmYgowdv15Ds5Z3meUYvH21eQpg/qMLdOLncvBUsBVz
        KTvBL8ZDq1BpBRzbkXV8UkL23dGZzyOFocrLO9Fn9QndV0eLW+V0ZU9yWYRmDIr3T6kQ19
        a9O48gYBA4hjsQgZyNueqAzAyKwogE1YuzU3Irt7J9XmF4NM4Wglzp+pQiNpFVmP6etbSc
        zYoRRR9pMs8eq7H/9CVh0fOfF1MQJw4TknbImwWZJZ3eGrwkSkJ2UIJhVDOcgQ==
Date:   Fri, 20 May 2022 18:19:44 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3] rtc: Avoid flush_scheduled_work() usage
Message-ID: <Yoe/oPW8MFZ02fEn@mail.local>
References: <febf3af2-ba49-fa40-4a25-e67b743cc421@I-love.SAKURA.ne.jp>
 <c96ea697-b4ea-7e34-1a6f-355561fb7e58@I-love.SAKURA.ne.jp>
 <ef8d46a0-bef8-f747-8f13-7ad4ec514cbf@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef8d46a0-bef8-f747-8f13-7ad4ec514cbf@I-love.SAKURA.ne.jp>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 20/05/2022 23:33:47+0900, Tetsuo Handa wrote:
> Flushing system-wide workqueues is dangerous and will be forbidden.
> Replace system_wq with local rtc_wq.
> 
> While we are at it, remove unused rtc_dev_exit().
> 
> Link: https://lkml.kernel.org/r/49925af7-78a8-a3dd-bce6-cfc02e1a9236@I-love.SAKURA.ne.jp
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
> Changes in v3:
>   Fix build error.
>   Forgot to replace flush_scheduled_work().
> 
> Changes in v2:
>   Remove unused rtc_dev_exit().
> 
> Since rtc_dev_init() is built into vmlinux, there is no point with
> recovery.
> 
> This patch blindly converts schedule_work() into queue_work() within
> drivers/rtc/dev.c, based on an assumption that none of work items
> outside of drivers/rtc/dev.c needs to be handled by rtc_wq.
> Did I convert correctly?
> 

Yes and no, this could be a bit more clever and create the workqueue
only for the devices that actually need it. I worked on something after
seeing your first email a while ago but I needed more time to test it.

>  drivers/rtc/dev.c      | 18 ++++++++----------
>  drivers/rtc/rtc-core.h |  5 -----
>  2 files changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
> index 69325aeede1a..a7346f03a5b2 100644
> --- a/drivers/rtc/dev.c
> +++ b/drivers/rtc/dev.c
> @@ -17,6 +17,7 @@
>  #include "rtc-core.h"
>  
>  static dev_t rtc_devt;
> +static struct workqueue_struct *rtc_wq;
>  
>  #define RTC_DEV_MAX 16 /* 16 RTCs should be enough for everyone... */
>  
> @@ -62,7 +63,7 @@ static void rtc_uie_task(struct work_struct *work)
>  		rtc->uie_timer_active = 1;
>  		rtc->uie_task_active = 0;
>  		add_timer(&rtc->uie_timer);
> -	} else if (schedule_work(&rtc->uie_task) == 0) {
> +	} else if (queue_work(rtc_wq, &rtc->uie_task) == 0) {
>  		rtc->uie_task_active = 0;
>  	}
>  	spin_unlock_irq(&rtc->irq_lock);
> @@ -78,7 +79,7 @@ static void rtc_uie_timer(struct timer_list *t)
>  	spin_lock_irqsave(&rtc->irq_lock, flags);
>  	rtc->uie_timer_active = 0;
>  	rtc->uie_task_active = 1;
> -	if ((schedule_work(&rtc->uie_task) == 0))
> +	if (queue_work(rtc_wq, &rtc->uie_task) == 0)
>  		rtc->uie_task_active = 0;
>  	spin_unlock_irqrestore(&rtc->irq_lock, flags);
>  }
> @@ -96,7 +97,7 @@ static int clear_uie(struct rtc_device *rtc)
>  		}
>  		if (rtc->uie_task_active) {
>  			spin_unlock_irq(&rtc->irq_lock);
> -			flush_scheduled_work();
> +			flush_workqueue(rtc_wq);
>  			spin_lock_irq(&rtc->irq_lock);
>  		}
>  		rtc->uie_irq_active = 0;
> @@ -119,7 +120,7 @@ static int set_uie(struct rtc_device *rtc)
>  		rtc->stop_uie_polling = 0;
>  		rtc->oldsecs = tm.tm_sec;
>  		rtc->uie_task_active = 1;
> -		if (schedule_work(&rtc->uie_task) == 0)
> +		if (queue_work(rtc_wq, &rtc->uie_task) == 0)
>  			rtc->uie_task_active = 0;
>  	}
>  	rtc->irq_data = 0;
> @@ -562,13 +563,10 @@ void __init rtc_dev_init(void)
>  {
>  	int err;
>  
> +	rtc_wq = alloc_workqueue("rtc_wq", 0, 0);
> +	BUG_ON(!rtc_wq);
> +
>  	err = alloc_chrdev_region(&rtc_devt, 0, RTC_DEV_MAX, "rtc");
>  	if (err < 0)
>  		pr_err("failed to allocate char dev region\n");
>  }
> -
> -void __exit rtc_dev_exit(void)
> -{
> -	if (rtc_devt)
> -		unregister_chrdev_region(rtc_devt, RTC_DEV_MAX);

This is very unrelated and should be in a different patch.

> -}
> diff --git a/drivers/rtc/rtc-core.h b/drivers/rtc/rtc-core.h
> index 0abf98983e13..4b10a1b8f370 100644
> --- a/drivers/rtc/rtc-core.h
> +++ b/drivers/rtc/rtc-core.h
> @@ -2,7 +2,6 @@
>  #ifdef CONFIG_RTC_INTF_DEV
>  
>  extern void __init rtc_dev_init(void);
> -extern void __exit rtc_dev_exit(void);
>  extern void rtc_dev_prepare(struct rtc_device *rtc);
>  
>  #else
> @@ -11,10 +10,6 @@ static inline void rtc_dev_init(void)
>  {
>  }
>  
> -static inline void rtc_dev_exit(void)
> -{
> -}
> -
>  static inline void rtc_dev_prepare(struct rtc_device *rtc)
>  {
>  }
> -- 
> 2.34.1
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
