Return-Path: <linux-rtc+bounces-3280-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56788A47FC8
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2025 14:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D21B7A5EF2
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2025 13:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9D3233145;
	Thu, 27 Feb 2025 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WRpLOFVr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580FC22FDE6
	for <linux-rtc@vger.kernel.org>; Thu, 27 Feb 2025 13:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663821; cv=none; b=DYt1CRRZ2tqSQSO1dGXZkw3y3h0r0AHPWcOrSRSDFRA3nmOpau1ZQqZAk04tr/s+PIapiiw7910u+qyIhTRedFPpEiU5x0NA6TLaKaBVtYcT+haj4nN1gUthH3pFtYQ9jSf7M3LvU381GcKrLEQJ4eFQefy/MKxXragoB8KioUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663821; c=relaxed/simple;
	bh=ebuycd53Uuy9ErE8bBFYSIEQ+sv4g0fNhgwDIe8DZt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjesGipbxrGNofnplwbgkqUbvx/4UY+U6dYZXXeFxLeYwvqrlex3jzfvjhBQI3G4fOYQpqglHmSU3qzUBz2U+LXhtHq66YLt+Ia6ebkkPfsnZtaQY9fk1HUwIeus2wre5x/yUXpuVShR8w5lv1gfn/blYOjm3LHSR+nl0ACBmzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WRpLOFVr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=par3vHelOry1lwwazqkFXO3/p86mskpoGl7kGns0BBw=; b=WRpLOF
	VruUNZz5ZiwT1lFEgdjlusD4x8/M6dk/btoPgewBqj/FUXQ9y1XsFlSSoYdS2ZaZ
	Ds6wAsRf0TP1NGYS/AEzbJpCxxdaGToO1E3mOWYQ1nVCKgXCLtXhqaGtFLhqQlaN
	F0J2qTZ966yETC2MfsywcL0hKBZ1iMwcvMroBlwKdYiBMTYD6YpDZgt74HDT+1DJ
	Oh7C+G7UVbrWNVs/CFiXb62V201KHNWlDiF0a50gkLgPdd+oJv0YdLbGf0w5f4JD
	1afSa+em+Z99pQE2kcM8lyOieaaI0BMuebQcwu7zRHSgmhN6fLZu6bmRS5tTvM3B
	24rG2qjpV/+l6/6A==
Received: (qmail 962402 invoked from network); 27 Feb 2025 14:43:33 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Feb 2025 14:43:33 +0100
X-UD-Smtp-Session: l3s3148p1@7EVE4B8vqHFtKPD9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH 5/8] rtc: sh: simplify irq setup after refactoring
Date: Thu, 27 Feb 2025 14:43:00 +0100
Message-ID: <20250227134256.9167-15-wsa+renesas@sang-engineering.com>
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

We only need the alarm_irq handler. That means we can remove everything
related to periodic_irq and carry_irq. Also, the shared handler can go
since we only we need the alarm interrupt in any case.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-sh.c | 83 +++++++++-----------------------------------
 1 file changed, 17 insertions(+), 66 deletions(-)

diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index e80d4ae979c9..bf49dbd09cab 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -89,18 +89,19 @@ struct sh_rtc {
 	unsigned long		regsize;
 	struct resource		*res;
 	int			alarm_irq;
-	int			periodic_irq;
-	int			carry_irq;
 	struct clk		*clk;
 	struct rtc_device	*rtc_dev;
 	spinlock_t		lock;
 	unsigned long		capabilities;	/* See asm/rtc.h for cap bits */
 };
 
-static int __sh_rtc_alarm(struct sh_rtc *rtc)
+static irqreturn_t sh_rtc_alarm(int irq, void *dev_id)
 {
+	struct sh_rtc *rtc = dev_id;
 	unsigned int tmp, pending;
 
+	spin_lock(&rtc->lock);
+
 	tmp = readb(rtc->regbase + RCR1);
 	pending = tmp & RCR1_AF;
 	tmp &= ~(RCR1_AF | RCR1_AIE);
@@ -109,31 +110,9 @@ static int __sh_rtc_alarm(struct sh_rtc *rtc)
 	if (pending)
 		rtc_update_irq(rtc->rtc_dev, 1, RTC_AF | RTC_IRQF);
 
-	return pending;
-}
-
-static irqreturn_t sh_rtc_alarm(int irq, void *dev_id)
-{
-	struct sh_rtc *rtc = dev_id;
-	int ret;
-
-	spin_lock(&rtc->lock);
-	ret = __sh_rtc_alarm(rtc);
-	spin_unlock(&rtc->lock);
-
-	return IRQ_RETVAL(ret);
-}
-
-static irqreturn_t sh_rtc_shared(int irq, void *dev_id)
-{
-	struct sh_rtc *rtc = dev_id;
-	int ret;
-
-	spin_lock(&rtc->lock);
-	ret = __sh_rtc_alarm(rtc);
 	spin_unlock(&rtc->lock);
 
-	return IRQ_RETVAL(ret);
+	return IRQ_RETVAL(pending);
 }
 
 static inline void sh_rtc_setaie(struct device *dev, unsigned int enable)
@@ -364,22 +343,16 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
 
 	spin_lock_init(&rtc->lock);
 
-	/* get periodic/carry/alarm irqs */
 	ret = platform_get_irq(pdev, 0);
 	if (unlikely(ret <= 0)) {
 		dev_err(&pdev->dev, "No IRQ resource\n");
 		return -ENOENT;
 	}
 
-	if (!pdev->dev.of_node) {
-		rtc->periodic_irq = ret;
-		rtc->carry_irq = platform_get_irq(pdev, 1);
+	if (!pdev->dev.of_node)
 		rtc->alarm_irq = platform_get_irq(pdev, 2);
-	} else {
+	else
 		rtc->alarm_irq = ret;
-		rtc->periodic_irq = platform_get_irq(pdev, 1);
-		rtc->carry_irq = platform_get_irq(pdev, 2);
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!res)
@@ -442,25 +415,11 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
 	}
 #endif
 
-	if (rtc->carry_irq <= 0) {
-		/* register shared periodic/carry/alarm irq */
-		ret = devm_request_irq(&pdev->dev, rtc->periodic_irq,
-				sh_rtc_shared, 0, "sh-rtc", rtc);
-		if (unlikely(ret)) {
-			dev_err(&pdev->dev,
-				"request IRQ failed with %d, IRQ %d\n", ret,
-				rtc->periodic_irq);
-			goto err_unmap;
-		}
-	} else {
-		ret = devm_request_irq(&pdev->dev, rtc->alarm_irq,
-				sh_rtc_alarm, 0, "sh-rtc alarm", rtc);
-		if (unlikely(ret)) {
-			dev_err(&pdev->dev,
-				"request alarm IRQ failed with %d, IRQ %d\n",
-				ret, rtc->alarm_irq);
-			goto err_unmap;
-		}
+	ret = devm_request_irq(&pdev->dev, rtc->alarm_irq, sh_rtc_alarm, 0, "sh-rtc", rtc);
+	if (ret) {
+		dev_err(&pdev->dev, "request alarm IRQ failed with %d, IRQ %d\n",
+			ret, rtc->alarm_irq);
+		goto err_unmap;
 	}
 
 	platform_set_drvdata(pdev, rtc);
@@ -503,30 +462,22 @@ static void __exit sh_rtc_remove(struct platform_device *pdev)
 	clk_disable(rtc->clk);
 }
 
-static void sh_rtc_set_irq_wake(struct device *dev, int enabled)
+static int __maybe_unused sh_rtc_suspend(struct device *dev)
 {
 	struct sh_rtc *rtc = dev_get_drvdata(dev);
 
-	irq_set_irq_wake(rtc->periodic_irq, enabled);
-
-	if (rtc->carry_irq > 0) {
-		irq_set_irq_wake(rtc->carry_irq, enabled);
-		irq_set_irq_wake(rtc->alarm_irq, enabled);
-	}
-}
-
-static int __maybe_unused sh_rtc_suspend(struct device *dev)
-{
 	if (device_may_wakeup(dev))
-		sh_rtc_set_irq_wake(dev, 1);
+		irq_set_irq_wake(rtc->alarm_irq, 1);
 
 	return 0;
 }
 
 static int __maybe_unused sh_rtc_resume(struct device *dev)
 {
+	struct sh_rtc *rtc = dev_get_drvdata(dev);
+
 	if (device_may_wakeup(dev))
-		sh_rtc_set_irq_wake(dev, 0);
+		irq_set_irq_wake(rtc->alarm_irq, 0);
 
 	return 0;
 }
-- 
2.45.2


