Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E7F30DA1C
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Feb 2021 13:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhBCMr0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 Feb 2021 07:47:26 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:12116 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbhBCMnW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 Feb 2021 07:43:22 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DW1Wh1bYLz163Wm;
        Wed,  3 Feb 2021 20:41:20 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Feb 2021 20:42:30 +0800
From:   Xiaofei Tan <tanxiaofei@huawei.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     Xiaofei Tan <tanxiaofei@huawei.com>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>
Subject: [PATCH 4/6] rtc: tegra: Replace spin_lock_irqsave with spin_lock in hard IRQ
Date:   Wed, 3 Feb 2021 20:39:39 +0800
Message-ID: <1612355981-6764-5-git-send-email-tanxiaofei@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1612355981-6764-1-git-send-email-tanxiaofei@huawei.com>
References: <1612355981-6764-1-git-send-email-tanxiaofei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

It is redundant to do irqsave and irqrestore in hardIRQ context, where
it has been in a irq-disabled context.

Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>
---
 drivers/rtc/rtc-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 8925015..85f7ad5 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -232,7 +232,7 @@ static irqreturn_t tegra_rtc_irq_handler(int irq, void *data)
 {
 	struct device *dev = data;
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
-	unsigned long events = 0, flags;
+	unsigned long events = 0;
 	u32 status;
 
 	status = readl(info->base + TEGRA_RTC_REG_INTR_STATUS);
@@ -240,10 +240,10 @@ static irqreturn_t tegra_rtc_irq_handler(int irq, void *data)
 		/* clear the interrupt masks and status on any IRQ */
 		tegra_rtc_wait_while_busy(dev);
 
-		spin_lock_irqsave(&info->lock, flags);
+		spin_lock(&info->lock);
 		writel(0, info->base + TEGRA_RTC_REG_INTR_MASK);
 		writel(status, info->base + TEGRA_RTC_REG_INTR_STATUS);
-		spin_unlock_irqrestore(&info->lock, flags);
+		spin_unlock(&info->lock);
 	}
 
 	/* check if alarm */
-- 
2.8.1

