Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0BAE17B77D
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 08:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgCFHfz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Mar 2020 02:35:55 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:48947 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbgCFHfz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Mar 2020 02:35:55 -0500
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 04A8A240002;
        Fri,  6 Mar 2020 07:35:52 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] rtc: da9052: convert to devm_rtc_allocate_device
Date:   Fri,  6 Mar 2020 08:35:45 +0100
Message-Id: <20200306073548.57579-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: yes
X-Spam-Level: **************************
X-GND-Spam-Score: 400
X-GND-Status: SPAM
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This allows further improvement of the driver.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-da9052.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-da9052.c b/drivers/rtc/rtc-da9052.c
index 204eb7cf1aa4..e159c5911122 100644
--- a/drivers/rtc/rtc-da9052.c
+++ b/drivers/rtc/rtc-da9052.c
@@ -298,12 +298,12 @@ static int da9052_rtc_probe(struct platform_device *pdev)
 		rtc_err(rtc, "Failed to disable TICKS: %d\n", ret);
 
 	device_init_wakeup(&pdev->dev, true);
-	rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
-				       &da9052_rtc_ops, THIS_MODULE);
-
+	rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc->rtc))
 		return PTR_ERR(rtc->rtc);
 
+	rtc->rtc->ops = &da9052_rtc_ops;
+
 	ret = da9052_request_irq(rtc->da9052, DA9052_IRQ_ALARM, "ALM",
 				da9052_rtc_irq, rtc);
 	if (ret != 0) {
@@ -311,7 +311,7 @@ static int da9052_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return 0;
+	return rtc_register_device(rtc->rtc);
 }
 
 static struct platform_driver da9052_rtc_driver = {
-- 
2.24.1

