Return-Path: <linux-rtc+bounces-1181-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A58908C451C
	for <lists+linux-rtc@lfdr.de>; Mon, 13 May 2024 18:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6C441C214FD
	for <lists+linux-rtc@lfdr.de>; Mon, 13 May 2024 16:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3762715535A;
	Mon, 13 May 2024 16:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z95o1QHt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172A814D2BF;
	Mon, 13 May 2024 16:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715617790; cv=none; b=Fxh1T1ZI0rEr1wwTC7Dz53BbjdAPwJvgN/WUFrmIyyY8B+dU/Kdo/JfXZwfTSaxmWQcsf0o4IKTOnWSXiPVlt3Yh1YAb6iEzdN0UXip82LDH81qVEqm3CsdAaiapIHPxxw7pI5PP4wM+ZZwr0o/wYiGrl6Iq5Vujx6wew73By2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715617790; c=relaxed/simple;
	bh=P5p3YJgaSryQWCWTT7Yw2Cx0iDBf43rEw9xJhuxZSOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LfmAw4G2LM0DhQRsGtJPOuZGbVvpc0Z6iGFEtGVdsAIowbAjX2OaASVA8WFNWXt/e28qYkiwqPtEWILj4TiAg5yQPJAtGNn9CaNIyyHezzb907+KtvW3P54sZ+RraONj7iALZx5dZUXf7Q2ZOBuvQNh0sfsRm/K3tHAj/jni4ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z95o1QHt; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CFD8C0006;
	Mon, 13 May 2024 16:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715617784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rGyJ9+fBQ8mBfRdwi06YujJsGzmctZRxczZm1z9IHuM=;
	b=Z95o1QHtJyY9muhfAuCZ77XJ226rG84KnkvCO51HCCcAH8QtwR8LrUwze8xucvkTSn3kr9
	glKvgzCUnLPZHd+jsPt2KN46k2yEVoTojuspEdwubHLABSo3VwJ/yeWLyilLlQogCSHcFJ
	3p2WqWYEPk84g3j0GXZk1Utpn/FplJW0lueaS3OpkaxQlfsmrMRnwpstio0hKOoR3NDZmq
	S1BlxQLNyicprYr/JAOfNAlhs7ktuUOZVSFlZKgVbEjbhdq5+XMdRhfi0Bo2z8+E1VZHc0
	QeBMLIDrSCHFobIiP9yjsvq2p/dKkIaASjakF0QWX8hcXi0BzWe8cxcWI6gjPg==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Esteban Blanc <eblanc@baylibre.com>,
	linux-rtc@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH] rtc: tps6594: Add power management support
Date: Mon, 13 May 2024 18:29:42 +0200
Message-ID: <20240513162942.68484-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.43.0
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
index 838ae8562a35..b769d120c624 100644
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
+SIMPLE_DEV_PM_OPS(tps6594_rtc_pm_ops, tps6594_rtc_suspend, tps6594_rtc_resume);
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
 
-- 
2.43.0


