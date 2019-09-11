Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2614B007F
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2019 17:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbfIKPs3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 11 Sep 2019 11:48:29 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:55100 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728271AbfIKPs3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 11 Sep 2019 11:48:29 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 46T5sP06Mqz1r7hg;
        Wed, 11 Sep 2019 17:48:24 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 46T5sN69pbz1qqkw;
        Wed, 11 Sep 2019 17:48:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id FKitvMXOmW3W; Wed, 11 Sep 2019 17:48:22 +0200 (CEST)
X-Auth-Info: xd2sm1XRNSYrwIX2giQpW1xnFCUOjECH5odT+gLl0rg=
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 11 Sep 2019 17:48:22 +0200 (CEST)
From:   Lukasz Majewski <lukma@denx.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukasz Majewski <lukma@denx.de>
Subject: [PATCH] rtc: Add support for century bits to m41t62 (rv4162) RTC devices
Date:   Wed, 11 Sep 2019 17:48:03 +0200
Message-Id: <20190911154803.15969-1-lukma@denx.de>
X-Mailer: git-send-email 2.11.0
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This change adds support for 'century bits' on 4162 family of RTC devices
(from ST or microcrystal), which allow storing time beyond year 2099.

For rv4162 century bits - CB1[7]:CB0[6] are stored in reg6 - 0x6 (MONTH):
CB1  CB0
 0    0      (year 2000 - 2099)
 0    1      (year 2100 - 2199)
 1    0      (year 2200 - 2299)
 1    1      (year 2300 - 2399)

The driver has been also adjusted to allow setting time up to year 2399
if the M41T80_FEATURE_CB is set in its DTS/I2C data.

There shall be no functional changes for devices not supporting this
feature. However, other devices - like m41t80 - have different approaches
to handle century information.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 drivers/rtc/rtc-m41t80.c | 56 +++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 9fdc284c943b..5452ab693568 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -68,9 +68,22 @@
 #define M41T80_FEATURE_SQ	BIT(2)	/* Squarewave feature */
 #define M41T80_FEATURE_WD	BIT(3)	/* Extra watchdog resolution */
 #define M41T80_FEATURE_SQ_ALT	BIT(4)	/* RSx bits are in reg 4 */
+#define M41T80_FEATURE_CB	BIT(5)	/* Century Bits[CB1:CB0] are in reg 6 */
+
+/*
+ * Century bits - CB1[7]:CB0[6] in reg6 (MONTH):
+ * CB1  CB0
+ * 0    0      (year 2000 - 2099)
+ * 0    1      (year 2100 - 2199)
+ * 1    0      (year 2200 - 2299)
+ * 1    1      (year 2300 - 2399)
+ */
+#define M41T80_CB_SHIFT         6       /* CB[0] bit position */
+#define M41T80_CB_MASK          0xc0    /* Century bits mask */
 
 static const struct i2c_device_id m41t80_id[] = {
-	{ "m41t62", M41T80_FEATURE_SQ | M41T80_FEATURE_SQ_ALT },
+	{ "m41t62", M41T80_FEATURE_SQ | M41T80_FEATURE_SQ_ALT |
+	  M41T80_FEATURE_CB},
 	{ "m41t65", M41T80_FEATURE_HT | M41T80_FEATURE_WD },
 	{ "m41t80", M41T80_FEATURE_SQ },
 	{ "m41t81", M41T80_FEATURE_HT | M41T80_FEATURE_SQ},
@@ -80,7 +93,8 @@ static const struct i2c_device_id m41t80_id[] = {
 	{ "m41st84", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
 	{ "m41st85", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
 	{ "m41st87", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
-	{ "rv4162", M41T80_FEATURE_SQ | M41T80_FEATURE_WD | M41T80_FEATURE_SQ_ALT },
+	{ "rv4162", M41T80_FEATURE_SQ | M41T80_FEATURE_WD |
+	  M41T80_FEATURE_SQ_ALT | M41T80_FEATURE_CB},
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, m41t80_id);
@@ -88,7 +102,8 @@ MODULE_DEVICE_TABLE(i2c, m41t80_id);
 static const struct of_device_id m41t80_of_match[] = {
 	{
 		.compatible = "st,m41t62",
-		.data = (void *)(M41T80_FEATURE_SQ | M41T80_FEATURE_SQ_ALT)
+		.data = (void *)(M41T80_FEATURE_SQ | M41T80_FEATURE_SQ_ALT |
+				 M41T80_FEATURE_CB)
 	},
 	{
 		.compatible = "st,m41t65",
@@ -128,16 +143,19 @@ static const struct of_device_id m41t80_of_match[] = {
 	},
 	{
 		.compatible = "microcrystal,rv4162",
-		.data = (void *)(M41T80_FEATURE_SQ | M41T80_FEATURE_WD | M41T80_FEATURE_SQ_ALT)
+		.data = (void *)(M41T80_FEATURE_SQ | M41T80_FEATURE_WD |
+				 M41T80_FEATURE_SQ_ALT | M41T80_FEATURE_CB)
 	},
 	/* DT compatibility only, do not use compatibles below: */
 	{
 		.compatible = "st,rv4162",
-		.data = (void *)(M41T80_FEATURE_SQ | M41T80_FEATURE_WD | M41T80_FEATURE_SQ_ALT)
+		.data = (void *)(M41T80_FEATURE_SQ | M41T80_FEATURE_WD |
+				 M41T80_FEATURE_SQ_ALT | M41T80_FEATURE_CB)
 	},
 	{
 		.compatible = "rv4162",
-		.data = (void *)(M41T80_FEATURE_SQ | M41T80_FEATURE_WD | M41T80_FEATURE_SQ_ALT)
+		.data = (void *)(M41T80_FEATURE_SQ | M41T80_FEATURE_WD |
+				 M41T80_FEATURE_SQ_ALT | M41T80_FEATURE_CB)
 	},
 	{ }
 };
@@ -197,6 +215,7 @@ static irqreturn_t m41t80_handle_irq(int irq, void *dev_id)
 static int m41t80_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct m41t80_data *clientdata = i2c_get_clientdata(client);
 	unsigned char buf[8];
 	int err, flags;
 
@@ -222,9 +241,13 @@ static int m41t80_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	tm->tm_mday = bcd2bin(buf[M41T80_REG_DAY] & 0x3f);
 	tm->tm_wday = buf[M41T80_REG_WDAY] & 0x07;
 	tm->tm_mon = bcd2bin(buf[M41T80_REG_MON] & 0x1f) - 1;
-
-	/* assume 20YY not 19YY, and ignore the Century Bit */
+	/* assume 20YY not 19YY */
 	tm->tm_year = bcd2bin(buf[M41T80_REG_YEAR]) + 100;
+
+	if (clientdata->features & M41T80_FEATURE_CB)
+		tm->tm_year += ((buf[M41T80_REG_MON] & M41T80_CB_MASK)
+				>> M41T80_CB_SHIFT) * 100;
+
 	return 0;
 }
 
@@ -232,10 +255,13 @@ static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct m41t80_data *clientdata = i2c_get_clientdata(client);
+	int err, flags, max_year = 199;
 	unsigned char buf[8];
-	int err, flags;
 
-	if (tm->tm_year < 100 || tm->tm_year > 199)
+	if (clientdata->features & M41T80_FEATURE_CB)
+		max_year = 499;
+
+	if (tm->tm_year < 100 || tm->tm_year > max_year)
 		return -EINVAL;
 
 	buf[M41T80_REG_SSEC] = 0;
@@ -243,8 +269,14 @@ static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	buf[M41T80_REG_MIN] = bin2bcd(tm->tm_min);
 	buf[M41T80_REG_HOUR] = bin2bcd(tm->tm_hour);
 	buf[M41T80_REG_DAY] = bin2bcd(tm->tm_mday);
-	buf[M41T80_REG_MON] = bin2bcd(tm->tm_mon + 1);
-	buf[M41T80_REG_YEAR] = bin2bcd(tm->tm_year - 100);
+	if (clientdata->features & M41T80_FEATURE_CB) {
+		buf[M41T80_REG_YEAR] = bin2bcd((tm->tm_year - 100) % 100);
+		buf[M41T80_REG_MON] = bin2bcd(tm->tm_mon + 1) |
+			(((tm->tm_year - 100) / 100) << M41T80_CB_SHIFT);
+	} else {
+		buf[M41T80_REG_MON] = bin2bcd(tm->tm_mon + 1);
+		buf[M41T80_REG_YEAR] = bin2bcd(tm->tm_year - 100);
+	}
 	buf[M41T80_REG_WDAY] = tm->tm_wday;
 
 	/* If the square wave output is controlled in the weekday register */
-- 
2.20.1

