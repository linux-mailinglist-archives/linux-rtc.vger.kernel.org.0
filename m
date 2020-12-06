Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31122D0798
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Dec 2020 23:08:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbgLFWHg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 6 Dec 2020 17:07:36 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:60608 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728197AbgLFWHa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 6 Dec 2020 17:07:30 -0500
Message-Id: <20201206220542.263204937@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607292407;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=2uBnGfAlt7QrCy4v93o4MwUfHhZf1J5jMzkF06z4aWc=;
        b=iCo2RHwjJgAdAZALxbhkuvatONG/hbtld4wzMxeE7duuo8OtVo0hZ3pIfWLJ+Xq0prIWTP
        QTP+4YNxsHEHtRon/EWEptkTngB9McCBypNEJXDt+Tcbd3k+O2I1HLSAvt0DQUE4JtCAHP
        DHAtNpF3yhCq9StUFmrwtciPHxoDYrsdeckKiPqm83iThhJgTMypE7WOLtZJaJRJFWGyBK
        Ko/2T8M0L3B5TK+lST7SVm+Imli1MEEvpQvhm/knNM0yWIC0bzw2+5P0PB7+Qs3gZgxxjP
        bwkOk2RDF0EEThVtdzVJTSSzZlyJYA6CiMunFd2JHLP4HQux9idT64nMZYZ11A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607292407;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=2uBnGfAlt7QrCy4v93o4MwUfHhZf1J5jMzkF06z4aWc=;
        b=eu4QLrHwB3P7lYnON/qF+qGfLrlNMKAL6lIEVRr+rcF6gyN3phc9DdIA382JDfX1vzFTwB
        MBLKKcsHTLX1cDBA==
Date:   Sun, 06 Dec 2020 22:46:20 +0100
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [patch 7/8] ntp: Make the RTC sync offset less obscure
References: <20201206214613.444124194@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The current RTC set_offset_nsec value is not really intuitive to
understand. 

  tsched       twrite(t2.tv_sec - 1) 	 t2 (seconds increment)

The offset is calculated from twrite based on the assumption that t2 -
twrite == 1s. That means for the MC146818 RTC the offset needs to be
negative so that the write happens 500ms before t2.

It's easier to understand when the whole calculation is based on t2. That
avoids negative offsets and the meaning is obvious:

 t2 - twrite:     The time defined by the chip when seconds increment
      		  after the write.

 twrite - tsched: The time for the transport to the point where the chip
 	  	  is updated. 

==> set_offset_nsec =  t2 - tsched
    ttransport      =  twrite - tsched
    tRTCinc         =  t2 - twrite
==> set_offset_nsec =  ttransport + tRTCinc

tRTCinc is a chip property and can be obtained from the data sheet.

ttransport depends on how the RTC is connected. It is close to 0 for
directly accessible RTCs. For RTCs behind a slow bus, e.g. i2c, it's the
time required to send the update over the bus. This can be estimated or
even calibrated, but that's a different problem.

Adjust the implementation and update comments accordingly.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/rtc/class.c    |    9 +++++++--
 drivers/rtc/rtc-cmos.c |    2 +-
 include/linux/rtc.h    |   35 +++++++++++++++++++++++++++++------
 kernel/time/ntp.c      |   49 +++++++++++++++++++++++++------------------------
 4 files changed, 62 insertions(+), 33 deletions(-)

--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -200,8 +200,13 @@ static struct rtc_device *rtc_allocate_d
 
 	device_initialize(&rtc->dev);
 
-	/* Drivers can revise this default after allocating the device. */
-	rtc->set_offset_nsec =  10 * NSEC_PER_MSEC;
+	/*
+	 * Drivers can revise this default after allocating the device.
+	 * The default is what most RTCs do: Increment seconds exactly one
+	 * second after the write happened. This adds a default transport
+	 * time of 10ms which is at least halfways close to reality.
+	 */
+	rtc->set_offset_nsec = NSEC_PER_SEC + 10 * NSEC_PER_MSEC;
 
 	rtc->irq_freq = 1;
 	rtc->max_user_freq = 64;
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -869,7 +869,7 @@ cmos_do_probe(struct device *dev, struct
 		goto cleanup2;
 
 	/* Set the sync offset for the periodic 11min update correct */
-	cmos_rtc.rtc->set_offset_nsec = -(NSEC_PER_SEC / 2);
+	cmos_rtc.rtc->set_offset_nsec = NSEC_PER_SEC / 2;
 
 	/* export at least the first block of NVRAM */
 	nvmem_cfg.size = address_space - NVRAM_OFFSET;
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -110,13 +110,36 @@ struct rtc_device {
 	/* Some hardware can't support UIE mode */
 	int uie_unsupported;
 
-	/* Number of nsec it takes to set the RTC clock. This influences when
-	 * the set ops are called. An offset:
-	 *   - of 0.5 s will call RTC set for wall clock time 10.0 s at 9.5 s
-	 *   - of 1.5 s will call RTC set for wall clock time 10.0 s at 8.5 s
-	 *   - of -0.5 s will call RTC set for wall clock time 10.0 s at 10.5 s
+	/*
+	 * This offset specifies the update timing of the RTC.
+	 *
+	 * tsched     t1 write(t2.tv_sec - 1sec))  t2 RTC increments seconds
+	 *
+	 * The offset defines how tsched is computed so that the write to
+	 * the RTC (t2.tv_sec - 1sec) is correct versus the time required
+	 * for the transport of the write and the time which the RTC needs
+	 * to increment seconds the first time after the write (t2).
+	 *
+	 * For direct accessible RTCs tsched ~= t1 because the write time
+	 * is negligible. For RTCs behind slow busses the transport time is
+	 * significant and has to be taken into account.
+	 *
+	 * The time between the write (t1) and the first increment after
+	 * the write (t2) is RTC specific. For a MC146818 RTC it's 500ms,
+	 * for many others it's exactly 1 second. Consult the datasheet.
+	 *
+	 * The value of this offset is also used to calculate the to be
+	 * written value (t2.tv_sec - 1sec) at tsched.
+	 *
+	 * The default value for this is NSEC_PER_SEC + 10 msec default
+	 * transport time. The offset can be adjusted by drivers so the
+	 * calculation for the to be written value at tsched becomes
+	 * correct:
+	 *
+	 *	newval = tsched + set_offset_nsec - NSEC_PER_SEC
+	 * and  (tsched + set_offset_nsec) % NSEC_PER_SEC == 0
 	 */
-	long set_offset_nsec;
+	unsigned long set_offset_nsec;
 
 	bool registered;
 
--- a/kernel/time/ntp.c
+++ b/kernel/time/ntp.c
@@ -520,22 +520,33 @@ static void sched_sync_hw_clock(unsigned
 }
 
 /*
- * Determine if we can call to driver to set the time. Drivers can only be
- * called to set a second aligned time value, and the field set_offset_nsec
- * specifies how far away from the second aligned time to call the driver.
- *
- * This also computes 'to_set' which is the time we are trying to set, and has
- * a zero in tv_nsecs, such that:
- *    to_set - set_delay_nsec == now +/- FUZZ
+ * Check whether @now is correct versus the required time to update the RTC
+ * and calculate the value which needs to be written to the RTC so that the
+ * next seconds increment of the RTC after the write is aligned with the next
+ * seconds increment of clock REALTIME.
  *
+ * tsched     t1 write(t2.tv_sec - 1sec))	t2 RTC increments seconds
+ *
+ * t2.tv_nsec == 0
+ * tsched = t2 - set_offset_nsec
+ * newval = t2 - NSEC_PER_SEC
+ *
+ * ==> neval = tsched + set_offset_nsec - NSEC_PER_SEC
+ *
+ * As the execution of this code is not guaranteed to happen exactly at
+ * tsched this allows it to happen within a fuzzy region:
+ *
+ *	abs(now - tsched) < FUZZ
+ *
+ * If @now is not inside the allowed window the function returns false.
  */
-static inline bool rtc_tv_nsec_ok(long set_offset_nsec,
+static inline bool rtc_tv_nsec_ok(unsigned long set_offset_nsec,
 				  struct timespec64 *to_set,
 				  const struct timespec64 *now)
 {
 	/* Allowed error in tv_nsec, arbitarily set to 5 jiffies in ns. */
 	const unsigned long TIME_SET_NSEC_FUZZ = TICK_NSEC * 5;
-	struct timespec64 delay = {.tv_sec = 0,
+	struct timespec64 delay = {.tv_sec = -1,
 				   .tv_nsec = set_offset_nsec};
 
 	*to_set = timespec64_add(*now, delay);
@@ -557,11 +568,11 @@ static inline bool rtc_tv_nsec_ok(long s
 /*
  * rtc_set_ntp_time - Save NTP synchronized time to the RTC
  */
-static int rtc_set_ntp_time(struct timespec64 now, unsigned long *target_nsec)
+static int rtc_set_ntp_time(struct timespec64 now, unsigned long *offset_nsec)
 {
+	struct timespec64 to_set;
 	struct rtc_device *rtc;
 	struct rtc_time tm;
-	struct timespec64 to_set;
 	int err = -ENODEV;
 	bool ok;
 
@@ -572,19 +583,9 @@ static int rtc_set_ntp_time(struct times
 	if (!rtc->ops || !rtc->ops->set_time)
 		goto out_close;
 
-	/*
-	 * Compute the value of tv_nsec we require the caller to supply in
-	 * now.tv_nsec.  This is the value such that (now +
-	 * set_offset_nsec).tv_nsec == 0.
-	 */
-	set_normalized_timespec64(&to_set, 0, -rtc->set_offset_nsec);
-	*target_nsec = to_set.tv_nsec;
+	/* Store the update offset for this RTC */
+	*offset_nsec = rtc->set_offset_nsec;
 
-	/*
-	 * The ntp code must call this with the correct value in tv_nsec, if
-	 * it does not we update target_nsec and return EPROTO to make the ntp
-	 * code try again later.
-	 */
 	ok = rtc_tv_nsec_ok(rtc->set_offset_nsec, &to_set, &now);
 	if (!ok) {
 		err = -EPROTO;
@@ -657,7 +658,7 @@ static bool sync_cmos_clock(void)
 	 * implement this legacy API.
 	 */
 	ktime_get_real_ts64(&now);
-	if (rtc_tv_nsec_ok(-1 * target_nsec, &adjust, &now)) {
+	if (rtc_tv_nsec_ok(target_nsec, &adjust, &now)) {
 		if (persistent_clock_is_local)
 			adjust.tv_sec -= (sys_tz.tz_minuteswest * 60);
 		rc = update_persistent_clock64(adjust);

