Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCFE43230B
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Oct 2021 17:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232585AbhJRPjO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Oct 2021 11:39:14 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:49309 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231590AbhJRPjN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Oct 2021 11:39:13 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D6CE7C0009;
        Mon, 18 Oct 2021 15:36:57 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] rtc: pcf8523: add BSM support
Date:   Mon, 18 Oct 2021 17:36:50 +0200
Message-Id: <20211018153651.82069-5-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018153651.82069-1-alexandre.belloni@bootlin.com>
References: <20211018153651.82069-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Backup Switch Mode allows to select the strategy to use to switch from the
main power supply to the backup power supply. As before, the driver will
switch from standby mode to level mode but now only when it has never been
set.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf8523.c | 103 +++++++++++++++++++++++++++++++++++---
 1 file changed, 97 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index 181c3425d6c7..c93acade7205 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bcd.h>
+#include <linux/bitfield.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
@@ -20,10 +21,8 @@
 #define PCF8523_CONTROL2_AF BIT(3)
 
 #define PCF8523_REG_CONTROL3 0x02
-#define PCF8523_CONTROL3_PM_BLD BIT(7) /* battery low detection disabled */
-#define PCF8523_CONTROL3_PM_VDD BIT(6) /* switch-over disabled */
-#define PCF8523_CONTROL3_PM_DSM BIT(5) /* direct switching mode */
-#define PCF8523_CONTROL3_PM_MASK 0xe0
+#define PCF8523_CONTROL3_PM  GENMASK(7,5)
+#define PCF8523_PM_STANDBY   0x7
 #define PCF8523_CONTROL3_BLF BIT(2) /* battery low bit, read-only */
 #define PCF8523_CONTROL3_BSF BIT(3)
 
@@ -237,6 +236,83 @@ static int pcf8523_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
 	return 0;
 }
 
+static int pcf8523_param_get(struct device *dev, struct rtc_param *param)
+{
+	struct pcf8523 *pcf8523 = dev_get_drvdata(dev);
+	int ret;
+
+	switch(param->param) {
+		u32 value;
+
+	case RTC_PARAM_BACKUP_SWITCH_MODE:
+		ret = regmap_read(pcf8523->regmap, PCF8523_REG_CONTROL3, &value);
+		if (ret < 0)
+			return ret;
+
+		value = FIELD_GET(PCF8523_CONTROL3_PM, value);
+
+		switch(value) {
+		case 0x0:
+		case 0x4:
+			param->uvalue = RTC_BSM_LEVEL;
+			break;
+		case 0x1:
+		case 0x5:
+			param->uvalue = RTC_BSM_DIRECT;
+			break;
+		case PCF8523_PM_STANDBY:
+			param->uvalue = RTC_BSM_STANDBY;
+			break;
+		default:
+			param->uvalue = RTC_BSM_DISABLED;
+		}
+
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int pcf8523_param_set(struct device *dev, struct rtc_param *param)
+{
+	struct pcf8523 *pcf8523 = dev_get_drvdata(dev);
+
+	switch(param->param) {
+		u8 mode;
+	case RTC_PARAM_BACKUP_SWITCH_MODE:
+		switch (param->uvalue) {
+		case RTC_BSM_DISABLED:
+			mode = 0x2;
+			break;
+		case RTC_BSM_DIRECT:
+			mode = 0x1;
+			break;
+		case RTC_BSM_LEVEL:
+			mode = 0x0;
+			break;
+		case RTC_BSM_STANDBY:
+			mode = PCF8523_PM_STANDBY;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		return regmap_update_bits(pcf8523->regmap, PCF8523_REG_CONTROL3,
+					  PCF8523_CONTROL3_PM,
+					  FIELD_PREP(PCF8523_CONTROL3_PM, mode));
+
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int pcf8523_rtc_ioctl(struct device *dev, unsigned int cmd,
 			     unsigned long arg)
 {
@@ -312,6 +388,8 @@ static const struct rtc_class_ops pcf8523_rtc_ops = {
 	.ioctl = pcf8523_rtc_ioctl,
 	.read_offset = pcf8523_rtc_read_offset,
 	.set_offset = pcf8523_rtc_set_offset,
+	.param_get = pcf8523_param_get,
+	.param_set = pcf8523_param_set,
 };
 
 static const struct regmap_config regmap_config = {
@@ -326,6 +404,7 @@ static int pcf8523_probe(struct i2c_client *client,
 	struct pcf8523 *pcf8523;
 	struct rtc_device *rtc;
 	bool wakeup_source = false;
+	u32 value;
 	int err;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
@@ -351,11 +430,23 @@ static int pcf8523_probe(struct i2c_client *client,
 		dev_warn(&client->dev, "failed to set xtal load capacitance: %d",
 			 err);
 
-	err = regmap_update_bits(pcf8523->regmap, PCF8523_REG_CONTROL3,
-				 PCF8523_CONTROL3_PM_MASK, 0);
+	err = regmap_read(pcf8523->regmap, PCF8523_REG_SECONDS, &value);
 	if (err < 0)
 		return err;
 
+	if (value & PCF8523_SECONDS_OS) {
+		err = regmap_read(pcf8523->regmap, PCF8523_REG_CONTROL3, &value);
+		if (err < 0)
+			return err;
+
+		if (FIELD_GET(PCF8523_CONTROL3_PM, value) == PCF8523_PM_STANDBY) {
+			err = regmap_write(pcf8523->regmap, PCF8523_REG_CONTROL3,
+					   value & ~PCF8523_CONTROL3_PM);
+			if (err < 0)
+				return err;
+		}
+	}
+
 	rtc->ops = &pcf8523_rtc_ops;
 	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rtc->range_max = RTC_TIMESTAMP_END_2099;
-- 
2.31.1

