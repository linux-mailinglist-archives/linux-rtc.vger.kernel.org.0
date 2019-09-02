Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9935CA5037
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Sep 2019 09:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729408AbfIBHtW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 Sep 2019 03:49:22 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:53025 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfIBHtW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 2 Sep 2019 03:49:22 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id F055260014;
        Mon,  2 Sep 2019 07:49:19 +0000 (UTC)
Date:   Mon, 2 Sep 2019 09:49:17 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Michael <michael@mipisi.de>
Cc:     linux-rtc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: Problem when function alarmtimer_suspend returns 0 if time delta
 is zero
Message-ID: <20190902074917.GA21922@piout.net>
References: <S1728511AbfHaSEm/20190831180442Z+580@vger.kernel.org>
 <08fbdf25-faa1-aa13-4f13-d30acbf27dda@mipisi.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08fbdf25-faa1-aa13-4f13-d30acbf27dda@mipisi.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Michael,

This code is maintained by the timekeeping maintainers, now in Cc and I
think John will be able to answer.

On 31/08/2019 20:32:06+0200, Michael wrote:
> Dear members of the linux-rtc list,
> 
> currently I have a problem with the alarmtimer i'm using to cyclically wake
> up my i.MX6 ULL board from suspend to RAM.
> 
> The problem is that in principle the timer wake ups work fine but seem to be
> not 100% stable. In about 1 percent the wake up alarm from suspend is
> missing.
> 
> When I look at the code of alarmtimer in function alarmtimer_suspend
> (kernel/time/alarmtimer.c)
> I find the following:
> 
> ....
> 
> /* Find the soonest timer to expire*/
> 
>     for (i = 0; i < ALARM_NUMTYPE; i++) {
>         struct alarm_base *base = &alarm_bases[i];
>         struct timerqueue_node *next;
>         ktime_t delta;
> 
>         spin_lock_irqsave(&base->lock, flags);
>         next = timerqueue_getnext(&base->timerqueue);
>         spin_unlock_irqrestore(&base->lock, flags);
>         if (!next)
>             continue;
>         delta = ktime_sub(next->expires, base->gettime());
>         if (!min || (delta < min)) {
>             expires = next->expires;
>             min = delta;
>             type = i;
>         }
>     }
>     if (min == 0)
>         return 0;
> 
>     if (ktime_to_ns(min) < 2 * NSEC_PER_SEC) {
>         __pm_wakeup_event(ws, 2 * MSEC_PER_SEC);
>         return -EBUSY;
>     }
> 
> In my error case the alarm wake up always fails if the path "if(min==0)" is
> entered. If I understand this code correctly that means that
> when ever one of the timers in the list has a remaining tick time of zero,
> the function just returns 0 and continues the suspend process until
> it reaches suspend mode.
> 
> If I implement a hack here "if(min == 0) {min = 1;}" and do not return, my
> system runs 100% ok, as the following -EBUSY path is hit.
> 
> So my question to you is: Why is there a check if min < 2 seconds and do a
> return -EBUSY here, but handle (min==0) differently?
> Could there be some race condition here, where the function
> alarmtimer_suspend just returns 0 and shortly after this the alarmtimer
> expires
> right before the RTC driver was able to allow the wake up interrupt?
> 
> If I look through the kernel versions I found the alarmtimer_suspend to be a
> very stable function, so I don't think there is anything wrong here.
> 
> But do you have a hint for me where else I could have a look to encircle the
> error?
> 
> Thank you very much!
> 
> Br,
> Michael
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
