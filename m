Return-Path: <linux-rtc+bounces-1184-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F0F8C69B5
	for <lists+linux-rtc@lfdr.de>; Wed, 15 May 2024 17:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F27D91F22E39
	for <lists+linux-rtc@lfdr.de>; Wed, 15 May 2024 15:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40631156652;
	Wed, 15 May 2024 15:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bUgQvOrj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF8615575F;
	Wed, 15 May 2024 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715786937; cv=none; b=iyORO3GSYODnkHmwfc7Efhd9Tlq6V1Fy5xKKEyoe2bbsRYkNVOuBq4sq7raLBNxLNa2MN/Pz+RICJNRTXBLehy48enPyAGdCf9LZaSlnKsY92/06MjyOms6qLxm32coqvYJYNgSZY6sOROvGHYbg5moqsEnn91kC862f4vfGXjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715786937; c=relaxed/simple;
	bh=8YL66bsWkz2AW96ECNKOd49i/yZZr9f3kfZeFQUXMkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V5w8+ZezKRhumZE6RbEccZZZH+tscqHitQpQ+YSDEOAX6wPCqGKZWfGQNl024Zqi1NbLBGH/ASGL/xgzoy7OgHQ/0tvfJPy+NyzuUz7vnIA02xOpgc0M+Hjg3Ah28Mdd892+0UuRQHRgExS0qRh6u9sFrjBPYhLvbpVvVc1M5aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bUgQvOrj; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53D266000B;
	Wed, 15 May 2024 15:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715786926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eO3nG/DrQ1g+IenZhOHJGj8Lxxg06+LKOJZq71iT/vI=;
	b=bUgQvOrjjM/iKza7f3flM6WMiECq8IpZ6VqgV6QXrLG9Vg5N6dC2vJ2GfDlqTkw/xv8oY5
	ZBZR3Lr11IzDp7/B+bOMYnA9jA3HniBf3e4HyOHu7aoH9oSb9Y//8mLqgwQbCvW4+tsX/T
	x+wGnWG1wOEnEOM6cs4cOz63V3TX2kkbZiht3CNo38hlvK8CMH3xhfNHeHOdPLCfGaz5F1
	VAGPxuhp3peoWJcZnVKVbAHl2sPidXc4ydETjmjEXCIEho6XLrxMiXp05V1emRkJAQEY6l
	AZggCfvgobWmxCE7RtodyNH/7AhcszKCstogYfVTYjCDCDdBEMpNTHR9Lm40gg==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Esteban Blanc <eblanc@baylibre.com>,
	linux-rtc@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v2 1/1] rtc: tps6594: Add power management support
Date: Wed, 15 May 2024 17:28:27 +0200
Message-ID: <20240515152827.80185-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240515152827.80185-1-richard.genoud@bootlin.com>
References: <20240515152827.80185-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: richard.genoud@bootlin.com

Add power management support to the driver. This allows a SoC to wake
from suspend using the nINT provided by the RTC.
It takes care of the case when the interrupt has not been caught because
the kernel has not yet woke up.
(This is the case when only edges interrupt are caught)

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/rtc/rtc-tps6594.c   | 46 +++++++++++++++++++++++++++++++++++++
 include/linux/mfd/tps6594.h |  1 +
 2 files changed, 47 insertions(+)

diff --git a/drivers/rtc/rtc-tps6594.c b/drivers/rtc/rtc-tps6594.c
index 838ae8562a35..d221dc560682 100644
--- a/drivers/rtc/rtc-tps6594.c
+++ b/drivers/rtc/rtc-tps6594.c
@@ -415,6 +415,8 @@ static int tps6594_rtc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return dev_err_probe(dev, irq, "Failed to get irq\n");
 
+	tps->irq_rtc = irq;
+
 	ret = devm_request_threaded_irq(dev, irq, NULL, tps6594_rtc_interrupt,
 					IRQF_ONESHOT, TPS6594_IRQ_NAME_ALARM,
 					dev);
@@ -434,6 +436,49 @@ static int tps6594_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(rtc);
 }
 
+static int tps6594_rtc_resume(struct device *dev)
+{
+	struct tps6594 *tps = dev_get_drvdata(dev->parent);
+	struct rtc_device *rtc_dev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regmap_test_bits(tps->regmap, TPS6594_REG_INT_STARTUP,
+			       TPS6594_BIT_RTC_INT);
+	if (ret < 0) {
+		dev_err(dev, "failed to read REG_INT_STARTUP: %d\n", ret);
+		goto out;
+	}
+
+	if (ret > 0) {
+		/*
+		 * If the alarm bit is set, it means that the IRQ has been
+		 * fired. But, the kernel may not have woke up yet when it
+		 * happened. So, we have to clear it.
+		 */
+		ret = regmap_write(tps->regmap, TPS6594_REG_RTC_STATUS,
+				   TPS6594_BIT_ALARM);
+		if (ret < 0)
+			dev_err(dev, "error clearing alarm bit: %d", ret);
+
+		rtc_update_irq(rtc_dev, 1, RTC_IRQF | RTC_AF);
+	}
+out:
+	disable_irq_wake(tps->irq_rtc);
+
+	return 0;
+}
+
+static int tps6594_rtc_suspend(struct device *dev)
+{
+	struct tps6594 *tps = dev_get_drvdata(dev->parent);
+
+	enable_irq_wake(tps->irq_rtc);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(tps6594_rtc_pm_ops, tps6594_rtc_suspend, tps6594_rtc_resume);
+
 static const struct platform_device_id tps6594_rtc_id_table[] = {
 	{ "tps6594-rtc", },
 	{}
@@ -444,6 +489,7 @@ static struct platform_driver tps6594_rtc_driver = {
 	.probe		= tps6594_rtc_probe,
 	.driver		= {
 		.name	= "tps6594-rtc",
+		.pm = pm_sleep_ptr(&tps6594_rtc_pm_ops),
 	},
 	.id_table = tps6594_rtc_id_table,
 };
diff --git a/include/linux/mfd/tps6594.h b/include/linux/mfd/tps6594.h
index 3f7c5e23cd4c..85933f1519c4 100644
--- a/include/linux/mfd/tps6594.h
+++ b/include/linux/mfd/tps6594.h
@@ -1011,6 +1011,7 @@ struct tps6594 {
 	bool use_crc;
 	struct regmap *regmap;
 	int irq;
+	int irq_rtc;
 	struct regmap_irq_chip_data *irq_data;
 };
 

