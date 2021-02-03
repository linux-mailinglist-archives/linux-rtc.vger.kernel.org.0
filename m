Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDDE430DA1A
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Feb 2021 13:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbhBCMrW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 Feb 2021 07:47:22 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:12115 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbhBCMnX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 Feb 2021 07:43:23 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DW1Wh1Mp1z163WK;
        Wed,  3 Feb 2021 20:41:20 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Feb 2021 20:42:31 +0800
From:   Xiaofei Tan <tanxiaofei@huawei.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     Xiaofei Tan <tanxiaofei@huawei.com>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>
Subject: [PATCH 5/6] rtc: mxc: Replace spin_lock_irqsave with spin_lock in hard IRQ
Date:   Wed, 3 Feb 2021 20:39:40 +0800
Message-ID: <1612355981-6764-6-git-send-email-tanxiaofei@huawei.com>
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
 drivers/rtc/rtc-mxc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-mxc.c b/drivers/rtc/rtc-mxc.c
index 65b29b0..db57dda7 100644
--- a/drivers/rtc/rtc-mxc.c
+++ b/drivers/rtc/rtc-mxc.c
@@ -189,11 +189,10 @@ static irqreturn_t mxc_rtc_interrupt(int irq, void *dev_id)
 	struct platform_device *pdev = dev_id;
 	struct rtc_plat_data *pdata = platform_get_drvdata(pdev);
 	void __iomem *ioaddr = pdata->ioaddr;
-	unsigned long flags;
 	u32 status;
 	u32 events = 0;
 
-	spin_lock_irqsave(&pdata->rtc->irq_lock, flags);
+	spin_lock(&pdata->rtc->irq_lock);
 	status = readw(ioaddr + RTC_RTCISR) & readw(ioaddr + RTC_RTCIENR);
 	/* clear interrupt sources */
 	writew(status, ioaddr + RTC_RTCISR);
@@ -209,7 +208,7 @@ static irqreturn_t mxc_rtc_interrupt(int irq, void *dev_id)
 		events |= (RTC_PF | RTC_IRQF);
 
 	rtc_update_irq(pdata->rtc, 1, events);
-	spin_unlock_irqrestore(&pdata->rtc->irq_lock, flags);
+	spin_unlock(&pdata->rtc->irq_lock);
 
 	return IRQ_HANDLED;
 }
-- 
2.8.1

