Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1661F94E5
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2020 12:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729379AbgFOKvj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Jun 2020 06:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbgFOKvj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 15 Jun 2020 06:51:39 -0400
Received: from mail.net18.km6g.us (mail.net18.km6g.us [IPv6:2607:5300:203:24b0:3::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE3DC061A0E;
        Mon, 15 Jun 2020 03:51:38 -0700 (PDT)
Received: from [2001:470:8afe:60:716b:c9b9:d55a:f6f1] (helo=balrog20.km6g.us)
        by mail.net18.km6g.us with esmtp (Exim 4.94 (FreeBSD))
        (envelope-from <kevin+linux@km6g.us>)
        id 1jkmiH-000N4M-Q0; Mon, 15 Jun 2020 06:51:37 -0400
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
To:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     "Kevin P. Fleming" <kevin+linux@km6g.us>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/3] rtc: abx80x: Add utility function for writing configuration key
Date:   Mon, 15 Jun 2020 06:51:12 -0400
Message-Id: <20200615105113.57770-2-kevin+linux@km6g.us>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615105113.57770-1-kevin+linux@km6g.us>
References: <20200615105113.57770-1-kevin+linux@km6g.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Writing one of key two values into the configuration key register
is a common operation, so a utility function has been added to
provide consistent behavior and eliminate code duplication.

Signed-off-by: Kevin P. Fleming <kevin+linux@km6g.us>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org
---
 drivers/rtc/rtc-abx80x.c | 39 ++++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 803725b3a02c3..daa6f27040e61 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -117,6 +117,16 @@ struct abx80x_priv {
 	struct watchdog_device wdog;
 };
 
+static int abx80x_write_config_key(struct i2c_client *client, u8 key)
+{
+	if (i2c_smbus_write_byte_data(client, ABX8XX_REG_CFG_KEY, key) < 0) {
+		dev_err(&client->dev, "Unable to write configuration key\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int abx80x_is_rc_mode(struct i2c_client *client)
 {
 	int flags = 0;
@@ -140,12 +150,8 @@ static int abx80x_enable_trickle_charger(struct i2c_client *client,
 	 * Write the configuration key register to enable access to the Trickle
 	 * register
 	 */
-	err = i2c_smbus_write_byte_data(client, ABX8XX_REG_CFG_KEY,
-					ABX8XX_CFG_KEY_MISC);
-	if (err < 0) {
-		dev_err(&client->dev, "Unable to write configuration key\n");
+	if (abx80x_write_config_key(client, ABX8XX_CFG_KEY_MISC) < 0)
 		return -EIO;
-	}
 
 	err = i2c_smbus_write_byte_data(client, ABX8XX_REG_TRICKLE,
 					ABX8XX_TRICKLE_CHARGE_ENABLE |
@@ -358,12 +364,8 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
 	}
 
 	/* Unlock write access to Oscillator Control Register */
-	retval = i2c_smbus_write_byte_data(client, ABX8XX_REG_CFG_KEY,
-					   ABX8XX_CFG_KEY_OSC);
-	if (retval < 0) {
-		dev_err(dev, "Failed to write CONFIG_KEY register\n");
-		return retval;
-	}
+	if (abx80x_write_config_key(client, ABX8XX_CFG_KEY_OSC) < 0)
+		return -EIO;
 
 	retval = i2c_smbus_write_byte_data(client, ABX8XX_REG_OSC, flags);
 
@@ -450,12 +452,8 @@ static ssize_t oscillator_store(struct device *dev,
 		flags |= (ABX8XX_OSC_OSEL);
 
 	/* Unlock write access on Oscillator Control register */
-	retval = i2c_smbus_write_byte_data(client, ABX8XX_REG_CFG_KEY,
-					   ABX8XX_CFG_KEY_OSC);
-	if (retval < 0) {
-		dev_err(dev, "Failed to write CONFIG_KEY register\n");
-		return retval;
-	}
+	if (abx80x_write_config_key(client, ABX8XX_CFG_KEY_OSC) < 0)
+		return -EIO;
 
 	retval = i2c_smbus_write_byte_data(client, ABX8XX_REG_OSC, flags);
 	if (retval < 0) {
@@ -762,13 +760,8 @@ static int abx80x_probe(struct i2c_client *client,
 		 * Write the configuration key register to enable access to
 		 * the config2 register
 		 */
-		err = i2c_smbus_write_byte_data(client, ABX8XX_REG_CFG_KEY,
-						ABX8XX_CFG_KEY_MISC);
-		if (err < 0) {
-			dev_err(&client->dev,
-				"Unable to write configuration key\n");
+		if (abx80x_write_config_key(client, ABX8XX_CFG_KEY_MISC) < 0)
 			return -EIO;
-		}
 
 		err = i2c_smbus_write_byte_data(client, ABX8XX_REG_OUT_CTRL,
 						data | ABX8XX_OUT_CTRL_EXDS);
-- 
2.26.2

