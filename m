Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4EC12F903
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Jan 2020 15:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbgACODC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 Jan 2020 09:03:02 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:34094 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727523AbgACODC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 Jan 2020 09:03:02 -0500
Received: from mail-qv1-f70.google.com ([209.85.219.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <gpiccoli@canonical.com>)
        id 1inNXY-0003U7-2v
        for linux-rtc@vger.kernel.org; Fri, 03 Jan 2020 14:03:00 +0000
Received: by mail-qv1-f70.google.com with SMTP id v5so29739753qvn.21
        for <linux-rtc@vger.kernel.org>; Fri, 03 Jan 2020 06:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DV55B2a1aOX4eIGlhup8u6lAiYoiFsDq4mXyCmNykqs=;
        b=anGEHWWW8/hVHDC5YM82EOTLc4p/9ZK77ncGzlFiXi9PkB4xtMZbs2omBCAEOBzRi8
         IzDCRt1tz0Jyiz9UcR3uLT22sEbIUD6b13XVj6ch42r0lYLL0IgX02OCIooBr9w9aaDU
         L73FuX/exUht8Wj8hI1AjDe8P6VO8s90wbNgJJmZG2qe934bdBFcYTZOIv+IMyVuMr2T
         HQzR6QjyhvBGUeuBEJ03XNe44Ba7WIuWtl0jlwoi9o+ahC1LYpTOW4/32gYYvUGEr3JZ
         wR1dil4FQHWEIb564zhgw7nEC+rCaz+B/M+qILJyZnk/rNF95qVQmyLAb334Plq3HuZZ
         wd3A==
X-Gm-Message-State: APjAAAVsYeg7RaqjgSGm8HTMORsDbwdmoqaKM7pSrjwt7I3u4WrLjrQf
        qxNx/Y7v39l/6j2XaS+sbs9BIb5fGTer4ljVEZtFr7gjmFzg+WT3HiHFZwLB3LMbI5xseJHW1z9
        vFWehtJwtl+htgv67e7jA2NEVO6AMQFKCJHlprw==
X-Received: by 2002:a37:4894:: with SMTP id v142mr58947563qka.220.1578060178928;
        Fri, 03 Jan 2020 06:02:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqyLVnLDoatnsCZlrw7U0dBHdwUegTJEmVbhCCqIGeE1/7zZbHXDcd/D08cXdr0MKnGVm4EqHQ==
X-Received: by 2002:a37:4894:: with SMTP id v142mr58947540qka.220.1578060178624;
        Fri, 03 Jan 2020 06:02:58 -0800 (PST)
Received: from localhost ([177.215.78.218])
        by smtp.gmail.com with ESMTPSA id z141sm16422029qkb.63.2020.01.03.06.02.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jan 2020 06:02:56 -0800 (PST)
From:   "Guilherme G. Piccoli" <gpiccoli@canonical.com>
To:     linux-rtc@vger.kernel.org
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        gpiccoli@canonical.com, kernel@gpiccoli.net,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] rtc: cmos: Don't enable shared interrupts if using HPET-based IRQ handler
Date:   Fri,  3 Jan 2020 11:02:40 -0300
Message-Id: <20200103140240.6507-1-gpiccoli@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The rtc-cmos interrupt setting was changed in commit 079062b28fb4
("rtc: cmos: prevent kernel warning on IRQ flags mismatch") in order to
allow shared interrupts; according to that commit's description, some
machine got kernel warnings due to the interrupt line being shared
between rtc-cmos and other hardware, and rtc-cmos didn't allow IRQ
sharing that time.

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

This patch changes this behavior by preventing shared interrupts if the
HPET-based IRQ handler is used instead of the regular cmos_interrupt()
one. Although "irqpoll" is not a default kernel option, it's used in
some contexts, one being the kdump kernel (which is an already "impaired"
kernel usually running with 1 CPU available), so the performance burden
could be considerable. Also, the same issue would happen (in a shorter
extent though) when using "irqfixup" kernel option.

In a quick experiment, a virtual machine with uptime of 2 minutes produced
>300 calls to hpet_rtc_interrupt() when "irqpoll" was set, whereas without
sharing interrupts this number reduced to 1 interrupt. Machines with more
hardware than a VM should generate even more unnecessary HPET interrupts
in this scenario.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
---


Hi all, thanks for reading/reviewing this patch! One of the
alternatives I considered in case sharing interrupts are really
desirable is a new kernel parameter to rtc-cmos to allow
sharing interrupts, and default the IRQ setup to non-shared.

We could also disable sharing if "irqpoll" or "irqfixup" is set,
but this would somewhat "bypass" IRQ code API which I think would
be a bit ugly.

Please let me know your thoughts, and thanks in advance.

Guilherme


 drivers/rtc/rtc-cmos.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 033303708c8b..16416154eb00 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -710,6 +710,7 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
 	unsigned char			rtc_control;
 	unsigned			address_space;
 	u32				flags = 0;
+	unsigned long			irq_flags;
 	struct nvmem_config nvmem_cfg = {
 		.name = "cmos_nvram",
 		.word_size = 1,
@@ -839,6 +840,7 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
 
 		if (use_hpet_alarm()) {
 			rtc_cmos_int_handler = hpet_rtc_interrupt;
+			irq_flags = 0;
 			retval = hpet_register_irq_handler(cmos_interrupt);
 			if (retval) {
 				hpet_mask_rtc_irq_bit(RTC_IRQMASK);
@@ -846,11 +848,13 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
 						" failed in rtc_init().");
 				goto cleanup1;
 			}
-		} else
+		} else {
 			rtc_cmos_int_handler = cmos_interrupt;
+			irq_flags = IRQF_SHARED;
+		}
 
 		retval = request_irq(rtc_irq, rtc_cmos_int_handler,
-				IRQF_SHARED, dev_name(&cmos_rtc.rtc->dev),
+				irq_flags, dev_name(&cmos_rtc.rtc->dev),
 				cmos_rtc.rtc);
 		if (retval < 0) {
 			dev_dbg(dev, "IRQ %d is already in use\n", rtc_irq);
-- 
2.24.0

