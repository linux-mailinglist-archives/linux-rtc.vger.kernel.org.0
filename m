Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A986432307
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Oct 2021 17:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbhJRPjM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Oct 2021 11:39:12 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:49389 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbhJRPjL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Oct 2021 11:39:11 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 621C9C0005;
        Mon, 18 Oct 2021 15:36:54 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] rtc: pcf8523: switch to regmap
Date:   Mon, 18 Oct 2021 17:36:46 +0200
Message-Id: <20211018153651.82069-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use regmap to access the RTC registers, this is a huge reduction in code
lines and generated code. Values on ARMv7:

   text	   data	    bss	    dec	    hex
   5180	    132	      0	   5312	   14c0	before
   3900	    132	      0	   4032	    fc0	after

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/Kconfig       |   1 +
 drivers/rtc/rtc-pcf8523.c | 303 +++++++++++---------------------------
 2 files changed, 85 insertions(+), 219 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 59dc1410a160..8dc92b4e042f 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -441,6 +441,7 @@ config RTC_DRV_X1205
 
 config RTC_DRV_PCF8523
 	tristate "NXP PCF8523"
+	select REGMAP_I2C
 	help
 	  If you say yes here you get support for the NXP PCF8523 RTC
 	  chips.
diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index 09110b3ae25f..c5d31c525997 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -6,6 +6,7 @@
 #include <linux/bcd.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
 #include <linux/rtc.h>
 #include <linux/of.h>
 #include <linux/pm_wakeirq.h>
@@ -49,115 +50,45 @@
 
 struct pcf8523 {
 	struct rtc_device *rtc;
-	struct i2c_client *client;
+	struct regmap *regmap;
 };
 
-static int pcf8523_read(struct i2c_client *client, u8 reg, u8 *valuep)
+static int pcf8523_load_capacitance(struct pcf8523 *pcf8523, struct device_node *node)
 {
-	struct i2c_msg msgs[2];
-	u8 value = 0;
-	int err;
-
-	msgs[0].addr = client->addr;
-	msgs[0].flags = 0;
-	msgs[0].len = sizeof(reg);
-	msgs[0].buf = &reg;
-
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = sizeof(value);
-	msgs[1].buf = &value;
-
-	err = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
-	if (err < 0)
-		return err;
-
-	*valuep = value;
-
-	return 0;
-}
-
-static int pcf8523_write(struct i2c_client *client, u8 reg, u8 value)
-{
-	u8 buffer[2] = { reg, value };
-	struct i2c_msg msg;
-	int err;
-
-	msg.addr = client->addr;
-	msg.flags = 0;
-	msg.len = sizeof(buffer);
-	msg.buf = buffer;
-
-	err = i2c_transfer(client->adapter, &msg, 1);
-	if (err < 0)
-		return err;
-
-	return 0;
-}
-
-static int pcf8523_load_capacitance(struct i2c_client *client)
-{
-	u32 load;
-	u8 value;
-	int err;
-
-	err = pcf8523_read(client, PCF8523_REG_CONTROL1, &value);
-	if (err < 0)
-		return err;
+	u32 load, value = 0;
 
 	load = 12500;
-	of_property_read_u32(client->dev.of_node, "quartz-load-femtofarads",
-			     &load);
+	of_property_read_u32(node, "quartz-load-femtofarads", &load);
 
 	switch (load) {
 	default:
-		dev_warn(&client->dev, "Unknown quartz-load-femtofarads value: %d. Assuming 12500",
+		dev_warn(&pcf8523->rtc->dev, "Unknown quartz-load-femtofarads value: %d. Assuming 12500",
 			 load);
 		fallthrough;
 	case 12500:
 		value |= PCF8523_CONTROL1_CAP_SEL;
 		break;
 	case 7000:
-		value &= ~PCF8523_CONTROL1_CAP_SEL;
 		break;
 	}
 
-	err = pcf8523_write(client, PCF8523_REG_CONTROL1, value);
-
-	return err;
-}
-
-static int pcf8523_set_pm(struct i2c_client *client, u8 pm)
-{
-	u8 value;
-	int err;
-
-	err = pcf8523_read(client, PCF8523_REG_CONTROL3, &value);
-	if (err < 0)
-		return err;
-
-	value = (value & ~PCF8523_CONTROL3_PM_MASK) | pm;
-
-	err = pcf8523_write(client, PCF8523_REG_CONTROL3, value);
-	if (err < 0)
-		return err;
-
-	return 0;
+	return regmap_update_bits(pcf8523->regmap, PCF8523_REG_CONTROL1,
+				  PCF8523_CONTROL1_CAP_SEL, value);
 }
 
 static irqreturn_t pcf8523_irq(int irq, void *dev_id)
 {
-	struct pcf8523 *pcf8523 = i2c_get_clientdata(dev_id);
-	u8 value;
+	struct pcf8523 *pcf8523 = dev_id;
+	u32 value;
 	int err;
 
-	err = pcf8523_read(pcf8523->client, PCF8523_REG_CONTROL2, &value);
+	err = regmap_read(pcf8523->regmap, PCF8523_REG_CONTROL2, &value);
 	if (err < 0)
 		return IRQ_HANDLED;
 
 	if (value & PCF8523_CONTROL2_AF) {
 		value &= ~PCF8523_CONTROL2_AF;
-		pcf8523_write(pcf8523->client, PCF8523_REG_CONTROL2, value);
+		regmap_write(pcf8523->regmap, PCF8523_REG_CONTROL2, value);
 		rtc_update_irq(pcf8523->rtc, 1, RTC_IRQF | RTC_AF);
 
 		return IRQ_HANDLED;
@@ -166,60 +97,14 @@ static irqreturn_t pcf8523_irq(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-static int pcf8523_stop_rtc(struct i2c_client *client)
-{
-	u8 value;
-	int err;
-
-	err = pcf8523_read(client, PCF8523_REG_CONTROL1, &value);
-	if (err < 0)
-		return err;
-
-	value |= PCF8523_CONTROL1_STOP;
-
-	err = pcf8523_write(client, PCF8523_REG_CONTROL1, value);
-	if (err < 0)
-		return err;
-
-	return 0;
-}
-
-static int pcf8523_start_rtc(struct i2c_client *client)
-{
-	u8 value;
-	int err;
-
-	err = pcf8523_read(client, PCF8523_REG_CONTROL1, &value);
-	if (err < 0)
-		return err;
-
-	value &= ~PCF8523_CONTROL1_STOP;
-
-	err = pcf8523_write(client, PCF8523_REG_CONTROL1, value);
-	if (err < 0)
-		return err;
-
-	return 0;
-}
-
 static int pcf8523_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	u8 start = PCF8523_REG_SECONDS, regs[7];
-	struct i2c_msg msgs[2];
+	struct pcf8523 *pcf8523 = dev_get_drvdata(dev);
+	u8 regs[7];
 	int err;
 
-	msgs[0].addr = client->addr;
-	msgs[0].flags = 0;
-	msgs[0].len = 1;
-	msgs[0].buf = &start;
-
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = sizeof(regs);
-	msgs[1].buf = regs;
-
-	err = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	err = regmap_bulk_read(pcf8523->regmap, PCF8523_REG_SECONDS, regs,
+			       sizeof(regs));
 	if (err < 0)
 		return err;
 
@@ -239,63 +124,50 @@ static int pcf8523_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 static int pcf8523_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct i2c_msg msg;
-	u8 regs[8];
+	struct pcf8523 *pcf8523 = dev_get_drvdata(dev);
+	u8 regs[7];
 	int err;
 
-	err = pcf8523_stop_rtc(client);
+	err = regmap_update_bits(pcf8523->regmap, PCF8523_REG_CONTROL1,
+				 PCF8523_CONTROL1_STOP, PCF8523_CONTROL1_STOP);
 	if (err < 0)
 		return err;
 
-	regs[0] = PCF8523_REG_SECONDS;
 	/* This will purposely overwrite PCF8523_SECONDS_OS */
-	regs[1] = bin2bcd(tm->tm_sec);
-	regs[2] = bin2bcd(tm->tm_min);
-	regs[3] = bin2bcd(tm->tm_hour);
-	regs[4] = bin2bcd(tm->tm_mday);
-	regs[5] = tm->tm_wday;
-	regs[6] = bin2bcd(tm->tm_mon + 1);
-	regs[7] = bin2bcd(tm->tm_year - 100);
-
-	msg.addr = client->addr;
-	msg.flags = 0;
-	msg.len = sizeof(regs);
-	msg.buf = regs;
-
-	err = i2c_transfer(client->adapter, &msg, 1);
+	regs[0] = bin2bcd(tm->tm_sec);
+	regs[1] = bin2bcd(tm->tm_min);
+	regs[2] = bin2bcd(tm->tm_hour);
+	regs[3] = bin2bcd(tm->tm_mday);
+	regs[4] = tm->tm_wday;
+	regs[5] = bin2bcd(tm->tm_mon + 1);
+	regs[6] = bin2bcd(tm->tm_year - 100);
+
+	err = regmap_bulk_write(pcf8523->regmap, PCF8523_REG_SECONDS, regs,
+				sizeof(regs));
 	if (err < 0) {
 		/*
 		 * If the time cannot be set, restart the RTC anyway. Note
 		 * that errors are ignored if the RTC cannot be started so
 		 * that we have a chance to propagate the original error.
 		 */
-		pcf8523_start_rtc(client);
+		regmap_update_bits(pcf8523->regmap, PCF8523_REG_CONTROL1,
+				   PCF8523_CONTROL1_STOP, 0);
 		return err;
 	}
 
-	return pcf8523_start_rtc(client);
+	return regmap_update_bits(pcf8523->regmap, PCF8523_REG_CONTROL1,
+				 PCF8523_CONTROL1_STOP, 0);
 }
 
 static int pcf8523_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	u8 start = PCF8523_REG_MINUTE_ALARM, regs[4];
-	struct i2c_msg msgs[2];
-	u8 value;
+	struct pcf8523 *pcf8523 = dev_get_drvdata(dev);
+	u8 regs[4];
+	u32 value;
 	int err;
 
-	msgs[0].addr = client->addr;
-	msgs[0].flags = 0;
-	msgs[0].len = 1;
-	msgs[0].buf = &start;
-
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = sizeof(regs);
-	msgs[1].buf = regs;
-
-	err = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	err = regmap_bulk_read(pcf8523->regmap, PCF8523_REG_MINUTE_ALARM, regs,
+			       sizeof(regs));
 	if (err < 0)
 		return err;
 
@@ -305,12 +177,12 @@ static int pcf8523_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
 	tm->time.tm_mday = bcd2bin(regs[2] & 0x3F);
 	tm->time.tm_wday = bcd2bin(regs[3] & 0x7);
 
-	err = pcf8523_read(client, PCF8523_REG_CONTROL1, &value);
+	err = regmap_read(pcf8523->regmap, PCF8523_REG_CONTROL1, &value);
 	if (err < 0)
 		return err;
 	tm->enabled = !!(value & PCF8523_CONTROL1_AIE);
 
-	err = pcf8523_read(client, PCF8523_REG_CONTROL2, &value);
+	err = regmap_read(pcf8523->regmap, PCF8523_REG_CONTROL2, &value);
 	if (err < 0)
 		return err;
 	tm->pending = !!(value & PCF8523_CONTROL2_AF);
@@ -320,30 +192,16 @@ static int pcf8523_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
 
 static int pcf8523_irq_enable(struct device *dev, unsigned int enabled)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	u8 value;
-	int err;
+	struct pcf8523 *pcf8523 = dev_get_drvdata(dev);
 
-	err = pcf8523_read(client, PCF8523_REG_CONTROL1, &value);
-	if (err < 0)
-		return err;
-
-	value &= PCF8523_CONTROL1_AIE;
-
-	if (enabled)
-		value |= PCF8523_CONTROL1_AIE;
-
-	err = pcf8523_write(client, PCF8523_REG_CONTROL1, value);
-	if (err < 0)
-		return err;
-
-	return 0;
+	return regmap_update_bits(pcf8523->regmap, PCF8523_REG_CONTROL1,
+				  PCF8523_CONTROL1_AIE, enabled ?
+				  PCF8523_CONTROL1_AIE : 0);
 }
 
 static int pcf8523_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct i2c_msg msg;
+	struct pcf8523 *pcf8523 = dev_get_drvdata(dev);
 	u8 regs[5];
 	int err;
 
@@ -351,7 +209,7 @@ static int pcf8523_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
 	if (err)
 		return err;
 
-	err = pcf8523_write(client, PCF8523_REG_CONTROL2, 0);
+	err = regmap_write(pcf8523->regmap, PCF8523_REG_CONTROL2, 0);
 	if (err < 0)
 		return err;
 
@@ -363,16 +221,13 @@ static int pcf8523_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
 		rtc_time64_to_tm(alarm_time, &tm->time);
 	}
 
-	regs[0] = PCF8523_REG_MINUTE_ALARM;
-	regs[1] = bin2bcd(tm->time.tm_min);
-	regs[2] = bin2bcd(tm->time.tm_hour);
-	regs[3] = bin2bcd(tm->time.tm_mday);
-	regs[4] = ALARM_DIS;
-	msg.addr = client->addr;
-	msg.flags = 0;
-	msg.len = sizeof(regs);
-	msg.buf = regs;
-	err = i2c_transfer(client->adapter, &msg, 1);
+	regs[0] = bin2bcd(tm->time.tm_min);
+	regs[1] = bin2bcd(tm->time.tm_hour);
+	regs[2] = bin2bcd(tm->time.tm_mday);
+	regs[3] = ALARM_DIS;
+
+	err = regmap_bulk_write(pcf8523->regmap, PCF8523_REG_MINUTE_ALARM, regs,
+				sizeof(regs));
 	if (err < 0)
 		return err;
 
@@ -386,21 +241,21 @@ static int pcf8523_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
 static int pcf8523_rtc_ioctl(struct device *dev, unsigned int cmd,
 			     unsigned long arg)
 {
-	struct i2c_client *client = to_i2c_client(dev);
+	struct pcf8523 *pcf8523 = dev_get_drvdata(dev);
 	unsigned int flags = 0;
-	u8 value;
+	u32 value;
 	int ret;
 
 	switch (cmd) {
 	case RTC_VL_READ:
-		ret = pcf8523_read(client, PCF8523_REG_CONTROL3, &value);
+		ret = regmap_read(pcf8523->regmap, PCF8523_REG_CONTROL3, &value);
 		if (ret < 0)
 			return ret;
 
 		if (value & PCF8523_CONTROL3_BLF)
 			flags |= RTC_VL_BACKUP_LOW;
 
-		ret = pcf8523_read(client, PCF8523_REG_SECONDS, &value);
+		ret = regmap_read(pcf8523->regmap, PCF8523_REG_SECONDS, &value);
 		if (ret < 0)
 			return ret;
 
@@ -419,12 +274,12 @@ static int pcf8523_rtc_ioctl(struct device *dev, unsigned int cmd,
 
 static int pcf8523_rtc_read_offset(struct device *dev, long *offset)
 {
-	struct i2c_client *client = to_i2c_client(dev);
+	struct pcf8523 *pcf8523 = dev_get_drvdata(dev);
 	int err;
-	u8 value;
+	u32 value;
 	s8 val;
 
-	err = pcf8523_read(client, PCF8523_REG_OFFSET, &value);
+	err = regmap_read(pcf8523->regmap, PCF8523_REG_OFFSET, &value);
 	if (err < 0)
 		return err;
 
@@ -437,9 +292,9 @@ static int pcf8523_rtc_read_offset(struct device *dev, long *offset)
 
 static int pcf8523_rtc_set_offset(struct device *dev, long offset)
 {
-	struct i2c_client *client = to_i2c_client(dev);
+	struct pcf8523 *pcf8523 = dev_get_drvdata(dev);
 	long reg_m0, reg_m1;
-	u8 value;
+	u32 value;
 
 	reg_m0 = clamp(DIV_ROUND_CLOSEST(offset, 4340), -64L, 63L);
 	reg_m1 = clamp(DIV_ROUND_CLOSEST(offset, 4069), -64L, 63L);
@@ -449,7 +304,7 @@ static int pcf8523_rtc_set_offset(struct device *dev, long offset)
 	else
 		value = (reg_m1 & 0x7f) | PCF8523_OFFSET_MODE;
 
-	return pcf8523_write(client, PCF8523_REG_OFFSET, value);
+	return regmap_write(pcf8523->regmap, PCF8523_REG_OFFSET, value);
 }
 
 static const struct rtc_class_ops pcf8523_rtc_ops = {
@@ -463,6 +318,12 @@ static const struct rtc_class_ops pcf8523_rtc_ops = {
 	.set_offset = pcf8523_rtc_set_offset,
 };
 
+static const struct regmap_config regmap_config = {
+        .reg_bits = 8,
+        .val_bits = 8,
+        .max_register = 0x13,
+};
+
 static int pcf8523_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -478,37 +339,41 @@ static int pcf8523_probe(struct i2c_client *client,
 	if (!pcf8523)
 		return -ENOMEM;
 
+	pcf8523->regmap = devm_regmap_init_i2c(client, &regmap_config);
+	if (IS_ERR(pcf8523->regmap))
+		return PTR_ERR(pcf8523->regmap);
+
 	i2c_set_clientdata(client, pcf8523);
-	pcf8523->client = client;
 
-	err = pcf8523_load_capacitance(client);
+	rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
+	pcf8523->rtc = rtc;
+
+	err = pcf8523_load_capacitance(pcf8523, client->dev.of_node);
 	if (err < 0)
 		dev_warn(&client->dev, "failed to set xtal load capacitance: %d",
 			 err);
 
-	err = pcf8523_set_pm(client, 0);
+	err = regmap_update_bits(pcf8523->regmap, PCF8523_REG_CONTROL3,
+				 PCF8523_CONTROL3_PM_MASK, 0);
 	if (err < 0)
 		return err;
 
-	rtc = devm_rtc_allocate_device(&client->dev);
-	if (IS_ERR(rtc))
-		return PTR_ERR(rtc);
-
-	pcf8523->rtc = rtc;
 	rtc->ops = &pcf8523_rtc_ops;
 	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rtc->range_max = RTC_TIMESTAMP_END_2099;
 	rtc->uie_unsupported = 1;
 
 	if (client->irq > 0) {
-		err = pcf8523_write(client, PCF8523_TMR_CLKOUT_CTRL, 0x38);
+		err = regmap_write(pcf8523->regmap, PCF8523_TMR_CLKOUT_CTRL, 0x38);
 		if (err < 0)
 			return err;
 
 		err = devm_request_threaded_irq(&client->dev, client->irq,
 						NULL, pcf8523_irq,
 						IRQF_SHARED | IRQF_ONESHOT | IRQF_TRIGGER_LOW,
-						dev_name(&rtc->dev), client);
+						dev_name(&rtc->dev), pcf8523);
 		if (err)
 			return err;
 
-- 
2.31.1

