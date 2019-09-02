Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B547EA5489
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Sep 2019 12:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731133AbfIBK5x (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 Sep 2019 06:57:53 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:57433 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730702AbfIBK5w (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 2 Sep 2019 06:57:52 -0400
Received: from p5de0b6c5.dip0.t-ipconnect.de ([93.224.182.197] helo=nanos)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1i4k1s-0003AW-Ei; Mon, 02 Sep 2019 12:57:48 +0200
Date:   Mon, 2 Sep 2019 12:57:47 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
cc:     Michael <michael@mipisi.de>, linux-rtc@vger.kernel.org,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: Problem when function alarmtimer_suspend returns 0 if time delta
 is zero
In-Reply-To: <20190902074917.GA21922@piout.net>
Message-ID: <alpine.DEB.2.21.1909021247250.3955@nanos.tec.linutronix.de>
References: <S1728511AbfHaSEm/20190831180442Z+580@vger.kernel.org> <08fbdf25-faa1-aa13-4f13-d30acbf27dda@mipisi.de> <20190902074917.GA21922@piout.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Michael,

On Mon, 2 Sep 2019, Alexandre Belloni wrote:
> On 31/08/2019 20:32:06+0200, Michael wrote:
> > currently I have a problem with the alarmtimer i'm using to cyclically wake
> > up my i.MX6 ULL board from suspend to RAM.
> > 
> > The problem is that in principle the timer wake ups work fine but seem to be
> > not 100% stable. In about 1 percent the wake up alarm from suspend is
> > missing.

> > In my error case the alarm wake up always fails if the path "if(min==0)" is
> > entered. If I understand this code correctly that means that
> > when ever one of the timers in the list has a remaining tick time of zero,
> > the function just returns 0 and continues the suspend process until
> > it reaches suspend mode.

No. That code is simply broken because it tries to handle the case where a
alarmtimer nanosleep got woken up by the freezer. That's broken because it
makes the delta = 0 assumption which leads to the issue you discovered.

That whole cruft can be removed by switching alarmtimer nanosleep to use
freezable_schedule(). That keeps the timer queued and avoids all the issues.

Completely untested patch below.

Thanks,

	tglx

8<----------------------

kernel/time/alarmtimer.c |   57 +++--------------------------------------------
 1 file changed, 4 insertions(+), 53 deletions(-)

--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -46,14 +46,6 @@ static struct alarm_base {
 	clockid_t		base_clockid;
 } alarm_bases[ALARM_NUMTYPE];
 
-#if defined(CONFIG_POSIX_TIMERS) || defined(CONFIG_RTC_CLASS)
-/* freezer information to handle clock_nanosleep triggered wakeups */
-static enum alarmtimer_type freezer_alarmtype;
-static ktime_t freezer_expires;
-static ktime_t freezer_delta;
-static DEFINE_SPINLOCK(freezer_delta_lock);
-#endif
-
 #ifdef CONFIG_RTC_CLASS
 static struct wakeup_source *ws;
 
@@ -241,19 +233,12 @@ EXPORT_SYMBOL_GPL(alarm_expires_remainin
  */
 static int alarmtimer_suspend(struct device *dev)
 {
-	ktime_t min, now, expires;
+	ktime_t now, expires, min = KTIME_MAX;
 	int i, ret, type;
 	struct rtc_device *rtc;
 	unsigned long flags;
 	struct rtc_time tm;
 
-	spin_lock_irqsave(&freezer_delta_lock, flags);
-	min = freezer_delta;
-	expires = freezer_expires;
-	type = freezer_alarmtype;
-	freezer_delta = 0;
-	spin_unlock_irqrestore(&freezer_delta_lock, flags);
-
 	rtc = alarmtimer_get_rtcdev();
 	/* If we have no rtcdev, just return */
 	if (!rtc)
@@ -271,13 +256,13 @@ static int alarmtimer_suspend(struct dev
 		if (!next)
 			continue;
 		delta = ktime_sub(next->expires, base->gettime());
-		if (!min || (delta < min)) {
+		if (delta < min) {
 			expires = next->expires;
 			min = delta;
 			type = i;
 		}
 	}
-	if (min == 0)
+	if (min == KTIME_MAX)
 		return 0;
 
 	if (ktime_to_ns(min) < 2 * NSEC_PER_SEC) {
@@ -479,38 +464,6 @@ u64 alarm_forward_now(struct alarm *alar
 EXPORT_SYMBOL_GPL(alarm_forward_now);
 
 #ifdef CONFIG_POSIX_TIMERS
-
-static void alarmtimer_freezerset(ktime_t absexp, enum alarmtimer_type type)
-{
-	struct alarm_base *base;
-	unsigned long flags;
-	ktime_t delta;
-
-	switch(type) {
-	case ALARM_REALTIME:
-		base = &alarm_bases[ALARM_REALTIME];
-		type = ALARM_REALTIME_FREEZER;
-		break;
-	case ALARM_BOOTTIME:
-		base = &alarm_bases[ALARM_BOOTTIME];
-		type = ALARM_BOOTTIME_FREEZER;
-		break;
-	default:
-		WARN_ONCE(1, "Invalid alarm type: %d\n", type);
-		return;
-	}
-
-	delta = ktime_sub(absexp, base->gettime());
-
-	spin_lock_irqsave(&freezer_delta_lock, flags);
-	if (!freezer_delta || (delta < freezer_delta)) {
-		freezer_delta = delta;
-		freezer_expires = absexp;
-		freezer_alarmtype = type;
-	}
-	spin_unlock_irqrestore(&freezer_delta_lock, flags);
-}
-
 /**
  * clock2alarm - helper that converts from clockid to alarmtypes
  * @clockid: clockid.
@@ -715,7 +668,7 @@ static int alarmtimer_do_nsleep(struct a
 		set_current_state(TASK_INTERRUPTIBLE);
 		alarm_start(alarm, absexp);
 		if (likely(alarm->data))
-			schedule();
+			freezable_schedule();
 
 		alarm_cancel(alarm);
 	} while (alarm->data && !signal_pending(current));
@@ -727,8 +680,6 @@ static int alarmtimer_do_nsleep(struct a
 	if (!alarm->data)
 		return 0;
 
-	if (freezing(current))
-		alarmtimer_freezerset(absexp, type);
 	restart = &current->restart_block;
 	if (restart->nanosleep.type != TT_NONE) {
 		struct timespec64 rmt;
