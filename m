Return-Path: <linux-rtc+bounces-1709-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4174295C912
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 11:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B92071F220A2
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 09:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8CA14B084;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/3WHDQJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B910114A0BD;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724404787; cv=none; b=snHzhlV3vTfqDcGxCVxgwXTjeDxR8FHh5aPJaRE9gW9mEd8f5X+th9DIhfWQs9nZhvT9LZukyq5MC+5EFznx5cpvx/LX7oeBBC+erOUCwKh/oiYr8UFsldOYCWYiBvzEhs3PZMfbVuzStRyHMJC3PpVXARWmnSwO8k72D0HSKs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724404787; c=relaxed/simple;
	bh=MXFzkmpRC0PZZsntldVxcz/toh6gIkYoENkSIz0o4VI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NN7opiJTje6VQgGu9GZZRIbYh58y6HNQSHFO2vYw/COuK/Q/UTinPUzmR6Mg+SPRZfEVvAKPY6WhrDv2LqUTcemj5R78LjJl5IBEIiMZcoNXNe7pFoSyQKlZgM/Jui0+Mkw8mPz4vO+tafFyuAOuFkL/3QGDOk0NHGpDSjixFZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/3WHDQJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68B90C4AF11;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724404787;
	bh=MXFzkmpRC0PZZsntldVxcz/toh6gIkYoENkSIz0o4VI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I/3WHDQJtjILZqmXApfVNcn/YSSjAO0mJjgJiD7WAJHsSkZuPx+eg+SqGEKLy69pZ
	 mrSFI0dyKwxFnsL2XwgPjjCAlUSUArQVMq0bwcuWA6v8T8j1wXLfoVtYM8YGg33yc+
	 bsNuPiVHO8TAtcWl+6iTmmpEOkemkP05PFH4B9DuYvvmcffl0KkRwJk0FTl0xHIcug
	 wYBK3wf4xgFdrGaFKtAGH2TouHEt7DA7w6nK+uWl7+j1z7Ba2gFFjoSR/2uCQ039Ac
	 mysV7htHayG1AoNqozJ+EnEV3xyLBjShOn6edtbfCkvy5UcYu5rcYv9ojK0AFnwM5e
	 pWM6WUkwp4jYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5926AC5472D;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 23 Aug 2024 17:19:45 +0800
Subject: [PATCH 2/3] rtc: support for the Amlogic on-chip RTC
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240823-rtc-v1-2-6f70381da283@amlogic.com>
References: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
In-Reply-To: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724404784; l=18890;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=uTuv7es8G0Sz0X0k67EdKdNym5NaaQd1YXkQ9wf35M4=;
 b=ZUApP7jYDGTGxZXNq3YBnYVcupXPyw+l7ig8jWctgOzmcEMQhKeVw3E/OjXJet7lZoRLyVJpm
 qozz4edsE9+DWo3n2AnMzK0F7Ze7cxR4oX2cQOMJeykgwdT5KrQY81e
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Yiting Deng <yiting.deng@amlogic.com>

Support for the on-chip RTC found in some of Amlogic's SoCs such as the
A113L2 and A113X2.

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/rtc/Kconfig       |  12 +
 drivers/rtc/Makefile      |   1 +
 drivers/rtc/rtc-amlogic.c | 589 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 602 insertions(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2a95b05982ad..0dd042701c3b 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -2043,4 +2043,16 @@ config RTC_DRV_SSD202D
 	  This driver can also be built as a module, if so, the module
 	  will be called "rtc-ssd20xd".
 
+config RTC_DRV_AMLOGIC
+	tristate "Amlogic RTC"
+	depends on ARCH_MESON || COMPILE_TEST
+	select REGMAP_MMIO
+	default y
+	help
+	  If you say yes here you get support for the RTC block on the
+	  Amlogic A113L2(A4) and A113X2(A5) SoCs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called "rtc-amlogic".
+
 endif # RTC_CLASS
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 3004e372f25f..d4a56ddb4246 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_RTC_DRV_ABB5ZES3)	+= rtc-ab-b5ze-s3.o
 obj-$(CONFIG_RTC_DRV_ABEOZ9)	+= rtc-ab-eoz9.o
 obj-$(CONFIG_RTC_DRV_ABX80X)	+= rtc-abx80x.o
 obj-$(CONFIG_RTC_DRV_AC100)	+= rtc-ac100.o
+obj-$(CONFIG_RTC_DRV_AMLOGIC)	+= rtc-amlogic.o
 obj-$(CONFIG_RTC_DRV_ARMADA38X)	+= rtc-armada38x.o
 obj-$(CONFIG_RTC_DRV_AS3722)	+= rtc-as3722.o
 obj-$(CONFIG_RTC_DRV_ASM9260)	+= rtc-asm9260.o
diff --git a/drivers/rtc/rtc-amlogic.c b/drivers/rtc/rtc-amlogic.c
new file mode 100644
index 000000000000..7c681a2320d3
--- /dev/null
+++ b/drivers/rtc/rtc-amlogic.c
@@ -0,0 +1,589 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ * Author: Yiting Deng <yiting.deng@amlogic.com>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/bitfield.h>
+#include <linux/rtc.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/time64.h>
+#include <linux/delay.h>
+
+/* rtc oscillator rate */
+#define OSC_32K			(32768)
+#define OSC_24M			(24000000)
+
+#define RTC_CTRL		(0x0 << 2)		/* Control RTC */
+#define RTC_ALRM0_EN		BIT(0)
+#define RTC_OSC_SEL		BIT(8)
+#define RTC_ENABLE		BIT(12)
+
+#define RTC_COUNTER_REG		(0x1 << 2)		/* Program RTC counter initial value */
+
+#define RTC_ALARM0_REG		(0x2 << 2)		/* Program RTC alarm0 value */
+
+#define RTC_SEC_ADJUST_REG	(0x6 << 2)		/* Control second-based timing adjustment */
+#define RTC_MATCH_COUNTER	GENMASK(18, 0)
+#define RTC_SEC_ADJUST_CTRL	GENMASK(20, 19)
+#define RTC_ADJ_VALID		BIT(23)
+#define RTC_DIV256_ADJ_VAL	BIT(24)
+#define RTC_DIV256_ADJ_DSR	BIT(25)
+
+#define RTC_INT_MASK		(0x8 << 2)		/* RTC interrupt mask */
+#define RTC_ALRM0_IRQ_MSK	BIT(0)
+
+#define RTC_INT_CLR		(0x9 << 2)		/* Clear RTC interrupt */
+#define RTC_ALRM0_IRQ_CLR	BIT(0)
+
+#define RTC_OSCIN_CTRL0		(0xa << 2)		/* Control RTC clk from 24M */
+#define RTC_OSCIN_CTRL1		(0xb << 2)		/* Control RTC clk from 24M */
+#define RTC_OSCIN_IN_EN		BIT(31)
+#define RTC_OSCIN_OUT_CFG	GENMASK(29, 28)
+#define RTC_OSCIN_OUT_N0M0	GENMASK(11, 0)
+#define RTC_OSCIN_OUT_N1M1	GENMASK(23, 12)
+
+#define RTC_INT_STATUS		(0xc << 2)		/* RTC interrupt status */
+#define RTC_ALRM0_IRQ_STATUS	BIT(0)
+
+#define RTC_REAL_TIME		(0xd << 2)		/* RTC time value */
+
+#define RTC_OSCIN_OUT_32K_N0	0x2dc
+#define RTC_OSCIN_OUT_32K_N1	0x2db
+#define RTC_OSCIN_OUT_32K_M0	0x1
+#define RTC_OSCIN_OUT_32K_M1	0x2
+
+struct aml_rtc_config {
+	bool gray_stored;
+};
+
+struct aml_rtc_data {
+	struct regmap *map;
+	struct rtc_device *rtc_dev;
+	int irq;
+	struct clk *sclk;
+	const struct aml_rtc_config *config;
+};
+
+static const struct regmap_config aml_rtc_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = RTC_REAL_TIME,
+};
+
+static u32 gray_to_binary(u32 gray)
+{
+	u32 bcd = gray;
+	int size = sizeof(bcd) * 8;
+	int i;
+
+	for (i = 0; (1 << i) < size; i++)
+		bcd ^= bcd >> (1 << i);
+
+	return bcd;
+}
+
+static u32 binary_to_gray(u32 bcd)
+{
+	return bcd ^ (bcd >> 1);
+}
+
+static void aml_set_time(struct aml_rtc_data *rtc, u32 time_sec)
+{
+	if (rtc->config->gray_stored)
+		time_sec = binary_to_gray(time_sec);
+	regmap_write(rtc->map, RTC_COUNTER_REG, time_sec);
+}
+
+static u32 aml_read_time(struct aml_rtc_data *rtc)
+{
+	u32 time_sec;
+
+	regmap_read(rtc->map, RTC_REAL_TIME, &time_sec);
+	if (rtc->config->gray_stored)
+		time_sec = gray_to_binary(time_sec);
+	return time_sec;
+}
+
+static u32 aml_read_alarm(struct aml_rtc_data *rtc)
+{
+	u32 alarm_sec;
+
+	regmap_read(rtc->map, RTC_ALARM0_REG, &alarm_sec);
+	if (rtc->config->gray_stored)
+		alarm_sec = gray_to_binary(alarm_sec);
+	return alarm_sec;
+}
+
+static void aml_set_alarm(struct aml_rtc_data *rtc, u32 alarm_sec)
+{
+	if (rtc->config->gray_stored)
+		alarm_sec = binary_to_gray(alarm_sec);
+	regmap_write(rtc->map, RTC_ALARM0_REG, alarm_sec);
+}
+
+static int aml_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
+	u32 time_sec;
+
+	time_sec = aml_read_time(rtc);
+	rtc_time64_to_tm(time_sec, tm);
+	dev_dbg(dev, "%s: read time = %us\n", __func__, time_sec);
+
+	return 0;
+}
+
+static int aml_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
+	u32 time_sec;
+
+	time_sec = rtc_tm_to_time64(tm);
+	aml_set_time(rtc, time_sec);
+	dev_dbg(dev, "%s: set time = %us\n", __func__, time_sec);
+
+	return 0;
+}
+
+static int aml_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
+	time64_t alarm_sec;
+
+	if (alarm->enabled) {
+		regmap_update_bits(rtc->map, RTC_CTRL,
+				   RTC_ALRM0_EN, RTC_ALRM0_EN);
+		regmap_update_bits(rtc->map, RTC_INT_MASK,
+				   RTC_ALRM0_IRQ_MSK, 0);
+
+		alarm_sec = rtc_tm_to_time64(&alarm->time);
+		if (alarm_sec > U32_MAX) {
+			dev_err(dev, "alarm value invalid!\n");
+			return -EINVAL;
+		}
+		aml_set_alarm(rtc, alarm_sec);
+	}
+	dev_dbg(dev, "%s: alarm->enabled=%d alarm_set=%llds\n", __func__,
+		alarm->enabled, alarm_sec);
+
+	return 0;
+}
+
+static int aml_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
+	u32 alarm_sec;
+	u32 reg_val;
+	int alarm_enable, alarm_mask;
+
+	alarm_sec = aml_read_alarm(rtc);
+	rtc_time64_to_tm(alarm_sec, &alarm->time);
+
+	regmap_read(rtc->map, RTC_CTRL, &reg_val);
+	alarm_enable = FIELD_GET(RTC_ALRM0_EN, reg_val);
+
+	regmap_read(rtc->map, RTC_INT_MASK, &reg_val);
+	alarm_mask = FIELD_GET(RTC_ALRM0_IRQ_MSK, reg_val);
+
+	alarm->enabled = (alarm_enable && !alarm_mask) ? 1 : 0;
+	dev_dbg(dev, "%s: alarm->enabled=%d alarm=%us\n", __func__,
+		alarm->enabled, alarm_sec);
+
+	return 0;
+}
+
+static int aml_rtc_alarm_enable(struct device *dev, unsigned int enabled)
+{
+	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
+
+	if (enabled) {
+		regmap_update_bits(rtc->map, RTC_CTRL,
+				   RTC_ALRM0_EN, RTC_ALRM0_EN);
+		regmap_update_bits(rtc->map, RTC_INT_MASK,
+				   RTC_ALRM0_IRQ_MSK, 0);
+	} else {
+		regmap_update_bits(rtc->map, RTC_INT_MASK,
+				   RTC_ALRM0_IRQ_MSK, RTC_ALRM0_IRQ_MSK);
+		regmap_update_bits(rtc->map, RTC_CTRL,
+				   RTC_ALRM0_EN, 0);
+	}
+
+	return 0;
+}
+
+static const struct rtc_class_ops aml_rtc_ops = {
+	.read_time = aml_rtc_read_time,
+	.set_time = aml_rtc_set_time,
+	.read_alarm = aml_rtc_read_alarm,
+	.set_alarm = aml_rtc_set_alarm,
+	.alarm_irq_enable = aml_rtc_alarm_enable,
+};
+
+static irqreturn_t aml_rtc_handler(int irq, void *data)
+{
+	struct aml_rtc_data *rtc = (struct aml_rtc_data *)data;
+
+	regmap_write(rtc->map, RTC_ALARM0_REG, 0);
+	regmap_update_bits(rtc->map, RTC_INT_CLR,
+			   RTC_ALRM0_IRQ_STATUS, RTC_ALRM0_IRQ_STATUS);
+
+	rtc_update_irq(rtc->rtc_dev, 1, RTC_AF | RTC_IRQF);
+
+	return IRQ_HANDLED;
+}
+
+static int aml_rtc_adjust_sec(struct device *dev, u32 match_counter,
+			      int ops, int enable)
+{
+	struct aml_rtc_data *rtc = dev_get_drvdata(dev->parent);
+	u32 reg_val;
+
+	if (!FIELD_FIT(RTC_MATCH_COUNTER, match_counter)) {
+		pr_err("%s: invalid match_counter\n", __func__);
+		return -EINVAL;
+	}
+
+	reg_val = FIELD_PREP(RTC_SEC_ADJUST_CTRL, ops)
+		  | FIELD_PREP(RTC_MATCH_COUNTER, match_counter)
+		  | FIELD_PREP(RTC_ADJ_VALID, enable);
+	/* Set sec_adjust_ctrl, match_counter and Valid adjust */
+	regmap_write(rtc->map, RTC_SEC_ADJUST_REG, reg_val);
+
+	return 0;
+}
+
+static int aml_rtc_set_calibration(struct device *dev, u32 calibration)
+{
+	int cal_ops, enable, match_counter;
+	int ret;
+
+	match_counter = FIELD_GET(RTC_MATCH_COUNTER, calibration);
+	cal_ops = FIELD_GET(RTC_SEC_ADJUST_CTRL, calibration);
+	enable = FIELD_GET(RTC_ADJ_VALID, calibration);
+
+	ret = aml_rtc_adjust_sec(dev, match_counter, cal_ops, enable);
+	dev_dbg(dev, "%s: Success to store RTC calibration attribute\n",
+		__func__);
+
+	return ret;
+}
+
+static int aml_rtc_get_calibration(struct device *dev, u32 *calibration)
+{
+	struct aml_rtc_data *rtc = dev_get_drvdata(dev->parent);
+	u32 reg_val;
+
+	regmap_read(rtc->map, RTC_SEC_ADJUST_REG, &reg_val);
+	*calibration = FIELD_GET(RTC_SEC_ADJUST_CTRL | RTC_MATCH_COUNTER, reg_val);
+	/* BIT is only UL defined，and GENMASK has no type, its' donot used together */
+	*calibration |= FIELD_PREP(RTC_ADJ_VALID, FIELD_GET(RTC_ADJ_VALID, reg_val));
+
+	return 0;
+}
+
+/**
+ * The calibration value transferred from buf takes bit[18:0] to represent
+ * match_counter, while takes bit[20:19] to represent sec_adjust_ctrl, bit[23]
+ * to represent adj_valid. enable/disable sec_adjust_ctrl and match_counter.
+ * @buf: Separate buf to match_counter, sec_adjust_ctrl and adj_valid
+ *	 match_counter: bit[18:0], value is 0 ~ 0x7fff
+ *	 sec_adjust_ctrl: bit[20:19], value is 0 ~ 2. 3 to insert a second once every
+ *	 match_counter+1 seconds, 2 to swallow a second once every match_counter+1 seconds
+ *	 0 or 1 to no adjustment
+ *	 adj_valid: bit[23], value is 0 or 1, 0 to disable sec_adjust_ctrl and
+ *	 match_counter, and 1 to enable them.
+ */
+static ssize_t rtc_calibration_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	int retval;
+	int calibration = 0;
+
+	if (sscanf(buf, " %i ", &calibration) != 1) {
+		dev_err(dev, "Failed to store RTC calibration attribute\n");
+		return -EINVAL;
+	}
+	retval = aml_rtc_set_calibration(dev, calibration);
+
+	return retval ? retval : count;
+}
+
+static ssize_t rtc_calibration_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	int  retval = 0;
+	u32  calibration = 0;
+
+	retval = aml_rtc_get_calibration(dev, &calibration);
+	if (retval < 0) {
+		dev_err(dev, "Failed to read RTC calibration attribute\n");
+		sprintf(buf, "0\n");
+		return retval;
+	}
+
+	return sprintf(buf, "0x%x\n", calibration);
+}
+static DEVICE_ATTR_RW(rtc_calibration);
+
+static int rtc_set_div256_adjust(struct device *dev, u32 *value)
+{
+	struct aml_rtc_data *rtc = dev_get_drvdata(dev->parent);
+	u32 div256_adj;
+
+	div256_adj = FIELD_PREP(RTC_DIV256_ADJ_DSR | RTC_DIV256_ADJ_VAL, *value);
+	/*
+	 * AO_RTC_SEC_ADJUST_REG bit 24 insert/remove(1/0) a div256 cycle,
+	 * bit 25 valid/invalid(1/0) div256_adj_val
+	 */
+	regmap_write_bits(rtc->map, RTC_SEC_ADJUST_REG,
+			  RTC_DIV256_ADJ_DSR | RTC_DIV256_ADJ_VAL, div256_adj);
+	/* rtc need about 30ms to adjust its time after written */
+	mdelay(30);
+
+	return 0;
+}
+
+static int rtc_get_div256_adjust(struct device *dev, u32 *value)
+{
+	struct aml_rtc_data *rtc = dev_get_drvdata(dev->parent);
+	u32 reg_val;
+
+	regmap_read(rtc->map, RTC_SEC_ADJUST_REG, &reg_val);
+	*value = FIELD_GET(RTC_DIV256_ADJ_DSR | RTC_DIV256_ADJ_VAL, reg_val);
+
+	return 0;
+}
+
+/**
+ * div256 adjust function is controlled using bit[24] and bit[25].
+ * transferred buf takes bit[0] to represent div256 adj val, bit[1]
+ * to represent div256 adj enable/disable. div256 cycle means that adjust
+ * 1/32768/256 once by written once, it's val is equal to 1/128s
+ * @buf: 3: enable div256 adjust and insert a div256 cycle
+ *	 2: enable div256 adjust and remove a div256 cycle
+ *	 1 or 0: disable div256 adjust
+ */
+static ssize_t rtc_div256_adjust_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count)
+{
+	int retval;
+	u32 value = 0;
+
+	if (sscanf(buf, " %i ", &value) != 1) {
+		dev_err(dev, "Failed to store RTC div256 adjust attribute\n");
+		return -EINVAL;
+	}
+	retval = rtc_set_div256_adjust(dev, &value);
+
+	return retval ? retval : count;
+}
+
+static ssize_t rtc_div256_adjust_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	int retval = 0;
+	u32 value = 0;
+
+	retval = rtc_get_div256_adjust(dev, &value);
+	if (retval < 0) {
+		dev_err(dev, "Failed to read RTC div256 adjust attribute\n");
+		sprintf(buf, "0\n");
+		return retval;
+	}
+
+	return sprintf(buf, "0x%x\n", value);
+}
+static DEVICE_ATTR_RW(rtc_div256_adjust);
+
+static struct attribute *aml_rtc_attrs[] = {
+	&dev_attr_rtc_calibration.attr,
+	&dev_attr_rtc_div256_adjust.attr,
+	NULL,
+};
+
+static const struct attribute_group aml_rtc_sysfs_files = {
+	.attrs	= aml_rtc_attrs,
+};
+
+static void aml_rtc_init(struct device *dev, struct aml_rtc_data *rtc)
+{
+	u32 reg_val;
+	u32 rtc_enable;
+
+	regmap_read(rtc->map, RTC_CTRL, &reg_val);
+	rtc_enable = FIELD_GET(RTC_ENABLE, reg_val);
+	if (!rtc_enable) {
+		if (clk_get_rate(rtc->sclk) == OSC_24M) {
+			/* select 24M oscillator */
+			regmap_update_bits(rtc->map, RTC_CTRL, RTC_OSC_SEL, RTC_OSC_SEL);
+
+			/*
+			 * Set RTC oscillator to freq_out to freq_in/((N0*M0+N1*M1)/(M0+M1))
+			 * Enable clock_in gate of oscillator 24MHz
+			 * Set N0 to 733, N1 to 732
+			 */
+			reg_val = FIELD_PREP(RTC_OSCIN_IN_EN, 1)
+				  | FIELD_PREP(RTC_OSCIN_OUT_CFG, 1)
+				  | FIELD_PREP(RTC_OSCIN_OUT_N0M0, RTC_OSCIN_OUT_32K_N0)
+				  | FIELD_PREP(RTC_OSCIN_OUT_N1M1, RTC_OSCIN_OUT_32K_N1);
+			regmap_write_bits(rtc->map, RTC_OSCIN_CTRL0, RTC_OSCIN_IN_EN
+					  | RTC_OSCIN_OUT_CFG | RTC_OSCIN_OUT_N0M0
+					  | RTC_OSCIN_OUT_N1M1, reg_val);
+
+			/* Set M0 to 2, M1 to 3, so freq_out = 32768 Hz*/
+			reg_val = FIELD_PREP(RTC_OSCIN_OUT_N0M0, RTC_OSCIN_OUT_32K_M0)
+				  | FIELD_PREP(RTC_OSCIN_OUT_N1M1, RTC_OSCIN_OUT_32K_M1);
+			regmap_write_bits(rtc->map, RTC_OSCIN_CTRL1, RTC_OSCIN_OUT_N0M0
+					  | RTC_OSCIN_OUT_N1M1, reg_val);
+		} else {
+			/* select 32K oscillator */
+			regmap_write_bits(rtc->map, RTC_CTRL, RTC_OSC_SEL, 0);
+		}
+		/* Enable RTC */
+		regmap_write_bits(rtc->map, RTC_CTRL, RTC_ENABLE, RTC_ENABLE);
+		usleep_range(100, 200);
+	}
+	regmap_write_bits(rtc->map, RTC_INT_MASK,
+			  RTC_ALRM0_IRQ_MSK, RTC_ALRM0_IRQ_MSK);
+	regmap_write_bits(rtc->map, RTC_CTRL, RTC_ALRM0_EN, 0);
+}
+
+static int aml_rtc_probe(struct platform_device *pdev)
+{
+	struct aml_rtc_data *rtc;
+	void __iomem *base;
+	struct clk *core_clk;
+	int ret = 0;
+
+	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	rtc->config = of_device_get_match_data(&pdev->dev);
+	if (!rtc->config)
+		return -ENODEV;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		dev_err(&pdev->dev, "resource ioremap failed\n");
+		return PTR_ERR(base);
+	}
+
+	rtc->map = devm_regmap_init_mmio(&pdev->dev, base, &aml_rtc_regmap_config);
+	if (IS_ERR(rtc->map)) {
+		dev_err(&pdev->dev, "regmap init failed\n");
+		return PTR_ERR(rtc->map);
+	}
+
+	rtc->irq = platform_get_irq(pdev, 0);
+	if (rtc->irq < 0)
+		return rtc->irq;
+
+	rtc->sclk = devm_clk_get(&pdev->dev, "rtc_osc");
+	if (IS_ERR(rtc->sclk))
+		return PTR_ERR(rtc->sclk);
+	if (clk_get_rate(rtc->sclk) != OSC_32K && clk_get_rate(rtc->sclk) != OSC_24M) {
+		dev_err(&pdev->dev, "Invalid clock configuration\n");
+		return -EINVAL;
+	}
+
+	core_clk = devm_clk_get(&pdev->dev, "rtc_sys_clk");
+	if (IS_ERR(core_clk)) {
+		dev_err(&pdev->dev, "failed to get rtc sys clk\n");
+		return PTR_ERR(core_clk);
+	}
+	clk_prepare_enable(core_clk);
+
+	aml_rtc_init(&pdev->dev, rtc);
+
+	device_init_wakeup(&pdev->dev, 1);
+	platform_set_drvdata(pdev, rtc);
+
+	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc->rtc_dev))
+		return PTR_ERR(rtc->rtc_dev);
+
+	ret = devm_request_irq(&pdev->dev, rtc->irq, aml_rtc_handler,
+			       IRQF_ONESHOT, "aml-rtc alarm", rtc);
+	if (ret) {
+		dev_err(&pdev->dev, "IRQ%d request failed, ret = %d\n",
+			rtc->irq, ret);
+		return ret;
+	}
+
+	rtc->rtc_dev->ops = &aml_rtc_ops;
+	rtc->rtc_dev->range_min = 0;
+	rtc->rtc_dev->range_max = U32_MAX;
+
+	ret = rtc_add_group(rtc->rtc_dev, &aml_rtc_sysfs_files);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to create sysfs group: %d\n", ret);
+		return ret;
+	}
+
+	return devm_rtc_register_device(rtc->rtc_dev);
+}
+
+static int aml_rtc_suspend(struct device *dev)
+{
+	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(rtc->irq);
+
+	return 0;
+}
+
+static int aml_rtc_resume(struct device *dev)
+{
+	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		disable_irq_wake(rtc->irq);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(aml_rtc_pm_ops,
+			 aml_rtc_suspend, aml_rtc_resume);
+
+static const struct aml_rtc_config a5_rtc_config = {
+};
+
+static const struct aml_rtc_config a4_rtc_config = {
+	.gray_stored = true,
+};
+
+static const struct of_device_id aml_rtc_device_id[] = {
+	{
+		.compatible = "amlogic,a4-rtc",
+		.data = &a4_rtc_config,
+	},
+	{
+		.compatible = "amlogic,a5-rtc",
+		.data = &a5_rtc_config,
+	},
+};
+MODULE_DEVICE_TABLE(of, aml_rtc_device_id);
+
+static struct platform_driver aml_rtc_driver = {
+	.probe = aml_rtc_probe,
+	.driver = {
+		.name = "aml-rtc",
+		.of_match_table = of_match_ptr(aml_rtc_device_id),
+		.pm = &aml_rtc_pm_ops,
+	},
+};
+
+module_platform_driver(aml_rtc_driver);
+MODULE_DESCRIPTION("Amlogic RTC driver");
+MODULE_AUTHOR("Yiting Deng <yiting.deng@amlogic.com>");
+MODULE_LICENSE("GPL");

-- 
2.37.1



