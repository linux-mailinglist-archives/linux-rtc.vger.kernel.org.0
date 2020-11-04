Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCBB2A6192
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Nov 2020 11:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbgKDK2K (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 4 Nov 2020 05:28:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729343AbgKDK1J (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 4 Nov 2020 05:27:09 -0500
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A864C0613D3;
        Wed,  4 Nov 2020 02:27:08 -0800 (PST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4CR2rq37Ndz1rvxj;
        Wed,  4 Nov 2020 11:27:07 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4CR2rq2Dwhz1qql3;
        Wed,  4 Nov 2020 11:27:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 48GBS14bodoP; Wed,  4 Nov 2020 11:27:06 +0100 (CET)
X-Auth-Info: QYJpCS3FxSZnfkbJEdgs2D8HnPVezSX+npj0OgS+Qf0=
Received: from localhost (dslb-088-074-220-167.088.074.pools.vodafone-ip.de [88.74.220.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed,  4 Nov 2020 11:27:05 +0100 (CET)
From:   Claudius Heine <ch@denx.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Henning Schild <henning.schild@siemens.com>,
        Johannes Hahn <johannes-hahn@siemens.com>,
        Claudius Heine <ch@denx.de>
Subject: [PATCH 1/2] rtc: rx6110: add i2c support
Date:   Wed,  4 Nov 2020 11:26:28 +0100
Message-Id: <20201104102629.3422048-2-ch@denx.de>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201104102629.3422048-1-ch@denx.de>
References: <20201104102629.3422048-1-ch@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The RX6110 also supports I2C, so this patch adds support for it to the
driver.

This also renames the SPI specific functions and variables to include
`_spi_` in their names.

Signed-off-by: Claudius Heine <ch@denx.de>
Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 drivers/rtc/Kconfig      |  20 +++---
 drivers/rtc/rtc-rx6110.c | 143 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 146 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 65ad9d0b47ab..1fe411ffb19c 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -817,15 +817,6 @@ config RTC_DRV_RX4581
 	  This driver can also be built as a module. If so the module
 	  will be called rtc-rx4581.
 
-config RTC_DRV_RX6110
-	tristate "Epson RX-6110"
-	select REGMAP_SPI
-	help
-	  If you say yes here you will get support for the Epson RX-6610.
-
-	  This driver can also be built as a module. If so the module
-	  will be called rtc-rx6110.
-
 config RTC_DRV_RS5C348
 	tristate "Ricoh RS5C348A/B"
 	help
@@ -936,6 +927,17 @@ config RTC_DRV_RV3029_HWMON
 	  Say Y here if you want to expose temperature sensor data on
 	  rtc-rv3029.
 
+config RTC_DRV_RX6110
+	tristate "Epson RX-6110"
+	depends on RTC_I2C_AND_SPI
+	select REGMAP_SPI if SPI_MASTER
+	select REGMAP_I2C if I2C
+	help
+	  If you say yes here you will get support for the Epson RX-6610.
+
+	  This driver can also be built as a module. If so the module
+	  will be called rtc-rx6110.
+
 comment "Platform RTC drivers"
 
 # this 'CMOS' RTC driver is arch dependent because it requires
diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
index 3a9eb7043f01..ca9f486236d4 100644
--- a/drivers/rtc/rtc-rx6110.c
+++ b/drivers/rtc/rtc-rx6110.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/spi/spi.h>
+#include <linux/i2c.h>
 
 /* RX-6110 Register definitions */
 #define RX6110_REG_SEC		0x10
@@ -310,6 +311,7 @@ static const struct rtc_class_ops rx6110_rtc_ops = {
 	.set_time = rx6110_set_time,
 };
 
+#ifdef CONFIG_SPI_MASTER
 static struct regmap_config regmap_spi_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -318,10 +320,10 @@ static struct regmap_config regmap_spi_config = {
 };
 
 /**
- * rx6110_probe - initialize rtc driver
+ * rx6110_spi_probe - initialize rtc driver
  * @spi: pointer to spi device
  */
-static int rx6110_probe(struct spi_device *spi)
+static int rx6110_spi_probe(struct spi_device *spi)
 {
 	struct rx6110_data *rx6110;
 	int err;
@@ -362,11 +364,11 @@ static int rx6110_probe(struct spi_device *spi)
 	return 0;
 }
 
-static const struct spi_device_id rx6110_id[] = {
+static const struct spi_device_id rx6110_spi_id[] = {
 	{ "rx6110", 0 },
 	{ }
 };
-MODULE_DEVICE_TABLE(spi, rx6110_id);
+MODULE_DEVICE_TABLE(spi, rx6110_spi_id);
 
 static const struct of_device_id rx6110_spi_of_match[] = {
 	{ .compatible = "epson,rx6110" },
@@ -374,16 +376,141 @@ static const struct of_device_id rx6110_spi_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rx6110_spi_of_match);
 
-static struct spi_driver rx6110_driver = {
+static struct spi_driver rx6110_spi_driver = {
 	.driver = {
 		.name = RX6110_DRIVER_NAME,
 		.of_match_table = of_match_ptr(rx6110_spi_of_match),
 	},
-	.probe		= rx6110_probe,
-	.id_table	= rx6110_id,
+	.probe		= rx6110_spi_probe,
+	.id_table	= rx6110_spi_id,
 };
 
-module_spi_driver(rx6110_driver);
+static int rx6110_spi_register(void)
+{
+	return spi_register_driver(&rx6110_spi_driver);
+}
+
+static void rx6110_spi_unregister(void)
+{
+	spi_unregister_driver(&rx6110_spi_driver);
+}
+#else
+static int rx6110_spi_register(void)
+{
+	return 0;
+}
+
+static void rx6110_spi_unregister(void)
+{
+}
+#endif /* CONFIG_SPI_MASTER */
+
+#ifdef CONFIG_I2C
+static struct regmap_config regmap_i2c_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = RX6110_REG_IRQ,
+	.read_flag_mask = 0x80,
+};
+
+static int rx6110_i2c_probe(struct i2c_client *client,
+			    const struct i2c_device_id *id)
+{
+	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
+	struct rx6110_data *rx6110;
+	int err;
+
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA
+				| I2C_FUNC_SMBUS_I2C_BLOCK)) {
+		dev_err(&adapter->dev,
+			"doesn't support required functionality\n");
+		return -EIO;
+	}
+
+	rx6110 = devm_kzalloc(&client->dev, sizeof(*rx6110), GFP_KERNEL);
+	if (!rx6110)
+		return -ENOMEM;
+
+	rx6110->regmap = devm_regmap_init_i2c(client, &regmap_i2c_config);
+	if (IS_ERR(rx6110->regmap)) {
+		dev_err(&client->dev, "regmap init failed for rtc rx6110\n");
+		return PTR_ERR(rx6110->regmap);
+	}
+
+	i2c_set_clientdata(client, rx6110);
+
+	rx6110->rtc = devm_rtc_device_register(&client->dev,
+					       client->name,
+					       &rx6110_rtc_ops, THIS_MODULE);
+
+	if (IS_ERR(rx6110->rtc))
+		return PTR_ERR(rx6110->rtc);
+
+	err = rx6110_init(rx6110);
+	if (err)
+		return err;
+
+	rx6110->rtc->max_user_freq = 1;
+
+	return 0;
+}
+
+static const struct i2c_device_id rx6110_i2c_id[] = {
+	{ "rx6110", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, rx6110_i2c_id);
+
+static struct i2c_driver rx6110_i2c_driver = {
+	.driver = {
+		.name = RX6110_DRIVER_NAME,
+	},
+	.probe		= rx6110_i2c_probe,
+	.id_table	= rx6110_i2c_id,
+};
+
+static int rx6110_i2c_register(void)
+{
+	return i2c_add_driver(&rx6110_i2c_driver);
+}
+
+static void rx6110_i2c_unregister(void)
+{
+	i2c_del_driver(&rx6110_i2c_driver);
+}
+#else
+static int rx6110_i2c_register(void)
+{
+	return 0;
+}
+
+static void rx6110_i2c_unregister(void)
+{
+}
+#endif /* CONFIG_I2C */
+
+static int __init rx6110_module_init(void)
+{
+	int ret;
+
+	ret = rx6110_spi_register();
+	if (ret)
+		return ret;
+
+	ret = rx6110_i2c_register();
+	if (ret)
+		rx6110_spi_unregister();
+
+	return ret;
+}
+module_init(rx6110_module_init);
+
+static void __exit rx6110_module_exit(void)
+{
+	rx6110_spi_unregister();
+	rx6110_i2c_unregister();
+}
+module_exit(rx6110_module_exit);
 
 MODULE_AUTHOR("Val Krutov <val.krutov@erd.epson.com>");
 MODULE_DESCRIPTION("RX-6110 SA RTC driver");
-- 
2.20.1

