Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87D9C1E914E
	for <lists+linux-rtc@lfdr.de>; Sat, 30 May 2020 14:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgE3MtR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 30 May 2020 08:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgE3MtR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 30 May 2020 08:49:17 -0400
Received: from mail.net18.km6g.us (mail.net18.km6g.us [IPv6:2607:5300:203:24b0:3::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04BADC03E969;
        Sat, 30 May 2020 05:49:17 -0700 (PDT)
Received: from [2001:470:8afe:60:716b:c9b9:d55a:f6f1] (helo=balrog20.km6g.us)
        by mail.net18.km6g.us with esmtp (Exim 4.93.0.4 (FreeBSD))
        (envelope-from <kevin+linux@km6g.us>)
        id 1jf0vM-0003lm-9V; Sat, 30 May 2020 08:49:16 -0400
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
To:     devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     "Kevin P. Fleming" <kevin+linux@km6g.us>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/2] rtc: abx80x: Add support for autocalibration filter capacitor
Date:   Sat, 30 May 2020 08:49:00 -0400
Message-Id: <20200530124900.363399-2-kevin+linux@km6g.us>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200530124900.363399-1-kevin+linux@km6g.us>
References: <20200530124900.363399-1-kevin+linux@km6g.us>
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
 drivers/rtc/rtc-abx80x.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

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

