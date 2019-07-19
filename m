Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 698B96D945
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jul 2019 05:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbfGSDKV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 18 Jul 2019 23:10:21 -0400
Received: from inva021.nxp.com ([92.121.34.21]:57136 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbfGSDKV (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 18 Jul 2019 23:10:21 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4C2EA200205;
        Fri, 19 Jul 2019 05:10:19 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4A4AA200072;
        Fri, 19 Jul 2019 05:10:16 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3BB04402A9;
        Fri, 19 Jul 2019 11:10:12 +0800 (SGT)
From:   Anson.Huang@nxp.com
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2] rtc: snvs: fix possible race condition
Date:   Fri, 19 Jul 2019 11:01:02 +0800
Message-Id: <20190719030102.6141-1-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

The RTC IRQ is requested before the struct rtc_device is allocated,
this may lead to a NULL pointer dereference in IRQ handler.

To fix this issue, allocating the rtc_device struct and register rtc
device before requesting the RTC IRQ.

Using devm_rtc_allocate_device/rtc_register_device instead of
devm_rtc_device_register.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- move devm_request_irq() to after rtc device register done, make sure everything
	  is ready before enabling IRQ.
---
 drivers/rtc/rtc-snvs.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
index 7ee673a2..d9650e7 100644
--- a/drivers/rtc/rtc-snvs.c
+++ b/drivers/rtc/rtc-snvs.c
@@ -279,6 +279,10 @@ static int snvs_rtc_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	data->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(data->rtc))
+		return PTR_ERR(data->rtc);
+
 	data->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "regmap");
 
 	if (IS_ERR(data->regmap)) {
@@ -335,6 +339,13 @@ static int snvs_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "failed to enable irq wake\n");
 
+	data->rtc->ops = &snvs_rtc_ops;
+	ret = rtc_register_device(data->rtc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register rtc: %d\n", ret);
+		goto error_rtc_device_register;
+	}
+
 	ret = devm_request_irq(&pdev->dev, data->irq, snvs_rtc_irq_handler,
 			       IRQF_SHARED, "rtc alarm", &pdev->dev);
 	if (ret) {
@@ -343,14 +354,6 @@ static int snvs_rtc_probe(struct platform_device *pdev)
 		goto error_rtc_device_register;
 	}
 
-	data->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
-					&snvs_rtc_ops, THIS_MODULE);
-	if (IS_ERR(data->rtc)) {
-		ret = PTR_ERR(data->rtc);
-		dev_err(&pdev->dev, "failed to register rtc: %d\n", ret);
-		goto error_rtc_device_register;
-	}
-
 	return 0;
 
 error_rtc_device_register:
-- 
2.7.4

