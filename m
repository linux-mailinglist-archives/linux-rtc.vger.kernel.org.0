Return-Path: <linux-rtc+bounces-5414-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C62C6D746
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Nov 2025 09:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4833F3802FD
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Nov 2025 08:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B6B329E5C;
	Wed, 19 Nov 2025 08:33:52 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E72313526;
	Wed, 19 Nov 2025 08:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541232; cv=none; b=Y5/cTFrQM4NLV1TkzkSUBRBkquLpkUwP4qiGRDa/YJpA/voUOTe2QItea2scIP01qMnLHkegG7J+bIUyFUjZJDd3RtEH+LUGAsLVZs2ISGQkE5GJCdWlVILlLUNTPsAkg1sITgDDw5133OJ5Tn25htfwXgwL2W4GVoNrm4dMgyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541232; c=relaxed/simple;
	bh=8/UlkaZsFFc1Q8UYlyH3yZantBcn1/jBlLozQ4FaB7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qtjq+tAABR5TC889W8z36WdAlAcAS7qL2Ev9EbGpZ1hvmT0dbif5VaUm/n6nr9YM9qOVYuggVrXOj9sq2Y1h0f/FlOsZPRDPmx6EoLEGG9GeTESu1IHdRmQpASICtyOanO7saLJf5sl7Kcg8Pyz444lMVUhEVQKuYEIq7/1AoY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 82CAB200CD7;
	Wed, 19 Nov 2025 09:33:46 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 57DEA2029F2;
	Wed, 19 Nov 2025 09:33:46 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 148E91800097;
	Wed, 19 Nov 2025 16:33:45 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	linux-watchdog@vger.kernel.org
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v3 5/5] rtc: pcf85363: add watchdog support with configurable step size
Date: Wed, 19 Nov 2025 14:03:36 +0530
Message-Id: <20251119083336.2241142-5-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251119083336.2241142-1-lakshay.piplani@nxp.com>
References: <20251119083336.2241142-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Add watchdog timer support to PCF85263/PCF85363 using the linux watchdog
subsystem. The driver programs the hardware watchdog timeout based on
the requested period.

Also use rtc_add_group() instead of sysfs_create_group() to register
timestamp attributes under the RTC class device (/sys/class/rtc/rtcX).

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
---
V2 -> V3:
- Split into separate patches as suggested:
  - Battery switch-over detection.
  - Timestamp recording for TS pin and battery switch-over events.
  - Offset calibration.
  - Watchdog timer (to be reviewed by watchdog maintainers).
- Dropped Alarm2 support
- Switched to rtc_add_group() for sysfs attributes
- Removed failure paths after RTC device registration as per subsystem guidelines.
V1 -> V2:
- Watchdog related changes due to removal of vendor specific properties
  from device tree
  * remove vendor DT knobs (enable/timeout/stepsize/repeat)
  * use watchdog_init_timeout (with 10s default)
  * derive clock_sel from final timeout
  * default, repeat=true (repeat mode)
- Fixed uninitalised warning on 'ret' (reported by kernel test robot)
- Use dev_dbg instead of dev_info for debug related print messages
- Minor cleanup and comments

 drivers/rtc/rtc-pcf85363.c | 168 +++++++++++++++++++++++++++++++++++--
 1 file changed, 160 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
index 3d733375187b..34d4c2e16774 100644
--- a/drivers/rtc/rtc-pcf85363.c
+++ b/drivers/rtc/rtc-pcf85363.c
@@ -5,6 +5,10 @@
  * Driver for NXP PCF85363 real-time clock.
  *
  * Copyright (C) 2017 Eric Nelson
+ *
+ * Copyright 2025 NXP
+ * Added support for timestamps, battery switch-over,
+ * watchdog, offset calibration.
  */
 #include <linux/module.h>
 #include <linux/i2c.h>
@@ -17,6 +21,8 @@
 #include <linux/device.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
+#include <linux/rtc.h>
+#include <linux/watchdog.h>
 
 /*
  * Date/Time registers
@@ -127,6 +133,18 @@
 #define OFFSET_MAXIMUM  127
 #define OFFSET_MASK     0xFF
 
+#define WD_MODE_REPEAT  BIT(7)
+#define WD_TIMEOUT_MASK GENMASK(6, 2)
+#define WD_TIMEOUT_SHIFT        2
+#define WD_CLKSEL_MASK  GENMASK(1, 0)
+#define WD_CLKSEL_0_25HZ        0x00
+#define WD_CLKSEL_1HZ   0x01
+#define WD_CLKSEL_4HZ   0x02
+#define WD_CLKSEL_16HZ  0x03
+
+#define WD_TIMEOUT_MIN  1
+#define WD_TIMEOUT_MAX  0x1F
+
 struct pcf85363 {
 	struct rtc_device	*rtc;
 	struct regmap		*regmap;
@@ -138,6 +156,15 @@ struct pcf85x63_config {
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
@@ -323,12 +350,13 @@ static irqreturn_t pcf85363_rtc_handle_irq(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	if (flags) {
-		dev_dbg(&pcf85363->rtc->dev, "IRQ flags: 0x%02x%s%s%s%s%s\n",
+		dev_dbg(&pcf85363->rtc->dev, "IRQ flags: 0x%02x%s%s%s%s%s%s\n",
 			flags, (flags & FLAGS_A1F) ? " [A1F]" : "",
 			(flags & FLAGS_TSR1F) ? " [TSR1F]" : "",
 			(flags & FLAGS_TSR2F) ? " [TSR2F]" : "",
 			(flags & FLAGS_TSR3F) ? " [TSR3F]" : "",
-			(flags & FLAGS_BSF) ? " [BSF]" : "");
+			(flags & FLAGS_BSF) ? " [BSF]" : "",
+			(flags & FLAGS_WDF) ? " [WDF]" : "");
 	}
 
 	if (flags & FLAGS_A1F) {
@@ -360,6 +388,11 @@ static irqreturn_t pcf85363_rtc_handle_irq(int irq, void *dev_id)
 		handled = true;
 	}
 
+	if (flags & FLAGS_WDF) {
+		regmap_update_bits(pcf85363->regmap, CTRL_FLAGS, FLAGS_WDF, 0);
+		handled = true;
+	}
+
 	return handled ? IRQ_HANDLED : IRQ_NONE;
 }
 
@@ -503,6 +536,123 @@ static const struct pcf85x63_config pcf_85363_config = {
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
 /*
  * Reads 6 bytes of timestamp data starting at the given base register,
  * converts them from BCD to binary, and formats the result into a
@@ -684,20 +834,22 @@ static int pcf85363_probe(struct i2c_client *client)
 			   PIN_IO_TSPM | PIN_IO_TSIM,
 			   PIN_IO_TSPM | PIN_IO_TSIM);
 
+	ret = pcf85363_watchdog_init(dev, pcf85363->regmap);
+	if (ret)
+		dev_err_probe(dev, ret, "Watchdog init failed\n");
+
 	if (irq_a > 0 || wakeup_source)
 		device_init_wakeup(dev, true);
 
 	dev_set_drvdata(&pcf85363->rtc->dev, pcf85363);
 
-	ret = devm_rtc_register_device(pcf85363->rtc);
-
+	ret = rtc_add_group(pcf85363->rtc, &pcf85363_attr_group);
 	if (ret)
-		return dev_err_probe(dev, ret, "RTC registration failed\n");
-
-	ret = sysfs_create_group(&pcf85363->rtc->dev.kobj, &pcf85363_attr_group);
+		return ret;
 
+	ret = devm_rtc_register_device(pcf85363->rtc);
 	if (ret)
-		return dev_err_probe(dev, ret, "Timestamp sysfs creation failed\n");
+		return dev_err_probe(dev, ret, "RTC registration failed\n");
 
 	for (i = 0; i < config->num_nvram; i++) {
 		nvmem_cfg[i].priv = pcf85363;
-- 
2.25.1


