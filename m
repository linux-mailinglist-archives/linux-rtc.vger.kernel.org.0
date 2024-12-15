Return-Path: <linux-rtc+bounces-2732-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 328DC9F21BB
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Dec 2024 03:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B571A1886D22
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Dec 2024 02:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461B5522F;
	Sun, 15 Dec 2024 02:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="U57B8Y/K"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B663D68;
	Sun, 15 Dec 2024 02:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734229462; cv=none; b=ET+1V0fOhTXxdM+y6qx3eqhGc2HrCWqQnpsrFf8CPtQxMEXdxNfgZlXgczzRKCkvqOqVBYO2tf2opBFqRQFeHP23L+RcFC54Nt1wuCnI9ypccRqtwET5s0soq4E3UkNcQ8Qdnqndpy8qZYZOOxS32+EBAoxy8YfH5McLZUQ3FW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734229462; c=relaxed/simple;
	bh=jGPopWmX1xlN9nq/1Y3c9K41mIFQFaULt0dCbu3WuZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=STPe4VJtSOVVjMBcNkdalOOLLSF1I5C51ZXaQDGn8Deoz4KOmQAItuFvd8mIf3UQZxeLd1dlnlhyeDwgzsLUNqv5j9WgBIeKbf++Ugr/iP3baVrjMQ+f+RcQNhm7pfZuZ0JUSD8zEy3x9Wi9WsfWhIxjdO3lTSpyvrmcUumsbLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=U57B8Y/K; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=rL0oTmB2iSe6RXlIBnzrVi61wE1l8L5JqTcTH9KVf2w=; b=U57B8Y/KZbR9NqyK
	CQhPpUWqU6xKuainSWZhc5dQ3GBz1zV+ttwdeRK5T8Gmd5OK/o4woc87r/S+2XRly6wZSpWauX+0C
	4M7TW+wcAnDAk31wmAremRgpqlCHT46Mhb2CCm4/9/T574TbBmRdxZKqPKuPOWmvwZBX2vkE/mE7T
	xeGDLys9eX+fDtENSgtumyQaBnBfDAPcDuZQ5Xy5lrUa6twZQHt4YLOhE1CJw/3wJn6rvpmj+rpK2
	YGE9/HzMV4uC/4pQorXShVrmETj2ltki3xHmoNVy86ioXdIEainM63xkHz6EOp8YyxsdFRAyq+4fr
	Vs74llZmKjr+BfbcOw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tMeIY-005REz-0C;
	Sun, 15 Dec 2024 02:23:58 +0000
From: linux@treblig.org
To: bp@alien8.de,
	mingo@redhat.com,
	tglx@linutronix.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	alexandre.belloni@bootlin.com
Cc: x86@kernel.org,
	linux-rtc@vger.kernel.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] rtc: Remove hpet_rtc_dropped_irq()
Date: Sun, 15 Dec 2024 02:23:56 +0000
Message-ID: <20241215022356.181625-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

hpet_rtc_dropped_irq() has been unused since
commit f52ef24be21a ("rtc/alpha: remove legacy rtc driver")

Remove it in rtc, and x86 hpet code.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 arch/x86/include/asm/hpet.h | 1 -
 arch/x86/kernel/hpet.c      | 6 ------
 drivers/rtc/rtc-cmos.c      | 5 -----
 3 files changed, 12 deletions(-)

diff --git a/arch/x86/include/asm/hpet.h b/arch/x86/include/asm/hpet.h
index ab9f3dd87c80..ab0c78855ecb 100644
--- a/arch/x86/include/asm/hpet.h
+++ b/arch/x86/include/asm/hpet.h
@@ -84,7 +84,6 @@ extern int hpet_set_rtc_irq_bit(unsigned long bit_mask);
 extern int hpet_set_alarm_time(unsigned char hrs, unsigned char min,
 			       unsigned char sec);
 extern int hpet_set_periodic_freq(unsigned long freq);
-extern int hpet_rtc_dropped_irq(void);
 extern int hpet_rtc_timer_init(void);
 extern irqreturn_t hpet_rtc_interrupt(int irq, void *dev_id);
 extern int hpet_register_irq_handler(rtc_irq_handler handler);
diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
index c96ae8fee95e..7e21018a0e04 100644
--- a/arch/x86/kernel/hpet.c
+++ b/arch/x86/kernel/hpet.c
@@ -1392,12 +1392,6 @@ int hpet_set_periodic_freq(unsigned long freq)
 }
 EXPORT_SYMBOL_GPL(hpet_set_periodic_freq);
 
-int hpet_rtc_dropped_irq(void)
-{
-	return is_hpet_enabled();
-}
-EXPORT_SYMBOL_GPL(hpet_rtc_dropped_irq);
-
 static void hpet_rtc_timer_reinit(void)
 {
 	unsigned int delta;
diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 78f2ce12c75a..9c8ce7510c56 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -151,11 +151,6 @@ static inline int hpet_set_periodic_freq(unsigned long freq)
 	return 0;
 }
 
-static inline int hpet_rtc_dropped_irq(void)
-{
-	return 0;
-}
-
 static inline int hpet_rtc_timer_init(void)
 {
 	return 0;
-- 
2.47.1


