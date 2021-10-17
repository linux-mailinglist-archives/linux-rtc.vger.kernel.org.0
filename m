Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4469430BD4
	for <lists+linux-rtc@lfdr.de>; Sun, 17 Oct 2021 21:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344605AbhJQTmS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 17 Oct 2021 15:42:18 -0400
Received: from mx-out.tlen.pl ([193.222.135.142]:45942 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344544AbhJQTmO (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 17 Oct 2021 15:42:14 -0400
Received: (wp-smtpd smtp.tlen.pl 12881 invoked from network); 17 Oct 2021 21:40:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1634499603; bh=pnqP17/YH2OPXp890QGU/uhVZxdRpgYB3x+bvHgDT9s=;
          h=From:To:Cc:Subject;
          b=vwWD6rTMDLk3TIwcjFX02csYjnRXgxAFlIOl7jJAiXqoIXBtJlPWCccm3Hp9Uzvxb
           pSU/+pEyDCre1nWXU47d6kmIqRvS8htNvfAKQZ0MUduP6p3Zm0VNcCtUrmU7wwYmcR
           jCNSo+p6R7YuyZp4Ifov3+449yOLoXTarS5JHeDw=
Received: from aaet142.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.4.123.142])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-kernel@vger.kernel.org>; 17 Oct 2021 21:40:02 +0200
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RESEND 5/6] x86/rtc: mach_get_cmos_time - rm duplicated code
Date:   Sun, 17 Oct 2021 21:39:26 +0200
Message-Id: <20211017193927.277409-6-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211017193927.277409-1-mat.jonczyk@o2.pl>
References: <20211017193927.277409-1-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 6ec55e2604ba6b0e464b8c6ed1398241
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000002 [oWHh]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

There are functions in drivers/rtc/rtc-mc146818-lib.c that handle
reading from / writing to the CMOS RTC clock. mach_get_cmos_time() in
arch/x86/kernel/rtc.c did not use them and was mostly a duplicate of
mc146818_get_time(). Modify mach_get_cmos_time() to use
mc146818_get_time() and remove the duplicated code.

mach_get_cmos_time() used a different algorithm than
mc146818_get_time(), but these functions are equivalent. The major
differences are:

- mc146818_get_time() is better refined: it was updated in
  commit 05a0302c3548 ("rtc: mc146818: Prevent reading garbage")
  to take account of various edge conditions,

- when the UIP ("Update in progress") bit of the RTC is set,
  mach_get_cmos_time() was busy waiting with cpu_relax() while
  mc146818_get_time() is now using udelay(100) in every loop iteration,

- mach_get_cmos_time() assumed that the RTC year must be >= 2000, which
  may not be true on some old boxes with a dead battery.

The RTC writing counterpart, mach_set_rtc_mmss() is already using
mc146818_get_time() from drivers/rtc. This was done in
        commit 3195ef59cb42 ("x86: Do full rtc synchronization with ntp")
It appears that mach_get_cmos_time() was simply forgotten.

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/kernel/rtc.c | 55 +++++--------------------------------------
 1 file changed, 6 insertions(+), 49 deletions(-)

diff --git a/arch/x86/kernel/rtc.c b/arch/x86/kernel/rtc.c
index 586f718b8e95..bd170362edef 100644
--- a/arch/x86/kernel/rtc.c
+++ b/arch/x86/kernel/rtc.c
@@ -20,15 +20,12 @@
 /*
  * This is a special lock that is owned by the CPU and holds the index
  * register we are working with.  It is required for NMI access to the
- * CMOS/RTC registers.  See include/asm-i386/mc146818rtc.h for details.
+ * CMOS/RTC registers.  See arch/x86/include/asm/mc146818rtc.h for details.
  */
 volatile unsigned long cmos_lock;
 EXPORT_SYMBOL(cmos_lock);
 #endif /* CONFIG_X86_32 */
 
-/* For two digit years assume time is always after that */
-#define CMOS_YEARS_OFFS 2000
-
 DEFINE_SPINLOCK(rtc_lock);
 EXPORT_SYMBOL(rtc_lock);
 
@@ -62,8 +59,7 @@ int mach_set_rtc_mmss(const struct timespec64 *now)
 
 void mach_get_cmos_time(struct timespec64 *now)
 {
-	unsigned int status, year, mon, day, hour, min, sec, century = 0;
-	unsigned long flags;
+	struct rtc_time tm;
 
 	/*
 	 * If pm_trace abused the RTC as storage, set the timespec to 0,
@@ -74,51 +70,12 @@ void mach_get_cmos_time(struct timespec64 *now)
 		return;
 	}
 
-	spin_lock_irqsave(&rtc_lock, flags);
-
-	/*
-	 * If UIP is clear, then we have >= 244 microseconds before
-	 * RTC registers will be updated.  Spec sheet says that this
-	 * is the reliable way to read RTC - registers. If UIP is set
-	 * then the register access might be invalid.
-	 */
-	while ((CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP))
-		cpu_relax();
-
-	sec = CMOS_READ(RTC_SECONDS);
-	min = CMOS_READ(RTC_MINUTES);
-	hour = CMOS_READ(RTC_HOURS);
-	day = CMOS_READ(RTC_DAY_OF_MONTH);
-	mon = CMOS_READ(RTC_MONTH);
-	year = CMOS_READ(RTC_YEAR);
-
-#ifdef CONFIG_ACPI
-	if (acpi_gbl_FADT.header.revision >= FADT2_REVISION_ID &&
-	    acpi_gbl_FADT.century)
-		century = CMOS_READ(acpi_gbl_FADT.century);
-#endif
-
-	status = CMOS_READ(RTC_CONTROL);
-	WARN_ON_ONCE(RTC_ALWAYS_BCD && (status & RTC_DM_BINARY));
-
-	spin_unlock_irqrestore(&rtc_lock, flags);
-
-	if (RTC_ALWAYS_BCD || !(status & RTC_DM_BINARY)) {
-		sec = bcd2bin(sec);
-		min = bcd2bin(min);
-		hour = bcd2bin(hour);
-		day = bcd2bin(day);
-		mon = bcd2bin(mon);
-		year = bcd2bin(year);
+	if (!mc146818_get_time(&tm)) {
+		now->tv_sec = now->tv_nsec = 0;
+		return;
 	}
 
-	if (century) {
-		century = bcd2bin(century);
-		year += century * 100;
-	} else
-		year += CMOS_YEARS_OFFS;
-
-	now->tv_sec = mktime64(year, mon, day, hour, min, sec);
+	now->tv_sec = rtc_tm_to_time64(&tm);
 	now->tv_nsec = 0;
 }
 
-- 
2.25.1

