Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6B525FF46
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Sep 2020 18:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729866AbgIGQaI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Sep 2020 12:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729877AbgIGO2h (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Sep 2020 10:28:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94838C0617A1
        for <linux-rtc@vger.kernel.org>; Mon,  7 Sep 2020 07:27:46 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7] helo=dude.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1kFI7U-0003nx-6C; Mon, 07 Sep 2020 16:27:44 +0200
From:   Bastian Krause <bst@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
        Bastian Krause <bst@pengutronix.de>
Subject: [PATCH 6/8] rtc: ds1307: store previous charge default per chip
Date:   Mon,  7 Sep 2020 16:27:25 +0200
Message-Id: <20200907142727.26472-7-bst@pengutronix.de>
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

Some RTC's batteries and supercaps were charged by default until now.
In contrast other RTCs allow charging but the driver did not configure
them to do so until now. These must not be charged by default to stay
backwards compatible.

In order to do that, store the charge default per chip.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
No previous version.
---
 drivers/rtc/rtc-ds1307.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 7983438b677a..270621e1c9cf 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -194,6 +194,11 @@ struct chip_desc {
 	 * the resistor between Vcc and Vbackup?
 	 */
 	bool			requires_trickle_resistor;
+	/* Some RTC's batteries and supercaps were charged by default, others
+	 * allow charging but were not configured previously to do so.
+	 * Remember this behavior to stay backwards compatible.
+	 */
+	bool			charge_default;
 };
 
 static const struct chip_desc chips[last_ds_type];
@@ -986,6 +991,7 @@ static const struct chip_desc chips[last_ds_type] = {
 		.trickle_charger_reg = 0x10,
 		.do_trickle_setup = &do_trickle_setup_ds1339,
 		.requires_trickle_resistor = true,
+		.charge_default = true,
 	},
 	[ds_1340] = {
 		.century_reg	= DS1307_REG_HOUR,
@@ -994,6 +1000,7 @@ static const struct chip_desc chips[last_ds_type] = {
 		.do_trickle_setup = &do_trickle_setup_ds1339,
 		.trickle_charger_reg = 0x08,
 		.requires_trickle_resistor = true,
+		.charge_default = true,
 	},
 	[ds_1341] = {
 		.century_reg	= DS1307_REG_MONTH,
@@ -1302,7 +1309,7 @@ static u8 ds1307_trickle_init(struct ds1307 *ds1307,
 			      const struct chip_desc *chip)
 {
 	u32 ohms;
-	bool diode = true;
+	bool diode = chip->charge_default;
 
 	if (!chip->do_trickle_setup)
 		return 0;
-- 
2.28.0

