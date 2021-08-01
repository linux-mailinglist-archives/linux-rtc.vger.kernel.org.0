Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C90853DCC9D
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Aug 2021 18:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhHAQJ6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 1 Aug 2021 12:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231645AbhHAQJu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 1 Aug 2021 12:09:50 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A493FC0613D3;
        Sun,  1 Aug 2021 09:09:42 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id c16so18392442wrp.13;
        Sun, 01 Aug 2021 09:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qE0LMOZZ291lskFavoeOKKY3j060l4s309rf2WDUJVE=;
        b=i5agS1/WsLaleNK45u/uSF+hCuZbN+LXq90aZFRoNysUDEvx0Qk1Uhhjx+36yq0CR8
         kwieRiJ75Zk2fG0mCm1k0i+u1rxLrNj+NqHqmTVxHWSUIwpUBwDfIJJDVyQWWfTvs2Zw
         onIp2WSza618Y4httI5xNALD5IJjVrmujRT5e+zY5wc2LCCgDRfgVWP6JhVpvoJ6nXhg
         vBJ5pQLPCs4g3d7VkO7dD8hvSL2ILz5khFklAEByXrbwPOj2va/m7pFwbhqgxUCq4/lt
         yvGM/+h/Hyhbi86BWJ0vjcdc4WMXI7gM78Yfsh2Ec0EkXiCtTiBhq3f/fCobHkBjVJMF
         296A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qE0LMOZZ291lskFavoeOKKY3j060l4s309rf2WDUJVE=;
        b=epBqk00DL4BtxSCGBUPHPSnV31fVcW9wM/C8RIfP7vYlaPgJgYr/qSwuodw/ZCvb9D
         Hf+g+KYd8RmDhAKBbN5Owaid2Qn45kuNtcwPT26xIkoTYgD23ofDeFRB+5AW0dMYM3SL
         mi4qvA6nw+iHNBMEhyVOew5Wbb+/FYKmGC+YmimZ0AuI5Y/hblUwHi5ZVFw1VEIJjPI/
         yYJXtcrWrnfRSugAPLMCXR7UhHu7IbE6u2MCoo6nGY5lRYxvwiOJKEUwnet7yk1u9aU/
         VsmS//51Sc6/iKScyn+zoA18BmFKBJqC15fY0ScDgIhg9b48VRf1mRsDsiA+X4x5fPh6
         oufg==
X-Gm-Message-State: AOAM5335hH2EV1wyquR+bvGjb2m28nEw8XGU1br+st1/2QSoYd9XKqMb
        sv0lf6PO7IUNk5YR3PPP22JrR462JGs=
X-Google-Smtp-Source: ABdhPJycDGXyvlsfDnBRduIfLLa7wOFcX/jYAYk9TWuGJPAZkv1bwKL9fZ3Gn4IzuiiXJKKx8PF9Pg==
X-Received: by 2002:a5d:6acd:: with SMTP id u13mr5702281wrw.149.1627834181200;
        Sun, 01 Aug 2021 09:09:41 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id n186sm8864252wme.40.2021.08.01.09.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 09:09:40 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/3] rtc: Add support for the MSTAR MSC313 RTC
Date:   Sun,  1 Aug 2021 18:09:20 +0200
Message-Id: <20210801160921.233081-3-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210801160921.233081-1-romain.perier@gmail.com>
References: <20210801160921.233081-1-romain.perier@gmail.com>
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
index c9467d2839f5..bff16c7bafb8 100644
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
index 000000000000..f7b9fd2807cb
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
+	priv->rtc_dev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(priv->rtc_dev))
+		return PTR_ERR(priv->rtc_dev);
+
+	priv->rtc_dev->ops = &msc313_rtc_ops;
+	priv->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_0000;
+	priv->rtc_dev->range_max = U32_MAX - 1; /* 2106-02-07 06:28:14 */
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
+	reg = readw(priv->rtc_base + REG_RTC_CTRL);
+	reg |= CNT_EN_BIT;
+	writew(reg, priv->rtc_base + REG_RTC_CTRL);
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

