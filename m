Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDD436F7AE
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Apr 2021 11:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbhD3JTz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 30 Apr 2021 05:19:55 -0400
Received: from mx2.suse.de ([195.135.220.15]:58792 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229507AbhD3JTy (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 30 Apr 2021 05:19:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6AC75AF52;
        Fri, 30 Apr 2021 09:19:05 +0000 (UTC)
From:   Mian Yousaf Kaukab <ykaukab@suse.de>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        biwen.li@nxp.com, Mian Yousaf Kaukab <ykaukab@suse.de>
Subject: [PATCH v2] rtc: pcf2127: handle timestamp interrupts
Date:   Fri, 30 Apr 2021 11:18:52 +0200
Message-Id: <20210430091852.16444-1-ykaukab@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

commit 03623b4b041c ("rtc: pcf2127: add tamper detection support")
added support for timestamp interrupts. However they are not being
handled in the irq handler. If a timestamp interrupt occurs it
results in kernel disabling the interrupt and displaying the call
trace:

[  121.145580] irq 78: nobody cared (try booting with the "irqpoll" option)
...
[  121.238087] [<00000000c4d69393>] irq_default_primary_handler threaded [<000000000a90d25b>] pcf2127_rtc_irq [rtc_pcf2127]
[  121.248971] Disabling IRQ #78

Handle timestamp interrupts in pcf2127_rtc_irq(). Set a flag to mark
the timestamp as valid and only report to sysfs if the flag is set.

Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
---
history:
v2: -Add a flag to mark the occurrence of timestamp interrupt
    -Add Biwen Li in Cc

 drivers/rtc/rtc-pcf2127.c | 53 +++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index d13c20a2adf7..0e2333ea1243 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -94,10 +94,18 @@
 #define PCF2127_WD_VAL_MAX		255
 #define PCF2127_WD_VAL_DEFAULT		60
 
+/* Mask for currently enabled interrupts */
+#define PCF2127_CTRL1_IRQ_MASK (PCF2127_BIT_CTRL1_TSF1)
+#define PCF2127_CTRL2_IRQ_MASK ( \
+		PCF2127_BIT_CTRL2_AF | \
+		PCF2127_BIT_CTRL2_WDTF | \
+		PCF2127_BIT_CTRL2_TSF2)
+
 struct pcf2127 {
 	struct rtc_device *rtc;
 	struct watchdog_device wdd;
 	struct regmap *regmap;
+	bool timestamp_valid;
 };
 
 /*
@@ -437,20 +445,33 @@ static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
 {
 	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
-	unsigned int ctrl2 = 0;
+	unsigned int ctrl1, ctrl2;
 	int ret = 0;
 
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL1, &ctrl1);
+	if (ret)
+		return IRQ_NONE;
+
 	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
 	if (ret)
 		return IRQ_NONE;
 
-	if (!(ctrl2 & PCF2127_BIT_CTRL2_AF))
+	if (!(ctrl1 & PCF2127_CTRL1_IRQ_MASK || ctrl2 & PCF2127_CTRL2_IRQ_MASK))
 		return IRQ_NONE;
 
-	regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
-		     ctrl2 & ~(PCF2127_BIT_CTRL2_AF | PCF2127_BIT_CTRL2_WDTF));
+	if (ctrl1 & PCF2127_CTRL1_IRQ_MASK)
+		regmap_write(pcf2127->regmap, PCF2127_REG_CTRL1,
+			ctrl1 & ~PCF2127_CTRL1_IRQ_MASK);
+
+	if (ctrl2 & PCF2127_CTRL2_IRQ_MASK)
+		regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
+			ctrl2 & ~PCF2127_CTRL2_IRQ_MASK);
 
-	rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
+	if (ctrl1 & PCF2127_BIT_CTRL1_TSF1 || ctrl2 & PCF2127_BIT_CTRL2_TSF2)
+		pcf2127->timestamp_valid = true;
+
+	if (ctrl2 & PCF2127_BIT_CTRL2_AF)
+		rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
 
 	pcf2127_wdt_active_ping(&pcf2127->wdd);
 
@@ -473,25 +494,8 @@ static ssize_t timestamp0_store(struct device *dev,
 				const char *buf, size_t count)
 {
 	struct pcf2127 *pcf2127 = dev_get_drvdata(dev->parent);
-	int ret;
 
-	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
-				 PCF2127_BIT_CTRL1_TSF1, 0);
-	if (ret) {
-		dev_err(dev, "%s: update ctrl1 ret=%d\n", __func__, ret);
-		return ret;
-	}
-
-	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
-				 PCF2127_BIT_CTRL2_TSF2, 0);
-	if (ret) {
-		dev_err(dev, "%s: update ctrl2 ret=%d\n", __func__, ret);
-		return ret;
-	}
-
-	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
-	if (ret)
-		return ret;
+	pcf2127->timestamp_valid = false;
 
 	return count;
 };
@@ -524,8 +528,7 @@ static ssize_t timestamp0_show(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (!(data[PCF2127_REG_CTRL1] & PCF2127_BIT_CTRL1_TSF1) &&
-	    !(data[PCF2127_REG_CTRL2] & PCF2127_BIT_CTRL2_TSF2))
+	if (!pcf2127->timestamp_valid)
 		return 0;
 
 	tm.tm_sec = bcd2bin(data[PCF2127_REG_TS_SC] & 0x7F);
-- 
2.26.2

