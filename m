Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63A7C184980
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2020 15:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgCMOhY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 13 Mar 2020 10:37:24 -0400
Received: from inva020.nxp.com ([92.121.34.13]:34874 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbgCMOhY (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 13 Mar 2020 10:37:24 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D733A1A1499;
        Fri, 13 Mar 2020 15:37:21 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D9CEE1A1478;
        Fri, 13 Mar 2020 15:37:18 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E18AE402A5;
        Fri, 13 Mar 2020 22:37:14 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] rtc: snvs: Use devm_add_action_or_reset() for calls to clk_disable_unprepare()
Date:   Fri, 13 Mar 2020 22:30:49 +0800
Message-Id: <1584109849-21402-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use devm_add_action_or_reset() for calls to clk_disable_unprepare(),
which can simplify the error handling.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/rtc/rtc-snvs.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
index 7630089..319ed1d 100644
--- a/drivers/rtc/rtc-snvs.c
+++ b/drivers/rtc/rtc-snvs.c
@@ -263,6 +263,12 @@ static const struct regmap_config snvs_rtc_config = {
 	.reg_stride = 4,
 };
 
+static void snvs_rtc_action(void *data)
+{
+	if (data)
+		clk_disable_unprepare(data);
+}
+
 static int snvs_rtc_probe(struct platform_device *pdev)
 {
 	struct snvs_rtc_data *data;
@@ -313,6 +319,10 @@ static int snvs_rtc_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = devm_add_action_or_reset(&pdev->dev, snvs_rtc_action, data->clk);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, data);
 
 	/* Initialize glitch detect */
@@ -325,7 +335,7 @@ static int snvs_rtc_probe(struct platform_device *pdev)
 	ret = snvs_rtc_enable(data, true);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to enable rtc %d\n", ret);
-		goto error_rtc_device_register;
+		return ret;
 	}
 
 	device_init_wakeup(&pdev->dev, true);
@@ -338,22 +348,14 @@ static int snvs_rtc_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request irq %d: %d\n",
 			data->irq, ret);
-		goto error_rtc_device_register;
+		return ret;
 	}
 
 	data->rtc->ops = &snvs_rtc_ops;
 	data->rtc->range_max = U32_MAX;
 	ret = rtc_register_device(data->rtc);
-	if (ret) {
+	if (ret)
 		dev_err(&pdev->dev, "failed to register rtc: %d\n", ret);
-		goto error_rtc_device_register;
-	}
-
-	return 0;
-
-error_rtc_device_register:
-	if (data->clk)
-		clk_disable_unprepare(data->clk);
 
 	return ret;
 }
-- 
2.7.4

