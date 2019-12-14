Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F31F11F4B5
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbfLNWK4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:10:56 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:48551 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbfLNWKc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:10:32 -0500
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1E35D100007;
        Sat, 14 Dec 2019 22:10:31 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 12/16] rtc: rv3029: convert to devm_rtc_allocate_device
Date:   Sat, 14 Dec 2019 23:10:18 +0100
Message-Id: <20191214221022.622482-13-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
References: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This allows further improvement of the driver.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3029c2.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 433aad16897e..555c88c2edbb 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -731,12 +731,9 @@ static int rv3029_probe(struct device *dev, struct regmap *regmap, int irq,
 	rv3029_trickle_config(dev);
 	rv3029_hwmon_register(dev, name);
 
-	rv3029->rtc = devm_rtc_device_register(dev, name, &rv3029_rtc_ops,
-					       THIS_MODULE);
-	if (IS_ERR(rv3029->rtc)) {
-		dev_err(dev, "unable to register the class device\n");
+	rv3029->rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rv3029->rtc))
 		return PTR_ERR(rv3029->rtc);
-	}
 
 	if (rv3029->irq > 0) {
 		rc = devm_request_threaded_irq(dev, rv3029->irq,
@@ -753,7 +750,9 @@ static int rv3029_probe(struct device *dev, struct regmap *regmap, int irq,
 		}
 	}
 
-	return 0;
+	rv3029->rtc->ops = &rv3029_rtc_ops;
+
+	return rtc_register_device(rv3029->rtc);
 }
 
 static const struct regmap_range rv3029_holes_range[] = {
-- 
2.23.0

