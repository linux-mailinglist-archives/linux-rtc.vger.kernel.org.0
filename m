Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19013141044
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jan 2020 18:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgAQR4a (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jan 2020 12:56:30 -0500
Received: from mga11.intel.com ([192.55.52.93]:62787 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726603AbgAQR4a (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 17 Jan 2020 12:56:30 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jan 2020 09:56:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,331,1574150400"; 
   d="scan'208";a="262983778"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2020 09:56:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DF1A48D; Fri, 17 Jan 2020 19:56:26 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        "Guilherme G . Piccoli" <gpiccoli@canonical.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/8] rtc: cmos: Use shared IRQ only for Microsoft Surface 3
Date:   Fri, 17 Jan 2020 19:56:19 +0200
Message-Id: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

As reported by Guilherme:

The rtc-cmos interrupt setting was changed in the commit 079062b28fb4
("rtc: cmos: prevent kernel warning on IRQ flags mismatch") in order
to allow shared interrupts; according to that commit's description,
some machine got kernel warnings due to the interrupt line being shared
between rtc-cmos and other hardware, and rtc-cmos didn't allow IRQ sharing
that time.

After the aforementioned commit though it was observed a huge increase
in lost HPET interrupts in some systems, observed through the following
kernel message:

[...] hpet1: lost 35 rtc interrupts

After investigation, it was narrowed down to the shared interrupts
usage when having the kernel option "irqpoll" enabled. In this case,
all IRQ handlers are called for non-timer interrupts, if such handlers
are setup in shared IRQ lines. The rtc-cmos IRQ handler could be set to
hpet_rtc_interrupt(), which will produce the kernel "lost interrupts"
message after doing work - lots of readl/writel to HPET registers, which
are known to be slow.

This patch changes this behavior by preventing shared interrupts for
everything, but Microsoft Surface 3 as stated in the culprit commit message.
Although "irqpoll" is not a default kernel option, it's used in some contexts,
one being the kdump kernel (which is an already "impaired" kernel usually
running with 1 CPU available), so the performance burden could be considerable.
Also, the same issue would happen (in a shorter extent though) when using
"irqfixup" kernel option.

In a quick experiment, a virtual machine with uptime of 2 minutes produced
>300 calls to hpet_rtc_interrupt() when "irqpoll" was set, whereas without
sharing interrupts this number reduced to 1 interrupt. Machines with more
hardware than a VM should generate even more unnecessary HPET interrupts
in this scenario.

Fixes: 079062b28fb4 ("rtc: cmos: prevent kernel warning on IRQ flags mismatch")
Reported-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/rtc/rtc-cmos.c      | 21 +++++++++++++++++++--
 include/linux/mc146818rtc.h |  4 +++-
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 033303708c8b..09b7cdda9f55 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -27,6 +27,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/dmi.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -40,7 +41,6 @@
 #ifdef CONFIG_X86
 #include <asm/i8259.h>
 #include <asm/processor.h>
-#include <linux/dmi.h>
 #endif
 
 /* this is for "generic access to PC-style RTC" using CMOS_READ/CMOS_WRITE */
@@ -836,6 +836,7 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
 
 	if (is_valid_irq(rtc_irq)) {
 		irq_handler_t rtc_cmos_int_handler;
+		unsigned long irq_flags = 0;
 
 		if (use_hpet_alarm()) {
 			rtc_cmos_int_handler = hpet_rtc_interrupt;
@@ -849,8 +850,11 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
 		} else
 			rtc_cmos_int_handler = cmos_interrupt;
 
+		if (flags & CMOS_RTC_FLAGS_SHARED_IRQ)
+			irq_flags |= IRQF_SHARED;
+
 		retval = request_irq(rtc_irq, rtc_cmos_int_handler,
-				IRQF_SHARED, dev_name(&cmos_rtc.rtc->dev),
+				irq_flags, dev_name(&cmos_rtc.rtc->dev),
 				cmos_rtc.rtc);
 		if (retval < 0) {
 			dev_dbg(dev, "IRQ %d is already in use\n", rtc_irq);
@@ -1215,6 +1219,16 @@ static void use_acpi_alarm_quirks(void)
 static inline void use_acpi_alarm_quirks(void) { }
 #endif
 
+static const struct dmi_system_id rtc_cmos_surface3_table[] = {
+	{
+		.ident = "Microsoft Surface 3",
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
+		},
+	},
+	{}
+};
+
 /* Every ACPI platform has a mc146818 compatible "cmos rtc".  Here we find
  * its device node and pass extra config data.  This helps its driver use
  * capabilities that the now-obsolete mc146818 didn't have, and informs it
@@ -1229,6 +1243,9 @@ static void cmos_wake_setup(struct device *dev)
 
 	use_acpi_alarm_quirks();
 
+	if (dmi_check_system(rtc_cmos_surface3_table))
+		acpi_rtc_info.flags |= CMOS_RTC_FLAGS_SHARED_IRQ;
+
 	rtc_wake_setup(dev);
 	acpi_rtc_info.wake_on = rtc_wake_on;
 	acpi_rtc_info.wake_off = rtc_wake_off;
diff --git a/include/linux/mc146818rtc.h b/include/linux/mc146818rtc.h
index 0661af17a758..d62d69b48b3e 100644
--- a/include/linux/mc146818rtc.h
+++ b/include/linux/mc146818rtc.h
@@ -35,7 +35,9 @@ struct cmos_rtc_board_info {
 	void	(*wake_off)(struct device *dev);
 
 	u32	flags;
-#define CMOS_RTC_FLAGS_NOFREQ	(1 << 0)
+#define CMOS_RTC_FLAGS_NOFREQ		(1 << 0)
+#define CMOS_RTC_FLAGS_SHARED_IRQ	(1 << 1)
+
 	int	address_space;
 
 	u8	rtc_day_alarm;		/* zero, or register index */
-- 
2.24.1

