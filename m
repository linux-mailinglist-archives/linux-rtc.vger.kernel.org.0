Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B85E345A84
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Mar 2021 10:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbhCWJNd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Mar 2021 05:13:33 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14125 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbhCWJNR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Mar 2021 05:13:17 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F4Qb801Lxz19HM5;
        Tue, 23 Mar 2021 17:11:16 +0800 (CST)
Received: from huawei.com (10.67.174.47) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Tue, 23 Mar 2021
 17:13:03 +0800
From:   He Ying <heying24@huawei.com>
To:     <mpe@ellerman.id.au>, <benh@kernel.crashing.org>,
        <paulus@samba.org>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <christophe.leroy@csgroup.eu>,
        <npiggin@gmail.com>, <msuchanek@suse.de>, <heying24@huawei.com>,
        <tglx@linutronix.de>, <peterz@infradead.org>,
        <geert+renesas@glider.be>, <kernelfans@gmail.com>,
        <frederic@kernel.org>
CC:     <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>
Subject: [PATCH v2 -next] powerpc: kernel/time.c - cleanup warnings
Date:   Tue, 23 Mar 2021 05:12:57 -0400
Message-ID: <20210323091257.90054-1-heying24@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.47]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

We found these warnings in arch/powerpc/kernel/time.c as follows:
warning: symbol 'decrementer_max' was not declared. Should it be static?
warning: symbol 'rtc_lock' was not declared. Should it be static?
warning: symbol 'dtl_consumer' was not declared. Should it be static?

Declare 'decrementer_max' and 'rtc_lock' in powerpc asm/time.h.
Rename 'rtc_lock' in drviers/rtc/rtc-vr41xx.c to 'vr41xx_rtc_lock' to
avoid the conflict with the variable in powerpc asm/time.h.
Move 'dtl_consumer' definition behind "include <asm/dtl.h>" because it
is declared there.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: He Ying <heying24@huawei.com>
---
v2:
- Instead of including linux/mc146818rtc.h in powerpc kernel/time.c, declare
  rtc_lock in powerpc asm/time.h.

 arch/powerpc/include/asm/time.h |  3 +++
 arch/powerpc/kernel/time.c      |  6 ++----
 drivers/rtc/rtc-vr41xx.c        | 22 +++++++++++-----------
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 8dd3cdb25338..64a3ef0b4270 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -12,6 +12,7 @@
 #ifdef __KERNEL__
 #include <linux/types.h>
 #include <linux/percpu.h>
+#include <linux/spinlock.h>
 
 #include <asm/processor.h>
 #include <asm/cpu_has_feature.h>
@@ -22,6 +23,8 @@ extern unsigned long tb_ticks_per_jiffy;
 extern unsigned long tb_ticks_per_usec;
 extern unsigned long tb_ticks_per_sec;
 extern struct clock_event_device decrementer_clockevent;
+extern u64 decrementer_max;
+extern spinlock_t rtc_lock;
 
 
 extern void generic_calibrate_decr(void);
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index b67d93a609a2..60b6ac7d3685 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -150,10 +150,6 @@ bool tb_invalid;
 u64 __cputime_usec_factor;
 EXPORT_SYMBOL(__cputime_usec_factor);
 
-#ifdef CONFIG_PPC_SPLPAR
-void (*dtl_consumer)(struct dtl_entry *, u64);
-#endif
-
 static void calc_cputime_factors(void)
 {
 	struct div_result res;
@@ -179,6 +175,8 @@ static inline unsigned long read_spurr(unsigned long tb)
 
 #include <asm/dtl.h>
 
+void (*dtl_consumer)(struct dtl_entry *, u64);
+
 /*
  * Scan the dispatch trace log and count up the stolen time.
  * Should be called with interrupts disabled.
diff --git a/drivers/rtc/rtc-vr41xx.c b/drivers/rtc/rtc-vr41xx.c
index 5a9f9ad86d32..cc31db058197 100644
--- a/drivers/rtc/rtc-vr41xx.c
+++ b/drivers/rtc/rtc-vr41xx.c
@@ -72,7 +72,7 @@ static void __iomem *rtc2_base;
 
 static unsigned long epoch = 1970;	/* Jan 1 1970 00:00:00 */
 
-static DEFINE_SPINLOCK(rtc_lock);
+static DEFINE_SPINLOCK(vr41xx_rtc_lock);
 static char rtc_name[] = "RTC";
 static unsigned long periodic_count;
 static unsigned int alarm_enabled;
@@ -101,13 +101,13 @@ static inline time64_t read_elapsed_second(void)
 
 static inline void write_elapsed_second(time64_t sec)
 {
-	spin_lock_irq(&rtc_lock);
+	spin_lock_irq(&vr41xx_rtc_lock);
 
 	rtc1_write(ETIMELREG, (uint16_t)(sec << 15));
 	rtc1_write(ETIMEMREG, (uint16_t)(sec >> 1));
 	rtc1_write(ETIMEHREG, (uint16_t)(sec >> 17));
 
-	spin_unlock_irq(&rtc_lock);
+	spin_unlock_irq(&vr41xx_rtc_lock);
 }
 
 static int vr41xx_rtc_read_time(struct device *dev, struct rtc_time *time)
@@ -139,14 +139,14 @@ static int vr41xx_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 	unsigned long low, mid, high;
 	struct rtc_time *time = &wkalrm->time;
 
-	spin_lock_irq(&rtc_lock);
+	spin_lock_irq(&vr41xx_rtc_lock);
 
 	low = rtc1_read(ECMPLREG);
 	mid = rtc1_read(ECMPMREG);
 	high = rtc1_read(ECMPHREG);
 	wkalrm->enabled = alarm_enabled;
 
-	spin_unlock_irq(&rtc_lock);
+	spin_unlock_irq(&vr41xx_rtc_lock);
 
 	rtc_time64_to_tm((high << 17) | (mid << 1) | (low >> 15), time);
 
@@ -159,7 +159,7 @@ static int vr41xx_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 
 	alarm_sec = rtc_tm_to_time64(&wkalrm->time);
 
-	spin_lock_irq(&rtc_lock);
+	spin_lock_irq(&vr41xx_rtc_lock);
 
 	if (alarm_enabled)
 		disable_irq(aie_irq);
@@ -173,7 +173,7 @@ static int vr41xx_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 
 	alarm_enabled = wkalrm->enabled;
 
-	spin_unlock_irq(&rtc_lock);
+	spin_unlock_irq(&vr41xx_rtc_lock);
 
 	return 0;
 }
@@ -202,7 +202,7 @@ static int vr41xx_rtc_ioctl(struct device *dev, unsigned int cmd, unsigned long
 
 static int vr41xx_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
 {
-	spin_lock_irq(&rtc_lock);
+	spin_lock_irq(&vr41xx_rtc_lock);
 	if (enabled) {
 		if (!alarm_enabled) {
 			enable_irq(aie_irq);
@@ -214,7 +214,7 @@ static int vr41xx_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
 			alarm_enabled = 0;
 		}
 	}
-	spin_unlock_irq(&rtc_lock);
+	spin_unlock_irq(&vr41xx_rtc_lock);
 	return 0;
 }
 
@@ -296,7 +296,7 @@ static int rtc_probe(struct platform_device *pdev)
 	rtc->range_max = (1ULL << 33) - 1;
 	rtc->max_user_freq = MAX_PERIODIC_RATE;
 
-	spin_lock_irq(&rtc_lock);
+	spin_lock_irq(&vr41xx_rtc_lock);
 
 	rtc1_write(ECMPLREG, 0);
 	rtc1_write(ECMPMREG, 0);
@@ -304,7 +304,7 @@ static int rtc_probe(struct platform_device *pdev)
 	rtc1_write(RTCL1LREG, 0);
 	rtc1_write(RTCL1HREG, 0);
 
-	spin_unlock_irq(&rtc_lock);
+	spin_unlock_irq(&vr41xx_rtc_lock);
 
 	aie_irq = platform_get_irq(pdev, 0);
 	if (aie_irq <= 0) {
-- 
2.17.1

