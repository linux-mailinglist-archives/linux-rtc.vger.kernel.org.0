Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE9E42FBF4
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 21:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238085AbhJOT0O (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Oct 2021 15:26:14 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:35945 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbhJOT0N (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 15:26:13 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E41BA20003;
        Fri, 15 Oct 2021 19:24:05 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: pcf8523: avoid reading BLF in pcf8523_rtc_read_time
Date:   Fri, 15 Oct 2021 21:24:00 +0200
Message-Id: <20211015192400.818254-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

BLF, battery low doesn't mean the time is imprecise or invalid, it simply mean
the backup battery has to be replaced. This information can be read using the
VL_READ ioctl.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf8523.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index 8b6fb20774bf..09110b3ae25f 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -24,6 +24,7 @@
 #define PCF8523_CONTROL3_PM_DSM BIT(5) /* direct switching mode */
 #define PCF8523_CONTROL3_PM_MASK 0xe0
 #define PCF8523_CONTROL3_BLF BIT(2) /* battery low bit, read-only */
+#define PCF8523_CONTROL3_BSF BIT(3)
 
 #define PCF8523_REG_SECONDS  0x03
 #define PCF8523_SECONDS_OS BIT(7)
@@ -94,18 +95,6 @@ static int pcf8523_write(struct i2c_client *client, u8 reg, u8 value)
 	return 0;
 }
 
-static int pcf8523_voltage_low(struct i2c_client *client)
-{
-	u8 value;
-	int err;
-
-	err = pcf8523_read(client, PCF8523_REG_CONTROL3, &value);
-	if (err < 0)
-		return err;
-
-	return !!(value & PCF8523_CONTROL3_BLF);
-}
-
 static int pcf8523_load_capacitance(struct i2c_client *client)
 {
 	u32 load;
@@ -220,14 +209,6 @@ static int pcf8523_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	struct i2c_msg msgs[2];
 	int err;
 
-	err = pcf8523_voltage_low(client);
-	if (err < 0) {
-		return err;
-	} else if (err > 0) {
-		dev_err(dev, "low voltage detected, time is unreliable\n");
-		return -EINVAL;
-	}
-
 	msgs[0].addr = client->addr;
 	msgs[0].flags = 0;
 	msgs[0].len = 1;
@@ -412,10 +393,11 @@ static int pcf8523_rtc_ioctl(struct device *dev, unsigned int cmd,
 
 	switch (cmd) {
 	case RTC_VL_READ:
-		ret = pcf8523_voltage_low(client);
+		ret = pcf8523_read(client, PCF8523_REG_CONTROL3, &value);
 		if (ret < 0)
 			return ret;
-		if (ret)
+
+		if (value & PCF8523_CONTROL3_BLF)
 			flags |= RTC_VL_BACKUP_LOW;
 
 		ret = pcf8523_read(client, PCF8523_REG_SECONDS, &value);
-- 
2.31.1

