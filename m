Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3947B1293E8
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2019 11:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfLWKBP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Dec 2019 05:01:15 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:43469 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726233AbfLWKBP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Dec 2019 05:01:15 -0500
X-Originating-IP: 176.184.22.51
Received: from localhost (did75-h03-176-184-22-51.dsl.sta.abo.bbox.fr [176.184.22.51])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id AEEF1C000F;
        Mon, 23 Dec 2019 10:01:12 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2] rtc: rv3029: remove useless error messages
Date:   Mon, 23 Dec 2019 11:01:08 +0100
Message-Id: <20191223100108.1083078-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Remove redundant messages or messages that would not add any value because
the information is already conveyed properly using errno.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3029c2.c | 35 +++++++++--------------------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 6f1c7790a6a2..483faa4f66d4 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -318,10 +318,8 @@ static int rv3029_read_time(struct device *dev, struct rtc_time *tm)
 
 	ret = regmap_bulk_read(rv3029->regmap, RV3029_W_SEC, regs,
 			       RV3029_WATCH_SECTION_LEN);
-	if (ret < 0) {
-		dev_err(dev, "%s: reading RTC section failed\n", __func__);
+	if (ret < 0)
 		return ret;
-	}
 
 	tm->tm_sec = bcd2bin(regs[RV3029_W_SEC - RV3029_W_SEC]);
 	tm->tm_min = bcd2bin(regs[RV3029_W_MINUTES - RV3029_W_SEC]);
@@ -357,21 +355,16 @@ static int rv3029_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 
 	ret = regmap_bulk_read(rv3029->regmap, RV3029_A_SC, regs,
 			       RV3029_ALARM_SECTION_LEN);
-	if (ret < 0) {
-		dev_err(dev, "%s: reading alarm section failed\n", __func__);
+	if (ret < 0)
 		return ret;
-	}
 
 	ret = regmap_read(rv3029->regmap, RV3029_IRQ_CTRL, &controls);
-	if (ret) {
-		dev_err(dev, "Read IRQ Control Register error %d\n", ret);
+	if (ret)
 		return ret;
-	}
+
 	ret = regmap_read(rv3029->regmap, RV3029_IRQ_FLAGS, &flags);
-	if (ret < 0) {
-		dev_err(dev, "Read IRQ Flags Register error %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	tm->tm_sec = bcd2bin(regs[RV3029_A_SC - RV3029_A_SC] & 0x7f);
 	tm->tm_min = bcd2bin(regs[RV3029_A_MN - RV3029_A_SC] & 0x7f);
@@ -802,11 +795,8 @@ static int rv3029_i2c_probe(struct i2c_client *client,
 	}
 
 	regmap = devm_regmap_init_i2c(client, &config);
-	if (IS_ERR(regmap)) {
-		dev_err(&client->dev, "%s: regmap allocation failed: %ld\n",
-			__func__, PTR_ERR(regmap));
+	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
-	}
 
 	return rv3029_probe(&client->dev, regmap, client->irq, client->name);
 }
@@ -863,11 +853,8 @@ static int rv3049_probe(struct spi_device *spi)
 	struct regmap *regmap;
 
 	regmap = devm_regmap_init_spi(spi, &config);
-	if (IS_ERR(regmap)) {
-		dev_err(&spi->dev, "%s: regmap allocation failed: %ld\n",
-			__func__, PTR_ERR(regmap));
+	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
-	}
 
 	return rv3029_probe(&spi->dev, regmap, spi->irq, "rv3049");
 }
@@ -907,16 +894,12 @@ static int __init rv30x9_init(void)
 	int ret;
 
 	ret = rv3029_register_driver();
-	if (ret) {
-		pr_err("Failed to register rv3029 driver: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	ret = rv3049_register_driver();
-	if (ret) {
-		pr_err("Failed to register rv3049 driver: %d\n", ret);
+	if (ret)
 		rv3029_unregister_driver();
-	}
 
 	return ret;
 }
-- 
2.23.0

