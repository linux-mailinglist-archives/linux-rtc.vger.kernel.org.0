Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503422426F4
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Aug 2020 10:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgHLIvV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 Aug 2020 04:51:21 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:51089 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgHLIvU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 12 Aug 2020 04:51:20 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B557F1C000C;
        Wed, 12 Aug 2020 08:51:17 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Liam Beguin <lvb@xiphos.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: pcf2127: fix alarm handling
Date:   Wed, 12 Aug 2020 10:51:14 +0200
Message-Id: <20200812085114.474903-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Fix multiple issues when handling alarms:
 - Use threaded interrupt to avoid scheduling when atomic
 - Stop matching on week day as it may not be set correctly
 - Avoid parsing the DT interrupt and use what is provided by the i2c or
   spi subsystem
 - Avoid returning IRQ_NONE in case of error in the interrupt handler
 - Never write WDTF as specified in the datasheet
 - Set uie_unsupported, as for the pcf85063, setting alarms every seconds
   is not working correctly and confuses the RTC.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2127.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 4e99c45a87d7..ed6316992cbb 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -33,6 +33,7 @@
 #define PCF2127_BIT_CTRL2_TSIE			BIT(2)
 #define PCF2127_BIT_CTRL2_AF			BIT(4)
 #define PCF2127_BIT_CTRL2_TSF2			BIT(5)
+#define PCF2127_BIT_CTRL2_WDTF			BIT(6)
 /* Control register 3 */
 #define PCF2127_REG_CTRL3		0x02
 #define PCF2127_BIT_CTRL3_BLIE			BIT(0)
@@ -55,6 +56,7 @@
 #define PCF2127_REG_ALARM_HR		0x0C
 #define PCF2127_REG_ALARM_DM		0x0D
 #define PCF2127_REG_ALARM_DW		0x0E
+#define PCF2127_BIT_ALARM_AE			BIT(7)
 /* Watchdog registers */
 #define PCF2127_REG_WD_CTL		0x10
 #define PCF2127_BIT_WD_CTL_TF0			BIT(0)
@@ -360,7 +362,6 @@ static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	alrm->time.tm_min = bcd2bin(buf[1] & 0x7F);
 	alrm->time.tm_hour = bcd2bin(buf[2] & 0x3F);
 	alrm->time.tm_mday = bcd2bin(buf[3] & 0x3F);
-	alrm->time.tm_wday = buf[4] & 0x07;
 
 	return 0;
 }
@@ -398,7 +399,7 @@ static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	buf[1] = bin2bcd(alrm->time.tm_min);
 	buf[2] = bin2bcd(alrm->time.tm_hour);
 	buf[3] = bin2bcd(alrm->time.tm_mday);
-	buf[4] = (alrm->time.tm_wday & 0x07);
+	buf[4] = PCF2127_BIT_ALARM_AE; /* Do not match on week day */
 
 	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
 				sizeof(buf));
@@ -418,16 +419,15 @@ static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
 	if (ret)
 		return IRQ_NONE;
 
-	if (ctrl2 & PCF2127_BIT_CTRL2_AF) {
-		regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
-			     ctrl2 & ~PCF2127_BIT_CTRL2_AF);
+	if (!(ctrl2 & PCF2127_BIT_CTRL2_AF))
+		return IRQ_NONE;
 
-		rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
-	}
+	regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
+		     ctrl2 & ~(PCF2127_BIT_CTRL2_AF | PCF2127_BIT_CTRL2_WDTF));
 
-	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
-	if (ret)
-		return IRQ_NONE;
+	rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
+
+	pcf2127_wdt_active_ping(&pcf2127->wdd);
 
 	return IRQ_HANDLED;
 }
@@ -533,10 +533,9 @@ static const struct attribute_group pcf2127_attr_group = {
 };
 
 static int pcf2127_probe(struct device *dev, struct regmap *regmap,
-			const char *name, bool has_nvmem)
+			 int alarm_irq, const char *name, bool has_nvmem)
 {
 	struct pcf2127 *pcf2127;
-	int alarm_irq = 0;
 	u32 wdd_timeout;
 	int ret = 0;
 
@@ -558,12 +557,13 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	pcf2127->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	pcf2127->rtc->range_max = RTC_TIMESTAMP_END_2099;
 	pcf2127->rtc->set_start_time = true; /* Sets actual start to 1970 */
+	pcf2127->rtc->uie_unsupported = 1;
 
-	alarm_irq = of_irq_get_byname(dev->of_node, "alarm");
 	if (alarm_irq >= 0) {
-		ret = devm_request_irq(dev, alarm_irq, pcf2127_rtc_irq,
-				       IRQF_TRIGGER_LOW | IRQF_ONESHOT,
-				       dev_name(dev), dev);
+		ret = devm_request_threaded_irq(dev, alarm_irq, NULL,
+						pcf2127_rtc_irq,
+						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+						dev_name(dev), dev);
 		if (ret) {
 			dev_err(dev, "failed to request alarm irq\n");
 			return ret;
@@ -792,7 +792,7 @@ static int pcf2127_i2c_probe(struct i2c_client *client,
 		return PTR_ERR(regmap);
 	}
 
-	return pcf2127_probe(&client->dev, regmap,
+	return pcf2127_probe(&client->dev, regmap, client->irq,
 			     pcf2127_i2c_driver.driver.name, id->driver_data);
 }
 
@@ -858,7 +858,8 @@ static int pcf2127_spi_probe(struct spi_device *spi)
 		return PTR_ERR(regmap);
 	}
 
-	return pcf2127_probe(&spi->dev, regmap, pcf2127_spi_driver.driver.name,
+	return pcf2127_probe(&spi->dev, regmap, spi->irq,
+			     pcf2127_spi_driver.driver.name,
 			     spi_get_device_id(spi)->driver_data);
 }
 
-- 
2.26.2

