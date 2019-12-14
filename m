Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFCE11F4A2
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbfLNWK2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:10:28 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:44995 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbfLNWK2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:10:28 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 6D9DB1C0007;
        Sat, 14 Dec 2019 22:10:27 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 03/16] rtc: rv3029: remove open coded regmap_update_bits
Date:   Sat, 14 Dec 2019 23:10:09 +0100
Message-Id: <20191214221022.622482-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
References: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

rv3029_update_bits open codes regmap_update_bits and forgets to properly
lock the register range while doing so. Use regmap_update_bits instead.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3029c2.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index aed28e29a5fd..36b4da260caf 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -137,23 +137,6 @@ static int rv3029_write_regs(struct device *dev, u8 reg, u8 const buf[],
 	return regmap_bulk_write(rv3029->regmap, reg, buf, len);
 }
 
-static int rv3029_update_bits(struct device *dev, u8 reg, u8 mask, u8 set)
-{
-	u8 buf;
-	int ret;
-
-	ret = rv3029_read_regs(dev, reg, &buf, 1);
-	if (ret < 0)
-		return ret;
-	buf &= ~mask;
-	buf |= set & mask;
-	ret = rv3029_write_regs(dev, reg, &buf, 1);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static int rv3029_get_sr(struct device *dev, u8 *buf)
 {
 	int ret = rv3029_read_regs(dev, RV3029_STATUS, buf, 1);
@@ -200,14 +183,17 @@ static int rv3029_eeprom_busywait(struct device *dev)
 
 static int rv3029_eeprom_exit(struct device *dev)
 {
+	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
+
 	/* Re-enable eeprom refresh */
-	return rv3029_update_bits(dev, RV3029_ONOFF_CTRL,
+	return regmap_update_bits(rv3029->regmap, RV3029_ONOFF_CTRL,
 				  RV3029_ONOFF_CTRL_EERE,
 				  RV3029_ONOFF_CTRL_EERE);
 }
 
 static int rv3029_eeprom_enter(struct device *dev)
 {
+	struct rv3029_data *rv3029 = dev_get_drvdata(dev);
 	int ret;
 	u8 sr;
 
@@ -236,8 +222,8 @@ static int rv3029_eeprom_enter(struct device *dev)
 	}
 
 	/* Disable eeprom refresh. */
-	ret = rv3029_update_bits(dev, RV3029_ONOFF_CTRL, RV3029_ONOFF_CTRL_EERE,
-				 0);
+	ret = regmap_update_bits(rv3029->regmap, RV3029_ONOFF_CTRL,
+				 RV3029_ONOFF_CTRL_EERE, 0);
 	if (ret < 0)
 		return ret;
 
-- 
2.23.0

