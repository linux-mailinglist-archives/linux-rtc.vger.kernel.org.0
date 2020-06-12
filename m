Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60C81F7EFD
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Jun 2020 00:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgFLWhd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 12 Jun 2020 18:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgFLWhd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 12 Jun 2020 18:37:33 -0400
Received: from mail.net18.km6g.us (mail.net18.km6g.us [IPv6:2607:5300:203:24b0:3::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08E2C03E96F;
        Fri, 12 Jun 2020 15:37:33 -0700 (PDT)
Received: from [2001:470:8afe:60:716b:c9b9:d55a:f6f1] (helo=balrog20.km6g.us)
        by mail.net18.km6g.us with esmtp (Exim 4.93.0.4 (FreeBSD))
        (envelope-from <kevin+linux@km6g.us>)
        id 1jjsIm-0006C6-Oh; Fri, 12 Jun 2020 18:37:32 -0400
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
To:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     "Kevin P. Fleming" <kevin+linux@km6g.us>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/3 v2] rtc: abx80x: Add support for autocalibration filter capacitor
Date:   Fri, 12 Jun 2020 18:35:52 -0400
Message-Id: <20200612223551.282113-3-kevin+linux@km6g.us>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200612223551.282113-1-kevin+linux@km6g.us>
References: <20200612223551.282113-1-kevin+linux@km6g.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

All of the parts supported by this driver can make use of a
small capacitor to improve the accuracy of the autocalibration
process for their RC oscillators. If a capacitor is connected,
a configuration register must be set to enable its use, so a
new Device Tree property has been added for that purpose.

Signed-off-by: Kevin P. Fleming <kevin+linux@km6g.us>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>
To: linux-rtc@vger.kernel.org
To: devicetree@vger.kernel.org
---
v2: Change property to an integer value to allow user to enable or disable
 drivers/rtc/rtc-abx80x.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index daa6f27040e61..8edfcefbd9058 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -77,6 +77,10 @@
 #define ABX8XX_CFG_KEY_OSC	0xa1
 #define ABX8XX_CFG_KEY_MISC	0x9d
 
+#define ABX8XX_REG_AFCTRL	0x26
+#define ABX8XX_AUTOCAL_FILTER_DISABLE	0x00
+#define ABX8XX_AUTOCAL_FILTER_ENABLE	0xa0
+
 #define ABX8XX_REG_ID0		0x28
 
 #define ABX8XX_REG_OUT_CTRL	0x30
@@ -141,6 +145,26 @@ static int abx80x_is_rc_mode(struct i2c_client *client)
 	return (flags & ABX8XX_OSS_OMODE) ? 1 : 0;
 }
 
+static int abx80x_set_autocal_filter(struct i2c_client *client, u8 filter_cfg)
+{
+	int err;
+
+	/*
+	 * Write the configuration key register to enable access to the AFCTRL
+	 * register
+	 */
+	if (abx80x_write_config_key(client, ABX8XX_CFG_KEY_MISC) < 0)
+		return -EIO;
+
+	err = i2c_smbus_write_byte_data(client, ABX8XX_REG_AFCTRL, filter_cfg);
+	if (err < 0) {
+		dev_warn(&client->dev, "Unable to write autocal filter register\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int abx80x_enable_trickle_charger(struct i2c_client *client,
 					 u8 trickle_cfg)
 {
@@ -678,7 +702,7 @@ static int abx80x_probe(struct i2c_client *client,
 {
 	struct device_node *np = client->dev.of_node;
 	struct abx80x_priv *priv;
-	int i, data, err, trickle_cfg = -EINVAL;
+	int i, data, err, trickle_cfg, filter_cfg = -EINVAL;
 	char buf[7];
 	unsigned int part = id->driver_data;
 	unsigned int partnumber;
@@ -824,6 +848,15 @@ static int abx80x_probe(struct i2c_client *client,
 			return err;
 	}
 
+	if (of_property_read_u32(np, "abracon,autocal_filter", &filter_cfg) == 0) {
+		err = abx80x_set_autocal_filter(client,
+						filter_cfg ?
+						ABX8XX_AUTOCAL_FILTER_ENABLE :
+						ABX8XX_AUTOCAL_FILTER_DISABLE);
+		if (err)
+			return err;
+	}
+
 	if (client->irq > 0) {
 		dev_info(&client->dev, "IRQ %d supplied\n", client->irq);
 		err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
-- 
2.26.2

