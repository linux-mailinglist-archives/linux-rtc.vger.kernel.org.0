Return-Path: <linux-rtc+bounces-378-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D142E80095D
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 12:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6341AB211F5
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 11:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E87210F6;
	Fri,  1 Dec 2023 11:08:54 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 169E91B2;
	Fri,  1 Dec 2023 03:08:50 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,241,1695654000"; 
   d="scan'208";a="185005225"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 Dec 2023 20:08:50 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D1F0C4010906;
	Fri,  1 Dec 2023 20:08:47 +0900 (JST)
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
Subject: [PATCH 1/6] rtc: da9063: Make IRQ as optional
Date: Fri,  1 Dec 2023 11:08:35 +0000
Message-Id: <20231201110840.37408-2-biju.das.jz@bp.renesas.com>
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

On some platforms (eg: RZ/{G2UL,Five} SMARC EVK), there is no IRQ
populated by default. Add irq optional support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/rtc/rtc-da9063.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
index 2f5d60622564..613ba2c5d757 100644
--- a/drivers/rtc/rtc-da9063.c
+++ b/drivers/rtc/rtc-da9063.c
@@ -485,25 +485,26 @@ static int da9063_rtc_probe(struct platform_device *pdev)
 		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtc_dev->features);
 	}
 
-	irq_alarm = platform_get_irq_byname(pdev, "ALARM");
-	if (irq_alarm < 0)
-		return irq_alarm;
-
-	ret = devm_request_threaded_irq(&pdev->dev, irq_alarm, NULL,
-					da9063_alarm_event,
-					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
-					"ALARM", rtc);
-	if (ret)
-		dev_err(&pdev->dev, "Failed to request ALARM IRQ %d: %d\n",
-			irq_alarm, ret);
-
-	ret = dev_pm_set_wake_irq(&pdev->dev, irq_alarm);
-	if (ret)
-		dev_warn(&pdev->dev,
-			 "Failed to set IRQ %d as a wake IRQ: %d\n",
-			 irq_alarm, ret);
-
-	device_init_wakeup(&pdev->dev, true);
+	irq_alarm = platform_get_irq_byname_optional(pdev, "ALARM");
+	if (irq_alarm >= 0) {
+		ret = devm_request_threaded_irq(&pdev->dev, irq_alarm, NULL,
+						da9063_alarm_event,
+						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+						"ALARM", rtc);
+		if (ret)
+			dev_err(&pdev->dev, "Failed to request ALARM IRQ %d: %d\n",
+				irq_alarm, ret);
+
+		ret = dev_pm_set_wake_irq(&pdev->dev, irq_alarm);
+		if (ret)
+			dev_warn(&pdev->dev,
+				 "Failed to set IRQ %d as a wake IRQ: %d\n",
+				 irq_alarm, ret);
+
+		device_init_wakeup(&pdev->dev, true);
+	} else {
+		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtc_dev->features);
+	}
 
 	return devm_rtc_register_device(rtc->rtc_dev);
 }
-- 
2.25.1


