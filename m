Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA1E89E13
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Aug 2019 14:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728580AbfHLMYL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Aug 2019 08:24:11 -0400
Received: from mxwww.masterlogin.de ([95.129.51.220]:59208 "EHLO
        mxwww.masterlogin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728242AbfHLMYL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Aug 2019 08:24:11 -0400
X-Greylist: delayed 519 seconds by postgrey-1.27 at vger.kernel.org; Mon, 12 Aug 2019 08:24:08 EDT
Received: from mxout2.routing.net (unknown [192.168.10.82])
        by new.mxwww.masterlogin.de (Postfix) with ESMTPS id 0A84C96DE4;
        Mon, 12 Aug 2019 12:15:37 +0000 (UTC)
Received: from mxbox2.masterlogin.de (unknown [192.168.10.253])
        by mxout2.routing.net (Postfix) with ESMTP id 5A481647BC;
        Mon, 12 Aug 2019 12:15:37 +0000 (UTC)
Received: from localhost.localdomain (fttx-pool-217.61.152.193.bambit.de [217.61.152.193])
        by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 37A7F10083A;
        Mon, 12 Aug 2019 14:15:36 +0200 (CEST)
From:   Frank Wunderlich <frank-w@public-files.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allison Randal <allison@lohutok.net>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, Eddie Huang <eddie.huang@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-rtc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Richard Fontana <rfontana@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Sebastian Reichel <sre@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Tianping . Fang" <tianping.fang@mediatek.com>
Cc:     Josef Friedl <josef.friedl@speed.at>,
        Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v5 08/10] power: reset: add driver for mt6323 poweroff
Date:   Mon, 12 Aug 2019 14:15:09 +0200
Message-Id: <20190812121511.4169-9-frank-w@public-files.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190812121511.4169-1-frank-w@public-files.de>
References: <20190812121511.4169-1-frank-w@public-files.de>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Josef Friedl <josef.friedl@speed.at>

add poweroff driver for mt6323 and make Makefile and Kconfig-Entries

Suggested-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Josef Friedl <josef.friedl@speed.at>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
changes since v4: none
changes since v3: none
changes since v2: none (=v2 part 5)
---
 drivers/power/reset/Kconfig           | 10 +++
 drivers/power/reset/Makefile          |  1 +
 drivers/power/reset/mt6323-poweroff.c | 97 +++++++++++++++++++++++++++
 include/linux/mfd/mt6397/core.h       |  2 +
 4 files changed, 110 insertions(+)
 create mode 100644 drivers/power/reset/mt6323-poweroff.c

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index a564237278ff..c721939767eb 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -140,6 +140,16 @@ config POWER_RESET_LTC2952
 	  This driver supports an external powerdown trigger and board power
 	  down via the LTC2952. Bindings are made in the device tree.
 
+config POWER_RESET_MT6323
+       bool "MediaTek MT6323 power-off driver"
+       depends on MFD_MT6397
+       help
+         The power-off driver is responsible for externally shutdown down
+         the power of a remote MediaTek SoC MT6323 is connected to through
+         controlling a tiny circuit BBPU inside MT6323 RTC.
+
+         Say Y if you have a board where MT6323 could be found.
+
 config POWER_RESET_QNAP
 	bool "QNAP power-off driver"
 	depends on OF_GPIO && PLAT_ORION
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index 85da3198e4e0..da37f8b851dc 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_POWER_RESET_GPIO) += gpio-poweroff.o
 obj-$(CONFIG_POWER_RESET_GPIO_RESTART) += gpio-restart.o
 obj-$(CONFIG_POWER_RESET_HISI) += hisi-reboot.o
 obj-$(CONFIG_POWER_RESET_MSM) += msm-poweroff.o
+obj-$(CONFIG_POWER_RESET_MT6323) += mt6323-poweroff.o
 obj-$(CONFIG_POWER_RESET_QCOM_PON) += qcom-pon.o
 obj-$(CONFIG_POWER_RESET_OCELOT_RESET) += ocelot-reset.o
 obj-$(CONFIG_POWER_RESET_PIIX4_POWEROFF) += piix4-poweroff.o
diff --git a/drivers/power/reset/mt6323-poweroff.c b/drivers/power/reset/mt6323-poweroff.c
new file mode 100644
index 000000000000..1caf43d9e46d
--- /dev/null
+++ b/drivers/power/reset/mt6323-poweroff.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Power off through MediaTek PMIC
+ *
+ * Copyright (C) 2018 MediaTek Inc.
+ *
+ * Author: Sean Wang <sean.wang@mediatek.com>
+ *
+ */
+
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/mt6397/core.h>
+#include <linux/mfd/mt6397/rtc.h>
+
+struct mt6323_pwrc {
+	struct device *dev;
+	struct regmap *regmap;
+	u32 base;
+};
+
+static struct mt6323_pwrc *mt_pwrc;
+
+static void mt6323_do_pwroff(void)
+{
+	struct mt6323_pwrc *pwrc = mt_pwrc;
+	unsigned int val;
+	int ret;
+
+	regmap_write(pwrc->regmap, pwrc->base + RTC_BBPU, RTC_BBPU_KEY);
+	regmap_write(pwrc->regmap, pwrc->base + RTC_WRTGR, 1);
+
+	ret = regmap_read_poll_timeout(pwrc->regmap,
+					pwrc->base + RTC_BBPU, val,
+					!(val & RTC_BBPU_CBUSY),
+					MTK_RTC_POLL_DELAY_US,
+					MTK_RTC_POLL_TIMEOUT);
+	if (ret)
+		dev_err(pwrc->dev, "failed to write BBPU: %d\n", ret);
+
+	/* Wait some time until system down, otherwise, notice with a warn */
+	mdelay(1000);
+
+	WARN_ONCE(1, "Unable to power off system\n");
+}
+
+static int mt6323_pwrc_probe(struct platform_device *pdev)
+{
+	struct mt6397_chip *mt6397_chip = dev_get_drvdata(pdev->dev.parent);
+	struct mt6323_pwrc *pwrc;
+	struct resource *res;
+
+	pwrc = devm_kzalloc(&pdev->dev, sizeof(*pwrc), GFP_KERNEL);
+	if (!pwrc)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	pwrc->base = res->start;
+	pwrc->regmap = mt6397_chip->regmap;
+	pwrc->dev = &pdev->dev;
+	mt_pwrc = pwrc;
+
+	pm_power_off = &mt6323_do_pwroff;
+
+	return 0;
+}
+
+static int mt6323_pwrc_remove(struct platform_device *pdev)
+{
+	if (pm_power_off == &mt6323_do_pwroff)
+		pm_power_off = NULL;
+
+	return 0;
+}
+
+static const struct of_device_id mt6323_pwrc_dt_match[] = {
+	{ .compatible = "mediatek,mt6323-pwrc" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mt6323_pwrc_dt_match);
+
+static struct platform_driver mt6323_pwrc_driver = {
+	.probe          = mt6323_pwrc_probe,
+	.remove         = mt6323_pwrc_remove,
+	.driver         = {
+		.name   = "mt6323-pwrc",
+		.of_match_table = mt6323_pwrc_dt_match,
+	},
+};
+
+module_platform_driver(mt6323_pwrc_driver);
+
+MODULE_DESCRIPTION("Poweroff driver for MT6323 PMIC");
+MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
index 25a95e72179b..652da61e3711 100644
--- a/include/linux/mfd/mt6397/core.h
+++ b/include/linux/mfd/mt6397/core.h
@@ -7,6 +7,8 @@
 #ifndef __MFD_MT6397_CORE_H__
 #define __MFD_MT6397_CORE_H__
 
+#include <linux/mutex.h>
+
 enum mt6397_irq_numbers {
 	MT6397_IRQ_SPKL_AB = 0,
 	MT6397_IRQ_SPKR_AB,
-- 
2.17.1

