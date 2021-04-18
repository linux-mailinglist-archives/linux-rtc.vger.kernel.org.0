Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 157A53632BB
	for <lists+linux-rtc@lfdr.de>; Sun, 18 Apr 2021 02:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbhDRAA5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 17 Apr 2021 20:00:57 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:35323 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbhDRAA4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 17 Apr 2021 20:00:56 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 8CF5DC0002;
        Sun, 18 Apr 2021 00:00:27 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] rtc: ds1307: replace HAS_ALARM by RTC_FEATURE_ALARM
Date:   Sun, 18 Apr 2021 02:00:21 +0200
Message-Id: <20210418000023.995758-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The core now has RTC_FEATURE_ALARM for the driver to indicate whether
alarms are available. Use that instead of HAS_ALARM to ensure the alarm
callbacks are not even called.

Tested-by: Łukasz Stelmach <l.stelmach@samsung.com>
Reviewed-by: Łukasz Stelmach <l.stelmach@samsung.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1307.c | 42 +++++++---------------------------------
 1 file changed, 7 insertions(+), 35 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index cd8e438bc9c4..76d67c419f7d 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -171,7 +171,6 @@ struct ds1307 {
 	enum ds_type		type;
 	unsigned long		flags;
 #define HAS_NVRAM	0		/* bit 0 == sysfs file active */
-#define HAS_ALARM	1		/* bit 1 == irq claimed */
 	struct device		*dev;
 	struct regmap		*regmap;
 	const char		*name;
@@ -411,9 +410,6 @@ static int ds1337_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 	int			ret;
 	u8			regs[9];
 
-	if (!test_bit(HAS_ALARM, &ds1307->flags))
-		return -EINVAL;
-
 	/* read all ALARM1, ALARM2, and status registers at once */
 	ret = regmap_bulk_read(ds1307->regmap, DS1339_REG_ALARM1_SECS,
 			       regs, sizeof(regs));
@@ -454,9 +450,6 @@ static int ds1337_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	u8			control, status;
 	int			ret;
 
-	if (!test_bit(HAS_ALARM, &ds1307->flags))
-		return -EINVAL;
-
 	dev_dbg(dev, "%s secs=%d, mins=%d, "
 		"hours=%d, mday=%d, enabled=%d, pending=%d\n",
 		"alarm set", t->time.tm_sec, t->time.tm_min,
@@ -512,9 +505,6 @@ static int ds1307_alarm_irq_enable(struct device *dev, unsigned int enabled)
 {
 	struct ds1307		*ds1307 = dev_get_drvdata(dev);
 
-	if (!test_bit(HAS_ALARM, &ds1307->flags))
-		return -ENOTTY;
-
 	return regmap_update_bits(ds1307->regmap, DS1337_REG_CONTROL,
 				  DS1337_BIT_A1IE,
 				  enabled ? DS1337_BIT_A1IE : 0);
@@ -592,9 +582,6 @@ static int rx8130_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 	u8 ald[3], ctl[3];
 	int ret;
 
-	if (!test_bit(HAS_ALARM, &ds1307->flags))
-		return -EINVAL;
-
 	/* Read alarm registers. */
 	ret = regmap_bulk_read(ds1307->regmap, RX8130_REG_ALARM_MIN, ald,
 			       sizeof(ald));
@@ -634,9 +621,6 @@ static int rx8130_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	u8 ald[3], ctl[3];
 	int ret;
 
-	if (!test_bit(HAS_ALARM, &ds1307->flags))
-		return -EINVAL;
-
 	dev_dbg(dev, "%s, sec=%d min=%d hour=%d wday=%d mday=%d mon=%d "
 		"enabled=%d pending=%d\n", __func__,
 		t->time.tm_sec, t->time.tm_min, t->time.tm_hour,
@@ -681,9 +665,6 @@ static int rx8130_alarm_irq_enable(struct device *dev, unsigned int enabled)
 	struct ds1307 *ds1307 = dev_get_drvdata(dev);
 	int ret, reg;
 
-	if (!test_bit(HAS_ALARM, &ds1307->flags))
-		return -EINVAL;
-
 	ret = regmap_read(ds1307->regmap, RX8130_REG_CONTROL0, &reg);
 	if (ret < 0)
 		return ret;
@@ -735,9 +716,6 @@ static int mcp794xx_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 	u8 regs[10];
 	int ret;
 
-	if (!test_bit(HAS_ALARM, &ds1307->flags))
-		return -EINVAL;
-
 	/* Read control and alarm 0 registers. */
 	ret = regmap_bulk_read(ds1307->regmap, MCP794XX_REG_CONTROL, regs,
 			       sizeof(regs));
@@ -793,9 +771,6 @@ static int mcp794xx_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	unsigned char regs[10];
 	int wday, ret;
 
-	if (!test_bit(HAS_ALARM, &ds1307->flags))
-		return -EINVAL;
-
 	wday = mcp794xx_alm_weekday(dev, &t->time);
 	if (wday < 0)
 		return wday;
@@ -842,9 +817,6 @@ static int mcp794xx_alarm_irq_enable(struct device *dev, unsigned int enabled)
 {
 	struct ds1307 *ds1307 = dev_get_drvdata(dev);
 
-	if (!test_bit(HAS_ALARM, &ds1307->flags))
-		return -EINVAL;
-
 	return regmap_update_bits(ds1307->regmap, MCP794XX_REG_CONTROL,
 				  MCP794XX_BIT_ALM0_EN,
 				  enabled ? MCP794XX_BIT_ALM0_EN : 0);
@@ -1641,7 +1613,7 @@ static int ds3231_clks_register(struct ds1307 *ds1307)
 		 * Interrupt signal due to alarm conditions and square-wave
 		 * output share same pin, so don't initialize both.
 		 */
-		if (i == DS3231_CLK_SQW && test_bit(HAS_ALARM, &ds1307->flags))
+		if (i == DS3231_CLK_SQW && test_bit(RTC_FEATURE_ALARM, ds1307->rtc->features))
 			continue;
 
 		init.name = ds3231_clks_names[i];
@@ -1964,15 +1936,15 @@ static int ds1307_probe(struct i2c_client *client,
 			     bin2bcd(tmp));
 	}
 
-	if (want_irq || ds1307_can_wakeup_device) {
-		device_set_wakeup_capable(ds1307->dev, true);
-		set_bit(HAS_ALARM, &ds1307->flags);
-	}
-
 	ds1307->rtc = devm_rtc_allocate_device(ds1307->dev);
 	if (IS_ERR(ds1307->rtc))
 		return PTR_ERR(ds1307->rtc);
 
+	if (want_irq || ds1307_can_wakeup_device)
+		device_set_wakeup_capable(ds1307->dev, true);
+	else
+		clear_bit(RTC_FEATURE_ALARM, ds1307->rtc->features);
+
 	if (ds1307_can_wakeup_device && !want_irq) {
 		dev_info(ds1307->dev,
 			 "'wakeup-source' is set, request for an IRQ is disabled!\n");
@@ -1988,7 +1960,7 @@ static int ds1307_probe(struct i2c_client *client,
 		if (err) {
 			client->irq = 0;
 			device_set_wakeup_capable(ds1307->dev, false);
-			clear_bit(HAS_ALARM, &ds1307->flags);
+			clear_bit(RTC_FEATURE_ALARM, ds1307->rtc->features);
 			dev_err(ds1307->dev, "unable to request IRQ!\n");
 		} else {
 			dev_dbg(ds1307->dev, "got IRQ %d\n", client->irq);
-- 
2.30.2

