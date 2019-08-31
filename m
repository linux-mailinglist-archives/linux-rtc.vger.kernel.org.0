Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81E3BA45CB
	for <lists+linux-rtc@lfdr.de>; Sat, 31 Aug 2019 20:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbfHaSiv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 31 Aug 2019 14:38:51 -0400
Received: from schedar.uberspace.de ([185.26.156.41]:40680 "EHLO
        schedar.uberspace.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbfHaSiv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 31 Aug 2019 14:38:51 -0400
X-Greylist: delayed 401 seconds by postgrey-1.27 at vger.kernel.org; Sat, 31 Aug 2019 14:38:51 EDT
Received: (qmail 32212 invoked from network); 31 Aug 2019 18:32:06 -0000
Received: from localhost (HELO ?192.168.188.41?) (127.0.0.1)
  by schedar.uberspace.de with SMTP; 31 Aug 2019 18:32:06 -0000
To:     linux-rtc@vger.kernel.org
References: <S1728511AbfHaSEm/20190831180442Z+580@vger.kernel.org>
From:   Michael <michael@mipisi.de>
Subject: Problem when function alarmtimer_suspend returns 0 if time delta is
 zero
Message-ID: <08fbdf25-faa1-aa13-4f13-d30acbf27dda@mipisi.de>
Date:   Sat, 31 Aug 2019 20:32:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <S1728511AbfHaSEm/20190831180442Z+580@vger.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Dear members of the linux-rtc list,

currently I have a problem with the alarmtimer i'm using to cyclically 
wake up my i.MX6 ULL board from suspend to RAM.

The problem is that in principle the timer wake ups work fine but seem 
to be not 100% stable. In about 1 percent the wake up alarm from suspend 
is missing.

When I look at the code of alarmtimer in function alarmtimer_suspend 
(kernel/time/alarmtimer.c)
I find the following:

....

/* Find the soonest timer to expire*/

     for (i = 0; i < ALARM_NUMTYPE; i++) {
         struct alarm_base *base = &alarm_bases[i];
         struct timerqueue_node *next;
         ktime_t delta;

         spin_lock_irqsave(&base->lock, flags);
         next = timerqueue_getnext(&base->timerqueue);
         spin_unlock_irqrestore(&base->lock, flags);
         if (!next)
             continue;
         delta = ktime_sub(next->expires, base->gettime());
         if (!min || (delta < min)) {
             expires = next->expires;
             min = delta;
             type = i;
         }
     }
     if (min == 0)
         return 0;

     if (ktime_to_ns(min) < 2 * NSEC_PER_SEC) {
         __pm_wakeup_event(ws, 2 * MSEC_PER_SEC);
         return -EBUSY;
     }

In my error case the alarm wake up always fails if the path "if(min==0)" 
is entered. If I understand this code correctly that means that
when ever one of the timers in the list has a remaining tick time of 
zero, the function just returns 0 and continues the suspend process until
it reaches suspend mode.

If I implement a hack here "if(min == 0) {min = 1;}" and do not return, 
my system runs 100% ok, as the following -EBUSY path is hit.

So my question to you is: Why is there a check if min < 2 seconds and do 
a return -EBUSY here, but handle (min==0) differently?
Could there be some race condition here, where the function 
alarmtimer_suspend just returns 0 and shortly after this the alarmtimer 
expires
right before the RTC driver was able to allow the wake up interrupt?

If I look through the kernel versions I found the alarmtimer_suspend to 
be a very stable function, so I don't think there is anything wrong here.

But do you have a hint for me where else I could have a look to encircle 
the error?

Thank you very much!

Br,
Michael

