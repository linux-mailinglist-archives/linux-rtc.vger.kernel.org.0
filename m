Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC0A1FAF6A
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jun 2020 13:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbgFPLmG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Jun 2020 07:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgFPLmG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Jun 2020 07:42:06 -0400
Received: from mail.net18.km6g.us (mail.net18.km6g.us [IPv6:2607:5300:203:24b0:3::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2994C08C5C2
        for <linux-rtc@vger.kernel.org>; Tue, 16 Jun 2020 04:42:04 -0700 (PDT)
Received: from [2001:470:8afe:60:716b:c9b9:d55a:f6f1] (helo=balrog20.km6g.us)
        by mail.net18.km6g.us with esmtp (Exim 4.94 (FreeBSD))
        (envelope-from <kevin+linux@km6g.us>)
        id 1jl9yZ-0002Az-Sl; Tue, 16 Jun 2020 07:41:59 -0400
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org
Cc:     "Kevin P. Fleming" <kevin+linux@km6g.us>
Subject: [PATCH RFC] rtc: abx80x: Add attributes to control oscillator switching modes
Date:   Tue, 16 Jun 2020 07:41:50 -0400
Message-Id: <20200616114150.95673-1-kevin+linux@km6g.us>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The devices supported by this driver have two oscillator switching
modes available which can switch from the crystal oscillator to
the RC oscillator when triggered by an event.

The 'AOS' mode switches to the RC oscillator when the primary power
supply is lost, and the device is operating on backup power. A boolean
device attribute named 'auto_osc_switch' controls this mode.

The 'FOS' mode switches to the RC oscillator when a failure of the
crystal oscillator has been detected by the device. A boolean device
attribute named 'fail_osc_switch' controls this mode.

Signed-off-by: Kevin P. Fleming <kevin+linux@km6g.us>
---
 drivers/rtc/rtc-abx80x.c | 163 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 151 insertions(+), 12 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 1b428fe2029ef..3a92015395417 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -55,10 +55,9 @@
 
 #define ABX8XX_REG_OSC		0x1c
 #define ABX8XX_OSC_FOS		BIT(3)
-#define ABX8XX_OSC_BOS		BIT(4)
+#define ABX8XX_OSC_AOS		BIT(4)
 #define ABX8XX_OSC_ACAL_512	BIT(5)
 #define ABX8XX_OSC_ACAL_1024	BIT(6)
-
 #define ABX8XX_OSC_OSEL		BIT(7)
 
 #define ABX8XX_REG_OSS		0x1d
@@ -136,15 +135,34 @@ static int abx80x_is_rc_mode(struct i2c_client *client)
 	int flags = 0;
 
 	flags =  i2c_smbus_read_byte_data(client, ABX8XX_REG_OSS);
-	if (flags < 0) {
-		dev_err(&client->dev,
-			"Failed to read autocalibration attribute\n");
+	if (flags < 0)
 		return flags;
-	}
 
 	return (flags & ABX8XX_OSS_OMODE) ? 1 : 0;
 }
 
+static int abx80x_is_auto_osc_switch_mode(struct i2c_client *client)
+{
+	int flags = 0;
+
+	flags =  i2c_smbus_read_byte_data(client, ABX8XX_REG_OSC);
+	if (flags < 0)
+		return flags;
+
+	return (flags & ABX8XX_OSC_AOS) ? 1 : 0;
+}
+
+static int abx80x_is_fail_osc_switch_mode(struct i2c_client *client)
+{
+	int flags = 0;
+
+	flags =  i2c_smbus_read_byte_data(client, ABX8XX_REG_OSC);
+	if (flags < 0)
+		return flags;
+
+	return (flags & ABX8XX_OSC_FOS) ? 1 : 0;
+}
+
 static int abx80x_set_autocal_filter(struct i2c_client *client, u8 filter_cfg)
 {
 	int err;
@@ -196,8 +214,11 @@ static int abx80x_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 	/* Read the Oscillator Failure only in XT mode */
 	rc_mode = abx80x_is_rc_mode(client);
-	if (rc_mode < 0)
+	if (rc_mode < 0) {
+		dev_err(&client->dev,
+			"Failed to read oscillator mode\n");
 		return rc_mode;
+	}
 
 	if (!rc_mode) {
 		flags = i2c_smbus_read_byte_data(client, ABX8XX_REG_OSS);
@@ -497,7 +518,7 @@ static ssize_t oscillator_show(struct device *dev,
 	rc_mode = abx80x_is_rc_mode(client);
 
 	if (rc_mode < 0) {
-		dev_err(dev, "Failed to read RTC oscillator selection\n");
+		dev_err(dev, "Failed to read oscillator mode\n");
 		sprintf(buf, "\n");
 		return rc_mode;
 	}
@@ -510,14 +531,132 @@ static ssize_t oscillator_show(struct device *dev,
 
 static DEVICE_ATTR_RW(oscillator);
 
-static struct attribute *rtc_calib_attrs[] = {
+static ssize_t auto_osc_switch_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	int retval, flags;
+	bool auto_osc_switch = false;
+
+	retval = kstrtobool(buf,  &auto_osc_switch);
+	if (retval < 0) {
+		dev_err(dev, "Failed to parse auto_osc_switch attribute\n");
+		return -EINVAL;
+	}
+
+	flags =  i2c_smbus_read_byte_data(client, ABX8XX_REG_OSC);
+	if (flags < 0)
+		return flags;
+
+	if (auto_osc_switch)
+		flags |= (ABX8XX_OSC_AOS);
+	else
+		flags &= ~(ABX8XX_OSC_AOS);
+
+	/* Unlock write access on Oscillator Control register */
+	if (abx80x_write_config_key(client, ABX8XX_CFG_KEY_OSC) < 0)
+		return -EIO;
+
+	retval = i2c_smbus_write_byte_data(client, ABX8XX_REG_OSC, flags);
+	if (retval < 0) {
+		dev_err(dev, "Failed to write Oscillator Control register\n");
+		return retval;
+	}
+
+	return retval ? retval : count;
+}
+
+static ssize_t auto_osc_switch_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	int aos_mode = 0;
+	struct i2c_client *client = to_i2c_client(dev->parent);
+
+	aos_mode = abx80x_is_auto_osc_switch_mode(client);
+
+	if (aos_mode < 0) {
+		dev_err(dev, "Failed to read RTC oscillator control register\n");
+		sprintf(buf, "\n");
+		return aos_mode;
+	}
+
+	if (aos_mode)
+		return sprintf(buf, "on\n");
+	else
+		return sprintf(buf, "off\n");
+}
+
+static DEVICE_ATTR_RW(auto_osc_switch);
+
+static ssize_t fail_osc_switch_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	int retval, flags;
+	bool fail_osc_switch = false;
+
+	retval = kstrtobool(buf,  &fail_osc_switch);
+	if (retval < 0) {
+		dev_err(dev, "Failed to parse fail_osc_switch attribute\n");
+		return -EINVAL;
+	}
+
+	flags =  i2c_smbus_read_byte_data(client, ABX8XX_REG_OSC);
+	if (flags < 0)
+		return flags;
+
+	if (fail_osc_switch)
+		flags |= (ABX8XX_OSC_FOS);
+	else
+		flags &= ~(ABX8XX_OSC_FOS);
+
+	/* Unlock write access on Oscillator Control register */
+	if (abx80x_write_config_key(client, ABX8XX_CFG_KEY_OSC) < 0)
+		return -EIO;
+
+	retval = i2c_smbus_write_byte_data(client, ABX8XX_REG_OSC, flags);
+	if (retval < 0) {
+		dev_err(dev, "Failed to write Oscillator Control register\n");
+		return retval;
+	}
+
+	return retval ? retval : count;
+}
+
+static ssize_t fail_osc_switch_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	int aos_mode = 0;
+	struct i2c_client *client = to_i2c_client(dev->parent);
+
+	aos_mode = abx80x_is_fail_osc_switch_mode(client);
+
+	if (aos_mode < 0) {
+		dev_err(dev, "Failed to read RTC oscillator control register\n");
+		sprintf(buf, "\n");
+		return aos_mode;
+	}
+
+	if (aos_mode)
+		return sprintf(buf, "on\n");
+	else
+		return sprintf(buf, "off\n");
+}
+
+static DEVICE_ATTR_RW(fail_osc_switch);
+
+static struct attribute *rtc_osc_ctrl_attrs[] = {
 	&dev_attr_autocalibration.attr,
 	&dev_attr_oscillator.attr,
+	&dev_attr_auto_osc_switch.attr,
+	&dev_attr_fail_osc_switch.attr,
 	NULL,
 };
 
-static const struct attribute_group rtc_calib_attr_group = {
-	.attrs		= rtc_calib_attrs,
+static const struct attribute_group rtc_osc_ctrl_attr_group = {
+	.attrs		= rtc_osc_ctrl_attrs,
 };
 
 static int abx80x_alarm_irq_enable(struct device *dev, unsigned int enabled)
@@ -871,7 +1010,7 @@ static int abx80x_probe(struct i2c_client *client,
 		}
 	}
 
-	err = rtc_add_group(priv->rtc, &rtc_calib_attr_group);
+	err = rtc_add_group(priv->rtc, &rtc_osc_ctrl_attr_group);
 	if (err) {
 		dev_err(&client->dev, "Failed to create sysfs group: %d\n",
 			err);
-- 
2.26.2

