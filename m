Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8D811F4B2
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbfLNWK4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:10:56 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:43897 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbfLNWKc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:10:32 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D245D40009;
        Sat, 14 Dec 2019 22:10:29 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 09/16] rtc: rv3029: drop rv3029_read_regs and rv3029_write_regs
Date:   Sat, 14 Dec 2019 23:10:15 +0100
Message-Id: <20191214221022.622482-10-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
References: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

rv3029_read_regs and rv3029_write_regs are simply calling
regmap_bulk_{read,write}. Drop them and call regmap_{,bulk}_{read,write} as
appropriate.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3029c2.c | 104 ++++++++++++++++---------------------
 1 file changed, 46 insertions(+), 58 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index d41be87be4c5..f327a7713e04 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -121,22 +121,6 @@ struct rv3029_data {
 	int irq;
 };
 
-static int rv3029_read_regs(struct device *dev, u8 reg, u8 *buf,
-			    unsigned int len)
-{
-	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
-
-	return regmap_bulk_read(rv3029->regmap, reg, buf, len);
-}
-
-static int rv3029_write_regs(struct device *dev, u8 reg, u8 const buf[],
-			     unsigned int len)
-{
-	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
-
-	return regmap_bulk_write(rv3029->regmap, reg, buf, len);
-}
-
 static int rv3029_eeprom_busywait(struct rv3029_data *rv3029)
 {
 	unsigned int sr;
@@ -158,19 +142,16 @@ static int rv3029_eeprom_busywait(struct rv3029_data *rv3029)
 	return ret;
 }
 
-static int rv3029_eeprom_exit(struct device *dev)
+static int rv3029_eeprom_exit(struct rv3029_data *rv3029)
 {
-	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
-
 	/* Re-enable eeprom refresh */
 	return regmap_update_bits(rv3029->regmap, RV3029_ONOFF_CTRL,
 				  RV3029_ONOFF_CTRL_EERE,
 				  RV3029_ONOFF_CTRL_EERE);
 }
 
-static int rv3029_eeprom_enter(struct device *dev)
+static int rv3029_eeprom_enter(struct rv3029_data *rv3029)
 {
-	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
 	unsigned int sr;
 	int ret;
 
@@ -192,7 +173,7 @@ static int rv3029_eeprom_enter(struct device *dev)
 		if (ret < 0)
 			return ret;
 		if (sr & (RV3029_STATUS_VLOW1 | RV3029_STATUS_VLOW2)) {
-			dev_err(dev,
+			dev_err(rv3029->dev,
 				"Supply voltage is too low to safely access the EEPROM.\n");
 			return -ENODEV;
 		}
@@ -207,47 +188,47 @@ static int rv3029_eeprom_enter(struct device *dev)
 	/* Wait for any previous eeprom accesses to finish. */
 	ret = rv3029_eeprom_busywait(rv3029);
 	if (ret < 0)
-		rv3029_eeprom_exit(dev);
+		rv3029_eeprom_exit(rv3029);
 
 	return ret;
 }
 
-static int rv3029_eeprom_read(struct device *dev, u8 reg,
+static int rv3029_eeprom_read(struct rv3029_data *rv3029, u8 reg,
 			      u8 buf[], size_t len)
 {
 	int ret, err;
 
-	err = rv3029_eeprom_enter(dev);
+	err = rv3029_eeprom_enter(rv3029);
 	if (err < 0)
 		return err;
 
-	ret = rv3029_read_regs(dev, reg, buf, len);
+	ret = regmap_bulk_read(rv3029->regmap, reg, buf, len);
 
-	err = rv3029_eeprom_exit(dev);
+	err = rv3029_eeprom_exit(rv3029);
 	if (err < 0)
 		return err;
 
 	return ret;
 }
 
-static int rv3029_eeprom_write(struct device *dev, u8 reg,
+static int rv3029_eeprom_write(struct rv3029_data *rv3029, u8 reg,
 			       u8 const buf[], size_t len)
 {
-	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
+	unsigned int tmp;
 	int ret, err;
 	size_t i;
-	u8 tmp;
 
-	err = rv3029_eeprom_enter(dev);
+	err = rv3029_eeprom_enter(rv3029);
 	if (err < 0)
 		return err;
 
 	for (i = 0; i < len; i++, reg++) {
-		ret = rv3029_read_regs(dev, reg, &tmp, 1);
+		ret = regmap_read(rv3029->regmap, reg, &tmp);
 		if (ret < 0)
 			break;
 		if (tmp != buf[i]) {
-			ret = rv3029_write_regs(dev, reg, &buf[i], 1);
+			tmp = buf[i];
+			ret = regmap_write(rv3029->regmap, reg, tmp);
 			if (ret < 0)
 				break;
 		}
@@ -256,25 +237,25 @@ static int rv3029_eeprom_write(struct device *dev, u8 reg,
 			break;
 	}
 
-	err = rv3029_eeprom_exit(dev);
+	err = rv3029_eeprom_exit(rv3029);
 	if (err < 0)
 		return err;
 
 	return ret;
 }
 
-static int rv3029_eeprom_update_bits(struct device *dev,
+static int rv3029_eeprom_update_bits(struct rv3029_data *rv3029,
 				     u8 reg, u8 mask, u8 set)
 {
 	u8 buf;
 	int ret;
 
-	ret = rv3029_eeprom_read(dev, reg, &buf, 1);
+	ret = rv3029_eeprom_read(rv3029, reg, &buf, 1);
 	if (ret < 0)
 		return ret;
 	buf &= ~mask;
 	buf |= set & mask;
-	ret = rv3029_eeprom_write(dev, reg, &buf, 1);
+	ret = rv3029_eeprom_write(rv3029, reg, &buf, 1);
 	if (ret < 0)
 		return ret;
 
@@ -286,20 +267,20 @@ static irqreturn_t rv3029_handle_irq(int irq, void *dev_id)
 	struct device *dev = dev_id;
 	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
 	struct mutex *lock = &rv3029->rtc->ops_lock;
+	unsigned int flags, controls;
 	unsigned long events = 0;
-	u8 flags, controls;
 	int ret;
 
 	mutex_lock(lock);
 
-	ret = rv3029_read_regs(dev, RV3029_IRQ_CTRL, &controls, 1);
+	ret = regmap_read(rv3029->regmap, RV3029_IRQ_CTRL, &controls);
 	if (ret) {
 		dev_warn(dev, "Read IRQ Control Register error %d\n", ret);
 		mutex_unlock(lock);
 		return IRQ_NONE;
 	}
 
-	ret = rv3029_read_regs(dev, RV3029_IRQ_FLAGS, &flags, 1);
+	ret = regmap_read(rv3029->regmap, RV3029_IRQ_FLAGS, &flags);
 	if (ret) {
 		dev_warn(dev, "Read IRQ Flags Register error %d\n", ret);
 		mutex_unlock(lock);
@@ -314,8 +295,8 @@ static irqreturn_t rv3029_handle_irq(int irq, void *dev_id)
 
 	if (events) {
 		rtc_update_irq(rv3029->rtc, 1, events);
-		rv3029_write_regs(dev, RV3029_IRQ_FLAGS, &flags, 1);
-		rv3029_write_regs(dev, RV3029_IRQ_CTRL, &controls, 1);
+		regmap_write(rv3029->regmap, RV3029_IRQ_FLAGS, flags);
+		regmap_write(rv3029->regmap, RV3029_IRQ_CTRL, controls);
 	}
 	mutex_unlock(lock);
 
@@ -324,10 +305,11 @@ static irqreturn_t rv3029_handle_irq(int irq, void *dev_id)
 
 static int rv3029_read_time(struct device *dev, struct rtc_time *tm)
 {
+	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
 	int ret;
 	u8 regs[RV3029_WATCH_SECTION_LEN] = { 0, };
 
-	ret = rv3029_read_regs(dev, RV3029_W_SEC, regs,
+	ret = regmap_bulk_read(rv3029->regmap, RV3029_W_SEC, regs,
 			       RV3029_WATCH_SECTION_LEN);
 	if (ret < 0) {
 		dev_err(dev, "%s: reading RTC section failed\n", __func__);
@@ -360,24 +342,25 @@ static int rv3029_read_time(struct device *dev, struct rtc_time *tm)
 
 static int rv3029_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
+	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
 	struct rtc_time *const tm = &alarm->time;
+	unsigned int controls, flags;
 	int ret;
-	u8 regs[8], controls, flags;
+	u8 regs[8];
 
-	ret = rv3029_read_regs(dev, RV3029_A_SC, regs,
+	ret = regmap_bulk_read(rv3029->regmap, RV3029_A_SC, regs,
 			       RV3029_ALARM_SECTION_LEN);
-
 	if (ret < 0) {
 		dev_err(dev, "%s: reading alarm section failed\n", __func__);
 		return ret;
 	}
 
-	ret = rv3029_read_regs(dev, RV3029_IRQ_CTRL, &controls, 1);
+	ret = regmap_read(rv3029->regmap, RV3029_IRQ_CTRL, &controls);
 	if (ret) {
 		dev_err(dev, "Read IRQ Control Register error %d\n", ret);
 		return ret;
 	}
-	ret = rv3029_read_regs(dev, RV3029_IRQ_FLAGS, &flags, 1);
+	ret = regmap_read(rv3029->regmap, RV3029_IRQ_FLAGS, &flags);
 	if (ret < 0) {
 		dev_err(dev, "Read IRQ Flags Register error %d\n", ret);
 		return ret;
@@ -408,6 +391,7 @@ static int rv3029_alarm_irq_enable(struct device *dev, unsigned int enable)
 
 static int rv3029_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
+	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
 	struct rtc_time *const tm = &alarm->time;
 	int ret;
 	u8 regs[8];
@@ -435,7 +419,7 @@ static int rv3029_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 		| RV3029_A_AE_X;
 
 	/* Write the alarm */
-	ret = rv3029_write_regs(dev, RV3029_A_SC, regs,
+	ret = regmap_bulk_write(rv3029->regmap, RV3029_A_SC, regs,
 				RV3029_ALARM_SECTION_LEN);
 	if (ret < 0)
 		return ret;
@@ -465,7 +449,7 @@ static int rv3029_set_time(struct device *dev, struct rtc_time *tm)
 	regs[RV3029_W_DAYS - RV3029_W_SEC] = bin2bcd(tm->tm_wday + 1) & 0x7;
 	regs[RV3029_W_YEARS - RV3029_W_SEC] = bin2bcd(tm->tm_year - 100);
 
-	ret = rv3029_write_regs(dev, RV3029_W_SEC, regs,
+	ret = regmap_bulk_write(rv3029->regmap, RV3029_W_SEC, regs,
 				RV3029_WATCH_SECTION_LEN);
 	if (ret < 0)
 		return ret;
@@ -534,6 +518,7 @@ static const struct rv3029_trickle_tab_elem {
 
 static void rv3029_trickle_config(struct device *dev)
 {
+	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
 	struct device_node *of_node = dev->of_node;
 	const struct rv3029_trickle_tab_elem *elem;
 	int i, err;
@@ -560,7 +545,7 @@ static void rv3029_trickle_config(struct device *dev)
 			 "Trickle charger enabled at %d ohms resistance.\n",
 			 elem->r);
 	}
-	err = rv3029_eeprom_update_bits(dev, RV3029_CONTROL_E2P_EECTRL,
+	err = rv3029_eeprom_update_bits(rv3029, RV3029_CONTROL_E2P_EECTRL,
 					RV3029_TRICKLE_MASK,
 					trickle_set_bits);
 	if (err < 0)
@@ -569,12 +554,12 @@ static void rv3029_trickle_config(struct device *dev)
 
 #ifdef CONFIG_RTC_DRV_RV3029_HWMON
 
-static int rv3029_read_temp(struct device *dev, int *temp_mC)
+static int rv3029_read_temp(struct rv3029_data *rv3029, int *temp_mC)
 {
+	unsigned int temp;
 	int ret;
-	u8 temp;
 
-	ret = rv3029_read_regs(dev, RV3029_TEMP_PAGE, &temp, 1);
+	ret = regmap_read(rv3029->regmap, RV3029_TEMP_PAGE, &temp);
 	if (ret < 0)
 		return ret;
 
@@ -587,9 +572,10 @@ static ssize_t rv3029_hwmon_show_temp(struct device *dev,
 				      struct device_attribute *attr,
 				      char *buf)
 {
+	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
 	int ret, temp_mC;
 
-	ret = rv3029_read_temp(dev, &temp_mC);
+	ret = rv3029_read_temp(rv3029, &temp_mC);
 	if (ret < 0)
 		return ret;
 
@@ -601,9 +587,10 @@ static ssize_t rv3029_hwmon_set_update_interval(struct device *dev,
 						const char *buf,
 						size_t count)
 {
+	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
+	unsigned int th_set_bits = 0;
 	unsigned long interval_ms;
 	int ret;
-	u8 th_set_bits = 0;
 
 	ret = kstrtoul(buf, 10, &interval_ms);
 	if (ret < 0)
@@ -614,7 +601,7 @@ static ssize_t rv3029_hwmon_set_update_interval(struct device *dev,
 		if (interval_ms >= 16000)
 			th_set_bits |= RV3029_EECTRL_THP;
 	}
-	ret = rv3029_eeprom_update_bits(dev, RV3029_CONTROL_E2P_EECTRL,
+	ret = rv3029_eeprom_update_bits(rv3029, RV3029_CONTROL_E2P_EECTRL,
 					RV3029_EECTRL_THE | RV3029_EECTRL_THP,
 					th_set_bits);
 	if (ret < 0)
@@ -627,10 +614,11 @@ static ssize_t rv3029_hwmon_show_update_interval(struct device *dev,
 						 struct device_attribute *attr,
 						 char *buf)
 {
+	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
 	int ret, interval_ms;
 	u8 eectrl;
 
-	ret = rv3029_eeprom_read(dev, RV3029_CONTROL_E2P_EECTRL,
+	ret = rv3029_eeprom_read(rv3029, RV3029_CONTROL_E2P_EECTRL,
 				 &eectrl, 1);
 	if (ret < 0)
 		return ret;
-- 
2.23.0

