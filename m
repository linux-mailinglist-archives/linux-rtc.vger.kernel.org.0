Return-Path: <linux-rtc+bounces-380-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D063480095E
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 12:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B5DE281561
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 11:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEA7210F2;
	Fri,  1 Dec 2023 11:09:01 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0D94010F1;
	Fri,  1 Dec 2023 03:08:57 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,241,1695654000"; 
   d="scan'208";a="188861567"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Dec 2023 20:08:57 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E0CB54010906;
	Fri,  1 Dec 2023 20:08:54 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-rtc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/6] rtc: da9063: Use dev_err_probe()
Date: Fri,  1 Dec 2023 11:08:37 +0000
Message-Id: <20231201110840.37408-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace dev_err()->dev_err_probe() to simpilfy probe().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/rtc/rtc-da9063.c | 47 +++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
index a1ee0705ca88..4d7664340091 100644
--- a/drivers/rtc/rtc-da9063.c
+++ b/drivers/rtc/rtc-da9063.c
@@ -407,57 +407,49 @@ static int da9063_rtc_probe(struct platform_device *pdev)
 				 config->rtc_enable_reg,
 				 config->rtc_enable_mask,
 				 config->rtc_enable_mask);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to enable RTC\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Failed to enable RTC\n");
 
 	ret = regmap_update_bits(rtc->regmap,
 				 config->rtc_enable_32k_crystal_reg,
 				 config->rtc_crystal_mask,
 				 config->rtc_crystal_mask);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to run 32kHz oscillator\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to run 32kHz oscillator\n");
 
 	ret = regmap_update_bits(rtc->regmap,
 				 config->rtc_alarm_secs_reg,
 				 config->rtc_alarm_status_mask,
 				 0);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to access RTC alarm register\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to access RTC alarm register\n");
 
 	ret = regmap_update_bits(rtc->regmap,
 				 config->rtc_alarm_secs_reg,
 				 DA9063_ALARM_STATUS_ALARM,
 				 DA9063_ALARM_STATUS_ALARM);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to access RTC alarm register\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to access RTC alarm register\n");
 
 	ret = regmap_update_bits(rtc->regmap,
 				 config->rtc_alarm_year_reg,
 				 config->rtc_tick_on_mask,
 				 0);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to disable TICKs\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to disable TICKs\n");
 
 	data[RTC_SEC] = 0;
 	ret = regmap_bulk_read(rtc->regmap,
 			       config->rtc_alarm_secs_reg,
 			       &data[config->rtc_data_start],
 			       config->rtc_alarm_len);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to read initial alarm data: %d\n",
-			ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to read initial alarm data\n");
 
 	platform_set_drvdata(pdev, rtc);
 
@@ -488,8 +480,9 @@ static int da9063_rtc_probe(struct platform_device *pdev)
 						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 						"ALARM", rtc);
 		if (ret)
-			dev_err(&pdev->dev, "Failed to request ALARM IRQ %d: %d\n",
-				irq_alarm, ret);
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to request ALARM IRQ %d\n",
+					     irq_alarm);
 
 		ret = dev_pm_set_wake_irq(&pdev->dev, irq_alarm);
 		if (ret)
-- 
2.25.1


