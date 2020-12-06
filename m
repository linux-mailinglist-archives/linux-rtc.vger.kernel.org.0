Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A72AF2D078B
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Dec 2020 23:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728338AbgLFWH1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 6 Dec 2020 17:07:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728171AbgLFWHW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 6 Dec 2020 17:07:22 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F136DC0613D0;
        Sun,  6 Dec 2020 14:06:41 -0800 (PST)
Message-Id: <20201206220541.594826678@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607292399;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=R/bjYkcLspMjW0iC0mlOkpDDBoyCshFoNiMGqMW8C7w=;
        b=LjtFUzFX4X9rokhXbb2MZiC5o7yRK7Xv62JFzky2PF2jwLXbY2VyQaeIK8EEEJOgNKHv8P
        EIo8JHS72XshKK2PehKgJBKD3GivW1v+lxjTuysc5ir/BWMzjMx6AEovZxSd48ArD3+CXN
        3uOuUdk6c+CpppPRGYvEzrPv0RWCfxPAp5VWQQntfiG8Rif8K7WztBZ3L3t1PaH5keOtZn
        Thm+eRTNNkDWcRPuvSHOfeRpvMx1pIQIniosYBOGmgGQe+0mZSlHRfMqn5Zc6zzeTjgJY3
        siaVXaqwBxsJIsoAUeRARexgb7p9lGUEklsiUwPfcplUqdmwgxp1cOCJ6rzNeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607292399;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=R/bjYkcLspMjW0iC0mlOkpDDBoyCshFoNiMGqMW8C7w=;
        b=9uXKF0eAsdA+DP61j4BK9KHXRJiS4e1z4nRkIMx5sUT76BUM6gbvDO1f2v+cXgY7UuQ6iL
        6DCdXs8TICmBWCAg==
Date:   Sun, 06 Dec 2020 22:46:14 +0100
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [patch 1/8] rtc: mc146818: Prevent reading garbage
References: <20201206214613.444124194@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The MC146818 driver is prone to read garbage from the RTC. There are
several issues all related to the update cycle of the MC146818. The chip
increments seconds obviously once per second and indicates that by a bit in
a register. The bit goes high 244us before the actual update starts. During
the update the readout of the time values is undefined.

The code just checks whether the update in progress bit (UIP) is set before
reading the clock. If it's set it waits arbitrary 20ms before retrying,
which is ample because the maximum update time is ~2ms.

But this check does not guarantee that the UIP bit goes high and the actual
update happens during the readout. So the following can happen

 0.997 	       UIP = False
   -> Interrupt/NMI/preemption
 0.998	       UIP -> True
 0.999	       Readout	<- Undefined

To prevent this rework the code so it checks UIP before and after the
readout and if set after the readout try again.

But that's not enough to cover the following:

 0.997 	       UIP = False
 	       Readout seconds
   -> NMI (or vCPU scheduled out)
 0.998	       UIP -> True
 	       update completes
	       UIP -> False
 1.000	       Readout	minutes,....
 	       UIP check succeeds

That can make the readout wrong up to 59 seconds.

To prevent this, read the seconds value before the first UIP check,
validate it after checking UIP and after reading out the rest.

It's amazing that the original i386 code had this actually correct and
the generic implementation of the MC146818 driver got it wrong in 2002 and
it stayed that way until today.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/rtc/rtc-mc146818-lib.c |   64 ++++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 25 deletions(-)

--- a/drivers/rtc/rtc-mc146818-lib.c
+++ b/drivers/rtc/rtc-mc146818-lib.c
@@ -8,41 +8,41 @@
 #include <linux/acpi.h>
 #endif
 
-/*
- * Returns true if a clock update is in progress
- */
-static inline unsigned char mc146818_is_updating(void)
-{
-	unsigned char uip;
-	unsigned long flags;
-
-	spin_lock_irqsave(&rtc_lock, flags);
-	uip = (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP);
-	spin_unlock_irqrestore(&rtc_lock, flags);
-	return uip;
-}
-
 unsigned int mc146818_get_time(struct rtc_time *time)
 {
 	unsigned char ctrl;
 	unsigned long flags;
 	unsigned char century = 0;
+	bool retry;
 
 #ifdef CONFIG_MACH_DECSTATION
 	unsigned int real_year;
 #endif
 
+again:
+	spin_lock_irqsave(&rtc_lock, flags);
 	/*
-	 * read RTC once any update in progress is done. The update
-	 * can take just over 2ms. We wait 20ms. There is no need to
-	 * to poll-wait (up to 1s - eeccch) for the falling edge of RTC_UIP.
-	 * If you need to know *exactly* when a second has started, enable
-	 * periodic update complete interrupts, (via ioctl) and then
-	 * immediately read /dev/rtc which will block until you get the IRQ.
-	 * Once the read clears, read the RTC time (again via ioctl). Easy.
+	 * Check whether there is an update in progress during which the
+	 * readout is unspecified. The maximum update time is ~2ms. Poll
+	 * every msec for completion.
+	 *
+	 * Store the second value before checking UIP so a long lasting NMI
+	 * which happens to hit after the UIP check cannot make an update
+	 * cycle invisible.
 	 */
-	if (mc146818_is_updating())
-		mdelay(20);
+	time->tm_sec = CMOS_READ(RTC_SECONDS);
+
+	if (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) {
+		spin_unlock_irqrestore(&rtc_lock, flags);
+		mdelay(1);
+		goto again;
+	}
+
+	/* Revalidate the above readout */
+	if (time->tm_sec != CMOS_READ(RTC_SECONDS)) {
+		spin_unlock_irqrestore(&rtc_lock, flags);
+		goto again;
+	}
 
 	/*
 	 * Only the values that we read from the RTC are set. We leave
@@ -50,8 +50,6 @@ unsigned int mc146818_get_time(struct rt
 	 * RTC has RTC_DAY_OF_WEEK, we ignore it, as it is only updated
 	 * by the RTC when initially set to a non-zero value.
 	 */
-	spin_lock_irqsave(&rtc_lock, flags);
-	time->tm_sec = CMOS_READ(RTC_SECONDS);
 	time->tm_min = CMOS_READ(RTC_MINUTES);
 	time->tm_hour = CMOS_READ(RTC_HOURS);
 	time->tm_mday = CMOS_READ(RTC_DAY_OF_MONTH);
@@ -66,8 +64,24 @@ unsigned int mc146818_get_time(struct rt
 		century = CMOS_READ(acpi_gbl_FADT.century);
 #endif
 	ctrl = CMOS_READ(RTC_CONTROL);
+	/*
+	 * Check for the UIP bit again. If it is set now then
+	 * the above values may contain garbage.
+	 */
+	retry = CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP;
+	/*
+	 * A NMI might have interrupted the above sequence so check whether
+	 * the seconds value has changed which indicates that the NMI took
+	 * longer than the UIP bit was set. Unlikely, but possible and
+	 * there is also virt...
+	 */
+	retry |= time->tm_sec != CMOS_READ(RTC_SECONDS);
+
 	spin_unlock_irqrestore(&rtc_lock, flags);
 
+	if (retry)
+		goto again;
+
 	if (!(ctrl & RTC_DM_BINARY) || RTC_ALWAYS_BCD)
 	{
 		time->tm_sec = bcd2bin(time->tm_sec);

