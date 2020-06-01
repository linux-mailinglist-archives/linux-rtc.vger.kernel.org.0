Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11B521E9F08
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Jun 2020 09:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbgFAHYn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 1 Jun 2020 03:24:43 -0400
Received: from inva020.nxp.com ([92.121.34.13]:34320 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbgFAHYm (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 1 Jun 2020 03:24:42 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8017C1A0677;
        Mon,  1 Jun 2020 09:24:40 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C0BCE1A0655;
        Mon,  1 Jun 2020 09:24:37 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 630EA40280;
        Mon,  1 Jun 2020 15:24:34 +0800 (SGT)
From:   Ran Wang <ran.wang_1@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Li Biwen <biwen.li@nxp.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ran Wang <ran.wang_1@nxp.com>
Subject: [PATCH v2] rtc: fsl-ftm-alarm: fix freeze(s2idle) failed to wake
Date:   Mon,  1 Jun 2020 15:19:14 +0800
Message-Id: <20200601071914.36444-1-ran.wang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use dev_pm_set_wake_irq() instead of flag IRQF_NO_SUSPEND to enable
wakeup system feature for both freeze(s2idle) and mem(deep).

Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
---
Change in v2:
 - Remove wakeup-source control since the irq should be able to wakeup.
   And this is not the case that RTC interrupt line is not connected
   directly to SoC.

 drivers/rtc/rtc-fsl-ftm-alarm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index 756af62..6775205 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -21,6 +21,7 @@
 #include <linux/rtc.h>
 #include <linux/time.h>
 #include <linux/acpi.h>
+#include <linux/pm_wakeirq.h>
 
 #define FTM_SC_CLK(c)		((c) << FTM_SC_CLK_MASK_SHIFT)
 
@@ -274,7 +275,7 @@ static int ftm_rtc_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_request_irq(&pdev->dev, irq, ftm_rtc_alarm_interrupt,
-			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), rtc);
+			       0, dev_name(&pdev->dev), rtc);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to request irq\n");
 		return ret;
@@ -287,6 +288,9 @@ static int ftm_rtc_probe(struct platform_device *pdev)
 	rtc->rtc_dev->ops = &ftm_rtc_ops;
 
 	device_init_wakeup(&pdev->dev, true);
+	ret = dev_pm_set_wake_irq(&pdev->dev, irq);
+	if (ret)
+		dev_err(&pdev->dev, "failed to enable irq wake\n");
 
 	ret = rtc_register_device(rtc->rtc_dev);
 	if (ret) {
-- 
2.7.4

