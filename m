Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 493CE8D6F1
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Aug 2019 17:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbfHNPKM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 14 Aug 2019 11:10:12 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:50601 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfHNPKL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 14 Aug 2019 11:10:11 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id BC24D1BF205;
        Wed, 14 Aug 2019 15:10:08 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 2/9] rtc: pcf2123: rename struct and variables
Date:   Wed, 14 Aug 2019 17:09:55 +0200
Message-Id: <20190814151002.7324-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814151002.7324-1-alexandre.belloni@bootlin.com>
References: <20190814151002.7324-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Rename struct pcf2123_plat_data to struct pcf2123_data and pdata to
pcf2123 to make the driver use a more common subsystem style.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2123.c | 74 +++++++++++++++++++--------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2123.c b/drivers/rtc/rtc-pcf2123.c
index ed20e947c16b..106d5a4cf9b8 100644
--- a/drivers/rtc/rtc-pcf2123.c
+++ b/drivers/rtc/rtc-pcf2123.c
@@ -104,7 +104,7 @@
 
 static struct spi_driver pcf2123_driver;
 
-struct pcf2123_plat_data {
+struct pcf2123_data {
 	struct rtc_device *rtc;
 	struct regmap *map;
 };
@@ -119,11 +119,11 @@ static const struct regmap_config pcf2123_regmap_config = {
 
 static int pcf2123_read_offset(struct device *dev, long *offset)
 {
-	struct pcf2123_plat_data *pdata = dev_get_drvdata(dev);
+	struct pcf2123_data *pcf2123 = dev_get_drvdata(dev);
 	int ret, val;
 	unsigned int reg;
 
-	ret = regmap_read(pdata->map, PCF2123_REG_OFFSET, &reg);
+	ret = regmap_read(pcf2123->map, PCF2123_REG_OFFSET, &reg);
 	if (ret)
 		return ret;
 
@@ -149,7 +149,7 @@ static int pcf2123_read_offset(struct device *dev, long *offset)
  */
 static int pcf2123_set_offset(struct device *dev, long offset)
 {
-	struct pcf2123_plat_data *pdata = dev_get_drvdata(dev);
+	struct pcf2123_data *pcf2123 = dev_get_drvdata(dev);
 	s8 reg;
 
 	if (offset > OFFSET_STEP * 127)
@@ -169,16 +169,16 @@ static int pcf2123_set_offset(struct device *dev, long offset)
 		reg |= OFFSET_COARSE;
 	}
 
-	return regmap_write(pdata->map, PCF2123_REG_OFFSET, (unsigned int)reg);
+	return regmap_write(pcf2123->map, PCF2123_REG_OFFSET, (unsigned int)reg);
 }
 
 static int pcf2123_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
-	struct pcf2123_plat_data *pdata = dev_get_drvdata(dev);
+	struct pcf2123_data *pcf2123 = dev_get_drvdata(dev);
 	u8 rxbuf[7];
 	int ret;
 
-	ret = regmap_bulk_read(pdata->map, PCF2123_REG_SC, rxbuf,
+	ret = regmap_bulk_read(pcf2123->map, PCF2123_REG_SC, rxbuf,
 				sizeof(rxbuf));
 	if (ret)
 		return ret;
@@ -205,14 +205,14 @@ static int pcf2123_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 static int pcf2123_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
-	struct pcf2123_plat_data *pdata = dev_get_drvdata(dev);
+	struct pcf2123_data *pcf2123 = dev_get_drvdata(dev);
 	u8 txbuf[7];
 	int ret;
 
 	dev_dbg(dev, "%s: tm is %ptR\n", __func__, tm);
 
 	/* Stop the counter first */
-	ret = regmap_write(pdata->map, PCF2123_REG_CTRL1, CTRL1_STOP);
+	ret = regmap_write(pcf2123->map, PCF2123_REG_CTRL1, CTRL1_STOP);
 	if (ret)
 		return ret;
 
@@ -225,13 +225,13 @@ static int pcf2123_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	txbuf[5] = bin2bcd((tm->tm_mon + 1) & 0x1F); /* rtc mn 1-12 */
 	txbuf[6] = bin2bcd(tm->tm_year < 100 ? tm->tm_year : tm->tm_year - 100);
 
-	ret = regmap_bulk_write(pdata->map, PCF2123_REG_SC, txbuf,
+	ret = regmap_bulk_write(pcf2123->map, PCF2123_REG_SC, txbuf,
 				sizeof(txbuf));
 	if (ret)
 		return ret;
 
 	/* Start the counter */
-	ret = regmap_write(pdata->map, PCF2123_REG_CTRL1, CTRL1_CLEAR);
+	ret = regmap_write(pcf2123->map, PCF2123_REG_CTRL1, CTRL1_CLEAR);
 	if (ret)
 		return ret;
 
@@ -240,12 +240,12 @@ static int pcf2123_rtc_set_time(struct device *dev, struct rtc_time *tm)
 
 static int pcf2123_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 {
-	struct pcf2123_plat_data *pdata = dev_get_drvdata(dev);
+	struct pcf2123_data *pcf2123 = dev_get_drvdata(dev);
 	u8 rxbuf[4];
 	int ret;
 	unsigned int val = 0;
 
-	ret = regmap_bulk_read(pdata->map, PCF2123_REG_ALRM_MN, rxbuf,
+	ret = regmap_bulk_read(pcf2123->map, PCF2123_REG_ALRM_MN, rxbuf,
 				sizeof(rxbuf));
 	if (ret)
 		return ret;
@@ -257,7 +257,7 @@ static int pcf2123_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 
 	dev_dbg(dev, "%s: alm is %ptR\n", __func__, &alm->time);
 
-	ret = regmap_read(pdata->map, PCF2123_REG_CTRL2, &val);
+	ret = regmap_read(pcf2123->map, PCF2123_REG_CTRL2, &val);
 	if (ret)
 		return ret;
 
@@ -268,19 +268,19 @@ static int pcf2123_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 
 static int pcf2123_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 {
-	struct pcf2123_plat_data *pdata = dev_get_drvdata(dev);
+	struct pcf2123_data *pcf2123 = dev_get_drvdata(dev);
 	u8 txbuf[4];
 	int ret;
 
 	dev_dbg(dev, "%s: alm is %ptR\n", __func__, &alm->time);
 
 	/* Ensure alarm flag is clear */
-	ret = regmap_update_bits(pdata->map, PCF2123_REG_CTRL2, CTRL2_AF, 0);
+	ret = regmap_update_bits(pcf2123->map, PCF2123_REG_CTRL2, CTRL2_AF, 0);
 	if (ret)
 		return ret;
 
 	/* Disable alarm interrupt */
-	ret = regmap_update_bits(pdata->map, PCF2123_REG_CTRL2, CTRL2_AIE, 0);
+	ret = regmap_update_bits(pcf2123->map, PCF2123_REG_CTRL2, CTRL2_AIE, 0);
 	if (ret)
 		return ret;
 
@@ -290,14 +290,14 @@ static int pcf2123_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	txbuf[2] = bin2bcd(alm->time.tm_mday & 0x3F);
 	txbuf[3] = bin2bcd(alm->time.tm_wday & 0x07);
 
-	ret = regmap_bulk_write(pdata->map, PCF2123_REG_ALRM_MN, txbuf,
+	ret = regmap_bulk_write(pcf2123->map, PCF2123_REG_ALRM_MN, txbuf,
 				sizeof(txbuf));
 	if (ret)
 		return ret;
 
 	/* Enable alarm interrupt */
 	if (alm->enabled)	{
-		ret = regmap_update_bits(pdata->map, PCF2123_REG_CTRL2,
+		ret = regmap_update_bits(pcf2123->map, PCF2123_REG_CTRL2,
 						CTRL2_AIE, CTRL2_AIE);
 		if (ret)
 			return ret;
@@ -308,22 +308,22 @@ static int pcf2123_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 
 static irqreturn_t pcf2123_rtc_irq(int irq, void *dev)
 {
-	struct pcf2123_plat_data *pdata = dev_get_drvdata(dev);
-	struct mutex *lock = &pdata->rtc->ops_lock;
+	struct pcf2123_data *pcf2123 = dev_get_drvdata(dev);
+	struct mutex *lock = &pcf2123->rtc->ops_lock;
 	unsigned int val = 0;
 	int ret = IRQ_NONE;
 
 	mutex_lock(lock);
-	regmap_read(pdata->map, PCF2123_REG_CTRL2, &val);
+	regmap_read(pcf2123->map, PCF2123_REG_CTRL2, &val);
 
 	/* Alarm? */
 	if (val & CTRL2_AF) {
 		ret = IRQ_HANDLED;
 
 		/* Clear alarm flag */
-		regmap_update_bits(pdata->map, PCF2123_REG_CTRL2, CTRL2_AF, 0);
+		regmap_update_bits(pcf2123->map, PCF2123_REG_CTRL2, CTRL2_AF, 0);
 
-		rtc_update_irq(pdata->rtc, 1, RTC_IRQF | RTC_AF);
+		rtc_update_irq(pcf2123->rtc, 1, RTC_IRQF | RTC_AF);
 	}
 
 	mutex_unlock(lock);
@@ -333,23 +333,23 @@ static irqreturn_t pcf2123_rtc_irq(int irq, void *dev)
 
 static int pcf2123_reset(struct device *dev)
 {
-	struct pcf2123_plat_data *pdata = dev_get_drvdata(dev);
+	struct pcf2123_data *pcf2123 = dev_get_drvdata(dev);
 	int ret;
 	unsigned int val = 0;
 
-	ret = regmap_write(pdata->map, PCF2123_REG_CTRL1, CTRL1_SW_RESET);
+	ret = regmap_write(pcf2123->map, PCF2123_REG_CTRL1, CTRL1_SW_RESET);
 	if (ret)
 		return ret;
 
 	/* Stop the counter */
 	dev_dbg(dev, "stopping RTC\n");
-	ret = regmap_write(pdata->map, PCF2123_REG_CTRL1, CTRL1_STOP);
+	ret = regmap_write(pcf2123->map, PCF2123_REG_CTRL1, CTRL1_STOP);
 	if (ret)
 		return ret;
 
 	/* See if the counter was actually stopped */
 	dev_dbg(dev, "checking for presence of RTC\n");
-	ret = regmap_read(pdata->map, PCF2123_REG_CTRL1, &val);
+	ret = regmap_read(pcf2123->map, PCF2123_REG_CTRL1, &val);
 	if (ret)
 		return ret;
 
@@ -358,7 +358,7 @@ static int pcf2123_reset(struct device *dev)
 		return -ENODEV;
 
 	/* Start the counter */
-	ret = regmap_write(pdata->map, PCF2123_REG_CTRL1, CTRL1_CLEAR);
+	ret = regmap_write(pcf2123->map, PCF2123_REG_CTRL1, CTRL1_CLEAR);
 	if (ret)
 		return ret;
 
@@ -378,19 +378,19 @@ static int pcf2123_probe(struct spi_device *spi)
 {
 	struct rtc_device *rtc;
 	struct rtc_time tm;
-	struct pcf2123_plat_data *pdata;
+	struct pcf2123_data *pcf2123;
 	int ret = 0;
 
-	pdata = devm_kzalloc(&spi->dev, sizeof(struct pcf2123_plat_data),
+	pcf2123 = devm_kzalloc(&spi->dev, sizeof(struct pcf2123_data),
 				GFP_KERNEL);
-	if (!pdata)
+	if (!pcf2123)
 		return -ENOMEM;
 
-	dev_set_drvdata(&spi->dev, pdata);
+	dev_set_drvdata(&spi->dev, pcf2123);
 
-	pdata->map = devm_regmap_init_spi(spi, &pcf2123_regmap_config);
+	pcf2123->map = devm_regmap_init_spi(spi, &pcf2123_regmap_config);
 
-	if (IS_ERR(pdata->map)) {
+	if (IS_ERR(pcf2123->map)) {
 		dev_err(&spi->dev, "regmap init failed.\n");
 		goto kfree_exit;
 	}
@@ -417,7 +417,7 @@ static int pcf2123_probe(struct spi_device *spi)
 		goto kfree_exit;
 	}
 
-	pdata->rtc = rtc;
+	pcf2123->rtc = rtc;
 
 
 	/* Register alarm irq */
@@ -436,7 +436,7 @@ static int pcf2123_probe(struct spi_device *spi)
 	 * support to this driver to generate interrupts more than once
 	 * per minute.
 	 */
-	pdata->rtc->uie_unsupported = 1;
+	pcf2123->rtc->uie_unsupported = 1;
 
 	return 0;
 
-- 
2.21.0

