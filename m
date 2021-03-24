Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA45434742F
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Mar 2021 10:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234509AbhCXJKZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Mar 2021 05:10:25 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14458 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234263AbhCXJJz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 24 Mar 2021 05:09:55 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F52Sl4svczwPvB;
        Wed, 24 Mar 2021 17:07:51 +0800 (CST)
Received: from huawei.com (10.67.174.47) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Wed, 24 Mar 2021
 17:09:44 +0800
From:   He Ying <heying24@huawei.com>
To:     <mpe@ellerman.id.au>, <benh@kernel.crashing.org>,
        <paulus@samba.org>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <christophe.leroy@csgroup.eu>,
        <npiggin@gmail.com>, <msuchanek@suse.de>, <heying24@huawei.com>,
        <tglx@linutronix.de>, <peterz@infradead.org>,
        <geert@linux-m68k.org>, <geert+renesas@glider.be>,
        <kernelfans@gmail.com>, <frederic@kernel.org>
CC:     <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>
Subject: [PATCH V3 -next] powerpc: kernel/time.c - cleanup warnings
Date:   Wed, 24 Mar 2021 05:09:39 -0400
Message-ID: <20210324090939.143477-1-heying24@huawei.com>
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

Declare 'decrementer_max' in powerpc asm/time.h.
Include linux/mc146818rtc.h in powerpc kernel/time.c where 'rtc_lock'
is declared. And remove duplicated declaration of 'rtc_lock' in powerpc
platforms/chrp/time.c because it has included linux/mc146818rtc.h.
Move 'dtl_consumer' definition behind "include <asm/dtl.h>" because it
is declared there.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: He Ying <heying24@huawei.com>
---
V2:
- Instead of including linux/mc146818rtc.h in powerpc kernel/time.c, declare
  rtc_lock in powerpc asm/time.h.
V3:
- Recover to V1, that is including linux/mc146818rtc.h in powerpc
  kernel/time.c. And remove duplicated declaration of 'rtc_lock' in powerpc
  platforms/chrp/time.c because it has included linux/mc146818rtc.h.

 arch/powerpc/include/asm/time.h    | 1 +
 arch/powerpc/kernel/time.c         | 9 ++++-----
 arch/powerpc/platforms/chrp/time.c | 2 --
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 8dd3cdb25338..2cd2b50bedda 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -22,6 +22,7 @@ extern unsigned long tb_ticks_per_jiffy;
 extern unsigned long tb_ticks_per_usec;
 extern unsigned long tb_ticks_per_sec;
 extern struct clock_event_device decrementer_clockevent;
+extern u64 decrementer_max;
 
 
 extern void generic_calibrate_decr(void);
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index b67d93a609a2..ac81f043bf49 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -55,8 +55,9 @@
 #include <linux/sched/cputime.h>
 #include <linux/sched/clock.h>
 #include <linux/processor.h>
-#include <asm/trace.h>
+#include <linux/mc146818rtc.h>
 
+#include <asm/trace.h>
 #include <asm/interrupt.h>
 #include <asm/io.h>
 #include <asm/nvram.h>
@@ -150,10 +151,6 @@ bool tb_invalid;
 u64 __cputime_usec_factor;
 EXPORT_SYMBOL(__cputime_usec_factor);
 
-#ifdef CONFIG_PPC_SPLPAR
-void (*dtl_consumer)(struct dtl_entry *, u64);
-#endif
-
 static void calc_cputime_factors(void)
 {
 	struct div_result res;
@@ -179,6 +176,8 @@ static inline unsigned long read_spurr(unsigned long tb)
 
 #include <asm/dtl.h>
 
+void (*dtl_consumer)(struct dtl_entry *, u64);
+
 /*
  * Scan the dispatch trace log and count up the stolen time.
  * Should be called with interrupts disabled.
diff --git a/arch/powerpc/platforms/chrp/time.c b/arch/powerpc/platforms/chrp/time.c
index acde7bbe0716..b94dfd5090d8 100644
--- a/arch/powerpc/platforms/chrp/time.c
+++ b/arch/powerpc/platforms/chrp/time.c
@@ -30,8 +30,6 @@
 
 #include <platforms/chrp/chrp.h>
 
-extern spinlock_t rtc_lock;
-
 #define NVRAM_AS0  0x74
 #define NVRAM_AS1  0x75
 #define NVRAM_DATA 0x77
-- 
2.17.1

