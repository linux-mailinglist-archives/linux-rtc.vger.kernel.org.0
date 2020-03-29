Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3DA1970D4
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Mar 2020 00:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728748AbgC2Wmv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 29 Mar 2020 18:42:51 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:21487 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728473AbgC2Wmv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 29 Mar 2020 18:42:51 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 49110240005;
        Sun, 29 Mar 2020 22:42:49 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] rtc: da9052: convert to devm_rtc_allocate_device
Date:   Mon, 30 Mar 2020 00:42:40 +0200
Message-Id: <20200329224240.776568-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This allows further improvement of the driver.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---

Changes in v2:
 - avoid reordering rtc registration and irq request.

 drivers/rtc/rtc-da9052.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-da9052.c b/drivers/rtc/rtc-da9052.c
index 204eb7cf1aa4..e76561b8ad4c 100644
--- a/drivers/rtc/rtc-da9052.c
+++ b/drivers/rtc/rtc-da9052.c
@@ -298,12 +298,16 @@ static int da9052_rtc_probe(struct platform_device *pdev)
 		rtc_err(rtc, "Failed to disable TICKS: %d\n", ret);
 
 	device_init_wakeup(&pdev->dev, true);
-	rtc->rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
-				       &da9052_rtc_ops, THIS_MODULE);
-
+	rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc->rtc))
 		return PTR_ERR(rtc->rtc);
 
+	rtc->rtc->ops = &da9052_rtc_ops;
+
+	ret = rtc_register_device(rtc->rtc);
+	if (ret)
+		return ret;
+
 	ret = da9052_request_irq(rtc->da9052, DA9052_IRQ_ALARM, "ALM",
 				da9052_rtc_irq, rtc);
 	if (ret != 0) {
-- 
2.25.1

