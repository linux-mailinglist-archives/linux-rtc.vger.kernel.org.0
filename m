Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685C1447684
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Nov 2021 23:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236738AbhKGW5x (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Nov 2021 17:57:53 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:44423 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236719AbhKGW5v (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Nov 2021 17:57:51 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6EE8520003;
        Sun,  7 Nov 2021 22:55:07 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/12] rtc: rx8025: switch to devm_rtc_allocate_device
Date:   Sun,  7 Nov 2021 23:54:52 +0100
Message-Id: <20211107225458.111068-7-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
References: <20211107225458.111068-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Switch to devm_rtc_allocate_device/devm_rtc_register_device, this allows
for further improvement of the driver.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rx8025.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index d38aaf08108c..617b044c66f0 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -559,12 +559,11 @@ static int rx8025_probe(struct i2c_client *client,
 	if (err)
 		return err;
 
-	rx8025->rtc = devm_rtc_device_register(&client->dev, client->name,
-					  &rx8025_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rx8025->rtc)) {
-		dev_err(&client->dev, "unable to register the class device\n");
+	rx8025->rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(rx8025->rtc))
 		return PTR_ERR(rx8025->rtc);
-	}
+
+	rx8025->rtc->ops = &rx8025_rtc_ops;
 
 	if (client->irq > 0) {
 		dev_info(&client->dev, "IRQ %d supplied\n", client->irq);
@@ -583,6 +582,10 @@ static int rx8025_probe(struct i2c_client *client,
 	/* the rx8025 alarm only supports a minute accuracy */
 	rx8025->rtc->uie_unsupported = 1;
 
+	err = devm_rtc_register_device(rx8025->rtc);
+	if (err)
+		return err;
+
 	err = rx8025_sysfs_register(&client->dev);
 	return err;
 }
-- 
2.31.1

