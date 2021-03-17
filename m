Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920A733EAD6
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Mar 2021 08:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbhCQHxS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Mar 2021 03:53:18 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:38211 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhCQHxG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 17 Mar 2021 03:53:06 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4F0j7h1rfDz1qsjg;
        Wed, 17 Mar 2021 08:53:04 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4F0j7h0YYXz1r1M0;
        Wed, 17 Mar 2021 08:53:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id rRgCzWBJO1Lz; Wed, 17 Mar 2021 08:53:03 +0100 (CET)
X-Auth-Info: zSEXD/ZGa2c2y2/BVwY9zHDvqqWzlWpsXe4CHAVtWfo=
Received: from localhost (dslb-084-056-254-233.084.056.pools.vodafone-ip.de [84.56.254.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 17 Mar 2021 08:53:02 +0100 (CET)
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
        Claudius Heine <ch@denx.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v5] rtc: rx6110: add ACPI bindings to I2C
Date:   Wed, 17 Mar 2021 08:52:27 +0100
Message-Id: <20210317075228.683184-1-ch@denx.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Johannes Hahn <johannes-hahn@siemens.com>

This allows the RX6110 driver to be automatically assigned to the right
device on the I2C bus.

Signed-off-by: Johannes Hahn <johannes-hahn@siemens.com>
Co-developed-by: Claudius Heine <ch@denx.de>
Signed-off-by: Claudius Heine <ch@denx.de>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/rtc/rtc-rx6110.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
index 79161d4c6ce4..f4d425002f7f 100644
--- a/drivers/rtc/rtc-rx6110.c
+++ b/drivers/rtc/rtc-rx6110.c
@@ -447,6 +447,12 @@ static int rx6110_i2c_probe(struct i2c_client *client,
 	return rx6110_probe(rx6110, &client->dev);
 }
 
+static const struct acpi_device_id rx6110_i2c_acpi_match[] = {
+	{ "SECC6110" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, rx6110_i2c_acpi_match);
+
 static const struct i2c_device_id rx6110_i2c_id[] = {
 	{ "rx6110", 0 },
 	{ }
@@ -456,6 +462,7 @@ MODULE_DEVICE_TABLE(i2c, rx6110_i2c_id);
 static struct i2c_driver rx6110_i2c_driver = {
 	.driver = {
 		.name = RX6110_DRIVER_NAME,
+		.acpi_match_table = rx6110_i2c_acpi_match,
 	},
 	.probe		= rx6110_i2c_probe,
 	.id_table	= rx6110_i2c_id,

base-commit: 1df27313f50a57497c1faeb6a6ae4ca939c85a7d
-- 
2.30.1

