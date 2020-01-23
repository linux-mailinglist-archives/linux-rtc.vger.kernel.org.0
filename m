Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5E6D1468D3
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Jan 2020 14:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgAWNOl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 Jan 2020 08:14:41 -0500
Received: from mga17.intel.com ([192.55.52.151]:44925 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbgAWNOl (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 23 Jan 2020 08:14:41 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jan 2020 05:14:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,354,1574150400"; 
   d="scan'208";a="250971636"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 23 Jan 2020 05:14:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AC34B29D; Thu, 23 Jan 2020 15:14:37 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Guilherme G . Piccoli" <gpiccoli@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 1/3] rtc: cmos: Stop using shared IRQ
Date:   Thu, 23 Jan 2020 15:14:35 +0200
Message-Id: <20200123131437.28157-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

As reported by Guilherme G. Piccoli:

---8<---8<---8<---

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

---8<---8<---8<---

After looking into the rtc-cmos driver history and DSDT table from
the Microsoft Surface 3, we may notice that Hans de Goede submitted
a correct fix (see dependency below). Thus, we simply revert
the culprit commit.

Fixes: 079062b28fb4 ("rtc: cmos: prevent kernel warning on IRQ flags mismatch")
Depends-on: a1e23a42f1bd ("rtc: cmos: Do not assume irq 8 for rtc when there are no legacy irqs")
Reported-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v2: Added tags, rework scissors to avoid cutting commit message (Guilherme)
 drivers/rtc/rtc-cmos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 033303708c8b..cb28bbdc9e17 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -850,7 +850,7 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
 			rtc_cmos_int_handler = cmos_interrupt;
 
 		retval = request_irq(rtc_irq, rtc_cmos_int_handler,
-				IRQF_SHARED, dev_name(&cmos_rtc.rtc->dev),
+				0, dev_name(&cmos_rtc.rtc->dev),
 				cmos_rtc.rtc);
 		if (retval < 0) {
 			dev_dbg(dev, "IRQ %d is already in use\n", rtc_irq);
-- 
2.24.1

