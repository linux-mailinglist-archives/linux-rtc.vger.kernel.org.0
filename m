Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8E5E2AD28E
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Nov 2020 10:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgKJJfW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Nov 2020 04:35:22 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7166 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgKJJfV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 Nov 2020 04:35:21 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CVjQ75Sjwz15Sl2;
        Tue, 10 Nov 2020 17:35:11 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Tue, 10 Nov 2020 17:35:16 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] rtc: cpcap: Fix missing IRQF_ONESHOT as only threaded handler
Date:   Tue, 10 Nov 2020 17:35:47 +0800
Message-ID: <1605000947-32882-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Coccinelle noticed:
drivers/rtc/rtc-cpcap.c:271:7-32: ERROR: Threaded IRQ with no
primary handler requested without IRQF_ONESHOT
drivers/rtc/rtc-cpcap.c:287:7-32: ERROR: Threaded IRQ with no
primary handler requested without IRQF_ONESHOT

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/rtc/rtc-cpcap.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-cpcap.c b/drivers/rtc/rtc-cpcap.c
index 800667d..38d576b 100644
--- a/drivers/rtc/rtc-cpcap.c
+++ b/drivers/rtc/rtc-cpcap.c
@@ -269,7 +269,8 @@ static int cpcap_rtc_probe(struct platform_device *pdev)
 
 	rtc->alarm_irq = platform_get_irq(pdev, 0);
 	err = devm_request_threaded_irq(dev, rtc->alarm_irq, NULL,
-					cpcap_rtc_alarm_irq, IRQF_TRIGGER_NONE,
+					cpcap_rtc_alarm_irq,
+					IRQF_TRIGGER_NONE | IRQF_ONESHOT,
 					"rtc_alarm", rtc);
 	if (err) {
 		dev_err(dev, "Could not request alarm irq: %d\n", err);
@@ -285,7 +286,8 @@ static int cpcap_rtc_probe(struct platform_device *pdev)
 	 */
 	rtc->update_irq = platform_get_irq(pdev, 1);
 	err = devm_request_threaded_irq(dev, rtc->update_irq, NULL,
-					cpcap_rtc_update_irq, IRQF_TRIGGER_NONE,
+					cpcap_rtc_update_irq,
+					IRQF_TRIGGER_NONE | IRQF_ONESHOT,
 					"rtc_1hz", rtc);
 	if (err) {
 		dev_err(dev, "Could not request update irq: %d\n", err);
-- 
2.7.4

