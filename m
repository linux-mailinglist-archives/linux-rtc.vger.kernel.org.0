Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54E90398E51
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jun 2021 17:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbhFBPUZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Jun 2021 11:20:25 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:60112 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232231AbhFBPUO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Jun 2021 11:20:14 -0400
Received: from relay2.suse.de (unknown [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 7E5BF22D67;
        Wed,  2 Jun 2021 15:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622647109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=bEAqO4ULpxCsXaufPKqbIo1XP/NQFlS+c7RV1a4/vUQ=;
        b=hm5Jc38GhMAXMLIf8U37cUfCcTntJzq6Zd3uoZG8cz541RTqE4UMjOCX5/tSy34tQU4gbc
        0ylqiDIbKyalosBahkjlKuOuHbFDszzPQdD0puIanRlUiMjb+NgBooAlJICh0Q3IS2C/kN
        NbPrTwnmrKu3T3H2R0pPdrVaLzerFCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622647109;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=bEAqO4ULpxCsXaufPKqbIo1XP/NQFlS+c7RV1a4/vUQ=;
        b=f6iMM1oY2iORpoB26Z3eZAK3IxL2pWbK9B5Ff8vpG1o1cW2v8TXyk4tbZYjlPf1P1Fe2zt
        G30B82MHuuzqskDw==
Received: by relay2.suse.de (Postfix, from userid 51)
        id 7A1D8A3D18; Wed,  2 Jun 2021 16:03:43 +0000 (UTC)
Received: from un68u.suse.de (unknown [10.163.42.126])
        by relay2.suse.de (Postfix) with ESMTP id 2AF22A48D7;
        Wed,  2 Jun 2021 10:50:24 +0000 (UTC)
From:   Mian Yousaf Kaukab <ykaukab@suse.de>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        biwen.li@nxp.com, Mian Yousaf Kaukab <ykaukab@suse.de>
Subject: [PATCH RESEND v4] rtc: pcf2127: handle timestamp interrupts
Date:   Wed,  2 Jun 2021 12:49:56 +0200
Message-Id: <20210602104956.806-1-ykaukab@suse.de>
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

Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
---
 drivers/rtc/rtc-pcf2127.c | 130 ++++++++++++++++++++++----------------
 1 file changed, 76 insertions(+), 54 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index d13c20a2adf7..7d55f737f38e 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -94,10 +94,19 @@
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
 };
 
 /*
@@ -434,23 +443,82 @@ static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	return pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
 }
 
+static void pcf2127_rtc_ts_snapshot(struct device *dev)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	struct rtc_time tm;
+	int ret;
+	unsigned char data[25];
+
+	/* Let userspace read the first timestamp */
+	if (pcf2127->ts_valid)
+		return;
+
+	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_CTRL1, data,
+			       sizeof(data));
+	if (ret) {
+		dev_err(dev, "%s: read error ret=%d\n", __func__, ret);
+		return;
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
+		return;
+	}
+
+	pcf2127->ts = rtc_tm_to_time64(&tm);
+	pcf2127->ts_valid = true;
+};
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
 
-	rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
+	if (ctrl1 & PCF2127_CTRL1_IRQ_MASK)
+		regmap_write(pcf2127->regmap, PCF2127_REG_CTRL1,
+			ctrl1 & ~PCF2127_CTRL1_IRQ_MASK);
+
+	if (ctrl2 & PCF2127_CTRL2_IRQ_MASK)
+		regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
+			ctrl2 & ~PCF2127_CTRL2_IRQ_MASK);
+
+	if (ctrl2 & PCF2127_BIT_CTRL2_AF)
+		rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
 
 	pcf2127_wdt_active_ping(&pcf2127->wdd);
 
@@ -475,19 +543,7 @@ static ssize_t timestamp0_store(struct device *dev,
 	struct pcf2127 *pcf2127 = dev_get_drvdata(dev->parent);
 	int ret;
 
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
+	pcf2127->ts_valid = false;
 
 	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
 	if (ret)
@@ -500,50 +556,16 @@ static ssize_t timestamp0_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct pcf2127 *pcf2127 = dev_get_drvdata(dev->parent);
-	struct rtc_time tm;
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
 
 	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
 	if (ret)
 		return ret;
 
-	if (!(data[PCF2127_REG_CTRL1] & PCF2127_BIT_CTRL1_TSF1) &&
-	    !(data[PCF2127_REG_CTRL2] & PCF2127_BIT_CTRL2_TSF2))
+	if (!pcf2127->ts_valid)
 		return 0;
 
-	tm.tm_sec = bcd2bin(data[PCF2127_REG_TS_SC] & 0x7F);
-	tm.tm_min = bcd2bin(data[PCF2127_REG_TS_MN] & 0x7F);
-	tm.tm_hour = bcd2bin(data[PCF2127_REG_TS_HR] & 0x3F);
-	tm.tm_mday = bcd2bin(data[PCF2127_REG_TS_DM] & 0x3F);
-	/* TS_MO register (month) value range: 1-12 */
-	tm.tm_mon = bcd2bin(data[PCF2127_REG_TS_MO] & 0x1F) - 1;
-	tm.tm_year = bcd2bin(data[PCF2127_REG_TS_YR]);
-	if (tm.tm_year < 70)
-		tm.tm_year += 100; /* assume we are in 1970...2069 */
-
-	ret = rtc_valid_tm(&tm);
-	if (ret)
-		return ret;
-
-	return sprintf(buf, "%llu\n",
-		       (unsigned long long)rtc_tm_to_time64(&tm));
+	return sprintf(buf, "%llu\n", (unsigned long long)pcf2127->ts);
 };
 
 static DEVICE_ATTR_RW(timestamp0);
-- 
2.26.2

