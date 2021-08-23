Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60D23F4F4C
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Aug 2021 19:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbhHWRRH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Aug 2021 13:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbhHWRRH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Aug 2021 13:17:07 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF7CC061575;
        Mon, 23 Aug 2021 10:16:24 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id z9so27226714wrh.10;
        Mon, 23 Aug 2021 10:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DIl9J4SscXua6FYPxHiIeMcyRRgGBcqZbIg82/ttDfU=;
        b=H2KxKvae3D5N0k/IpB4PC4RrYqMVQuxev2atr0ky2YwqqcGftP+OhScazJTclEikgA
         ++3CUbecLMbq0jcF6xY+Lo2Qw6P9FMpv1B7ghBluObJpWW8PlV45opURpbw8R2paenMF
         rbnT+pYIXw7G6GlgG4e+hXgxL9mtXZDWKIdN6ez5G491fhIUMpTEWpb/kk95loXnkdYN
         Ox9L7pkaZaYYUqtmY7uk0YQRioYoLkp04SczSfFpaoFYSNfNYQCvvVXdPs3ZKwivNppb
         klzuCpNwKYxZDSpejvWWkVZW4bA9vyjPzEevrpsEcbBZidaRUlhHeS5424iczO+cKd9s
         n5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DIl9J4SscXua6FYPxHiIeMcyRRgGBcqZbIg82/ttDfU=;
        b=Pkz02qnG6p3P8HufTc8hmS7BJVuYZFJ/M+YE20Dlfoh23A3jMwc0qB/rMCTqMv27sm
         BYhdIRHIo1rUL4JlcqEmy0fTXfWUPZwXHfDf+kilL1+kQCny0c5vVYC/rgnR1rM1HuHW
         5hSuAFMjTGfwr38tIVYzndXCN5mn2ebP3vbyZI+SF+0vpzLg3eA0O5AbHf3/BX4HO1/o
         iMVMyXOyICGCSl/k8QCDQ2XsUsx9IVaCMNJ2KQw6pt4YDOkwUR8rfzPclCppkTUsHKcO
         uJNhwkQaE9WG0rRaYXM0c4rOK3BkYkwk8cqgEJsmgbi8kg5K4DAfI6GkU4SkG2wFmmJO
         j6hQ==
X-Gm-Message-State: AOAM532r1fswsEFd5EnN7JRPwMRidgzPcXfYLxXFq3MyAcI9smVGw/nC
        8ko+OD9CZWYwKprLNCx6KBk=
X-Google-Smtp-Source: ABdhPJxA8HmF4eUyK/vIj5zB2gQqZY6BGL9LDL6W2Y1ESHF76PHFVEwttFwMCawY6d0cRdXEK48Org==
X-Received: by 2002:a5d:4e51:: with SMTP id r17mr3022843wrt.308.1629738982635;
        Mon, 23 Aug 2021 10:16:22 -0700 (PDT)
Received: from debby ([2a01:e0a:a6d:a8d0:7ff4:8f61:5574:9f95])
        by smtp.gmail.com with ESMTPSA id z2sm13393561wma.45.2021.08.23.10.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 10:16:22 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/3] rtc: Add support for the MSTAR MSC313 RTC
Date:   Mon, 23 Aug 2021 19:16:12 +0200
Message-Id: <20210823171613.18941-3-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210823171613.18941-1-romain.perier@gmail.com>
References: <20210823171613.18941-1-romain.perier@gmail.com>
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
index 000000000000..f493ca5f181b
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
+	unsigned long rate;
+	struct clk *clk;
+	int ret;
+	int irq;
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
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err(dev, "No input reference clock\n");
+		return PTR_ERR(clk);
+	}
+
+	ret = clk_prepare_enable(clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable the reference clock, %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare, clk);
+	if (ret)
+		return ret;
+
+	rate = clk_get_rate(clk);
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
+MODULE_DEVICE_TABLE(of, msc313_rtc_of_match_table);
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

