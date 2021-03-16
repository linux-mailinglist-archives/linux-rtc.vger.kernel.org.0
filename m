Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D4233D620
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 15:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237496AbhCPOtG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Mar 2021 10:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236922AbhCPOsm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Mar 2021 10:48:42 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C7FC06174A;
        Tue, 16 Mar 2021 07:48:41 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4F0GPV4m1Xz1rxMB;
        Tue, 16 Mar 2021 15:48:30 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4F0GPV29jZz1qqkL;
        Tue, 16 Mar 2021 15:48:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id ILRUv154j5so; Tue, 16 Mar 2021 15:48:29 +0100 (CET)
X-Auth-Info: MlnpAwcg4QNbGpzXcu9hSb1KvnHWTA6OM/0QwlCEjM8=
Received: from localhost (dslb-084-056-254-233.084.056.pools.vodafone-ip.de [84.56.254.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 16 Mar 2021 15:48:29 +0100 (CET)
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
Subject: [PATCH v4] rtc: rx6110: add ACPI bindings to I2C
Date:   Tue, 16 Mar 2021 15:48:18 +0100
Message-Id: <20210316144819.4130622-1-ch@denx.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210316100805.2630481-1-ch@denx.de>
References: <20210316100805.2630481-1-ch@denx.de>
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
---
 drivers/rtc/rtc-rx6110.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
index 79161d4c6ce4..2a06953c0a84 100644
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
+		.acpi_match_table = ACPI_PTR(rx6110_i2c_acpi_match),
 	},
 	.probe		= rx6110_i2c_probe,
 	.id_table	= rx6110_i2c_id,
-- 
2.30.1

