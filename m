Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51A823172E5
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Feb 2021 23:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232876AbhBJWHZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Feb 2021 17:07:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232692AbhBJWHT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Feb 2021 17:07:19 -0500
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50503C061756
        for <linux-rtc@vger.kernel.org>; Wed, 10 Feb 2021 14:06:36 -0800 (PST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4DbYkX2Q6vz1rwZx;
        Wed, 10 Feb 2021 23:06:28 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4DbYkX13tgz1qqkT;
        Wed, 10 Feb 2021 23:06:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id KvuQKcnvQp5J; Wed, 10 Feb 2021 23:06:27 +0100 (CET)
X-Auth-Info: E9uQeQg0418rGlXKhcsGFMfdAEYWpcNYU2ZfMo9coDk=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 10 Feb 2021 23:06:26 +0100 (CET)
From:   Marek Vasut <marex@denx.de>
To:     linux-rtc@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: pcf8563: Add NXP PCA8565 compatible
Date:   Wed, 10 Feb 2021 23:06:23 +0100
Message-Id: <20210210220623.23233-1-marex@denx.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The NXP PCA8565 is software compatible with the NXP PCF8563,
add DT and ACPI compatible entries.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org
---
 Documentation/devicetree/bindings/rtc/pcf8563.txt | 3 ++-
 drivers/rtc/rtc-pcf8563.c                         | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/pcf8563.txt b/Documentation/devicetree/bindings/rtc/pcf8563.txt
index 6076fe76dbfa..0a900f7c8977 100644
--- a/Documentation/devicetree/bindings/rtc/pcf8563.txt
+++ b/Documentation/devicetree/bindings/rtc/pcf8563.txt
@@ -5,7 +5,8 @@ Philips PCF8563/Epson RTC8564 Real Time Clock
 Required properties:
 - compatible: Should contain "nxp,pcf8563",
 	"epson,rtc8564" or
-	"microcrystal,rv8564"
+	"microcrystal,rv8564" or
+	"nxp,pca8565"
 - reg: I2C address for chip.
 
 Optional property:
diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index de3e6c355f2e..18f12f36eb2b 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -597,6 +597,7 @@ static int pcf8563_probe(struct i2c_client *client,
 static const struct i2c_device_id pcf8563_id[] = {
 	{ "pcf8563", 0 },
 	{ "rtc8564", 0 },
+	{ "pca8565", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf8563_id);
@@ -606,6 +607,7 @@ static const struct of_device_id pcf8563_of_match[] = {
 	{ .compatible = "nxp,pcf8563" },
 	{ .compatible = "epson,rtc8564" },
 	{ .compatible = "microcrystal,rv8564" },
+	{ .compatible = "nxp,pca8565" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, pcf8563_of_match);
-- 
2.30.0

