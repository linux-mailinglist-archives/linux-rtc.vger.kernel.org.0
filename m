Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 964BD3961B
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Jun 2019 21:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730833AbfFGTnq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 7 Jun 2019 15:43:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:52880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729731AbfFGTnp (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 7 Jun 2019 15:43:45 -0400
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net [71.197.186.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B8D9208E3;
        Fri,  7 Jun 2019 19:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559936624;
        bh=GJ+QUPOmqyMWmUxURQkzA0pp+rSOKSz2pl7nJLh+RMU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SKbOO26sT5XEOapBMw/AuZoThvOSfFkw4w9M+A34WaTRQf2fVb96J4g2vDEXOAzak
         InAy+7qukY1NEhd03LB2wkKeFPQ5jcQYSZPjZQ17s6z0vjd+mmY8vkthUwH6LwXzos
         cmRifOzaftSYPLrS42G4d5K+vNt5ZDLsGZJD9V8g=
From:   Kevin Hilman <khilman@kernel.org>
To:     linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/2] rtc: Add Amlogic Virtual Wake RTC
Date:   Fri,  7 Jun 2019 12:43:43 -0700
Message-Id: <20190607194343.18359-2-khilman@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607194343.18359-1-khilman@kernel.org>
References: <20190607194343.18359-1-khilman@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Neil Armstrong <narmstrong@baylibre.com>

The 64-bit Amlogic SoCs uses a special register to store the time in
seconds to wakeup after a system suspend.

In order to be able to reuse the RTC wakealarm feature, this
driver implements a fake RTC device which uses the system time
to deduce a suspend delay.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
[khilman: rebase to v5.2-rc, moved from do_gettimeofday()]
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Originally written/sumbmitted by Neil as part of a broader/suspend
resume series[1] for the GXBB family.  Newer SoCs support PSCI
properly, so don't need the PSCI changes there, and this driver alone
enables RTC wakeups from suspend.

[1] https://lore.kernel.org/lkml/1478183365-23708-1-git-send-email-narmstrong@baylibre.com/

 drivers/rtc/Kconfig          |  11 +++
 drivers/rtc/Makefile         |   1 +
 drivers/rtc/rtc-meson-vrtc.c | 149 +++++++++++++++++++++++++++++++++++
 3 files changed, 161 insertions(+)
 create mode 100644 drivers/rtc/rtc-meson-vrtc.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 5c0790eed656..78d2967d5ee3 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -373,6 +373,17 @@ config RTC_DRV_MAX77686
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-max77686.
 
+config RTC_DRV_MESON_VRTC
+	tristate "Amlogic Meson Virtual RTC"
+	depends on ARCH_MESON || COMPILE_TEST
+	default m if ARCH_MESON
+	help
+	  If you say yes here you will get support for the
+	  Virtual RTC of Amlogic SoCs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-meson-vrtc.
+
 config RTC_DRV_RK808
 	tristate "Rockchip RK805/RK808/RK818 RTC"
 	depends on MFD_RK808
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 9d997faa2c26..9485fb46b023 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_RTC_DRV_MAX8907)	+= rtc-max8907.o
 obj-$(CONFIG_RTC_DRV_MAX8925)	+= rtc-max8925.o
 obj-$(CONFIG_RTC_DRV_MAX8997)	+= rtc-max8997.o
 obj-$(CONFIG_RTC_DRV_MAX8998)	+= rtc-max8998.o
+obj-$(CONFIG_RTC_DRV_MESON_VRTC)+= rtc-meson-vrtc.o
 obj-$(CONFIG_RTC_DRV_MC13XXX)	+= rtc-mc13xxx.o
 obj-$(CONFIG_RTC_DRV_MCP795)	+= rtc-mcp795.o
 obj-$(CONFIG_RTC_DRV_MESON)	+= rtc-meson.o
diff --git a/drivers/rtc/rtc-meson-vrtc.c b/drivers/rtc/rtc-meson-vrtc.c
new file mode 100644
index 000000000000..f695f65ab199
--- /dev/null
+++ b/drivers/rtc/rtc-meson-vrtc.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
+ */
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/time64.h>
+
+struct meson_vrtc_data {
+	struct platform_device *pdev;
+	void __iomem *io_alarm;
+	struct rtc_device *rtc;
+	unsigned long alarm_time;
+};
+
+static int meson_vrtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	unsigned long local_time;
+	struct timespec64 time;
+
+	ktime_get_raw_ts64(&time);
+	local_time = time.tv_sec - (sys_tz.tz_minuteswest * 60);
+	rtc_time_to_tm(local_time, tm);
+
+	return 0;
+}
+
+static void meson_vrtc_set_wakeup_time(struct meson_vrtc_data *vrtc,
+				       unsigned long time)
+{
+	writel_relaxed(time, vrtc->io_alarm);
+
+	dev_dbg(&vrtc->pdev->dev, "set_wakeup_time: %lu\n", time);
+}
+
+static int meson_vrtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct meson_vrtc_data *vrtc = dev_get_drvdata(dev);
+	struct timespec64 time;
+	unsigned long local_time;
+	unsigned long alarm_secs;
+	int ret;
+
+	if (alarm->enabled) {
+		ret = rtc_tm_to_time(&alarm->time, &alarm_secs);
+		if (ret)
+			return ret;
+
+		ktime_get_raw_ts64(&time);
+		local_time = time.tv_sec - (sys_tz.tz_minuteswest * 60);
+
+		vrtc->alarm_time = alarm_secs;
+
+		if (alarm_secs >= local_time) {
+			alarm_secs = alarm_secs - local_time;
+
+			meson_vrtc_set_wakeup_time(vrtc, alarm_secs);
+
+			pr_debug("system will wakeup %lus later\n", alarm_secs);
+		}
+	} else {
+		vrtc->alarm_time = 0;
+		meson_vrtc_set_wakeup_time(vrtc, 0);
+	}
+
+	return 0;
+}
+
+static int meson_vrtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
+{
+	struct meson_vrtc_data *vrtc = dev_get_drvdata(dev);
+
+	if (!vrtc->alarm_time) {
+		alm->enabled = true;
+
+		rtc_time_to_tm(vrtc->alarm_time, &alm->time);
+	}
+
+	return 0;
+}
+
+static const struct rtc_class_ops meson_vrtc_ops = {
+	.read_time = meson_vrtc_read_time,
+	.set_alarm = meson_vrtc_set_alarm,
+	.read_alarm = meson_vrtc_read_alarm,
+};
+
+static int meson_vrtc_probe(struct platform_device *pdev)
+{
+	struct meson_vrtc_data *vrtc;
+	struct resource *res;
+
+	vrtc = devm_kzalloc(&pdev->dev, sizeof(*vrtc), GFP_KERNEL);
+	if (!vrtc)
+		return -ENOMEM;
+
+	vrtc->pdev = pdev;
+
+	/* Alarm registers */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	vrtc->io_alarm = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(vrtc->io_alarm))
+		return PTR_ERR(vrtc->io_alarm);
+
+	device_init_wakeup(&pdev->dev, 1);
+
+	platform_set_drvdata(pdev, vrtc);
+
+	vrtc->rtc = devm_rtc_device_register(&pdev->dev, "meson-vrtc",
+					     &meson_vrtc_ops, THIS_MODULE);
+	if (IS_ERR(vrtc->rtc))
+		return PTR_ERR(vrtc->rtc);
+
+	return 0;
+}
+
+int meson_vrtc_resume(struct platform_device *pdev)
+{
+	struct meson_vrtc_data *vrtc = platform_get_drvdata(pdev);
+
+	meson_vrtc_set_wakeup_time(vrtc, 0);
+
+	return 0;
+}
+
+static const struct of_device_id meson_vrtc_dt_match[] = {
+	{ .compatible = "amlogic,meson-vrtc"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, meson_vrtc_dt_match);
+
+struct platform_driver meson_vrtc_driver = {
+	.driver = {
+		.name = "meson-vrtc",
+		.of_match_table = meson_vrtc_dt_match,
+	},
+	.probe = meson_vrtc_probe,
+	.resume = meson_vrtc_resume,
+};
+
+module_platform_driver(meson_vrtc_driver);
+
+MODULE_DESCRIPTION("Amlogic Virtual Wakeup RTC Timer driver");
+MODULE_LICENSE("GPL");
-- 
2.21.0

