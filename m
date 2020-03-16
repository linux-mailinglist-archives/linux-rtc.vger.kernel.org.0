Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6C9018679E
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2020 10:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730076AbgCPJQ2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Mar 2020 05:16:28 -0400
Received: from inva020.nxp.com ([92.121.34.13]:42698 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730056AbgCPJQ2 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 16 Mar 2020 05:16:28 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 310F91A094F;
        Mon, 16 Mar 2020 10:16:26 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 349B51A0945;
        Mon, 16 Mar 2020 10:16:23 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3CAD2402C4;
        Mon, 16 Mar 2020 17:16:19 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] rtc: mxc: Use devm_add_action_or_reset() for calls to clk_disable_unprepare()
Date:   Mon, 16 Mar 2020 17:09:45 +0800
Message-Id: <1584349785-27042-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use devm_add_action_or_reset() for calls to clk_disable_unprepare(),
which can simplify the error handling, and .remove callback can be dropped.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/rtc/rtc-mxc.c | 46 +++++++++++++++++++---------------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/drivers/rtc/rtc-mxc.c b/drivers/rtc/rtc-mxc.c
index 902d57d..a8cfbde 100644
--- a/drivers/rtc/rtc-mxc.c
+++ b/drivers/rtc/rtc-mxc.c
@@ -307,6 +307,14 @@ static const struct rtc_class_ops mxc_rtc_ops = {
 	.alarm_irq_enable	= mxc_rtc_alarm_irq_enable,
 };
 
+static void mxc_rtc_action(void *p)
+{
+	struct rtc_plat_data *pdata = p;
+
+	clk_disable_unprepare(pdata->clk_ref);
+	clk_disable_unprepare(pdata->clk_ipg);
+}
+
 static int mxc_rtc_probe(struct platform_device *pdev)
 {
 	struct rtc_device *rtc;
@@ -366,14 +374,20 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 
 	pdata->clk_ref = devm_clk_get(&pdev->dev, "ref");
 	if (IS_ERR(pdata->clk_ref)) {
+		clk_disable_unprepare(pdata->clk_ipg);
 		dev_err(&pdev->dev, "unable to get ref clock!\n");
-		ret = PTR_ERR(pdata->clk_ref);
-		goto exit_put_clk_ipg;
+		return PTR_ERR(pdata->clk_ref);
 	}
 
 	ret = clk_prepare_enable(pdata->clk_ref);
+	if (ret) {
+		clk_disable_unprepare(pdata->clk_ipg);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(&pdev->dev, mxc_rtc_action, pdata);
 	if (ret)
-		goto exit_put_clk_ipg;
+		return ret;
 
 	rate = clk_get_rate(pdata->clk_ref);
 
@@ -385,16 +399,14 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 		reg = RTC_INPUT_CLK_38400HZ;
 	else {
 		dev_err(&pdev->dev, "rtc clock is not valid (%lu)\n", rate);
-		ret = -EINVAL;
-		goto exit_put_clk_ref;
+		return -EINVAL;
 	}
 
 	reg |= RTC_ENABLE_BIT;
 	writew(reg, (pdata->ioaddr + RTC_RTCCTL));
 	if (((readw(pdata->ioaddr + RTC_RTCCTL)) & RTC_ENABLE_BIT) == 0) {
 		dev_err(&pdev->dev, "hardware module can't be enabled!\n");
-		ret = -EIO;
-		goto exit_put_clk_ref;
+		return -EIO;
 	}
 
 	platform_set_drvdata(pdev, pdata);
@@ -417,29 +429,10 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 	}
 
 	ret = rtc_register_device(rtc);
-	if (ret)
-		goto exit_put_clk_ref;
-
-	return 0;
-
-exit_put_clk_ref:
-	clk_disable_unprepare(pdata->clk_ref);
-exit_put_clk_ipg:
-	clk_disable_unprepare(pdata->clk_ipg);
 
 	return ret;
 }
 
-static int mxc_rtc_remove(struct platform_device *pdev)
-{
-	struct rtc_plat_data *pdata = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(pdata->clk_ref);
-	clk_disable_unprepare(pdata->clk_ipg);
-
-	return 0;
-}
-
 static struct platform_driver mxc_rtc_driver = {
 	.driver = {
 		   .name	= "mxc_rtc",
@@ -447,7 +440,6 @@ static struct platform_driver mxc_rtc_driver = {
 	},
 	.id_table = imx_rtc_devtype,
 	.probe = mxc_rtc_probe,
-	.remove = mxc_rtc_remove,
 };
 
 module_platform_driver(mxc_rtc_driver)
-- 
2.7.4

