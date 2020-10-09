Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258F3288CBB
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Oct 2020 17:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389372AbgJIPbM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Oct 2020 11:31:12 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:55015 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389351AbgJIPbM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Oct 2020 11:31:12 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E5F95E0005;
        Fri,  9 Oct 2020 15:31:08 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] rtc: rv3028: factorize EERD bit handling
Date:   Fri,  9 Oct 2020 17:31:00 +0200
Message-Id: <20201009153101.721149-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201009153101.721149-1-alexandre.belloni@bootlin.com>
References: <20201009153101.721149-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Both rv3028_eeprom_write and rv3028_eeprom_read enable EERD before sending
commands to the EEPROM and restore it afterwards. Factorize this code.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3028.c | 118 +++++++++++++++++++--------------------
 1 file changed, 59 insertions(+), 59 deletions(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 5cfce6415d9c..7b8823f43626 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -171,6 +171,44 @@ static const struct attribute_group rv3028_attr_group = {
 	.attrs	= rv3028_attrs,
 };
 
+static int rv3028_exit_eerd(struct rv3028_data *rv3028, u32 eerd)
+{
+	if (eerd)
+		return 0;
+
+	return regmap_update_bits(rv3028->regmap, RV3028_CTRL1, RV3028_CTRL1_EERD, 0);
+}
+
+static int rv3028_enter_eerd(struct rv3028_data *rv3028, u32 *eerd)
+{
+	u32 ctrl1, status;
+	int ret;
+
+	ret = regmap_read(rv3028->regmap, RV3028_CTRL1, &ctrl1);
+	if (ret)
+		return ret;
+
+	*eerd = ctrl1 & RV3028_CTRL1_EERD;
+	if (*eerd)
+		return 0;
+
+	ret = regmap_update_bits(rv3028->regmap, RV3028_CTRL1,
+				 RV3028_CTRL1_EERD, RV3028_CTRL1_EERD);
+	if (ret)
+		return ret;
+
+	ret = regmap_read_poll_timeout(rv3028->regmap, RV3028_STATUS, status,
+				       !(status & RV3028_STATUS_EEBUSY),
+				       RV3028_EEBUSY_POLL, RV3028_EEBUSY_TIMEOUT);
+	if (ret) {
+		rv3028_exit_eerd(rv3028, *eerd);
+
+		return ret;
+	}
+
+	return 0;
+}
+
 static irqreturn_t rv3028_handle_irq(int irq, void *dev_id)
 {
 	struct rv3028_data *rv3028 = dev_id;
@@ -451,49 +489,36 @@ static int rv3028_nvram_read(void *priv, unsigned int offset, void *val,
 static int rv3028_eeprom_write(void *priv, unsigned int offset, void *val,
 			       size_t bytes)
 {
-	u32 status, ctrl1;
-	int i, ret, err;
+	struct rv3028_data *rv3028 = priv;
+	u32 status, eerd;
+	int i, ret;
 	u8 *buf = val;
 
-	ret = regmap_read(priv, RV3028_CTRL1, &ctrl1);
+	ret = rv3028_enter_eerd(rv3028, &eerd);
 	if (ret)
 		return ret;
 
-	if (!(ctrl1 & RV3028_CTRL1_EERD)) {
-		ret = regmap_update_bits(priv, RV3028_CTRL1,
-					 RV3028_CTRL1_EERD, RV3028_CTRL1_EERD);
-		if (ret)
-			return ret;
-
-		ret = regmap_read_poll_timeout(priv, RV3028_STATUS, status,
-					       !(status & RV3028_STATUS_EEBUSY),
-					       RV3028_EEBUSY_POLL,
-					       RV3028_EEBUSY_TIMEOUT);
-		if (ret)
-			goto restore_eerd;
-	}
-
 	for (i = 0; i < bytes; i++) {
-		ret = regmap_write(priv, RV3028_EEPROM_ADDR, offset + i);
+		ret = regmap_write(rv3028->regmap, RV3028_EEPROM_ADDR, offset + i);
 		if (ret)
 			goto restore_eerd;
 
-		ret = regmap_write(priv, RV3028_EEPROM_DATA, buf[i]);
+		ret = regmap_write(rv3028->regmap, RV3028_EEPROM_DATA, buf[i]);
 		if (ret)
 			goto restore_eerd;
 
-		ret = regmap_write(priv, RV3028_EEPROM_CMD, 0x0);
+		ret = regmap_write(rv3028->regmap, RV3028_EEPROM_CMD, 0x0);
 		if (ret)
 			goto restore_eerd;
 
-		ret = regmap_write(priv, RV3028_EEPROM_CMD,
+		ret = regmap_write(rv3028->regmap, RV3028_EEPROM_CMD,
 				   RV3028_EEPROM_CMD_WRITE);
 		if (ret)
 			goto restore_eerd;
 
 		usleep_range(RV3028_EEBUSY_POLL, RV3028_EEBUSY_TIMEOUT);
 
-		ret = regmap_read_poll_timeout(priv, RV3028_STATUS, status,
+		ret = regmap_read_poll_timeout(rv3028->regmap, RV3028_STATUS, status,
 					       !(status & RV3028_STATUS_EEBUSY),
 					       RV3028_EEBUSY_POLL,
 					       RV3028_EEBUSY_TIMEOUT);
@@ -502,13 +527,7 @@ static int rv3028_eeprom_write(void *priv, unsigned int offset, void *val,
 	}
 
 restore_eerd:
-	if (!(ctrl1 & RV3028_CTRL1_EERD))
-	{
-		err = regmap_update_bits(priv, RV3028_CTRL1, RV3028_CTRL1_EERD,
-					 0);
-		if (err && !ret)
-			ret = err;
-	}
+	rv3028_exit_eerd(rv3028, eerd);
 
 	return ret;
 }
@@ -516,63 +535,44 @@ static int rv3028_eeprom_write(void *priv, unsigned int offset, void *val,
 static int rv3028_eeprom_read(void *priv, unsigned int offset, void *val,
 			      size_t bytes)
 {
-	u32 status, ctrl1, data;
-	int i, ret, err;
+	struct rv3028_data *rv3028 = priv;
+	u32 status, eerd, data;
+	int i, ret;
 	u8 *buf = val;
 
-	ret = regmap_read(priv, RV3028_CTRL1, &ctrl1);
+	ret = rv3028_enter_eerd(rv3028, &eerd);
 	if (ret)
 		return ret;
 
-	if (!(ctrl1 & RV3028_CTRL1_EERD)) {
-		ret = regmap_update_bits(priv, RV3028_CTRL1,
-					 RV3028_CTRL1_EERD, RV3028_CTRL1_EERD);
-		if (ret)
-			return ret;
-
-		ret = regmap_read_poll_timeout(priv, RV3028_STATUS, status,
-					       !(status & RV3028_STATUS_EEBUSY),
-					       RV3028_EEBUSY_POLL,
-					       RV3028_EEBUSY_TIMEOUT);
-		if (ret)
-			goto restore_eerd;
-	}
-
 	for (i = 0; i < bytes; i++) {
-		ret = regmap_write(priv, RV3028_EEPROM_ADDR, offset + i);
+		ret = regmap_write(rv3028->regmap, RV3028_EEPROM_ADDR, offset + i);
 		if (ret)
 			goto restore_eerd;
 
-		ret = regmap_write(priv, RV3028_EEPROM_CMD, 0x0);
+		ret = regmap_write(rv3028->regmap, RV3028_EEPROM_CMD, 0x0);
 		if (ret)
 			goto restore_eerd;
 
-		ret = regmap_write(priv, RV3028_EEPROM_CMD,
+		ret = regmap_write(rv3028->regmap, RV3028_EEPROM_CMD,
 				   RV3028_EEPROM_CMD_READ);
 		if (ret)
 			goto restore_eerd;
 
-		ret = regmap_read_poll_timeout(priv, RV3028_STATUS, status,
+		ret = regmap_read_poll_timeout(rv3028->regmap, RV3028_STATUS, status,
 					       !(status & RV3028_STATUS_EEBUSY),
 					       RV3028_EEBUSY_POLL,
 					       RV3028_EEBUSY_TIMEOUT);
 		if (ret)
 			goto restore_eerd;
 
-		ret = regmap_read(priv, RV3028_EEPROM_DATA, &data);
+		ret = regmap_read(rv3028->regmap, RV3028_EEPROM_DATA, &data);
 		if (ret)
 			goto restore_eerd;
 		buf[i] = data;
 	}
 
 restore_eerd:
-	if (!(ctrl1 & RV3028_CTRL1_EERD))
-	{
-		err = regmap_update_bits(priv, RV3028_CTRL1, RV3028_CTRL1_EERD,
-					 0);
-		if (err && !ret)
-			ret = err;
-	}
+	rv3028_exit_eerd(rv3028, eerd);
 
 	return ret;
 }
@@ -834,7 +834,7 @@ static int rv3028_probe(struct i2c_client *client)
 
 	nvmem_cfg.priv = rv3028->regmap;
 	rtc_nvmem_register(rv3028->rtc, &nvmem_cfg);
-	eeprom_cfg.priv = rv3028->regmap;
+	eeprom_cfg.priv = rv3028;
 	rtc_nvmem_register(rv3028->rtc, &eeprom_cfg);
 
 	rv3028->rtc->max_user_freq = 1;
-- 
2.26.2

