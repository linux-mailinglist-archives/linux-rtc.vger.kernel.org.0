Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA912000FD
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jun 2020 06:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgFSEMB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Jun 2020 00:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbgFSEL7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 Jun 2020 00:11:59 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6484BC06174E
        for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2020 21:11:58 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id x16so3881703qvr.3
        for <linux-rtc@vger.kernel.org>; Thu, 18 Jun 2020 21:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=INUXC5z3PpO4EB0Ebm3Ug533yed70pK6X+6/rm3Z2g4=;
        b=RSjcXRYzq0+H9HM5HPgioj56oG9mPui8MCXq+SoXMnwsIObGG3LzdBTc2MXcKm6wmd
         ztLihpO3TuRatpmvVoJpCRi9K4YAng+PIfr9kOaNFQMzPH9XbCpmTz+hGme5WUB1Zotu
         Xc5haTdxtZjUVUglpj7Gpy2h7VlsPAwY5XJf5dIolsWDlb0uoeyZo7araY7iXJTHOf9+
         6Q4t6xsss89S5FBRx0T7omIMIoZBxoZVK9e7h0j6gXzEejeECeYP14CrnncB4XXjtNtV
         UXlY2yi5xnQBcyDZKS+8/wtpPh/9fi9h7Md1qjulgPaxb8EzGpMvCExheJ/5ayHeou74
         KkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=INUXC5z3PpO4EB0Ebm3Ug533yed70pK6X+6/rm3Z2g4=;
        b=GLCj2Ke5O8FUd+qzT0DqOPk4ZEuL1hDB2NOPgkZ3uLrUrhGr18bx2IpPZszoAmZa3V
         OU+R8b5LFEvEqgAfkBIv23VNVgIbikpBTiLAIglu+OVwvK9PycVaXU44nHCxkxs0LrV4
         47vmWyRqaxP95P42ZySljkLd+T92WBp//+VnOYjWR1DRmYByyj/VxNeqgzNG560EeBGB
         fIHISzvUhuk7JRwYDm6qf5Gm9cU1+d/lOM3755+rxZ1db+0+wBUmob9f2Zk/P9xSDjT9
         jfQ6Kn2CYt49KCQwwPMIBiMOmZ40R3THKKYh8gqgKWWAZK9JxewKUTcUN2YKnsggiEet
         Q67g==
X-Gm-Message-State: AOAM530tfJcSvnQzsJAzZCAqjnhGiDSBPywwgEABfOJV97fmpZ/UGZe5
        sGLo6epFXoYP6FuhKc0pyvEazRgc
X-Google-Smtp-Source: ABdhPJwLCoeJ0dA0UopNT/NyM61f3kOeaVWXOPUj9I3r9BL/n4ZeCetDo9BlU6fGFIBKZSfisv5K1A==
X-Received: by 2002:a0c:f78b:: with SMTP id s11mr7059312qvn.33.1592539917569;
        Thu, 18 Jun 2020 21:11:57 -0700 (PDT)
Received: from atris.xiphos.ca (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id k22sm5425765qke.33.2020.06.18.21.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 21:11:56 -0700 (PDT)
From:   Liam Beguin <liambeguin@gmail.com>
To:     bruno.thomsen@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org
Subject: [PATCH v3 0/2] rtc: pcf2127: add alarm support
Date:   Fri, 19 Jun 2020 00:11:43 -0400
Message-Id: <20200619041145.1882-1-liambeguin@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The board used to test this series has the interrupt line of the RTC
connected to a circuit controlling the power of the board.
An event on the interrupt line while the board is off will power it on.
Because of these hardware limitations, the irq handler added in this
patch wasn't fully tested.

The alarm fuctionality was tested on a PCA2129, with:

	$ date "2010-10-10 10:10"
	Sun Oct 10 10:10:00 UTC 2010
	$ /usr/sbin/rtcwake -u -d /dev/rtc0  -s10 --mode off
	[ ... ]
	$ # power on after 10 seconds

Changes since v1:
- Document new compatible string for the pca2129
- Add calls to pcf2127_wdt_active_ping after accessing CTRL2
- Use sizeof(buf) instead of hadcoding value
- Cleanup debug trace
- Add interrupt handler and wakeup-source devicetree option

Changes since v2:
- Rebase on latest mainline tree
- Remove redundant if in pcf2127_rtc_alarm_irq_enable
- Remove duplicate watchdog ping in pcf2127_rtc_irq
- Avoid forward declaration
- Remove dev_err strings
- Remove dev_dbg traces since they are now part of the core
- Avoid unnecessary read in pcf2127_rtc_irq with regmap_write
- Add extra rtc_class_ops struct with alarm functions

Liam Beguin (2):
  rtc: pcf2127: add pca2129 device id
  rtc: pcf2127: add alarm support

 .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 +
 drivers/rtc/rtc-pcf2127.c                     | 139 ++++++++++++++++++
 2 files changed, 141 insertions(+)

Interdiff against v2:
diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 22ef1489c1b1..df09d3c6c5c3 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -88,8 +88,6 @@
 #define PCF2127_WD_VAL_MAX		255
 #define PCF2127_WD_VAL_DEFAULT		60
 
-static int pcf2127_wdt_active_ping(struct watchdog_device *wdd);
-
 struct pcf2127 {
 	struct rtc_device *rtc;
 	struct watchdog_device wdd;
@@ -195,140 +193,6 @@ static int pcf2127_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	return 0;
 }
 
-static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
-{
-	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
-	unsigned int buf[5], ctrl2;
-	int ret;
-
-	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
-	if (ret) {
-		dev_err(dev, "%s: ctrl2 read error\n", __func__);
-		return ret;
-	}
-
-	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
-	if (ret)
-		return ret;
-
-	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
-			       sizeof(buf));
-	if (ret) {
-		dev_err(dev, "%s: alarm read error\n", __func__);
-		return ret;
-	}
-
-	alrm->enabled = ctrl2 & PCF2127_BIT_CTRL2_AIE;
-	alrm->pending = ctrl2 & PCF2127_BIT_CTRL2_AF;
-
-	alrm->time.tm_sec = bcd2bin(buf[0] & 0x7F);
-	alrm->time.tm_min = bcd2bin(buf[1] & 0x7F);
-	alrm->time.tm_hour = bcd2bin(buf[2] & 0x3F);
-	alrm->time.tm_mday = bcd2bin(buf[3] & 0x3F);
-	alrm->time.tm_wday = buf[4] & 0x07;
-
-	dev_dbg(dev, "%s: alarm is %d:%d:%d, mday=%d, wday=%d\n", __func__,
-		alrm->time.tm_hour, alrm->time.tm_min, alrm->time.tm_sec,
-		alrm->time.tm_mday, alrm->time.tm_wday);
-
-	return 0;
-}
-
-static int pcf2127_rtc_alarm_irq_enable(struct device *dev, u32 enable)
-{
-	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
-	int ret;
-
-	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
-				 PCF2127_BIT_CTRL2_AIE,
-				 enable ? PCF2127_BIT_CTRL2_AIE : 0);
-	if (ret) {
-		dev_err(dev, "%s: failed to %s alarm (%d)\n", __func__,
-			enable ? "enable" : "disable",
-			ret);
-		return ret;
-	}
-
-	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
-{
-	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
-	uint8_t buf[5];
-	int ret;
-
-	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
-				 PCF2127_BIT_CTRL2_AF, 0);
-	if (ret) {
-		dev_err(dev, "%s: failed to clear alarm interrupt flag (%d)",
-			__func__, ret);
-		return ret;
-	}
-
-	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
-	if (ret)
-		return ret;
-
-	buf[0] = bin2bcd(alrm->time.tm_sec);
-	buf[1] = bin2bcd(alrm->time.tm_min);
-	buf[2] = bin2bcd(alrm->time.tm_hour);
-	buf[3] = bin2bcd(alrm->time.tm_mday);
-	buf[4] = (alrm->time.tm_wday & 0x07);
-
-	dev_dbg(dev, "%s: alarm set for: %d:%d:%d, mday=%d, wday=%d\n",
-		__func__, alrm->time.tm_hour, alrm->time.tm_min,
-		alrm->time.tm_sec, alrm->time.tm_mday, alrm->time.tm_wday);
-
-	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
-				sizeof(buf));
-	if (ret) {
-		dev_err(dev, "%s: failed to write alarm registers (%d)",
-			__func__, ret);
-		return ret;
-	}
-
-	pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
-
-	return 0;
-}
-
-static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
-{
-	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
-	unsigned int ctrl2 = 0;
-	int ret = 0;
-
-	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
-	if (ret) {
-		dev_err(dev, "%s: ctrl2 read error (%d)\n", __func__, ret);
-		goto irq_err;
-	}
-
-	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
-	if (ret)
-		goto irq_err;
-
-	if (ctrl2 & PCF2127_BIT_CTRL2_AF) {
-		regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
-				   PCF2127_BIT_CTRL2_AF, 0);
-
-		ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
-		if (ret)
-			goto irq_err;
-
-		rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
-	}
-
-	return IRQ_HANDLED;
-irq_err:
-	return IRQ_NONE;
-}
-
 static int pcf2127_rtc_ioctl(struct device *dev,
 				unsigned int cmd, unsigned long arg)
 {
@@ -360,12 +224,9 @@ static int pcf2127_rtc_ioctl(struct device *dev,
 }
 
 static const struct rtc_class_ops pcf2127_rtc_ops = {
-	.ioctl            = pcf2127_rtc_ioctl,
-	.read_time        = pcf2127_rtc_read_time,
-	.set_time         = pcf2127_rtc_set_time,
-	.read_alarm       = pcf2127_rtc_read_alarm,
-	.set_alarm        = pcf2127_rtc_set_alarm,
-	.alarm_irq_enable = pcf2127_rtc_alarm_irq_enable,
+	.ioctl		= pcf2127_rtc_ioctl,
+	.read_time	= pcf2127_rtc_read_time,
+	.set_time	= pcf2127_rtc_set_time,
 };
 
 static int pcf2127_nvmem_read(void *priv, unsigned int offset,
@@ -472,6 +333,116 @@ static const struct watchdog_ops pcf2127_watchdog_ops = {
 	.set_timeout = pcf2127_wdt_set_timeout,
 };
 
+/* Alarm */
+static int pcf2127_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	unsigned int buf[5], ctrl2;
+	int ret;
+
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
+	if (ret)
+		return ret;
+
+	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
+			       sizeof(buf));
+	if (ret)
+		return ret;
+
+	alrm->enabled = ctrl2 & PCF2127_BIT_CTRL2_AIE;
+	alrm->pending = ctrl2 & PCF2127_BIT_CTRL2_AF;
+
+	alrm->time.tm_sec = bcd2bin(buf[0] & 0x7F);
+	alrm->time.tm_min = bcd2bin(buf[1] & 0x7F);
+	alrm->time.tm_hour = bcd2bin(buf[2] & 0x3F);
+	alrm->time.tm_mday = bcd2bin(buf[3] & 0x3F);
+	alrm->time.tm_wday = buf[4] & 0x07;
+
+	return 0;
+}
+
+static int pcf2127_rtc_alarm_irq_enable(struct device *dev, u32 enable)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
+				 PCF2127_BIT_CTRL2_AIE,
+				 enable ? PCF2127_BIT_CTRL2_AIE : 0);
+	if (ret)
+		return ret;
+
+	return pcf2127_wdt_active_ping(&pcf2127->wdd);
+}
+
+static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	uint8_t buf[5];
+	int ret;
+
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
+				 PCF2127_BIT_CTRL2_AF, 0);
+	if (ret)
+		return ret;
+
+	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
+	if (ret)
+		return ret;
+
+	buf[0] = bin2bcd(alrm->time.tm_sec);
+	buf[1] = bin2bcd(alrm->time.tm_min);
+	buf[2] = bin2bcd(alrm->time.tm_hour);
+	buf[3] = bin2bcd(alrm->time.tm_mday);
+	buf[4] = (alrm->time.tm_wday & 0x07);
+
+	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_ALARM_SC, buf,
+				sizeof(buf));
+	if (ret)
+		return ret;
+
+	return pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
+}
+
+static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	unsigned int ctrl2 = 0;
+	int ret = 0;
+
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
+	if (ret)
+		goto irq_err;
+
+	if (ctrl2 & PCF2127_BIT_CTRL2_AF) {
+		regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
+			     ctrl2 & ~PCF2127_BIT_CTRL2_AF);
+
+		rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
+	}
+
+	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
+	if (ret)
+		goto irq_err;
+
+	return IRQ_HANDLED;
+irq_err:
+	return IRQ_NONE;
+}
+
+static const struct rtc_class_ops pcf2127_rtc_alrm_ops = {
+	.ioctl            = pcf2127_rtc_ioctl,
+	.read_time        = pcf2127_rtc_read_time,
+	.set_time         = pcf2127_rtc_set_time,
+	.read_alarm       = pcf2127_rtc_read_alarm,
+	.set_alarm        = pcf2127_rtc_set_alarm,
+	.alarm_irq_enable = pcf2127_rtc_alarm_irq_enable,
+};
+
 /* sysfs interface */
 
 static ssize_t timestamp0_store(struct device *dev,
@@ -601,8 +572,10 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		}
 	}
 
-	if (alarm_irq >= 0 || device_property_read_bool(dev, "wakeup-source"))
+	if (alarm_irq >= 0 || device_property_read_bool(dev, "wakeup-source")) {
 		device_init_wakeup(dev, true);
+		pcf2127->rtc->ops = &pcf2127_rtc_alrm_ops;
+	}
 
 	pcf2127->wdd.parent = dev;
 	pcf2127->wdd.info = &pcf2127_wdt_info;

base-commit: 5e857ce6eae7ca21b2055cca4885545e29228fe2
-- 
2.27.0

