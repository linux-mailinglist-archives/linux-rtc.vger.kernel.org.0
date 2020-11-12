Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8670C2B05FD
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Nov 2020 14:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728210AbgKLNIN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 Nov 2020 08:08:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728192AbgKLNIM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 Nov 2020 08:08:12 -0500
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A961FC0613D4;
        Thu, 12 Nov 2020 05:08:11 -0800 (PST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4CX22w1xC6z1s20C;
        Thu, 12 Nov 2020 14:08:08 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4CX22w0wfdz1sQ3V;
        Thu, 12 Nov 2020 14:08:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id mXBdD75GNQss; Thu, 12 Nov 2020 14:08:07 +0100 (CET)
X-Auth-Info: W65NMfUqPLM7Zp3LcRCJ38kfBUf18nurW2Y0dNMl4Rw=
Received: from localhost (dslb-094-220-156-233.094.220.pools.vodafone-ip.de [94.220.156.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu, 12 Nov 2020 14:08:07 +0100 (CET)
From:   Claudius Heine <ch@denx.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Henning Schild <henning.schild@siemens.com>,
        Johannes Hahn <johannes-hahn@siemens.com>,
        Claudius Heine <ch@denx.de>
Subject: [PATCH v2 2/3] rtc: rx6110: add ACPI bindings to I2C
Date:   Thu, 12 Nov 2020 14:07:33 +0100
Message-Id: <20201112130734.331094-3-ch@denx.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201112130734.331094-1-ch@denx.de>
References: <20201112130734.331094-1-ch@denx.de>
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
index 1e6e9b19c81c..2fc9e8c2eeeb 100644
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
@@ -449,6 +450,14 @@ static int rx6110_i2c_probe(struct i2c_client *client,
 	return rx6110_probe(rx6110, &client->dev);
 }
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id rx6110_i2c_acpi_match[] = {
+	{ "RX6110SA", },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, rx6110_i2c_acpi_match);
+#endif
+
 static const struct i2c_device_id rx6110_i2c_id[] = {
 	{ "rx6110", 0 },
 	{ }
@@ -458,6 +467,9 @@ MODULE_DEVICE_TABLE(i2c, rx6110_i2c_id);
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
2.20.1

