Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5F9517B787
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 08:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgCFHiJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Mar 2020 02:38:09 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:55653 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgCFHiJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Mar 2020 02:38:09 -0500
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 40E2920009;
        Fri,  6 Mar 2020 07:38:07 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] rtc: pm8xxx: convert to devm_rtc_allocate_device
Date:   Fri,  6 Mar 2020 08:37:55 +0100
Message-Id: <20200306073758.58050-1-alexandre.belloni@bootlin.com>
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

This allows further improvement of the driver. Also remove the unnecessary
error string as the core will already display error messages.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pm8xxx.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index 07ea1be3abb9..b97333c95e53 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -486,13 +486,11 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 	device_init_wakeup(&pdev->dev, 1);
 
 	/* Register the RTC device */
-	rtc_dd->rtc = devm_rtc_device_register(&pdev->dev, "pm8xxx_rtc",
-					       &pm8xxx_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtc_dd->rtc)) {
-		dev_err(&pdev->dev, "%s: RTC registration failed (%ld)\n",
-			__func__, PTR_ERR(rtc_dd->rtc));
+	rtc_dd->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc_dd->rtc))
 		return PTR_ERR(rtc_dd->rtc);
-	}
+
+	rtc_dd->rtc->ops = &pm8xxx_rtc_ops;
 
 	/* Request the alarm IRQ */
 	rc = devm_request_any_context_irq(&pdev->dev, rtc_dd->rtc_alarm_irq,
@@ -504,9 +502,7 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 		return rc;
 	}
 
-	dev_dbg(&pdev->dev, "Probe success !!\n");
-
-	return 0;
+	return rtc_register_device(rtc_dd->rtc);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.24.1

