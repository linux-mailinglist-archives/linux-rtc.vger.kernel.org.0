Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4D682CF278
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Dec 2020 17:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbgLDQ6n (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Dec 2020 11:58:43 -0500
Received: from m12-15.163.com ([220.181.12.15]:53149 "EHLO m12-15.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726309AbgLDQ6n (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 4 Dec 2020 11:58:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=oYtwYM8kSAUfwGal+D
        g/Hl7b5hmUiAocr+bxu1ahhy0=; b=BKi1UrVRNsK4EnO66kQlzOQ9U0AjE+pXe+
        gjN/NYscBjp8/Lul1BVHwBhcswWN5/mJInfzCb9f1XsoMAWEflGSrPU3y3SUlSdT
        PY40tYeHA/dxOIBHkDLTpCO47sxlzA7JqArEMy2/P95mN7lXen19C3O1JszOiNqH
        dfdqN6noY=
Received: from localhost.localdomain (unknown [60.232.147.46])
        by smtp11 (Coremail) with SMTP id D8CowAAHDiJJRspf9DuwEg--.20493S2;
        Fri, 04 Dec 2020 22:23:10 +0800 (CST)
From:   zoro <long17.cool@163.com>
To:     alexandre.belloni@bootlin.com
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        zoro <long17.cool@163.com>
Subject: [PATCH] rtc: sd3078: add alarm function
Date:   Fri,  4 Dec 2020 22:23:04 +0800
Message-Id: <1607091784-22328-1-git-send-email-long17.cool@163.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: D8CowAAHDiJJRspf9DuwEg--.20493S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3KFWrGr43Jr17Wr1kXF1UWrg_yoWkKFy3pF
        4fJFy5trs5JF43Ww4rtFn5WF13tr18ArZ7tFnxGw4IkF1UJwn5t3ZYgr12k3WYqryru3y5
        WF4YqFWj9ryUu3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ui0edUUUUU=
X-Originating-IP: [60.232.147.46]
X-CM-SenderInfo: 5orqwi2xof00ro6rljoofrz/1tbiPRTwF1SIiS63tgABs1
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Complete common functions of sd3078.

Signed-off-by: zoro <long17.cool@163.com>
---
 drivers/rtc/rtc-sd3078.c | 319 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 313 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c
index a7aa943..3626a43 100644
--- a/drivers/rtc/rtc-sd3078.c
+++ b/drivers/rtc/rtc-sd3078.c
@@ -7,9 +7,11 @@
 #include <linux/bcd.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <linux/rtc.h>
 #include <linux/slab.h>
+#include <linux/version.h>
 
 #define SD3078_REG_SC			0x00
 #define SD3078_REG_MN			0x01
@@ -19,13 +21,38 @@
 #define SD3078_REG_MO			0x05
 #define SD3078_REG_YR			0x06
 
-#define SD3078_REG_CTRL1		0x0f
+#define SD3078_ALARM_SC			0x07
+#define SD3078_ALARM_MN			0x08
+#define SD3078_ALARM_HR			0x09
+#define SD3078_ALARM_DW			0x0A
+#define SD3078_ALARM_DM			0x0B
+#define SD3078_ALARM_MO			0x0C
+#define SD3078_ALARM_YR			0x0D
+#define SD3078_ALARM_EN			0x0E
+
+#define SD3078_REG_CTRL1		0x0F
 #define SD3078_REG_CTRL2		0x10
 #define SD3078_REG_CTRL3		0x11
 
-#define KEY_WRITE1		0x80
-#define KEY_WRITE2		0x04
-#define KEY_WRITE3		0x80
+#define KEY_WRITE1				0x80
+#define KEY_WRITE2				0x04
+#define KEY_WRITE3				0x80
+
+#define BIT_IM					0x40
+#define BIT_INTS1				0x20
+#define BIT_INTS0				0x10
+#define BIT_INTDE				0x04
+#define BIT_INTAE				0x02
+#define BIT_INTFE				0x01
+#define BIT_INTAF				0x20
+
+#define BIT_EN_EAD				0x10
+#define BIT_EN_EAH				0x04
+#define BIT_EN_EAMN				0x02
+#define BIT_EN_EAS				0x01
+
+#define INT_BITS	(BIT_IM | BIT_INTS1 | BIT_INTS0 | \
+			BIT_INTDE | BIT_INTAE | BIT_INTFE)
 
 #define NUM_TIME_REGS   (SD3078_REG_YR - SD3078_REG_SC + 1)
 
@@ -39,6 +66,10 @@
 struct sd3078 {
 	struct rtc_device	*rtc;
 	struct regmap		*regmap;
+	int			irq_gpio;
+	bool			suspended;
+	struct work_struct	work;
+	struct i2c_client	*client;
 };
 
 /*
@@ -113,7 +144,7 @@ static int sd3078_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 	tm->tm_mday = bcd2bin(rtc_data[SD3078_REG_DM] & 0x3F);
 	tm->tm_wday = rtc_data[SD3078_REG_DW] & 0x07;
-	tm->tm_mon	= bcd2bin(rtc_data[SD3078_REG_MO] & 0x1F) - 1;
+	tm->tm_mon  = bcd2bin(rtc_data[SD3078_REG_MO] & 0x1F) - 1;
 	tm->tm_year = bcd2bin(rtc_data[SD3078_REG_YR]) + 100;
 
 	return 0;
@@ -126,6 +157,11 @@ static int sd3078_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	struct sd3078 *sd3078 = i2c_get_clientdata(client);
 	int ret;
 
+	if (tm->tm_year < 100) {
+		dev_err(dev, "year should be equal to or greate than 2000!\n");
+		return -EINVAL;
+	}
+
 	rtc_data[SD3078_REG_SC] = bin2bcd(tm->tm_sec);
 	rtc_data[SD3078_REG_MN] = bin2bcd(tm->tm_min);
 	rtc_data[SD3078_REG_HR] = bin2bcd(tm->tm_hour) | 0x80;
@@ -152,9 +188,179 @@ static int sd3078_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	return 0;
 }
 
+static int sd3078_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	unsigned char hour;
+	int value;
+	unsigned char alarm_data[NUM_TIME_REGS] = {0};
+	struct i2c_client *client = to_i2c_client(dev);
+	struct sd3078 *sd3078 = i2c_get_clientdata(client);
+	int ret;
+
+	ret = regmap_bulk_read(sd3078->regmap, SD3078_ALARM_SC, alarm_data,
+			       NUM_TIME_REGS);
+	if (ret < 0) {
+		dev_err(dev, "reading from RTC failed with err:%d\n", ret);
+		return ret;
+	}
+
+	alarm->time.tm_sec = bcd2bin(alarm_data[SD3078_ALARM_SC - SD3078_ALARM_SC] & 0x7F);
+	alarm->time.tm_min = bcd2bin(alarm_data[SD3078_ALARM_MN - SD3078_ALARM_SC] & 0x7F);
+
+	/*
+	 * The sd3078 supports 12/24 hour mode.
+	 * When getting time,
+	 * we need to convert the 12 hour mode to the 24 hour mode.
+	 */
+	hour = alarm_data[SD3078_ALARM_HR - SD3078_ALARM_SC];
+	if (hour & 0x80) /* 24H MODE */
+		alarm->time.tm_hour = bcd2bin(hour & 0x3F);
+	else if (hour & 0x20) /* 12H MODE PM */
+		alarm->time.tm_hour = bcd2bin(hour & 0x1F) + 12;
+	else /* 12H MODE AM */
+		alarm->time.tm_hour = bcd2bin(hour & 0x1F);
+
+	alarm->time.tm_mday = bcd2bin(alarm_data[SD3078_ALARM_DM - SD3078_ALARM_SC] & 0x3F);
+	alarm->time.tm_wday = alarm_data[SD3078_ALARM_DW - SD3078_ALARM_SC] & 0x07;
+	alarm->time.tm_mon  = bcd2bin(alarm_data[SD3078_ALARM_MO - SD3078_ALARM_SC] & 0x1F) - 1;
+	alarm->time.tm_year = bcd2bin(alarm_data[SD3078_ALARM_YR - SD3078_ALARM_SC]) + 100;
+
+	ret = regmap_read(sd3078->regmap, SD3078_REG_CTRL2, &value);
+	if (ret < 0) {
+		dev_err(dev, "RTC read ctrl2 failed with err:%d\n", ret);
+		return ret;
+	}
+
+	if ((value & (INT_BITS)) == (BIT_INTS0 | BIT_INTAE))
+		alarm->enabled = 1;
+	else
+		alarm->enabled = 0;
+
+	ret = regmap_read(sd3078->regmap, SD3078_REG_CTRL1, &value);
+	if (ret < 0) {
+		dev_err(dev, "RTC read ctrl1 failed with err:%d\n", ret);
+		return ret;
+	}
+
+	if ((value & (BIT_INTAF)) == BIT_INTAF)
+		alarm->pending = 1;
+	else
+		alarm->pending = 0;
+
+	return 0;
+}
+
+static int sd3078_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	unsigned char alarm_data[NUM_TIME_REGS];
+	struct i2c_client *client = to_i2c_client(dev);
+	struct sd3078 *sd3078 = i2c_get_clientdata(client);
+	int ret;
+
+	if (alarm->time.tm_year < 100) {
+		dev_err(dev, "year should be equal to or greate than 2000!\n");
+		return -EINVAL;
+	}
+
+	if (client->irq <= 0)
+		return -EINVAL;
+
+	alarm_data[SD3078_ALARM_SC - SD3078_ALARM_SC] = bin2bcd(alarm->time.tm_sec);
+	alarm_data[SD3078_ALARM_MN - SD3078_ALARM_SC] = bin2bcd(alarm->time.tm_min);
+	alarm_data[SD3078_ALARM_HR - SD3078_ALARM_SC] = bin2bcd(alarm->time.tm_hour) | 0x80;
+	alarm_data[SD3078_ALARM_DM - SD3078_ALARM_SC] = bin2bcd(alarm->time.tm_mday);
+
+#if WRITE_PROTECT_EN
+	sd3078_enable_reg_write(sd3078);
+#endif
+
+	ret = regmap_bulk_write(sd3078->regmap, SD3078_ALARM_SC, alarm_data,
+				SD3078_ALARM_DM - SD3078_ALARM_SC + 1);
+	if (ret < 0) {
+		dev_err(dev, "writing to RTC alarm failed with err:%d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * set the day, hour, minute and second alarm enable
+	 * this operation will clear the alarm interrupt flag
+	 */
+	ret = regmap_update_bits(sd3078->regmap, SD3078_ALARM_EN,
+				 BIT_EN_EAD | BIT_EN_EAH | BIT_EN_EAMN | BIT_EN_EAS,
+				 BIT_EN_EAD | BIT_EN_EAH | BIT_EN_EAMN | BIT_EN_EAS);
+
+	if (ret < 0) {
+		dev_err(dev, "RTC set alarm enable failed with err:%d\n", ret);
+		return ret;
+	}
+
+	if (alarm->enabled) {
+		regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL2,
+				   INT_BITS, BIT_INTS0 | BIT_INTAE);
+	} else {
+		regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL2,
+				   INT_BITS, 0);
+	}
+
+#if WRITE_PROTECT_EN
+	sd3078_disable_reg_write(sd3078);
+#endif
+
+	return 0;
+}
+
+static int sd3078_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct sd3078 *sd3078 = i2c_get_clientdata(client);
+
+	if (client->irq <= 0)
+		return -EINVAL;
+
+	if (enabled) {
+		/*
+		 * CTRL2
+		 * :IM(bit6)
+		 *    0 : single event alarm
+		 *        Output low level until INTAF bit is cleared.
+		 *    1 : periodic alarm
+		 *        Output low-level active pulses with 250ms width
+		 *        until the interrupt enable bit is cleared
+		 *
+		 * :INTS1(bit5) :INTS0(bit4)
+		 *       0          0     : battery alarm
+		 *       0          1     : alarm interrupt output
+		 *       1          0     : frequency interrupt output
+		 *       1          1     : countdown interrupt output
+		 *
+		 * :INTDE(bit2)
+		 *       0/1 : enable/disable countdown interrupt
+		 *
+		 * :INTFE(bit1)
+		 *       0/1 : enable/disable frequency interrupt
+		 *
+		 * :INTAE(bit0)
+		 *       0/1 : enable/disable alarm interrupt
+		 */
+
+		regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL2,
+				   INT_BITS, BIT_INTS0 | BIT_INTAE);
+		enable_irq(client->irq);
+	} else {
+		regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL2,
+				   INT_BITS, 0);
+		disable_irq(client->irq);
+	}
+
+	return 0;
+}
+
 static const struct rtc_class_ops sd3078_rtc_ops = {
 	.read_time	= sd3078_rtc_read_time,
 	.set_time	= sd3078_rtc_set_time,
+	.read_alarm	= sd3078_rtc_read_alarm,
+	.set_alarm	= sd3078_rtc_set_alarm,
+	.alarm_irq_enable = sd3078_alarm_irq_enable,
 };
 
 static const struct regmap_config regmap_config = {
@@ -163,10 +369,57 @@ static const struct regmap_config regmap_config = {
 	.max_register = 0x11,
 };
 
+static void sd3078_work(struct work_struct *work)
+{
+	struct sd3078 *sd3078 = container_of(work, struct sd3078, work);
+
+	/* clean interrupt flag */
+	regmap_update_bits(sd3078->regmap, SD3078_REG_CTRL1,
+			   BIT_INTAF, 0);
+
+	rtc_update_irq(sd3078->rtc, 1, RTC_AF | RTC_IRQF);
+
+	enable_irq(sd3078->client->irq);
+}
+
+int sd3078_get_irq(struct i2c_client *client)
+{
+	int ret;
+	struct device_node *node = client->dev.of_node;
+	struct sd3078 *sd3078 = i2c_get_clientdata(client);
+
+	sd3078->irq_gpio = of_get_named_gpio(node, "irq_gpio", 0);
+	if (!gpio_is_valid(sd3078->irq_gpio)) {
+		dev_err(&client->dev, "invalid gpio : %d\n", sd3078->irq_gpio);
+		return 0;
+	}
+
+	ret = devm_gpio_request_one(&client->dev, sd3078->irq_gpio, GPIOF_DIR_IN, "irq_gpio");
+		if (ret) {
+			dev_err(&client->dev, "can't get irq_gpio\n");
+		return 0;
+	}
+
+	return gpio_to_irq(sd3078->irq_gpio);
+}
+
+static irqreturn_t sd3078_irq(int irq, void *dev_id)
+{
+	struct i2c_client *client = dev_id;
+	struct sd3078 *sd3078 = i2c_get_clientdata(client);
+
+	disable_irq_nosync(irq);
+
+	if (!sd3078->suspended)
+		schedule_work(&sd3078->work);
+
+	return IRQ_HANDLED;
+}
+
 static int sd3078_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
-	int ret;
+	int ret = 0;
 	struct sd3078 *sd3078;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
@@ -176,6 +429,10 @@ static int sd3078_probe(struct i2c_client *client,
 	if (!sd3078)
 		return -ENOMEM;
 
+	INIT_WORK(&sd3078->work, sd3078_work);
+
+	sd3078->client = client;
+
 	sd3078->regmap = devm_regmap_init_i2c(client, &regmap_config);
 	if (IS_ERR(sd3078->regmap)) {
 		dev_err(&client->dev, "regmap allocation failed\n");
@@ -183,12 +440,14 @@ static int sd3078_probe(struct i2c_client *client,
 	}
 
 	i2c_set_clientdata(client, sd3078);
+	dev_set_drvdata(&client->dev, sd3078);
 
 	sd3078->rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(sd3078->rtc))
 		return PTR_ERR(sd3078->rtc);
 
 	sd3078->rtc->ops = &sd3078_rtc_ops;
+
 	sd3078->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	sd3078->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
@@ -196,10 +455,57 @@ static int sd3078_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
+	if (client->irq <= 0) {
+		/* get the interrupt number according to gpio in dts */
+		client->irq = sd3078_get_irq(client);
+	}
+
+	if (client->irq) {
+		ret = devm_request_irq(&client->dev, client->irq, sd3078_irq,
+				       IRQF_TRIGGER_FALLING, client->name, client);
+		if (ret)
+			dev_err(&client->dev, "unable to request IRQ\n");
+	}
+
+	if (!device_can_wakeup(&client->dev))
+		device_init_wakeup(&client->dev, 1);
+
 	sd3078_enable_reg_write(sd3078);
 
+	return ret;
+}
+
+#if CONFIG_PM_SLEEP
+static int sd3078_suspend(struct device *dev)
+{
+	struct sd3078 *sd3078 = dev_get_drvdata(dev);
+	struct i2c_client *client = to_i2c_client(dev);
+
+	if (client->irq >= 0 && device_may_wakeup(dev)) {
+		sd3078->suspended = true;
+		enable_irq_wake(client->irq);
+	}
+
+	return 0;
+}
+
+static int sd3078_resume(struct device *dev)
+{
+	struct sd3078 *sd3078 = dev_get_drvdata(dev);
+	struct i2c_client *client = to_i2c_client(dev);
+
+	if (client->irq >= 0 && device_may_wakeup(dev)) {
+		sd3078->suspended = false;
+		disable_irq_wake(client->irq);
+	}
+
 	return 0;
 }
+#endif
+
+static const struct dev_pm_ops sd3078_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(sd3078_suspend, sd3078_resume)
+};
 
 static const struct i2c_device_id sd3078_id[] = {
 	{"sd3078", 0},
@@ -217,6 +523,7 @@ static struct i2c_driver sd3078_driver = {
 	.driver     = {
 		.name   = "sd3078",
 		.of_match_table = of_match_ptr(rtc_dt_match),
+		.pm = &sd3078_pm_ops,
 	},
 	.probe      = sd3078_probe,
 	.id_table   = sd3078_id,
-- 
2.7.4


