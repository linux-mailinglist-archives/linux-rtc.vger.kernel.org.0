Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59F993F1E9A
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Aug 2021 19:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhHSRDr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Aug 2021 13:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbhHSRDq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Aug 2021 13:03:46 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846D5C061760;
        Thu, 19 Aug 2021 10:03:09 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id k8so10135747wrn.3;
        Thu, 19 Aug 2021 10:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iCwyI7WWuw6QrT1DGxcTellGqIlkMfCH+4D7xxK5lSU=;
        b=Nrjw6kV0HcDX7OoNJBz/wwzAZAR+qsaHeaC5uKOZecVuDCd9kelJyO12o8EtU6pqEc
         l2uoQ2LXEOsnQAI7ps6rmF8f8IWZK2x7tUmeYxVKMi0bIYrAso0iB4c9Um8CBmEZbY6q
         rcJr2lVXu6CmNdztKvYmKzJo0Qc3oagDOCBTNOnd8Dx/cFSQzeMcnqlu/FdKepRDX9hW
         6mH5kHZgve3qtY3uvIuKT+KV58gyFeTtUKeCoOBvY+iRgHVEkEKPvgY5A+Ag+Wjj13QR
         WHYVJlgB1AX0pYpu8JGshY7fp9riE0JKXZSVagBwpLQyEQVUzsboBX0HiqR2KvRsN7/x
         KDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iCwyI7WWuw6QrT1DGxcTellGqIlkMfCH+4D7xxK5lSU=;
        b=FhGU6Qo4hqwchUYHpF4LtdHFD9mI31TXytqS8BNq+MS/G+wCTn5eOcp5iO2QPcmf8H
         Jvv8APfKjOaV5BnHAy7qYETDPUGvCXVQfd+1kpe+SRWAEZE4YJtfeHATeWiXSOG+Pt26
         QnenneUSuxllA/c4hMolD+DfVlGGTnSYDMmFLihcFCEED6jNpGbbZ/0QWBBpCHGZQ9jz
         dSi54SIHm/jGCiAsatP6ron8K02TRGA/6r7Cyt7tA+wvLTiIC+pkXcDEEeCXFHsCv1lX
         czvvsgs+HoYEXBtIa+v8O+xq207/OydUAHtkemt/Xn8TuhebVEUts7F+VXlyEcoWF79e
         HqTg==
X-Gm-Message-State: AOAM533XrZAr5Z8nr5f1v06B/iRIhatO3dW2jownBdEERdno+UhBkFBy
        xgm4e45spwWec0XuimYrTVU=
X-Google-Smtp-Source: ABdhPJyQsykao1vPwIDrC1cQZ2plXDgEkVo2JPFY1qQ9DWbHnP5dfQgylf014aWW+EeYwN7Gwtg8aA==
X-Received: by 2002:adf:a1ca:: with SMTP id v10mr4989666wrv.177.1629392588077;
        Thu, 19 Aug 2021 10:03:08 -0700 (PDT)
Received: from debby ([2a01:cb19:13:7900:ae2b:c45b:3c7c:7e51])
        by smtp.gmail.com with ESMTPSA id d8sm3368382wrx.12.2021.08.19.10.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 10:03:07 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/3] rtc: Add support for the MSTAR MSC313 RTC
Date:   Thu, 19 Aug 2021 19:03:00 +0200
Message-Id: <20210819170301.10520-3-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819170301.10520-1-romain.perier@gmail.com>
References: <20210819170301.10520-1-romain.perier@gmail.com>
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
 drivers/rtc/rtc-msc313.c | 258 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 270 insertions(+)
 create mode 100644 drivers/rtc/rtc-msc313.c

diff --git a/MAINTAINERS b/MAINTAINERS
index fd25e4ecf0b9..ebacdd5e8878 100644
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
index 12153d5801ce..9ce4baab5fcf 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1925,4 +1925,14 @@ config RTC_DRV_WILCO_EC
 	  This can also be built as a module. If so, the module will
 	  be named "rtc_wilco_ec".
 
+config RTC_DRV_MSC313
+	tristate "MStar MSC313 RTC"
+        depends on ARCH_MSTARV7 || COMPILE_TEST
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
index 000000000000..8cf5d5fb298f
--- /dev/null
+++ b/drivers/rtc/rtc-msc313.c
@@ -0,0 +1,258 @@
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
+#define REG_RTC_STATUS_INT	0x1C
+#define REG_RTC_CNT_VAL_L	0x20
+#define REG_RTC_CNT_VAL_H	0x24
+
+/* Control bits for REG_RTC_CTRL */
+#define SOFT_RSTZ_BIT		BIT(0)
+#define CNT_EN_BIT		BIT(1)
+#define WRAP_EN_BIT		BIT(2)
+#define LOAD_EN_BIT		BIT(3)
+#define READ_EN_BIT		BIT(4)
+#define INT_MASK_BIT		BIT(5)
+#define INT_FORCE_BIT		BIT(6)
+#define INT_CLEAR_BIT		BIT(7)
+
+/* Control bits for REG_RTC_STATUS_INT */
+#define RAW_INT_BIT		BIT(0)
+#define ALM_INT_BIT		BIT(1)
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
+static bool msc313_rtc_get_enabled(struct msc313_rtc *priv)
+{
+	return readw(priv->rtc_base + REG_RTC_CTRL) & CNT_EN_BIT;
+}
+
+static void msc313_rtc_set_enabled(struct msc313_rtc *priv)
+{
+	u16 reg;
+
+	reg = readw(priv->rtc_base + REG_RTC_CTRL);
+	reg |= CNT_EN_BIT;
+	writew(reg, priv->rtc_base + REG_RTC_CTRL);
+}
+
+static int msc313_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct msc313_rtc *priv = dev_get_drvdata(dev);
+	u32 seconds;
+	u16 reg;
+
+	if (!msc313_rtc_get_enabled(priv))
+		return -EINVAL;
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
+	return 0;
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
+
+	/* Enable load for loading value into internal RTC counter */
+	reg = readw(priv->rtc_base + REG_RTC_CTRL);
+	writew(reg | LOAD_EN_BIT, priv->rtc_base + REG_RTC_CTRL);
+
+	/* Wait for HW latch done */
+	while (readw(priv->rtc_base + REG_RTC_CTRL) & LOAD_EN_BIT)
+		udelay(1);
+	msc313_rtc_set_enabled(priv);
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
+	reg = readw(priv->rtc_base + REG_RTC_STATUS_INT);
+	if (!(reg & ALM_INT_BIT))
+		return IRQ_NONE;
+
+	reg = readw(priv->rtc_base + REG_RTC_CTRL);
+	reg |= INT_CLEAR_BIT;
+	reg &= ~INT_FORCE_BIT;
+	writew(reg, priv->rtc_base + REG_RTC_CTRL);
+
+	rtc_update_irq(priv->rtc_dev, 1, RTC_IRQF | RTC_AF);
+
+	return IRQ_HANDLED;
+}
+
+static int msc313_rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct msc313_rtc *priv;
+	int ret;
+	int irq;
+	unsigned long rate;
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
+	priv->rtc_dev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(priv->rtc_dev))
+		return PTR_ERR(priv->rtc_dev);
+
+	priv->rtc_dev->ops = &msc313_rtc_ops;
+	priv->rtc_dev->range_max = U32_MAX;
+
+	ret = devm_request_irq(dev, irq, msc313_rtc_interrupt, IRQF_SHARED,
+			       dev_name(&pdev->dev), &pdev->dev);
+	if (ret) {
+		dev_err(dev, "Could not request IRQ\n");
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
+	ret = devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare, priv->clk);
+	if (ret)
+		return ret;
+
+	rate = clk_get_rate(priv->clk);
+	writew(rate & 0xFFFF, priv->rtc_base + REG_RTC_FREQ_CW_L);
+	writew((rate >> 16) & 0xFFFF, priv->rtc_base + REG_RTC_FREQ_CW_H);
+
+	platform_set_drvdata(pdev, priv);
+
+	return devm_rtc_register_device(priv->rtc_dev);
+}
+
+static const struct of_device_id msc313_rtc_of_match_table[] = {
+	{ .compatible = "mstar,msc313-rtc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ms_rtc_of_match_table);
+
+static struct platform_driver msc313_rtc_driver = {
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

