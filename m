Return-Path: <linux-rtc+bounces-1351-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FE590D558
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 16:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B8501C21356
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 14:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A18155CAF;
	Tue, 18 Jun 2024 14:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lIdaiIIi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A11155A3C;
	Tue, 18 Jun 2024 14:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718720349; cv=none; b=UTw1Ye/OTn/dYiCMCaJ4eyCvlg7yFuxCIUbme6mJR9nlRcierQtNiIqsMqEi8n+jZ0rkIng64qIGoV1IW/21L1K40/pU8tRo9ckaQbgQbC8maMOWmMhsmlt9g2XTKixPcGuOMjUTPDmmLPvNOn11+e6AOwhxBxScNVBI3cMH0fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718720349; c=relaxed/simple;
	bh=YfMI02tpu0n8qRSeuJ2M30NKeDZGMK+deHo+6NDawxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KgosdQlhaRzcAQ4YvDTRRIVkRdkm72wQqGAM62qpCOaqjROCr+e0eua8lioWuSmFTj8dHvGdeIOxZhCPgJ7izIGZOI97BhnBpZuqJ7RrQUjTVeQ5c63d+UE/Un2clclQ9aGvWwRARTUcNpRf9eKajyHrZbYZY7H3sILu8qmk9yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lIdaiIIi; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E4E71C000E;
	Tue, 18 Jun 2024 14:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718720344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0fSZPuWmFvT69TU6yL+a+QbionkgbFOONJgwSOT+Dt8=;
	b=lIdaiIIiw68mLJjVJxNNKubi/YouJv7qCk+ZwtwpwmNPZAfbkdkHr2FN4bnRLFVreL6knk
	EWg1UoR9ziMeU+5Kgrf8L0rEy1S+/s4jeRAS/isnelp/XjwgEVcb6oAqZEyGqqLNfxbTlo
	yymVLBrA/FkYs2rOrqHpgVTC0E3lWQ1n1Ss92PlHXhVnQxgWgO2W145Iqst/Vvsct+rQj9
	m5BhR3IExVuvIQcEeRaYPRzxktY/lg3xmebQXOCCfH82VG+Zi4AQR2fu4VFaXXd+wad6X1
	yjF6KB+Y/2bJTgLHNplR9IApF+NkrnOohko6SPSWKfUiZbtk0gguol0QS38gtQ==
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
Subject: [PATCH v3 3/3] rtc: tps6594: Add power management support
Date: Tue, 18 Jun 2024 16:18:51 +0200
Message-ID: <20240618141851.1810000-4-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618141851.1810000-1-richard.genoud@bootlin.com>
References: <20240618141851.1810000-1-richard.genoud@bootlin.com>
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
 drivers/rtc/rtc-tps6594.c | 47 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/rtc/rtc-tps6594.c b/drivers/rtc/rtc-tps6594.c
index 06af177b2d78..e69667634137 100644
--- a/drivers/rtc/rtc-tps6594.c
+++ b/drivers/rtc/rtc-tps6594.c
@@ -44,6 +44,7 @@
 
 struct tps6594_rtc {
 	struct rtc_device *rtc_dev;
+	int irq;
 };
 
 static int tps6594_rtc_alarm_irq_enable(struct device *dev,
@@ -419,6 +420,8 @@ static int tps6594_rtc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return dev_err_probe(dev, irq, "Failed to get irq\n");
 
+	rtc->irq = irq;
+
 	ret = devm_request_threaded_irq(dev, irq, NULL, tps6594_rtc_interrupt,
 					IRQF_ONESHOT, TPS6594_IRQ_NAME_ALARM,
 					dev);
@@ -438,6 +441,49 @@ static int tps6594_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(rtc->rtc_dev);
 }
 
+static int tps6594_rtc_resume(struct device *dev)
+{
+	struct tps6594 *tps = dev_get_drvdata(dev->parent);
+	struct tps6594_rtc *rtc = dev_get_drvdata(dev);
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
+		rtc_update_irq(rtc->rtc_dev, 1, RTC_IRQF | RTC_AF);
+	}
+out:
+	disable_irq_wake(rtc->irq);
+
+	return 0;
+}
+
+static int tps6594_rtc_suspend(struct device *dev)
+{
+	struct tps6594_rtc *rtc = dev_get_drvdata(dev);
+
+	enable_irq_wake(rtc->irq);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(tps6594_rtc_pm_ops, tps6594_rtc_suspend, tps6594_rtc_resume);
+
 static const struct platform_device_id tps6594_rtc_id_table[] = {
 	{ "tps6594-rtc", },
 	{}
@@ -448,6 +494,7 @@ static struct platform_driver tps6594_rtc_driver = {
 	.probe		= tps6594_rtc_probe,
 	.driver		= {
 		.name	= "tps6594-rtc",
+		.pm = pm_sleep_ptr(&tps6594_rtc_pm_ops),
 	},
 	.id_table = tps6594_rtc_id_table,
 };

