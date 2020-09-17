Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65EBF26E3BA
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Sep 2020 20:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgIQSen (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Sep 2020 14:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgIQSde (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 17 Sep 2020 14:33:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2AD8C061353
        for <linux-rtc@vger.kernel.org>; Thu, 17 Sep 2020 11:32:56 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7] helo=dude.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1kIyiE-0004GR-RG; Thu, 17 Sep 2020 20:32:54 +0200
From:   Bastian Krause <bst@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
        Bastian Krause <bst@pengutronix.de>
Subject: [PATCH v2 4/8] rtc: ds1307: apply DS13XX_TRICKLE_CHARGER_MAGIC only conditionally
Date:   Thu, 17 Sep 2020 20:32:42 +0200
Message-Id: <20200917183246.19446-5-bst@pengutronix.de>
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

DS13XX_TRICKLE_CHARGER_MAGIC sets the trickle-charge select (TCS) bits
(7..4). The datasheet of Maxim Integrated's DS1339 [1] for instance
reads:

"To prevent accidental enabling, only a pattern on 1010 enables the
trickle charger. All other patterns disable the trickle charger."

Since not all RTCs connected to a backup battery or supercap use these
bits DS13XX_TRICKLE_CHARGER_MAGIC should not get applied for all charger
setups unconditionally.
Epson's RX8130 is such an example: Instead of TCS bits "SMPTSEL1",
"SMPTSEL0",  "CHGEN" and "INIEN" are expected as bit 7..4.

DS1339 and DS1340 are currently the only RTCs in the ds1307 driver that
apply DS13XX_TRICKLE_CHARGER_MAGIC to their setup register value. So
apply DS13XX_TRICKLE_CHARGER_MAGIC in do_trickle_setup_ds1339() which
is used by both RTCs.

[1] https://datasheets.maximintegrated.com/en/ds/DS1339-DS1339U.pdf
[2] https://support.epson.biz/td/api/doc_check.php?dl=app_RX8130CE

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
No changes since v1.

v1 notes:
No previous version.
---
 drivers/rtc/rtc-ds1307.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 54c85cdd019d..ff5242d10b21 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -507,6 +507,8 @@ static u8 do_trickle_setup_ds1339(struct ds1307 *ds1307, u32 ohms, bool diode)
 	u8 setup = (diode) ? DS1307_TRICKLE_CHARGER_DIODE :
 		DS1307_TRICKLE_CHARGER_NO_DIODE;
 
+	setup |= DS13XX_TRICKLE_CHARGER_MAGIC;
+
 	switch (ohms) {
 	case 250:
 		setup |= DS1307_TRICKLE_CHARGER_250_OHM;
@@ -1758,7 +1760,6 @@ static int ds1307_probe(struct i2c_client *client,
 		trickle_charger_setup = pdata->trickle_charger_setup;
 
 	if (trickle_charger_setup && chip->trickle_charger_reg) {
-		trickle_charger_setup |= DS13XX_TRICKLE_CHARGER_MAGIC;
 		dev_dbg(ds1307->dev,
 			"writing trickle charger info 0x%x to 0x%x\n",
 			trickle_charger_setup, chip->trickle_charger_reg);
-- 
2.28.0

