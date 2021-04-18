Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71B563632D7
	for <lists+linux-rtc@lfdr.de>; Sun, 18 Apr 2021 02:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236554AbhDRAU4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 17 Apr 2021 20:20:56 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:55287 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234904AbhDRAU4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 17 Apr 2021 20:20:56 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2C6B9C0002;
        Sun, 18 Apr 2021 00:20:27 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] rtc: pcf8523: add alarm support
Date:   Sun, 18 Apr 2021 02:20:22 +0200
Message-Id: <20210418002023.1000265-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210418002023.1000265-1-alexandre.belloni@bootlin.com>
References: <20210418002023.1000265-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Alarm support requires unconditionally disabling clock out because it is
using the int1 pin.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf8523.c | 181 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 180 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index fe3ab41d8326..feadab8e3bd3 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -8,10 +8,15 @@
 #include <linux/module.h>
 #include <linux/rtc.h>
 #include <linux/of.h>
+#include <linux/pm_wakeirq.h>
 
 #define REG_CONTROL1 0x00
 #define REG_CONTROL1_CAP_SEL BIT(7)
 #define REG_CONTROL1_STOP    BIT(5)
+#define REG_CONTROL1_AIE    BIT(1)
+
+#define REG_CONTROL2 0x01
+#define REG_CONTROL2_AF BIT(3)
 
 #define REG_CONTROL3 0x02
 #define REG_CONTROL3_PM_BLD BIT(7) /* battery low detection disabled */
@@ -30,9 +35,22 @@
 #define REG_MONTHS   0x08
 #define REG_YEARS    0x09
 
+#define REG_MINUTE_ALARM	0x0a
+#define REG_HOUR_ALARM		0x0b
+#define REG_DAY_ALARM		0x0c
+#define REG_WEEKDAY_ALARM	0x0d
+#define ALARM_DIS BIT(7)
+
 #define REG_OFFSET   0x0e
 #define REG_OFFSET_MODE BIT(7)
 
+#define REG_TMR_CLKOUT_CTRL 0x0f
+
+struct pcf8523 {
+	struct rtc_device *rtc;
+	struct i2c_client *client;
+};
+
 static int pcf8523_read(struct i2c_client *client, u8 reg, u8 *valuep)
 {
 	struct i2c_msg msgs[2];
@@ -138,6 +156,27 @@ static int pcf8523_set_pm(struct i2c_client *client, u8 pm)
 	return 0;
 }
 
+static irqreturn_t pcf8523_irq(int irq, void *dev_id)
+{
+	struct pcf8523 *pcf8523 = i2c_get_clientdata(dev_id);
+	u8 value;
+	int err;
+
+	err = pcf8523_read(pcf8523->client, REG_CONTROL2, &value);
+	if (err < 0)
+		return IRQ_HANDLED;
+
+	if (value & REG_CONTROL2_AF) {
+		value &= ~REG_CONTROL2_AF;
+		pcf8523_write(pcf8523->client, REG_CONTROL2, value);
+		rtc_update_irq(pcf8523->rtc, 1, RTC_IRQF | RTC_AF);
+
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
 static int pcf8523_stop_rtc(struct i2c_client *client)
 {
 	u8 value;
@@ -257,6 +296,111 @@ static int pcf8523_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	return pcf8523_start_rtc(client);
 }
 
+static int pcf8523_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	u8 start = REG_MINUTE_ALARM, regs[4];
+	struct i2c_msg msgs[2];
+	u8 value;
+	int err;
+
+	msgs[0].addr = client->addr;
+	msgs[0].flags = 0;
+	msgs[0].len = 1;
+	msgs[0].buf = &start;
+
+	msgs[1].addr = client->addr;
+	msgs[1].flags = I2C_M_RD;
+	msgs[1].len = sizeof(regs);
+	msgs[1].buf = regs;
+
+	err = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (err < 0)
+		return err;
+
+	tm->time.tm_sec = 0;
+	tm->time.tm_min = bcd2bin(regs[0] & 0x7F);
+	tm->time.tm_hour = bcd2bin(regs[1] & 0x3F);
+	tm->time.tm_mday = bcd2bin(regs[2] & 0x3F);
+	tm->time.tm_wday = bcd2bin(regs[3] & 0x7);
+
+	err = pcf8523_read(client, REG_CONTROL1, &value);
+	if (err < 0)
+		return err;
+	tm->enabled = !!(value & REG_CONTROL1_AIE);
+
+	err = pcf8523_read(client, REG_CONTROL2, &value);
+	if (err < 0)
+		return err;
+	tm->pending = !!(value & REG_CONTROL2_AF);
+
+	return 0;
+}
+
+static int pcf8523_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	u8 value;
+	int err;
+
+	err = pcf8523_read(client, REG_CONTROL1, &value);
+	if (err < 0)
+		return err;
+
+	value &= REG_CONTROL1_AIE;
+
+	if (enabled)
+		value |= REG_CONTROL1_AIE;
+
+	err = pcf8523_write(client, REG_CONTROL1, value);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static int pcf8523_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct i2c_msg msg;
+	u8 regs[5];
+	int err;
+
+	err = pcf8523_irq_enable(dev, 0);
+	if (err)
+		return err;
+
+	err = pcf8523_write(client, REG_CONTROL2, 0);
+	if (err < 0)
+		return err;
+
+	/* The alarm has no seconds, round up to nearest minute */
+	if (tm->time.tm_sec) {
+		time64_t alarm_time = rtc_tm_to_time64(&tm->time);
+
+		alarm_time += 60 - tm->time.tm_sec;
+		rtc_time64_to_tm(alarm_time, &tm->time);
+	}
+
+	regs[0] = REG_MINUTE_ALARM;
+	regs[1] = bin2bcd(tm->time.tm_min);
+	regs[2] = bin2bcd(tm->time.tm_hour);
+	regs[3] = bin2bcd(tm->time.tm_mday);
+	regs[4] = ALARM_DIS;
+	msg.addr = client->addr;
+	msg.flags = 0;
+	msg.len = sizeof(regs);
+	msg.buf = regs;
+	err = i2c_transfer(client->adapter, &msg, 1);
+	if (err < 0)
+		return err;
+
+	if (tm->enabled)
+		return pcf8523_irq_enable(dev, tm->enabled);
+
+	return 0;
+}
+
 #ifdef CONFIG_RTC_INTF_DEV
 static int pcf8523_rtc_ioctl(struct device *dev, unsigned int cmd,
 			     unsigned long arg)
@@ -320,6 +464,9 @@ static int pcf8523_rtc_set_offset(struct device *dev, long offset)
 static const struct rtc_class_ops pcf8523_rtc_ops = {
 	.read_time = pcf8523_rtc_read_time,
 	.set_time = pcf8523_rtc_set_time,
+	.read_alarm = pcf8523_rtc_read_alarm,
+	.set_alarm = pcf8523_rtc_set_alarm,
+	.alarm_irq_enable = pcf8523_irq_enable,
 	.ioctl = pcf8523_rtc_ioctl,
 	.read_offset = pcf8523_rtc_read_offset,
 	.set_offset = pcf8523_rtc_set_offset,
@@ -328,12 +475,21 @@ static const struct rtc_class_ops pcf8523_rtc_ops = {
 static int pcf8523_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
+	struct pcf8523 *pcf8523;
 	struct rtc_device *rtc;
+	bool wakeup_source = false;
 	int err;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
+	pcf8523 = devm_kzalloc(&client->dev, sizeof(struct pcf8523), GFP_KERNEL);
+	if (!pcf8523)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, pcf8523);
+	pcf8523->client = client;
+
 	err = pcf8523_load_capacitance(client);
 	if (err < 0)
 		dev_warn(&client->dev, "failed to set xtal load capacitance: %d",
@@ -347,11 +503,34 @@ static int pcf8523_probe(struct i2c_client *client,
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
+	pcf8523->rtc = rtc;
 	rtc->ops = &pcf8523_rtc_ops;
 	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->uie_unsupported = 1;
+
+	if (client->irq > 0) {
+		err = pcf8523_write(client, REG_TMR_CLKOUT_CTRL, 0x38);
+		if (err < 0)
+			return err;
+
+		err = devm_request_threaded_irq(&client->dev, client->irq,
+						NULL, pcf8523_irq,
+						IRQF_SHARED | IRQF_ONESHOT | IRQF_TRIGGER_LOW,
+						dev_name(&rtc->dev), client);
+		if (err)
+			return err;
+
+		dev_pm_set_wake_irq(&client->dev, client->irq);
+	}
+
+#ifdef CONFIG_OF
+	wakeup_source = of_property_read_bool(client->dev.of_node, "wakeup-source");
+#endif
+	if (client->irq > 0 || wakeup_source)
+		device_init_wakeup(&client->dev, true);
 
-	return devm_rtc_register_device(rtc);
+	return rtc_register_device(rtc);
 }
 
 static const struct i2c_device_id pcf8523_id[] = {
-- 
2.30.2

