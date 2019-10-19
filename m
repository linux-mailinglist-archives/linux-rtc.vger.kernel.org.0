Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21F75DDAF9
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2019 22:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfJSUtv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 19 Oct 2019 16:49:51 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:46541 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbfJSUtt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 19 Oct 2019 16:49:49 -0400
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id EA1FE240002;
        Sat, 19 Oct 2019 20:49:46 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 8/9] rtc: ds1343: rework interrupt handling
Date:   Sat, 19 Oct 2019 22:49:40 +0200
Message-Id: <20191019204941.6203-8-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019204941.6203-1-alexandre.belloni@bootlin.com>
References: <20191019204941.6203-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Rework the interrupt handling to avoid caching the values as the core is
already doing that. The core also always ensures the rtc_time passed for
the alarm is fully populated.

The only trick is in read_alarm where status needs to be read before the
alarm registers to ensure the potential irq is not cleared.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1343.c | 112 ++++++++++++---------------------------
 1 file changed, 35 insertions(+), 77 deletions(-)

diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index 867187325d41..3e2957983703 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -78,12 +78,7 @@ struct ds1343_priv {
 	struct spi_device *spi;
 	struct rtc_device *rtc;
 	struct regmap *map;
-	unsigned int irqen;
 	int irq;
-	int alarm_sec;
-	int alarm_min;
-	int alarm_hour;
-	int alarm_mday;
 };
 
 static ssize_t ds1343_show_glitchfilter(struct device *dev,
@@ -239,93 +234,66 @@ static int ds1343_set_time(struct device *dev, struct rtc_time *dt)
 				 buf, sizeof(buf));
 }
 
-static int ds1343_update_alarm(struct device *dev)
+static int ds1343_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
 	struct ds1343_priv *priv = dev_get_drvdata(dev);
-	unsigned int control, stat;
 	unsigned char buf[4];
-	int res = 0;
+	unsigned int val;
+	int res;
 
-	res = regmap_read(priv->map, DS1343_CONTROL_REG, &control);
-	if (res)
-		return res;
+	if (priv->irq <= 0)
+		return -EINVAL;
 
-	res = regmap_read(priv->map, DS1343_STATUS_REG, &stat);
+	res = regmap_read(priv->map, DS1343_STATUS_REG, &val);
 	if (res)
 		return res;
 
-	control &= ~(DS1343_A0IE);
-	stat &= ~(DS1343_IRQF0);
+	alarm->pending = !!(val & DS1343_IRQF0);
 
-	res = regmap_write(priv->map, DS1343_CONTROL_REG, control);
+	res = regmap_read(priv->map, DS1343_CONTROL_REG, &val);
 	if (res)
 		return res;
+	alarm->enabled = !!(val & DS1343_A0IE);
 
-	res = regmap_write(priv->map, DS1343_STATUS_REG, stat);
+	res = regmap_bulk_read(priv->map, DS1343_ALM0_SEC_REG, buf, 4);
 	if (res)
 		return res;
 
-	buf[0] = priv->alarm_sec < 0 || (priv->irqen & RTC_UF) ?
-		0x80 : bin2bcd(priv->alarm_sec) & 0x7F;
-	buf[1] = priv->alarm_min < 0 || (priv->irqen & RTC_UF) ?
-		0x80 : bin2bcd(priv->alarm_min) & 0x7F;
-	buf[2] = priv->alarm_hour < 0 || (priv->irqen & RTC_UF) ?
-		0x80 : bin2bcd(priv->alarm_hour) & 0x3F;
-	buf[3] = priv->alarm_mday < 0 || (priv->irqen & RTC_UF) ?
-		0x80 : bin2bcd(priv->alarm_mday) & 0x7F;
-
-	res = regmap_bulk_write(priv->map, DS1343_ALM0_SEC_REG, buf, 4);
-	if (res)
-		return res;
+	alarm->time.tm_sec = bcd2bin(buf[0]) & 0x7f;
+	alarm->time.tm_min = bcd2bin(buf[1]) & 0x7f;
+	alarm->time.tm_hour = bcd2bin(buf[2]) & 0x3f;
+	alarm->time.tm_mday = bcd2bin(buf[3]) & 0x3f;
 
-	if (priv->irqen) {
-		control |= DS1343_A0IE;
-		res = regmap_write(priv->map, DS1343_CONTROL_REG, control);
-	}
-
-	return res;
+	return 0;
 }
 
-static int ds1343_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+static int ds1343_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
 	struct ds1343_priv *priv = dev_get_drvdata(dev);
-	int res;
-	unsigned int stat;
+	unsigned char buf[4];
+	int res = 0;
 
 	if (priv->irq <= 0)
 		return -EINVAL;
 
-	res = regmap_read(priv->map, DS1343_STATUS_REG, &stat);
+	res = regmap_update_bits(priv->map, DS1343_CONTROL_REG, DS1343_A0IE, 0);
 	if (res)
 		return res;
 
-	alarm->enabled = !!(priv->irqen & RTC_AF);
-	alarm->pending = !!(stat & DS1343_IRQF0);
+	buf[0] = bin2bcd(alarm->time.tm_sec);
+	buf[1] = bin2bcd(alarm->time.tm_min);
+	buf[2] = bin2bcd(alarm->time.tm_hour);
+	buf[3] = bin2bcd(alarm->time.tm_mday);
 
-	alarm->time.tm_sec = priv->alarm_sec < 0 ? 0 : priv->alarm_sec;
-	alarm->time.tm_min = priv->alarm_min < 0 ? 0 : priv->alarm_min;
-	alarm->time.tm_hour = priv->alarm_hour < 0 ? 0 : priv->alarm_hour;
-	alarm->time.tm_mday = priv->alarm_mday < 0 ? 0 : priv->alarm_mday;
-
-	return 0;
-}
-
-static int ds1343_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
-{
-	struct ds1343_priv *priv = dev_get_drvdata(dev);
-
-	if (priv->irq <= 0)
-		return -EINVAL;
-
-	priv->alarm_sec = alarm->time.tm_sec;
-	priv->alarm_min = alarm->time.tm_min;
-	priv->alarm_hour = alarm->time.tm_hour;
-	priv->alarm_mday = alarm->time.tm_mday;
+	res = regmap_bulk_write(priv->map, DS1343_ALM0_SEC_REG, buf, 4);
+	if (res)
+		return res;
 
 	if (alarm->enabled)
-		priv->irqen |= RTC_AF;
+		res = regmap_update_bits(priv->map, DS1343_CONTROL_REG,
+					 DS1343_A0IE, DS1343_A0IE);
 
-	return ds1343_update_alarm(dev);
+	return res;
 }
 
 static int ds1343_alarm_irq_enable(struct device *dev, unsigned int enabled)
@@ -335,18 +303,14 @@ static int ds1343_alarm_irq_enable(struct device *dev, unsigned int enabled)
 	if (priv->irq <= 0)
 		return -EINVAL;
 
-	if (enabled)
-		priv->irqen |= RTC_AF;
-	else
-		priv->irqen &= ~RTC_AF;
-
-	return ds1343_update_alarm(dev);
+	return regmap_update_bits(priv->map, DS1343_CONTROL_REG,
+				  DS1343_A0IE, enabled ? DS1343_A0IE : 0);
 }
 
 static irqreturn_t ds1343_thread(int irq, void *dev_id)
 {
 	struct ds1343_priv *priv = dev_id;
-	unsigned int stat, control;
+	unsigned int stat;
 	int res = 0;
 
 	rtc_lock(priv->rtc);
@@ -359,14 +323,10 @@ static irqreturn_t ds1343_thread(int irq, void *dev_id)
 		stat &= ~DS1343_IRQF0;
 		regmap_write(priv->map, DS1343_STATUS_REG, stat);
 
-		res = regmap_read(priv->map, DS1343_CONTROL_REG, &control);
-		if (res)
-			goto out;
-
-		control &= ~DS1343_A0IE;
-		regmap_write(priv->map, DS1343_CONTROL_REG, control);
-
 		rtc_update_irq(priv->rtc, 1, RTC_AF | RTC_IRQF);
+
+		regmap_update_bits(priv->map, DS1343_CONTROL_REG,
+				   DS1343_A0IE, 0);
 	}
 
 out:
@@ -480,8 +440,6 @@ static int ds1343_remove(struct spi_device *spi)
 	struct ds1343_priv *priv = spi_get_drvdata(spi);
 
 	if (spi->irq) {
-		priv->irqen &= ~RTC_AF;
-
 		dev_pm_clear_wake_irq(&spi->dev);
 		device_init_wakeup(&spi->dev, false);
 		devm_free_irq(&spi->dev, spi->irq, priv);
-- 
2.21.0

