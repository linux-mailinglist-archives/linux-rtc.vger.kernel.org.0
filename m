Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7FC0634FAA
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Nov 2022 06:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235761AbiKWFgL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Nov 2022 00:36:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiKWFgK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Nov 2022 00:36:10 -0500
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34538220E;
        Tue, 22 Nov 2022 21:36:09 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AN5ZqYR091873;
        Tue, 22 Nov 2022 23:35:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1669181752;
        bh=pA7rNBLnZJLX6IHNL1cRAdQltQJ9JWw3hDD16aE5CXY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Ak2CzTGILo9EvlgR+bYkVlwJWyUMXc6lPzbI+rtviWjFhjL9nKqR/XN7s4wSsSsMs
         WUjM58b/J4swf9jypSqndUfv4DxUdgQa1SDNXrvGLqBr/y/otpoeCxb/MRnMKS6Oa9
         agtMznJtScNV8JX6kYuDsKU8VWtY71OuPc73mPl0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AN5Zq9u002736
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Nov 2022 23:35:52 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 22
 Nov 2022 23:35:52 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 22 Nov 2022 23:35:52 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AN5ZmKo112823;
        Tue, 22 Nov 2022 23:35:51 -0600
From:   Matt Ranostay <mranostay@ti.com>
To:     <michael@walle.cc>, <vigneshr@ti.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <a.zummo@towertech.it>,
        <linus.walleij@linaro.org>, <lee@kernel.org>, <brgl@bgdev.pl>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, Keerthy <j-keerthy@ti.com>,
        Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v5 3/4] rtc: rtc-tps6594: Add support for TPS6594 PMIC RTC
Date:   Tue, 22 Nov 2022 21:35:11 -0800
Message-ID: <20221123053512.1195309-4-mranostay@ti.com>
X-Mailer: git-send-email 2.38.GIT
In-Reply-To: <20221123053512.1195309-1-mranostay@ti.com>
References: <20221123053512.1195309-1-mranostay@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Keerthy <j-keerthy@ti.com>

Add support for TPS6594 PMIC RTC. However, currently only get/set of
time + date functionality is supported.

Signed-off-by: Keerthy <j-keerthy@ti.com>
Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 drivers/rtc/Kconfig       |  10 +++
 drivers/rtc/Makefile      |   1 +
 drivers/rtc/rtc-tps6594.c | 155 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)
 create mode 100644 drivers/rtc/rtc-tps6594.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index ab9a1f814119..519dc544b083 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -588,6 +588,16 @@ config RTC_DRV_TPS65910
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-tps65910.
 
+config RTC_DRV_TPS6594
+	tristate "TI TPS6594 RTC driver"
+	depends on MFD_TPS6594 || COMPILE_TEST
+	help
+	  If you say yes here you get support for the RTC of TI TPS6594 series PMIC
+	  chips.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-tps6594.
+
 config RTC_DRV_RC5T583
 	tristate "RICOH 5T583 RTC driver"
 	depends on MFD_RC5T583
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index d3c042dcbc73..4493a13f989d 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -175,6 +175,7 @@ obj-$(CONFIG_RTC_DRV_TEST)	+= rtc-test.o
 obj-$(CONFIG_RTC_DRV_TI_K3)	+= rtc-ti-k3.o
 obj-$(CONFIG_RTC_DRV_TPS6586X)	+= rtc-tps6586x.o
 obj-$(CONFIG_RTC_DRV_TPS65910)	+= rtc-tps65910.o
+obj-$(CONFIG_RTC_DRV_TPS6594)	+= rtc-tps6594.o
 obj-$(CONFIG_RTC_DRV_TWL4030)	+= rtc-twl.o
 obj-$(CONFIG_RTC_DRV_V3020)	+= rtc-v3020.o
 obj-$(CONFIG_RTC_DRV_VT8500)	+= rtc-vt8500.o
diff --git a/drivers/rtc/rtc-tps6594.c b/drivers/rtc/rtc-tps6594.c
new file mode 100644
index 000000000000..6e85ea8551a2
--- /dev/null
+++ b/drivers/rtc/rtc-tps6594.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * rtc-tps6594.c -- TPS6594 Real Time Clock driver.
+ *
+ * Copyright (C) 2022 Texas Instruments Incorporated - https://www.ti.com
+ */
+
+#include <linux/bcd.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/mfd/tps6594.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/rtc.h>
+#include <linux/types.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+struct tps6594_rtc {
+	struct rtc_device	*rtc;
+	struct device		*dev;
+};
+
+#define TPS6594_RTC_POLL	20000
+#define TPS6594_RTC_TIMEOUT	100000
+
+#define TPS6594_NUM_TIME_REGS	(TPS6594_RTC_YEARS - TPS6594_RTC_SECONDS + 1)
+
+static int tps6594_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	unsigned char rtc_data[TPS6594_NUM_TIME_REGS];
+	struct tps6594 *tps6594 = dev_get_drvdata(dev->parent);
+	int ret;
+
+	/* Reset TPS6594_RTC_CTRL_REG_GET_TIME bit to zero, required for latch */
+	ret = regmap_update_bits(tps6594->regmap, TPS6594_RTC_CTRL_1,
+		TPS6594_RTC_CTRL_REG_GET_TIME, 0);
+	if (ret < 0)
+		return ret;
+
+	/* Copy RTC counting registers to static registers or latches */
+	ret = regmap_update_bits(tps6594->regmap, TPS6594_RTC_CTRL_1,
+		TPS6594_RTC_CTRL_REG_GET_TIME, TPS6594_RTC_CTRL_REG_GET_TIME);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_bulk_read(tps6594->regmap, TPS6594_RTC_SECONDS,
+			rtc_data, TPS6594_NUM_TIME_REGS);
+	if (ret < 0)
+		return ret;
+
+	tm->tm_sec = bcd2bin(rtc_data[0]);
+	tm->tm_min = bcd2bin(rtc_data[1]);
+	tm->tm_hour = bcd2bin(rtc_data[2]);
+	tm->tm_mday = bcd2bin(rtc_data[3]);
+	tm->tm_mon = bcd2bin(rtc_data[4]) - 1;
+	tm->tm_year = bcd2bin(rtc_data[5]) + 100;
+
+	return ret;
+}
+
+static int tps6594_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	unsigned char rtc_data[TPS6594_NUM_TIME_REGS];
+	struct tps6594 *tps6594 = dev_get_drvdata(dev->parent);
+	unsigned int val;
+	int ret;
+
+	rtc_data[0] = bin2bcd(tm->tm_sec);
+	rtc_data[1] = bin2bcd(tm->tm_min);
+	rtc_data[2] = bin2bcd(tm->tm_hour);
+	rtc_data[3] = bin2bcd(tm->tm_mday);
+	rtc_data[4] = bin2bcd(tm->tm_mon + 1);
+	rtc_data[5] = bin2bcd(tm->tm_year - 100);
+
+	/* Stop RTC while updating the RTC time registers */
+	ret = regmap_update_bits(tps6594->regmap, TPS6594_RTC_CTRL_1,
+				 TPS6594_RTC_CTRL_REG_STOP_RTC, 0);
+	if (ret < 0) {
+		dev_err(dev, "RTC stop failed, err = %d\n", ret);
+		return ret;
+	}
+
+	/* Waiting till RTC isn't running */
+	ret = regmap_read_poll_timeout(tps6594->regmap, TPS6594_RTC_STATUS,
+				       val, !(val & TPS6594_RTC_STATUS_RUN),
+				       TPS6594_RTC_POLL, TPS6594_RTC_TIMEOUT);
+	if (ret) {
+		dev_err(dev, "RTC_STATUS is still RUNNING\n");
+		return ret;
+	}
+
+	ret = regmap_bulk_write(tps6594->regmap, TPS6594_RTC_SECONDS,
+		rtc_data, TPS6594_NUM_TIME_REGS);
+	if (ret < 0) {
+		dev_err(dev, "RTC_SECONDS reg write failed, err = %d\n", ret);
+		return ret;
+	}
+
+	/* Start back RTC */
+	ret = regmap_update_bits(tps6594->regmap, TPS6594_RTC_CTRL_1,
+				 TPS6594_RTC_CTRL_REG_STOP_RTC,
+				 TPS6594_RTC_CTRL_REG_STOP_RTC);
+	if (ret < 0)
+		dev_err(dev, "RTC start failed, err = %d\n", ret);
+
+	return ret;
+}
+
+static const struct rtc_class_ops tps6594_rtc_ops = {
+	.read_time	= tps6594_rtc_read_time,
+	.set_time	= tps6594_rtc_set_time,
+};
+
+static int tps6594_rtc_probe(struct platform_device *pdev)
+{
+	struct tps6594_rtc *tps6594_rtc;
+
+	tps6594_rtc = devm_kzalloc(&pdev->dev, sizeof(*tps6594_rtc), GFP_KERNEL);
+	if (!tps6594_rtc)
+		return -ENOMEM;
+
+	tps6594_rtc->dev = &pdev->dev;
+	platform_set_drvdata(pdev, tps6594_rtc);
+
+	tps6594_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(tps6594_rtc->rtc))
+		return PTR_ERR(tps6594_rtc->rtc);
+
+	tps6594_rtc->rtc->ops = &tps6594_rtc_ops;
+
+	return devm_rtc_register_device(tps6594_rtc->rtc);
+}
+
+static const struct of_device_id of_tps6594_rtc_match[] = {
+	{ .compatible = "ti,tps6594-rtc", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_tps6594_rtc_match);
+
+static struct platform_driver tps6594_rtc_driver = {
+	.probe		= tps6594_rtc_probe,
+	.driver		= {
+		.name	= "tps6594-rtc",
+		.of_match_table = of_tps6594_rtc_match,
+	},
+};
+
+module_platform_driver(tps6594_rtc_driver);
+
+MODULE_ALIAS("platform:tps6594-rtc");
+MODULE_DESCRIPTION("TI TPS6594 series RTC driver");
+MODULE_AUTHOR("Keerthy J <j-keerthy@ti.com>");
+MODULE_LICENSE("GPL");
-- 
2.38.GIT

