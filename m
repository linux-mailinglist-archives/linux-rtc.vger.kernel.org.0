Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8213930DA37
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Feb 2021 13:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhBCMwR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 Feb 2021 07:52:17 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:12410 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbhBCMnT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 Feb 2021 07:43:19 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DW1Wt0wmjzjHD2;
        Wed,  3 Feb 2021 20:41:30 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Feb 2021 20:42:27 +0800
From:   Xiaofei Tan <tanxiaofei@huawei.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     Xiaofei Tan <tanxiaofei@huawei.com>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>
Subject: [PATCH 2/6] rtc: pm8xxx: Replace spin_lock_irqsave with spin_lock in hard IRQ
Date:   Wed, 3 Feb 2021 20:39:37 +0800
Message-ID: <1612355981-6764-3-git-send-email-tanxiaofei@huawei.com>
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
 drivers/rtc/rtc-pm8xxx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index 0d9dd6f..92642aa 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -343,16 +343,15 @@ static irqreturn_t pm8xxx_alarm_trigger(int irq, void *dev_id)
 	const struct pm8xxx_rtc_regs *regs = rtc_dd->regs;
 	unsigned int ctrl_reg;
 	int rc;
-	unsigned long irq_flags;
 
 	rtc_update_irq(rtc_dd->rtc, 1, RTC_IRQF | RTC_AF);
 
-	spin_lock_irqsave(&rtc_dd->ctrl_reg_lock, irq_flags);
+	spin_lock(&rtc_dd->ctrl_reg_lock);
 
 	/* Clear the alarm enable bit */
 	rc = regmap_read(rtc_dd->regmap, regs->alarm_ctrl, &ctrl_reg);
 	if (rc) {
-		spin_unlock_irqrestore(&rtc_dd->ctrl_reg_lock, irq_flags);
+		spin_unlock(&rtc_dd->ctrl_reg_lock);
 		goto rtc_alarm_handled;
 	}
 
@@ -360,13 +359,13 @@ static irqreturn_t pm8xxx_alarm_trigger(int irq, void *dev_id)
 
 	rc = regmap_write(rtc_dd->regmap, regs->alarm_ctrl, ctrl_reg);
 	if (rc) {
-		spin_unlock_irqrestore(&rtc_dd->ctrl_reg_lock, irq_flags);
+		spin_unlock(&rtc_dd->ctrl_reg_lock);
 		dev_err(rtc_dd->rtc_dev,
 			"Write to alarm control register failed\n");
 		goto rtc_alarm_handled;
 	}
 
-	spin_unlock_irqrestore(&rtc_dd->ctrl_reg_lock, irq_flags);
+	spin_unlock(&rtc_dd->ctrl_reg_lock);
 
 	/* Clear RTC alarm register */
 	rc = regmap_read(rtc_dd->regmap, regs->alarm_ctrl2, &ctrl_reg);
-- 
2.8.1

