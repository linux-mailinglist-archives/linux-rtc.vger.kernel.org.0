Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE3D633A9A9
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Mar 2021 03:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbhCOCi7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 14 Mar 2021 22:38:59 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:13532 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhCOCix (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 14 Mar 2021 22:38:53 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DzLCJ541yzNn0m;
        Mon, 15 Mar 2021 10:36:28 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 10:38:48 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     <linux-rtc@vger.kernel.org>
Subject: [PATCH] rtc: rtc-spear: replace spin_lock_irqsave by spin_lock in hard IRQ
Date:   Mon, 15 Mar 2021 10:39:30 +0800
Message-ID: <1615775970-59070-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The code has been in a irq-disabled context since it is hard IRQ. There
is no necessity to do it again.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/rtc/rtc-spear.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-spear.c b/drivers/rtc/rtc-spear.c
index 833daeb..ee721e5 100644
--- a/drivers/rtc/rtc-spear.c
+++ b/drivers/rtc/rtc-spear.c
@@ -153,12 +153,12 @@ static void rtc_wait_not_busy(struct spear_rtc_config *config)
 static irqreturn_t spear_rtc_irq(int irq, void *dev_id)
 {
 	struct spear_rtc_config *config = dev_id;
-	unsigned long flags, events = 0;
+	unsigned long events = 0;
 	unsigned int irq_data;
 
-	spin_lock_irqsave(&config->lock, flags);
+	spin_lock(&config->lock);
 	irq_data = readl(config->ioaddr + STATUS_REG);
-	spin_unlock_irqrestore(&config->lock, flags);
+	spin_unlock(&config->lock);
 
 	if ((irq_data & RTC_INT_MASK)) {
 		spear_rtc_clear_interrupt(config);
-- 
2.7.4

