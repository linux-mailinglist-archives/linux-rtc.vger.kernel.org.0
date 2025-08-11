Return-Path: <linux-rtc+bounces-4663-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A29DFB201AD
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 10:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE7BF164E7A
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 08:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2F82DCF53;
	Mon, 11 Aug 2025 08:21:40 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708AD2DC33B;
	Mon, 11 Aug 2025 08:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900500; cv=none; b=ELCoJzbRtpjnLOO3hitMmP2Jge9GwLo1mRPfKT/crNsw1jH7EJuEG7tNuMG/a7D7kAihqoilJNmGoLoP4RddVIFa3Vu2yXatUtLd6VjiO3sQ4zr0QWof0o0/heZn+kYNbD14owVZ98OXtfmkQ9PNqGF5WDPf9qyZC3Kscf0XFss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900500; c=relaxed/simple;
	bh=Co8cvvO15jThhuo8nxcUUgEHpd5r0KrfkU6zZnTEiwM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K2uXOAHf0PSfLrluVrM/rW9JhTTy+ZiLALqT08VBjG6uBfezWYd1t6GOcH1xqYlSetiPHp1Z0wIPQ59dSIsxbu8Oj9/lLLQWfBJqBrj4kNspLYbCXZ2dJ2Nz2YqRrt1MKqCbIxvq7puNuY2E7sFRe8wvlbBB5TkGIX2WMNcLark=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F0F14202335;
	Mon, 11 Aug 2025 10:21:29 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 84DBC200F84;
	Mon, 11 Aug 2025 10:21:29 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 37AEC180009C;
	Mon, 11 Aug 2025 16:21:28 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v2 2/2] rtc: pcf85363: add support for additional features
Date: Mon, 11 Aug 2025 13:51:23 +0530
Message-Id: <20250811082123.1099880-2-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250811082123.1099880-1-lakshay.piplani@nxp.com>
References: <20250811082123.1099880-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Add support for additional features to the NXP PCF8263/PCF85363 RTC driver:
- Alarm2 (minute,hour,weekday)
- Timestamps recording for TS pin and Battery switch-over events
- Battery switch over detection
- Offset calibration
- Watchdog timer

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
---
Changes in v2:
- Watchdog related changes due to removal of vendor specific properties
  from device tree
  * remove vendor DT knobs (enable/timeout/stepsize/repeat)
  * use watchdog_init_timeout (with 10s default)
  * derive clock_sel from final timeout
  * default, repeat=true (repeat mode)
- Fixed uninitalised warning on 'ret' (reported by kernel test robot)
- Use dev_dbg instead of dev_info for debug related print messages
- Minor cleanup and comments

 drivers/rtc/rtc-pcf85363.c | 557 ++++++++++++++++++++++++++++++++++---
 1 file changed, 522 insertions(+), 35 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
index 540042b9eec8..c5c59876bad5 100644
--- a/drivers/rtc/rtc-pcf85363.c
+++ b/drivers/rtc/rtc-pcf85363.c
@@ -5,6 +5,10 @@
  * Driver for NXP PCF85363 real-time clock.
  *
  * Copyright (C) 2017 Eric Nelson
+ *
+ * Copyright 2025 NXP
+ * Added support for alarm2, timestamps, battery switch-over,
+ * watchdog, offset calibration.
  */
 #include <linux/module.h>
 #include <linux/i2c.h>
@@ -15,7 +19,11 @@
 #include <linux/errno.h>
 #include <linux/bcd.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_device.h>
 #include <linux/regmap.h>
+#include <linux/watchdog.h>
+#include <linux/uaccess.h>
 
 /*
  * Date/Time registers
@@ -100,19 +108,48 @@
 #define PIN_IO_INTA_OUT	2
 #define PIN_IO_INTA_HIZ	3
 
+#define PIN_IO_TSPM	GENMASK(3, 2)
+#define PIN_IO_TSIM	BIT(4)
+
 #define OSC_CAP_SEL	GENMASK(1, 0)
 #define OSC_CAP_6000	0x01
 #define OSC_CAP_12500	0x02
 
 #define STOP_EN_STOP	BIT(0)
+#define RTCM_BIT	BIT(4)
 
 #define RESET_CPR	0xa4
 
 #define NVRAM_SIZE	0x40
 
+#define TSR1_MASK	0x03
+#define TSR2_MASK	0x07
+#define TSR3_MASK	0x03
+#define TSR1_SHIFT	0
+#define TSR2_SHIFT	2
+#define TSR3_SHIFT	6
+
+#define WD_MODE_REPEAT	BIT(7)
+#define WD_TIMEOUT_MASK	GENMASK(6, 2)
+#define WD_TIMEOUT_SHIFT	2
+#define WD_CLKSEL_MASK	GENMASK(1, 0)
+#define WD_CLKSEL_0_25HZ	0x00
+#define WD_CLKSEL_1HZ	0x01
+#define WD_CLKSEL_4HZ	0x02
+#define WD_CLKSEL_16HZ	0x03
+
+#define WD_TIMEOUT_MIN	1
+#define WD_TIMEOUT_MAX	0x1F
+
+#define OFFSET_SIGN_BIT	7
+#define OFFSET_MINIMUM	-128
+#define OFFSET_MAXIMUM	127
+#define OFFSET_MASK	0xFF
+
 struct pcf85363 {
 	struct rtc_device	*rtc;
 	struct regmap		*regmap;
+	u8 ts_valid_flags;
 };
 
 struct pcf85x63_config {
@@ -120,6 +157,15 @@ struct pcf85x63_config {
 	unsigned int num_nvram;
 };
 
+struct pcf85363_watchdog {
+	struct watchdog_device wdd;
+	struct regmap *regmap;
+	struct device *dev;
+	u8 timeout_val;
+	u8 clock_sel;
+	bool repeat;
+};
+
 static int pcf85363_load_capacitance(struct pcf85363 *pcf85363, struct device_node *node)
 {
 	u32 load = 7000;
@@ -295,28 +341,147 @@ static int pcf85363_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 static irqreturn_t pcf85363_rtc_handle_irq(int irq, void *dev_id)
 {
 	struct pcf85363 *pcf85363 = i2c_get_clientdata(dev_id);
+	bool handled = false;
 	unsigned int flags;
 	int err;
 
 	err = regmap_read(pcf85363->regmap, CTRL_FLAGS, &flags);
+
 	if (err)
 		return IRQ_NONE;
 
+	if (flags) {
+		dev_dbg(&pcf85363->rtc->dev, "IRQ flags: 0x%02x%s%s%s%s%s%s%s\n",
+			flags, (flags & FLAGS_A1F) ? " [A1F]" : "",
+			(flags & FLAGS_A2F) ? " [A2F]" : "",
+			(flags & FLAGS_BSF) ? " [BSF]" : "",
+			(flags & FLAGS_TSR1F) ? " [TSR1F]" : "",
+			(flags & FLAGS_TSR2F) ? " [TSR2F]" : "",
+			(flags & FLAGS_TSR3F) ? " [TSR3F]" : "",
+			(flags & FLAGS_WDF) ? " [WDF]" : "");
+	}
+
 	if (flags & FLAGS_A1F) {
 		rtc_update_irq(pcf85363->rtc, 1, RTC_IRQF | RTC_AF);
 		regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_A1F, 0);
-		return IRQ_HANDLED;
+		handled = true;
+	}
+
+	if (flags & FLAGS_A2F) {
+		rtc_update_irq(pcf85363->rtc, 1, RTC_IRQF | RTC_AF);
+		regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_A2F, 0);
+		handled = true;
+	}
+
+	if (flags & FLAGS_BSF) {
+		regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_BSF, 0);
+		handled = true;
+	}
+
+	if (flags & FLAGS_TSR1F) {
+		regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_TSR1F, 0);
+		pcf85363->ts_valid_flags |= FLAGS_TSR1F;
+		handled = true;
+	}
+
+	if (flags & FLAGS_TSR2F) {
+		regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_TSR2F, 0);
+		pcf85363->ts_valid_flags |= FLAGS_TSR2F;
+		handled = true;
+	}
+
+	if (flags & FLAGS_TSR3F) {
+		regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_TSR3F, 0);
+		pcf85363->ts_valid_flags |= FLAGS_TSR3F;
+		handled = true;
+	}
+
+	if (flags & FLAGS_WDF) {
+		regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_WDF, 0);
+		handled = true;
+	}
+
+	return handled ? IRQ_HANDLED : IRQ_NONE;
+}
+
+/*
+ * Read the current RTC offset from the CTRL_OFFSET
+ * register. This value is an 8-bit signed 2's complement
+ * value that corrects osciallator drift.
+ */
+static int pcf85363_read_offset(struct device *dev, long *offset)
+{
+	struct pcf85363 *pcf85363 = dev_get_drvdata(dev);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(pcf85363->regmap, CTRL_OFFSET, &val);
+
+	if (ret)
+		return ret;
+
+	*offset = sign_extend32(val & OFFSET_MASK, OFFSET_SIGN_BIT);
+
+	return 0;
+}
+
+/*
+ * Write an oscillator offset correction value to
+ * the CTRL_OFFSET register. The valid range is
+ * -128 to 127 (8-bit signed), typically used to fine
+ * tune accuracy.
+ */
+static int pcf85363_set_offset(struct device *dev, long offset)
+{
+	struct pcf85363 *pcf85363 = dev_get_drvdata(dev);
+
+	if (offset < OFFSET_MINIMUM || offset > OFFSET_MAXIMUM) {
+		dev_warn(dev, "Offset out of range: %ld\n", offset);
+		return -ERANGE;
+	}
+
+	return regmap_write(pcf85363->regmap, CTRL_OFFSET, offset & OFFSET_MASK);
+}
+
+static int pcf85363_rtc_ioctl(struct device *dev,
+			      unsigned int cmd, unsigned long arg)
+{
+	struct pcf85363 *pcf85363 = dev_get_drvdata(dev);
+	unsigned int val;
+	int ret;
+
+	switch (cmd) {
+	case RTC_VL_READ: {
+		u32 status = 0;
+
+		ret = regmap_read(pcf85363->regmap, CTRL_FLAGS, &val);
+
+		if (ret)
+			return ret;
+
+		if (val & FLAGS_BSF)
+			status |= RTC_VL_BACKUP_SWITCH;
+
+		return put_user(status, (u32 __user *)arg);
 	}
 
-	return IRQ_NONE;
+	case RTC_VL_CLR:
+		return regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_BSF, 0);
+
+	default:
+		return -ENOIOCTLCMD;
+	}
 }
 
 static const struct rtc_class_ops rtc_ops = {
+	.ioctl	= pcf85363_rtc_ioctl,
 	.read_time	= pcf85363_rtc_read_time,
 	.set_time	= pcf85363_rtc_set_time,
 	.read_alarm	= pcf85363_rtc_read_alarm,
 	.set_alarm	= pcf85363_rtc_set_alarm,
 	.alarm_irq_enable = pcf85363_rtc_alarm_irq_enable,
+	.read_offset = pcf85363_read_offset,
+	.set_offset = pcf85363_set_offset,
 };
 
 static int pcf85363_nvram_read(void *priv, unsigned int offset, void *val,
@@ -379,11 +544,297 @@ static const struct pcf85x63_config pcf_85363_config = {
 	.num_nvram = 2
 };
 
+/*
+ * This function sets the watchdog control register based on the timeout,
+ * clock selection and repeat mode settings. It prepares the value to
+ * write into the watchdog control register (CTRL_WDOG).
+ */
+static int pcf85363_wdt_reload(struct pcf85363_watchdog *wd)
+{
+	u8 val;
+
+	val = (wd->repeat ? WD_MODE_REPEAT : 0) |
+	       ((wd->timeout_val & WD_TIMEOUT_MAX) << WD_TIMEOUT_SHIFT) |
+	       (wd->clock_sel & WD_CLKSEL_MASK);
+
+	return regmap_write(wd->regmap, CTRL_WDOG, val);
+}
+
+static int pcf85363_wdt_start(struct watchdog_device *wdd)
+{
+	struct pcf85363_watchdog *wd = watchdog_get_drvdata(wdd);
+
+	return pcf85363_wdt_reload(wd);
+}
+
+static int pcf85363_wdt_stop(struct watchdog_device *wdd)
+{
+	struct pcf85363_watchdog *wd = watchdog_get_drvdata(wdd);
+
+	return regmap_write(wd->regmap, CTRL_WDOG, 0);
+}
+
+static int pcf85363_wdt_ping(struct watchdog_device *wdd)
+{
+	struct pcf85363_watchdog *wd = watchdog_get_drvdata(wdd);
+
+	regmap_update_bits(wd->regmap, CTRL_FLAGS, FLAGS_WDF, 0);
+
+	return pcf85363_wdt_reload(wd);
+}
+
+static int pcf85363_wdt_set_timeout(struct watchdog_device *wdd,
+				    unsigned int timeout)
+{
+	struct pcf85363_watchdog *wd = watchdog_get_drvdata(wdd);
+
+	wd->timeout_val = clamp(timeout, WD_TIMEOUT_MIN, WD_TIMEOUT_MAX);
+	wdd->timeout = wd->timeout_val;
+
+	return pcf85363_wdt_reload(wd);
+}
+
+static const struct watchdog_info pcf85363_wdt_info = {
+	.identity = "PCF85363 Watchdog",
+	.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
+};
+
+static const struct watchdog_ops pcf85363_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = pcf85363_wdt_start,
+	.stop = pcf85363_wdt_stop,
+	.ping = pcf85363_wdt_ping,
+	.set_timeout = pcf85363_wdt_set_timeout,
+};
+
+static int pcf85363_watchdog_init(struct device *dev, struct regmap *regmap)
+{
+	struct pcf85363_watchdog *wd;
+	unsigned int timeout_sec;
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_WATCHDOG))
+		return 0;
+
+	wd = devm_kzalloc(dev, sizeof(*wd), GFP_KERNEL);
+	if (!wd)
+		return -ENOMEM;
+
+	wd->regmap = regmap;
+	wd->dev = dev;
+
+	wd->wdd.info = &pcf85363_wdt_info;
+	wd->wdd.ops = &pcf85363_wdt_ops;
+	wd->wdd.min_timeout = WD_TIMEOUT_MIN;
+	wd->wdd.max_timeout = WD_TIMEOUT_MAX;
+	wd->wdd.parent = dev;
+	wd->wdd.status = WATCHDOG_NOWAYOUT_INIT_STATUS;
+
+	ret = watchdog_init_timeout(&wd->wdd, 10, dev);
+	if (ret)
+		wd->wdd.timeout = clamp(10U, WD_TIMEOUT_MIN, WD_TIMEOUT_MAX);
+
+	timeout_sec = wd->wdd.timeout;
+
+	if (timeout_sec <= 2)
+		wd->clock_sel = WD_CLKSEL_16HZ;
+	else if (timeout_sec <= 8)
+		wd->clock_sel = WD_CLKSEL_4HZ;
+	else if (timeout_sec <= 16)
+		wd->clock_sel = WD_CLKSEL_1HZ;
+	else
+		wd->clock_sel = WD_CLKSEL_0_25HZ;
+
+	wd->repeat = true;
+
+	ret = regmap_update_bits(regmap, CTRL_FLAGS, FLAGS_WDF, 0);
+	if (ret) {
+		dev_err(dev, "failed to clear WDF:%d\n", ret);
+		return ret;
+	}
+
+	watchdog_set_drvdata(&wd->wdd, wd);
+
+	dev_dbg(dev, "pcf85363 watchdog registered (timeout=%us, clk_sel=%u)\n",
+		timeout_sec, wd->clock_sel);
+
+	return devm_watchdog_register_device(dev, &wd->wdd);
+}
+
+/*
+ * Parses a string in the format "min hour weekday", validates the values,
+ * converts them to BCD, writes them to the Alarm2 registers, and enables
+ * the Alarm2 time match bits (minute, hour, weekday).
+ */
+static ssize_t alarm2_time_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct pcf85363 *pcf85363 = dev_get_drvdata(dev);
+	int min, hour, weekday;
+	u8 regbuf[3];
+	int ret;
+
+	if (sscanf(buf, "%d %d %d", &min, &hour, &weekday) != 3)
+		return -EINVAL;
+
+	if (min < 0 || min > 59 || hour < 0 || hour > 23 || weekday < 0 || weekday > 6)
+		return -EINVAL;
+
+	regbuf[0] = bin2bcd(min);
+	regbuf[1] = bin2bcd(hour);
+	regbuf[2] = weekday & 0x07;
+
+	ret = regmap_bulk_write(pcf85363->regmap, DT_MINUTE_ALM2, regbuf, sizeof(regbuf));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(pcf85363->regmap, DT_ALARM_EN,
+				 ALRM_MIN_A2E | ALRM_HR_A2E | ALRM_DAY_A2E,
+				 ALRM_MIN_A2E | ALRM_HR_A2E | ALRM_DAY_A2E);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/*
+ * Parses a string ("0" or "1") to control Alarm2 interrupt generation.
+ * Also clears the Alarm2 flag if the alarm is being disabled.
+ */
+static ssize_t alarm2_enable_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct pcf85363 *pcf85363 = dev_get_drvdata(dev);
+	unsigned long enable;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &enable);
+	if (ret)
+		return ret;
+
+	if (enable) {
+		ret = regmap_update_bits(pcf85363->regmap, CTRL_INTA_EN,
+					 INT_A2IE, INT_A2IE);
+	} else {
+		ret = regmap_update_bits(pcf85363->regmap, CTRL_INTA_EN,
+					 INT_A2IE, 0);
+		if (ret)
+			return ret;
+
+		ret = regmap_update_bits(pcf85363->regmap, CTRL_FLAGS,
+					 FLAGS_A2F, 0);
+	}
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static DEVICE_ATTR_WO(alarm2_time);
+static DEVICE_ATTR_WO(alarm2_enable);
+
+static struct attribute *alarm2_attrs[] = {
+	&dev_attr_alarm2_time.attr,
+	&dev_attr_alarm2_enable.attr,
+	NULL
+};
+
+static struct attribute_group alarm2_group = {
+	.name = "alarm2",
+	.attrs = alarm2_attrs,
+};
+
+/*
+ * Reads 6 bytes of timestamp data starting at the given base register,
+ * converts them from BCD to binary, and formats the result into a
+ * human-readable string in "YYYY-MM-DD HH:MM:SS" format.
+ */
+static int pcf85363_read_timestamp(struct pcf85363 *pcf85363, u8 base_reg, char *buf)
+{
+	struct rtc_time tm;
+	u8 regs[6];
+	int ret;
+
+	ret = regmap_bulk_read(pcf85363->regmap, base_reg, regs, sizeof(regs));
+
+	if (ret)
+		return ret;
+
+	tm.tm_sec = bcd2bin(regs[0]);
+	tm.tm_min = bcd2bin(regs[1]);
+	tm.tm_hour = bcd2bin(regs[2]);
+	tm.tm_mday = bcd2bin(regs[3]);
+	tm.tm_mon = bcd2bin(regs[4]) - 1;
+	tm.tm_year = bcd2bin(regs[5]) + 100;
+
+	return sysfs_emit(buf, "%04d-%02d-%02d %02d:%02d:%02d\n",
+			  tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
+			  tm.tm_hour, tm.tm_min, tm.tm_sec);
+}
+
+/*
+ * Checks whether a specific timestamp flag is set. If so, reads and
+ * returns the formatted timestamp. Otherwise, returns "00-00-00 00:00:00".
+ */
+
+static ssize_t pcf85363_timestamp_show(struct device *dev, char *buf,
+				       u8 timestamp_flag, u8 base_reg)
+{
+	struct pcf85363 *pcf85363 = dev_get_drvdata(dev);
+
+	if (!(pcf85363->ts_valid_flags & timestamp_flag))
+		return sysfs_emit(buf, "00-00-00 00:00:00\n");
+
+	return pcf85363_read_timestamp(pcf85363, base_reg, buf);
+}
+
+static ssize_t timestamp1_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	return pcf85363_timestamp_show(dev, buf, FLAGS_TSR1F, DT_TIMESTAMP1);
+}
+static DEVICE_ATTR_RO(timestamp1);
+
+static ssize_t timestamp2_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	return pcf85363_timestamp_show(dev, buf, FLAGS_TSR2F, DT_TIMESTAMP2);
+}
+static DEVICE_ATTR_RO(timestamp2);
+
+static ssize_t timestamp3_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	return pcf85363_timestamp_show(dev, buf, FLAGS_TSR3F, DT_TIMESTAMP3);
+}
+static DEVICE_ATTR_RO(timestamp3);
+
+static struct attribute *pcf85363_attrs[] = {
+	&dev_attr_timestamp1.attr,
+	&dev_attr_timestamp2.attr,
+	&dev_attr_timestamp3.attr,
+	NULL,
+};
+
+static const struct attribute_group pcf85363_attr_group = {
+	.attrs = pcf85363_attrs,
+};
+
 static int pcf85363_probe(struct i2c_client *client)
 {
-	struct pcf85363 *pcf85363;
 	const struct pcf85x63_config *config = &pcf_85363_config;
 	const void *data = of_device_get_match_data(&client->dev);
+	struct device *dev = &client->dev;
+	struct pcf85363 *pcf85363;
+	int irq_a = client->irq;
+	bool wakeup_source;
+	int ret, i, err;
+	u32 tsr_mode[3];
+	u8 val;
+
 	static struct nvmem_config nvmem_cfg[] = {
 		{
 			.name = "pcf85x63-",
@@ -401,25 +852,43 @@ static int pcf85363_probe(struct i2c_client *client)
 			.reg_write = pcf85363_nvram_write,
 		},
 	};
-	int ret, i, err;
-	bool wakeup_source;
 
 	if (data)
 		config = data;
 
-	pcf85363 = devm_kzalloc(&client->dev, sizeof(struct pcf85363),
-				GFP_KERNEL);
+	pcf85363 = devm_kzalloc(&client->dev, sizeof(*pcf85363), GFP_KERNEL);
 	if (!pcf85363)
 		return -ENOMEM;
 
+	pcf85363->ts_valid_flags = 0;
+
 	pcf85363->regmap = devm_regmap_init_i2c(client, &config->regmap);
-	if (IS_ERR(pcf85363->regmap)) {
-		dev_err(&client->dev, "regmap allocation failed\n");
-		return PTR_ERR(pcf85363->regmap);
-	}
+	if (IS_ERR(pcf85363->regmap))
+		return dev_err_probe(dev, PTR_ERR(pcf85363->regmap), "regmap init failed\n");
 
 	i2c_set_clientdata(client, pcf85363);
 
+	ret = regmap_update_bits(pcf85363->regmap, CTRL_FUNCTION, RTCM_BIT, 0);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable RTC mode\n");
+
+	if (!device_property_read_u32_array(dev, "nxp,timestamp-mode", tsr_mode, 3)) {
+		tsr_mode[0] &= TSR1_MASK;
+		tsr_mode[1] &= TSR2_MASK;
+		tsr_mode[2] &= TSR3_MASK;
+
+		val = (tsr_mode[2] << TSR3_SHIFT) |
+		      (tsr_mode[1] << TSR2_SHIFT) |
+		      (tsr_mode[0] << TSR1_SHIFT);
+
+		ret = regmap_write(pcf85363->regmap, DT_TS_MODE, val);
+		if (ret)
+			dev_warn(dev, "Failed to write timestamp mode register\n");
+
+		dev_dbg(dev, "Timestamp mode set: TSR1=0x%x TSR2=0x%x TSR3=0x%x\n",
+			tsr_mode[0], tsr_mode[1], tsr_mode[2]);
+	}
+
 	pcf85363->rtc = devm_rtc_allocate_device(&client->dev);
 	if (IS_ERR(pcf85363->rtc))
 		return PTR_ERR(pcf85363->rtc);
@@ -433,39 +902,57 @@ static int pcf85363_probe(struct i2c_client *client)
 	pcf85363->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	pcf85363->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-	wakeup_source = device_property_read_bool(&client->dev,
-						  "wakeup-source");
-	if (client->irq > 0 || wakeup_source) {
-		regmap_write(pcf85363->regmap, CTRL_FLAGS, 0);
-		regmap_update_bits(pcf85363->regmap, CTRL_PIN_IO,
-				   PIN_IO_INTAPM, PIN_IO_INTA_OUT);
-	}
+	wakeup_source = device_property_read_bool(dev, "wakeup-source");
 
-	if (client->irq > 0) {
-		unsigned long irqflags = IRQF_TRIGGER_LOW;
+	ret = regmap_write(pcf85363->regmap, CTRL_FLAGS, 0x00);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to clear CTRL_FLAGS\n");
+
+	if (irq_a > 0) {
+		regmap_update_bits(pcf85363->regmap, CTRL_PIN_IO, PIN_IO_INTAPM, PIN_IO_INTA_OUT);
+		ret = devm_request_threaded_irq(dev, irq_a, NULL,
+						pcf85363_rtc_handle_irq,
+						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+						"pcf85363-inta", client);
 
-		if (dev_fwnode(&client->dev))
-			irqflags = 0;
-		ret = devm_request_threaded_irq(&client->dev, client->irq,
-						NULL, pcf85363_rtc_handle_irq,
-						irqflags | IRQF_ONESHOT,
-						"pcf85363", client);
 		if (ret) {
-			dev_warn(&client->dev,
-				 "unable to request IRQ, alarms disabled\n");
-			client->irq = 0;
+			dev_err_probe(dev, ret, "INTA IRQ request failed\n");
+			irq_a = 0;
+		} else {
+			regmap_write(pcf85363->regmap, CTRL_INTA_EN, INT_BSIE
+				     | INT_TSRIE | INT_WDIE);
 		}
 	}
 
-	if (client->irq > 0 || wakeup_source) {
-		device_init_wakeup(&client->dev, true);
-		set_bit(RTC_FEATURE_ALARM, pcf85363->rtc->features);
-	} else {
-		clear_bit(RTC_FEATURE_ALARM, pcf85363->rtc->features);
-	}
+	regmap_update_bits(pcf85363->regmap, CTRL_PIN_IO,
+			   PIN_IO_TSPM | PIN_IO_TSIM,
+			   PIN_IO_TSPM | PIN_IO_TSIM);
+
+	ret = pcf85363_watchdog_init(dev, pcf85363->regmap);
+
+	if (ret)
+		dev_err_probe(dev, ret, "Watchdog init failed\n");
+
+	if (irq_a > 0 || wakeup_source)
+		device_init_wakeup(dev, true);
+
+	dev_set_drvdata(&pcf85363->rtc->dev, pcf85363);
 
 	ret = devm_rtc_register_device(pcf85363->rtc);
 
+	if (ret)
+		return dev_err_probe(dev, ret, "RTC registration failed\n");
+
+	ret = sysfs_create_group(&pcf85363->rtc->dev.kobj, &alarm2_group);
+
+	if (ret)
+		dev_err_probe(dev, ret, "Alarm2 sysfs creation failed\n");
+
+	ret = sysfs_create_group(&pcf85363->rtc->dev.kobj, &pcf85363_attr_group);
+
+	if (ret)
+		dev_err_probe(dev, ret, "Timestamp sysfs creation failed\n");
+
 	for (i = 0; i < config->num_nvram; i++) {
 		nvmem_cfg[i].priv = pcf85363;
 		devm_rtc_nvmem_register(pcf85363->rtc, &nvmem_cfg[i]);
-- 
2.25.1


