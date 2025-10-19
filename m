Return-Path: <linux-rtc+bounces-5098-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CB795BEE1E0
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Oct 2025 11:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 108C44E7289
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Oct 2025 09:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579AC2E2F03;
	Sun, 19 Oct 2025 09:21:32 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007442E0410;
	Sun, 19 Oct 2025 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760865692; cv=none; b=juWmIYtzI+/UCjh61LKvxvaTRB5291B/ifLjd+5FTnbozVHYTzqE3a2dZqntvz0bEd2K9xvbf7mQfoD/jglakjH+Stig7S1wdwvLytG5zRAP4GxYXWMCnIIQ+mBgsnOMIvQltkTVgxFpotDl03UY7Axv10J8j1qVprKcN64pjN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760865692; c=relaxed/simple;
	bh=12cVx1iToan0lCzF3C86mgtOo91epEwAfYzjZXVhWBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uC7huZi5F/jjdIaET98Tbkx/mEqhG7d8INnLvV1/exbAY5F/ZUD/0qKbcwLJLPcbP4lV0nSy+haI7HiRp41gjI73LM1HWVae4grosHAXW6cAjkd+6cwccHSeS9FKZJuX8v1PZdQJei5BKAUuMe8iGs/9BI1r98wD27JBWDGuFfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: T0V4S3BUSGSW+AyAzNDDVQ==
X-CSE-MsgGUID: UHusppwJRIOz1Y4AxnkcxA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Oct 2025 18:21:28 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.5])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 26503416123C;
	Sun, 19 Oct 2025 18:21:23 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/6] rtc: renesas-rtca3: Use OF data for configuration
Date: Sun, 19 Oct 2025 09:21:03 +0000
Message-ID: <20251019092106.5737-4-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251019092106.5737-1-ovidiu.panait.rb@renesas.com>
References: <20251019092106.5737-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare for adding support for the Renesas RZ/V2H SoC RTC IP by making the
driver configuration selectable via OF match data.

For RZ/V2H RTC, the maximum periodic interrupt frequency is 128Hz instead
of 256Hz, so add this info to a SoC-specific struct and retrieve it
during probe.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/rtc/rtc-renesas-rtca3.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index ab816bdf0d77..90dda04fad33 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -101,6 +101,15 @@ enum rtca3_alrm_set_step {
 	RTCA3_ALRM_SSTEP_INIT = 3,
 };
 
+/**
+ * struct rtca3_of_data - OF data for RTCA3
+ *
+ * @max_periodic_irq_freq: maximum periodic interrupt frequency
+ */
+struct rtca3_of_data {
+	int max_periodic_irq_freq;
+};
+
 /**
  * struct rtca3_ppb_per_cycle - PPB per cycle
  * @ten_sec: PPB per cycle in 10 seconds adjutment mode
@@ -709,6 +718,7 @@ static void rtca3_action(void *data)
 
 static int rtca3_probe(struct platform_device *pdev)
 {
+	const struct rtca3_of_data *of_data;
 	struct device *dev = &pdev->dev;
 	struct rtca3_priv *priv;
 	struct clk *clk;
@@ -718,6 +728,8 @@ static int rtca3_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	of_data = of_device_get_match_data(dev);
+
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
@@ -772,7 +784,7 @@ static int rtca3_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->rtc_dev);
 
 	priv->rtc_dev->ops = &rtca3_ops;
-	priv->rtc_dev->max_user_freq = 256;
+	priv->rtc_dev->max_user_freq = of_data->max_periodic_irq_freq;
 	priv->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	priv->rtc_dev->range_max = RTC_TIMESTAMP_END_2099;
 
@@ -875,8 +887,12 @@ static int rtca3_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(rtca3_pm_ops, rtca3_suspend, rtca3_resume);
 
+static const struct rtca3_of_data rtca3_of_data = {
+	.max_periodic_irq_freq = 256,
+};
+
 static const struct of_device_id rtca3_of_match[] = {
-	{ .compatible = "renesas,rz-rtca3", },
+	{ .compatible = "renesas,rz-rtca3", .data = &rtca3_of_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rtca3_of_match);
-- 
2.51.0


