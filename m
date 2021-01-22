Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5073002D6
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Jan 2021 13:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbhAVMZ4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Jan 2021 07:25:56 -0500
Received: from mga17.intel.com ([192.55.52.151]:29357 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727072AbhAVMYR (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 22 Jan 2021 07:24:17 -0500
IronPort-SDR: MCsLr69ctfulhZVl2JImwfwdJKzxj3vAVd7HnzvwzNXDxg7ENLP5Zeb8KiJ4xCO7K01xBIJLgY
 UwmXq3fWgzNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="159214352"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="159214352"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 04:22:29 -0800
IronPort-SDR: FXkkwYsKVaSAoM+9f6XLTv8swPJ1nVAku6wGEoIysjI7JyNWjXHzB4B17Epod6YwhcdeEoyo/q
 ACScKsv1jpmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="403751405"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2021 04:22:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 268F114F; Fri, 22 Jan 2021 14:22:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1] rtc: mrst: Remove driver for deprecated platform
Date:   Fri, 22 Jan 2021 14:22:26 +0200
Message-Id: <20210122122226.38334-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Intel Moorestown and Medfield are quite old Intel Atom based
32-bit platforms, which were in limited use in some Android phones,
tablets and consumer electronics more than eight years ago.

There are no bugs or problems ever reported outside from Intel
for breaking any of that platforms for years. It seems no real
users exists who run more or less fresh kernel on it. The commit
05f4434bc130 ("ASoC: Intel: remove mfld_machine") also in align
with this theory.

Due to above and to reduce a burden of supporting outdated drivers
we remove the support of outdated platforms completely.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/rtc/Kconfig    |  12 -
 drivers/rtc/Makefile   |   1 -
 drivers/rtc/rtc-mrst.c | 521 -----------------------------------------
 3 files changed, 534 deletions(-)
 delete mode 100644 drivers/rtc/rtc-mrst.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 6123f9f4fbc9..2a402c10f8f1 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -973,18 +973,6 @@ config RTC_DRV_ALPHA
 	  Direct support for the real-time clock found on every Alpha
 	  system, specifically MC146818 compatibles.  If in doubt, say Y.
 
-config RTC_DRV_VRTC
-	tristate "Virtual RTC for Intel MID platforms"
-	depends on X86_INTEL_MID
-	default y if X86_INTEL_MID
-
-	help
-	Say "yes" here to get direct support for the real time clock
-	found on Moorestown platforms. The VRTC is a emulated RTC that
-	derives its clock source from a real RTC in the PMIC. The MC146818
-	style programming interface is mostly conserved, but any
-	updates are done via IPC calls to the system controller FW.
-
 config RTC_DRV_DS1216
 	tristate "Dallas DS1216"
 	depends on SNI_RM
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index bb8f319b09fb..f8ac4f574522 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -174,7 +174,6 @@ obj-$(CONFIG_RTC_DRV_TWL4030)	+= rtc-twl.o
 obj-$(CONFIG_RTC_DRV_TX4939)	+= rtc-tx4939.o
 obj-$(CONFIG_RTC_DRV_V3020)	+= rtc-v3020.o
 obj-$(CONFIG_RTC_DRV_VR41XX)	+= rtc-vr41xx.o
-obj-$(CONFIG_RTC_DRV_VRTC)	+= rtc-mrst.o
 obj-$(CONFIG_RTC_DRV_VT8500)	+= rtc-vt8500.o
 obj-$(CONFIG_RTC_DRV_WILCO_EC)	+= rtc-wilco-ec.o
 obj-$(CONFIG_RTC_DRV_WM831X)	+= rtc-wm831x.o
diff --git a/drivers/rtc/rtc-mrst.c b/drivers/rtc/rtc-mrst.c
deleted file mode 100644
index 421b3b6071b6..000000000000
--- a/drivers/rtc/rtc-mrst.c
+++ /dev/null
@@ -1,521 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * rtc-mrst.c: Driver for Moorestown virtual RTC
- *
- * (C) Copyright 2009 Intel Corporation
- * Author: Jacob Pan (jacob.jun.pan@intel.com)
- *	   Feng Tang (feng.tang@intel.com)
- *
- * Note:
- * VRTC is emulated by system controller firmware, the real HW
- * RTC is located in the PMIC device. SCU FW shadows PMIC RTC
- * in a memory mapped IO space that is visible to the host IA
- * processor.
- *
- * This driver is based upon drivers/rtc/rtc-cmos.c
- */
-
-/*
- * Note:
- *  * vRTC only supports binary mode and 24H mode
- *  * vRTC only support PIE and AIE, no UIE, and its PIE only happens
- *    at 23:59:59pm everyday, no support for adjustable frequency
- *  * Alarm function is also limited to hr/min/sec.
- */
-
-#include <linux/mod_devicetable.h>
-#include <linux/platform_device.h>
-#include <linux/interrupt.h>
-#include <linux/spinlock.h>
-#include <linux/kernel.h>
-#include <linux/mc146818rtc.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/sfi.h>
-
-#include <asm/intel_scu_ipc.h>
-#include <asm/intel-mid.h>
-#include <asm/intel_mid_vrtc.h>
-
-struct mrst_rtc {
-	struct rtc_device	*rtc;
-	struct device		*dev;
-	int			irq;
-
-	u8			enabled_wake;
-	u8			suspend_ctrl;
-};
-
-static const char driver_name[] = "rtc_mrst";
-
-#define	RTC_IRQMASK	(RTC_PF | RTC_AF)
-
-static inline int is_intr(u8 rtc_intr)
-{
-	if (!(rtc_intr & RTC_IRQF))
-		return 0;
-	return rtc_intr & RTC_IRQMASK;
-}
-
-static inline unsigned char vrtc_is_updating(void)
-{
-	unsigned char uip;
-	unsigned long flags;
-
-	spin_lock_irqsave(&rtc_lock, flags);
-	uip = (vrtc_cmos_read(RTC_FREQ_SELECT) & RTC_UIP);
-	spin_unlock_irqrestore(&rtc_lock, flags);
-	return uip;
-}
-
-/*
- * rtc_time's year contains the increment over 1900, but vRTC's YEAR
- * register can't be programmed to value larger than 0x64, so vRTC
- * driver chose to use 1972 (1970 is UNIX time start point) as the base,
- * and does the translation at read/write time.
- *
- * Why not just use 1970 as the offset? it's because using 1972 will
- * make it consistent in leap year setting for both vrtc and low-level
- * physical rtc devices. Then why not use 1960 as the offset? If we use
- * 1960, for a device's first use, its YEAR register is 0 and the system
- * year will be parsed as 1960 which is not a valid UNIX time and will
- * cause many applications to fail mysteriously.
- */
-static int mrst_read_time(struct device *dev, struct rtc_time *time)
-{
-	unsigned long flags;
-
-	if (vrtc_is_updating())
-		msleep(20);
-
-	spin_lock_irqsave(&rtc_lock, flags);
-	time->tm_sec = vrtc_cmos_read(RTC_SECONDS);
-	time->tm_min = vrtc_cmos_read(RTC_MINUTES);
-	time->tm_hour = vrtc_cmos_read(RTC_HOURS);
-	time->tm_mday = vrtc_cmos_read(RTC_DAY_OF_MONTH);
-	time->tm_mon = vrtc_cmos_read(RTC_MONTH);
-	time->tm_year = vrtc_cmos_read(RTC_YEAR);
-	spin_unlock_irqrestore(&rtc_lock, flags);
-
-	/* Adjust for the 1972/1900 */
-	time->tm_year += 72;
-	time->tm_mon--;
-	return 0;
-}
-
-static int mrst_set_time(struct device *dev, struct rtc_time *time)
-{
-	int ret;
-	unsigned long flags;
-	unsigned char mon, day, hrs, min, sec;
-	unsigned int yrs;
-
-	yrs = time->tm_year;
-	mon = time->tm_mon + 1;   /* tm_mon starts at zero */
-	day = time->tm_mday;
-	hrs = time->tm_hour;
-	min = time->tm_min;
-	sec = time->tm_sec;
-
-	if (yrs < 72 || yrs > 172)
-		return -EINVAL;
-	yrs -= 72;
-
-	spin_lock_irqsave(&rtc_lock, flags);
-
-	vrtc_cmos_write(yrs, RTC_YEAR);
-	vrtc_cmos_write(mon, RTC_MONTH);
-	vrtc_cmos_write(day, RTC_DAY_OF_MONTH);
-	vrtc_cmos_write(hrs, RTC_HOURS);
-	vrtc_cmos_write(min, RTC_MINUTES);
-	vrtc_cmos_write(sec, RTC_SECONDS);
-
-	spin_unlock_irqrestore(&rtc_lock, flags);
-
-	ret = intel_scu_ipc_simple_command(IPCMSG_VRTC, IPC_CMD_VRTC_SETTIME);
-	return ret;
-}
-
-static int mrst_read_alarm(struct device *dev, struct rtc_wkalrm *t)
-{
-	struct mrst_rtc	*mrst = dev_get_drvdata(dev);
-	unsigned char rtc_control;
-
-	if (mrst->irq <= 0)
-		return -EIO;
-
-	/* vRTC only supports binary mode */
-	spin_lock_irq(&rtc_lock);
-	t->time.tm_sec = vrtc_cmos_read(RTC_SECONDS_ALARM);
-	t->time.tm_min = vrtc_cmos_read(RTC_MINUTES_ALARM);
-	t->time.tm_hour = vrtc_cmos_read(RTC_HOURS_ALARM);
-
-	rtc_control = vrtc_cmos_read(RTC_CONTROL);
-	spin_unlock_irq(&rtc_lock);
-
-	t->enabled = !!(rtc_control & RTC_AIE);
-	t->pending = 0;
-
-	return 0;
-}
-
-static void mrst_checkintr(struct mrst_rtc *mrst, unsigned char rtc_control)
-{
-	unsigned char	rtc_intr;
-
-	/*
-	 * NOTE after changing RTC_xIE bits we always read INTR_FLAGS;
-	 * allegedly some older rtcs need that to handle irqs properly
-	 */
-	rtc_intr = vrtc_cmos_read(RTC_INTR_FLAGS);
-	rtc_intr &= (rtc_control & RTC_IRQMASK) | RTC_IRQF;
-	if (is_intr(rtc_intr))
-		rtc_update_irq(mrst->rtc, 1, rtc_intr);
-}
-
-static void mrst_irq_enable(struct mrst_rtc *mrst, unsigned char mask)
-{
-	unsigned char	rtc_control;
-
-	/*
-	 * Flush any pending IRQ status, notably for update irqs,
-	 * before we enable new IRQs
-	 */
-	rtc_control = vrtc_cmos_read(RTC_CONTROL);
-	mrst_checkintr(mrst, rtc_control);
-
-	rtc_control |= mask;
-	vrtc_cmos_write(rtc_control, RTC_CONTROL);
-
-	mrst_checkintr(mrst, rtc_control);
-}
-
-static void mrst_irq_disable(struct mrst_rtc *mrst, unsigned char mask)
-{
-	unsigned char	rtc_control;
-
-	rtc_control = vrtc_cmos_read(RTC_CONTROL);
-	rtc_control &= ~mask;
-	vrtc_cmos_write(rtc_control, RTC_CONTROL);
-	mrst_checkintr(mrst, rtc_control);
-}
-
-static int mrst_set_alarm(struct device *dev, struct rtc_wkalrm *t)
-{
-	struct mrst_rtc	*mrst = dev_get_drvdata(dev);
-	unsigned char hrs, min, sec;
-	int ret = 0;
-
-	if (!mrst->irq)
-		return -EIO;
-
-	hrs = t->time.tm_hour;
-	min = t->time.tm_min;
-	sec = t->time.tm_sec;
-
-	spin_lock_irq(&rtc_lock);
-	/* Next rtc irq must not be from previous alarm setting */
-	mrst_irq_disable(mrst, RTC_AIE);
-
-	/* Update alarm */
-	vrtc_cmos_write(hrs, RTC_HOURS_ALARM);
-	vrtc_cmos_write(min, RTC_MINUTES_ALARM);
-	vrtc_cmos_write(sec, RTC_SECONDS_ALARM);
-
-	spin_unlock_irq(&rtc_lock);
-
-	ret = intel_scu_ipc_simple_command(IPCMSG_VRTC, IPC_CMD_VRTC_SETALARM);
-	if (ret)
-		return ret;
-
-	spin_lock_irq(&rtc_lock);
-	if (t->enabled)
-		mrst_irq_enable(mrst, RTC_AIE);
-
-	spin_unlock_irq(&rtc_lock);
-
-	return 0;
-}
-
-/* Currently, the vRTC doesn't support UIE ON/OFF */
-static int mrst_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
-{
-	struct mrst_rtc	*mrst = dev_get_drvdata(dev);
-	unsigned long	flags;
-
-	spin_lock_irqsave(&rtc_lock, flags);
-	if (enabled)
-		mrst_irq_enable(mrst, RTC_AIE);
-	else
-		mrst_irq_disable(mrst, RTC_AIE);
-	spin_unlock_irqrestore(&rtc_lock, flags);
-	return 0;
-}
-
-
-#if IS_ENABLED(CONFIG_RTC_INTF_PROC)
-
-static int mrst_procfs(struct device *dev, struct seq_file *seq)
-{
-	unsigned char	rtc_control;
-
-	spin_lock_irq(&rtc_lock);
-	rtc_control = vrtc_cmos_read(RTC_CONTROL);
-	spin_unlock_irq(&rtc_lock);
-
-	seq_printf(seq,
-		   "periodic_IRQ\t: %s\n"
-		   "alarm\t\t: %s\n"
-		   "BCD\t\t: no\n"
-		   "periodic_freq\t: daily (not adjustable)\n",
-		   (rtc_control & RTC_PIE) ? "on" : "off",
-		   (rtc_control & RTC_AIE) ? "on" : "off");
-
-	return 0;
-}
-
-#else
-#define	mrst_procfs	NULL
-#endif
-
-static const struct rtc_class_ops mrst_rtc_ops = {
-	.read_time	= mrst_read_time,
-	.set_time	= mrst_set_time,
-	.read_alarm	= mrst_read_alarm,
-	.set_alarm	= mrst_set_alarm,
-	.proc		= mrst_procfs,
-	.alarm_irq_enable = mrst_rtc_alarm_irq_enable,
-};
-
-static struct mrst_rtc	mrst_rtc;
-
-/*
- * When vRTC IRQ is captured by SCU FW, FW will clear the AIE bit in
- * Reg B, so no need for this driver to clear it
- */
-static irqreturn_t mrst_rtc_irq(int irq, void *p)
-{
-	u8 irqstat;
-
-	spin_lock(&rtc_lock);
-	/* This read will clear all IRQ flags inside Reg C */
-	irqstat = vrtc_cmos_read(RTC_INTR_FLAGS);
-	spin_unlock(&rtc_lock);
-
-	irqstat &= RTC_IRQMASK | RTC_IRQF;
-	if (is_intr(irqstat)) {
-		rtc_update_irq(p, 1, irqstat);
-		return IRQ_HANDLED;
-	}
-	return IRQ_NONE;
-}
-
-static int vrtc_mrst_do_probe(struct device *dev, struct resource *iomem,
-			      int rtc_irq)
-{
-	int retval = 0;
-	unsigned char rtc_control;
-
-	/* There can be only one ... */
-	if (mrst_rtc.dev)
-		return -EBUSY;
-
-	if (!iomem)
-		return -ENODEV;
-
-	iomem = devm_request_mem_region(dev, iomem->start, resource_size(iomem),
-					driver_name);
-	if (!iomem) {
-		dev_dbg(dev, "i/o mem already in use.\n");
-		return -EBUSY;
-	}
-
-	mrst_rtc.irq = rtc_irq;
-	mrst_rtc.dev = dev;
-	dev_set_drvdata(dev, &mrst_rtc);
-
-	mrst_rtc.rtc = devm_rtc_allocate_device(dev);
-	if (IS_ERR(mrst_rtc.rtc))
-		return PTR_ERR(mrst_rtc.rtc);
-
-	mrst_rtc.rtc->ops = &mrst_rtc_ops;
-
-	rename_region(iomem, dev_name(&mrst_rtc.rtc->dev));
-
-	spin_lock_irq(&rtc_lock);
-	mrst_irq_disable(&mrst_rtc, RTC_PIE | RTC_AIE);
-	rtc_control = vrtc_cmos_read(RTC_CONTROL);
-	spin_unlock_irq(&rtc_lock);
-
-	if (!(rtc_control & RTC_24H) || (rtc_control & (RTC_DM_BINARY)))
-		dev_dbg(dev, "TODO: support more than 24-hr BCD mode\n");
-
-	if (rtc_irq) {
-		retval = devm_request_irq(dev, rtc_irq, mrst_rtc_irq,
-					  0, dev_name(&mrst_rtc.rtc->dev),
-					  mrst_rtc.rtc);
-		if (retval < 0) {
-			dev_dbg(dev, "IRQ %d is already in use, err %d\n",
-				rtc_irq, retval);
-			goto cleanup0;
-		}
-	}
-
-	retval = devm_rtc_register_device(mrst_rtc.rtc);
-	if (retval)
-		goto cleanup0;
-
-	dev_dbg(dev, "initialised\n");
-	return 0;
-
-cleanup0:
-	mrst_rtc.dev = NULL;
-	dev_err(dev, "rtc-mrst: unable to initialise\n");
-	return retval;
-}
-
-static void rtc_mrst_do_shutdown(void)
-{
-	spin_lock_irq(&rtc_lock);
-	mrst_irq_disable(&mrst_rtc, RTC_IRQMASK);
-	spin_unlock_irq(&rtc_lock);
-}
-
-static void rtc_mrst_do_remove(struct device *dev)
-{
-	struct mrst_rtc	*mrst = dev_get_drvdata(dev);
-
-	rtc_mrst_do_shutdown();
-
-	mrst->rtc = NULL;
-	mrst->dev = NULL;
-}
-
-#ifdef CONFIG_PM_SLEEP
-static int mrst_suspend(struct device *dev)
-{
-	struct mrst_rtc	*mrst = dev_get_drvdata(dev);
-	unsigned char	tmp;
-
-	/* Only the alarm might be a wakeup event source */
-	spin_lock_irq(&rtc_lock);
-	mrst->suspend_ctrl = tmp = vrtc_cmos_read(RTC_CONTROL);
-	if (tmp & (RTC_PIE | RTC_AIE)) {
-		unsigned char	mask;
-
-		if (device_may_wakeup(dev))
-			mask = RTC_IRQMASK & ~RTC_AIE;
-		else
-			mask = RTC_IRQMASK;
-		tmp &= ~mask;
-		vrtc_cmos_write(tmp, RTC_CONTROL);
-
-		mrst_checkintr(mrst, tmp);
-	}
-	spin_unlock_irq(&rtc_lock);
-
-	if (tmp & RTC_AIE) {
-		mrst->enabled_wake = 1;
-		enable_irq_wake(mrst->irq);
-	}
-
-	dev_dbg(&mrst_rtc.rtc->dev, "suspend%s, ctrl %02x\n",
-			(tmp & RTC_AIE) ? ", alarm may wake" : "",
-			tmp);
-
-	return 0;
-}
-
-/*
- * We want RTC alarms to wake us from the deep power saving state
- */
-static inline int mrst_poweroff(struct device *dev)
-{
-	return mrst_suspend(dev);
-}
-
-static int mrst_resume(struct device *dev)
-{
-	struct mrst_rtc	*mrst = dev_get_drvdata(dev);
-	unsigned char tmp = mrst->suspend_ctrl;
-
-	/* Re-enable any irqs previously active */
-	if (tmp & RTC_IRQMASK) {
-		unsigned char	mask;
-
-		if (mrst->enabled_wake) {
-			disable_irq_wake(mrst->irq);
-			mrst->enabled_wake = 0;
-		}
-
-		spin_lock_irq(&rtc_lock);
-		do {
-			vrtc_cmos_write(tmp, RTC_CONTROL);
-
-			mask = vrtc_cmos_read(RTC_INTR_FLAGS);
-			mask &= (tmp & RTC_IRQMASK) | RTC_IRQF;
-			if (!is_intr(mask))
-				break;
-
-			rtc_update_irq(mrst->rtc, 1, mask);
-			tmp &= ~RTC_AIE;
-		} while (mask & RTC_AIE);
-		spin_unlock_irq(&rtc_lock);
-	}
-
-	dev_dbg(&mrst_rtc.rtc->dev, "resume, ctrl %02x\n", tmp);
-
-	return 0;
-}
-
-static SIMPLE_DEV_PM_OPS(mrst_pm_ops, mrst_suspend, mrst_resume);
-#define MRST_PM_OPS (&mrst_pm_ops)
-
-#else
-#define MRST_PM_OPS NULL
-
-static inline int mrst_poweroff(struct device *dev)
-{
-	return -ENOSYS;
-}
-
-#endif
-
-static int vrtc_mrst_platform_probe(struct platform_device *pdev)
-{
-	return vrtc_mrst_do_probe(&pdev->dev,
-			platform_get_resource(pdev, IORESOURCE_MEM, 0),
-			platform_get_irq(pdev, 0));
-}
-
-static int vrtc_mrst_platform_remove(struct platform_device *pdev)
-{
-	rtc_mrst_do_remove(&pdev->dev);
-	return 0;
-}
-
-static void vrtc_mrst_platform_shutdown(struct platform_device *pdev)
-{
-	if (system_state == SYSTEM_POWER_OFF && !mrst_poweroff(&pdev->dev))
-		return;
-
-	rtc_mrst_do_shutdown();
-}
-
-MODULE_ALIAS("platform:vrtc_mrst");
-
-static struct platform_driver vrtc_mrst_platform_driver = {
-	.probe		= vrtc_mrst_platform_probe,
-	.remove		= vrtc_mrst_platform_remove,
-	.shutdown	= vrtc_mrst_platform_shutdown,
-	.driver = {
-		.name	= driver_name,
-		.pm	= MRST_PM_OPS,
-	}
-};
-
-module_platform_driver(vrtc_mrst_platform_driver);
-
-MODULE_AUTHOR("Jacob Pan; Feng Tang");
-MODULE_DESCRIPTION("Driver for Moorestown virtual RTC");
-MODULE_LICENSE("GPL");
-- 
2.29.2

