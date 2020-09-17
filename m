Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4B4726E3B3
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Sep 2020 20:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgIQSel (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Sep 2020 14:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbgIQSdh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 17 Sep 2020 14:33:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B20C0612F2
        for <linux-rtc@vger.kernel.org>; Thu, 17 Sep 2020 11:32:56 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7] helo=dude.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1kIyiE-0004GR-UV; Thu, 17 Sep 2020 20:32:54 +0200
From:   Bastian Krause <bst@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
        Bastian Krause <bst@pengutronix.de>
Subject: [PATCH v2 7/8] rtc: ds1307: consider aux-voltage-chargeable
Date:   Thu, 17 Sep 2020 20:32:45 +0200
Message-Id: <20200917183246.19446-8-bst@pengutronix.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917183246.19446-1-bst@pengutronix.de>
References: <20200917183246.19446-1-bst@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Prefer aux-voltage-chargeable over trickle-diode-disable and set diode
accordingly. This is then passed to the chip's appropriate charge setup
function.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
No changes since v1.

v1 notes:
This is the discussion that lead to this patch:
https://lore.kernel.org/linux-rtc/a492b6a0-b41c-a088-3ba1-f1448a074b34@pengutronix.de/
---
 drivers/rtc/rtc-ds1307.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 270621e1c9cf..9bf1822a989f 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1308,7 +1308,7 @@ static int ds1307_nvram_write(void *priv, unsigned int offset, void *val,
 static u8 ds1307_trickle_init(struct ds1307 *ds1307,
 			      const struct chip_desc *chip)
 {
-	u32 ohms;
+	u32 ohms, chargeable;
 	bool diode = chip->charge_default;
 
 	if (!chip->do_trickle_setup)
@@ -1318,8 +1318,27 @@ static u8 ds1307_trickle_init(struct ds1307 *ds1307,
 				     &ohms) && chip->requires_trickle_resistor)
 		return 0;
 
-	if (device_property_read_bool(ds1307->dev, "trickle-diode-disable"))
+	/* aux-voltage-chargeable takes precedence over the deprecated
+	 * trickle-diode-disable
+	 */
+	if (!device_property_read_u32(ds1307->dev, "aux-voltage-chargeable",
+				     &chargeable)) {
+		switch (chargeable) {
+		case 0:
+			diode = false;
+			break;
+		case 1:
+			diode = true;
+			break;
+		default:
+			dev_warn(ds1307->dev,
+				 "unsupported aux-voltage-chargeable value\n");
+			break;
+		}
+	} else if (device_property_read_bool(ds1307->dev,
+					     "trickle-diode-disable")) {
 		diode = false;
+	}
 
 	return chip->do_trickle_setup(ds1307, ohms, diode);
 }
-- 
2.28.0

