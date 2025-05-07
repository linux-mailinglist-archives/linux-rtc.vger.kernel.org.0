Return-Path: <linux-rtc+bounces-4054-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 256A1AAD7E7
	for <lists+linux-rtc@lfdr.de>; Wed,  7 May 2025 09:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 859924A38FE
	for <lists+linux-rtc@lfdr.de>; Wed,  7 May 2025 07:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4768C21E087;
	Wed,  7 May 2025 07:26:29 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7620021D5BB;
	Wed,  7 May 2025 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602789; cv=none; b=nnb8qiiJIrsX58G7/NOsdaKIGcw0w8IS6crvQYwxfndvnZwqByxMnPK54DrgWIiGXsBvrvolG6ykIJWz3aBo4S1su2b1ezshxnhqt/wBHvqrWYMD+IYYJByycP1u3tR9zZ1ArySy1gM+biiwJuF4IjbwVRku+wN7zMwv1suCUt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602789; c=relaxed/simple;
	bh=SXl1JYMGiJ7Dg/QmJDx4EqFiseAPxUT4hrsFQ4HOGnY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CO/+kA2qDvCfdgLjv/uBvPvQBZKfWbtoK8+Kj1Cyp9lYR1cwudQDCMGvl5g2u+HrTvcXTLCSIQzTOxehtfKjFrb0fcFbQvDoZkVUvsE2XAWMLc63xZWbtqD4hi9AKB3ubaDXmY9piRUek21LnXDWEXOdEdVn9Gfb2Ap1AXIRtw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CFBB51A32DC;
	Wed,  7 May 2025 09:26:24 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6A5591A32D1;
	Wed,  7 May 2025 09:26:24 +0200 (CEST)
Received: from lsv03305.swis.in-blr01.nxp.com (lsv03305.swis.in-blr01.nxp.com [92.120.147.118])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 1A407180007B;
	Wed,  7 May 2025 15:26:23 +0800 (+08)
From: Pankit Garg <pankit.garg@nxp.com>
To: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	alexandre.belloni@bootlin.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	daniel.aguirre@nxp.com,
	shashank.rebbapragada@nxp.com,
	aman.kumarpandey@nxp.com,
	Pankit Garg <pankit.garg@nxp.com>
Subject: [PATCH v3 2/2] rtc: Add NXP PCF85053A driver support
Date: Wed,  7 May 2025 12:56:18 +0530
Message-Id: <20250507072618.153960-2-pankit.garg@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250507072618.153960-1-pankit.garg@nxp.com>
References: <20250507072618.153960-1-pankit.garg@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

PCF85053A is i2c based RTC which supports timer and calendar
functionality.

Features supported:
1. Read/Write time
2. Get/Set Alarm
3. Wakeup Source
4. Generate 32768Hz clock output
5. Secondary i2c bus

Signed-off-by: Daniel Aguirre <daniel.aguirre@nxp.com>
Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
---
V2 -> V3: Add MAINTAINERS file changes to this patch
V1 -> V2: no changes

---
 MAINTAINERS                 |   6 +
 drivers/rtc/Kconfig         |  10 +
 drivers/rtc/Makefile        |   1 +
 drivers/rtc/rtc-pcf85053a.c | 594 ++++++++++++++++++++++++++++++++++++
 4 files changed, 611 insertions(+)
 create mode 100644 drivers/rtc/rtc-pcf85053a.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0737dcb2e411..fa342615831d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17782,6 +17782,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
 F:	sound/soc/codecs/tfa989x.c
 
+NXP RTC PCF85053A DRIVER
+M:     Pankit Garg<pankit.garg@nxp.com>
+L:     linux-kernel@vger.kernel.org
+S:     Maintained
+F:	drivers/rtc/rtc-pcf85053a.c
+
 NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
 M:	Jonas Malaco <jonas@protocubo.io>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 838bdc138ffe..669470e92a7d 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -492,6 +492,16 @@ config RTC_DRV_PCF85063
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-pcf85063.
 
+config RTC_DRV_PCF85053A
+	tristate "NXP PCF85053A"
+	depends on OF
+	help
+	  If you say yes here you get support for the NXP PCF85053A I2C Bootable CPU RTC
+	  chip.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-pcf85053a.
+
 config RTC_DRV_PCF85363
 	tristate "NXP PCF85363"
 	select REGMAP_I2C
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 31473b3276d9..64ae988e7fa6 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -127,6 +127,7 @@ obj-$(CONFIG_RTC_DRV_PCAP)	+= rtc-pcap.o
 obj-$(CONFIG_RTC_DRV_PCF2123)	+= rtc-pcf2123.o
 obj-$(CONFIG_RTC_DRV_PCF2127)	+= rtc-pcf2127.o
 obj-$(CONFIG_RTC_DRV_PCF85063)	+= rtc-pcf85063.o
+obj-$(CONFIG_RTC_DRV_PCF85053A)	+= rtc-pcf85053a.o
 obj-$(CONFIG_RTC_DRV_PCF8523)	+= rtc-pcf8523.o
 obj-$(CONFIG_RTC_DRV_PCF85363)	+= rtc-pcf85363.o
 obj-$(CONFIG_RTC_DRV_PCF8563)	+= rtc-pcf8563.o
diff --git a/drivers/rtc/rtc-pcf85053a.c b/drivers/rtc/rtc-pcf85053a.c
new file mode 100644
index 000000000000..83e2bcbca4d4
--- /dev/null
+++ b/drivers/rtc/rtc-pcf85053a.c
@@ -0,0 +1,594 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright 2025 NXP
+
+#include <linux/bcd.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/rtc.h>
+#include <linux/slab.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/regmap.h>
+
+#define PCF85053A_REG_SC		0x00 /* seconds */
+#define PCF85053A_REG_SCA		0x01 /* alarm */
+#define PCF85053A_REG_MN		0x02 /* minutes */
+#define PCF85053A_REG_MNA		0x03 /* alarm */
+#define PCF85053A_REG_HR		0x04 /* hour */
+#define PCF85053A_REG_HRA		0x05 /* alarm */
+#define PCF85053A_REG_DW		0x06 /* day of week */
+#define PCF85053A_REG_DM		0x07 /* day of month */
+#define PCF85053A_REG_MO		0x08 /* month */
+#define PCF85053A_REG_YR		0x09 /* year */
+#define PCF85053A_REG_CTRL		0x0A /* timer control */
+#define PCF85053A_REG_ST		0x0B /* status */
+#define PCF85053A_REG_CLKO		0x0C /* clock out */
+#define PCF85053A_REG_ACC		0x14 /* xclk access */
+
+#define PCF85053A_BIT_AF		BIT(7)
+#define PCF85053A_BIT_ST		BIT(7)
+#define PCF85053A_BIT_DM		BIT(6)
+#define PCF85053A_BIT_HF		BIT(5)
+#define PCF85053A_BIT_DSM		BIT(4)
+#define PCF85053A_BIT_AIE		BIT(3)
+#define PCF85053A_BIT_OFIE		BIT(2)
+#define PCF85053A_BIT_CIE		BIT(1)
+#define PCF85053A_BIT_TWO		BIT(0)
+#define PCF85053A_BIT_XCLK		BIT(7)
+
+#define PCF85053A_REG_BAT_MASK		0x07 /* Battery mask */
+#define PCF85053A_REG_CLKO_F_MASK	0x03 /* Frequenc mask */
+#define PCF85053A_REG_CLKO_CKE		0x80 /* clock out enabled */
+
+struct pcf85053a_config {
+	const struct regmap_config regmap;
+	unsigned has_alarms:1;
+};
+
+struct pcf85053a {
+	struct rtc_device *rtc;
+	struct i2c_client *client;
+	struct regmap	*regmap;
+#ifdef CONFIG_COMMON_CLK
+	struct clk_hw clkout_hw;
+#endif
+};
+
+static int pcf85053a_set_alarm_mode(struct device *dev, bool on)
+{
+	struct pcf85053a *pcf85053a = dev_get_drvdata(dev);
+	struct i2c_client *client = to_i2c_client(dev);
+	unsigned int val;
+	int err;
+
+	err = regmap_read(pcf85053a->regmap, PCF85053A_REG_CTRL, &val);
+	if (err)
+		return err;
+
+	if (on)
+		val |= PCF85053A_BIT_AIE;
+	else
+		val &= ~PCF85053A_BIT_AIE;
+
+	val |= PCF85053A_BIT_CIE;
+	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_CTRL, val);
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write PCF85053A_REG_CTRL\n");
+		return err;
+	}
+
+	err = regmap_read(pcf85053a->regmap, PCF85053A_REG_ST, &val);
+	if (err)
+		return err;
+
+	val &= ~(PCF85053A_BIT_AF);
+	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_ST, val);
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write PCF85053A_REG_ST\n");
+		return err;
+	}
+
+	return 0;
+}
+
+static int pcf85053a_get_alarm_mode(struct device *dev,
+				    unsigned char *alarm_enable, unsigned char *alarm_flag)
+{
+	struct pcf85053a *pcf85053a = dev_get_drvdata(dev);
+	struct i2c_client *client = to_i2c_client(dev);
+	unsigned int val;
+	int err;
+
+	if (alarm_enable) {
+		dev_dbg(&client->dev, "%s:PCF85053A_REG_CTRL\n", __func__);
+		err = regmap_read(pcf85053a->regmap, PCF85053A_REG_CTRL, &val);
+		if (err)
+			return err;
+		*alarm_enable = val & PCF85053A_BIT_AIE;
+	}
+
+	if (alarm_flag) {
+		dev_dbg(&client->dev, "%s:PCF85053A_REG_ST\n", __func__);
+		err = regmap_read(pcf85053a->regmap, PCF85053A_REG_ST, &val);
+		if (err)
+			return err;
+		*alarm_flag = val & PCF85053A_BIT_AF;
+	}
+
+	dev_dbg(&client->dev, "%s:alarm_enable:%x alarm_flag:%x\n",
+		__func__, *alarm_enable, *alarm_flag);
+
+	return 0;
+}
+
+static irqreturn_t pcf85053a_irq(int irq, void *dev_id)
+{
+	struct pcf85053a *pcf85053a = i2c_get_clientdata(dev_id);
+	struct i2c_client *client = pcf85053a->client;
+	int err;
+	unsigned char alarm_flag;
+	unsigned char alarm_enable;
+
+	err = pcf85053a_get_alarm_mode(&client->dev, &alarm_enable, &alarm_flag);
+	if (err)
+		return IRQ_NONE;
+
+	if (alarm_flag) {
+		rtc_update_irq(pcf85053a->rtc, 1, RTC_IRQF | RTC_AF);
+		pcf85053a_set_alarm_mode(&client->dev, 0);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+/*
+ * In the routines that deal directly with the PCF85053A hardware, we use
+ * rtc_time -- month 0-11, hour 0-23, yr = calendar year-epoch.
+ */
+static int pcf85053a_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct pcf85053a *pcf85053a = dev_get_drvdata(dev);
+	struct i2c_client *client = to_i2c_client(dev);
+	unsigned char regs[10];
+	unsigned int val;
+	int err;
+
+	err = regmap_read(pcf85053a->regmap, PCF85053A_REG_ST, &val);
+	if (err)
+		return err;
+
+	if (0 == (val & PCF85053A_REG_BAT_MASK)) {
+		dev_err(&client->dev, " BVL[2:0] value is 0x0 (Battery Voltage <= 1.7V), information is not reliable.\n");
+		return -EINVAL;
+	}
+
+	err = regmap_bulk_read(pcf85053a->regmap, PCF85053A_REG_SC, regs,
+			       sizeof(regs));
+	if (err)
+		return err;
+
+	tm->tm_sec = bcd2bin(regs[PCF85053A_REG_SC] & 0x7F);
+	tm->tm_min = bcd2bin(regs[PCF85053A_REG_MN] & 0x7F);
+	tm->tm_hour = bcd2bin(regs[PCF85053A_REG_HR] & 0x3F);
+	tm->tm_wday = regs[PCF85053A_REG_DW] & 0x07;
+	tm->tm_mday = bcd2bin(regs[PCF85053A_REG_DM] & 0x3F);
+	tm->tm_mon = bcd2bin(regs[PCF85053A_REG_MO] & 0x1F) - 1;
+	tm->tm_year = bcd2bin(regs[PCF85053A_REG_YR]) + 100;
+
+	return 0;
+}
+
+static int pcf85053a_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct pcf85053a *pcf85053a = dev_get_drvdata(dev);
+	struct i2c_client *client = to_i2c_client(dev);
+	int err;
+
+	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_SC, bin2bcd(tm->tm_sec));
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write PCF85053A_REG_SC\n");
+		return err;
+	}
+
+	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_MN, bin2bcd(tm->tm_min));
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write PCF85053A_REG_MN\n");
+		return err;
+	}
+
+	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_HR, bin2bcd(tm->tm_hour));
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write PCF85053A_REG_HR\n");
+		return err;
+	}
+
+	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_DW, tm->tm_wday & 0x07);
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write PCF85053A_REG_DW\n");
+		return err;
+	}
+
+	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_DM, bin2bcd(tm->tm_mday));
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write PCF85053A_REG_DM\n");
+		return err;
+	}
+
+	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_MO, bin2bcd(tm->tm_mon + 1));
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write PCF85053A_REG_MO\n");
+		return err;
+	}
+
+	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_YR, bin2bcd(tm->tm_year - 100));
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write PCF85053A_REG_YR\n");
+		return err;
+	}
+
+	return err;
+}
+
+static int pcf85053a_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
+{
+	struct pcf85053a *pcf85053a = dev_get_drvdata(dev);
+	struct i2c_client *client = to_i2c_client(dev);
+	unsigned char buf[5];
+	int err;
+
+	err = regmap_bulk_read(pcf85053a->regmap, PCF85053A_REG_SCA, buf,
+			       sizeof(buf));
+	if (err)
+		return err;
+
+	dev_dbg(&client->dev, "%s: raw data is sec=%02x, min=%02x hr=%02x\n",
+		__func__, buf[0], buf[2], buf[4]);
+
+	tm->time.tm_sec = bcd2bin(buf[0] & 0x7F);
+	tm->time.tm_min = bcd2bin(buf[2] & 0x7F);
+	tm->time.tm_hour = bcd2bin(buf[4] & 0x3F);
+
+	err = pcf85053a_get_alarm_mode(dev, &tm->enabled, &tm->pending);
+	if (err < 0)
+		return err;
+
+	dev_dbg(&client->dev, "%s:s=%d m=%d, hr=%d, enabled=%d, pending=%d\n",
+		__func__, tm->time.tm_sec, tm->time.tm_min,
+		tm->time.tm_hour, tm->enabled, tm->pending);
+
+	return 0;
+}
+
+static int pcf85053a_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
+{
+	struct pcf85053a *pcf85053a = dev_get_drvdata(dev);
+	struct i2c_client *client = to_i2c_client(dev);
+	int err;
+
+	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_SCA, bin2bcd(tm->time.tm_sec));
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write PCF85053A_REG_SCA\n");
+		return err;
+	}
+
+	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_MNA, bin2bcd(tm->time.tm_min));
+	if (err < 0) {
+		dev_dbg(&client->dev, "Unable to write PCF85053A_REG_MNA\n");
+		return err;
+	}
+
+	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_HRA, bin2bcd(tm->time.tm_hour));
+	if (err < 0) {
+		dev_dbg(&client->dev, "Unable to write PCF85053A_REG_HRA\n");
+		return err;
+	}
+
+	return pcf85053a_set_alarm_mode(dev, tm->enabled);
+}
+
+static int pcf85053a_irq_enable(struct device *dev, unsigned int enabled)
+{
+	dev_dbg(dev, "%s: alarm enable=%d\n", __func__, enabled);
+
+	return pcf85053a_set_alarm_mode(dev, enabled);
+}
+
+static int pcf85053a_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
+{
+	struct pcf85053a *pcf85053a = dev_get_drvdata(dev);
+	int status;
+	unsigned int val = 0;
+
+	switch (cmd) {
+	case RTC_VL_READ:
+		status = regmap_read(pcf85053a->regmap, PCF85053A_REG_ST, &val);
+		if (status)
+			return status;
+
+		if (!(status & PCF85053A_REG_BAT_MASK))
+			val |= RTC_VL_DATA_INVALID;
+
+		return put_user(val, (unsigned int __user *)arg);
+
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
+
+#ifdef CONFIG_COMMON_CLK
+/*
+ * Handling of the clkout
+ */
+
+#define clkout_hw_to_pcf85053a(_hw) container_of(_hw, struct pcf85053a, clkout_hw)
+
+static const int clkout_rates[] = {
+	32768,
+	1024,
+	32,
+	1,
+};
+
+static unsigned long pcf85053a_clkout_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct pcf85053a *pcf85053a = clkout_hw_to_pcf85053a(hw);
+	int err;
+	unsigned int val = 0;
+
+	err = regmap_read(pcf85053a->regmap, PCF85053A_REG_CLKO, &val);
+	if (err)
+		return 0;
+
+	val &= PCF85053A_REG_CLKO_F_MASK;
+	return clkout_rates[val];
+}
+
+static long pcf85053a_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
+					unsigned long *prate)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
+		if (clkout_rates[i] <= rate)
+			return clkout_rates[i];
+
+	return 0;
+}
+
+static int pcf85053a_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
+{
+	struct pcf85053a *pcf85053a = clkout_hw_to_pcf85053a(hw);
+	int err, i;
+	unsigned int val = 0;
+
+	err = regmap_read(pcf85053a->regmap, PCF85053A_REG_CLKO, &val);
+	if (err)
+		return err;
+
+	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
+		if (clkout_rates[i] == rate) {
+			val &= ~PCF85053A_REG_CLKO_F_MASK;
+			val |= i;
+			return regmap_write(pcf85053a->regmap, PCF85053A_REG_CLKO, val);
+		}
+
+	return -EINVAL;
+}
+
+static int pcf85053a_clkout_control(struct clk_hw *hw, bool enable)
+{
+	struct pcf85053a *pcf85053a = clkout_hw_to_pcf85053a(hw);
+	int err;
+	unsigned int val = 0;
+
+	val = PCF85053A_BIT_XCLK;
+	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_ACC, val);
+	if (err)
+		return err;
+
+	err = regmap_read(pcf85053a->regmap, PCF85053A_REG_CLKO, &val);
+	if (err)
+		return err;
+
+	if (enable)
+		val |= PCF85053A_REG_CLKO_CKE;
+	else
+		val &= ~PCF85053A_REG_CLKO_CKE;
+
+	return regmap_write(pcf85053a->regmap, PCF85053A_REG_CLKO, val);
+}
+
+static int pcf85053a_clkout_prepare(struct clk_hw *hw)
+{
+	return pcf85053a_clkout_control(hw, 1);
+}
+
+static void pcf85053a_clkout_unprepare(struct clk_hw *hw)
+{
+	pcf85053a_clkout_control(hw, 0);
+}
+
+static int pcf85053a_clkout_is_prepared(struct clk_hw *hw)
+{
+	struct pcf85053a *pcf85053a = clkout_hw_to_pcf85053a(hw);
+	int err;
+	unsigned int val = 0;
+
+	err = regmap_read(pcf85053a->regmap, PCF85053A_REG_CLKO, &val);
+	if (err)
+		return err;
+
+	return val & PCF85053A_REG_CLKO_CKE;
+}
+
+static const struct clk_ops pcf85053a_clkout_ops = {
+	.prepare = pcf85053a_clkout_prepare,
+	.unprepare = pcf85053a_clkout_unprepare,
+	.is_prepared = pcf85053a_clkout_is_prepared,
+	.recalc_rate = pcf85053a_clkout_recalc_rate,
+	.round_rate = pcf85053a_clkout_round_rate,
+	.set_rate = pcf85053a_clkout_set_rate,
+};
+
+static struct clk *pcf85053a_clkout_register_clk(struct pcf85053a *pcf85053a)
+{
+	struct i2c_client *client = pcf85053a->client;
+	struct device_node *node = client->dev.of_node;
+	struct clk *clk;
+	struct clk_init_data init;
+
+	init.name = "pcf85053a-clkout";
+	init.ops = &pcf85053a_clkout_ops;
+	init.flags = 0;
+	init.parent_names = NULL;
+	init.num_parents = 0;
+	pcf85053a->clkout_hw.init = &init;
+
+	/* optional override of the clockname */
+	of_property_read_string(node, "clock-output-names", &init.name);
+
+	/* register the clock */
+	clk = devm_clk_register(&client->dev, &pcf85053a->clkout_hw);
+
+	if (!IS_ERR(clk))
+		of_clk_add_provider(node, of_clk_src_simple_get, clk);
+
+	return clk;
+}
+#endif
+
+static const struct rtc_class_ops pcf85053a_rtc_ops = {
+	.read_time	= pcf85053a_rtc_read_time,
+	.set_time	= pcf85053a_rtc_set_time,
+	.read_alarm	= pcf85053a_rtc_read_alarm,
+	.set_alarm	= pcf85053a_rtc_set_alarm,
+	.alarm_irq_enable = pcf85053a_irq_enable,
+	.ioctl		= pcf85053a_ioctl,
+};
+
+static const struct pcf85053a_config config_pcf85053a = {
+	.regmap = {
+		.reg_bits = 8,
+		.val_bits = 8,
+		.max_register = 0x1D,
+	},
+	.has_alarms = 1,
+};
+
+static int pcf85053a_probe(struct i2c_client *client)
+{
+	struct pcf85053a *pcf85053a;
+	int err;
+	unsigned int flags;
+	const struct pcf85053a_config *config;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
+				     I2C_FUNC_SMBUS_BYTE |
+				     I2C_FUNC_SMBUS_BLOCK_DATA))
+		return -ENODEV;
+
+	pcf85053a = devm_kzalloc(&client->dev, sizeof(struct pcf85053a),
+				 GFP_KERNEL);
+	if (!pcf85053a)
+		return -ENOMEM;
+
+	config = i2c_get_match_data(client);
+	if (!config)
+		return -ENODEV;
+
+	pcf85053a->regmap = devm_regmap_init_i2c(client, &config->regmap);
+	if (IS_ERR(pcf85053a->regmap))
+		return PTR_ERR(pcf85053a->regmap);
+
+	i2c_set_clientdata(client, pcf85053a);
+
+	pcf85053a->client = client;
+	device_set_wakeup_capable(&client->dev, 1);
+
+	err = regmap_read(pcf85053a->regmap, PCF85053A_REG_CTRL, &flags);
+	if (err) {
+		dev_err(&client->dev, "RTC chip is not present\n");
+		return err;
+	}
+	if (flags & PCF85053A_BIT_TWO)
+		dev_dbg(&client->dev, "%s: PCF85053A_BIT_TWO is set\n", __func__);
+
+	flags = PCF85053A_BIT_TWO;
+	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_CTRL, flags);
+	if (err) {
+		dev_err(&client->dev, "Unable to write PCF85053A_REG_CTRL\n");
+		return err;
+	}
+
+	flags = 0;
+	err = regmap_write(pcf85053a->regmap, PCF85053A_REG_ST, flags);
+	if (err) {
+		dev_err(&client->dev, "%s: write error\n", __func__);
+		return err;
+	}
+
+	pcf85053a->rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(pcf85053a->rtc))
+		return PTR_ERR(pcf85053a->rtc);
+
+	pcf85053a->rtc->ops = &pcf85053a_rtc_ops;
+	pcf85053a->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	pcf85053a->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, pcf85053a->rtc->features);
+	clear_bit(RTC_FEATURE_ALARM, pcf85053a->rtc->features);
+
+	if (config->has_alarms && client->irq > 0) {
+		err = devm_request_threaded_irq(&client->dev, client->irq,
+						NULL, pcf85053a_irq,
+						IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
+						"pcf85053a", client);
+		if (err) {
+			dev_err(&client->dev, "unable to request IRQ %d\n", client->irq);
+		} else {
+			set_bit(RTC_FEATURE_ALARM, pcf85053a->rtc->features);
+			device_init_wakeup(&client->dev, true);
+			err = dev_pm_set_wake_irq(&client->dev, client->irq);
+			if (err)
+				dev_err(&client->dev, "failed to enable irq wake\n");
+		}
+	}
+
+#ifdef CONFIG_COMMON_CLK
+	/* register clk in common clk framework */
+	pcf85053a_clkout_register_clk(pcf85053a);
+#endif
+
+	return devm_rtc_register_device(pcf85053a->rtc);
+}
+
+static const struct i2c_device_id pcf85053a_id[] = {
+	{ "pcf85053a", .driver_data = (kernel_ulong_t)&config_pcf85053a },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, pcf85053a_id);
+
+static const struct of_device_id pcf85053a_of_match[] = {
+	{ .compatible = "nxp,pcf85053a", .data = &config_pcf85053a  },
+	{}
+};
+MODULE_DEVICE_TABLE(of, pcf85053a_of_match);
+
+static struct i2c_driver pcf85053a_driver = {
+	.driver		= {
+		.name	= "rtc-pcf85053a",
+		.of_match_table = of_match_ptr(pcf85053a_of_match),
+	},
+	.probe		= pcf85053a_probe,
+	.id_table	= pcf85053a_id,
+};
+
+module_i2c_driver(pcf85053a_driver);
+
+MODULE_AUTHOR("Pankit Garg <pankit.garg@nxp.com>");
+MODULE_DESCRIPTION("NXP pcf85053a RTC driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


