Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4506C8D6E5
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Aug 2019 17:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbfHNPKI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 14 Aug 2019 11:10:08 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:56655 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfHNPKI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 14 Aug 2019 11:10:08 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2A86EFF806;
        Wed, 14 Aug 2019 15:10:06 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 1/9] rtc: pcf2123: stop using dev.platform_data
Date:   Wed, 14 Aug 2019 17:09:54 +0200
Message-Id: <20190814151002.7324-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

platform_data is for platform specific data, use driver_data instead.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2123.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2123.c b/drivers/rtc/rtc-pcf2123.c
index fb542a930bf0..ed20e947c16b 100644
--- a/drivers/rtc/rtc-pcf2123.c
+++ b/drivers/rtc/rtc-pcf2123.c
@@ -119,7 +119,7 @@ static const struct regmap_config pcf2123_regmap_config = {
 
 static int pcf2123_read_offset(struct device *dev, long *offset)
 {
-	struct pcf2123_plat_data *pdata = dev_get_platdata(dev);
+	struct pcf2123_plat_data *pdata = dev_get_drvdata(dev);
 	int ret, val;
 	unsigned int reg;
 
@@ -149,7 +149,7 @@ static int pcf2123_read_offset(struct device *dev, long *offset)
  */
 static int pcf2123_set_offset(struct device *dev, long offset)
 {
-	struct pcf2123_plat_data *pdata = dev_get_platdata(dev);
+	struct pcf2123_plat_data *pdata = dev_get_drvdata(dev);
 	s8 reg;
 
 	if (offset > OFFSET_STEP * 127)
@@ -174,7 +174,7 @@ static int pcf2123_set_offset(struct device *dev, long offset)
 
 static int pcf2123_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
-	struct pcf2123_plat_data *pdata = dev_get_platdata(dev);
+	struct pcf2123_plat_data *pdata = dev_get_drvdata(dev);
 	u8 rxbuf[7];
 	int ret;
 
@@ -205,7 +205,7 @@ static int pcf2123_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 static int pcf2123_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
-	struct pcf2123_plat_data *pdata = dev_get_platdata(dev);
+	struct pcf2123_plat_data *pdata = dev_get_drvdata(dev);
 	u8 txbuf[7];
 	int ret;
 
@@ -240,7 +240,7 @@ static int pcf2123_rtc_set_time(struct device *dev, struct rtc_time *tm)
 
 static int pcf2123_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 {
-	struct pcf2123_plat_data *pdata = dev_get_platdata(dev);
+	struct pcf2123_plat_data *pdata = dev_get_drvdata(dev);
 	u8 rxbuf[4];
 	int ret;
 	unsigned int val = 0;
@@ -268,7 +268,7 @@ static int pcf2123_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 
 static int pcf2123_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 {
-	struct pcf2123_plat_data *pdata = dev_get_platdata(dev);
+	struct pcf2123_plat_data *pdata = dev_get_drvdata(dev);
 	u8 txbuf[4];
 	int ret;
 
@@ -308,7 +308,7 @@ static int pcf2123_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 
 static irqreturn_t pcf2123_rtc_irq(int irq, void *dev)
 {
-	struct pcf2123_plat_data *pdata = dev_get_platdata(dev);
+	struct pcf2123_plat_data *pdata = dev_get_drvdata(dev);
 	struct mutex *lock = &pdata->rtc->ops_lock;
 	unsigned int val = 0;
 	int ret = IRQ_NONE;
@@ -333,7 +333,7 @@ static irqreturn_t pcf2123_rtc_irq(int irq, void *dev)
 
 static int pcf2123_reset(struct device *dev)
 {
-	struct pcf2123_plat_data *pdata = dev_get_platdata(dev);
+	struct pcf2123_plat_data *pdata = dev_get_drvdata(dev);
 	int ret;
 	unsigned int val = 0;
 
@@ -385,7 +385,8 @@ static int pcf2123_probe(struct spi_device *spi)
 				GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
-	spi->dev.platform_data = pdata;
+
+	dev_set_drvdata(&spi->dev, pdata);
 
 	pdata->map = devm_regmap_init_spi(spi, &pcf2123_regmap_config);
 
@@ -418,6 +419,7 @@ static int pcf2123_probe(struct spi_device *spi)
 
 	pdata->rtc = rtc;
 
+
 	/* Register alarm irq */
 	if (spi->irq > 0) {
 		ret = devm_request_threaded_irq(&spi->dev, spi->irq, NULL,
@@ -439,7 +441,6 @@ static int pcf2123_probe(struct spi_device *spi)
 	return 0;
 
 kfree_exit:
-	spi->dev.platform_data = NULL;
 	return ret;
 }
 
-- 
2.21.0

