Return-Path: <linux-rtc+bounces-4215-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DDFACBC48
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Jun 2025 22:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F3FF1892A09
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Jun 2025 20:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBAE221FD0;
	Mon,  2 Jun 2025 20:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b="w0Jxn9HD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B843F1BEF8C
	for <linux-rtc@vger.kernel.org>; Mon,  2 Jun 2025 20:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748896065; cv=none; b=uMLcPytohJYfDJ1/xluuZoRkLiX9ZO7wrEDcAIkx+yL1RCnseLZc7cIyaZJ8DfzOPXFJ3sX4sLEoajiBDtTYqK0lCwlo1RhwZkt1+wcjYrYmpU5Lu4WCaVW9AS2cESUP2tEKy5I0U/gQmZ9XV+iGP4kaJYjYE1/C9qaZWNWw4u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748896065; c=relaxed/simple;
	bh=n+jCYVhQRi5LIQhJcRoGurAAZtIH5inbBx+yn9CpDw8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fJk1keVwwmsf9zCqtciIyIG8OIdlX6Eg0oajWKKQ9QHWp3zlLn44Esj59vqsBQy/Yb7AGLWnBGtZQhkAHAAn6Vxifs/zxFpvnz5Qkh6w0uV/iPOBIMYQB2Yvk+Cvtk4JLFJ58CudzyU8Mv4EjQAP+5EFDfYBvR5aZzhU0YjCXOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b=w0Jxn9HD; arc=none smtp.client-ip=193.222.135.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 34503 invoked from network); 2 Jun 2025 22:20:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1748895659; bh=ym2M7zvD/JGRuJYqVWmOqTfwrMcLMYmxiC+N/CwqG2I=;
          h=From:To:Cc:Subject;
          b=w0Jxn9HDQdfXD8Bz4Fc6o/IowBYPV8f0Orvcb1H7EYtQ53nn/r59FzwnTej9Ndzw7
           iLlAyIJxL/fxZYc/eEosRE+7hkzjZqWf0YrdCCBkzM60OxgmoE5s0JqQBbyRP34Uw5
           q9Gbz8L5Q7IcYFJ544Wy4vuaLk3cuW52EBdwcatAOJZ5BvP+5GDOM1WIAQp22oQqj2
           LRfOsk+QaHdEmaYN+275fMusoGtw/d0WbHZzT18nZDhy0D0zYBYNQbcfn0pZqZS/UP
           mmkII6xHvuyKA36pU1iSflLlbGP4NLMz2oY3PZI6qeOWWsv8kJxs1GL/lagtBcxARH
           4BVbCl5Ka3Kkw==
Received: from apn-31-0-2-65.dynamic.gprs.plus.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[31.0.2.65])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <chris.bainbridge@gmail.com>; 2 Jun 2025 22:20:59 +0200
From: =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To: Chris Bainbridge <chris.bainbridge@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	lkml <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	=?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Subject: [DRAFT PATCH] rtc-cmos: use spin_lock_irqsave in cmos_interrupt
Date: Mon,  2 Jun 2025 22:20:19 +0200
Message-Id: <20250602202019.625331-1-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <74bcd576-d410-45b2-aaf0-05aedf96b8be@o2.pl>
References: <74bcd576-d410-45b2-aaf0-05aedf96b8be@o2.pl>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: o2.pl)                                                      
X-WP-MailID: c6440f7c3ffbb3307021f0e989c11d45
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [UdOR]                               

cmos_interrupt() can also be called also in non-interrupt contexts, such
as in ACPI handlers via rtc_handler(). Therefore, usage of
spin_lock(&rtc_lock) is insecure. Use spin_lock_irqsave() / etc.
instead.

Remove the local_irq_disable() hacks in cmos_check_wkalrm() and add a
comment so that these _irqsave / _irqrestore will not be disabled again,
as in

commit 6950d046eb6e ("rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ")

Untested yet.

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Fixes: 13be2efc390a ("rtc: cmos: Disable irq around direct invocation of cmos_interrupt()")
---
 drivers/rtc/rtc-cmos.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 8172869bd3d7..399bb82e6153 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -692,8 +692,12 @@ static irqreturn_t cmos_interrupt(int irq, void *p)
 {
 	u8		irqstat;
 	u8		rtc_control;
+	unsigned long	flags;
 
-	spin_lock(&rtc_lock);
+	/* We cannot use spin_lock() here, as cmos_interrupt() is also called
+	 * in non-irq context.
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


