Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A22F0DE3F6
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 07:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbfJUFlp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 01:41:45 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:39254 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726981AbfJUFlp (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 21 Oct 2019 01:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=References:In-Reply-To:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=bcAcJtXBavWO1y4eUMwxP1g66fqvNjefFyEl5uJpdr0=; b=lqGuN28XQU4maX8MXOPqBmx4u
        hJSZ/rwhauflxlKP1pOS7Aj3/5+pwNydDwkk3Gc/sZls6BTKEZ4ubMmF0OD+K4FyvSfXwQjlhyGyK
        YWkEqXNrrMEeb0zuoPhWa015GpxTq9CvmSR0MnAfIUaGZC2psmxAUmQXe9Vutg0ygcQdQ=;
Received: from [77.247.85.102] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iMQRq-0002hJ-20; Mon, 21 Oct 2019 07:41:42 +0200
Received: from andi by localhost with local (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iMQRl-0006ok-PX; Mon, 21 Oct 2019 07:41:37 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, phh@phh.me, b.galvani@gmail.com,
        stefan@agner.ch, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 2/5] mfd: rn5t618: add irq support
Date:   Mon, 21 Oct 2019 07:41:01 +0200
Message-Id: <20191021054104.26155-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191021054104.26155-1-andreas@kemnade.info>
References: <20191021054104.26155-1-andreas@kemnade.info>
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This adds support for irq handling in the rc5t619 which is required
for properly implementing subdevices like rtc.
For now only definitions for the variant rc5t619 are included.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/mfd/Kconfig         |  1 +
 drivers/mfd/Makefile        |  2 +-
 drivers/mfd/rn5t618-core.c  | 35 ++++++++++++++++-
 drivers/mfd/rn5t618-irq.c   | 92 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/rn5t618.h | 18 +++++++++
 5 files changed, 146 insertions(+), 2 deletions(-)
 create mode 100644 drivers/mfd/rn5t618-irq.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index f129f9678940..7534f9c8478a 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1063,6 +1063,7 @@ config MFD_RN5T618
 	depends on OF
 	select MFD_CORE
 	select REGMAP_I2C
+	select REGMAP_IRQ
 	help
 	  Say yes here to add support for the Ricoh RN5T567,
 	  RN5T618, RC5T619 PMIC.
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 7d7e0ec4e325..27a67fc7cac1 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -220,7 +220,7 @@ obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
 obj-$(CONFIG_MFD_RC5T583)	+= rc5t583.o rc5t583-irq.o
 obj-$(CONFIG_MFD_RK808)		+= rk808.o
 
-rn5t618-objs			:= rn5t618-core.o
+rn5t618-objs			:= rn5t618-core.o rn5t618-irq.o
 obj-$(CONFIG_MFD_RN5T618)	+= rn5t618.o
 obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
 obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
diff --git a/drivers/mfd/rn5t618-core.c b/drivers/mfd/rn5t618-core.c
index da5cd9c92a59..d4ed2865ed8b 100644
--- a/drivers/mfd/rn5t618-core.c
+++ b/drivers/mfd/rn5t618-core.c
@@ -8,6 +8,7 @@
 
 #include <linux/delay.h>
 #include <linux/i2c.h>
+#include <linux/interrupt.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/rn5t618.h>
 #include <linux/module.h>
@@ -105,7 +106,8 @@ static int rn5t618_i2c_probe(struct i2c_client *i2c,
 
 	i2c_set_clientdata(i2c, priv);
 	priv->variant = (long)of_id->data;
-
+	priv->chip_irq = i2c->irq;
+	priv->dev = &i2c->dev;
 	priv->regmap = devm_regmap_init_i2c(i2c, &rn5t618_regmap_config);
 	if (IS_ERR(priv->regmap)) {
 		ret = PTR_ERR(priv->regmap);
@@ -137,6 +139,11 @@ static int rn5t618_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
+	if (priv->chip_irq > 0) {
+		if (rn5t618_irq_init(priv))
+			priv->chip_irq = 0;
+	}
+
 	return 0;
 }
 
@@ -154,15 +161,41 @@ static int rn5t618_i2c_remove(struct i2c_client *i2c)
 	return 0;
 }
 
+static int __maybe_unused rn5t618_i2c_suspend(struct device *dev)
+{
+	struct rn5t618 *priv = dev_get_drvdata(dev);
+
+	if (priv->chip_irq)
+		disable_irq(priv->chip_irq);
+
+	return 0;
+}
+
+static int __maybe_unused rn5t618_i2c_resume(struct device *dev)
+{
+	struct rn5t618 *priv = dev_get_drvdata(dev);
+
+	if (priv->chip_irq)
+		enable_irq(priv->chip_irq);
+
+	return 0;
+}
+
+
 static const struct i2c_device_id rn5t618_i2c_id[] = {
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rn5t618_i2c_id);
 
+static SIMPLE_DEV_PM_OPS(rn5t618_i2c_dev_pm_ops,
+			rn5t618_i2c_suspend,
+			rn5t618_i2c_resume);
+
 static struct i2c_driver rn5t618_i2c_driver = {
 	.driver = {
 		.name = "rn5t618",
 		.of_match_table = of_match_ptr(rn5t618_of_match),
+		.pm = &rn5t618_i2c_dev_pm_ops,
 	},
 	.probe = rn5t618_i2c_probe,
 	.remove = rn5t618_i2c_remove,
diff --git a/drivers/mfd/rn5t618-irq.c b/drivers/mfd/rn5t618-irq.c
new file mode 100644
index 000000000000..384fc844bad4
--- /dev/null
+++ b/drivers/mfd/rn5t618-irq.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2019 Andreas Kemnade
+ */
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#include <linux/mfd/rn5t618.h>
+
+static const struct regmap_irq rc5t619_irqs[] = {
+	[RN5T618_IRQ_SYS] = {
+		.reg_offset = 0,
+		.mask = (0 << 1)
+	},
+	[RN5T618_IRQ_DCDC] = {
+		.reg_offset = 0,
+		.mask = (1 << 1)
+	},
+	[RN5T618_IRQ_RTC]  = {
+		.reg_offset = 0,
+		.mask = (1 << 2)
+	},
+	[RN5T618_IRQ_ADC] = {
+		.reg_offset = 0,
+		.mask = (1 << 3)
+	},
+	[RN5T618_IRQ_GPIO] = {
+		.reg_offset = 0,
+		.mask = (1 << 4)
+	},
+#if 0
+/*
+ * REVISIT when implementing charger:
+ * according to some other implementation it needs special treatment,
+ * inverted but experiments seem not to confirm that.
+ */
+	[RN5T618_IRQ_CHG] = {
+		.reg_offset = 0,
+		.mask = (1 << 6),
+	}
+#endif
+};
+
+static const struct regmap_irq_chip rc5t619_irq_chip = {
+	.name = "rc5t619",
+	.irqs = rc5t619_irqs,
+	.num_irqs = ARRAY_SIZE(rc5t619_irqs),
+	.num_regs = 1,
+	.status_base = RN5T618_INTMON,
+	.mask_base = RN5T618_INTEN,
+	.mask_invert = true,
+};
+
+int rn5t618_irq_init(struct rn5t618 *rn5t618)
+{
+	const struct regmap_irq_chip *irq_chip;
+	int ret;
+
+	if (!rn5t618->chip_irq)
+		return 0;
+
+	switch (rn5t618->variant) {
+	case RC5T619:
+		irq_chip = &rc5t619_irq_chip;
+		break;
+
+		/* TODO: check irq definitions for other variants */
+
+	default:
+		irq_chip = NULL;
+		break;
+	}
+
+	if (!irq_chip) {
+		dev_err(rn5t618->dev, "no IRQ definition known for variant\n");
+		return -ENOENT;
+	}
+
+	ret = devm_regmap_add_irq_chip(rn5t618->dev, rn5t618->regmap,
+				rn5t618->chip_irq,
+				IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+				0, irq_chip, &rn5t618->irq_data);
+	if (ret != 0) {
+		dev_err(rn5t618->dev, "Failed to register IRQ chip\n");
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/include/linux/mfd/rn5t618.h b/include/linux/mfd/rn5t618.h
index d62ef48060b5..4d680f34ad2f 100644
--- a/include/linux/mfd/rn5t618.h
+++ b/include/linux/mfd/rn5t618.h
@@ -242,9 +242,27 @@ enum {
 	RC5T619,
 };
 
+
+/* RN5T618 IRQ definitions */
+enum {
+	RN5T618_IRQ_SYS,
+	RN5T618_IRQ_DCDC,
+	RN5T618_IRQ_RTC,
+	RN5T618_IRQ_ADC,
+	RN5T618_IRQ_GPIO,
+	RN5T618_IRQ_CHG,
+	RN5T618_NR_IRQS,
+};
+
+
 struct rn5t618 {
 	struct regmap *regmap;
+	struct device *dev;
 	long variant;
+
+	int chip_irq;
+	struct regmap_irq_chip_data *irq_data;
 };
 
+extern int rn5t618_irq_init(struct rn5t618 *rn5t618);
 #endif /* __LINUX_MFD_RN5T618_H */
-- 
2.11.0

