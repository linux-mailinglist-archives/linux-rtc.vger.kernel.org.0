Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2B2B50F1E3
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Apr 2022 09:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343720AbiDZHO3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Apr 2022 03:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343755AbiDZHOK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Apr 2022 03:14:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 075FF1A3BA
        for <linux-rtc@vger.kernel.org>; Tue, 26 Apr 2022 00:11:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1njFLg-0001fw-G3; Tue, 26 Apr 2022 09:11:00 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1njFLg-005IkO-Op; Tue, 26 Apr 2022 09:10:59 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1njFLe-004zAk-5z; Tue, 26 Apr 2022 09:10:58 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 1/5] rtc: rv8803: factor out existing register initialization to function
Date:   Tue, 26 Apr 2022 09:10:52 +0200
Message-Id: <20220426071056.1187235-2-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220426071056.1187235-1-s.hauer@pengutronix.de>
References: <20220426071056.1187235-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Ahmad Fatoum <a.fatoum@pengutronix.de>

The driver probe currently initializes some registers to non-POR
values. These values are not reinstated if the RTC experiences voltage
loss later on. Prepare for fixing this by factoring out the
initialization to a separate function.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/rtc/rtc-rv8803.c | 43 +++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index f69e0b1137cd0..c880f8d6c7423 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -64,6 +64,7 @@ struct rv8803_data {
 	struct rtc_device *rtc;
 	struct mutex flags_lock;
 	u8 ctrl;
+	u8 backup;
 	enum rv8803_type type;
 };
 
@@ -498,18 +499,32 @@ static int rx8900_trickle_charger_init(struct rv8803_data *rv8803)
 	if (err < 0)
 		return err;
 
-	flags = ~(RX8900_FLAG_VDETOFF | RX8900_FLAG_SWOFF) & (u8)err;
-
-	if (of_property_read_bool(node, "epson,vdet-disable"))
-		flags |= RX8900_FLAG_VDETOFF;
-
-	if (of_property_read_bool(node, "trickle-diode-disable"))
-		flags |= RX8900_FLAG_SWOFF;
+	flags = (u8)err;
+	flags &= ~(RX8900_FLAG_VDETOFF | RX8900_FLAG_SWOFF);
+	flags |= rv8803->backup;
 
 	return i2c_smbus_write_byte_data(rv8803->client, RX8900_BACKUP_CTRL,
 					 flags);
 }
 
+/* configure registers with values different than the Power-On reset defaults */
+static int rv8803_regs_configure(struct rv8803_data *rv8803)
+{
+	int err;
+
+	err = rv8803_write_reg(rv8803->client, RV8803_EXT, RV8803_EXT_WADA);
+	if (err)
+		return err;
+
+	err = rx8900_trickle_charger_init(rv8803);
+	if (err) {
+		dev_err(&rv8803->client->dev, "failed to init charger\n");
+		return err;
+	}
+
+	return 0;
+}
+
 static int rv8803_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
@@ -576,15 +591,15 @@ static int rv8803_probe(struct i2c_client *client,
 	if (!client->irq)
 		clear_bit(RTC_FEATURE_ALARM, rv8803->rtc->features);
 
-	err = rv8803_write_reg(rv8803->client, RV8803_EXT, RV8803_EXT_WADA);
-	if (err)
-		return err;
+	if (of_property_read_bool(client->dev.of_node, "epson,vdet-disable"))
+		rv8803->backup |= RX8900_FLAG_VDETOFF;
 
-	err = rx8900_trickle_charger_init(rv8803);
-	if (err) {
-		dev_err(&client->dev, "failed to init charger\n");
+	if (of_property_read_bool(client->dev.of_node, "trickle-diode-disable"))
+		rv8803->backup |= RX8900_FLAG_SWOFF;
+
+	err = rv8803_regs_configure(rv8803);
+	if (err)
 		return err;
-	}
 
 	rv8803->rtc->ops = &rv8803_rtc_ops;
 	rv8803->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-- 
2.30.2

