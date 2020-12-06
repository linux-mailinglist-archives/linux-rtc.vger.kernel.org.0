Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 984B92D079A
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Dec 2020 23:08:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728236AbgLFWHk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 6 Dec 2020 17:07:40 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:60572 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728220AbgLFWH2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 6 Dec 2020 17:07:28 -0500
Message-Id: <20201206220542.062910520@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607292404;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=SOcKp1QN64CETieCyXt4dAPLg5lKlvhk0cMXEo1MelY=;
        b=WAFpgp0FiYhucNKoDFCNJPanys62G6xYvNv96oX0GlT/oYBpZijtqY10cvXN8dXLoAyvPC
        srDgIT/BWJIVU5BcgzzJ2fvWT81KBARoZinc0510nqvtLdhm9PQvMZU0e1Wl6EtCC2nh6S
        RcNG3xX2R0fIp4wxtWUcpM07DADnF8ML6ne3ToIiL4cBCthb1vN/r5UzNvtwnx/0qtRogN
        cs90z86i92rZT+VKO5oA/j/xgvku/Wgv0HJ89aQ2uwKUl3L3ufBVQ5LHEZwHOcWouSkfgq
        mucfsB3detX3izI5c0NCSXd3cgZ5Sq+mvaO7TMDHE5hL979UGd6ugPUzbjCeEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607292404;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=SOcKp1QN64CETieCyXt4dAPLg5lKlvhk0cMXEo1MelY=;
        b=khwXDleWHjwMw6Qfj82Ok999WIQYEzoK3dD/EUqCHWdBchCzCtsM7Wmonfmb/wUCHfJwFL
        U2ZAK8hsEg5ZZTBA==
Date:   Sun, 06 Dec 2020 22:46:18 +0100
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [patch 5/8] ntp: Make the RTC synchronization more reliable
References: <20201206214613.444124194@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Miroslav reported that the periodic RTC synchronization in the NTP code
fails more often than not to hit the specified update window.

The reason is that the code uses delayed_work to schedule the update which
needs to be in thread context as the underlying RTC might be connected via
a slow bus, e.g. I2C. In the update function it verifies whether the
current time is correct vs. the requirements of the underlying RTC.

But delayed_work is using the timer wheel for scheduling which is
inaccurate by design. Depending on the distance to the expiry the wheel
gets less granular to allow batching and to avoid the cascading of the
original timer wheel. See 500462a9de65 ("timers: Switch to a non-cascading
wheel") and the code for further details.

The code already deals with this by splitting the 660 seconds period into a
long 659 seconds timer and then retrying with a smaller delta.

But looking at the actual granularities of the timer wheel (which depend on
the HZ configuration) the 659 seconds timer ends up in an outer wheel level
and is affected by a worst case granularity of:

HZ          Granularity
1000        32s
 250        16s
 100        40s

So the initial timer can be already off by max 12.5% which is not a big
issue as the period of the sync is defined as ~11 minutes.

The fine grained second attempt schedules to the desired update point with
a timer expiring less than a second from now. Depending on the actual delta
and the HZ setting even the second attempt can end up in outer wheel levels
which have a large enough granularity to make the correctness check fail.

As this is a fundamental property of the timer wheel there is no way to
make this more accurate short of iterating in one jiffies steps towards the
update point.

Switch it to an hrtimer instead which schedules the actual update work. The
hrtimer will expire precisely (max 1 jiffie delay when high resolution
timers are not available). The actual scheduling delay of the work is the
same as before.

The update is triggered from do_adjtimex() which is a bit racy but not much
more racy than it was before:

     if (ntp_synced())
     	queue_delayed_work(system_power_efficient_wq, &sync_work, 0);

which is racy when the work is currently executed and has not managed to
reschedule itself.

This becomes now:

     if (ntp_synced() && !hrtimer_is_queued(&sync_hrtimer))
     	queue_work(system_power_efficient_wq, &sync_work, 0);

which is racy when the hrtimer has expired and the work is currently
executed and has not yet managed to rearm the hrtimer.

Not a big problem as it just schedules work for nothing.

The new implementation has a safe guard in place to catch the case where
the hrtimer is queued on entry to the work function and avoids an extra
update attempt of the RTC that way.

Reported-by: Miroslav Lichvar <mlichvar@redhat.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Prarit Bhargava <prarit@redhat.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
---
 include/linux/timex.h      |    1 
 kernel/time/ntp.c          |   90 ++++++++++++++++++++++++---------------------
 kernel/time/ntp_internal.h |    7 +++
 3 files changed, 55 insertions(+), 43 deletions(-)

--- a/include/linux/timex.h
+++ b/include/linux/timex.h
@@ -157,7 +157,6 @@ extern int do_clock_adjtime(const clocki
 extern void hardpps(const struct timespec64 *, const struct timespec64 *);
 
 int read_current_timer(unsigned long *timer_val);
-void ntp_notify_cmos_timer(void);
 
 /* The clock frequency of the i8253/i8254 PIT */
 #define PIT_TICK_RATE 1193182ul
--- a/kernel/time/ntp.c
+++ b/kernel/time/ntp.c
@@ -494,65 +494,55 @@ int second_overflow(time64_t secs)
 	return leap;
 }
 
+#if defined(CONFIG_GENERIC_CMOS_UPDATE) || defined(CONFIG_RTC_SYSTOHC)
 static void sync_hw_clock(struct work_struct *work);
-static DECLARE_DELAYED_WORK(sync_work, sync_hw_clock);
-
-static void sched_sync_hw_clock(struct timespec64 now,
-				unsigned long target_nsec, bool fail)
+static DECLARE_WORK(sync_work, sync_hw_clock);
+static struct hrtimer sync_hrtimer;
+#define SYNC_PERIOD_NS (11UL * 60 * NSEC_PER_SEC)
 
+static enum hrtimer_restart sync_timer_callback(struct hrtimer *timer)
 {
-	struct timespec64 next;
+	queue_work(system_power_efficient_wq, &sync_work);
 
-	ktime_get_real_ts64(&next);
-	if (!fail)
-		next.tv_sec = 659;
-	else {
-		/*
-		 * Try again as soon as possible. Delaying long periods
-		 * decreases the accuracy of the work queue timer. Due to this
-		 * the algorithm is very likely to require a short-sleep retry
-		 * after the above long sleep to synchronize ts_nsec.
-		 */
-		next.tv_sec = 0;
-	}
+	return HRTIMER_NORESTART;
+}
 
-	/* Compute the needed delay that will get to tv_nsec == target_nsec */
-	next.tv_nsec = target_nsec - next.tv_nsec;
-	if (next.tv_nsec <= 0)
-		next.tv_nsec += NSEC_PER_SEC;
-	if (next.tv_nsec >= NSEC_PER_SEC) {
-		next.tv_sec++;
-		next.tv_nsec -= NSEC_PER_SEC;
-	}
+static void sched_sync_hw_clock(unsigned long offset_nsec, bool retry)
+{
+	ktime_t exp = ktime_set(ktime_get_real_seconds(), 0);
 
-	queue_delayed_work(system_power_efficient_wq, &sync_work,
-			   timespec64_to_jiffies(&next));
+	if (retry)
+		exp = ktime_add_ns(exp, 2 * NSEC_PER_SEC - offset_nsec);
+	else
+		exp = ktime_add_ns(exp, SYNC_PERIOD_NS - offset_nsec);
+
+	hrtimer_start(&sync_hrtimer, exp, HRTIMER_MODE_ABS);
 }
 
 static void sync_rtc_clock(void)
 {
-	unsigned long target_nsec;
-	struct timespec64 adjust, now;
+	unsigned long offset_nsec;
+	struct timespec64 adjust;
 	int rc;
 
 	if (!IS_ENABLED(CONFIG_RTC_SYSTOHC))
 		return;
 
-	ktime_get_real_ts64(&now);
+	ktime_get_real_ts64(&adjust);
 
-	adjust = now;
 	if (persistent_clock_is_local)
 		adjust.tv_sec -= (sys_tz.tz_minuteswest * 60);
 
 	/*
-	 * The current RTC in use will provide the target_nsec it wants to be
-	 * called at, and does rtc_tv_nsec_ok internally.
+	 * The current RTC in use will provide the nanoseconds offset prior
+	 * to a full second it wants to be called at, and invokes
+	 * rtc_tv_nsec_ok() internally.
 	 */
-	rc = rtc_set_ntp_time(adjust, &target_nsec);
+	rc = rtc_set_ntp_time(adjust, &offset_nsec);
 	if (rc == -ENODEV)
 		return;
 
-	sched_sync_hw_clock(now, target_nsec, rc);
+	sched_sync_hw_clock(offset_nsec, rc != 0);
 }
 
 #ifdef CONFIG_GENERIC_CMOS_UPDATE
@@ -599,7 +589,7 @@ static bool sync_cmos_clock(void)
 		}
 	}
 
-	sched_sync_hw_clock(now, target_nsec, rc);
+	sched_sync_hw_clock(target_nsec, rc != 0);
 	return true;
 }
 
@@ -613,7 +603,12 @@ static bool sync_cmos_clock(void)
  */
 static void sync_hw_clock(struct work_struct *work)
 {
-	if (!ntp_synced())
+	/*
+	 * Don't update if STA_UNSYNC is set and if ntp_notify_cmos_timer()
+	 * managed to schedule the work between the timer firing and the
+	 * work being able to rearm the timer. Wait for the timer to expire.
+	 */
+	if (!ntp_synced() || hrtimer_is_queued(&sync_hrtimer))
 		return;
 
 	if (sync_cmos_clock())
@@ -624,13 +619,23 @@ static void sync_hw_clock(struct work_st
 
 void ntp_notify_cmos_timer(void)
 {
-	if (!ntp_synced())
-		return;
+	/*
+	 * When the work is currently executed but has not yet the timer
+	 * rearmed this queues the work immediately again. No big issue,
+	 * just a pointless work scheduled.
+	 */
+	if (ntp_synced() && !hrtimer_is_queued(&sync_hrtimer))
+		queue_work(system_power_efficient_wq, &sync_work);
+}
 
-	if (IS_ENABLED(CONFIG_GENERIC_CMOS_UPDATE) ||
-	    IS_ENABLED(CONFIG_RTC_SYSTOHC))
-		queue_delayed_work(system_power_efficient_wq, &sync_work, 0);
+static void __init ntp_init_cmos_sync(void)
+{
+	hrtimer_init(&sync_hrtimer, CLOCK_REALTIME, HRTIMER_MODE_ABS);
+	sync_hrtimer.function = sync_timer_callback;
 }
+#else /* CONFIG_GENERIC_CMOS_UPDATE) || defined(CONFIG_RTC_SYSTOHC) */
+static inline void __init ntp_init_cmos_sync(void) { }
+#endif /* !CONFIG_GENERIC_CMOS_UPDATE) || defined(CONFIG_RTC_SYSTOHC) */
 
 /*
  * Propagate a new txc->status value into the NTP state:
@@ -1044,4 +1049,5 @@ static int __init ntp_tick_adj_setup(cha
 void __init ntp_init(void)
 {
 	ntp_clear();
+	ntp_init_cmos_sync();
 }
--- a/kernel/time/ntp_internal.h
+++ b/kernel/time/ntp_internal.h
@@ -12,4 +12,11 @@ extern int __do_adjtimex(struct __kernel
 			 const struct timespec64 *ts,
 			 s32 *time_tai, struct audit_ntp_data *ad);
 extern void __hardpps(const struct timespec64 *phase_ts, const struct timespec64 *raw_ts);
+
+#if defined(CONFIG_GENERIC_CMOS_UPDATE) || defined(CONFIG_RTC_SYSTOHC)
+extern void ntp_notify_cmos_timer(void);
+#else
+static inline void ntp_notify_cmos_timer(void) { }
+#endif
+
 #endif /* _LINUX_NTP_INTERNAL_H */

