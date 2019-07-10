Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63D3C645A3
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jul 2019 13:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfGJLNq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Jul 2019 07:13:46 -0400
Received: from inva020.nxp.com ([92.121.34.13]:50328 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725956AbfGJLNq (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 10 Jul 2019 07:13:46 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F11E71A0772;
        Wed, 10 Jul 2019 13:13:42 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E0BF11A0176;
        Wed, 10 Jul 2019 13:13:37 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A55DA402C9;
        Wed, 10 Jul 2019 19:13:31 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        leoyang.li@nxp.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiaobo.xie@nxp.com, jiafei.pan@nxp.com, ran.wang_1@nxp.com,
        Biwen Li <biwen.li@nxp.com>
Subject: [v2,1/2] rtc/fsl: add FTM alarm driver as the wakeup source
Date:   Wed, 10 Jul 2019 19:04:23 +0800
Message-Id: <20190710110424.4254-1-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

For the paltforms including LS1012A, LS1021A, LS1028A, LS1043A,
LS1046A, LS1088A, LS208xA that has the FlexTimer
module, implementing alarm functions within RTC subsystem
to wakeup the system when system going to sleep (work with RCPM driver).

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---

Change in v2:
    - remove code about setting rcpm

 drivers/rtc/Kconfig             |  14 ++
 drivers/rtc/Makefile            |   1 +
 drivers/rtc/rtc-fsl-ftm-alarm.c | 311 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 326 insertions(+)
 create mode 100644 drivers/rtc/rtc-fsl-ftm-alarm.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 03b60d5..0758a08 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1313,6 +1313,20 @@ config RTC_DRV_IMXDI
 	   This driver can also be built as a module, if so, the module
 	   will be called "rtc-imxdi".
 
+config RTC_DRV_FSL_FTM_ALARM
+	tristate "Freescale FlexTimer alarm timer"
+	depends on ARCH_LAYERSCAPE
+	default y
+	help
+	   For the FlexTimer in LS1012A, LS1021A, LS1028A, LS1043A, LS1046A,
+	   LS1088A, LS208xA, we can use FTM as the wakeup source.
+
+	   Say y here to enable FTM alarm support. The FTM alarm provides
+	   alarm functions for wakeup system from deep sleep.
+
+	   This driver can also be built as a module, if so, the module
+	   will be called "rtc-fsl-ftm-alarm".
+
 config RTC_DRV_MESON
 	tristate "Amlogic Meson RTC"
 	depends on (ARM && ARCH_MESON) || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 9d997fa..5cccb07 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -79,6 +79,7 @@ obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) += rtc-hid-sensor-time.o
 obj-$(CONFIG_RTC_DRV_HYM8563)	+= rtc-hym8563.o
 obj-$(CONFIG_RTC_DRV_IMXDI)	+= rtc-imxdi.o
 obj-$(CONFIG_RTC_DRV_IMX_SC)	+= rtc-imx-sc.o
+obj-$(CONFIG_RTC_DRV_FSL_FTM_ALARM)	+= rtc-fsl-ftm-alarm.o
 obj-$(CONFIG_RTC_DRV_ISL12022)	+= rtc-isl12022.o
 obj-$(CONFIG_RTC_DRV_ISL12026)	+= rtc-isl12026.o
 obj-$(CONFIG_RTC_DRV_ISL1208)	+= rtc-isl1208.o
diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
new file mode 100644
index 0000000..1836c2e
--- /dev/null
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -0,0 +1,311 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Freescale FlexTimer Module (FTM) alarm device driver.
+ *
+ * Copyright 2014 Freescale Semiconductor, Inc.
+ * Copyright 2019 NXP
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/module.h>
+#include <linux/fsl/ftm.h>
+#include <linux/rtc.h>
+#include <linux/time.h>
+
+#define FTM_SC_CLK(c)		((c) << FTM_SC_CLK_MASK_SHIFT)
+
+/*
+ * Select Fixed frequency clock as clock source
+ * of FlexTimer Module
+ */
+#define FTM_SC_CLKS_FIXED_FREQ	0x02
+
+#define FIXED_FREQ_CLK		32000
+#define MAX_FREQ_DIV		(1 << FTM_SC_PS_MASK)
+#define MAX_COUNT_VAL		0xffff
+
+struct ftm_rtc {
+	struct rtc_device *rtc_dev;
+	void __iomem *base;
+	bool endian;
+	u32 alarm_freq;
+};
+
+static inline u32 rtc_readl(struct ftm_rtc *dev, u32 reg)
+{
+	if (dev->endian)
+		return ioread32be(dev->base + reg); /*big endianness*/
+
+	return ioread32(dev->base + reg);
+}
+
+static inline void rtc_writel(struct ftm_rtc *dev, u32 reg, u32 val)
+{
+	if (dev->endian)
+		iowrite32be(val, dev->base + reg);
+	else
+		iowrite32(val, dev->base + reg);
+}
+
+static inline void ftm_counter_enable(struct ftm_rtc *rtc)
+{
+	u32 val;
+
+	/* select and enable counter clock source */
+	val = rtc_readl(rtc, FTM_SC);
+	val &= ~(FTM_SC_PS_MASK | FTM_SC_CLK_MASK);
+	val |= (FTM_SC_PS_MASK | FTM_SC_CLK(FTM_SC_CLKS_FIXED_FREQ));
+	rtc_writel(rtc, FTM_SC, val);
+}
+
+static inline void ftm_counter_disable(struct ftm_rtc *rtc)
+{
+	u32 val;
+
+	/* disable counter clock source */
+	val = rtc_readl(rtc, FTM_SC);
+	val &= ~(FTM_SC_PS_MASK | FTM_SC_CLK_MASK);
+	rtc_writel(rtc, FTM_SC, val);
+}
+
+static inline void ftm_irq_acknowledge(struct ftm_rtc *rtc)
+{
+	unsigned int timeout = 100;
+
+	while ((FTM_SC_TOF & rtc_readl(rtc, FTM_SC)) && timeout--)
+		rtc_writel(rtc, FTM_SC, rtc_readl(rtc, FTM_SC) & (~FTM_SC_TOF));
+}
+
+static inline void ftm_irq_enable(struct ftm_rtc *rtc)
+{
+	u32 val;
+
+	val = rtc_readl(rtc, FTM_SC);
+	val |= FTM_SC_TOIE;
+	rtc_writel(rtc, FTM_SC, val);
+}
+
+static inline void ftm_irq_disable(struct ftm_rtc *rtc)
+{
+	u32 val;
+
+	val = rtc_readl(rtc, FTM_SC);
+	val &= ~FTM_SC_TOIE;
+	rtc_writel(rtc, FTM_SC, val);
+}
+
+static inline void ftm_reset_counter(struct ftm_rtc *rtc)
+{
+	/*
+	 * The CNT register contains the FTM counter value.
+	 * Reset clears the CNT register. Writing any value to COUNT
+	 * updates the counter with its initial value, CNTIN.
+	 */
+	rtc_writel(rtc, FTM_CNT, 0x00);
+}
+
+static void ftm_clean_alarm(struct ftm_rtc *rtc)
+{
+	ftm_counter_disable(rtc);
+
+	rtc_writel(rtc, FTM_CNTIN, 0x00);
+	rtc_writel(rtc, FTM_MOD, ~0U);
+
+	ftm_reset_counter(rtc);
+}
+
+static irqreturn_t ftm_rtc_alarm_interrupt(int irq, void *dev)
+{
+	struct ftm_rtc *rtc = dev;
+
+	ftm_irq_acknowledge(rtc);
+	ftm_irq_disable(rtc);
+	ftm_clean_alarm(rtc);
+
+	return IRQ_HANDLED;
+}
+
+static int ftm_rtc_alarm_irq_enable(struct device *dev,
+		unsigned int enabled)
+{
+	struct ftm_rtc *rtc = dev_get_drvdata(dev);
+
+	if (enabled)
+		ftm_irq_enable(rtc);
+	else
+		ftm_irq_disable(rtc);
+
+	return 0;
+}
+
+/*
+ * Note:
+ *	The function is not really getting time from the RTC
+ *	since FlexTimer is not a RTC device, but we need to
+ *	get time to setup alarm, so we are using system time
+ *	for now.
+ */
+static int ftm_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct timespec64 ts64;
+	unsigned long local_time;
+
+	ktime_get_real_ts64(&ts64);
+	local_time = (unsigned long)(ts64.tv_sec - (sys_tz.tz_minuteswest * 60));
+
+	rtc_time_to_tm(local_time, tm);
+
+	return 0;
+}
+static int ftm_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
+{
+	return 0;
+}
+
+/*250Hz, 65536 / 250 = 262 second max*/
+static int ftm_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
+{
+	struct rtc_time tm;
+	unsigned long now, alm_time, cycle;
+	struct ftm_rtc *rtc = dev_get_drvdata(dev);
+
+	ftm_rtc_read_time(dev, &tm);
+	rtc_tm_to_time(&tm, &now);
+	rtc_tm_to_time(&alm->time, &alm_time);
+
+	ftm_clean_alarm(rtc);
+	cycle = (alm_time - now) * rtc->alarm_freq;
+	if (cycle > MAX_COUNT_VAL) {
+		pr_err("Out of alarm range.\n");
+		return -EINVAL;
+	}
+
+	ftm_irq_disable(rtc);
+
+	/*
+	 * The counter increments until the value of MOD is reached,
+	 * at which point the counter is reloaded with the value of CNTIN.
+	 * The TOF (the overflow flag) bit is set when the FTM counter
+	 * changes from MOD to CNTIN. So we should using the cycle - 1.
+	 */
+	rtc_writel(rtc, FTM_MOD, cycle - 1);
+
+	ftm_counter_enable(rtc);
+	ftm_irq_enable(rtc);
+
+	return 0;
+
+}
+
+static const struct rtc_class_ops ftm_rtc_ops = {
+	.read_time		= ftm_rtc_read_time,
+	.read_alarm		= ftm_rtc_read_alarm,
+	.set_alarm		= ftm_rtc_set_alarm,
+	.alarm_irq_enable	= ftm_rtc_alarm_irq_enable,
+};
+static int ftm_rtc_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct resource *r;
+	int irq;
+	int ret;
+	struct ftm_rtc *rtc;
+
+	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
+	if (unlikely(!rtc)) {
+		pr_err("ftm: cannot alloc memery for rtc\n");
+		return -ENOMEM;
+	}
+
+
+	platform_set_drvdata(pdev, rtc);
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!r) {
+		pr_err("ftm: cannot get resource for rtc\n");
+		return -ENODEV;
+	}
+
+	rtc->base = devm_ioremap_resource(&pdev->dev, r);
+	if (IS_ERR(rtc->base)) {
+		pr_err("ftm: cannot ioremap resource for rtc\n");
+		return PTR_ERR(rtc->base);
+	}
+
+	irq = irq_of_parse_and_map(np, 0);
+	if (irq <= 0) {
+		pr_err("ftm: unable to get IRQ from DT, %d\n", irq);
+		return -EINVAL;
+	}
+
+	rtc->endian = of_property_read_bool(np, "big-endian");
+
+	ret = devm_request_irq(&pdev->dev, irq, ftm_rtc_alarm_interrupt,
+			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), rtc);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to request irq\n");
+		return ret;
+	}
+
+	rtc->alarm_freq = (u32)FIXED_FREQ_CLK / (u32)MAX_FREQ_DIV;
+
+	ftm_clean_alarm(rtc);
+
+	device_init_wakeup(&pdev->dev, true);
+	rtc->rtc_dev = devm_rtc_device_register(&pdev->dev, "ftm-alarm",
+							&ftm_rtc_ops,
+							THIS_MODULE);
+	if (IS_ERR(rtc->rtc_dev)) {
+		dev_err(&pdev->dev, "can't register rtc device\n");
+		return PTR_ERR(rtc->rtc_dev);
+	}
+	return ret;
+}
+
+static const struct of_device_id ftm_rtc_match[] = {
+	{ .compatible = "fsl,ftm-alarm", },
+	{ .compatible = "fsl,ls1012a-ftm-alarm", },
+	{ .compatible = "fsl,ls1021a-ftm-alarm", },
+	{ .compatible = "fsl,ls1043a-ftm-alarm", },
+	{ .compatible = "fsl,ls1046a-ftm-alarm", },
+	{ .compatible = "fsl,ls1088a-ftm-alarm", },
+	{ .compatible = "fsl,ls208xa-ftm-alarm", },
+	{ .compatible = "fsl,ls1028a-ftm-alarm", },
+	{ },
+};
+
+static struct platform_driver ftm_rtc_driver = {
+	.probe		= ftm_rtc_probe,
+	.driver		= {
+		.name	= "ftm-alarm",
+		.of_match_table = ftm_rtc_match,
+	},
+};
+
+static int __init ftm_alarm_init(void)
+{
+	return platform_driver_register(&ftm_rtc_driver);
+}
+
+/***************
+ *Ensure that the driver is initialized after
+ *any real rtc driver
+ */
+device_initcall_sync(ftm_alarm_init);
+
+MODULE_DESCRIPTION("NXP/Freescale FlexTimer alarm driver");
+MODULE_AUTHOR("Biwen Li <biwen.li@nxp.com>");
+MODULE_LICENSE("GPL");
-- 
2.7.4

