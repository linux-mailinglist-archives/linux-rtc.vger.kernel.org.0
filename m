Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C28841E75C9
	for <lists+linux-rtc@lfdr.de>; Fri, 29 May 2020 08:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgE2GP5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 May 2020 02:15:57 -0400
Received: from inva020.nxp.com ([92.121.34.13]:53142 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725777AbgE2GP4 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 29 May 2020 02:15:56 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 04AA41A0FBB;
        Fri, 29 May 2020 08:15:54 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 70DA11A0FB1;
        Fri, 29 May 2020 08:15:50 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 8564B402D3;
        Fri, 29 May 2020 14:15:45 +0800 (SGT)
From:   Ran Wang <ran.wang_1@nxp.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, Li Biwen <biwen.li@nxp.com>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ran Wang <ran.wang_1@nxp.com>
Subject: [PATCH 2/2] rtc: fsl-ftm-alarm: fix freeze(s2idle) doesnot wake
Date:   Fri, 29 May 2020 14:10:35 +0800
Message-Id: <20200529061035.18912-2-ran.wang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200529061035.18912-1-ran.wang_1@nxp.com>
References: <20200529061035.18912-1-ran.wang_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use dev_pm_set_wake_irq() instead of flag IRQF_NO_SUSPEND to enable
wakeup system feature for both freeze(s2idle) and mem(deep).

Use property 'wakeup-source' to control this feature.

Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index 756af62..c6945d84 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -21,6 +21,7 @@
 #include <linux/rtc.h>
 #include <linux/time.h>
 #include <linux/acpi.h>
+#include <linux/pm_wakeirq.h>
 
 #define FTM_SC_CLK(c)		((c) << FTM_SC_CLK_MASK_SHIFT)
 
@@ -41,6 +42,7 @@ struct ftm_rtc {
 	struct rtc_device *rtc_dev;
 	void __iomem *base;
 	bool big_endian;
+	bool wakeup;
 	u32 alarm_freq;
 };
 
@@ -267,6 +269,9 @@ static int ftm_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtc->base);
 	}
 
+	rtc->wakeup =
+		device_property_read_bool(&pdev->dev, "wakeup-source");
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		dev_err(&pdev->dev, "can't get irq number\n");
@@ -274,7 +279,7 @@ static int ftm_rtc_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_request_irq(&pdev->dev, irq, ftm_rtc_alarm_interrupt,
-			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), rtc);
+			       0, dev_name(&pdev->dev), rtc);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to request irq\n");
 		return ret;
@@ -286,7 +291,10 @@ static int ftm_rtc_probe(struct platform_device *pdev)
 	rtc->alarm_freq = (u32)FIXED_FREQ_CLK / (u32)MAX_FREQ_DIV;
 	rtc->rtc_dev->ops = &ftm_rtc_ops;
 
-	device_init_wakeup(&pdev->dev, true);
+	device_init_wakeup(&pdev->dev, rtc->wakeup);
+	ret = dev_pm_set_wake_irq(&pdev->dev, irq);
+	if (ret)
+		dev_err(&pdev->dev, "irq wake enable failed.\n");
 
 	ret = rtc_register_device(rtc->rtc_dev);
 	if (ret) {
-- 
2.7.4

