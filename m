Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CECD711F4A7
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbfLNWKg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:10:36 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:42975 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbfLNWK2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:10:28 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 111991BF206;
        Sat, 14 Dec 2019 22:10:27 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 02/16] rtc: rv3029: let regmap validate the register ranges
Date:   Sat, 14 Dec 2019 23:10:08 +0100
Message-Id: <20191214221022.622482-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
References: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Instead of trying to validate the accessed registers in custom functions,
let regmap handle that. This allows to defines all the holes in the
register range and gives access to the regmap debugfs register dump.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3029c2.c | 39 +++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index e68329eb5af2..aed28e29a5fd 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -126,10 +126,6 @@ static int rv3029_read_regs(struct device *dev, u8 reg, u8 *buf,
 {
 	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
 
-	if ((reg > RV3029_USR1_RAM_PAGE + 7) ||
-	    (reg + len > RV3029_USR1_RAM_PAGE + 8))
-		return -EINVAL;
-
 	return regmap_bulk_read(rv3029->regmap, reg, buf, len);
 }
 
@@ -138,10 +134,6 @@ static int rv3029_write_regs(struct device *dev, u8 reg, u8 const buf[],
 {
 	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
 
-	if ((reg > RV3029_USR1_RAM_PAGE + 7) ||
-	    (reg + len > RV3029_USR1_RAM_PAGE + 8))
-		return -EINVAL;
-
 	return regmap_bulk_write(rv3029->regmap, reg, buf, len);
 }
 
@@ -837,17 +829,34 @@ static int rv3029_probe(struct device *dev, struct regmap *regmap, int irq,
 	return 0;
 }
 
+static const struct regmap_range rv3029_holes_range[] = {
+	regmap_reg_range(0x05, 0x07),
+	regmap_reg_range(0x0f, 0x0f),
+	regmap_reg_range(0x17, 0x17),
+	regmap_reg_range(0x1a, 0x1f),
+	regmap_reg_range(0x21, 0x27),
+	regmap_reg_range(0x34, 0x37),
+};
+
+static const struct regmap_access_table rv3029_regs = {
+	.no_ranges =	rv3029_holes_range,
+	.n_no_ranges =	ARRAY_SIZE(rv3029_holes_range),
+};
+
+static const struct regmap_config config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.rd_table = &rv3029_regs,
+	.wr_table = &rv3029_regs,
+	.max_register = 0x3f,
+};
+
 #if IS_ENABLED(CONFIG_I2C)
 
 static int rv3029_i2c_probe(struct i2c_client *client,
 			    const struct i2c_device_id *id)
 {
 	struct regmap *regmap;
-	static const struct regmap_config config = {
-		.reg_bits = 8,
-		.val_bits = 8,
-	};
-
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_I2C_BLOCK |
 				     I2C_FUNC_SMBUS_BYTE)) {
 		dev_err(&client->dev, "Adapter does not support SMBUS_I2C_BLOCK or SMBUS_I2C_BYTE\n");
@@ -913,10 +922,6 @@ static void rv3029_unregister_driver(void)
 
 static int rv3049_probe(struct spi_device *spi)
 {
-	static const struct regmap_config config = {
-		.reg_bits = 8,
-		.val_bits = 8,
-	};
 	struct regmap *regmap;
 
 	regmap = devm_regmap_init_spi(spi, &config);
-- 
2.23.0

