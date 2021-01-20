Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E162FD46B
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Jan 2021 16:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729111AbhATPpE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 20 Jan 2021 10:45:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:57718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733093AbhATPmw (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 20 Jan 2021 10:42:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5106B23381;
        Wed, 20 Jan 2021 15:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611157331;
        bh=9S8vgYWiSKG9ifXODcOOQ3l8wTWBhuN2g84JbrEqlp8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MIFtIN5s2WyZ26ER2qx0zrFYKjyqz3CAi1LBTwe1Tb0Yapeai7Ng4tWCMZQ7qGmBl
         h+u9wYNQckmZWoUEa0sTHdZvbRFhobNMVN2nP99qxYnApGqHsXgxIiYbZPmh+vgLEY
         KDSNs2JdorgvVaVG+UIp/SjsoJ2Eg+G5vjJCIiYDLVWzw8XHmcYrMh6NJHXfXD43mW
         Qrrf+eUuDS7mFM0qig1nbjpYJTjXnBmhXS/s7BuM3gCbkh9kENZAVgZumPNMxkfC1k
         XBSlW2So+41fGvHEmOq2ZI7O0X35XtB7/gWnFFvCAXIBLleZHY6AzEEX5wW0ccEL53
         HLrRmsggg742g==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3] rtc: remove ste ab3100 driver
Date:   Wed, 20 Jan 2021 16:41:58 +0100
Message-Id: <20210120154158.1860736-4-arnd@kernel.org>
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
 drivers/rtc/Kconfig      |   8 --
 drivers/rtc/Makefile     |   1 -
 drivers/rtc/rtc-ab3100.c | 254 ---------------------------------------
 3 files changed, 263 deletions(-)
 delete mode 100644 drivers/rtc/rtc-ab3100.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index ff583d6a2870..a608a8ef78fd 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1270,14 +1270,6 @@ config RTC_DRV_PCF50633
 	  If you say yes here you get support for the RTC subsystem of the
 	  NXP PCF50633 used in embedded systems.
 
-config RTC_DRV_AB3100
-	tristate "ST-Ericsson AB3100 RTC"
-	depends on AB3100_CORE
-	default y if AB3100_CORE
-	help
-	  Select this to enable the ST-Ericsson AB3100 Mixed Signal IC RTC
-	  support. This chip contains a battery- and capacitor-backed RTC.
-
 config RTC_DRV_AB8500
 	tristate "ST-Ericsson AB8500 RTC"
 	depends on AB8500_CORE
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 8585cd159979..55f8a2a5b89d 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -19,7 +19,6 @@ rtc-core-$(CONFIG_RTC_INTF_SYSFS)	+= sysfs.o
 
 obj-$(CONFIG_RTC_DRV_88PM80X)	+= rtc-88pm80x.o
 obj-$(CONFIG_RTC_DRV_88PM860X)	+= rtc-88pm860x.o
-obj-$(CONFIG_RTC_DRV_AB3100)	+= rtc-ab3100.o
 obj-$(CONFIG_RTC_DRV_AB8500)	+= rtc-ab8500.o
 obj-$(CONFIG_RTC_DRV_ABB5ZES3)	+= rtc-ab-b5ze-s3.o
 obj-$(CONFIG_RTC_DRV_ABEOZ9)	+= rtc-ab-eoz9.o
diff --git a/drivers/rtc/rtc-ab3100.c b/drivers/rtc/rtc-ab3100.c
deleted file mode 100644
index e4fd961e8bf6..000000000000
--- a/drivers/rtc/rtc-ab3100.c
+++ /dev/null
@@ -1,254 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2007-2009 ST-Ericsson AB
- * RTC clock driver for the AB3100 Analog Baseband Chip
- * Author: Linus Walleij <linus.walleij@stericsson.com>
- */
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/rtc.h>
-#include <linux/mfd/abx500.h>
-
-/* Clock rate in Hz */
-#define AB3100_RTC_CLOCK_RATE	32768
-
-/*
- * The AB3100 RTC registers. These are the same for
- * AB3000 and AB3100.
- * Control register:
- * Bit 0: RTC Monitor cleared=0, active=1, if you set it
- *        to 1 it remains active until RTC power is lost.
- * Bit 1: 32 kHz Oscillator, 0 = on, 1 = bypass
- * Bit 2: Alarm on, 0 = off, 1 = on
- * Bit 3: 32 kHz buffer disabling, 0 = enabled, 1 = disabled
- */
-#define AB3100_RTC		0x53
-/* default setting, buffer disabled, alarm on */
-#define RTC_SETTING		0x30
-/* Alarm when AL0-AL3 == TI0-TI3  */
-#define AB3100_AL0		0x56
-#define AB3100_AL1		0x57
-#define AB3100_AL2		0x58
-#define AB3100_AL3		0x59
-/* This 48-bit register that counts up at 32768 Hz */
-#define AB3100_TI0		0x5a
-#define AB3100_TI1		0x5b
-#define AB3100_TI2		0x5c
-#define AB3100_TI3		0x5d
-#define AB3100_TI4		0x5e
-#define AB3100_TI5		0x5f
-
-/*
- * RTC clock functions and device struct declaration
- */
-static int ab3100_rtc_set_time(struct device *dev, struct rtc_time *tm)
-{
-	u8 regs[] = {AB3100_TI0, AB3100_TI1, AB3100_TI2,
-		     AB3100_TI3, AB3100_TI4, AB3100_TI5};
-	unsigned char buf[6];
-	u64 hw_counter = rtc_tm_to_time64(tm) * AB3100_RTC_CLOCK_RATE * 2;
-	int err = 0;
-	int i;
-
-	buf[0] = (hw_counter) & 0xFF;
-	buf[1] = (hw_counter >> 8) & 0xFF;
-	buf[2] = (hw_counter >> 16) & 0xFF;
-	buf[3] = (hw_counter >> 24) & 0xFF;
-	buf[4] = (hw_counter >> 32) & 0xFF;
-	buf[5] = (hw_counter >> 40) & 0xFF;
-
-	for (i = 0; i < 6; i++) {
-		err = abx500_set_register_interruptible(dev, 0,
-							regs[i], buf[i]);
-		if (err)
-			return err;
-	}
-
-	/* Set the flag to mark that the clock is now set */
-	return abx500_mask_and_set_register_interruptible(dev, 0,
-							  AB3100_RTC,
-							  0x01, 0x01);
-
-}
-
-static int ab3100_rtc_read_time(struct device *dev, struct rtc_time *tm)
-{
-	time64_t time;
-	u8 rtcval;
-	int err;
-
-	err = abx500_get_register_interruptible(dev, 0,
-						AB3100_RTC, &rtcval);
-	if (err)
-		return err;
-
-	if (!(rtcval & 0x01)) {
-		dev_info(dev, "clock not set (lost power)");
-		return -EINVAL;
-	} else {
-		u64 hw_counter;
-		u8 buf[6];
-
-		/* Read out time registers */
-		err = abx500_get_register_page_interruptible(dev, 0,
-							     AB3100_TI0,
-							     buf, 6);
-		if (err != 0)
-			return err;
-
-		hw_counter = ((u64) buf[5] << 40) | ((u64) buf[4] << 32) |
-			((u64) buf[3] << 24) | ((u64) buf[2] << 16) |
-			((u64) buf[1] << 8) | (u64) buf[0];
-		time = hw_counter / (u64) (AB3100_RTC_CLOCK_RATE * 2);
-	}
-
-	rtc_time64_to_tm(time, tm);
-
-	return 0;
-}
-
-static int ab3100_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
-{
-	time64_t time;
-	u64 hw_counter;
-	u8 buf[6];
-	u8 rtcval;
-	int err;
-
-	/* Figure out if alarm is enabled or not */
-	err = abx500_get_register_interruptible(dev, 0,
-						AB3100_RTC, &rtcval);
-	if (err)
-		return err;
-	if (rtcval & 0x04)
-		alarm->enabled = 1;
-	else
-		alarm->enabled = 0;
-	/* No idea how this could be represented */
-	alarm->pending = 0;
-	/* Read out alarm registers, only 4 bytes */
-	err = abx500_get_register_page_interruptible(dev, 0,
-						     AB3100_AL0, buf, 4);
-	if (err)
-		return err;
-	hw_counter = ((u64) buf[3] << 40) | ((u64) buf[2] << 32) |
-		((u64) buf[1] << 24) | ((u64) buf[0] << 16);
-	time = hw_counter / (u64) (AB3100_RTC_CLOCK_RATE * 2);
-
-	rtc_time64_to_tm(time, &alarm->time);
-
-	return rtc_valid_tm(&alarm->time);
-}
-
-static int ab3100_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
-{
-	u8 regs[] = {AB3100_AL0, AB3100_AL1, AB3100_AL2, AB3100_AL3};
-	unsigned char buf[4];
-	time64_t secs;
-	u64 hw_counter;
-	int err;
-	int i;
-
-	secs = rtc_tm_to_time64(&alarm->time);
-	hw_counter = secs * AB3100_RTC_CLOCK_RATE * 2;
-	buf[0] = (hw_counter >> 16) & 0xFF;
-	buf[1] = (hw_counter >> 24) & 0xFF;
-	buf[2] = (hw_counter >> 32) & 0xFF;
-	buf[3] = (hw_counter >> 40) & 0xFF;
-
-	/* Set the alarm */
-	for (i = 0; i < 4; i++) {
-		err = abx500_set_register_interruptible(dev, 0,
-							regs[i], buf[i]);
-		if (err)
-			return err;
-	}
-	/* Then enable the alarm */
-	return abx500_mask_and_set_register_interruptible(dev, 0,
-							  AB3100_RTC, (1 << 2),
-							  alarm->enabled << 2);
-}
-
-static int ab3100_rtc_irq_enable(struct device *dev, unsigned int enabled)
-{
-	/*
-	 * It's not possible to enable/disable the alarm IRQ for this RTC.
-	 * It does not actually trigger any IRQ: instead its only function is
-	 * to power up the system, if it wasn't on. This will manifest as
-	 * a "power up cause" in the AB3100 power driver (battery charging etc)
-	 * and need to be handled there instead.
-	 */
-	if (enabled)
-		return abx500_mask_and_set_register_interruptible(dev, 0,
-						    AB3100_RTC, (1 << 2),
-						    1 << 2);
-	else
-		return abx500_mask_and_set_register_interruptible(dev, 0,
-						    AB3100_RTC, (1 << 2),
-						    0);
-}
-
-static const struct rtc_class_ops ab3100_rtc_ops = {
-	.read_time	= ab3100_rtc_read_time,
-	.set_time	= ab3100_rtc_set_time,
-	.read_alarm	= ab3100_rtc_read_alarm,
-	.set_alarm	= ab3100_rtc_set_alarm,
-	.alarm_irq_enable = ab3100_rtc_irq_enable,
-};
-
-static int __init ab3100_rtc_probe(struct platform_device *pdev)
-{
-	int err;
-	u8 regval;
-	struct rtc_device *rtc;
-
-	/* The first RTC register needs special treatment */
-	err = abx500_get_register_interruptible(&pdev->dev, 0,
-						AB3100_RTC, &regval);
-	if (err) {
-		dev_err(&pdev->dev, "unable to read RTC register\n");
-		return -ENODEV;
-	}
-
-	if ((regval & 0xFE) != RTC_SETTING) {
-		dev_warn(&pdev->dev, "not default value in RTC reg 0x%x\n",
-			 regval);
-	}
-
-	if ((regval & 1) == 0) {
-		/*
-		 * Set bit to detect power loss.
-		 * This bit remains until RTC power is lost.
-		 */
-		regval = 1 | RTC_SETTING;
-		err = abx500_set_register_interruptible(&pdev->dev, 0,
-							AB3100_RTC, regval);
-		/* Ignore any error on this write */
-	}
-
-	rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(rtc))
-		return PTR_ERR(rtc);
-
-	rtc->ops = &ab3100_rtc_ops;
-	/* 48bit counter at (AB3100_RTC_CLOCK_RATE * 2) */
-	rtc->range_max = U32_MAX;
-
-	platform_set_drvdata(pdev, rtc);
-
-	return devm_rtc_register_device(rtc);
-}
-
-static struct platform_driver ab3100_rtc_driver = {
-	.driver = {
-		.name = "ab3100-rtc",
-	},
-};
-
-module_platform_driver_probe(ab3100_rtc_driver, ab3100_rtc_probe);
-
-MODULE_AUTHOR("Linus Walleij <linus.walleij@stericsson.com>");
-MODULE_DESCRIPTION("AB3100 RTC Driver");
-MODULE_LICENSE("GPL");
-- 
2.29.2

