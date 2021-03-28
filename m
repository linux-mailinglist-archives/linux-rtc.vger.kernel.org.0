Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99A0834BF4E
	for <lists+linux-rtc@lfdr.de>; Sun, 28 Mar 2021 23:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbhC1V3d (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 28 Mar 2021 17:29:33 -0400
Received: from clab.compulab.co.il ([66.147.238.35]:44316 "EHLO
        clab.compulab.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbhC1V3S (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 28 Mar 2021 17:29:18 -0400
X-Greylist: delayed 1591 seconds by postgrey-1.27 at vger.kernel.org; Sun, 28 Mar 2021 17:29:17 EDT
Received: from [37.142.126.90] (port=46476 helo=zimbra01.compulab.co.il)
        by clab.compulab.co.il with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <kirill.kapranov@compulab.co.il>)
        id 1lQcYc-0033Oa-Ov; Sun, 28 Mar 2021 17:02:51 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id 982C1E81CB001;
        Mon, 29 Mar 2021 00:02:49 +0300 (IDT)
Received: from zimbra01.compulab.co.il ([127.0.0.1])
        by localhost (zimbra01.compulab.co.il [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Jm5APFot9XNg; Mon, 29 Mar 2021 00:02:49 +0300 (IDT)
Received: from localhost (localhost [127.0.0.1])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id 524A2E81CB017;
        Mon, 29 Mar 2021 00:02:49 +0300 (IDT)
X-Virus-Scanned: amavisd-new at zimbra01.compulab.co.il
Received: from zimbra01.compulab.co.il ([127.0.0.1])
        by localhost (zimbra01.compulab.co.il [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id uOalATY9TEXk; Mon, 29 Mar 2021 00:02:49 +0300 (IDT)
Received: from kkk.compulab.local (lifshitz-linux.compulab.local [192.168.11.10])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id 40FF9E81CB001;
        Mon, 29 Mar 2021 00:02:49 +0300 (IDT)
From:   Kirill Kapranov <kirill.kapranov@compulab.co.il>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        phdm@macqel.be, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Kirill Kapranov <kirill.kapranov@compulab.co.il>
Subject: [PATCH 2/4] rtc: abx80x: Enable SQW output
Date:   Mon, 29 Mar 2021 00:02:30 +0300
Message-Id: <20210328210232.10395-3-kirill.kapranov@compulab.co.il>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210328210232.10395-1-kirill.kapranov@compulab.co.il>
References: <20210328210232.10395-1-kirill.kapranov@compulab.co.il>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - clab.compulab.co.il
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
X-Get-Message-Sender-Via: clab.compulab.co.il: mailgid no entry from get_recent_authed_mail_ips_entry
X-Authenticated-Sender: clab.compulab.co.il: 
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The RTCs of the family are able to produce square wave output for RTC
calibration purposes or for an external usage.

Signed-off-by: Kirill Kapranov <kirill.kapranov@compulab.co.il>
---
 drivers/rtc/rtc-abx80x.c | 126 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 9b0138d07232..153d89b56da9 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -51,6 +51,9 @@
 #define ABX8XX_IRQ_AIE		BIT(2)
 #define ABX8XX_IRQ_IM_1_4	(0x3 << 5)
 
+#define ABX8XX_REG_SQW		0x13
+#define ABX8XX_SQW_MODE_BITS	5
+
 #define ABX8XX_REG_CD_TIMER_CTL	0x18
 
 #define ABX8XX_REG_OSC		0x1c
@@ -117,6 +120,15 @@ struct abx80x_priv {
 	struct watchdog_device wdog;
 };
 
+union abx8xx_reg_sqw {
+	struct {
+		unsigned int sqws:5;
+		int:2;
+		unsigned int sqwe:2;
+	};
+	int val;
+} __packed;
+
 static int abx80x_write_config_key(struct i2c_client *client, u8 key)
 {
 	if (i2c_smbus_write_byte_data(client, ABX8XX_REG_CFG_KEY, key) < 0) {
@@ -486,9 +498,119 @@ static ssize_t oscillator_show(struct device *dev,
 
 static DEVICE_ATTR_RW(oscillator);
 
+#define SQFS_COUNT (1 << ABX8XX_SQW_MODE_BITS)
+/* The index of the array is the value to be written to the 'Square Wave Function
+ * Select' register to make the RTC generate the required square wave.
+ */
+static const char *const sqfs[SQFS_COUNT] = {
+	"1_century", "32768_Hz", "8192_Hz", "4096_Hz",
+	"2048_Hz", "1024_Hz", "512_Hz", "256_Hz",
+	"128_Hz", "64_Hz", "32_Hz", "16_Hz",
+	"8_Hz", "4_Hz", "2_Hz", "1_Hz",
+	"1/2_Hz", "1/4_Hz", "1/8_Hz", "1/16_Hz",
+	"1/32_Hz", "1_min", "16384_Hz", "100_Hz",
+	"1_hour", "1_day", "TIRQ", "nTIRQ",
+	"1_year", "1_Hz_to_Counters", "1/32_Hz_from_Acal", "1/8_Hz_from_Acal",
+};
+
+static const bool valid_for_rc_mode[SQFS_COUNT] = {
+	true, false, false, false,
+	false, false, false, false,
+	true, true, true, true,
+	true, true, true, true,
+	true, true, true, true,
+	true, true, false, false,
+	true, true, true, true,
+	true, true, true, true,
+};
+
+static int sqw_set(struct i2c_client *client, const char *buf)
+{
+	union abx8xx_reg_sqw reg_sqw;
+	int retval;
+
+	reg_sqw.val = i2c_smbus_read_byte_data(client, ABX8XX_REG_SQW);
+	if (reg_sqw.val < 0)
+		goto err;
+
+	if (sysfs_streq(buf, "none")) {
+		reg_sqw.sqwe = 0;
+		dev_info(&client->dev, "sqw output disabled\n");
+	} else {
+		int idx = __sysfs_match_string(sqfs, SQFS_COUNT, buf);
+
+		if (idx < 0)
+			return idx;
+
+		if (abx80x_is_rc_mode(client) && !valid_for_rc_mode[idx])
+			dev_warn(&client->dev, "sqw frequency %s valid only in xt mode\n",
+				sqfs[idx]);
+
+		dev_info(&client->dev, "sqw output enabled @ %s\n", sqfs[idx]);
+		reg_sqw.sqwe = 1;
+		reg_sqw.sqws = idx;
+	}
+
+	retval = i2c_smbus_write_byte_data(client, ABX8XX_REG_SQW, reg_sqw.val);
+	if (retval < 0)
+		goto err;
+
+	return 0;
+err:
+	dev_err(&client->dev, "Failed to set SQW\n");
+	return retval;
+
+}
+
+static ssize_t sqw_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t count)
+{
+	int retval;
+
+	retval = sqw_set(to_i2c_client(dev->parent), buf);
+	if (retval)
+		return retval;
+	else
+		return count;
+}
+
+static ssize_t sqw_show(struct device *dev,
+			struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	union abx8xx_reg_sqw reg_sqw;
+	int len = 0;
+	int i;
+
+	reg_sqw.val = i2c_smbus_read_byte_data(client, ABX8XX_REG_SQW);
+	if (reg_sqw.val < 0) {
+		dev_err(dev, "Failed to read SQW\n");
+		sprintf(buf, "\n");
+		return reg_sqw.val;
+	}
+
+	if (reg_sqw.sqwe)
+		len += scnprintf(buf+len, PAGE_SIZE - len, "none ");
+	else
+		len += scnprintf(buf+len, PAGE_SIZE - len, "[none] ");
+
+	for (i = 0; i < SQFS_COUNT; ++i) {
+		if (reg_sqw.sqwe && i == reg_sqw.sqws)
+			len += scnprintf(buf+len, PAGE_SIZE - len, "[%s] ", sqfs[i]);
+		else
+			len += scnprintf(buf+len, PAGE_SIZE - len, "%s ", sqfs[i]);
+	}
+
+	return len;
+}
+
+static DEVICE_ATTR_RW(sqw);
+
 static struct attribute *rtc_calib_attrs[] = {
 	&dev_attr_autocalibration.attr,
 	&dev_attr_oscillator.attr,
+	&dev_attr_sqw.attr,
 	NULL,
 };
 
@@ -686,6 +808,7 @@ static int abx80x_probe(struct i2c_client *client,
 	unsigned int lot;
 	unsigned int wafer;
 	unsigned int uid;
+	const char *sqw_mode_name;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
@@ -800,6 +923,9 @@ static int abx80x_probe(struct i2c_client *client,
 		abx80x_enable_trickle_charger(client, trickle_cfg);
 	}
 
+	if (!of_property_read_string(np, "sqw", &sqw_mode_name))
+		sqw_set(client, sqw_mode_name);
+
 	err = i2c_smbus_write_byte_data(client, ABX8XX_REG_CD_TIMER_CTL,
 					BIT(2));
 	if (err)
-- 
2.11.0

