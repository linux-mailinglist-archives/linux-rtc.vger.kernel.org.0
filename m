Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8903C707FBF
	for <lists+linux-rtc@lfdr.de>; Thu, 18 May 2023 13:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbjERLjA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 18 May 2023 07:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbjERLit (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 18 May 2023 07:38:49 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9DD463A9E;
        Thu, 18 May 2023 04:37:43 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,285,1677510000"; 
   d="scan'208";a="163369257"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 May 2023 20:37:22 +0900
Received: from localhost.localdomain (unknown [10.226.92.79])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BBAC44005B2A;
        Thu, 18 May 2023 20:37:19 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 08/11] rtc: isl1208: Add support for the built-in RTC on the PMIC RAA215300
Date:   Thu, 18 May 2023 12:36:40 +0100
Message-Id: <20230518113643.420806-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
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
0x11. The PMIC driver detects PMIC version and instantiate appropriate
RTC device based on i2c_device_id.

Enhance isl1208_set_xtoscb() to handle inverted bit and internal oscillator
is enabled or not is determined by the parent clock name.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
 drivers/rtc/rtc-isl1208.c | 44 ++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index 5f91a3ca5920..597e0126155f 100644
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
 	{ "isl1208", .driver_data = (unsigned long)&config_isl1208 },
 	{ "isl1209", .driver_data = (unsigned long)&config_isl1209 },
 	{ "isl1218", .driver_data = (unsigned long)&config_isl1218 },
 	{ "isl1219", .driver_data = (unsigned long)&config_isl1219 },
+	{ "raa215300_a0", .driver_data = (unsigned long)&config_raa215300_a0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, isl1208_id);
@@ -176,12 +185,16 @@ isl1208_i2c_validate_client(struct i2c_client *client)
 	return 0;
 }
 
-static int isl1208_set_xtoscb(struct i2c_client *client, int sr, bool int_osc_en)
+static int isl1208_set_xtoscb(struct i2c_client *client, int sr,
+			      bool int_osc_en, bool inverted)
 {
+	int xtosb_set = sr | ISL1208_REG_SR_XTOSCB;
+	int xtosb_clr = sr & ~ISL1208_REG_SR_XTOSCB;
+
 	if (int_osc_en)
-		sr &= ~ISL1208_REG_SR_XTOSCB;
+		sr = inverted ? xtosb_set : xtosb_clr;
 	else
-		sr |= ISL1208_REG_SR_XTOSCB;
+		sr = inverted ? xtosb_clr : xtosb_set;
 
 	return i2c_smbus_write_byte_data(client, ISL1208_REG_SR, sr);
 }
@@ -852,11 +865,25 @@ isl1208_probe(struct i2c_client *client)
 		isl1208->config = (struct isl1208_config *)id->driver_data;
 	}
 
-	xin = devm_clk_get(&client->dev, "xin");
-	if (IS_ERR(xin)) {
-		clkin = devm_clk_get(&client->dev, "clkin");
-		if (!IS_ERR(clkin))
+	if (client->dev.parent->type == &i2c_client_type) {
+		xin = of_clk_get_by_name(client->dev.parent->of_node, "xin");
+		if (IS_ERR(xin)) {
+			clkin = of_clk_get_by_name(client->dev.parent->of_node, "clkin");
+			if (IS_ERR(clkin))
+				return -ENODEV;
+
 			int_osc_en = false;
+			clk_put(clkin);
+		} else {
+			clk_put(xin);
+		}
+	} else {
+		xin = devm_clk_get(&client->dev, "xin");
+		if (IS_ERR(xin)) {
+			clkin = devm_clk_get(&client->dev, "clkin");
+			if (!IS_ERR(clkin))
+				int_osc_en = false;
+		}
 	}
 
 	isl1208->rtc = devm_rtc_allocate_device(&client->dev);
@@ -876,7 +903,8 @@ isl1208_probe(struct i2c_client *client)
 		return sr;
 	}
 
-	rc = isl1208_set_xtoscb(client, sr, int_osc_en);
+	rc = isl1208_set_xtoscb(client, sr, int_osc_en,
+				isl1208->config->has_inverted_osc_bit);
 	if (rc)
 		return rc;
 
-- 
2.25.1

