Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69C9950F1DB
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Apr 2022 09:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343697AbiDZHO0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Apr 2022 03:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343754AbiDZHOK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Apr 2022 03:14:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0745B1A04E
        for <linux-rtc@vger.kernel.org>; Tue, 26 Apr 2022 00:11:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1njFLg-0001g6-NQ; Tue, 26 Apr 2022 09:11:00 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1njFLh-005Ikd-AL; Tue, 26 Apr 2022 09:10:59 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1njFLe-004zAq-7F; Tue, 26 Apr 2022 09:10:58 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 3/5] rtc: rv8803: re-initialize all Epson RX8803 registers on voltage loss
Date:   Tue, 26 Apr 2022 09:10:54 +0200
Message-Id: <20220426071056.1187235-4-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220426071056.1187235-1-s.hauer@pengutronix.de>
References: <20220426071056.1187235-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The reference manuals of both the RX8803 and RV8803 dictate that
"[On V2F/VLF = ] all registers must be initialized".

The RV-8803 application manual (rev. 1.6) further specifies that crossing
V_LOW2 threshold enables flag V2F and triggers a Power-On reset.
According to table 3.11 in the document, all control registers are
defined to sensible values.

However, The Epson RX-8803 doesn't offer the same guarantees.
It explicitly states:

  During the initial power-up, the TEST bit is reset to "0" and the VLF
  bit is set to "1".
  ∗ At this point, all other register values are _undefined_, so be sure to
  perform a reset before using the module.

Commit d3700b6b6479 ("rtc: rv8803: Stop the clock while setting the time")
also had this rationale:

  Indeed, all the registers must be initialized if the voltage has been
  lower than VLOW2 (triggering V2F), but not low enough to trigger a POR.

We should follow the advice and initialize all applicable registers.
We can group the registers into 3 groups:

A) Already correctly handled registers:
  * 0B-0Ch | Timer Counter  | unused and disabled by clearing TE in 0Dh
  * 0Dh    | Extension Reg  | already initialized in rv8803_regs_configure
  * 0Eh    | Flag Reg       | handled in IRQ handler, except for VLF, VDET
  * 0Eh    | VLF, VDET      | cleared in ->set_time
  * 10h    | 100th Seconds  | Already reset via RESET bit
  * 20-21h | Capture Buffer | holds timestamp unused by driver
  * 2Fh    | Event Control  | resets automatically

B) Registers that are hardware initialized on POR, but not on VLF:
  * 0Fh    | Control Reg
  * 2Ch    | OSC Offset

C) RAM that is undefined on voltage loss:
  * 00-06h | Date/Time
  * 07h    | RAM
  * 08-0Ah | Alarm

This means we should initialize after VLF the registers in group B
(RV8803_CTRL and RV8803_OSC_OFFSET).

Group C is all-zero after voltage loss on the RV-8803, but undefined on
the RX-8803. This is ok for Date/Time because ->get_time returns an
error code for as long as the voltage loss flag is active. It's cleared
on ->set_time however. Zeroing both RAM and alarm ensures a fixed value
is read afterwards.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/rtc/rtc-rv8803.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 21a6f1eddb092..fe1247e771b98 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -9,6 +9,7 @@
 
 #include <linux/bcd.h>
 #include <linux/bitops.h>
+#include <linux/bitfield.h>
 #include <linux/log2.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -33,6 +34,7 @@
 #define RV8803_EXT			0x0D
 #define RV8803_FLAG			0x0E
 #define RV8803_CTRL			0x0F
+#define RV8803_OSC_OFFSET		0x2C
 
 #define RV8803_EXT_WADA			BIT(6)
 
@@ -49,12 +51,15 @@
 #define RV8803_CTRL_TIE			BIT(4)
 #define RV8803_CTRL_UIE			BIT(5)
 
+#define RX8803_CTRL_CSEL		GENMASK(7, 6)
+
 #define RX8900_BACKUP_CTRL		0x18
 #define RX8900_FLAG_SWOFF		BIT(2)
 #define RX8900_FLAG_VDETOFF		BIT(3)
 
 enum rv8803_type {
 	rv_8803,
+	rx_8803,
 	rx_8804,
 	rx_8900
 };
@@ -137,10 +142,41 @@ static int rv8803_write_regs(const struct i2c_client *client,
 	return ret;
 }
 
+static int rv8803_regs_init(struct rv8803_data *rv8803)
+{
+	int ret;
+
+	ret = rv8803_write_reg(rv8803->client, RV8803_OSC_OFFSET, 0x00);
+	if (ret)
+		return ret;
+
+	ret = rv8803_write_reg(rv8803->client, RV8803_CTRL,
+			       FIELD_PREP(RX8803_CTRL_CSEL, 1)); /* 2s */
+	if (ret)
+		return ret;
+
+	ret = rv8803_write_regs(rv8803->client, RV8803_ALARM_MIN, 3,
+				(u8[]){ 0, 0, 0 });
+	if (ret)
+		return ret;
+
+	return rv8803_write_reg(rv8803->client, RV8803_RAM, 0x00);
+}
+
 static int rv8803_regs_configure(struct rv8803_data *rv8803);
 
 static int rv8803_regs_reset(struct rv8803_data *rv8803)
 {
+	/*
+	 * The RV-8803 resets all registers to POR defaults after voltage-loss,
+	 * the Epson RTCs don't, so we manually reset the remainder here.
+	 */
+	if (rv8803->type == rx_8803 || rv8803->type == rx_8900) {
+		int ret = rv8803_regs_init(rv8803);
+		if (ret)
+			return ret;
+	}
+
 	return rv8803_regs_configure(rv8803);
 }
 
@@ -631,7 +667,7 @@ static int rv8803_probe(struct i2c_client *client,
 static const struct i2c_device_id rv8803_id[] = {
 	{ "rv8803", rv_8803 },
 	{ "rv8804", rx_8804 },
-	{ "rx8803", rv_8803 },
+	{ "rx8803", rx_8803 },
 	{ "rx8900", rx_8900 },
 	{ }
 };
@@ -644,7 +680,7 @@ static const __maybe_unused struct of_device_id rv8803_of_match[] = {
 	},
 	{
 		.compatible = "epson,rx8803",
-		.data = (void *)rv_8803
+		.data = (void *)rx_8803
 	},
 	{
 		.compatible = "epson,rx8804",
-- 
2.30.2

