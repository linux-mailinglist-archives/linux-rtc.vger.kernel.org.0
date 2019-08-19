Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF4494CD4
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Aug 2019 20:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbfHSS1E (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Aug 2019 14:27:04 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:52703 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728323AbfHSS1C (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Aug 2019 14:27:02 -0400
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 782C6240003;
        Mon, 19 Aug 2019 18:26:59 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 4/9] rtc: pcf2123: stop using dev.platform_data
Date:   Mon, 19 Aug 2019 20:26:51 +0200
Message-Id: <20190819182656.29744-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190819182656.29744-1-alexandre.belloni@bootlin.com>
References: <20190819182656.29744-1-alexandre.belloni@bootlin.com>
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
index 809c35c8ba1a..efbf3a371b5e 100644
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
 
@@ -248,7 +248,7 @@ static int pcf2123_rtc_alarm_irq_enable(struct device *dev, unsigned int en)
 
 static int pcf2123_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 {
-	struct pcf2123_plat_data *pdata = dev_get_platdata(dev);
+	struct pcf2123_plat_data *pdata = dev_get_drvdata(dev);
 	u8 rxbuf[4];
 	int ret;
 	unsigned int val = 0;
@@ -276,7 +276,7 @@ static int pcf2123_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 
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
 
@@ -386,7 +386,8 @@ static int pcf2123_probe(struct spi_device *spi)
 				GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
-	spi->dev.platform_data = pdata;
+
+	dev_set_drvdata(&spi->dev, pdata);
 
 	pdata->map = devm_regmap_init_spi(spi, &pcf2123_regmap_config);
 
@@ -419,6 +420,7 @@ static int pcf2123_probe(struct spi_device *spi)
 
 	pdata->rtc = rtc;
 
+
 	/* Register alarm irq */
 	if (spi->irq > 0) {
 		ret = devm_request_threaded_irq(&spi->dev, spi->irq, NULL,
@@ -440,7 +442,6 @@ static int pcf2123_probe(struct spi_device *spi)
 	return 0;
 
 kfree_exit:
-	spi->dev.platform_data = NULL;
 	return ret;
 }
 
-- 
2.21.0

