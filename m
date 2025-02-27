Return-Path: <linux-rtc+bounces-3286-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01459A48007
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2025 14:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7701E17CE93
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2025 13:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEA4233158;
	Thu, 27 Feb 2025 13:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iXPWfMd+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DC3233D87
	for <linux-rtc@vger.kernel.org>; Thu, 27 Feb 2025 13:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663824; cv=none; b=ZHEyM5ourM+Xl55QOki0KFugyMKnnxmjuW6TCHdBJ+O+TCJSEZ5GUEV4NqworCStASxR+lAAaPiau/mOu1t5+kUUBmlR0cTNkSWl9iE5zS7Y6zuB/4b78MjjYXSLkofi52z8MAMzs91gEnZr670BSKbdwlBEU/OBXpUkGKhtAt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663824; c=relaxed/simple;
	bh=U6n/H40musBB5lnG+MWME+/V8NSXjxciFG3PenyFzm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqdjej6IW/UNya+sN3kAoeqa9zq8sJWLTIEsrzQ6hbfk3X2ChIQ1s3HfDGR+gReboCqqVkoJyuvfLJZGyLPEF/XN8GglgY2zEp1cMbqUTuxd8sWkDbdFVqnJVsGCQQbCaaq+lH8cSS6kRxtfyBnP+WjyiKuWCIw1Wxu5tkScFWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iXPWfMd+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=PBspQWhBgZsPi9uOPbHH9ZhmabqvDjdep8eQaQ/UPOA=; b=iXPWfM
	d+dMW3yA4sZFc4tYhBb2RuSewn/n8gP1Lqxlrfe3SEfnIx/QW0Oaywd57UTQoEHr
	cEIj2uE8DrkQSsPqGCL10fQzF4Je+LN+dE48VtlxYkWnNRkL1UbeomfD55Ia91ms
	dzI5wsQKaDJqDFL4iwAS1EHjIm/nd0R5tyOa3RVDW2IuBSYoEVDhx5BBEbUHz+oK
	wkbDAYvE6hyJC2/C3rOpPvoMQ9rL4PL3ZlyaSHPeZqD7+Xqxmwyg3VPc33ErpVAv
	8PCHCFwDFb6X7BVNDouHIgS11cjV6F8mYmlvkjRx+e4meJrBhgPHVZVAbjKnSF26
	osVF88Kh00/hdNdA==
Received: (qmail 962376 invoked from network); 27 Feb 2025 14:43:32 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Feb 2025 14:43:32 +0100
X-UD-Smtp-Session: l3s3148p1@4+Ay4B8vQQltKPD9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH 4/8] rtc: sh: remove periodic interrupt handling
Date: Thu, 27 Feb 2025 14:42:59 +0100
Message-ID: <20250227134256.9167-14-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250227134256.9167-10-wsa+renesas@sang-engineering.com>
References: <20250227134256.9167-10-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because periodic interrupts are emulated by the RTC core, the PIE
handling code can simply go away now. And with it the custom proc-file.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-sh.c | 69 --------------------------------------------
 1 file changed, 69 deletions(-)

diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index 469806604f31..e80d4ae979c9 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -72,12 +72,6 @@
 /* ALARM Bits - or with BCD encoded value */
 #define AR_ENB		0x80	/* Enable for alarm cmp   */
 
-/* Period Bits */
-#define PF_HP		0x100	/* Enable Half Period to support 8,32,128Hz */
-#define PF_COUNT	0x200	/* Half periodic counter */
-#define PF_KOU		0x800	/* Kernel or User periodic request 1=kernel */
-#define PF_MASK		0xf00
-
 /* RCR1 Bits */
 #define RCR1_CF		0x80	/* Carry Flag             */
 #define RCR1_CIE	0x10	/* Carry Interrupt Enable */
@@ -85,8 +79,6 @@
 #define RCR1_AF		0x01	/* Alarm Flag             */
 
 /* RCR2 Bits */
-#define RCR2_PEF	0x80	/* PEriodic interrupt Flag */
-#define RCR2_PESMASK	0x70	/* Periodic interrupt Set  */
 #define RCR2_RTCEN	0x08	/* ENable RTC              */
 #define RCR2_ADJ	0x04	/* ADJustment (30-second)  */
 #define RCR2_RESET	0x02	/* Reset bit               */
@@ -103,7 +95,6 @@ struct sh_rtc {
 	struct rtc_device	*rtc_dev;
 	spinlock_t		lock;
 	unsigned long		capabilities;	/* See asm/rtc.h for cap bits */
-	unsigned short		periodic_freq;
 };
 
 static int __sh_rtc_alarm(struct sh_rtc *rtc)
@@ -121,30 +112,6 @@ static int __sh_rtc_alarm(struct sh_rtc *rtc)
 	return pending;
 }
 
-static int __sh_rtc_periodic(struct sh_rtc *rtc)
-{
-	unsigned int tmp, pending;
-
-	tmp = readb(rtc->regbase + RCR2);
-	pending = tmp & RCR2_PEF;
-	tmp &= ~RCR2_PEF;
-	writeb(tmp, rtc->regbase + RCR2);
-
-	if (!pending)
-		return 0;
-
-	/* Half period enabled than one skipped and the next notified */
-	if ((rtc->periodic_freq & PF_HP) && (rtc->periodic_freq & PF_COUNT))
-		rtc->periodic_freq &= ~PF_COUNT;
-	else {
-		if (rtc->periodic_freq & PF_HP)
-			rtc->periodic_freq |= PF_COUNT;
-		rtc_update_irq(rtc->rtc_dev, 1, RTC_PF | RTC_IRQF);
-	}
-
-	return pending;
-}
-
 static irqreturn_t sh_rtc_alarm(int irq, void *dev_id)
 {
 	struct sh_rtc *rtc = dev_id;
@@ -157,18 +124,6 @@ static irqreturn_t sh_rtc_alarm(int irq, void *dev_id)
 	return IRQ_RETVAL(ret);
 }
 
-static irqreturn_t sh_rtc_periodic(int irq, void *dev_id)
-{
-	struct sh_rtc *rtc = dev_id;
-	int ret;
-
-	spin_lock(&rtc->lock);
-	ret = __sh_rtc_periodic(rtc);
-	spin_unlock(&rtc->lock);
-
-	return IRQ_RETVAL(ret);
-}
-
 static irqreturn_t sh_rtc_shared(int irq, void *dev_id)
 {
 	struct sh_rtc *rtc = dev_id;
@@ -176,7 +131,6 @@ static irqreturn_t sh_rtc_shared(int irq, void *dev_id)
 
 	spin_lock(&rtc->lock);
 	ret = __sh_rtc_alarm(rtc);
-	ret |= __sh_rtc_periodic(rtc);
 	spin_unlock(&rtc->lock);
 
 	return IRQ_RETVAL(ret);
@@ -201,18 +155,6 @@ static inline void sh_rtc_setaie(struct device *dev, unsigned int enable)
 	spin_unlock_irq(&rtc->lock);
 }
 
-static int sh_rtc_proc(struct device *dev, struct seq_file *seq)
-{
-	struct sh_rtc *rtc = dev_get_drvdata(dev);
-	unsigned int tmp;
-
-	tmp = readb(rtc->regbase + RCR2);
-	seq_printf(seq, "periodic_IRQ\t: %s\n",
-		   (tmp & RCR2_PESMASK) ? "yes" : "no");
-
-	return 0;
-}
-
 static int sh_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
 {
 	sh_rtc_setaie(dev, enabled);
@@ -405,7 +347,6 @@ static const struct rtc_class_ops sh_rtc_ops = {
 	.set_time	= sh_rtc_set_time,
 	.read_alarm	= sh_rtc_read_alarm,
 	.set_alarm	= sh_rtc_set_alarm,
-	.proc		= sh_rtc_proc,
 	.alarm_irq_enable = sh_rtc_alarm_irq_enable,
 };
 
@@ -512,16 +453,6 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
 			goto err_unmap;
 		}
 	} else {
-		/* register periodic/carry/alarm irqs */
-		ret = devm_request_irq(&pdev->dev, rtc->periodic_irq,
-				sh_rtc_periodic, 0, "sh-rtc period", rtc);
-		if (unlikely(ret)) {
-			dev_err(&pdev->dev,
-				"request period IRQ failed with %d, IRQ %d\n",
-				ret, rtc->periodic_irq);
-			goto err_unmap;
-		}
-
 		ret = devm_request_irq(&pdev->dev, rtc->alarm_irq,
 				sh_rtc_alarm, 0, "sh-rtc alarm", rtc);
 		if (unlikely(ret)) {
-- 
2.45.2


