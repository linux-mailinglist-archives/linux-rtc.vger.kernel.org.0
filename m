Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDE872D0796
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Dec 2020 23:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728538AbgLFWHg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 6 Dec 2020 17:07:36 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:60582 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728236AbgLFWH3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 6 Dec 2020 17:07:29 -0500
Message-Id: <20201206220542.166871172@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607292405;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=0BAhN1M/wYN3z8RQo9N+xeP2aNMX/FHK8KRmdasqUq0=;
        b=ivAXjT2KUY0ZETvFzQ1vgEUtYkBh1viyeAastmWbcpmMeUNU0csdRdwTUkwOovzAvtoAlb
        479vITJwhFms8IF4fZTYrSynDuprZOsIflw1gFnCxYYL0uS1/+/a/ym27YSzpUDxv5a8zh
        svCK8nYBmmyQ6tTBwz312lgjvexddk/kfn9vKZ/AfAsBDm/zyxE/Ay/sYWa21rONG9X1yJ
        JOvwj8gGdhJcXniFb5Av49eAqpgbpRaSlRNFK+H5dP1xdPxmjWcBULq+4lGqUiXNoeCHp2
        hvuzxiO23Q2cntUl06yaGmCByv6FL7DKIiXsfGmISACp83CaK6NaSXoTGWgk2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607292405;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=0BAhN1M/wYN3z8RQo9N+xeP2aNMX/FHK8KRmdasqUq0=;
        b=63EZBMcxzme+QjjE+hWuRrOo2oUYOVdYAeBbAHNojCyHgP6BrqcE+1FKxI3Zp+DLjDkY6F
        CUwYBbdrnUkZykAw==
Date:   Sun, 06 Dec 2020 22:46:19 +0100
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [patch 6/8] ntp, rtc: Move rtc_set_ntp_time() to ntp code
References: <20201206214613.444124194@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

rtc_set_ntp_time() is not really RTC functionality as the code is just a
user of RTC. Move it into the NTP code which allows further cleanups.

Requested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/rtc/Makefile  |    1 
 drivers/rtc/systohc.c |   61 ----------------------------------
 include/linux/rtc.h   |   34 -------------------
 kernel/time/ntp.c     |   88 ++++++++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 85 insertions(+), 99 deletions(-)

--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -6,7 +6,6 @@
 ccflags-$(CONFIG_RTC_DEBUG)	:= -DDEBUG
 
 obj-$(CONFIG_RTC_LIB)		+= lib.o
-obj-$(CONFIG_RTC_SYSTOHC)	+= systohc.o
 obj-$(CONFIG_RTC_CLASS)		+= rtc-core.o
 obj-$(CONFIG_RTC_MC146818_LIB)	+= rtc-mc146818-lib.o
 rtc-core-y			:= class.o interface.o
--- a/drivers/rtc/systohc.c
+++ /dev/null
@@ -1,61 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/rtc.h>
-#include <linux/time.h>
-
-/**
- * rtc_set_ntp_time - Save NTP synchronized time to the RTC
- * @now: Current time of day
- * @target_nsec: pointer for desired now->tv_nsec value
- *
- * Replacement for the NTP platform function update_persistent_clock64
- * that stores time for later retrieval by rtc_hctosys.
- *
- * Returns 0 on successful RTC update, -ENODEV if a RTC update is not
- * possible at all, and various other -errno for specific temporary failure
- * cases.
- *
- * -EPROTO is returned if now.tv_nsec is not close enough to *target_nsec.
- *
- * If temporary failure is indicated the caller should try again 'soon'
- */
-int rtc_set_ntp_time(struct timespec64 now, unsigned long *target_nsec)
-{
-	struct rtc_device *rtc;
-	struct rtc_time tm;
-	struct timespec64 to_set;
-	int err = -ENODEV;
-	bool ok;
-
-	rtc = rtc_class_open(CONFIG_RTC_SYSTOHC_DEVICE);
-	if (!rtc)
-		goto out_err;
-
-	if (!rtc->ops || !rtc->ops->set_time)
-		goto out_close;
-
-	/* Compute the value of tv_nsec we require the caller to supply in
-	 * now.tv_nsec.  This is the value such that (now +
-	 * set_offset_nsec).tv_nsec == 0.
-	 */
-	set_normalized_timespec64(&to_set, 0, -rtc->set_offset_nsec);
-	*target_nsec = to_set.tv_nsec;
-
-	/* The ntp code must call this with the correct value in tv_nsec, if
-	 * it does not we update target_nsec and return EPROTO to make the ntp
-	 * code try again later.
-	 */
-	ok = rtc_tv_nsec_ok(rtc->set_offset_nsec, &to_set, &now);
-	if (!ok) {
-		err = -EPROTO;
-		goto out_close;
-	}
-
-	rtc_time64_to_tm(to_set.tv_sec, &tm);
-
-	err = rtc_set_time(rtc, &tm);
-
-out_close:
-	rtc_class_close(rtc);
-out_err:
-	return err;
-}
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -165,7 +165,6 @@ int __rtc_register_device(struct module
 
 extern int rtc_read_time(struct rtc_device *rtc, struct rtc_time *tm);
 extern int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm);
-extern int rtc_set_ntp_time(struct timespec64 now, unsigned long *target_nsec);
 int __rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm);
 extern int rtc_read_alarm(struct rtc_device *rtc,
 			struct rtc_wkalrm *alrm);
@@ -205,39 +204,6 @@ static inline bool is_leap_year(unsigned
 	return (!(year % 4) && (year % 100)) || !(year % 400);
 }
 
-/* Determine if we can call to driver to set the time. Drivers can only be
- * called to set a second aligned time value, and the field set_offset_nsec
- * specifies how far away from the second aligned time to call the driver.
- *
- * This also computes 'to_set' which is the time we are trying to set, and has
- * a zero in tv_nsecs, such that:
- *    to_set - set_delay_nsec == now +/- FUZZ
- *
- */
-static inline bool rtc_tv_nsec_ok(s64 set_offset_nsec,
-				  struct timespec64 *to_set,
-				  const struct timespec64 *now)
-{
-	/* Allowed error in tv_nsec, arbitarily set to 5 jiffies in ns. */
-	const unsigned long TIME_SET_NSEC_FUZZ = TICK_NSEC * 5;
-	struct timespec64 delay = {.tv_sec = 0,
-				   .tv_nsec = set_offset_nsec};
-
-	*to_set = timespec64_add(*now, delay);
-
-	if (to_set->tv_nsec < TIME_SET_NSEC_FUZZ) {
-		to_set->tv_nsec = 0;
-		return true;
-	}
-
-	if (to_set->tv_nsec > NSEC_PER_SEC - TIME_SET_NSEC_FUZZ) {
-		to_set->tv_sec++;
-		to_set->tv_nsec = 0;
-		return true;
-	}
-	return false;
-}
-
 #define rtc_register_device(device) \
 	__rtc_register_device(THIS_MODULE, device)
 
--- a/kernel/time/ntp.c
+++ b/kernel/time/ntp.c
@@ -519,15 +519,94 @@ static void sched_sync_hw_clock(unsigned
 	hrtimer_start(&sync_hrtimer, exp, HRTIMER_MODE_ABS);
 }
 
+/*
+ * Determine if we can call to driver to set the time. Drivers can only be
+ * called to set a second aligned time value, and the field set_offset_nsec
+ * specifies how far away from the second aligned time to call the driver.
+ *
+ * This also computes 'to_set' which is the time we are trying to set, and has
+ * a zero in tv_nsecs, such that:
+ *    to_set - set_delay_nsec == now +/- FUZZ
+ *
+ */
+static inline bool rtc_tv_nsec_ok(long set_offset_nsec,
+				  struct timespec64 *to_set,
+				  const struct timespec64 *now)
+{
+	/* Allowed error in tv_nsec, arbitarily set to 5 jiffies in ns. */
+	const unsigned long TIME_SET_NSEC_FUZZ = TICK_NSEC * 5;
+	struct timespec64 delay = {.tv_sec = 0,
+				   .tv_nsec = set_offset_nsec};
+
+	*to_set = timespec64_add(*now, delay);
+
+	if (to_set->tv_nsec < TIME_SET_NSEC_FUZZ) {
+		to_set->tv_nsec = 0;
+		return true;
+	}
+
+	if (to_set->tv_nsec > NSEC_PER_SEC - TIME_SET_NSEC_FUZZ) {
+		to_set->tv_sec++;
+		to_set->tv_nsec = 0;
+		return true;
+	}
+	return false;
+}
+
+#ifdef CONFIG_RTC_SYSTOHC
+/*
+ * rtc_set_ntp_time - Save NTP synchronized time to the RTC
+ */
+static int rtc_set_ntp_time(struct timespec64 now, unsigned long *target_nsec)
+{
+	struct rtc_device *rtc;
+	struct rtc_time tm;
+	struct timespec64 to_set;
+	int err = -ENODEV;
+	bool ok;
+
+	rtc = rtc_class_open(CONFIG_RTC_SYSTOHC_DEVICE);
+	if (!rtc)
+		goto out_err;
+
+	if (!rtc->ops || !rtc->ops->set_time)
+		goto out_close;
+
+	/*
+	 * Compute the value of tv_nsec we require the caller to supply in
+	 * now.tv_nsec.  This is the value such that (now +
+	 * set_offset_nsec).tv_nsec == 0.
+	 */
+	set_normalized_timespec64(&to_set, 0, -rtc->set_offset_nsec);
+	*target_nsec = to_set.tv_nsec;
+
+	/*
+	 * The ntp code must call this with the correct value in tv_nsec, if
+	 * it does not we update target_nsec and return EPROTO to make the ntp
+	 * code try again later.
+	 */
+	ok = rtc_tv_nsec_ok(rtc->set_offset_nsec, &to_set, &now);
+	if (!ok) {
+		err = -EPROTO;
+		goto out_close;
+	}
+
+	rtc_time64_to_tm(to_set.tv_sec, &tm);
+
+	err = rtc_set_time(rtc, &tm);
+
+out_close:
+	rtc_class_close(rtc);
+out_err:
+	return err;
+}
+
 static void sync_rtc_clock(void)
 {
 	unsigned long offset_nsec;
 	struct timespec64 adjust;
 	int rc;
 
-	if (!IS_ENABLED(CONFIG_RTC_SYSTOHC))
-		return;
-
 	ktime_get_real_ts64(&adjust);
 
 	if (persistent_clock_is_local)
@@ -544,6 +623,9 @@ static void sync_rtc_clock(void)
 
 	sched_sync_hw_clock(offset_nsec, rc != 0);
 }
+#else
+static inline void sync_rtc_clock(void) { }
+#endif
 
 #ifdef CONFIG_GENERIC_CMOS_UPDATE
 int __weak update_persistent_clock64(struct timespec64 now64)

