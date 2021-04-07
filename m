Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9A4356085
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Apr 2021 02:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347621AbhDGA5r (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 6 Apr 2021 20:57:47 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:16003 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347642AbhDGA5q (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 6 Apr 2021 20:57:46 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFQsQ0v60zPnn1;
        Wed,  7 Apr 2021 08:54:50 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 08:57:25 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     <linux-rtc@vger.kernel.org>, Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH] rtc: cpcap: move to use request_irq by IRQF_NO_AUTOEN flag
Date:   Wed, 7 Apr 2021 08:57:51 +0800
Message-ID: <1617757071-14266-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable because of requesting.

this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
is being merged: https://lore.kernel.org/patchwork/patch/1388765/

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/rtc/rtc-cpcap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-cpcap.c b/drivers/rtc/rtc-cpcap.c
index afc8fcb..c14b838 100644
--- a/drivers/rtc/rtc-cpcap.c
+++ b/drivers/rtc/rtc-cpcap.c
@@ -270,13 +270,13 @@ static int cpcap_rtc_probe(struct platform_device *pdev)
 	rtc->alarm_irq = platform_get_irq(pdev, 0);
 	err = devm_request_threaded_irq(dev, rtc->alarm_irq, NULL,
 					cpcap_rtc_alarm_irq,
-					IRQF_TRIGGER_NONE | IRQF_ONESHOT,
+					IRQF_TRIGGER_NONE | IRQF_ONESHOT |
+					IRQF_NO_AUTOEN,
 					"rtc_alarm", rtc);
 	if (err) {
 		dev_err(dev, "Could not request alarm irq: %d\n", err);
 		return err;
 	}
-	disable_irq(rtc->alarm_irq);
 
 	/* Stock Android uses the 1 Hz interrupt for "secure clock daemon",
 	 * which is not supported by the mainline kernel. The mainline kernel
-- 
2.7.4

