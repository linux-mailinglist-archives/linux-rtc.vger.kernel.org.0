Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B44C1E9136
	for <lists+linux-rtc@lfdr.de>; Sat, 30 May 2020 14:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728875AbgE3Mc4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 30 May 2020 08:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgE3Mcy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 30 May 2020 08:32:54 -0400
Received: from mail.net18.km6g.us (mail.net18.km6g.us [IPv6:2607:5300:203:24b0:3::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10F5C03E969
        for <linux-rtc@vger.kernel.org>; Sat, 30 May 2020 05:32:52 -0700 (PDT)
Received: from [2001:470:8afe:60:716b:c9b9:d55a:f6f1] (helo=balrog20.km6g.us)
        by mail.net18.km6g.us with esmtp (Exim 4.93.0.4 (FreeBSD))
        (envelope-from <kevin+linux@km6g.us>)
        id 1jf0fT-0003hx-NC; Sat, 30 May 2020 08:32:51 -0400
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
To:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     "Kevin P. Fleming" <kevin+linux@km6g.us>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] rtc: abx80x: Add support for autocalibration filter capacitor
Date:   Sat, 30 May 2020 08:32:22 -0400
Message-Id: <20200530123222.361104-1-kevin+linux@km6g.us>
X-Mailer: git-send-email 2.26.2
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
 .../bindings/rtc/abracon,abx80x.txt           |  6 ++++
 drivers/rtc/rtc-abx80x.c                      | 34 +++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
index 2405e35a1bc0..ad5d59ed6f24 100644
--- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
+++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
@@ -29,3 +29,9 @@ and valid to enable charging:
  - "abracon,tc-diode": should be "standard" (0.6V) or "schottky" (0.3V)
  - "abracon,tc-resistor": should be <0>, <3>, <6> or <11>. 0 disables the output
                           resistor, the other values are in kOhm.
+
+All of the devices can have a 47pf capacitor attached to increase the
+autocalibration accuracy of their RC oscillators. To enable usage of the
+capacitor the following property has to be defined:
+
+ - "abracon,autocal-filter"
diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 3521d8e8dc38..be5a814e8c0b 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -76,6 +76,9 @@
 #define ABX8XX_CFG_KEY_OSC	0xa1
 #define ABX8XX_CFG_KEY_MISC	0x9d
 
+#define ABX8XX_REG_AFCTRL	0x26
+#define ABX8XX_AUTOCAL_FILTER_ENABLE	0xa0
+
 #define ABX8XX_REG_ID0		0x28
 
 #define ABX8XX_REG_OUT_CTRL	0x30
@@ -130,6 +133,31 @@ static int abx80x_is_rc_mode(struct i2c_client *client)
 	return (flags & ABX8XX_OSS_OMODE) ? 1 : 0;
 }
 
+static int abx80x_enable_autocal_filter(struct i2c_client *client)
+{
+	int err;
+
+	/*
+	 * Write the configuration key register to enable access to the AFCTRL
+	 * register
+	 */
+	err = i2c_smbus_write_byte_data(client, ABX8XX_REG_CFG_KEY,
+					ABX8XX_CFG_KEY_MISC);
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write configuration key\n");
+		return -EIO;
+	}
+
+	err = i2c_smbus_write_byte_data(client, ABX8XX_REG_AFCTRL,
+					ABX8XX_AUTOCAL_FILTER_ENABLE);
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write autocal filter register\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int abx80x_enable_trickle_charger(struct i2c_client *client,
 					 u8 trickle_cfg)
 {
@@ -825,6 +853,12 @@ static int abx80x_probe(struct i2c_client *client,
 			return err;
 	}
 
+	if (of_property_read_bool(np, "abracon,autocal_filter")) {
+		err = abx80x_enable_autocal_filter(client);
+		if (err)
+			return err;
+	}
+
 	if (client->irq > 0) {
 		dev_info(&client->dev, "IRQ %d supplied\n", client->irq);
 		err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
-- 
2.26.2

