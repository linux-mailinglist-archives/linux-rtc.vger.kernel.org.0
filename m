Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E94E17B7A4
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 08:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgCFHoH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Mar 2020 02:44:07 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:55665 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbgCFHoH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Mar 2020 02:44:07 -0500
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id CEB50200009;
        Fri,  6 Mar 2020 07:44:05 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] rtc: mpc5121: simplify probe
Date:   Fri,  6 Mar 2020 08:44:00 +0100
Message-Id: <20200306074404.58909-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: yes
X-Spam-Level: **************************
X-GND-Spam-Score: 400
X-GND-Status: SPAM
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use devm managed function to simplify probe and remove.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-mpc5121.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-mpc5121.c b/drivers/rtc/rtc-mpc5121.c
index 15a9d0278778..9e4454d35352 100644
--- a/drivers/rtc/rtc-mpc5121.c
+++ b/drivers/rtc/rtc-mpc5121.c
@@ -315,8 +315,8 @@ static int mpc5121_rtc_probe(struct platform_device *op)
 	if (!rtc)
 		return -ENOMEM;
 
-	rtc->regs = of_iomap(op->dev.of_node, 0);
-	if (!rtc->regs) {
+	rtc->regs = devm_platform_ioremap_resource(op, 0);
+	if (IS_ERR(rtc->regs)) {
 		dev_err(&op->dev, "%s: couldn't map io space\n", __func__);
 		return -ENOSYS;
 	}
@@ -326,8 +326,8 @@ static int mpc5121_rtc_probe(struct platform_device *op)
 	platform_set_drvdata(op, rtc);
 
 	rtc->irq = irq_of_parse_and_map(op->dev.of_node, 1);
-	err = request_irq(rtc->irq, mpc5121_rtc_handler, 0,
-						"mpc5121-rtc", &op->dev);
+	err = devm_request_irq(&op->dev, rtc->irq, mpc5121_rtc_handler, 0,
+			       "mpc5121-rtc", &op->dev);
 	if (err) {
 		dev_err(&op->dev, "%s: could not request irq: %i\n",
 							__func__, rtc->irq);
@@ -335,8 +335,9 @@ static int mpc5121_rtc_probe(struct platform_device *op)
 	}
 
 	rtc->irq_periodic = irq_of_parse_and_map(op->dev.of_node, 0);
-	err = request_irq(rtc->irq_periodic, mpc5121_rtc_handler_upd,
-				0, "mpc5121-rtc_upd", &op->dev);
+	err = devm_request_irq(&op->dev, rtc->irq_periodic,
+			       mpc5121_rtc_handler_upd, 0, "mpc5121-rtc_upd",
+			       &op->dev);
 	if (err) {
 		dev_err(&op->dev, "%s: could not request irq: %i\n",
 						__func__, rtc->irq_periodic);
@@ -361,20 +362,16 @@ static int mpc5121_rtc_probe(struct platform_device *op)
 
 	if (IS_ERR(rtc->rtc)) {
 		err = PTR_ERR(rtc->rtc);
-		goto out_free_irq;
+		goto out_dispose2;
 	}
 	rtc->rtc->uie_unsupported = 1;
 
 	return 0;
 
-out_free_irq:
-	free_irq(rtc->irq_periodic, &op->dev);
 out_dispose2:
 	irq_dispose_mapping(rtc->irq_periodic);
-	free_irq(rtc->irq, &op->dev);
 out_dispose:
 	irq_dispose_mapping(rtc->irq);
-	iounmap(rtc->regs);
 
 	return err;
 }
@@ -388,9 +385,6 @@ static int mpc5121_rtc_remove(struct platform_device *op)
 	out_8(&regs->alm_enable, 0);
 	out_8(&regs->int_enable, in_8(&regs->int_enable) & ~0x1);
 
-	iounmap(rtc->regs);
-	free_irq(rtc->irq, &op->dev);
-	free_irq(rtc->irq_periodic, &op->dev);
 	irq_dispose_mapping(rtc->irq);
 	irq_dispose_mapping(rtc->irq_periodic);
 
-- 
2.24.1

