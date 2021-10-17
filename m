Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62035430BD6
	for <lists+linux-rtc@lfdr.de>; Sun, 17 Oct 2021 21:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344591AbhJQTm0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 17 Oct 2021 15:42:26 -0400
Received: from mx-out.tlen.pl ([193.222.135.142]:14143 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344585AbhJQTm0 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 17 Oct 2021 15:42:26 -0400
Received: (wp-smtpd smtp.tlen.pl 27105 invoked from network); 17 Oct 2021 21:40:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1634499614; bh=++yLTnPRj4tvCVqJQRXnOoA9w6viZBnPxa1M6V+Fvh0=;
          h=From:To:Cc:Subject;
          b=pQo8RgLl6x1CNdnLjPQOHjOAKDfW4LCfubk6pXaGsngHQZGMv7nrc5Okm3sHoneDn
           H4ymBvRxf14kK/qGzT/7g5hm82RueyJ41CILMUqU5kcJQ8A3JNxNbhuxupyvwS+eTz
           Q8on9f91F8v8BGQ9pCzeEVrTx3nEnP7OeDLa5kBw=
Received: from aaet142.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.4.123.142])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-kernel@vger.kernel.org>; 17 Oct 2021 21:40:14 +0200
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RESEND 6/6] x86/rtc: rename mach_set_rtc_mmss
Date:   Sun, 17 Oct 2021 21:39:27 +0200
Message-Id: <20211017193927.277409-7-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211017193927.277409-1-mat.jonczyk@o2.pl>
References: <20211017193927.277409-1-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 9d0eece35a2c61499ea8c76439e4131d
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [IbOk]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Once upon a time, before
commit 3195ef59cb42 ("x86: Do full rtc synchronization with ntp")
in 2013, the function set only the minute and seconds registers
of the CMOS RTC. This is no longer true, so rename the function to
mach_set_cmos_time.

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/mc146818rtc.h | 2 +-
 arch/x86/kernel/rtc.c              | 4 ++--
 arch/x86/kernel/x86_init.c         | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/mc146818rtc.h b/arch/x86/include/asm/mc146818rtc.h
index 97198001e567..6115bb3d5795 100644
--- a/arch/x86/include/asm/mc146818rtc.h
+++ b/arch/x86/include/asm/mc146818rtc.h
@@ -95,7 +95,7 @@ static inline unsigned char current_lock_cmos_reg(void)
 unsigned char rtc_cmos_read(unsigned char addr);
 void rtc_cmos_write(unsigned char val, unsigned char addr);
 
-extern int mach_set_rtc_mmss(const struct timespec64 *now);
+extern int mach_set_cmos_time(const struct timespec64 *now);
 extern void mach_get_cmos_time(struct timespec64 *now);
 
 #define RTC_IRQ 8
diff --git a/arch/x86/kernel/rtc.c b/arch/x86/kernel/rtc.c
index bd170362edef..17aa575a2c38 100644
--- a/arch/x86/kernel/rtc.c
+++ b/arch/x86/kernel/rtc.c
@@ -30,13 +30,13 @@ DEFINE_SPINLOCK(rtc_lock);
 EXPORT_SYMBOL(rtc_lock);
 
 /*
- * In order to set the CMOS clock precisely, set_rtc_mmss has to be
+ * In order to set the CMOS clock precisely, mach_set_cmos_time has to be
  * called 500 ms after the second nowtime has started, because when
  * nowtime is written into the registers of the CMOS clock, it will
  * jump to the next second precisely 500 ms later. Check the Motorola
  * MC146818A or Dallas DS12887 data sheet for details.
  */
-int mach_set_rtc_mmss(const struct timespec64 *now)
+int mach_set_cmos_time(const struct timespec64 *now)
 {
 	unsigned long long nowtime = now->tv_sec;
 	struct rtc_time tm;
diff --git a/arch/x86/kernel/x86_init.c b/arch/x86/kernel/x86_init.c
index 8b395821cb8d..8b597c39cf3a 100644
--- a/arch/x86/kernel/x86_init.c
+++ b/arch/x86/kernel/x86_init.c
@@ -133,7 +133,7 @@ struct x86_platform_ops x86_platform __ro_after_init = {
 	.calibrate_cpu			= native_calibrate_cpu_early,
 	.calibrate_tsc			= native_calibrate_tsc,
 	.get_wallclock			= mach_get_cmos_time,
-	.set_wallclock			= mach_set_rtc_mmss,
+	.set_wallclock			= mach_set_cmos_time,
 	.iommu_shutdown			= iommu_shutdown_noop,
 	.is_untracked_pat_range		= is_ISA_range,
 	.nmi_init			= default_nmi_init,
-- 
2.25.1

