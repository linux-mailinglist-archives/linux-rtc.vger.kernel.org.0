Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3CFB25FF37
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Sep 2020 18:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729886AbgIGQ34 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Sep 2020 12:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729849AbgIGO2k (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Sep 2020 10:28:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F42C0617A5
        for <linux-rtc@vger.kernel.org>; Mon,  7 Sep 2020 07:27:46 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7] helo=dude.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1kFI7U-0003nx-8Y; Mon, 07 Sep 2020 16:27:44 +0200
From:   Bastian Krause <bst@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
        Bastian Krause <bst@pengutronix.de>
Subject: [PATCH 8/8] rtc: ds1307: enable rx8130's backup battery, make it chargeable optionally
Date:   Mon,  7 Sep 2020 16:27:27 +0200
Message-Id: <20200907142727.26472-9-bst@pengutronix.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907142727.26472-1-bst@pengutronix.de>
References: <20200907142727.26472-1-bst@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The ds1307 charger infrastructure now allows to add a rx8130 charger
setup that..

- does not depend on trickle-resistor-ohms
- does not use DS13XX_TRICKLE_CHARGER_MAGIC trickle-charge select (TCS)
  bits
- keeps previous no-charge behavior for device trees without
  aux-voltage-chargeable

Make that happen.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
Based on:
- https://lore.kernel.org/linux-rtc/20200415163701.21989-1-bst@pengutronix.de/
- https://lore.kernel.org/linux-rtc/20200415163701.21989-3-bst@pengutronix.de/

Changes since then:
- use chager_reg (called trickle_charger_reg before patch 4/8)
- use charger setup function to set backup battery enable bit, charge
  bit optionally (introduced by patch 5/8)
---
 drivers/rtc/rtc-ds1307.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 9bf1822a989f..1fe0c2df2578 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -122,6 +122,9 @@ enum ds_type {
 #define RX8130_REG_FLAG_AF		BIT(3)
 #define RX8130_REG_CONTROL0		0x1e
 #define RX8130_REG_CONTROL0_AIE		BIT(3)
+#define RX8130_REG_CONTROL1		0x1f
+#define RX8130_REG_CONTROL1_INIEN	BIT(4)
+#define RX8130_REG_CONTROL1_CHGEN	BIT(5)
 
 #define MCP794XX_REG_CONTROL		0x07
 #	define MCP794XX_BIT_ALM0_EN	0x10
@@ -536,6 +539,16 @@ static u8 do_trickle_setup_ds1339(struct ds1307 *ds1307, u32 ohms, bool diode)
 	return setup;
 }
 
+static u8 do_trickle_setup_rx8130(struct ds1307 *ds1307, u32 ohms, bool diode)
+{
+	/* make sure that the backup battery is enabled */
+	u8 setup = RX8130_REG_CONTROL1_INIEN;
+	if (diode)
+		setup |= RX8130_REG_CONTROL1_CHGEN;
+
+	return setup;
+}
+
 static irqreturn_t rx8130_irq(int irq, void *dev_id)
 {
 	struct ds1307           *ds1307 = dev_id;
@@ -1024,6 +1037,8 @@ static const struct chip_desc chips[last_ds_type] = {
 		.offset		= 0x10,
 		.irq_handler = rx8130_irq,
 		.rtc_ops = &rx8130_rtc_ops,
+		.trickle_charger_reg = RX8130_REG_CONTROL1,
+		.do_trickle_setup = &do_trickle_setup_rx8130,
 	},
 	[m41t0] = {
 		.rtc_ops	= &m41txx_rtc_ops,
-- 
2.28.0

