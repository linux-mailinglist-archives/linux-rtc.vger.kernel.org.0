Return-Path: <linux-rtc+bounces-1352-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A027E90D5DD
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 16:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 081E2B2996B
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 14:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529CF156243;
	Tue, 18 Jun 2024 14:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Reu+SU0f"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387B1155A5C;
	Tue, 18 Jun 2024 14:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718720349; cv=none; b=rzAbvJFvOPcPQBuP31Cz9ppSlAOxZq1qdsVuBq1AY93TOgV806lQZ5T+t7uKZC1w/1QFtOXW0TnVPAshSUssVeiIZkfq6kUQiidjls4fbgmTpYc/OwtWqsR5rLZRHOWK50X2tf9vYVCTCSwKDD6EOdN2MZAg5QIWfBKyuueRC5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718720349; c=relaxed/simple;
	bh=MKktt6jC0xa3wSRSarLhyx14GWAY3UF9FUHvUmSqifc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PTYtWUMgnaQjsdoI/0C05HDYD1tEPBbfL/VDYet7uv+m1g4Nvd+nI/xsAnPzxTZVcfEgjvbw99pfHCq/0nCU3mx+AlrqvjNgTAx4tCnBtEHS8IBsu/Cx8fovGJNyPJWxc9PI3mcGMItnbAEW/znVuIhOLpteYy8VsSK1RqdJEOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Reu+SU0f; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B52891C000C;
	Tue, 18 Jun 2024 14:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718720343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVqw2PBKNw40hzSiggaDbTMUTmRx6HsFHOOvvbNCjNQ=;
	b=Reu+SU0fbvqv5FomaWVc04pq5muSXDfIxamoSxItlTCxDnmBtwv5hSdmPKqjXLq2Ry+HXm
	agfRQyh9yxb/qV5rmQ/ESL9VdTdNTV5f/ocOnDHDKbVPvxnNCWf8skU4SPMtui23Dv+FNi
	Xt5So3gx1trrLJHG0/E8cpUQ+l2x5eAAJ0MNx2sh8+1fX0MkzBnkn/r3WeyqRARK5S7LQa
	ss+fYw/ItMS/l78MMgQt3CnyUwbCubkT0+4bWEAyCGKXb/kTJ+fVKAF4SPVkLMl+7vxsTD
	Cwq/GxxaPMaM2/Q69A5Aa+Ma9KL2ifz51GbzyfLyLHFOkogTyplZKOEMV+U+4A==
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
Subject: [PATCH v3 2/3] rtc: tps6594: introduce private structure as drvdata
Date: Tue, 18 Jun 2024 16:18:50 +0200
Message-ID: <20240618141851.1810000-3-richard.genoud@bootlin.com>
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

This patch will prepare for the next one (power management support) by
introducing struct tps6594_rtc.

No functionnal change.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/rtc/rtc-tps6594.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/rtc/rtc-tps6594.c b/drivers/rtc/rtc-tps6594.c
index bc8dc735aa23..06af177b2d78 100644
--- a/drivers/rtc/rtc-tps6594.c
+++ b/drivers/rtc/rtc-tps6594.c
@@ -42,6 +42,10 @@
 // Multiplier for ppb conversions
 #define PPB_MULT NANO
 
+struct tps6594_rtc {
+	struct rtc_device *rtc_dev;
+};
+
 static int tps6594_rtc_alarm_irq_enable(struct device *dev,
 					unsigned int enabled)
 {
@@ -325,11 +329,11 @@ static int tps6594_rtc_set_offset(struct device *dev, long offset)
 	return tps6594_rtc_set_calibration(dev, calibration);
 }
 
-static irqreturn_t tps6594_rtc_interrupt(int irq, void *rtc)
+static irqreturn_t tps6594_rtc_interrupt(int irq, void *data)
 {
-	struct device *dev = rtc;
+	struct device *dev = data;
 	struct tps6594 *tps = dev_get_drvdata(dev->parent);
-	struct rtc_device *rtc_dev = dev_get_drvdata(dev);
+	struct tps6594_rtc *rtc = dev_get_drvdata(dev);
 	int ret;
 	u32 rtc_reg;
 
@@ -337,7 +341,7 @@ static irqreturn_t tps6594_rtc_interrupt(int irq, void *rtc)
 	if (ret)
 		return IRQ_NONE;
 
-	rtc_update_irq(rtc_dev, 1, RTC_IRQF | RTC_AF);
+	rtc_update_irq(rtc->rtc_dev, 1, RTC_IRQF | RTC_AF);
 
 	return IRQ_HANDLED;
 }
@@ -356,13 +360,17 @@ static int tps6594_rtc_probe(struct platform_device *pdev)
 {
 	struct tps6594 *tps = dev_get_drvdata(pdev->dev.parent);
 	struct device *dev = &pdev->dev;
-	struct rtc_device *rtc;
+	struct tps6594_rtc *rtc;
 	int irq;
 	int ret;
 
-	rtc = devm_rtc_allocate_device(dev);
-	if (IS_ERR(rtc))
-		return PTR_ERR(rtc);
+	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	rtc->rtc_dev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc->rtc_dev))
+		return PTR_ERR(rtc->rtc_dev);
 
 	// Enable crystal oscillator.
 	ret = regmap_set_bits(tps->regmap, TPS6594_REG_RTC_CTRL_2,
@@ -423,11 +431,11 @@ static int tps6594_rtc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "Failed to init rtc as wakeup source\n");
 
-	rtc->ops = &tps6594_rtc_ops;
-	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-	rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->rtc_dev->ops = &tps6594_rtc_ops;
+	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->rtc_dev->range_max = RTC_TIMESTAMP_END_2099;
 
-	return devm_rtc_register_device(rtc);
+	return devm_rtc_register_device(rtc->rtc_dev);
 }
 
 static const struct platform_device_id tps6594_rtc_id_table[] = {

