Return-Path: <linux-rtc+bounces-394-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB238033C4
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Dec 2023 14:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 999F0280F3E
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Dec 2023 13:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C726324A04;
	Mon,  4 Dec 2023 13:05:20 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id E4E4AA7;
	Mon,  4 Dec 2023 05:05:15 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,249,1695654000"; 
   d="scan'208";a="189123364"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Dec 2023 22:05:14 +0900
Received: from localhost.localdomain (unknown [10.226.93.142])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B8EAF44506C3;
	Mon,  4 Dec 2023 22:05:11 +0900 (JST)
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
Subject: [PATCH v2 1/3] rtc: da9063: Make IRQ as optional
Date: Mon,  4 Dec 2023 13:05:02 +0000
Message-Id: <20231204130504.126787-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204130504.126787-1-biju.das.jz@bp.renesas.com>
References: <20231204130504.126787-1-biju.das.jz@bp.renesas.com>
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
 drivers/rtc/rtc-da9063.c | 41 ++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
index 2f5d60622564..884a89993eed 100644
--- a/drivers/rtc/rtc-da9063.c
+++ b/drivers/rtc/rtc-da9063.c
@@ -485,25 +485,30 @@ static int da9063_rtc_probe(struct platform_device *pdev)
 		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtc_dev->features);
 	}
 
-	irq_alarm = platform_get_irq_byname(pdev, "ALARM");
-	if (irq_alarm < 0)
+	irq_alarm = platform_get_irq_byname_optional(pdev, "ALARM");
+	if (irq_alarm >= 0) {
+		ret = devm_request_threaded_irq(&pdev->dev, irq_alarm, NULL,
+						da9063_alarm_event,
+						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+						"ALARM", rtc);
+		if (ret)
+			dev_err(&pdev->dev,
+				"Failed to request ALARM IRQ %d: %d\n",
+				irq_alarm, ret);
+
+		ret = dev_pm_set_wake_irq(&pdev->dev, irq_alarm);
+		if (ret)
+			dev_warn(&pdev->dev,
+				 "Failed to set IRQ %d as a wake IRQ: %d\n",
+				 irq_alarm, ret);
+
+		device_init_wakeup(&pdev->dev, true);
+	}  else if (irq_alarm != -ENXIO) {
 		return irq_alarm;
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
+	} else {
+		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtc_dev->features);
+		clear_bit(RTC_FEATURE_ALARM, rtc->rtc_dev->features);
+	}
 
 	return devm_rtc_register_device(rtc->rtc_dev);
 }
-- 
2.25.1


