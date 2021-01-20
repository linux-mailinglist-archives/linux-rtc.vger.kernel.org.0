Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8AC2FD470
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Jan 2021 16:48:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728981AbhATPqd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 20 Jan 2021 10:46:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:57696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733042AbhATPmv (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 20 Jan 2021 10:42:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80FC823382;
        Wed, 20 Jan 2021 15:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611157329;
        bh=T9xyOgUhu1xz0Ggrk+3PTqE768OmzsjXmHEzzGIrhpw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FqWNkBFb06L2Dz3SSmCpMpLQNh4DJvDxiCp0gAC7Q2D1nMpNgd/7jgsjY+8tIqny/
         mI1JPrlwzzQOqmlt0/RkrIGWlU2pSneDjmmNCPTzhc3UDmXnA13tPMwtmQOwi5dESa
         /FFZ72hqAAdrq9t+slnz/JjwZvwVeD6JrHgPjSIIvjrORVXQ+NCisNY/k3ZZI32wy4
         rchFksPfS3R+CrSIpxX2ug1AgCb45LduSWZN4cUXXi3dTcKB+W4K/Z1YU9z9rF5j9p
         SfFB4rkjDjun//8xFikfDRDs9Y8mPJ0Edvw70wA+yvrj0j7BqYTFGsD4CS/ULL8sEq
         7he6wt4bujPuA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3] rtc: remove ste coh901 driver
Date:   Wed, 20 Jan 2021 16:41:57 +0100
Message-Id: <20210120154158.1860736-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120154158.1860736-1-arnd@kernel.org>
References: <20210120154158.1860736-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The ST-Ericsson U300 platform is getting removed, so this driver is no
longer needed.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../bindings/rtc/stericsson,coh901331.txt     |  16 -
 drivers/rtc/Kconfig                           |  12 -
 drivers/rtc/Makefile                          |   1 -
 drivers/rtc/rtc-coh901331.c                   | 290 ------------------
 4 files changed, 319 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/stericsson,coh901331.txt
 delete mode 100644 drivers/rtc/rtc-coh901331.c

diff --git a/Documentation/devicetree/bindings/rtc/stericsson,coh901331.txt b/Documentation/devicetree/bindings/rtc/stericsson,coh901331.txt
deleted file mode 100644
index e615a897b20e..000000000000
--- a/Documentation/devicetree/bindings/rtc/stericsson,coh901331.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-ST-Ericsson COH 901 331 Real Time Clock
-
-Required properties:
-- compatible: must be "stericsson,coh901331"
-- reg: address range of rtc register set.
-- interrupts: rtc alarm interrupt.
-- clocks: phandle to the rtc clock source
-
-Example:
-	rtc: rtc@c0017000 {
-		compatible = "stericsson,coh901331";
-		reg = <0xc0017000 0x1000>;
-		interrupt-parent = <&vicb>;
-		interrupts = <10>;
-		clocks = <&rtc_clk>;
-	};
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 8fb9aa55ace1..ff583d6a2870 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1645,18 +1645,6 @@ config RTC_DRV_PS3
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-ps3.
 
-config RTC_DRV_COH901331
-	tristate "ST-Ericsson COH 901 331 RTC"
-	depends on ARCH_U300 || COMPILE_TEST
-	help
-	  If you say Y here you will get access to ST-Ericsson
-	  COH 901 331 RTC clock found in some ST-Ericsson Mobile
-	  Platforms.
-
-	  This driver can also be built as a module. If so, the module
-	  will be called "rtc-coh901331".
-
-
 config RTC_DRV_STMP
 	tristate "Freescale STMP3xxx/i.MX23/i.MX28 RTC"
 	depends on ARCH_MXS || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 1f00896db507..8585cd159979 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -38,7 +38,6 @@ obj-$(CONFIG_RTC_DRV_BQ4802)	+= rtc-bq4802.o
 obj-$(CONFIG_RTC_DRV_BRCMSTB)	+= rtc-brcmstb-waketimer.o
 obj-$(CONFIG_RTC_DRV_CADENCE)	+= rtc-cadence.o
 obj-$(CONFIG_RTC_DRV_CMOS)	+= rtc-cmos.o
-obj-$(CONFIG_RTC_DRV_COH901331)	+= rtc-coh901331.o
 obj-$(CONFIG_RTC_DRV_CPCAP)	+= rtc-cpcap.o
 obj-$(CONFIG_RTC_DRV_CROS_EC)	+= rtc-cros-ec.o
 obj-$(CONFIG_RTC_DRV_DA9052)	+= rtc-da9052.o
diff --git a/drivers/rtc/rtc-coh901331.c b/drivers/rtc/rtc-coh901331.c
deleted file mode 100644
index 168ced87d93a..000000000000
--- a/drivers/rtc/rtc-coh901331.c
+++ /dev/null
@@ -1,290 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2007-2009 ST-Ericsson AB
- * Real Time Clock interface for ST-Ericsson AB COH 901 331 RTC.
- * Author: Linus Walleij <linus.walleij@stericsson.com>
- * Based on rtc-pl031.c by Deepak Saxena <dsaxena@plexity.net>
- * Copyright 2006 (c) MontaVista Software, Inc.
- */
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/mod_devicetable.h>
-#include <linux/rtc.h>
-#include <linux/clk.h>
-#include <linux/interrupt.h>
-#include <linux/pm.h>
-#include <linux/platform_device.h>
-#include <linux/io.h>
-#include <linux/slab.h>
-
-/*
- * Registers in the COH 901 331
- */
-/* Alarm value 32bit (R/W) */
-#define COH901331_ALARM		0x00U
-/* Used to set current time 32bit (R/W) */
-#define COH901331_SET_TIME	0x04U
-/* Indication if current time is valid 32bit (R/-) */
-#define COH901331_VALID		0x08U
-/* Read the current time 32bit (R/-) */
-#define COH901331_CUR_TIME	0x0cU
-/* Event register for the "alarm" interrupt */
-#define COH901331_IRQ_EVENT	0x10U
-/* Mask register for the "alarm" interrupt */
-#define COH901331_IRQ_MASK	0x14U
-/* Force register for the "alarm" interrupt */
-#define COH901331_IRQ_FORCE	0x18U
-
-/*
- * Reference to RTC block clock
- * Notice that the frequent clk_enable()/clk_disable() on this
- * clock is mainly to be able to turn on/off other clocks in the
- * hierarchy as needed, the RTC clock is always on anyway.
- */
-struct coh901331_port {
-	struct rtc_device *rtc;
-	struct clk *clk;
-	void __iomem *virtbase;
-	int irq;
-#ifdef CONFIG_PM_SLEEP
-	u32 irqmaskstore;
-#endif
-};
-
-static irqreturn_t coh901331_interrupt(int irq, void *data)
-{
-	struct coh901331_port *rtap = data;
-
-	clk_enable(rtap->clk);
-	/* Ack IRQ */
-	writel(1, rtap->virtbase + COH901331_IRQ_EVENT);
-	/*
-	 * Disable the interrupt. This is necessary because
-	 * the RTC lives on a lower-clocked line and will
-	 * not release the IRQ line until after a few (slower)
-	 * clock cycles. The interrupt will be re-enabled when
-	 * a new alarm is set anyway.
-	 */
-	writel(0, rtap->virtbase + COH901331_IRQ_MASK);
-	clk_disable(rtap->clk);
-
-	/* Set alarm flag */
-	rtc_update_irq(rtap->rtc, 1, RTC_AF);
-
-	return IRQ_HANDLED;
-}
-
-static int coh901331_read_time(struct device *dev, struct rtc_time *tm)
-{
-	struct coh901331_port *rtap = dev_get_drvdata(dev);
-
-	clk_enable(rtap->clk);
-	/* Check if the time is valid */
-	if (!readl(rtap->virtbase + COH901331_VALID)) {
-		clk_disable(rtap->clk);
-		return -EINVAL;
-	}
-
-	rtc_time64_to_tm(readl(rtap->virtbase + COH901331_CUR_TIME), tm);
-	clk_disable(rtap->clk);
-	return 0;
-}
-
-static int coh901331_set_time(struct device *dev, struct rtc_time *tm)
-{
-	struct coh901331_port *rtap = dev_get_drvdata(dev);
-
-	clk_enable(rtap->clk);
-	writel(rtc_tm_to_time64(tm), rtap->virtbase + COH901331_SET_TIME);
-	clk_disable(rtap->clk);
-
-	return 0;
-}
-
-static int coh901331_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
-{
-	struct coh901331_port *rtap = dev_get_drvdata(dev);
-
-	clk_enable(rtap->clk);
-	rtc_time64_to_tm(readl(rtap->virtbase + COH901331_ALARM), &alarm->time);
-	alarm->pending = readl(rtap->virtbase + COH901331_IRQ_EVENT) & 1U;
-	alarm->enabled = readl(rtap->virtbase + COH901331_IRQ_MASK) & 1U;
-	clk_disable(rtap->clk);
-
-	return 0;
-}
-
-static int coh901331_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
-{
-	struct coh901331_port *rtap = dev_get_drvdata(dev);
-	unsigned long time =  rtc_tm_to_time64(&alarm->time);
-
-	clk_enable(rtap->clk);
-	writel(time, rtap->virtbase + COH901331_ALARM);
-	writel(alarm->enabled, rtap->virtbase + COH901331_IRQ_MASK);
-	clk_disable(rtap->clk);
-
-	return 0;
-}
-
-static int coh901331_alarm_irq_enable(struct device *dev, unsigned int enabled)
-{
-	struct coh901331_port *rtap = dev_get_drvdata(dev);
-
-	clk_enable(rtap->clk);
-	if (enabled)
-		writel(1, rtap->virtbase + COH901331_IRQ_MASK);
-	else
-		writel(0, rtap->virtbase + COH901331_IRQ_MASK);
-	clk_disable(rtap->clk);
-
-	return 0;
-}
-
-static const struct rtc_class_ops coh901331_ops = {
-	.read_time = coh901331_read_time,
-	.set_time = coh901331_set_time,
-	.read_alarm = coh901331_read_alarm,
-	.set_alarm = coh901331_set_alarm,
-	.alarm_irq_enable = coh901331_alarm_irq_enable,
-};
-
-static int __exit coh901331_remove(struct platform_device *pdev)
-{
-	struct coh901331_port *rtap = platform_get_drvdata(pdev);
-
-	if (rtap)
-		clk_unprepare(rtap->clk);
-
-	return 0;
-}
-
-
-static int __init coh901331_probe(struct platform_device *pdev)
-{
-	int ret;
-	struct coh901331_port *rtap;
-
-	rtap = devm_kzalloc(&pdev->dev,
-			    sizeof(struct coh901331_port), GFP_KERNEL);
-	if (!rtap)
-		return -ENOMEM;
-
-	rtap->virtbase  = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(rtap->virtbase))
-		return PTR_ERR(rtap->virtbase);
-
-	rtap->irq = platform_get_irq(pdev, 0);
-	if (devm_request_irq(&pdev->dev, rtap->irq, coh901331_interrupt, 0,
-			     "RTC COH 901 331 Alarm", rtap))
-		return -EIO;
-
-	rtap->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(rtap->clk)) {
-		ret = PTR_ERR(rtap->clk);
-		dev_err(&pdev->dev, "could not get clock\n");
-		return ret;
-	}
-
-	rtap->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(rtap->rtc))
-		return PTR_ERR(rtap->rtc);
-
-	rtap->rtc->ops = &coh901331_ops;
-	rtap->rtc->range_max = U32_MAX;
-
-	/* We enable/disable the clock only to assure it works */
-	ret = clk_prepare_enable(rtap->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "could not enable clock\n");
-		return ret;
-	}
-	clk_disable(rtap->clk);
-
-	platform_set_drvdata(pdev, rtap);
-
-	ret = devm_rtc_register_device(rtap->rtc);
-	if (ret)
-		goto out_no_rtc;
-
-	return 0;
-
- out_no_rtc:
-	clk_unprepare(rtap->clk);
-	return ret;
-}
-
-#ifdef CONFIG_PM_SLEEP
-static int coh901331_suspend(struct device *dev)
-{
-	struct coh901331_port *rtap = dev_get_drvdata(dev);
-
-	/*
-	 * If this RTC alarm will be used for waking the system up,
-	 * don't disable it of course. Else we just disable the alarm
-	 * and await suspension.
-	 */
-	if (device_may_wakeup(dev)) {
-		enable_irq_wake(rtap->irq);
-	} else {
-		clk_enable(rtap->clk);
-		rtap->irqmaskstore = readl(rtap->virtbase + COH901331_IRQ_MASK);
-		writel(0, rtap->virtbase + COH901331_IRQ_MASK);
-		clk_disable(rtap->clk);
-	}
-	clk_unprepare(rtap->clk);
-	return 0;
-}
-
-static int coh901331_resume(struct device *dev)
-{
-	int ret;
-	struct coh901331_port *rtap = dev_get_drvdata(dev);
-
-	ret = clk_prepare(rtap->clk);
-	if (ret)
-		return ret;
-
-	if (device_may_wakeup(dev)) {
-		disable_irq_wake(rtap->irq);
-	} else {
-		clk_enable(rtap->clk);
-		writel(rtap->irqmaskstore, rtap->virtbase + COH901331_IRQ_MASK);
-		clk_disable(rtap->clk);
-	}
-	return 0;
-}
-#endif
-
-static SIMPLE_DEV_PM_OPS(coh901331_pm_ops, coh901331_suspend, coh901331_resume);
-
-static void coh901331_shutdown(struct platform_device *pdev)
-{
-	struct coh901331_port *rtap = platform_get_drvdata(pdev);
-
-	clk_enable(rtap->clk);
-	writel(0, rtap->virtbase + COH901331_IRQ_MASK);
-	clk_disable_unprepare(rtap->clk);
-}
-
-static const struct of_device_id coh901331_dt_match[] = {
-	{ .compatible = "stericsson,coh901331" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, coh901331_dt_match);
-
-static struct platform_driver coh901331_driver = {
-	.driver = {
-		.name = "rtc-coh901331",
-		.pm = &coh901331_pm_ops,
-		.of_match_table = coh901331_dt_match,
-	},
-	.remove = __exit_p(coh901331_remove),
-	.shutdown = coh901331_shutdown,
-};
-
-module_platform_driver_probe(coh901331_driver, coh901331_probe);
-
-MODULE_AUTHOR("Linus Walleij <linus.walleij@stericsson.com>");
-MODULE_DESCRIPTION("ST-Ericsson AB COH 901 331 RTC Driver");
-MODULE_LICENSE("GPL");
-- 
2.29.2

