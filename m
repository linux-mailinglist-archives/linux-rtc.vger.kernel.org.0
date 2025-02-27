Return-Path: <linux-rtc+bounces-3279-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 456ABA47FFD
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2025 14:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7CBD1763E0
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2025 13:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC9B233D72;
	Thu, 27 Feb 2025 13:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ifUpU8HT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2204233145
	for <linux-rtc@vger.kernel.org>; Thu, 27 Feb 2025 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663820; cv=none; b=Eo+EFYMD4PLkWTf/UHBDSlgwuHVeonIwFBslLGIMEykAXbfx8GXfK8MJgrBf4uzkuuzuUjg7W9JXguEuoVEZGWPT+stMNkqVtmW6LK8O0BizlyHLHTVN9tEPPvCBIRGByM589SgXPUQeJjUHT0S7Ya010bkrxecXznzqLfsgHmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663820; c=relaxed/simple;
	bh=P8Yw1yGrxqa7Bvw9rSGPLm2yaGmL/AMged1PXweAGik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JzFgNKCjcwpRfKlKDpZvqCCbIke+PDscLMJBGCDmYIR5elgY734EO+Sqm9P5Ga+U0fw+egoaKSEXXKF4F4bPuJEoKzTKfEJJ9Mdgm1baNNncQrCvlj8pCUJSsyLoHB+bKrwLm2mAwq2uGvfxQ5tFuTHmWVRehk4Kxz+UDWwe/Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ifUpU8HT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=sVSwqlrd6Jxe4jgfxwSWOcmRIZzQdYsZIwceMu9SgUk=; b=ifUpU8
	HTxhUjx/11J3OttHT5xIyLD0RIYY7rnlqfCIlgyatRJeC4l1T2UsxFNtDNAAFySz
	Ohom+KcpR8ByasrJ1lMprdFPmAqU5jv5R6ca8CYdiEgQON7Wei7mpabGthNCmUIo
	+OoUpdc22FCnhgDxUDKewSwPWa1eUAsgNBusDjUaRAnrgApn9IYZegeUpXlDrDOX
	NiVEKmTSeYjKHdGfLrS4DzfKJ/RA6eoGgpCRvZc3wJjK0yZF6Gtb4usqqXd1iY7T
	AzO4xDzUvgAPgmOXOyqf4BCsymiU5VXT3S14W8Z/7gI1ijCxI1IBTTy3N8PQkoHn
	GDLVrlFR9vnvCsIA==
Received: (qmail 962328 invoked from network); 27 Feb 2025 14:43:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Feb 2025 14:43:30 +0100
X-UD-Smtp-Session: l3s3148p1@nOYQ4B8v3Q5tKPD9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH 2/8] rtc: sh: remove update interrupt handling
Date: Thu, 27 Feb 2025 14:42:57 +0100
Message-ID: <20250227134256.9167-12-wsa+renesas@sang-engineering.com>
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

Since commit e428c6a2772b ("RTC: Clean out UIE icotl implementations"),
the flag for UIE cannot be set anymore. Because UIE is now handled via
regular alarms and a timerqueue by the RTC core, the UIE handling code
can simply go away now.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-sh.c | 48 +-------------------------------------------
 1 file changed, 1 insertion(+), 47 deletions(-)

diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index 3409f5764224..f8227a71084a 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -75,7 +75,6 @@
 /* Period Bits */
 #define PF_HP		0x100	/* Enable Half Period to support 8,32,128Hz */
 #define PF_COUNT	0x200	/* Half periodic counter */
-#define PF_OXS		0x400	/* Periodic One x Second */
 #define PF_KOU		0x800	/* Kernel or User periodic request 1=kernel */
 #define PF_MASK		0xf00
 
@@ -107,22 +106,6 @@ struct sh_rtc {
 	unsigned short		periodic_freq;
 };
 
-static int __sh_rtc_interrupt(struct sh_rtc *rtc)
-{
-	unsigned int tmp, pending;
-
-	tmp = readb(rtc->regbase + RCR1);
-	pending = tmp & RCR1_CF;
-	tmp &= ~RCR1_CF;
-	writeb(tmp, rtc->regbase + RCR1);
-
-	/* Users have requested One x Second IRQ */
-	if (pending && rtc->periodic_freq & PF_OXS)
-		rtc_update_irq(rtc->rtc_dev, 1, RTC_UF | RTC_IRQF);
-
-	return pending;
-}
-
 static int __sh_rtc_alarm(struct sh_rtc *rtc)
 {
 	unsigned int tmp, pending;
@@ -162,18 +145,6 @@ static int __sh_rtc_periodic(struct sh_rtc *rtc)
 	return pending;
 }
 
-static irqreturn_t sh_rtc_interrupt(int irq, void *dev_id)
-{
-	struct sh_rtc *rtc = dev_id;
-	int ret;
-
-	spin_lock(&rtc->lock);
-	ret = __sh_rtc_interrupt(rtc);
-	spin_unlock(&rtc->lock);
-
-	return IRQ_RETVAL(ret);
-}
-
 static irqreturn_t sh_rtc_alarm(int irq, void *dev_id)
 {
 	struct sh_rtc *rtc = dev_id;
@@ -204,8 +175,7 @@ static irqreturn_t sh_rtc_shared(int irq, void *dev_id)
 	int ret;
 
 	spin_lock(&rtc->lock);
-	ret = __sh_rtc_interrupt(rtc);
-	ret |= __sh_rtc_alarm(rtc);
+	ret = __sh_rtc_alarm(rtc);
 	ret |= __sh_rtc_periodic(rtc);
 	spin_unlock(&rtc->lock);
 
@@ -236,9 +206,6 @@ static int sh_rtc_proc(struct device *dev, struct seq_file *seq)
 	struct sh_rtc *rtc = dev_get_drvdata(dev);
 	unsigned int tmp;
 
-	tmp = readb(rtc->regbase + RCR1);
-	seq_printf(seq, "carry_IRQ\t: %s\n", (tmp & RCR1_CIE) ? "yes" : "no");
-
 	tmp = readb(rtc->regbase + RCR2);
 	seq_printf(seq, "periodic_IRQ\t: %s\n",
 		   (tmp & RCR2_PESMASK) ? "yes" : "no");
@@ -320,10 +287,6 @@ static int sh_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		tm->tm_sec--;
 #endif
 
-	/* only keep the carry interrupt enabled if UIE is on */
-	if (!(rtc->periodic_freq & PF_OXS))
-		sh_rtc_setcie(dev, 0);
-
 	dev_dbg(dev, "%s: tm is secs=%d, mins=%d, hours=%d, "
 		"mday=%d, mon=%d, year=%d, wday=%d\n",
 		__func__,
@@ -577,15 +540,6 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
 			goto err_unmap;
 		}
 
-		ret = devm_request_irq(&pdev->dev, rtc->carry_irq,
-				sh_rtc_interrupt, 0, "sh-rtc carry", rtc);
-		if (unlikely(ret)) {
-			dev_err(&pdev->dev,
-				"request carry IRQ failed with %d, IRQ %d\n",
-				ret, rtc->carry_irq);
-			goto err_unmap;
-		}
-
 		ret = devm_request_irq(&pdev->dev, rtc->alarm_irq,
 				sh_rtc_alarm, 0, "sh-rtc alarm", rtc);
 		if (unlikely(ret)) {
-- 
2.45.2


