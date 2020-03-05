Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E489717AA16
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Mar 2020 17:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbgCEQFF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 11:05:05 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:48587 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgCEQFF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 11:05:05 -0500
X-Originating-IP: 86.202.111.97
Received: from localhost (lfbn-lyo-1-16-97.w86-202.abo.wanadoo.fr [86.202.111.97])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 3DB26E0015;
        Thu,  5 Mar 2020 16:04:58 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Barry Song <baohua@kernel.org>
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] rtc: sirfsoc: convert to devm_rtc_allocate_device
Date:   Thu,  5 Mar 2020 17:04:50 +0100
Message-Id: <20200305160452.27808-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This allows further improvement of the driver. Also remove the unnecessary
error string as the core will already display error messages.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-sirfsoc.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-sirfsoc.c b/drivers/rtc/rtc-sirfsoc.c
index a2c9c55667cd..b2e72597eee8 100644
--- a/drivers/rtc/rtc-sirfsoc.c
+++ b/drivers/rtc/rtc-sirfsoc.c
@@ -341,28 +341,21 @@ static int sirfsoc_rtc_probe(struct platform_device *pdev)
 	rtcdrv->overflow_rtc =
 		sirfsoc_rtc_readl(rtcdrv, RTC_SW_VALUE);
 
-	rtcdrv->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
-			&sirfsoc_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtcdrv->rtc)) {
-		err = PTR_ERR(rtcdrv->rtc);
-		dev_err(&pdev->dev, "can't register RTC device\n");
-		return err;
-	}
+	rtcdrv->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtcdrv->rtc))
+		return PTR_ERR(rtcdrv->rtc);
+
+	rtcdrv->rtc->ops = &sirfsoc_rtc_ops;
 
 	rtcdrv->irq = platform_get_irq(pdev, 0);
-	err = devm_request_irq(
-			&pdev->dev,
-			rtcdrv->irq,
-			sirfsoc_rtc_irq_handler,
-			IRQF_SHARED,
-			pdev->name,
-			rtcdrv);
+	err = devm_request_irq(&pdev->dev, rtcdrv->irq, sirfsoc_rtc_irq_handler,
+			       IRQF_SHARED, pdev->name, rtcdrv);
 	if (err) {
 		dev_err(&pdev->dev, "Unable to register for the SiRF SOC RTC IRQ\n");
 		return err;
 	}
 
-	return 0;
+	return rtc_register_device(rtcdrv->rtc);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.24.1

