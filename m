Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C338E34BF4C
	for <lists+linux-rtc@lfdr.de>; Sun, 28 Mar 2021 23:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbhC1V3f (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 28 Mar 2021 17:29:35 -0400
Received: from clab.compulab.co.il ([66.147.238.35]:44336 "EHLO
        clab.compulab.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231349AbhC1V33 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 28 Mar 2021 17:29:29 -0400
Received: from [37.142.126.90] (port=46500 helo=zimbra01.compulab.co.il)
        by clab.compulab.co.il with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <kirill.kapranov@compulab.co.il>)
        id 1lQcYh-0033P1-1w; Sun, 28 Mar 2021 17:02:55 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id D6D0AE81CB017;
        Mon, 29 Mar 2021 00:02:53 +0300 (IDT)
Received: from zimbra01.compulab.co.il ([127.0.0.1])
        by localhost (zimbra01.compulab.co.il [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Iwfr1OyVmwMC; Mon, 29 Mar 2021 00:02:53 +0300 (IDT)
Received: from localhost (localhost [127.0.0.1])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id 89B52E81CB001;
        Mon, 29 Mar 2021 00:02:53 +0300 (IDT)
X-Virus-Scanned: amavisd-new at zimbra01.compulab.co.il
Received: from zimbra01.compulab.co.il ([127.0.0.1])
        by localhost (zimbra01.compulab.co.il [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id ZQH0TALIweh9; Mon, 29 Mar 2021 00:02:53 +0300 (IDT)
Received: from kkk.compulab.local (lifshitz-linux.compulab.local [192.168.11.10])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id 7818FE81CB017;
        Mon, 29 Mar 2021 00:02:53 +0300 (IDT)
From:   Kirill Kapranov <kirill.kapranov@compulab.co.il>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        phdm@macqel.be, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Kirill Kapranov <kirill.kapranov@compulab.co.il>
Subject: [PATCH 4/4] rtc:abx80x: Enable xt digital calibration
Date:   Mon, 29 Mar 2021 00:02:32 +0300
Message-Id: <20210328210232.10395-5-kirill.kapranov@compulab.co.il>
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

The XT digital calibration feature allows to improve the RTC accuracy,
using a Distributed Digital Calibration function.
See ch. 5.9.1 of AB08XX Series Ultra Low Power RTC IC User's Guide
https://abracon.com/realtimeclock/AB08XX-Application-Manual.pdf

Signed-off-by: Kirill Kapranov <kirill.kapranov@compulab.co.il>
---
 drivers/rtc/rtc-abx80x.c | 145 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 153d89b56da9..e13fa88e87a5 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -54,6 +54,9 @@
 #define ABX8XX_REG_SQW		0x13
 #define ABX8XX_SQW_MODE_BITS	5
 
+#define ABX8XX_REG_CAL_XT	0x14
+#define ABX8XX_CAL_XT_OFFSETX_MASK	GENMASK(6, 0)
+
 #define ABX8XX_REG_CD_TIMER_CTL	0x18
 
 #define ABX8XX_REG_OSC		0x1c
@@ -120,6 +123,22 @@ struct abx80x_priv {
 	struct watchdog_device wdog;
 };
 
+union abx8xx_reg_cal_xt {
+	struct {
+		int offsetx:7;
+		unsigned int cmdx:1;
+	};
+	int val;
+} __packed;
+
+union abx8xx_reg_oss {
+	struct {
+		int:6;
+		unsigned int xtcal:2;
+	};
+	int val;
+} __packed;
+
 union abx8xx_reg_sqw {
 	struct {
 		unsigned int sqws:5;
@@ -498,6 +517,123 @@ static ssize_t oscillator_show(struct device *dev,
 
 static DEVICE_ATTR_RW(oscillator);
 
+static const int xt_freq_nom = 32768000; //Nominal XT frequency 32 kHz in mHz
+
+static int xt_frequency_set(struct i2c_client *client, u32 xt_freq)
+{
+	int retval;
+	long Adj;
+	union abx8xx_reg_cal_xt reg_cal_xt;
+	union abx8xx_reg_oss reg_oss;
+
+	retval	= i2c_smbus_read_byte_data(client, ABX8XX_REG_OSS);
+	if (retval < 0)
+		goto err;
+	reg_oss.val = retval;
+
+	Adj = (xt_freq_nom - (int)xt_freq) * 16 / 1000;
+	if (Adj < -320) {
+		dev_err(&client->dev,
+			"The XT oscillator is too fast to be adjusted\n");
+		return -ERANGE;
+	} else if (Adj < -256) {
+		reg_oss.xtcal = 3;
+		reg_cal_xt.cmdx = 1;
+		reg_cal_xt.offsetx = (Adj + 192) / 2;
+	} else if (Adj < -192) {
+		reg_oss.xtcal = 3;
+		reg_cal_xt.cmdx = 0;
+		reg_cal_xt.offsetx = Adj + 192;
+	} else if (Adj < -128) {
+		reg_oss.xtcal = 2;
+		reg_cal_xt.cmdx = 0;
+		reg_cal_xt.offsetx = Adj + 128;
+	} else if (Adj < -64) {
+		reg_oss.xtcal = 1;
+		reg_cal_xt.cmdx = 0;
+		reg_cal_xt.offsetx = Adj + 64;
+	} else if (Adj < 64) {
+		reg_oss.xtcal = 0;
+		reg_cal_xt.cmdx = 0;
+		reg_cal_xt.offsetx = Adj;
+	} else if (Adj < 128) {
+		reg_oss.xtcal = 0;
+		reg_cal_xt.cmdx = 1;
+		reg_cal_xt.offsetx = Adj / 2;
+	} else {
+		dev_err(&client->dev,
+			"The XT oscillator is too slow to be adjusted\n");
+		return -ERANGE;
+	}
+
+	retval = i2c_smbus_write_byte_data(client, ABX8XX_REG_OSS,
+			reg_oss.val);
+	if (retval < 0)
+		goto err;
+
+	retval = i2c_smbus_write_byte_data(client, ABX8XX_REG_CAL_XT,
+			reg_cal_xt.val);
+	if (retval < 0)
+		goto err;
+
+	return 0;
+err:
+	dev_err(&client->dev, "Failed to access calibration data\n");
+	return retval;
+}
+
+static ssize_t xt_frequency_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	int retval;
+	unsigned long xt_freq;
+
+	retval = kstrtoul(buf, 10, &xt_freq);
+	if (retval < 0) {
+		dev_err(dev, "Invalid value of oscillator frequency\n");
+		return -EINVAL;
+	}
+
+	dev_info(dev, "Computed xt osc drift is %li ppm\n",
+		1000000l * ((long)xt_freq - xt_freq_nom) / xt_freq_nom);
+
+	retval = xt_frequency_set(to_i2c_client(dev->parent), xt_freq);
+	if (retval)
+		return retval;
+	return count;
+}
+
+static DEVICE_ATTR_WO(xt_frequency);
+
+static ssize_t xt_calibration_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	int retval;
+	union abx8xx_reg_cal_xt reg_cal_xt;
+	union abx8xx_reg_oss reg_oss;
+	struct i2c_client *client = to_i2c_client(dev->parent);
+
+	retval = i2c_smbus_read_byte_data(client, ABX8XX_REG_OSS);
+	if (retval < 0)
+		goto err;
+	reg_oss.val = retval;
+
+	retval = i2c_smbus_read_byte_data(client, ABX8XX_REG_CAL_XT);
+	if (retval < 0)
+		goto err;
+	reg_cal_xt.val = retval;
+
+	return sprintf(buf, "XTCAL %x\nCMDX %x\nOFFSETX %i = 0x%lx\n",
+			reg_oss.xtcal, reg_cal_xt.cmdx, reg_cal_xt.offsetx,
+			reg_cal_xt.offsetx & ABX8XX_CAL_XT_OFFSETX_MASK);
+err:
+	dev_err(dev, "Failed to read calibration data\n");
+	sprintf(buf, "\n");
+	return retval;
+}
+static DEVICE_ATTR_RO(xt_calibration);
+
 #define SQFS_COUNT (1 << ABX8XX_SQW_MODE_BITS)
 /* The index of the array is the value to be written to the 'Square Wave Function
  * Select' register to make the RTC generate the required square wave.
@@ -611,6 +747,8 @@ static struct attribute *rtc_calib_attrs[] = {
 	&dev_attr_autocalibration.attr,
 	&dev_attr_oscillator.attr,
 	&dev_attr_sqw.attr,
+	&dev_attr_xt_calibration.attr,
+	&dev_attr_xt_frequency.attr,
 	NULL,
 };
 
@@ -809,6 +947,7 @@ static int abx80x_probe(struct i2c_client *client,
 	unsigned int wafer;
 	unsigned int uid;
 	const char *sqw_mode_name;
+	unsigned int xt_freq;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
@@ -923,6 +1062,12 @@ static int abx80x_probe(struct i2c_client *client,
 		abx80x_enable_trickle_charger(client, trickle_cfg);
 	}
 
+	if (!of_property_read_u32(np, "xt-frequency", &xt_freq)) {
+		dev_info(&client->dev, "Calibrate XT %d mHz:\n",
+		xt_freq);
+		xt_frequency_set(client, xt_freq);
+	}
+
 	if (!of_property_read_string(np, "sqw", &sqw_mode_name))
 		sqw_set(client, sqw_mode_name);
 
-- 
2.11.0

