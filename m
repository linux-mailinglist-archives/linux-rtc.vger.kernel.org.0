Return-Path: <linux-rtc+bounces-5223-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BBFC26F2C
	for <lists+linux-rtc@lfdr.de>; Fri, 31 Oct 2025 21:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67DF43B603F
	for <lists+linux-rtc@lfdr.de>; Fri, 31 Oct 2025 20:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA11F32570F;
	Fri, 31 Oct 2025 20:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0MG0CbM+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E6B34D3AC
	for <linux-rtc@vger.kernel.org>; Fri, 31 Oct 2025 20:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761943660; cv=none; b=ZRd5nPmBYtLCInOdtgZ7PGXm4HCF/6uDlfg1BzHd/pyrVB1B5myzWjBLznICxBE2wqaBE8PM0SERyUN57S6g/dzUVKa8VCDh9JWrTqhJkzitcKsmTuWCxDMVTaiHW1jxqwAsfsgNLPjIf9Kqnc21vyJYyTQiw+hmaRS3ZgIVxvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761943660; c=relaxed/simple;
	bh=fP0PRwBA2Mf2guWAiu9eqAjIyTud1epG3Mw4jWULaXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=maWiQg51pbz3wHQ13GkzNKzPIaCpoA0BxiNmspvRNIpNOIPcUCheIL9VEevUZdu0naxGr4Rj5DH10+m7SLhHc4mmAMxaUy0x3QWK8yCpG8dfdGRr1gjq/PWYV1csXygSCToFwIRbzRchOsGetcrUENjZMAYV/mI3VjBg58W7JO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0MG0CbM+; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BB0C84E4144B
	for <linux-rtc@vger.kernel.org>; Fri, 31 Oct 2025 20:47:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70B4160704;
	Fri, 31 Oct 2025 20:47:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3433E1181AAE4;
	Fri, 31 Oct 2025 21:47:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761943652; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=LjtRAH85k2iJb2rrQWhadyvs+YYeXHg0Xt0TPJs4Sn8=;
	b=0MG0CbM+vcrAiR1F1ZaVy27SHJuT64ovWvLjVIyN/31bXZm0fs5IQHT81NWvhFqpsWetRI
	9voO6MzTZihn8pSBtFJ947lRPeTUO5vgHFVDQTAfm1RCjjCClkV+GvIJ0wJz+xjLwYFpem
	JKLxdX28vp3oYNdQ5Wu7MQi9wltMChyAmLECDsxPCrxAjagnYtk8rMrk1DrpqV6tdVOv02
	4ia9LPI23t6XsRZ2w7uGnXxQoIB4rcd+DI04+5TcMa/se/Yd+t6UBJ/3FUdTJ9tRjb+aK8
	Shcfl4XCzQKLRM3O5nR+4dAy8g4PUd5efT12xG2uj272pKipIuY2h1KcGUOkvg==
From: alexandre.belloni@bootlin.com
To: Yiting Deng <yiting.deng@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-amlogic@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: amlogic-a4: simplify probe
Date: Fri, 31 Oct 2025 21:47:23 +0100
Message-ID: <20251031204724.756857-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Use devm_device_init_wakeup to simplify probe and remove .remove as it is now
empty.

Also remove the unnecessary error string as there are no error path without an
error message in devm_rtc_register_device.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-amlogic-a4.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index a993d35e1d6b..123fb372fc9f 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -361,38 +361,26 @@ static int aml_rtc_probe(struct platform_device *pdev)
 				     "failed to get_enable rtc sys clk\n");
 	aml_rtc_init(rtc);
 
-	device_init_wakeup(dev, true);
+	devm_device_init_wakeup(dev);
 	platform_set_drvdata(pdev, rtc);
 
 	rtc->rtc_dev = devm_rtc_allocate_device(dev);
-	if (IS_ERR(rtc->rtc_dev)) {
-		ret = PTR_ERR(rtc->rtc_dev);
-		goto err_clk;
-	}
+	if (IS_ERR(rtc->rtc_dev))
+		return PTR_ERR(rtc->rtc_dev);
 
 	ret = devm_request_irq(dev, rtc->irq, aml_rtc_handler,
 			       IRQF_ONESHOT, "aml-rtc alarm", rtc);
 	if (ret) {
 		dev_err_probe(dev, ret, "IRQ%d request failed, ret = %d\n",
 			      rtc->irq, ret);
-		goto err_clk;
+		return ret;
 	}
 
 	rtc->rtc_dev->ops = &aml_rtc_ops;
 	rtc->rtc_dev->range_min = 0;
 	rtc->rtc_dev->range_max = U32_MAX;
 
-	ret = devm_rtc_register_device(rtc->rtc_dev);
-	if (ret) {
-		dev_err_probe(&pdev->dev, ret, "Failed to register RTC device: %d\n", ret);
-		goto err_clk;
-	}
-
-	return 0;
-err_clk:
-	device_init_wakeup(dev, false);
-
-	return ret;
+	return devm_rtc_register_device(rtc->rtc_dev);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -420,11 +408,6 @@ static int aml_rtc_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(aml_rtc_pm_ops,
 			 aml_rtc_suspend, aml_rtc_resume);
 
-static void aml_rtc_remove(struct platform_device *pdev)
-{
-	device_init_wakeup(&pdev->dev, false);
-}
-
 static const struct aml_rtc_config a5_rtc_config = {
 };
 
@@ -447,7 +430,6 @@ MODULE_DEVICE_TABLE(of, aml_rtc_device_id);
 
 static struct platform_driver aml_rtc_driver = {
 	.probe = aml_rtc_probe,
-	.remove = aml_rtc_remove,
 	.driver = {
 		.name = "aml-rtc",
 		.pm = &aml_rtc_pm_ops,
-- 
2.51.1


