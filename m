Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D28B3B3275
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jun 2021 17:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhFXPZO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Jun 2021 11:25:14 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:54868 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbhFXPZM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 24 Jun 2021 11:25:12 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 3336121A70;
        Thu, 24 Jun 2021 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624548172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=zVVyBH4K0z3T5g6w7kw8qpunXOqk93L2d0Rd9B2wSwM=;
        b=Yy0ppKMclBj9Nt+arDh4ff0gXE4UF+qzaI2cRs+E5JvZa0itVW40dGguEk2EDcHMhaXUUc
        M17j0CCH9kgzv99M/yHC43WgJ6QD5NfnHLsEccYxTGURE1V1I/LxUEkHLWWPFO3rYOy2GY
        5RWmU7IyokxHkFHlUoa/+vBuzMjvnpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624548172;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=zVVyBH4K0z3T5g6w7kw8qpunXOqk93L2d0Rd9B2wSwM=;
        b=Jsb5OE9JgH+gpF/MVkswbWb7VlZbtwQjuS8534M3gvSsXa0xlKOcP7gAyRT6xuJPca3o64
        mvnB6sDBCiZGSUAg==
Received: from un68u.suse.de (unknown [10.163.42.126])
        by relay2.suse.de (Postfix) with ESMTP id E779EA3BC5;
        Thu, 24 Jun 2021 15:22:51 +0000 (UTC)
From:   Mian Yousaf Kaukab <ykaukab@suse.de>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        bruno.thomsen@gmail.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        biwen.li@nxp.com, Mian Yousaf Kaukab <ykaukab@suse.de>
Subject: [PATCH v5] rtc: pcf2127: handle timestamp interrupts
Date:   Thu, 24 Jun 2021 17:22:41 +0200
Message-Id: <20210624152241.4476-1-ykaukab@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Handle timestamp interrupts in pcf2127_rtc_irq(). Save time stamp
before clearing TSF1 and TSF2 flags so that it can't be overwritten.
Set a flag to mark if the timestamp is valid and only report to sysfs
if the flag is set. To mimic the hardware behavior, don’t save
another timestamp until the first one has been read by the userspace.

However, if the alarm irq is not configured, keep the old way of
handling timestamp interrupt in the timestamp0 sysfs calls.

Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
---
*Only compile tested due to lack of hardware availability*

history:
v5: -Add irq_enabled flag to keep track of alarm irq. Revert
     to current way of handling timestamp interrupt in sysfs callsbacks
     if alarm irq is not configured
v4: -Save timestamp before clearing TSF1 and TSF2 flags
    -Rename timstamp_valid flag to ts_valid
v3: -Restore call to pcf2127_wdt_active_ping() in timestamp0_store().
     It was removed by mistake.
v2: -Add a flag to mark the occurrence of timestamp interrupt
    -Add Biwen Li in Cc

 drivers/rtc/rtc-pcf2127.c | 172 +++++++++++++++++++++++++++-----------
 1 file changed, 121 insertions(+), 51 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 48ce1e85deb1..5a7e673349ed 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -94,10 +94,20 @@
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
+	time64_t ts;
+	bool ts_valid;
+	bool irq_enabled;
 };
 
 /*
@@ -434,23 +444,92 @@ static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	return pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
 }
 
+static int pcf2127_rtc_ts_read(struct device *dev, time64_t *ts)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	struct rtc_time tm;
+	int ret;
+	unsigned char data[25];
+
+	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_CTRL1, data,
+			       sizeof(data));
+	if (ret) {
+		dev_err(dev, "%s: read error ret=%d\n", __func__, ret);
+		return ret;
+	}
+
+	dev_dbg(dev,
+		"%s: raw data is cr1=%02x, cr2=%02x, cr3=%02x, ts_sc=%02x, ts_mn=%02x, ts_hr=%02x, ts_dm=%02x, ts_mo=%02x, ts_yr=%02x\n",
+		__func__, data[PCF2127_REG_CTRL1], data[PCF2127_REG_CTRL2],
+		data[PCF2127_REG_CTRL3], data[PCF2127_REG_TS_SC],
+		data[PCF2127_REG_TS_MN], data[PCF2127_REG_TS_HR],
+		data[PCF2127_REG_TS_DM], data[PCF2127_REG_TS_MO],
+		data[PCF2127_REG_TS_YR]);
+
+	tm.tm_sec = bcd2bin(data[PCF2127_REG_TS_SC] & 0x7F);
+	tm.tm_min = bcd2bin(data[PCF2127_REG_TS_MN] & 0x7F);
+	tm.tm_hour = bcd2bin(data[PCF2127_REG_TS_HR] & 0x3F);
+	tm.tm_mday = bcd2bin(data[PCF2127_REG_TS_DM] & 0x3F);
+	/* TS_MO register (month) value range: 1-12 */
+	tm.tm_mon = bcd2bin(data[PCF2127_REG_TS_MO] & 0x1F) - 1;
+	tm.tm_year = bcd2bin(data[PCF2127_REG_TS_YR]);
+	if (tm.tm_year < 70)
+		tm.tm_year += 100; /* assume we are in 1970...2069 */
+
+	ret = rtc_valid_tm(&tm);
+	if (ret) {
+		dev_err(dev, "Invalid timestamp. ret=%d\n", ret);
+		return ret;
+	}
+
+	*ts = rtc_tm_to_time64(&tm);
+	return 0;
+};
+
+static void pcf2127_rtc_ts_snapshot(struct device *dev)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	int ret;
+
+	/* Let userspace read the first timestamp */
+	if (pcf2127->ts_valid)
+		return;
+
+	ret = pcf2127_rtc_ts_read(dev, &pcf2127->ts);
+	if (!ret)
+		pcf2127->ts_valid = true;
+}
+
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
+	if (ctrl1 & PCF2127_BIT_CTRL1_TSF1 || ctrl2 & PCF2127_BIT_CTRL2_TSF2)
+		pcf2127_rtc_ts_snapshot(dev);
+
+	if (ctrl1 & PCF2127_CTRL1_IRQ_MASK)
+		regmap_write(pcf2127->regmap, PCF2127_REG_CTRL1,
+			ctrl1 & ~PCF2127_CTRL1_IRQ_MASK);
+
+	if (ctrl2 & PCF2127_CTRL2_IRQ_MASK)
+		regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
+			ctrl2 & ~PCF2127_CTRL2_IRQ_MASK);
 
-	rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
+	if (ctrl2 & PCF2127_BIT_CTRL2_AF)
+		rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
 
 	pcf2127_wdt_active_ping(&pcf2127->wdd);
 
@@ -475,18 +554,22 @@ static ssize_t timestamp0_store(struct device *dev,
 	struct pcf2127 *pcf2127 = dev_get_drvdata(dev->parent);
 	int ret;
 
-	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
-				 PCF2127_BIT_CTRL1_TSF1, 0);
-	if (ret) {
-		dev_err(dev, "%s: update ctrl1 ret=%d\n", __func__, ret);
-		return ret;
-	}
+	if (pcf2127->irq_enabled) {
+		pcf2127->ts_valid = false;
+	} else {
+		ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
+			PCF2127_BIT_CTRL1_TSF1, 0);
+		if (ret) {
+			dev_err(dev, "%s: update ctrl1 ret=%d\n", __func__, ret);
+			return ret;
+		}
 
-	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
-				 PCF2127_BIT_CTRL2_TSF2, 0);
-	if (ret) {
-		dev_err(dev, "%s: update ctrl2 ret=%d\n", __func__, ret);
-		return ret;
+		ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
+			PCF2127_BIT_CTRL2_TSF2, 0);
+		if (ret) {
+			dev_err(dev, "%s: update ctrl2 ret=%d\n", __func__, ret);
+			return ret;
+		}
 	}
 
 	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
@@ -500,50 +583,36 @@ static ssize_t timestamp0_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct pcf2127 *pcf2127 = dev_get_drvdata(dev->parent);
-	struct rtc_time tm;
+	unsigned int ctrl1, ctrl2;
 	int ret;
-	unsigned char data[25];
-
-	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_CTRL1, data,
-			       sizeof(data));
-	if (ret) {
-		dev_err(dev, "%s: read error ret=%d\n", __func__, ret);
-		return ret;
-	}
-
-	dev_dbg(dev,
-		"%s: raw data is cr1=%02x, cr2=%02x, cr3=%02x, ts_sc=%02x, "
-		"ts_mn=%02x, ts_hr=%02x, ts_dm=%02x, ts_mo=%02x, ts_yr=%02x\n",
-		__func__, data[PCF2127_REG_CTRL1], data[PCF2127_REG_CTRL2],
-		data[PCF2127_REG_CTRL3], data[PCF2127_REG_TS_SC],
-		data[PCF2127_REG_TS_MN], data[PCF2127_REG_TS_HR],
-		data[PCF2127_REG_TS_DM], data[PCF2127_REG_TS_MO],
-		data[PCF2127_REG_TS_YR]);
+	time64_t ts;
 
 	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
 	if (ret)
 		return ret;
 
-	if (!(data[PCF2127_REG_CTRL1] & PCF2127_BIT_CTRL1_TSF1) &&
-	    !(data[PCF2127_REG_CTRL2] & PCF2127_BIT_CTRL2_TSF2))
-		return 0;
+	if (pcf2127->irq_enabled) {
+		if (!pcf2127->ts_valid)
+			return 0;
+		ts = pcf2127->ts;
+	} else {
+		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL1, &ctrl1);
+		if (ret)
+			return 0;
 
-	tm.tm_sec = bcd2bin(data[PCF2127_REG_TS_SC] & 0x7F);
-	tm.tm_min = bcd2bin(data[PCF2127_REG_TS_MN] & 0x7F);
-	tm.tm_hour = bcd2bin(data[PCF2127_REG_TS_HR] & 0x3F);
-	tm.tm_mday = bcd2bin(data[PCF2127_REG_TS_DM] & 0x3F);
-	/* TS_MO register (month) value range: 1-12 */
-	tm.tm_mon = bcd2bin(data[PCF2127_REG_TS_MO] & 0x1F) - 1;
-	tm.tm_year = bcd2bin(data[PCF2127_REG_TS_YR]);
-	if (tm.tm_year < 70)
-		tm.tm_year += 100; /* assume we are in 1970...2069 */
+		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
+		if (ret)
+			return 0;
 
-	ret = rtc_valid_tm(&tm);
-	if (ret)
-		return ret;
+		if (!(ctrl1 & PCF2127_BIT_CTRL1_TSF1) &&
+		    !(ctrl2 & PCF2127_BIT_CTRL2_TSF2))
+			return 0;
 
-	return sprintf(buf, "%llu\n",
-		       (unsigned long long)rtc_tm_to_time64(&tm));
+		ret = pcf2127_rtc_ts_read(dev, &ts);
+		if (ret)
+			return 0;
+	}
+	return sprintf(buf, "%llu\n", (unsigned long long)ts);
 };
 
 static DEVICE_ATTR_RW(timestamp0);
@@ -594,6 +663,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 			dev_err(dev, "failed to request alarm irq\n");
 			return ret;
 		}
+		pcf2127->irq_enabled = true;
 	}
 
 	if (alarm_irq > 0 || device_property_read_bool(dev, "wakeup-source")) {
-- 
2.26.2

