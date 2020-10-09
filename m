Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A502288CBE
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Oct 2020 17:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389381AbgJIPbQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Oct 2020 11:31:16 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:59527 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389358AbgJIPbM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Oct 2020 11:31:12 -0400
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id C385E200005;
        Fri,  9 Oct 2020 15:31:09 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] rtc: rv3028: ensure ram configuration registers are saved
Date:   Fri,  9 Oct 2020 17:31:01 +0200
Message-Id: <20201009153101.721149-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201009153101.721149-1-alexandre.belloni@bootlin.com>
References: <20201009153101.721149-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

If RV3028_CTRL1_EERD is not set (this is the default), the RTC will refresh
the RAM configuration registers from the EEPROM at midnight. It is
necessary to save the RAM registers back to EEPROM after modifying them.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3028.c | 76 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 67 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 7b8823f43626..fa226f0fe67d 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -71,6 +71,7 @@
 
 #define RV3028_EVT_CTRL_TSR		BIT(2)
 
+#define RV3028_EEPROM_CMD_UPDATE	0x11
 #define RV3028_EEPROM_CMD_WRITE		0x21
 #define RV3028_EEPROM_CMD_READ		0x22
 
@@ -209,6 +210,50 @@ static int rv3028_enter_eerd(struct rv3028_data *rv3028, u32 *eerd)
 	return 0;
 }
 
+static int rv3028_update_eeprom(struct rv3028_data *rv3028, u32 eerd)
+{
+	u32 status;
+	int ret;
+
+	ret = regmap_write(rv3028->regmap, RV3028_EEPROM_CMD, 0x0);
+	if (ret)
+		goto exit_eerd;
+
+	ret = regmap_write(rv3028->regmap, RV3028_EEPROM_CMD, RV3028_EEPROM_CMD_UPDATE);
+	if (ret)
+		goto exit_eerd;
+
+	usleep_range(63000, RV3028_EEBUSY_TIMEOUT);
+
+	ret = regmap_read_poll_timeout(rv3028->regmap, RV3028_STATUS, status,
+				       !(status & RV3028_STATUS_EEBUSY),
+				       RV3028_EEBUSY_POLL, RV3028_EEBUSY_TIMEOUT);
+
+exit_eerd:
+	rv3028_exit_eerd(rv3028, eerd);
+
+	return ret;
+}
+
+static int rv3028_update_cfg(struct rv3028_data *rv3028, unsigned int reg,
+			     unsigned int mask, unsigned int val)
+{
+	u32 eerd;
+	int ret;
+
+	ret = rv3028_enter_eerd(rv3028, &eerd);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(rv3028->regmap, reg, mask, val);
+	if (ret) {
+		rv3028_exit_eerd(rv3028, eerd);
+		return ret;
+	}
+
+	return rv3028_update_eeprom(rv3028, eerd);
+}
+
 static irqreturn_t rv3028_handle_irq(int irq, void *dev_id)
 {
 	struct rv3028_data *rv3028 = dev_id;
@@ -442,17 +487,32 @@ static int rv3028_read_offset(struct device *dev, long *offset)
 static int rv3028_set_offset(struct device *dev, long offset)
 {
 	struct rv3028_data *rv3028 = dev_get_drvdata(dev);
+	u32 eerd;
 	int ret;
 
 	offset = clamp(offset, -244141L, 243187L) * 1000;
 	offset = DIV_ROUND_CLOSEST(offset, OFFSET_STEP_PPT);
 
+	ret = rv3028_enter_eerd(rv3028, &eerd);
+	if (ret)
+		return ret;
+
 	ret = regmap_write(rv3028->regmap, RV3028_OFFSET, offset >> 1);
 	if (ret < 0)
-		return ret;
+		goto exit_eerd;
+
+	ret = regmap_update_bits(rv3028->regmap, RV3028_BACKUP, BIT(7),
+				 offset << 7);
+	if (ret < 0)
+		goto exit_eerd;
+
+	return rv3028_update_eeprom(rv3028, eerd);
+
+exit_eerd:
+	rv3028_exit_eerd(rv3028, eerd);
+
+	return ret;
 
-	return regmap_update_bits(rv3028->regmap, RV3028_BACKUP, BIT(7),
-				  offset << 7);
 }
 
 static int rv3028_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
@@ -634,8 +694,8 @@ static int rv3028_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
 		if (clkout_rates[i] == rate)
-			return regmap_write(rv3028->regmap, RV3028_CLKOUT,
-					    RV3028_CLKOUT_CLKSY | enabled | i);
+			return rv3028_update_cfg(rv3028, RV3028_CLKOUT, 0xff,
+						 RV3028_CLKOUT_CLKSY | enabled | i);
 
 	return -EINVAL;
 }
@@ -810,10 +870,8 @@ static int rv3028_probe(struct i2c_client *client)
 				break;
 
 		if (i < ARRAY_SIZE(rv3028_trickle_resistors)) {
-			ret = regmap_update_bits(rv3028->regmap, RV3028_BACKUP,
-						 RV3028_BACKUP_TCE |
-						 RV3028_BACKUP_TCR_MASK,
-						 RV3028_BACKUP_TCE | i);
+			ret = rv3028_update_cfg(rv3028, RV3028_BACKUP, RV3028_BACKUP_TCE |
+						 RV3028_BACKUP_TCR_MASK, RV3028_BACKUP_TCE | i);
 			if (ret)
 				return ret;
 		} else {
-- 
2.26.2

