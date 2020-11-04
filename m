Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF0F2A6189
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Nov 2020 11:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728029AbgKDK2J (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 4 Nov 2020 05:28:09 -0500
Received: from mail-out.m-online.net ([212.18.0.9]:35578 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729355AbgKDK1M (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 4 Nov 2020 05:27:12 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4CR2rt1vTJz1qsbH;
        Wed,  4 Nov 2020 11:27:10 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4CR2rt1ZYsz1qql3;
        Wed,  4 Nov 2020 11:27:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id mcAhrJmBi-zI; Wed,  4 Nov 2020 11:27:09 +0100 (CET)
X-Auth-Info: D2vvoz9vVkfffy9KUCy26P96tW4BgJZlOXPCIBtSv7A=
Received: from localhost (dslb-088-074-220-167.088.074.pools.vodafone-ip.de [88.74.220.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed,  4 Nov 2020 11:27:09 +0100 (CET)
From:   Claudius Heine <ch@denx.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Henning Schild <henning.schild@siemens.com>,
        Johannes Hahn <johannes-hahn@siemens.com>,
        Claudius Heine <ch@denx.de>
Subject: [PATCH 2/2] rtc: rx6110: add ACPI bindings to I2C
Date:   Wed,  4 Nov 2020 11:26:29 +0100
Message-Id: <20201104102629.3422048-3-ch@denx.de>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201104102629.3422048-1-ch@denx.de>
References: <20201104102629.3422048-1-ch@denx.de>
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
index ca9f486236d4..6c0c7e5a7065 100644
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
@@ -455,6 +456,14 @@ static int rx6110_i2c_probe(struct i2c_client *client,
 	return 0;
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
@@ -464,6 +473,9 @@ MODULE_DEVICE_TABLE(i2c, rx6110_i2c_id);
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

