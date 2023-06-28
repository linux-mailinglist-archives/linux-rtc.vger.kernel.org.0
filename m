Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D425874126E
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Jun 2023 15:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbjF1Nam (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 28 Jun 2023 09:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232413AbjF1Na3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 28 Jun 2023 09:30:29 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 797CA294E
        for <linux-rtc@vger.kernel.org>; Wed, 28 Jun 2023 06:30:26 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb8ede27eeso1492577e87.0
        for <linux-rtc@vger.kernel.org>; Wed, 28 Jun 2023 06:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687959025; x=1690551025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoQnr8Spf00LoQ09R6liJOxQa7Cud4gudjhTt7Eirpg=;
        b=2Fkp+T+q/NdBQ570pydj3M4iTo0huhj+XXAYOdu/cT1rcYJQsqNZ7q68yHu7STN2Qc
         woJoelvDyY45085GZ9Laz5WjahWyl7jlOfkvcQj5NdJlztbbBGG4ojMuyK5rm6cL/xdg
         gC78Y/L61eg631IjzpPnT5riS1L1Al92KIekRh/9Vpxbx0T+GtrCCyKkMsKocAdT9+za
         jrPtnjd+6ZBHGKcU3sHmFQ7Wf9XpH04taF9LpmAFryyjglnpyGEQqU30SvE+JDJOqB7O
         mf036vhwLy8MexHZRdma1FXdnMmQ3xKGJPLDOuIg4I6wX8wcZ/hzCXGsGUwL4E1/xAnw
         K4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687959025; x=1690551025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoQnr8Spf00LoQ09R6liJOxQa7Cud4gudjhTt7Eirpg=;
        b=KSSh9G4P3rHdUjEd7Aq/odmcc4DQXUcVDpGNeANHgAb/iTZuLA+D36cxBAUg60VJCq
         +fephyWheb1sahj3fvHUeETtUQY7PZ/MzBLrlCs2QNc58Qgu07HcRENvW2ZAOkHJ23Km
         mZ5CKs+lUf99/ZWlkWwiAutErkBA9WMkwY0qWGteZ+amuE9OkhqPPQ6TFaJjQ4UyqmMo
         PjhyIjAt5swz4naJYsbD6tIh7FTw4l38aylNb/tMeZgO3xDPiGxu1x07zqMidvxtY86g
         Qa5Usk1wf0+MSuW45ltOAZT94pKonS2dvxxZ1SwEREW/aRjfHmf96XKRwlrf1xn6B/Rm
         xhEg==
X-Gm-Message-State: AC+VfDydcMl+0qM2F0V6REdq2T04yTKMprNKEclyyOvBejXSz+5v/P7q
        v+0H/xCgP5bqOZgBQd3bqpguiA==
X-Google-Smtp-Source: ACHHUZ7zCu/COp/gtWX9gAI0JJA0YLrUKVv4CQHAXsysX703Cjt0rOP56aaFZ8MLLTNExJeLWfx8Fw==
X-Received: by 2002:a19:6755:0:b0:4f8:58f4:b96e with SMTP id e21-20020a196755000000b004f858f4b96emr21261364lfj.37.1687959024158;
        Wed, 28 Jun 2023 06:30:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:28d:66d0:c6d7:ee89:d0ff:2f52])
        by smtp.gmail.com with ESMTPSA id z7-20020a05600c220700b003fa999cefc0sm8067994wml.36.2023.06.28.06.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 06:30:23 -0700 (PDT)
From:   Esteban Blanc <eblanc@baylibre.com>
To:     linus.walleij@linaro.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, jpanis@baylibre.com,
        jneanne@baylibre.com, aseketeli@baylibre.com, eblanc@baylibre.com,
        u-kumar1@ti.com
Subject: [PATCH v7 1/2] rtc: tps6594: Add driver for TPS6594 RTC
Date:   Wed, 28 Jun 2023 15:30:20 +0200
Message-ID: <20230628133021.500477-2-eblanc@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230628133021.500477-1-eblanc@baylibre.com>
References: <20230628133021.500477-1-eblanc@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

TPS6594 PMIC is a MFD. This patch adds support for
the RTC found inside TPS6594 family of PMIC.

Alarm is also supported.

Signed-off-by: Esteban Blanc <eblanc@baylibre.com>
---
 drivers/rtc/Kconfig       |  12 +
 drivers/rtc/Makefile      |   1 +
 drivers/rtc/rtc-tps6594.c | 452 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 465 insertions(+)
 create mode 100644 drivers/rtc/rtc-tps6594.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 753872408615..39b5c93c6282 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -578,6 +578,18 @@ config RTC_DRV_TPS6586X
 	  along with alarm. This driver supports the RTC driver for
 	  the TPS6586X RTC module.
 
+config RTC_DRV_TPS6594
+	tristate "TI TPS6594 RTC driver"
+	depends on MFD_TPS6594
+	default MFD_TPS6594
+	help
+	  TI Power Management IC TPS6594 supports RTC functionality
+	  along with alarm. This driver supports the RTC driver for
+	  the TPS6594 RTC module.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-tps6594.
+
 config RTC_DRV_TPS65910
 	tristate "TI TPS65910 RTC driver"
 	depends on MFD_TPS65910
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index ea445d1ebb17..3d3f8c9d0697 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -175,6 +175,7 @@ obj-$(CONFIG_RTC_DRV_TEGRA)	+= rtc-tegra.o
 obj-$(CONFIG_RTC_DRV_TEST)	+= rtc-test.o
 obj-$(CONFIG_RTC_DRV_TI_K3)	+= rtc-ti-k3.o
 obj-$(CONFIG_RTC_DRV_TPS6586X)	+= rtc-tps6586x.o
+obj-$(CONFIG_RTC_DRV_TPS6594)	+= rtc-tps6594.o
 obj-$(CONFIG_RTC_DRV_TPS65910)	+= rtc-tps65910.o
 obj-$(CONFIG_RTC_DRV_TWL4030)	+= rtc-twl.o
 obj-$(CONFIG_RTC_DRV_VT8500)	+= rtc-vt8500.o
diff --git a/drivers/rtc/rtc-tps6594.c b/drivers/rtc/rtc-tps6594.c
new file mode 100644
index 000000000000..7328ea7da849
--- /dev/null
+++ b/drivers/rtc/rtc-tps6594.c
@@ -0,0 +1,452 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RTC driver for tps6594 PMIC
+ *
+ * Copyright (C) 2023 BayLibre Incorporated - https://www.baylibre.com/
+ */
+
+#include <linux/bcd.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/limits.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/rtc.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#include <linux/mfd/tps6594.h>
+
+// Total number of RTC registers needed to set time
+#define NUM_TIME_REGS (TPS6594_REG_RTC_WEEKS - TPS6594_REG_RTC_SECONDS + 1)
+
+// Total number of RTC alarm registers
+#define NUM_TIME_ALARM_REGS (NUM_TIME_REGS - 1)
+
+/*
+ * Min and max values supported by 'offset' interface (swapped sign).
+ * After conversion, the values do not exceed the range [-32767, 33767]
+ * which COMP_REG must conform to.
+ */
+#define MIN_OFFSET (-277774)
+#define MAX_OFFSET (277774)
+
+// Number of ticks per hour
+#define TICKS_PER_HOUR (32768 * 3600)
+
+// Multiplier for ppb conversions
+#define PPB_MULT NANO
+
+static int tps6594_rtc_alarm_irq_enable(struct device *dev,
+					unsigned int enabled)
+{
+	struct tps6594 *tps = dev_get_drvdata(dev->parent);
+	u8 val;
+
+	val = enabled ? TPS6594_BIT_IT_ALARM : 0;
+
+	return regmap_update_bits(tps->regmap, TPS6594_REG_RTC_INTERRUPTS,
+				  TPS6594_BIT_IT_ALARM, val);
+}
+
+/* Pulse GET_TIME field of RTC_CTRL_1 to store a timestamp in shadow registers. */
+static int tps6594_rtc_shadow_timestamp(struct device *dev, struct tps6594 *tps)
+{
+	int ret;
+
+	/*
+	 * Set GET_TIME to 0. Next time we set GET_TIME to 1 we will be sure to store
+	 * an up-to-date timestamp.
+	 */
+	ret = regmap_clear_bits(tps->regmap, TPS6594_REG_RTC_CTRL_1,
+				TPS6594_BIT_GET_TIME);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Copy content of RTC registers to shadow registers or latches to read
+	 * a coherent timestamp.
+	 */
+	return regmap_set_bits(tps->regmap, TPS6594_REG_RTC_CTRL_1,
+			       TPS6594_BIT_GET_TIME);
+}
+
+static int tps6594_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	unsigned char rtc_data[NUM_TIME_REGS];
+	struct tps6594 *tps = dev_get_drvdata(dev->parent);
+	int ret;
+
+	// Check if RTC is running.
+	ret = regmap_test_bits(tps->regmap, TPS6594_REG_RTC_STATUS,
+			       TPS6594_BIT_RUN);
+	if (ret < 0)
+		return ret;
+	if (ret == 0)
+		return -EINVAL;
+
+	ret = tps6594_rtc_shadow_timestamp(dev, tps);
+	if (ret < 0)
+		return ret;
+
+	// Read shadowed RTC registers.
+	ret = regmap_bulk_read(tps->regmap, TPS6594_REG_RTC_SECONDS, rtc_data,
+			       NUM_TIME_REGS);
+	if (ret < 0)
+		return ret;
+
+	tm->tm_sec = bcd2bin(rtc_data[0]);
+	tm->tm_min = bcd2bin(rtc_data[1]);
+	tm->tm_hour = bcd2bin(rtc_data[2]);
+	tm->tm_mday = bcd2bin(rtc_data[3]);
+	tm->tm_mon = bcd2bin(rtc_data[4]) - 1;
+	tm->tm_year = bcd2bin(rtc_data[5]) + 100;
+	tm->tm_wday = bcd2bin(rtc_data[6]);
+
+	return 0;
+}
+
+static int tps6594_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	unsigned char rtc_data[NUM_TIME_REGS];
+	struct tps6594 *tps = dev_get_drvdata(dev->parent);
+	int ret;
+
+	rtc_data[0] = bin2bcd(tm->tm_sec);
+	rtc_data[1] = bin2bcd(tm->tm_min);
+	rtc_data[2] = bin2bcd(tm->tm_hour);
+	rtc_data[3] = bin2bcd(tm->tm_mday);
+	rtc_data[4] = bin2bcd(tm->tm_mon + 1);
+	rtc_data[5] = bin2bcd(tm->tm_year - 100);
+	rtc_data[6] = bin2bcd(tm->tm_wday);
+
+	// Stop RTC while updating the RTC time registers.
+	ret = regmap_clear_bits(tps->regmap, TPS6594_REG_RTC_CTRL_1,
+				TPS6594_BIT_STOP_RTC);
+	if (ret < 0)
+		return ret;
+
+	// Update all the time registers in one shot.
+	ret = regmap_bulk_write(tps->regmap, TPS6594_REG_RTC_SECONDS, rtc_data,
+				NUM_TIME_REGS);
+	if (ret < 0)
+		return ret;
+
+	// Start back RTC.
+	return regmap_set_bits(tps->regmap, TPS6594_REG_RTC_CTRL_1,
+			       TPS6594_BIT_STOP_RTC);
+}
+
+static int tps6594_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
+{
+	unsigned char alarm_data[NUM_TIME_ALARM_REGS];
+	u32 int_val;
+	struct tps6594 *tps = dev_get_drvdata(dev->parent);
+	int ret;
+
+	ret = regmap_bulk_read(tps->regmap, TPS6594_REG_ALARM_SECONDS,
+			       alarm_data, NUM_TIME_ALARM_REGS);
+	if (ret < 0)
+		return ret;
+
+	alm->time.tm_sec = bcd2bin(alarm_data[0]);
+	alm->time.tm_min = bcd2bin(alarm_data[1]);
+	alm->time.tm_hour = bcd2bin(alarm_data[2]);
+	alm->time.tm_mday = bcd2bin(alarm_data[3]);
+	alm->time.tm_mon = bcd2bin(alarm_data[4]) - 1;
+	alm->time.tm_year = bcd2bin(alarm_data[5]) + 100;
+
+	ret = regmap_read(tps->regmap, TPS6594_REG_RTC_INTERRUPTS, &int_val);
+	if (ret < 0)
+		return ret;
+
+	alm->enabled = int_val & TPS6594_BIT_IT_ALARM;
+
+	return 0;
+}
+
+static int tps6594_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
+{
+	unsigned char alarm_data[NUM_TIME_ALARM_REGS];
+	struct tps6594 *tps = dev_get_drvdata(dev->parent);
+	int ret;
+
+	// Disable alarm irq before changing the alarm timestamp.
+	ret = tps6594_rtc_alarm_irq_enable(dev, 0);
+	if (ret)
+		return ret;
+
+	alarm_data[0] = bin2bcd(alm->time.tm_sec);
+	alarm_data[1] = bin2bcd(alm->time.tm_min);
+	alarm_data[2] = bin2bcd(alm->time.tm_hour);
+	alarm_data[3] = bin2bcd(alm->time.tm_mday);
+	alarm_data[4] = bin2bcd(alm->time.tm_mon + 1);
+	alarm_data[5] = bin2bcd(alm->time.tm_year - 100);
+
+	// Update all the alarm registers in one shot.
+	ret = regmap_bulk_write(tps->regmap, TPS6594_REG_ALARM_SECONDS,
+				alarm_data, NUM_TIME_ALARM_REGS);
+	if (ret < 0)
+		return ret;
+
+	if (alm->enabled)
+		ret = tps6594_rtc_alarm_irq_enable(dev, 1);
+
+	return ret;
+}
+
+static int tps6594_rtc_set_calibration(struct device *dev, int calibration)
+{
+	struct tps6594 *tps = dev_get_drvdata(dev->parent);
+	__le16 value;
+	int ret;
+
+	/*
+	 * TPS6594 uses two's complement 16 bit value for compensation of RTC
+	 * crystal inaccuracies. One time every hour when seconds counter
+	 * increments from 0 to 1 compensation value will be added to internal
+	 * RTC counter value.
+	 *
+	 * Valid range for compensation value: [-32767 .. 32767].
+	 */
+	if (calibration < S16_MIN + 1 || calibration > S16_MAX)
+		return -ERANGE;
+
+	value = cpu_to_le16(calibration);
+
+	// Update all the compensation registers in one shot.
+	ret = regmap_bulk_write(tps->regmap, TPS6594_REG_RTC_COMP_LSB, &value,
+				sizeof(value));
+	if (ret < 0)
+		return ret;
+
+	// Enable automatic compensation.
+	return regmap_set_bits(tps->regmap, TPS6594_REG_RTC_CTRL_1,
+			       TPS6594_BIT_AUTO_COMP);
+}
+
+static int tps6594_rtc_get_calibration(struct device *dev, int *calibration)
+{
+	struct tps6594 *tps = dev_get_drvdata(dev->parent);
+	unsigned int ctrl;
+	__le16 value;
+	int ret;
+
+	ret = regmap_read(tps->regmap, TPS6594_REG_RTC_CTRL_1, &ctrl);
+	if (ret < 0)
+		return ret;
+
+	// If automatic compensation is not enabled report back zero.
+	if (!(ctrl & TPS6594_BIT_AUTO_COMP)) {
+		*calibration = 0;
+		return 0;
+	}
+
+	ret = regmap_bulk_read(tps->regmap, TPS6594_REG_RTC_COMP_LSB, &value,
+			       sizeof(value));
+	if (ret < 0)
+		return ret;
+
+	*calibration = le16_to_cpu(value);
+
+	return 0;
+}
+
+static int tps6594_rtc_read_offset(struct device *dev, long *offset)
+{
+	int calibration;
+	s64 tmp;
+	int ret;
+
+	ret = tps6594_rtc_get_calibration(dev, &calibration);
+	if (ret < 0)
+		return ret;
+
+	// Convert from RTC calibration register format to ppb format.
+	tmp = calibration * PPB_MULT;
+
+	if (tmp < 0)
+		tmp -= TICKS_PER_HOUR / 2LL;
+	else
+		tmp += TICKS_PER_HOUR / 2LL;
+	tmp = div_s64(tmp, TICKS_PER_HOUR);
+
+	/*
+	 * SAFETY:
+	 * Compution is the reverse operation of the one done in
+	 * `tps6594_rtc_set_offset`. The safety remarks applie here too.
+	 */
+
+	/*
+	 * Offset value operates in negative way, so swap sign.
+	 * See 8.3.10.5, (32768 - COMP_REG).
+	 */
+	*offset = (long)-tmp;
+
+	return 0;
+}
+
+static int tps6594_rtc_set_offset(struct device *dev, long offset)
+{
+	int calibration;
+	s64 tmp;
+
+	// Make sure offset value is within supported range.
+	if (offset < MIN_OFFSET || offset > MAX_OFFSET)
+		return -ERANGE;
+
+	// Convert from ppb format to RTC calibration register format.
+
+	tmp = offset * TICKS_PER_HOUR;
+	if (tmp < 0)
+		tmp -= PPB_MULT / 2LL;
+	else
+		tmp += PPB_MULT / 2LL;
+	tmp = div_s64(tmp, PPB_MULT);
+
+	/*
+	 * SAFETY:
+	 * - tmp = offset * TICK_PER_HOUR :
+	 *	`offset` can't be more than 277774, so `tmp` can't exceed 277774000000000
+	 *	which is lower than the maximum value in an `s64` (2^63-1). No overflow here.
+	 *
+	 * - tmp += TICK_PER_HOUR / 2LL :
+	 *	tmp will have a maximum value of 277774117964800 which is still inferior to 2^63-1.
+	 */
+
+	// Offset value operates in negative way, so swap sign.
+	calibration = (int)-tmp;
+
+	return tps6594_rtc_set_calibration(dev, calibration);
+}
+
+static irqreturn_t tps6594_rtc_interrupt(int irq, void *rtc)
+{
+	struct device *dev = rtc;
+	unsigned long events = 0;
+	struct tps6594 *tps = dev_get_drvdata(dev->parent);
+	struct rtc_device *rtc_dev = dev_get_drvdata(dev);
+	int ret;
+	u32 rtc_reg;
+
+	ret = regmap_read(tps->regmap, TPS6594_REG_RTC_STATUS, &rtc_reg);
+	if (ret)
+		return IRQ_NONE;
+
+	if (rtc_reg & TPS6594_BIT_ALARM)
+		events = RTC_IRQF | RTC_AF;
+
+	// Notify RTC core on event.
+	rtc_update_irq(rtc_dev, 1, events);
+
+	return IRQ_HANDLED;
+}
+
+static const struct rtc_class_ops tps6594_rtc_ops = {
+	.read_time = tps6594_rtc_read_time,
+	.set_time = tps6594_rtc_set_time,
+	.read_alarm = tps6594_rtc_read_alarm,
+	.set_alarm = tps6594_rtc_set_alarm,
+	.alarm_irq_enable = tps6594_rtc_alarm_irq_enable,
+	.read_offset = tps6594_rtc_read_offset,
+	.set_offset = tps6594_rtc_set_offset,
+};
+
+static int tps6594_rtc_probe(struct platform_device *pdev)
+{
+	struct tps6594 *tps = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	struct rtc_device *rtc;
+	int irq;
+	int ret;
+
+	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
+
+	// Enable crystal oscillator.
+	ret = regmap_set_bits(tps->regmap, TPS6594_REG_RTC_CTRL_2,
+			      TPS6594_BIT_XTAL_EN);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_test_bits(tps->regmap, TPS6594_REG_RTC_STATUS,
+			       TPS6594_BIT_RUN);
+	if (ret < 0)
+		return ret;
+	// RTC not running.
+	if (ret == 0) {
+		ret = regmap_set_bits(tps->regmap, TPS6594_REG_RTC_CTRL_1,
+				      TPS6594_BIT_STOP_RTC);
+		if (ret < 0)
+			return ret;
+
+		/*
+		 * On some boards, a 40 ms delay is needed before BIT_RUN is set.
+		 * 80 ms should provide sufficient margin.
+		 */
+		mdelay(80);
+
+		/*
+		 * RTC should be running now. Check if this is the case.
+		 * If not it might be a missing oscillator.
+		 */
+		ret = regmap_test_bits(tps->regmap, TPS6594_REG_RTC_STATUS,
+				       TPS6594_BIT_RUN);
+		if (ret < 0)
+			return ret;
+		if (ret == 0)
+			return -ENODEV;
+
+		// Stop RTC until first call to `tps6594_rtc_set_time`.
+		ret = regmap_clear_bits(tps->regmap, TPS6594_REG_RTC_CTRL_1,
+					TPS6594_BIT_STOP_RTC);
+		if (ret < 0)
+			return ret;
+	}
+
+	platform_set_drvdata(pdev, rtc);
+
+	irq = platform_get_irq_byname(pdev, TPS6594_IRQ_NAME_ALARM);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "Failed to get irq\n");
+
+	ret = devm_request_threaded_irq(dev, irq, NULL, tps6594_rtc_interrupt,
+					IRQF_ONESHOT, TPS6594_IRQ_NAME_ALARM,
+					dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to request_threaded_irq\n");
+
+	ret = device_init_wakeup(dev, true);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to init rtc as wakeup source\n");
+
+	rtc->ops = &tps6594_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
+
+	return devm_rtc_register_device(rtc);
+}
+
+static struct platform_driver tps6594_rtc_driver = {
+	.probe		= tps6594_rtc_probe,
+	.driver		= {
+		.name	= "tps6594-rtc",
+	},
+};
+
+module_platform_driver(tps6594_rtc_driver);
+MODULE_ALIAS("platform:tps6594-rtc");
+MODULE_AUTHOR("Esteban Blanc <eblanc@baylibre.com>");
+MODULE_DESCRIPTION("TPS6594 RTC driver");
+MODULE_LICENSE("GPL");
-- 
2.41.0

