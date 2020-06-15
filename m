Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142B91F9CBD
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2020 18:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730213AbgFOQPC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Jun 2020 12:15:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:40940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729949AbgFOQPC (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 15 Jun 2020 12:15:02 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84F3E207D3;
        Mon, 15 Jun 2020 16:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592237701;
        bh=2OzWW0KXF4A9UjQP3e9+t9jykTQ0Zh4+TAU3P3m8zrQ=;
        h=From:To:Cc:Subject:Date:From;
        b=LysOJVpZ/jH47HxHVGsTHzYAyzfoUijj3o/O+igK4L5suZOs6M6dfnB1JkHIUQeEf
         ASc+0NvKfAPWCR7kuQDJG6pPH7ekugKitBKcsIjSc8IptWF14XysAorpLHCfGjOJcX
         nfsg8XpP0Gkx32hUOWCZirHKsH6q6rCwHPLSr+rA=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH] rtc: max77686: Do not allow interrupt to fire before system resume
Date:   Mon, 15 Jun 2020 18:14:55 +0200
Message-Id: <20200615161455.4420-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The rtc-max77686 device shares the main interrupt line with parent MFD
device (max77686 driver).  During the system suspend, the parent MFD
device disables this IRQ to prevent an early event happening before
resuming I2C bus controller.

The same should be done by rtc-max77686 driver because otherwise the
interrupt handler max77686_rtc_alarm_irq() will be called before its
resume function (max77686_rtc_resume()).  Such issue is not fatal but
disabling shared IRQ by all users ensures correct behavior.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

If this looks ok, I guess all maxim RTC drivers should be updated?
---
 drivers/rtc/rtc-max77686.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 03ebcf1c0f3d..645de5af707b 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -805,17 +805,33 @@ static int max77686_rtc_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int max77686_rtc_suspend(struct device *dev)
 {
+	struct max77686_rtc_info *info = dev_get_drvdata(dev);
+	int ret = 0;
+
 	if (device_may_wakeup(dev)) {
 		struct max77686_rtc_info *info = dev_get_drvdata(dev);
 
-		return enable_irq_wake(info->virq);
+		ret = enable_irq_wake(info->virq);
 	}
 
-	return 0;
+	/*
+	 * Main IRQ (not virtual) must be disabled during suspend because if it
+	 * happens while suspended it will be handled before resuming I2C.
+	 *
+	 * Since Main IRQ is shared, all its users should disable it to be sure
+	 * it won't fire while one of them is still suspended.
+	 */
+	disable_irq(info->rtc_irq);
+
+	return ret;
 }
 
 static int max77686_rtc_resume(struct device *dev)
 {
+	struct max77686_rtc_info *info = dev_get_drvdata(dev);
+
+	enable_irq(info->rtc_irq);
+
 	if (device_may_wakeup(dev)) {
 		struct max77686_rtc_info *info = dev_get_drvdata(dev);
 
-- 
2.17.1

