Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D136B3C3405
	for <lists+linux-rtc@lfdr.de>; Sat, 10 Jul 2021 11:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbhGJKA7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 10 Jul 2021 06:00:59 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:46899 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbhGJKA7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 10 Jul 2021 06:00:59 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 65F7F240003;
        Sat, 10 Jul 2021 09:58:12 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Frederic Weisbecker <frederic@kernel.org>
Cc:     kernel test robot <lkp@intel.com>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: pcf8523: rename register and bit defines
Date:   Sat, 10 Jul 2021 11:58:05 +0200
Message-Id: <20210710095805.1289560-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

arch/arm/mach-ixp4xx/include/mach/platform.h now gets included indirectly
and defines REG_OFFSET. Rename the register and bit definition to something
specific to the driver.

Fixes: 7fd70c65faac ("ARM: irqstat: Get rid of duplicated declaration")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---

Hello Thomas,

I'm going to rename all the register/bit deifinitions to align with the other
PCF drivers.

 drivers/rtc/rtc-pcf8523.c | 148 +++++++++++++++++++-------------------
 1 file changed, 74 insertions(+), 74 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index f720bcdb901d..09110b3ae25f 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -10,42 +10,42 @@
 #include <linux/of.h>
 #include <linux/pm_wakeirq.h>
 
-#define REG_CONTROL1 0x00
-#define REG_CONTROL1_CAP_SEL BIT(7)
-#define REG_CONTROL1_STOP    BIT(5)
-#define REG_CONTROL1_AIE    BIT(1)
-
-#define REG_CONTROL2 0x01
-#define REG_CONTROL2_AF BIT(3)
-
-#define REG_CONTROL3 0x02
-#define REG_CONTROL3_PM_BLD BIT(7) /* battery low detection disabled */
-#define REG_CONTROL3_PM_VDD BIT(6) /* switch-over disabled */
-#define REG_CONTROL3_PM_DSM BIT(5) /* direct switching mode */
-#define REG_CONTROL3_PM_MASK 0xe0
-#define REG_CONTROL3_BLF BIT(2) /* battery low bit, read-only */
-#define REG_CONTROL3_BSF BIT(3)
-
-#define REG_SECONDS  0x03
-#define REG_SECONDS_OS BIT(7)
-
-#define REG_MINUTES  0x04
-#define REG_HOURS    0x05
-#define REG_DAYS     0x06
-#define REG_WEEKDAYS 0x07
-#define REG_MONTHS   0x08
-#define REG_YEARS    0x09
-
-#define REG_MINUTE_ALARM	0x0a
-#define REG_HOUR_ALARM		0x0b
-#define REG_DAY_ALARM		0x0c
-#define REG_WEEKDAY_ALARM	0x0d
+#define PCF8523_REG_CONTROL1 0x00
+#define PCF8523_CONTROL1_CAP_SEL BIT(7)
+#define PCF8523_CONTROL1_STOP    BIT(5)
+#define PCF8523_CONTROL1_AIE    BIT(1)
+
+#define PCF8523_REG_CONTROL2 0x01
+#define PCF8523_CONTROL2_AF BIT(3)
+
+#define PCF8523_REG_CONTROL3 0x02
+#define PCF8523_CONTROL3_PM_BLD BIT(7) /* battery low detection disabled */
+#define PCF8523_CONTROL3_PM_VDD BIT(6) /* switch-over disabled */
+#define PCF8523_CONTROL3_PM_DSM BIT(5) /* direct switching mode */
+#define PCF8523_CONTROL3_PM_MASK 0xe0
+#define PCF8523_CONTROL3_BLF BIT(2) /* battery low bit, read-only */
+#define PCF8523_CONTROL3_BSF BIT(3)
+
+#define PCF8523_REG_SECONDS  0x03
+#define PCF8523_SECONDS_OS BIT(7)
+
+#define PCF8523_REG_MINUTES  0x04
+#define PCF8523_REG_HOURS    0x05
+#define PCF8523_REG_DAYS     0x06
+#define PCF8523_REG_WEEKDAYS 0x07
+#define PCF8523_REG_MONTHS   0x08
+#define PCF8523_REG_YEARS    0x09
+
+#define PCF8523_REG_MINUTE_ALARM	0x0a
+#define PCF8523_REG_HOUR_ALARM		0x0b
+#define PCF8523_REG_DAY_ALARM		0x0c
+#define PCF8523_REG_WEEKDAY_ALARM	0x0d
 #define ALARM_DIS BIT(7)
 
-#define REG_OFFSET   0x0e
-#define REG_OFFSET_MODE BIT(7)
+#define PCF8523_REG_OFFSET   0x0e
+#define PCF8523_OFFSET_MODE BIT(7)
 
-#define REG_TMR_CLKOUT_CTRL 0x0f
+#define PCF8523_TMR_CLKOUT_CTRL 0x0f
 
 struct pcf8523 {
 	struct rtc_device *rtc;
@@ -101,7 +101,7 @@ static int pcf8523_load_capacitance(struct i2c_client *client)
 	u8 value;
 	int err;
 
-	err = pcf8523_read(client, REG_CONTROL1, &value);
+	err = pcf8523_read(client, PCF8523_REG_CONTROL1, &value);
 	if (err < 0)
 		return err;
 
@@ -115,14 +115,14 @@ static int pcf8523_load_capacitance(struct i2c_client *client)
 			 load);
 		fallthrough;
 	case 12500:
-		value |= REG_CONTROL1_CAP_SEL;
+		value |= PCF8523_CONTROL1_CAP_SEL;
 		break;
 	case 7000:
-		value &= ~REG_CONTROL1_CAP_SEL;
+		value &= ~PCF8523_CONTROL1_CAP_SEL;
 		break;
 	}
 
-	err = pcf8523_write(client, REG_CONTROL1, value);
+	err = pcf8523_write(client, PCF8523_REG_CONTROL1, value);
 
 	return err;
 }
@@ -132,13 +132,13 @@ static int pcf8523_set_pm(struct i2c_client *client, u8 pm)
 	u8 value;
 	int err;
 
-	err = pcf8523_read(client, REG_CONTROL3, &value);
+	err = pcf8523_read(client, PCF8523_REG_CONTROL3, &value);
 	if (err < 0)
 		return err;
 
-	value = (value & ~REG_CONTROL3_PM_MASK) | pm;
+	value = (value & ~PCF8523_CONTROL3_PM_MASK) | pm;
 
-	err = pcf8523_write(client, REG_CONTROL3, value);
+	err = pcf8523_write(client, PCF8523_REG_CONTROL3, value);
 	if (err < 0)
 		return err;
 
@@ -151,13 +151,13 @@ static irqreturn_t pcf8523_irq(int irq, void *dev_id)
 	u8 value;
 	int err;
 
-	err = pcf8523_read(pcf8523->client, REG_CONTROL2, &value);
+	err = pcf8523_read(pcf8523->client, PCF8523_REG_CONTROL2, &value);
 	if (err < 0)
 		return IRQ_HANDLED;
 
-	if (value & REG_CONTROL2_AF) {
-		value &= ~REG_CONTROL2_AF;
-		pcf8523_write(pcf8523->client, REG_CONTROL2, value);
+	if (value & PCF8523_CONTROL2_AF) {
+		value &= ~PCF8523_CONTROL2_AF;
+		pcf8523_write(pcf8523->client, PCF8523_REG_CONTROL2, value);
 		rtc_update_irq(pcf8523->rtc, 1, RTC_IRQF | RTC_AF);
 
 		return IRQ_HANDLED;
@@ -171,13 +171,13 @@ static int pcf8523_stop_rtc(struct i2c_client *client)
 	u8 value;
 	int err;
 
-	err = pcf8523_read(client, REG_CONTROL1, &value);
+	err = pcf8523_read(client, PCF8523_REG_CONTROL1, &value);
 	if (err < 0)
 		return err;
 
-	value |= REG_CONTROL1_STOP;
+	value |= PCF8523_CONTROL1_STOP;
 
-	err = pcf8523_write(client, REG_CONTROL1, value);
+	err = pcf8523_write(client, PCF8523_REG_CONTROL1, value);
 	if (err < 0)
 		return err;
 
@@ -189,13 +189,13 @@ static int pcf8523_start_rtc(struct i2c_client *client)
 	u8 value;
 	int err;
 
-	err = pcf8523_read(client, REG_CONTROL1, &value);
+	err = pcf8523_read(client, PCF8523_REG_CONTROL1, &value);
 	if (err < 0)
 		return err;
 
-	value &= ~REG_CONTROL1_STOP;
+	value &= ~PCF8523_CONTROL1_STOP;
 
-	err = pcf8523_write(client, REG_CONTROL1, value);
+	err = pcf8523_write(client, PCF8523_REG_CONTROL1, value);
 	if (err < 0)
 		return err;
 
@@ -205,7 +205,7 @@ static int pcf8523_start_rtc(struct i2c_client *client)
 static int pcf8523_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
-	u8 start = REG_SECONDS, regs[7];
+	u8 start = PCF8523_REG_SECONDS, regs[7];
 	struct i2c_msg msgs[2];
 	int err;
 
@@ -223,7 +223,7 @@ static int pcf8523_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	if (err < 0)
 		return err;
 
-	if (regs[0] & REG_SECONDS_OS)
+	if (regs[0] & PCF8523_SECONDS_OS)
 		return -EINVAL;
 
 	tm->tm_sec = bcd2bin(regs[0] & 0x7f);
@@ -248,8 +248,8 @@ static int pcf8523_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	if (err < 0)
 		return err;
 
-	regs[0] = REG_SECONDS;
-	/* This will purposely overwrite REG_SECONDS_OS */
+	regs[0] = PCF8523_REG_SECONDS;
+	/* This will purposely overwrite PCF8523_SECONDS_OS */
 	regs[1] = bin2bcd(tm->tm_sec);
 	regs[2] = bin2bcd(tm->tm_min);
 	regs[3] = bin2bcd(tm->tm_hour);
@@ -280,7 +280,7 @@ static int pcf8523_rtc_set_time(struct device *dev, struct rtc_time *tm)
 static int pcf8523_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
-	u8 start = REG_MINUTE_ALARM, regs[4];
+	u8 start = PCF8523_REG_MINUTE_ALARM, regs[4];
 	struct i2c_msg msgs[2];
 	u8 value;
 	int err;
@@ -305,15 +305,15 @@ static int pcf8523_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
 	tm->time.tm_mday = bcd2bin(regs[2] & 0x3F);
 	tm->time.tm_wday = bcd2bin(regs[3] & 0x7);
 
-	err = pcf8523_read(client, REG_CONTROL1, &value);
+	err = pcf8523_read(client, PCF8523_REG_CONTROL1, &value);
 	if (err < 0)
 		return err;
-	tm->enabled = !!(value & REG_CONTROL1_AIE);
+	tm->enabled = !!(value & PCF8523_CONTROL1_AIE);
 
-	err = pcf8523_read(client, REG_CONTROL2, &value);
+	err = pcf8523_read(client, PCF8523_REG_CONTROL2, &value);
 	if (err < 0)
 		return err;
-	tm->pending = !!(value & REG_CONTROL2_AF);
+	tm->pending = !!(value & PCF8523_CONTROL2_AF);
 
 	return 0;
 }
@@ -324,16 +324,16 @@ static int pcf8523_irq_enable(struct device *dev, unsigned int enabled)
 	u8 value;
 	int err;
 
-	err = pcf8523_read(client, REG_CONTROL1, &value);
+	err = pcf8523_read(client, PCF8523_REG_CONTROL1, &value);
 	if (err < 0)
 		return err;
 
-	value &= REG_CONTROL1_AIE;
+	value &= PCF8523_CONTROL1_AIE;
 
 	if (enabled)
-		value |= REG_CONTROL1_AIE;
+		value |= PCF8523_CONTROL1_AIE;
 
-	err = pcf8523_write(client, REG_CONTROL1, value);
+	err = pcf8523_write(client, PCF8523_REG_CONTROL1, value);
 	if (err < 0)
 		return err;
 
@@ -351,7 +351,7 @@ static int pcf8523_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
 	if (err)
 		return err;
 
-	err = pcf8523_write(client, REG_CONTROL2, 0);
+	err = pcf8523_write(client, PCF8523_REG_CONTROL2, 0);
 	if (err < 0)
 		return err;
 
@@ -363,7 +363,7 @@ static int pcf8523_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
 		rtc_time64_to_tm(alarm_time, &tm->time);
 	}
 
-	regs[0] = REG_MINUTE_ALARM;
+	regs[0] = PCF8523_REG_MINUTE_ALARM;
 	regs[1] = bin2bcd(tm->time.tm_min);
 	regs[2] = bin2bcd(tm->time.tm_hour);
 	regs[3] = bin2bcd(tm->time.tm_mday);
@@ -393,18 +393,18 @@ static int pcf8523_rtc_ioctl(struct device *dev, unsigned int cmd,
 
 	switch (cmd) {
 	case RTC_VL_READ:
-		ret = pcf8523_read(client, REG_CONTROL3, &value);
+		ret = pcf8523_read(client, PCF8523_REG_CONTROL3, &value);
 		if (ret < 0)
 			return ret;
 
-		if (value & REG_CONTROL3_BLF)
+		if (value & PCF8523_CONTROL3_BLF)
 			flags |= RTC_VL_BACKUP_LOW;
 
-		ret = pcf8523_read(client, REG_SECONDS, &value);
+		ret = pcf8523_read(client, PCF8523_REG_SECONDS, &value);
 		if (ret < 0)
 			return ret;
 
-		if (value & REG_SECONDS_OS)
+		if (value & PCF8523_SECONDS_OS)
 			flags |= RTC_VL_DATA_INVALID;
 
 		return put_user(flags, (unsigned int __user *)arg);
@@ -424,13 +424,13 @@ static int pcf8523_rtc_read_offset(struct device *dev, long *offset)
 	u8 value;
 	s8 val;
 
-	err = pcf8523_read(client, REG_OFFSET, &value);
+	err = pcf8523_read(client, PCF8523_REG_OFFSET, &value);
 	if (err < 0)
 		return err;
 
 	/* sign extend the 7-bit offset value */
 	val = value << 1;
-	*offset = (value & REG_OFFSET_MODE ? 4069 : 4340) * (val >> 1);
+	*offset = (value & PCF8523_OFFSET_MODE ? 4069 : 4340) * (val >> 1);
 
 	return 0;
 }
@@ -447,9 +447,9 @@ static int pcf8523_rtc_set_offset(struct device *dev, long offset)
 	if (abs(reg_m0 * 4340 - offset) < abs(reg_m1 * 4069 - offset))
 		value = reg_m0 & 0x7f;
 	else
-		value = (reg_m1 & 0x7f) | REG_OFFSET_MODE;
+		value = (reg_m1 & 0x7f) | PCF8523_OFFSET_MODE;
 
-	return pcf8523_write(client, REG_OFFSET, value);
+	return pcf8523_write(client, PCF8523_REG_OFFSET, value);
 }
 
 static const struct rtc_class_ops pcf8523_rtc_ops = {
@@ -501,7 +501,7 @@ static int pcf8523_probe(struct i2c_client *client,
 	rtc->uie_unsupported = 1;
 
 	if (client->irq > 0) {
-		err = pcf8523_write(client, REG_TMR_CLKOUT_CTRL, 0x38);
+		err = pcf8523_write(client, PCF8523_TMR_CLKOUT_CTRL, 0x38);
 		if (err < 0)
 			return err;
 
-- 
2.31.1

