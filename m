Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B65A33D16C
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 11:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234896AbhCPKI7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Mar 2021 06:08:59 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:57091 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236486AbhCPKIx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Mar 2021 06:08:53 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4F08Bq4gQDz1qsjl;
        Tue, 16 Mar 2021 11:08:51 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4F08Bq3nKlz1qql0;
        Tue, 16 Mar 2021 11:08:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id nSAP13fhQmTa; Tue, 16 Mar 2021 11:08:50 +0100 (CET)
X-Auth-Info: iVq4xeNxB5/6ASxd6BuHk52u1Mv/bXUCd4eNvIEuL20=
Received: from localhost (dslb-084-056-254-233.084.056.pools.vodafone-ip.de [84.56.254.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 16 Mar 2021 11:08:50 +0100 (CET)
From:   Claudius Heine <ch@denx.de>
To:     johannes hahn <johannes-hahn@siemens.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Cc:     werner zeh <werner.zeh@siemens.com>,
        henning schild <henning.schild@siemens.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        martin mantel <martin.mantel@siemens.com>,
        val krutov <val.krutov@erd.epson.com>,
        Claudius Heine <ch@denx.de>
Subject: [PATCH v3 1/1] rtc: rx6110: add ACPI bindings to I2C
Date:   Tue, 16 Mar 2021 11:08:05 +0100
Message-Id: <20210316100805.2630481-2-ch@denx.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <AM0PR10MB25801B7DCB6C1856B5D4F2C09FE10@AM0PR10MB2580.EURPRD10.PROD.OUTLOOK.COM>
References: <AM0PR10MB25801B7DCB6C1856B5D4F2C09FE10@AM0PR10MB2580.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Johannes Hahn <johannes-hahn@siemens.com>

This allows the RX6110 driver to be automatically assigned to the right
device on the I2C bus.

Signed-off-by: Johannes Hahn <johannes-hahn@siemens.com>
Signed-off-by: Claudius Heine <ch@denx.de>
Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 drivers/rtc/rtc-rx6110.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
index 79161d4c6ce4..29bd697f82cb 100644
--- a/drivers/rtc/rtc-rx6110.c
+++ b/drivers/rtc/rtc-rx6110.c
@@ -13,6 +13,7 @@
 #include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <linux/rtc.h>
+#include <linux/acpi.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/spi/spi.h>
@@ -447,6 +448,14 @@ static int rx6110_i2c_probe(struct i2c_client *client,
 	return rx6110_probe(rx6110, &client->dev);
 }
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id rx6110_i2c_acpi_match[] = {
+	{ "SECC6110", },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, rx6110_i2c_acpi_match);
+#endif
+
 static const struct i2c_device_id rx6110_i2c_id[] = {
 	{ "rx6110", 0 },
 	{ }
@@ -456,6 +465,9 @@ MODULE_DEVICE_TABLE(i2c, rx6110_i2c_id);
 static struct i2c_driver rx6110_i2c_driver = {
 	.driver = {
 		.name = RX6110_DRIVER_NAME,
+#ifdef CONFIG_ACPI
+		.acpi_match_table = ACPI_PTR(rx6110_i2c_acpi_match),
+#endif
 	},
 	.probe		= rx6110_i2c_probe,
 	.id_table	= rx6110_i2c_id,
-- 
2.30.1

