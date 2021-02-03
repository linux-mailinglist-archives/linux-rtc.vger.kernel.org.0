Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B19A30DA60
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Feb 2021 13:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbhBCM6x (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 Feb 2021 07:58:53 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:12389 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbhBCMnN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 Feb 2021 07:43:13 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DW1WV2mYSz7fwK;
        Wed,  3 Feb 2021 20:41:10 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Feb 2021 20:42:19 +0800
From:   Xiaofei Tan <tanxiaofei@huawei.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     Xiaofei Tan <tanxiaofei@huawei.com>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>
Subject: [PATCH 1/6] rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ
Date:   Wed, 3 Feb 2021 20:39:36 +0800
Message-ID: <1612355981-6764-2-git-send-email-tanxiaofei@huawei.com>
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
 drivers/rtc/rtc-cmos.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 68a9ac6..d46f59a 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -649,11 +649,10 @@ static struct cmos_rtc	cmos_rtc;
 
 static irqreturn_t cmos_interrupt(int irq, void *p)
 {
-	unsigned long	flags;
 	u8		irqstat;
 	u8		rtc_control;
 
-	spin_lock_irqsave(&rtc_lock, flags);
+	spin_lock(&rtc_lock);
 
 	/* When the HPET interrupt handler calls us, the interrupt
 	 * status is passed as arg1 instead of the irq number.  But
@@ -687,7 +686,7 @@ static irqreturn_t cmos_interrupt(int irq, void *p)
 			hpet_mask_rtc_irq_bit(RTC_AIE);
 		CMOS_READ(RTC_INTR_FLAGS);
 	}
-	spin_unlock_irqrestore(&rtc_lock, flags);
+	spin_unlock(&rtc_lock);
 
 	if (is_intr(irqstat)) {
 		rtc_update_irq(p, 1, irqstat);
-- 
2.8.1

