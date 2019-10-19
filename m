Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E93FDDAFC
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2019 22:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfJSUt4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 19 Oct 2019 16:49:56 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:50765 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726372AbfJSUts (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 19 Oct 2019 16:49:48 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 782AA1C0004;
        Sat, 19 Oct 2019 20:49:46 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 7/9] rtc: ds1343: remove unnecessary mutex
Date:   Sat, 19 Oct 2019 22:49:39 +0200
Message-Id: <20191019204941.6203-7-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019204941.6203-1-alexandre.belloni@bootlin.com>
References: <20191019204941.6203-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use rtc_lock and rtc_unlock to lock the rtc from the interrupt handler.
This removes the need for a driver specific lock.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1343.c | 36 +++++++-----------------------------
 1 file changed, 7 insertions(+), 29 deletions(-)

diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index c96a505972e6..867187325d41 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -78,7 +78,6 @@ struct ds1343_priv {
 	struct spi_device *spi;
 	struct rtc_device *rtc;
 	struct regmap *map;
-	struct mutex mutex;
 	unsigned int irqen;
 	int irq;
 	int alarm_sec;
@@ -290,17 +289,15 @@ static int ds1343_update_alarm(struct device *dev)
 static int ds1343_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
 	struct ds1343_priv *priv = dev_get_drvdata(dev);
-	int res = 0;
+	int res;
 	unsigned int stat;
 
 	if (priv->irq <= 0)
 		return -EINVAL;
 
-	mutex_lock(&priv->mutex);
-
 	res = regmap_read(priv->map, DS1343_STATUS_REG, &stat);
 	if (res)
-		goto out;
+		return res;
 
 	alarm->enabled = !!(priv->irqen & RTC_AF);
 	alarm->pending = !!(stat & DS1343_IRQF0);
@@ -310,21 +307,16 @@ static int ds1343_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	alarm->time.tm_hour = priv->alarm_hour < 0 ? 0 : priv->alarm_hour;
 	alarm->time.tm_mday = priv->alarm_mday < 0 ? 0 : priv->alarm_mday;
 
-out:
-	mutex_unlock(&priv->mutex);
-	return res;
+	return 0;
 }
 
 static int ds1343_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
 	struct ds1343_priv *priv = dev_get_drvdata(dev);
-	int res = 0;
 
 	if (priv->irq <= 0)
 		return -EINVAL;
 
-	mutex_lock(&priv->mutex);
-
 	priv->alarm_sec = alarm->time.tm_sec;
 	priv->alarm_min = alarm->time.tm_min;
 	priv->alarm_hour = alarm->time.tm_hour;
@@ -333,33 +325,22 @@ static int ds1343_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	if (alarm->enabled)
 		priv->irqen |= RTC_AF;
 
-	res = ds1343_update_alarm(dev);
-
-	mutex_unlock(&priv->mutex);
-
-	return res;
+	return ds1343_update_alarm(dev);
 }
 
 static int ds1343_alarm_irq_enable(struct device *dev, unsigned int enabled)
 {
 	struct ds1343_priv *priv = dev_get_drvdata(dev);
-	int res = 0;
 
 	if (priv->irq <= 0)
 		return -EINVAL;
 
-	mutex_lock(&priv->mutex);
-
 	if (enabled)
 		priv->irqen |= RTC_AF;
 	else
 		priv->irqen &= ~RTC_AF;
 
-	res = ds1343_update_alarm(dev);
-
-	mutex_unlock(&priv->mutex);
-
-	return res;
+	return ds1343_update_alarm(dev);
 }
 
 static irqreturn_t ds1343_thread(int irq, void *dev_id)
@@ -368,7 +349,7 @@ static irqreturn_t ds1343_thread(int irq, void *dev_id)
 	unsigned int stat, control;
 	int res = 0;
 
-	mutex_lock(&priv->mutex);
+	rtc_lock(priv->rtc);
 
 	res = regmap_read(priv->map, DS1343_STATUS_REG, &stat);
 	if (res)
@@ -389,7 +370,7 @@ static irqreturn_t ds1343_thread(int irq, void *dev_id)
 	}
 
 out:
-	mutex_unlock(&priv->mutex);
+	rtc_unlock(priv->rtc);
 	return IRQ_HANDLED;
 }
 
@@ -422,7 +403,6 @@ static int ds1343_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	priv->spi = spi;
-	mutex_init(&priv->mutex);
 
 	/* RTC DS1347 works in spi mode 3 and
 	 * its chip select is active high
@@ -500,9 +480,7 @@ static int ds1343_remove(struct spi_device *spi)
 	struct ds1343_priv *priv = spi_get_drvdata(spi);
 
 	if (spi->irq) {
-		mutex_lock(&priv->mutex);
 		priv->irqen &= ~RTC_AF;
-		mutex_unlock(&priv->mutex);
 
 		dev_pm_clear_wake_irq(&spi->dev);
 		device_init_wakeup(&spi->dev, false);
-- 
2.21.0

