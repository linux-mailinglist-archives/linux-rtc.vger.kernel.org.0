Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E343D0023
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jul 2021 19:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbhGTQnH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Jul 2021 12:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbhGTQms (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 20 Jul 2021 12:42:48 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9188C0613E1;
        Tue, 20 Jul 2021 10:23:13 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id i94so26836971wri.4;
        Tue, 20 Jul 2021 10:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0IkyZqRreuwE9J9yjlIIZcVDBYbaXsmqTw79COm7KlE=;
        b=RRX+dOq5/Ur/pr1XT+p6ErrbgTpQg7OD7axgzFBOw38e4CWDmgqu6Q2iNKBg05HYvD
         UvLRgHoCEs8UtR8gTgP2xZZ7Bad2q5m1u3MgFk1GGeHJcw06x/JKX1W1wQcfdqWWuAxr
         T4HNSjBrWN9luEkFkD6dJ1d/zH5ZnLsS0GrqwaMUeSUUsxmzyrrg9ckP7lTSjiUMRQzc
         9ZYiGlJIUj+eEuLU+5npNR4xWdrqvqdHIbHVRzAhh/fNIvSr73q3/vE2jfMgVo00+Leg
         9bNN3s8bo+ABHntOYj3JAudQwEOhuG7/RJPRw/zGnqwPcVSmg/QRStHOaivOeZxWK7cT
         aVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0IkyZqRreuwE9J9yjlIIZcVDBYbaXsmqTw79COm7KlE=;
        b=VJq0XUNUb8zUSPwN7voPxMjoSA12iYJ8Nwnxf9k86oYdpO2PnaDBszq8J9RFcDS4PV
         hg59rEOHkoUjbnusC4HMtVwlBU3VTGOHe3dW1Gud1pdcxMP9H44VFDfaawvWUSdpuPc+
         UzJtMW04S8OJfSvMjwj4Kd7VQ2cea/M3e/2eTxEyse60+nyCfzqbUOU5A5KSjzGcQD4c
         AdMVYnq1CJXxCpC/PJHIRHV7Mds30RhFWwxV5Pb8a/UmCcNUWGfFqZNltgX0FwuQXJEn
         +U2rEKhjzfbkB+AV39/vOj65SvpO/EBsfAgO4IBDItkPSg7zZ/hwN7DMByHvanmqQvpj
         PLvQ==
X-Gm-Message-State: AOAM532Y9Oj+uvsy1Uj7zz4LjQ9pp2wylg+7q67bZUmMaF8X1TIu1K9m
        2J32OQmklBkWK1sNiFtu1rs=
X-Google-Smtp-Source: ABdhPJyNvW08DO9eHBqU7e87S6WJcaupk43dolDMfVRK8cPtc6KBrJ4m88EPUcJwRsnab84XdWteCw==
X-Received: by 2002:a5d:4a85:: with SMTP id o5mr36917148wrq.410.1626801792229;
        Tue, 20 Jul 2021 10:23:12 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id r67sm3025690wma.6.2021.07.20.10.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 10:23:11 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] rtc: Add support for the MSTAR MSC313 RTC
Date:   Tue, 20 Jul 2021 19:22:50 +0200
Message-Id: <20210720172251.4504-3-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210720172251.4504-1-romain.perier@gmail.com>
References: <20210720172251.4504-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Daniel Palmer <daniel@0x0f.com>

This adds support for the RTC block on the Mstar MSC313e SoCs and newer.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Co-developed-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 MAINTAINERS              |   1 +
 drivers/rtc/Kconfig      |  10 ++
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-msc313.c | 246 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 258 insertions(+)
 create mode 100644 drivers/rtc/rtc-msc313.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 6c8be735cc91..7e8d1a375e0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2220,6 +2220,7 @@ F:	arch/arm/boot/dts/mstar-*
 F:	arch/arm/mach-mstar/
 F:	drivers/clk/mstar/
 F:	drivers/gpio/gpio-msc313.c
+F:	drivers/rtc/rtc-msc313.c
 F:	drivers/watchdog/msc313e_wdt.c
 F:	include/dt-bindings/clock/mstar-*
 F:	include/dt-bindings/gpio/msc313-gpio.h
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 12153d5801ce..67870b422bc5 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1925,4 +1925,14 @@ config RTC_DRV_WILCO_EC
 	  This can also be built as a module. If so, the module will
 	  be named "rtc_wilco_ec".
 
+config RTC_DRV_MSC313
+	tristate "MStar MSC313 RTC"
+        depends on ARCH_MSTARV7
+	help
+	  If you say yes here you get support for the Mstar MSC313e On-Chip
+	  Real Time Clock.
+
+	  This driver can also be built as a module, if so, the module
+	  will be called "rtc-msc313".
+
 endif # RTC_CLASS
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 2dd0dd956b0e..5efda8a60cee 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_RTC_DRV_MCP795)	+= rtc-mcp795.o
 obj-$(CONFIG_RTC_DRV_MESON)	+= rtc-meson.o
 obj-$(CONFIG_RTC_DRV_MOXART)	+= rtc-moxart.o
 obj-$(CONFIG_RTC_DRV_MPC5121)	+= rtc-mpc5121.o
+obj-$(CONFIG_RTC_DRV_MSC313)	+= rtc-msc313.o
 obj-$(CONFIG_RTC_DRV_MSM6242)	+= rtc-msm6242.o
 obj-$(CONFIG_RTC_DRV_MT2712)	+= rtc-mt2712.o
 obj-$(CONFIG_RTC_DRV_MT6397)	+= rtc-mt6397.o
diff --git a/drivers/rtc/rtc-msc313.c b/drivers/rtc/rtc-msc313.c
new file mode 100644
index 000000000000..b1102e3c93ba
--- /dev/null
+++ b/drivers/rtc/rtc-msc313.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Real time clocks driver for MStar/SigmaStar ARMv7 SoCs.
+ * Based on "Real Time Clock driver for msb252x." that was contained
+ * in various MStar kernels.
+ *
+ * (C) 2019 Daniel Palmer
+ * (C) 2021 Romain Perier
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+
+/* Registers */
+#define REG_RTC_CTRL		0x00
+#define REG_RTC_FREQ_CW_L	0x04
+#define REG_RTC_FREQ_CW_H	0x08
+#define REG_RTC_LOAD_VAL_L	0x0C
+#define REG_RTC_LOAD_VAL_H	0x10
+#define REG_RTC_MATCH_VAL_L	0x14
+#define REG_RTC_MATCH_VAL_H	0x18
+#define REG_RTC_CNT_VAL_L	0x20
+#define REG_RTC_CNT_VAL_H	0x24
+
+#define SOFT_RSTZ_BIT		BIT(0)
+#define CNT_EN_BIT		BIT(1)
+#define WRAP_EN_BIT		BIT(2)
+#define LOAD_EN_BIT		BIT(3)
+#define READ_EN_BIT		BIT(4)
+#define INT_MASK_BIT		BIT(5)
+#define INT_FORCE_BIT		BIT(6)
+#define INT_CLEAR_BIT		BIT(7)
+
+struct msc313_rtc {
+	struct rtc_device *rtc_dev;
+	void __iomem *rtc_base;
+	struct clk *clk;
+};
+
+static int msc313_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct msc313_rtc *priv = dev_get_drvdata(dev);
+	unsigned long seconds;
+
+	seconds = readw(priv->rtc_base + REG_RTC_MATCH_VAL_L)
+			| (readw(priv->rtc_base + REG_RTC_MATCH_VAL_H) << 16);
+
+	rtc_time64_to_tm(seconds, &alarm->time);
+
+	if (!(readw(priv->rtc_base + REG_RTC_CTRL) & INT_MASK_BIT))
+		alarm->enabled = 1;
+
+	return 0;
+}
+
+static int msc313_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct msc313_rtc *priv = dev_get_drvdata(dev);
+	u16 reg;
+
+	reg = readw(priv->rtc_base + REG_RTC_CTRL);
+	if (enabled)
+		reg &= ~INT_MASK_BIT;
+	else
+		reg |= INT_MASK_BIT;
+	writew(reg, priv->rtc_base + REG_RTC_CTRL);
+	return 0;
+}
+
+static int msc313_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct msc313_rtc *priv = dev_get_drvdata(dev);
+	unsigned long seconds;
+
+	seconds = rtc_tm_to_time64(&alarm->time);
+	writew((seconds & 0xFFFF), priv->rtc_base + REG_RTC_MATCH_VAL_L);
+	writew((seconds >> 16) & 0xFFFF, priv->rtc_base + REG_RTC_MATCH_VAL_H);
+
+	msc313_rtc_alarm_irq_enable(dev, alarm->enabled);
+
+	return 0;
+}
+
+static int msc313_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct msc313_rtc *priv = dev_get_drvdata(dev);
+	u32 seconds;
+	u16 reg;
+
+	reg = readw(priv->rtc_base + REG_RTC_CTRL);
+	writew(reg | READ_EN_BIT, priv->rtc_base + REG_RTC_CTRL);
+
+	/* Wait for HW latch done */
+	while (readw(priv->rtc_base + REG_RTC_CTRL) & READ_EN_BIT)
+		udelay(1);
+
+	seconds = readw(priv->rtc_base + REG_RTC_CNT_VAL_L)
+			| (readw(priv->rtc_base + REG_RTC_CNT_VAL_H) << 16);
+
+	rtc_time64_to_tm(seconds, tm);
+
+	return rtc_valid_tm(tm);
+}
+
+static int msc313_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct msc313_rtc *priv = dev_get_drvdata(dev);
+	unsigned long seconds;
+	u16 reg;
+
+	seconds = rtc_tm_to_time64(tm);
+	writew(seconds & 0xFFFF, priv->rtc_base + REG_RTC_LOAD_VAL_L);
+	writew((seconds >> 16) & 0xFFFF, priv->rtc_base + REG_RTC_LOAD_VAL_H);
+	reg = readw(priv->rtc_base + REG_RTC_CTRL);
+	writew(reg | LOAD_EN_BIT, priv->rtc_base + REG_RTC_CTRL);
+
+	/* need to check carefully if we want to clear REG_RTC_LOAD_VAL_H for customer*/
+	while (readw(priv->rtc_base + REG_RTC_CTRL) & LOAD_EN_BIT)
+		udelay(1);
+	writew(0, priv->rtc_base + REG_RTC_LOAD_VAL_H);
+
+	return 0;
+}
+
+static const struct rtc_class_ops msc313_rtc_ops = {
+	.read_time = msc313_rtc_read_time,
+	.set_time = msc313_rtc_set_time,
+	.read_alarm = msc313_rtc_read_alarm,
+	.set_alarm = msc313_rtc_set_alarm,
+	.alarm_irq_enable = msc313_rtc_alarm_irq_enable,
+};
+
+static irqreturn_t msc313_rtc_interrupt(s32 irq, void *dev_id)
+{
+	struct msc313_rtc *priv = dev_get_drvdata(dev_id);
+	u16 reg;
+
+	reg = readw_relaxed(priv->rtc_base + REG_RTC_CTRL);
+	reg |= INT_CLEAR_BIT;
+	reg &= ~INT_FORCE_BIT;
+	writew_relaxed(reg, priv->rtc_base + REG_RTC_CTRL);
+
+	rtc_update_irq(priv->rtc_dev, 1, RTC_IRQF | RTC_AF);
+
+	return IRQ_HANDLED;
+}
+
+static int msc313_rtc_remove(struct platform_device *pdev)
+{
+	struct msc313_rtc *priv = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(priv->clk);
+
+	return 0;
+}
+
+static int msc313_rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct msc313_rtc *priv;
+	int ret;
+	int irq;
+	unsigned long rate;
+	u16 reg;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(struct msc313_rtc), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->rtc_base))
+		return PTR_ERR(priv->rtc_base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return -EINVAL;
+
+	ret = devm_request_irq(dev, irq, msc313_rtc_interrupt, IRQF_SHARED,
+			       dev_name(&pdev->dev), &pdev->dev);
+	if (ret) {
+		dev_err(dev, "Unable to request irq\n");
+		return ret;
+	}
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "No input reference clock\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	ret = clk_prepare_enable(priv->clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable the reference clock, %d\n", ret);
+		return ret;
+	}
+
+	rate = clk_get_rate(priv->clk);
+
+	reg = readw(priv->rtc_base + REG_RTC_CTRL);
+	if (!(reg & SOFT_RSTZ_BIT)) {
+		reg |= SOFT_RSTZ_BIT;
+		writew(reg, priv->rtc_base + REG_RTC_CTRL);
+	}
+
+	writew(rate & 0xFFFF, priv->rtc_base + REG_RTC_FREQ_CW_L);
+	writew((rate >> 16) & 0xFFFF, priv->rtc_base + REG_RTC_FREQ_CW_H);
+
+	reg |= CNT_EN_BIT;
+	writew(reg, priv->rtc_base + REG_RTC_CTRL);
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->rtc_dev = devm_rtc_device_register(dev, dev_name(dev), &msc313_rtc_ops, THIS_MODULE);
+	if (IS_ERR(priv->rtc_dev)) {
+		dev_err(dev, "Failed to register rtc device\n");
+		return PTR_ERR(priv->rtc_dev);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id msc313_rtc_of_match_table[] = {
+	{ .compatible = "mstar,msc313-rtc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ms_rtc_of_match_table);
+
+static struct platform_driver msc313_rtc_driver = {
+	.remove = msc313_rtc_remove,
+	.probe = msc313_rtc_probe,
+	.driver = {
+		.name = "msc313-rtc",
+		.of_match_table = msc313_rtc_of_match_table,
+	},
+};
+
+module_platform_driver(msc313_rtc_driver);
+
+MODULE_AUTHOR("Daniel Palmer <daniel@thingy.jp>");
+MODULE_AUTHOR("Romain Perier <romain.perier@gmail.com>");
+MODULE_DESCRIPTION("MStar RTC Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.30.2

