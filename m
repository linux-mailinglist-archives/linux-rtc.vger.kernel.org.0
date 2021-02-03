Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09D2130DA18
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Feb 2021 13:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbhBCMrU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 Feb 2021 07:47:20 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:12117 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbhBCMnX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 Feb 2021 07:43:23 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DW1Wh25k2z163X0;
        Wed,  3 Feb 2021 20:41:20 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Feb 2021 20:42:28 +0800
From:   Xiaofei Tan <tanxiaofei@huawei.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     Xiaofei Tan <tanxiaofei@huawei.com>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>
Subject: [PATCH 3/6] rtc: r7301: Replace spin_lock_irqsave with spin_lock in hard IRQ
Date:   Wed, 3 Feb 2021 20:39:38 +0800
Message-ID: <1612355981-6764-4-git-send-email-tanxiaofei@huawei.com>
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
 drivers/rtc/rtc-r7301.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-r7301.c b/drivers/rtc/rtc-r7301.c
index aaf1b95..5dbaeb7 100644
--- a/drivers/rtc/rtc-r7301.c
+++ b/drivers/rtc/rtc-r7301.c
@@ -320,11 +320,10 @@ static irqreturn_t rtc7301_irq_handler(int irq, void *dev_id)
 {
 	struct rtc_device *rtc = dev_id;
 	struct rtc7301_priv *priv = dev_get_drvdata(rtc->dev.parent);
-	unsigned long flags;
 	irqreturn_t ret = IRQ_NONE;
 	u8 alrm_ctrl;
 
-	spin_lock_irqsave(&priv->lock, flags);
+	spin_lock(&priv->lock);
 
 	rtc7301_select_bank(priv, 1);
 
@@ -335,7 +334,7 @@ static irqreturn_t rtc7301_irq_handler(int irq, void *dev_id)
 		rtc_update_irq(rtc, 1, RTC_IRQF | RTC_AF);
 	}
 
-	spin_unlock_irqrestore(&priv->lock, flags);
+	spin_unlock(&priv->lock);
 
 	return ret;
 }
-- 
2.8.1

