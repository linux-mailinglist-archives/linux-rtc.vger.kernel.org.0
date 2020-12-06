Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84072D0794
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Dec 2020 23:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbgLFWHc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 6 Dec 2020 17:07:32 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:60618 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbgLFWHb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 6 Dec 2020 17:07:31 -0500
Message-Id: <20201206220542.355743355@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607292408;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=jPH7U/dzdZgP54tZ6wlYfZRlWG4B4sNUOGlevlVQmtA=;
        b=UBvcf62BRD35OWHLa54kyyI9s7ilzjY5Kq593ibc+9ybpAvDFRrIOdQZnEYMZh9xMS51z/
        KtW1LCO28LZE0vt5Cp9EXPIUCn8o5OQLCjhbwlsCHnHyVzBv3t41qjqG7Go3lfDsCPqe50
        MG8UWNI8JN1HdVTegccoQP4fRbVh/MBJDDqhiacfgixh59HMvbM+vKAJZfzwtJEdPjwY1D
        L8PXhz4b1r6IgZvCeDaxqbfNbNbvRp5mGCtM7SGROYJZrDdQshGZ3GASAi5omj5nyp29nr
        Pzfv4wVFQe3VMbwyL/5V/VILwPTUXcut9CiRXV7s0aKiSwIAyKDQNSEt9BF8oA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607292408;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=jPH7U/dzdZgP54tZ6wlYfZRlWG4B4sNUOGlevlVQmtA=;
        b=RQLtnr7SLLRfUAd9UjGyyZ5omd2rlIOVHOkRnkqtimn9o+NIwwKNInHqlELH4Y+kJK2hQT
        JMK+3/bsTLk5kXDQ==
Date:   Sun, 06 Dec 2020 22:46:21 +0100
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [patch 8/8] ntp: Consolidate the RTC update implementation
References: <20201206214613.444124194@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The code for the legacy RTC and the RTC class based update are pretty much
the same. Consolidate the common parts into one function and just invoke
the actual setter functions.

For RTC class based devices the update code checks whether the offset is
valid for the device, which is usually not the case for the first
invocation. If it's not the same it stores the correct offset and lets the
caller try again. That's not much different from the previous approach
where the first invocation had a pretty low probability to actually hit the
allowed window.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 kernel/time/ntp.c |  139 ++++++++++++++++++------------------------------------
 1 file changed, 47 insertions(+), 92 deletions(-)

--- a/kernel/time/ntp.c
+++ b/kernel/time/ntp.c
@@ -564,118 +564,53 @@ static inline bool rtc_tv_nsec_ok(unsign
 	return false;
 }
 
+#ifdef CONFIG_GENERIC_CMOS_UPDATE
+int __weak update_persistent_clock64(struct timespec64 now64)
+{
+	return -ENODEV;
+}
+#else
+static inline int update_persistent_clock64(struct timespec64 now64)
+{
+	return -ENODEV;
+}
+#endif
+
 #ifdef CONFIG_RTC_SYSTOHC
-/*
- * rtc_set_ntp_time - Save NTP synchronized time to the RTC
- */
-static int rtc_set_ntp_time(struct timespec64 now, unsigned long *offset_nsec)
+/* Save NTP synchronized time to the RTC */
+static int update_rtc(struct timespec64 *to_set, unsigned long *offset_nsec)
 {
-	struct timespec64 to_set;
 	struct rtc_device *rtc;
 	struct rtc_time tm;
 	int err = -ENODEV;
-	bool ok;
 
 	rtc = rtc_class_open(CONFIG_RTC_SYSTOHC_DEVICE);
 	if (!rtc)
-		goto out_err;
+		return -ENODEV;
 
 	if (!rtc->ops || !rtc->ops->set_time)
 		goto out_close;
 
-	/* Store the update offset for this RTC */
-	*offset_nsec = rtc->set_offset_nsec;
-
-	ok = rtc_tv_nsec_ok(rtc->set_offset_nsec, &to_set, &now);
-	if (!ok) {
-		err = -EPROTO;
-		goto out_close;
+	/* First call might not have the correct offset */
+	if (*offset_nsec == rtc->set_offset_nsec) {
+		rtc_time64_to_tm(to_set->tv_sec, &tm);
+		err = rtc_set_time(rtc, &tm);
+	} else {
+		/* Store the update offset and let the caller try again */
+		*offset_nsec = rtc->set_offset_nsec;
+		err = -EAGAIN;
 	}
-
-	rtc_time64_to_tm(to_set.tv_sec, &tm);
-
-	err = rtc_set_time(rtc, &tm);
-
 out_close:
 	rtc_class_close(rtc);
-out_err:
 	return err;
 }
-
-static void sync_rtc_clock(void)
-{
-	unsigned long offset_nsec;
-	struct timespec64 adjust;
-	int rc;
-
-	ktime_get_real_ts64(&adjust);
-
-	if (persistent_clock_is_local)
-		adjust.tv_sec -= (sys_tz.tz_minuteswest * 60);
-
-	/*
-	 * The current RTC in use will provide the nanoseconds offset prior
-	 * to a full second it wants to be called at, and invokes
-	 * rtc_tv_nsec_ok() internally.
-	 */
-	rc = rtc_set_ntp_time(adjust, &offset_nsec);
-	if (rc == -ENODEV)
-		return;
-
-	sched_sync_hw_clock(offset_nsec, rc != 0);
-}
 #else
-static inline void sync_rtc_clock(void) { }
-#endif
-
-#ifdef CONFIG_GENERIC_CMOS_UPDATE
-int __weak update_persistent_clock64(struct timespec64 now64)
+static inline int update_rtc(struct timespec64 *to_set, unsigned long *offset_nsec)
 {
 	return -ENODEV;
 }
 #endif
 
-static bool sync_cmos_clock(void)
-{
-	static bool no_cmos;
-	struct timespec64 now;
-	struct timespec64 adjust;
-	int rc = -EPROTO;
-	long target_nsec = NSEC_PER_SEC / 2;
-
-	if (!IS_ENABLED(CONFIG_GENERIC_CMOS_UPDATE))
-		return false;
-
-	if (no_cmos)
-		return false;
-
-	/*
-	 * Historically update_persistent_clock64() has followed x86
-	 * semantics, which match the MC146818A/etc RTC. This RTC will store
-	 * 'adjust' and then in .5s it will advance once second.
-	 *
-	 * Architectures are strongly encouraged to use rtclib and not
-	 * implement this legacy API.
-	 */
-	ktime_get_real_ts64(&now);
-	if (rtc_tv_nsec_ok(target_nsec, &adjust, &now)) {
-		if (persistent_clock_is_local)
-			adjust.tv_sec -= (sys_tz.tz_minuteswest * 60);
-		rc = update_persistent_clock64(adjust);
-		/*
-		 * The machine does not support update_persistent_clock64 even
-		 * though it defines CONFIG_GENERIC_CMOS_UPDATE.
-		 */
-		if (rc == -ENODEV) {
-			no_cmos = true;
-			return false;
-		}
-	}
-
-	sched_sync_hw_clock(target_nsec, rc != 0);
-	return true;
-}
-
 /*
  * If we have an externally synchronized Linux clock, then update RTC clock
  * accordingly every ~11 minutes. Generally RTCs can only store second
@@ -686,6 +621,10 @@ static bool sync_cmos_clock(void)
  */
 static void sync_hw_clock(struct work_struct *work)
 {
+	static unsigned long offset_nsec = NSEC_PER_SEC / 2;
+	struct timespec64 now, to_set;
+	int res = -EAGAIN;
+
 	/*
 	 * Don't update if STA_UNSYNC is set and if ntp_notify_cmos_timer()
 	 * managed to schedule the work between the timer firing and the
@@ -694,10 +633,26 @@ static void sync_hw_clock(struct work_st
 	if (!ntp_synced() || hrtimer_is_queued(&sync_hrtimer))
 		return;
 
-	if (sync_cmos_clock())
-		return;
+	ktime_get_real_ts64(&now);
+	/* If @now is not in the allowed window, try again */
+	if (!rtc_tv_nsec_ok(offset_nsec, &to_set, &now))
+		goto rearm;
 
-	sync_rtc_clock();
+	/* Take timezone adjusted RTCs into account */
+	if (persistent_clock_is_local)
+		to_set.tv_sec -= (sys_tz.tz_minuteswest * 60);
+
+	/* Try the legacy RTC first */
+	res = update_persistent_clock64(to_set);
+	if (res != -ENODEV)
+		goto rearm;
+
+	/* Try the RTC class */
+	res = update_rtc(&to_set, &offset_nsec);
+	if (res == -ENODEV)
+		return;
+rearm:
+	sched_sync_hw_clock(offset_nsec, res != 0);
 }
 
 void ntp_notify_cmos_timer(void)

