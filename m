Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D276126E3BB
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Sep 2020 20:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgIQSen (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Sep 2020 14:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbgIQSde (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 17 Sep 2020 14:33:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA004C061354
        for <linux-rtc@vger.kernel.org>; Thu, 17 Sep 2020 11:32:56 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7] helo=dude.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1kIyiE-0004GR-SH; Thu, 17 Sep 2020 20:32:54 +0200
From:   Bastian Krause <bst@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
        Bastian Krause <bst@pengutronix.de>
Subject: [PATCH v2 5/8] rtc: ds1307: introduce requires_trickle_resistor per chip
Date:   Thu, 17 Sep 2020 20:32:43 +0200
Message-Id: <20200917183246.19446-6-bst@pengutronix.de>
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

Make trickle-resistor-ohms optional for charging setups that do not
require specifying ROUT bits (specifying the resistor value between Vcc
and Vbackup). In order to allow specifying that, introduce
requires_trickle_resistor per chip.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
No changes since v1.

v1 notes:
No previous version.
---
 drivers/rtc/rtc-ds1307.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index ff5242d10b21..7983438b677a 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -190,6 +190,10 @@ struct chip_desc {
 	u16			trickle_charger_reg;
 	u8			(*do_trickle_setup)(struct ds1307 *, u32,
 						    bool);
+	/* Does the RTC require trickle-resistor-ohms to select the value of
+	 * the resistor between Vcc and Vbackup?
+	 */
+	bool			requires_trickle_resistor;
 };
 
 static const struct chip_desc chips[last_ds_type];
@@ -981,6 +985,7 @@ static const struct chip_desc chips[last_ds_type] = {
 		.bbsqi_bit	= DS1339_BIT_BBSQI,
 		.trickle_charger_reg = 0x10,
 		.do_trickle_setup = &do_trickle_setup_ds1339,
+		.requires_trickle_resistor = true,
 	},
 	[ds_1340] = {
 		.century_reg	= DS1307_REG_HOUR,
@@ -988,6 +993,7 @@ static const struct chip_desc chips[last_ds_type] = {
 		.century_bit	= DS1340_BIT_CENTURY,
 		.do_trickle_setup = &do_trickle_setup_ds1339,
 		.trickle_charger_reg = 0x08,
+		.requires_trickle_resistor = true,
 	},
 	[ds_1341] = {
 		.century_reg	= DS1307_REG_MONTH,
@@ -1302,7 +1308,7 @@ static u8 ds1307_trickle_init(struct ds1307 *ds1307,
 		return 0;
 
 	if (device_property_read_u32(ds1307->dev, "trickle-resistor-ohms",
-				     &ohms))
+				     &ohms) && chip->requires_trickle_resistor)
 		return 0;
 
 	if (device_property_read_bool(ds1307->dev, "trickle-diode-disable"))
-- 
2.28.0

