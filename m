Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5085DF2D2
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 11:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbfD3J2c (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 05:28:32 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:46069 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbfD3J2c (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Apr 2019 05:28:32 -0400
Received: from localhost (alyon-652-1-31-175.w109-213.abo.wanadoo.fr [109.213.14.175])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id B0AE710001C;
        Tue, 30 Apr 2019 09:28:29 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 5/7] rtc: jz4740: use dev_pm_set_wake_irq() to simplify code
Date:   Tue, 30 Apr 2019 11:28:19 +0200
Message-Id: <20190430092821.27963-5-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430092821.27963-1-alexandre.belloni@bootlin.com>
References: <20190430092821.27963-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use dev_pm_set_wake_irq() to set the RTC as a wakeup source for suspend.
This allows to remove the whole dev_pm_ops structure.

Tested-by: Mathieu Malaterre <malat@debian.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-jz4740.c | 37 +++++++------------------------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 077670ffde01..32e6b6270efd 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/reboot.h>
 #include <linux/rtc.h>
 #include <linux/slab.h>
@@ -346,6 +347,12 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, 1);
 
+	ret = dev_pm_set_wake_irq(&pdev->dev, rtc->irq);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to set wake irq: %d\n", ret);
+		return ret;
+	}
+
 	rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc->rtc)) {
 		ret = PTR_ERR(rtc->rtc);
@@ -403,35 +410,6 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int jz4740_rtc_suspend(struct device *dev)
-{
-	struct jz4740_rtc *rtc = dev_get_drvdata(dev);
-
-	if (device_may_wakeup(dev))
-		enable_irq_wake(rtc->irq);
-	return 0;
-}
-
-static int jz4740_rtc_resume(struct device *dev)
-{
-	struct jz4740_rtc *rtc = dev_get_drvdata(dev);
-
-	if (device_may_wakeup(dev))
-		disable_irq_wake(rtc->irq);
-	return 0;
-}
-
-static const struct dev_pm_ops jz4740_pm_ops = {
-	.suspend = jz4740_rtc_suspend,
-	.resume  = jz4740_rtc_resume,
-};
-#define JZ4740_RTC_PM_OPS (&jz4740_pm_ops)
-
-#else
-#define JZ4740_RTC_PM_OPS NULL
-#endif  /* CONFIG_PM */
-
 static const struct platform_device_id jz4740_rtc_ids[] = {
 	{ "jz4740-rtc", ID_JZ4740 },
 	{ "jz4780-rtc", ID_JZ4780 },
@@ -443,7 +421,6 @@ static struct platform_driver jz4740_rtc_driver = {
 	.probe	 = jz4740_rtc_probe,
 	.driver	 = {
 		.name  = "jz4740-rtc",
-		.pm    = JZ4740_RTC_PM_OPS,
 		.of_match_table = of_match_ptr(jz4740_rtc_of_match),
 	},
 	.id_table = jz4740_rtc_ids,
-- 
2.20.1

