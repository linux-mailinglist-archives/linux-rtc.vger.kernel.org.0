Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F60470B9E5
	for <lists+linux-rtc@lfdr.de>; Mon, 22 May 2023 12:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbjEVKTi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 May 2023 06:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232187AbjEVKTa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 May 2023 06:19:30 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 01873E0;
        Mon, 22 May 2023 03:19:28 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,184,1681138800"; 
   d="scan'208";a="163778368"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 May 2023 19:19:28 +0900
Received: from localhost.localdomain (unknown [10.226.93.9])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 545DE400BC16;
        Mon, 22 May 2023 19:19:26 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 08/11] rtc: isl1208: Add support for the built-in RTC on the PMIC RAA215300
Date:   Mon, 22 May 2023 11:18:46 +0100
Message-Id: <20230522101849.297499-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The built-in RTC found on PMIC RAA215300 is the same as ISL1208.
However, the external oscillator bit is inverted on PMIC version
0x11. The PMIC driver detects PMIC version and instantiates the
RTC device based on i2c_device_id.

The internal oscillator is enabled or not is determined by the
parent clock name.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Updated commit description.
 * Replaced "unsigned long"->"kernel_ulong_t" in isl1208_id[].
 * -ENOENT means clock not present, so any other errors are propagated.
 * Dropped bool inverted parameter from isl1208_set_xtoscb() instead
   using xor to compute the value of xtoscb.
v3->v4:
 * Added support for internal oscillator enable/disable.
v2->v3:
 * RTC device is instantiated by PMIC driver and dropped isl1208_probe_helper().
 * Added "TYPE_RAA215300_RTC_A0" to handle inverted oscillator bit case.
RFC->v2:
 * Dropped compatible "renesas,raa215300-isl1208" and "renesas,raa215300-pmic" property.
 * Updated the comment polarity->bit for External Oscillator.
 * Added raa215300_rtc_probe_helper() for registering raa215300_rtc device and
   added the helper function isl1208_probe_helper() to share the code.
---
 drivers/rtc/rtc-isl1208.c | 48 +++++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index 6ca977595977..5c68120ff543 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -74,6 +74,7 @@ struct isl1208_config {
 	unsigned int	nvmem_length;
 	unsigned	has_tamper:1;
 	unsigned	has_timestamp:1;
+	unsigned	has_inverted_osc_bit:1;
 };
 
 static const struct isl1208_config config_isl1208 = {
@@ -100,11 +101,19 @@ static const struct isl1208_config config_isl1219 = {
 	.has_timestamp = true
 };
 
+static const struct isl1208_config config_raa215300_a0 = {
+	.nvmem_length = 2,
+	.has_tamper = false,
+	.has_timestamp = false,
+	.has_inverted_osc_bit = true
+};
+
 static const struct i2c_device_id isl1208_id[] = {
 	{ "isl1208", .driver_data = (kernel_ulong_t)&config_isl1208 },
 	{ "isl1209", .driver_data = (kernel_ulong_t)&config_isl1209 },
 	{ "isl1218", .driver_data = (kernel_ulong_t)&config_isl1218 },
 	{ "isl1219", .driver_data = (kernel_ulong_t)&config_isl1219 },
+	{ "raa215300_a0", .driver_data = (kernel_ulong_t)&config_raa215300_a0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, isl1208_id);
@@ -852,17 +861,37 @@ isl1208_probe(struct i2c_client *client)
 		isl1208->config = (struct isl1208_config *)id->driver_data;
 	}
 
-	xin = devm_clk_get_optional(&client->dev, "xin");
-	if (IS_ERR(xin))
-		return PTR_ERR(xin);
+	if (client->dev.parent->type == &i2c_client_type) {
+		xin = of_clk_get_by_name(client->dev.parent->of_node, "xin");
+		if (IS_ERR(xin)) {
+			if (PTR_ERR(xin) != -ENOENT)
+				return PTR_ERR(xin);
+
+			clkin = of_clk_get_by_name(client->dev.parent->of_node,
+						   "clkin");
+			if (IS_ERR(clkin)) {
+				if (PTR_ERR(clkin) != -ENOENT)
+					return PTR_ERR(xin);
+			} else {
+				xtosb_val = 0;
+				clk_put(clkin);
+			}
+		} else {
+			clk_put(xin);
+		}
+	} else {
+		xin = devm_clk_get_optional(&client->dev, "xin");
+		if (IS_ERR(xin))
+			return PTR_ERR(xin);
 
-	if (!xin) {
-		clkin = devm_clk_get_optional(&client->dev, "clkin");
-		if (IS_ERR(clkin))
-			return PTR_ERR(clkin);
+		if (!xin) {
+			clkin = devm_clk_get_optional(&client->dev, "clkin");
+			if (IS_ERR(clkin))
+				return PTR_ERR(clkin);
 
-		if (clkin)
-			xtosb_val = 0;
+			if (clkin)
+				xtosb_val = 0;
+		}
 	}
 
 	isl1208->rtc = devm_rtc_allocate_device(&client->dev);
@@ -882,6 +911,7 @@ isl1208_probe(struct i2c_client *client)
 		return sr;
 	}
 
+	xtosb_val ^= isl1208->config->has_inverted_osc_bit ? 1 : 0;
 	rc = isl1208_set_xtoscb(client, sr, xtosb_val);
 	if (rc)
 		return rc;
-- 
2.25.1

