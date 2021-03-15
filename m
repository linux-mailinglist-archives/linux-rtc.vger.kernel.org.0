Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37EC033B312
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Mar 2021 13:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbhCOMuw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Mar 2021 08:50:52 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:13929 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhCOMul (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 15 Mar 2021 08:50:41 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Dzbp820YSzjRH0;
        Mon, 15 Mar 2021 20:49:04 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 20:50:33 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     <linux-rtc@vger.kernel.org>
Subject: [PATCH v2] rtc: tps6586x: move to use request_irq by IRQF_NO_AUTOEN flag
Date:   Mon, 15 Mar 2021 20:51:14 +0800
Message-ID: <1615812674-62449-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

request_irq() with IRQF_NO_AUTOEN flag will disable IRQ auto-enable
because of requesting.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
v2: Fix the problem of using wrong flags
---
 drivers/rtc/rtc-tps6586x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
index a980337..0eb9a0d 100644
--- a/drivers/rtc/rtc-tps6586x.c
+++ b/drivers/rtc/rtc-tps6586x.c
@@ -268,11 +268,9 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
 	rtc->rtc->start_secs = mktime64(2009, 1, 1, 0, 0, 0);
 	rtc->rtc->set_start_time = true;
 
-	irq_set_status_flags(rtc->irq, IRQ_NOAUTOEN);
-
 	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
 				tps6586x_rtc_irq,
-				IRQF_ONESHOT,
+				IRQF_ONESHOT | IRQF_NO_AUTOEN,
 				dev_name(&pdev->dev), rtc);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "request IRQ(%d) failed with ret %d\n",
-- 
2.7.4

