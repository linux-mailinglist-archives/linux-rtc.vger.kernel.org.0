Return-Path: <linux-rtc+bounces-1916-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FDB973225
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 12:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E6C81C212C4
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 10:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E344E1990C3;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sTomFNvL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B009C18C039;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963260; cv=none; b=uEE/Vkd+vpaA8sSSI+2s7+x0yUk51hui/uvcVruOEG8Bx/1me3D9oP0Ic+qNTnvbL9GnaPDWbEE65ShtVM7eqkXbdFmgXTjj3OPd5Fveh6OFgCG8AI2J4UnuTvnPUkD7wVyNVm1HKw1UirOl4mr3lrS+W7BwIqTOXnGYhIL19u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963260; c=relaxed/simple;
	bh=Sr03DLwF+0CRjwS+JcY9FQ/jwAk9Erb+TmTfkjjxxuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P5Wt894wi/kssNGJJtYhJAN+gON+WahYX+QBTr/fWmbfYwQ+gFDFmyosYt64JWNdLofzrZPj4MGlF1OEFAEdC9JNq5J5j20nI81FvN0WH2h8mB23ppSTTTlhuVr6rzApB4UwLe6CIUedt94fP0U8MlHZkKCHpSDwtVV9p3hB9gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sTomFNvL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79ED9C4CED0;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725963260;
	bh=Sr03DLwF+0CRjwS+JcY9FQ/jwAk9Erb+TmTfkjjxxuo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sTomFNvL4Y/RAMJOF48nbyYbkgbN0pWqWcPG6CnQ1cANwHuUsPG6+8DRAEpeUz9Xa
	 ACVGvKiM7VH2sTPCLOkNcez2lgtvhKJ3uJ/LjajEj3R42mjST/TcHqwE8YTnCx9Suc
	 cLQrZ/UL3bHpa94H1Z5TDNQGiuOtm60fIc5+EydfycxPqKqdIuPsqSSYpffs8h+EtI
	 cZKdXxiIHVmtBqqRNUR3ARE/45RS9HMJyloIt7G3bXJVr2Rce5bZb3Pk1Fe7tTu5vQ
	 iXHmcha8N+WOB/axPmpHfCLhYyFuS5pFJbUwqt9PpwC2Obo/3bMlyQutCQH40Pv2ag
	 VhFhu8t5c3CoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E86BEB64DE;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 10 Sep 2024 18:14:19 +0800
Subject: [PATCH v3 2/3] rtc: support for the Amlogic on-chip RTC
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-rtc-v3-2-1fa077a69a20@amlogic.com>
References: <20240910-rtc-v3-0-1fa077a69a20@amlogic.com>
In-Reply-To: <20240910-rtc-v3-0-1fa077a69a20@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725963258; l=15598;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=cNbOL9mU9+fA5KZFmGLhYAJ5+VuZHdScljqBEQYouWY=;
 b=WjiqRJFmSOeL0a8UmKyqvyDba2g7b0KAkSVSD1qIzHolbZhDvwcwJrjPnAy9TzoHVb1D/JqpE
 RrSmcj8a04FAaKbDH1ZfaElNQnL/zWaAgE/XFH/csDOHy565cL2zOmE
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Yiting Deng <yiting.deng@amlogic.com>

This is the third amlogic driver. The RTC hardware of A4 SoC is different
from the previous one. This RTC hardware includes a timing function and
an alarm function. But the existing has only timing function, alarm
function is using the system clock to implement a virtual alarm. Add
the RTC driver to support it.

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/rtc/Kconfig          |  12 ++
 drivers/rtc/Makefile         |   1 +
 drivers/rtc/rtc-amlogic-a4.c | 473 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 486 insertions(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2a95b05982ad..1d49738a2796 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -2043,4 +2043,16 @@ config RTC_DRV_SSD202D
 	  This driver can also be built as a module, if so, the module
 	  will be called "rtc-ssd20xd".
 
+config RTC_DRV_AMLOGIC_A4
+	tristate "Amlogic RTC"
+	depends on ARCH_MESON || COMPILE_TEST
+	select REGMAP_MMIO
+	default y
+	help
+	  If you say yes here you get support for the RTC block on the
+	  Amlogic A113L2(A4) and A113X2(A5) SoCs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called "rtc-amlogic-a4".
+
 endif # RTC_CLASS
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 3004e372f25f..2122f469e633 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_RTC_DRV_ABB5ZES3)	+= rtc-ab-b5ze-s3.o
 obj-$(CONFIG_RTC_DRV_ABEOZ9)	+= rtc-ab-eoz9.o
 obj-$(CONFIG_RTC_DRV_ABX80X)	+= rtc-abx80x.o
 obj-$(CONFIG_RTC_DRV_AC100)	+= rtc-ac100.o
+obj-$(CONFIG_RTC_DRV_AMLOGIC_A4)	+= rtc-amlogic-a4.o
 obj-$(CONFIG_RTC_DRV_ARMADA38X)	+= rtc-armada38x.o
 obj-$(CONFIG_RTC_DRV_AS3722)	+= rtc-as3722.o
 obj-$(CONFIG_RTC_DRV_ASM9260)	+= rtc-asm9260.o
diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
new file mode 100644
index 000000000000..decd74df225c
--- /dev/null
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -0,0 +1,473 @@
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
+#define RTC_SWALLOW_SECOND	0x2
+#define RTC_INSERT_SECOND	0x3
+
+struct aml_rtc_config {
+	bool gray_stored;
+};
+
+struct aml_rtc_data {
+	struct regmap *map;
+	struct rtc_device *rtc_dev;
+	int irq;
+	struct clk *rtc_clk;
+	struct clk *sys_clk;
+	int rtc_enabled;
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
+static inline u32 gray_to_binary(u32 gray)
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
+static inline u32 binary_to_gray(u32 bcd)
+{
+	return bcd ^ (bcd >> 1);
+}
+
+static int aml_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
+	u32 time_sec;
+
+	/* if RTC disabled, read time failed */
+	if (!rtc->rtc_enabled) {
+		dev_err(dev, "RTC disabled, read time failed\n");
+		return -EINVAL;
+	}
+
+	regmap_read(rtc->map, RTC_REAL_TIME, &time_sec);
+	if (rtc->config->gray_stored)
+		time_sec = gray_to_binary(time_sec);
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
+	/* if RTC disabled, first enable it */
+	if (!rtc->rtc_enabled) {
+		regmap_write_bits(rtc->map, RTC_CTRL, RTC_ENABLE, RTC_ENABLE);
+		usleep_range(100, 200);
+		rtc->rtc_enabled = regmap_test_bits(rtc->map, RTC_CTRL, RTC_ENABLE);
+	}
+
+	time_sec = rtc_tm_to_time64(tm);
+	if (rtc->config->gray_stored)
+		time_sec = binary_to_gray(time_sec);
+	regmap_write(rtc->map, RTC_COUNTER_REG, time_sec);
+	dev_dbg(dev, "%s: set time = %us\n", __func__, time_sec);
+
+	return 0;
+}
+
+static int aml_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
+	time64_t alarm_sec = 0;
+
+	/* if RTC disabled, set alarm failed */
+	if (!rtc->rtc_enabled) {
+		dev_err(dev, "RTC disabled, set alarm failed\n");
+		return -EINVAL;
+	}
+
+	regmap_update_bits(rtc->map, RTC_CTRL,
+			   RTC_ALRM0_EN, RTC_ALRM0_EN);
+	regmap_update_bits(rtc->map, RTC_INT_MASK,
+			   RTC_ALRM0_IRQ_MSK, 0);
+
+	alarm_sec = rtc_tm_to_time64(&alarm->time);
+	if (rtc->config->gray_stored)
+		alarm_sec = binary_to_gray(alarm_sec);
+	regmap_write(rtc->map, RTC_ALARM0_REG, alarm_sec);
+
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
+	int alarm_enable, alarm_mask;
+
+	/* if RTC disabled, read alarm failed */
+	if (!rtc->rtc_enabled) {
+		dev_err(dev, "RTC disabled, read alarm failed\n");
+		return -EINVAL;
+	}
+
+	regmap_read(rtc->map, RTC_ALARM0_REG, &alarm_sec);
+	if (rtc->config->gray_stored)
+		alarm_sec = gray_to_binary(alarm_sec);
+	rtc_time64_to_tm(alarm_sec, &alarm->time);
+
+	alarm_enable = regmap_test_bits(rtc->map, RTC_CTRL, RTC_ALRM0_EN);
+	alarm_mask = regmap_test_bits(rtc->map, RTC_INT_MASK, RTC_ALRM0_IRQ_MSK);
+	alarm->enabled = (alarm_enable && !alarm_mask) ? 1 : 0;
+	dev_dbg(dev, "%s: alarm->enabled=%d alarm=%us\n", __func__,
+		alarm->enabled, alarm_sec);
+
+	return 0;
+}
+
+static int aml_rtc_read_offset(struct device *dev, long *offset)
+{
+	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
+	u32 reg_val;
+	long val;
+	int sign, match_counter, enable;
+
+	/* if RTC disabled, read offset failed */
+	if (!rtc->rtc_enabled) {
+		dev_err(dev, "RTC disabled, read offset failed\n");
+		return -EINVAL;
+	}
+
+	regmap_read(rtc->map, RTC_SEC_ADJUST_REG, &reg_val);
+	enable = FIELD_GET(RTC_ADJ_VALID, reg_val);
+	if (!enable) {
+		val = 0;
+	} else {
+		sign = FIELD_GET(RTC_SEC_ADJUST_CTRL, reg_val);
+		match_counter = FIELD_GET(RTC_MATCH_COUNTER, reg_val);
+		val = 1000000000 / (match_counter + 1);
+		if (sign == RTC_SWALLOW_SECOND)
+			val = -val;
+	}
+	*offset = val;
+
+	return 0;
+}
+
+static int aml_rtc_set_offset(struct device *dev, long offset)
+{
+	struct aml_rtc_data *rtc = dev_get_drvdata(dev);
+	int sign = 0, match_counter = 0, enable = 0;
+	u32 reg_val;
+
+	/* if RTC disabled, set offset failed */
+	if (!rtc->rtc_enabled) {
+		dev_err(dev, "RTC disabled, set offset failed\n");
+		return -EINVAL;
+	}
+
+	if (offset) {
+		enable = 1;
+		sign = offset < 0 ? RTC_SWALLOW_SECOND : RTC_INSERT_SECOND;
+		match_counter = 1000000000 / abs(offset) - 1;
+		if (match_counter < 0 || match_counter > RTC_MATCH_COUNTER)
+			return -EINVAL;
+	}
+
+	reg_val = FIELD_PREP(RTC_ADJ_VALID, enable) |
+		  FIELD_PREP(RTC_SEC_ADJUST_CTRL, sign) |
+		  FIELD_PREP(RTC_MATCH_COUNTER, match_counter);
+	regmap_write(rtc->map, RTC_SEC_ADJUST_REG, reg_val);
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
+	.read_offset = aml_rtc_read_offset,
+	.set_offset = aml_rtc_set_offset,
+};
+
+static irqreturn_t aml_rtc_handler(int irq, void *data)
+{
+	struct aml_rtc_data *rtc = (struct aml_rtc_data *)data;
+
+	regmap_write(rtc->map, RTC_ALARM0_REG, 0);
+	regmap_write(rtc->map, RTC_INT_CLR, RTC_ALRM0_IRQ_STATUS);
+
+	rtc_update_irq(rtc->rtc_dev, 1, RTC_AF | RTC_IRQF);
+
+	return IRQ_HANDLED;
+}
+
+static void aml_rtc_init(struct aml_rtc_data *rtc)
+{
+	u32 reg_val = 0;
+
+	rtc->rtc_enabled = regmap_test_bits(rtc->map, RTC_CTRL, RTC_ENABLE);
+	if (!rtc->rtc_enabled) {
+		if (clk_get_rate(rtc->rtc_clk) == OSC_24M) {
+			/* select 24M oscillator */
+			regmap_write_bits(rtc->map, RTC_CTRL, RTC_OSC_SEL, RTC_OSC_SEL);
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
+	if (IS_ERR(base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(base), "resource ioremap failed\n");
+
+	rtc->map = devm_regmap_init_mmio(&pdev->dev, base, &aml_rtc_regmap_config);
+	if (IS_ERR(rtc->map))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->map), "regmap init failed\n");
+
+	rtc->irq = platform_get_irq(pdev, 0);
+	if (rtc->irq < 0)
+		return rtc->irq;
+
+	rtc->rtc_clk = devm_clk_get(&pdev->dev, "osc");
+	if (IS_ERR(rtc->rtc_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->rtc_clk),
+				     "failed to find rtc clock\n");
+	if (clk_get_rate(rtc->rtc_clk) != OSC_32K && clk_get_rate(rtc->rtc_clk) != OSC_24M)
+		return dev_err_probe(&pdev->dev, -EINVAL, "Invalid clock configuration\n");
+
+	rtc->sys_clk = devm_clk_get(&pdev->dev, "sys");
+	if (IS_ERR(rtc->sys_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->sys_clk),
+				     "failed to get rtc sys clk\n");
+	ret = clk_prepare_enable(rtc->sys_clk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to enable clk!\n");
+
+	aml_rtc_init(rtc);
+
+	device_init_wakeup(&pdev->dev, 1);
+	platform_set_drvdata(pdev, rtc);
+
+	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc->rtc_dev)) {
+		ret = PTR_ERR(rtc->rtc_dev);
+		goto err_clk;
+	}
+
+	ret = devm_request_irq(&pdev->dev, rtc->irq, aml_rtc_handler,
+			       IRQF_ONESHOT, "aml-rtc alarm", rtc);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "IRQ%d request failed, ret = %d\n",
+			      rtc->irq, ret);
+		goto err_clk;
+	}
+
+	rtc->rtc_dev->ops = &aml_rtc_ops;
+	rtc->rtc_dev->range_min = 0;
+	rtc->rtc_dev->range_max = U32_MAX;
+
+	ret = devm_rtc_register_device(rtc->rtc_dev);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "Failed to register RTC device: %d\n", ret);
+		goto err_clk;
+	}
+
+	return 0;
+err_clk:
+	clk_disable_unprepare(rtc->sys_clk);
+
+	return ret;
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
+static int aml_rtc_remove(struct platform_device *pdev)
+{
+	struct aml_rtc_data *rtc = dev_get_drvdata(&pdev->dev);
+
+	/* disable RTC */
+	regmap_write_bits(rtc->map, RTC_CTRL, RTC_ENABLE, 0);
+	clk_disable_unprepare(rtc->sys_clk);
+	device_init_wakeup(&pdev->dev, 0);
+
+	return 0;
+}
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
+	.remove = aml_rtc_remove,
+	.driver = {
+		.name = "aml-rtc",
+		.pm = &aml_rtc_pm_ops,
+		.of_match_table = aml_rtc_device_id,
+	},
+};
+
+module_platform_driver(aml_rtc_driver);
+MODULE_DESCRIPTION("Amlogic RTC driver");
+MODULE_AUTHOR("Yiting Deng <yiting.deng@amlogic.com>");
+MODULE_LICENSE("GPL");

-- 
2.37.1



