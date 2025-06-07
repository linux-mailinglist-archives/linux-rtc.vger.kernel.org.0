Return-Path: <linux-rtc+bounces-4239-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4AFAD0FDF
	for <lists+linux-rtc@lfdr.de>; Sat,  7 Jun 2025 23:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB0683AD52F
	for <lists+linux-rtc@lfdr.de>; Sat,  7 Jun 2025 21:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58919215798;
	Sat,  7 Jun 2025 21:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b="ITNH5pMI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B02202996
	for <linux-rtc@vger.kernel.org>; Sat,  7 Jun 2025 21:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749330818; cv=none; b=sPqItV52EAfSintYGNf2F7J2WgLtRMCXVbkismokqBrfawS1R1JQX1yt/QTMqs06mdPg4kj9bf3eFW1r+ZPOl2fD0wRtO9F+i5TWwfqt9sDLYCFqeC4AhyyAjotBjCGu3960mOsu6M8Nfc2+DQl1jdWbXmdrz8a9nW83ud+pkEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749330818; c=relaxed/simple;
	bh=JhS/3J2SU7iIGZNswJTzWeXgREd1y0GyGvdgpN4wbjo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ZDfNasAISj5VdS+3xZoXzkL/Y2LxTR2t0nSCOxN7pRK1aEFBOCLhfR3O0MwySXny4WphWBMSSzegK9eXG9V6052JL6sWNqOyHBkft5dEfouq6q0J5NNnrYM0QyAnk38XJyF24F223MdFU5JKws0H5shUL9XDsXylspdOWc7UGCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b=ITNH5pMI; arc=none smtp.client-ip=193.222.135.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 48497 invoked from network); 7 Jun 2025 23:06:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1749330411; bh=J8z8CmQGGnB7Po1XsaFy2bygOPjhaFEoBcJC83rCADc=;
          h=From:To:Cc:Subject;
          b=ITNH5pMIvX/YMOIRljeHHOAw8BRIqAgscg2v5PSDuxzHuJ91hWlydSg7OfUQrcHIs
           2dbP+ZGEU5kwiTydX676hoNqsorOCICxKkuCW0opqjl8dcrobtNXWyBKKMhe4qlYfn
           j7YqaJFjZ8ez0GrRjpLAZRaeOoM/Oc0nI8wtXOoXt6WyUL2MKbHXO1ruWHnK80FO7h
           PGxXSsf50vCLbVeMv2nyEU08in3oZFvAypQ8hD20J5ogjQ2yADLRfpul9LGys7dz+j
           Jk6UH6TnCwcE93lZQKCDF48FJ3nj8rT15G5XZ7ngncMO3r5yW1jtAsWC0c/IN5q/uD
           wiZ+3ptGwMGfg==
Received: from unknown (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[37.109.146.87])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <alexandre.belloni@bootlin.com>; 7 Jun 2025 23:06:51 +0200
From: =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	linux-rtc@vger.kernel.org,
	lkml <linux-kernel@vger.kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Xiaofei Tan <tanxiaofei@huawei.com>,
	=?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	stable@vger.kernel.org
Subject: [PATCH] rtc-cmos: use spin_lock_irqsave in cmos_interrupt
Date: Sat,  7 Jun 2025 23:06:08 +0200
Message-Id: <20250607210608.14835-1-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: bd40430050a01a7b884864c3ef3e9e75
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [AZNk]                               

cmos_interrupt() can be called in a non-interrupt context, such as in
an ACPI event handler (which runs in an interrupt thread). Therefore,
usage of spin_lock(&rtc_lock) is insecure. Use spin_lock_irqsave() /
spin_unlock_irqrestore() instead.

Before a misguided
commit 6950d046eb6e ("rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ")
the cmos_interrupt() function used spin_lock_irqsave(). That commit
changed it to spin_lock() and broke locking, which was partially fixed in
commit 13be2efc390a ("rtc: cmos: Disable irq around direct invocation of cmos_interrupt()")

That second commit did not take account of the ACPI fixed event handler
pathway, however. It introduced local_irq_disable() workarounds in
cmos_check_wkalrm(), which can cause problems on PREEMPT_RT kernels
and are now unnecessary.

Add an explicit comment so that this change will not be reverted by
mistake.

Cc: <stable@vger.kernel.org>
Fixes: 6950d046eb6e ("rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ")
Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Tested-by: Chris Bainbridge <chris.bainbridge@gmail.com>
Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
Closes: https://lore.kernel.org/all/aDtJ92foPUYmGheF@debian.local/

---

Changes after DRAFT version of the patch:
- rewrite commit message,
- test this locally (also on top of 5.10.238 for the stable backport),
- fix a grammar mistake in the comment.
---
 drivers/rtc/rtc-cmos.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 8172869bd3d7..0743c6acd6e2 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -692,8 +692,12 @@ static irqreturn_t cmos_interrupt(int irq, void *p)
 {
 	u8		irqstat;
 	u8		rtc_control;
+	unsigned long	flags;
 
-	spin_lock(&rtc_lock);
+	/* We cannot use spin_lock() here, as cmos_interrupt() is also called
+	 * in a non-irq context.
+	 */
+	spin_lock_irqsave(&rtc_lock, flags);
 
 	/* When the HPET interrupt handler calls us, the interrupt
 	 * status is passed as arg1 instead of the irq number.  But
@@ -727,7 +731,7 @@ static irqreturn_t cmos_interrupt(int irq, void *p)
 			hpet_mask_rtc_irq_bit(RTC_AIE);
 		CMOS_READ(RTC_INTR_FLAGS);
 	}
-	spin_unlock(&rtc_lock);
+	spin_unlock_irqrestore(&rtc_lock, flags);
 
 	if (is_intr(irqstat)) {
 		rtc_update_irq(p, 1, irqstat);
@@ -1295,9 +1299,7 @@ static void cmos_check_wkalrm(struct device *dev)
 	 * ACK the rtc irq here
 	 */
 	if (t_now >= cmos->alarm_expires && cmos_use_acpi_alarm()) {
-		local_irq_disable();
 		cmos_interrupt(0, (void *)cmos->rtc);
-		local_irq_enable();
 		return;
 	}
 
-- 
2.25.1


