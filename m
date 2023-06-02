Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11370720466
	for <lists+linux-rtc@lfdr.de>; Fri,  2 Jun 2023 16:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236010AbjFBOZh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 2 Jun 2023 10:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236019AbjFBOZR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 2 Jun 2023 10:25:17 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C4A369F;
        Fri,  2 Jun 2023 07:25:15 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,213,1681138800"; 
   d="scan'208";a="165499030"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jun 2023 23:25:15 +0900
Received: from localhost.localdomain (unknown [10.226.93.55])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 61C1740065BD;
        Fri,  2 Jun 2023 23:25:13 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 11/11] rtc: isl1208: Add support for the built-in RTC on the PMIC RAA215300
Date:   Fri,  2 Jun 2023 15:24:26 +0100
Message-Id: <20230602142426.438375-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230602142426.438375-1-biju.das.jz@bp.renesas.com>
References: <20230602142426.438375-1-biju.das.jz@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5->v6:
 * Added Rb tag from Geert.
 * Parsing of parent node is moved from probe->isl1208_clk_present()
 * Added comment for parsing parent node for getting clock resource.
 * Replaced XOR->NOT to make the operation more clear for the inverted case.
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
 drivers/rtc/rtc-isl1208.c | 44 ++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index e0f06677b91b..4c157d99aed6 100644
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
@@ -822,14 +831,32 @@ isl1208_clk_present(struct i2c_client *client, const char *name)
 	struct clk *clk;
 	int ret;
 
-	clk = devm_clk_get_optional(&client->dev, name);
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-	} else {
-		if (!clk)
-			ret = 0;
-		else
+	/*
+	 * For the built-in RTC found on PMIC RAA21530, enabling of the
+	 * internal oscillator is based on the parent clock. So parse the
+	 * parent node to get the details.
+	 */
+	if (client->dev.parent->type == &i2c_client_type) {
+		clk = of_clk_get_by_name(client->dev.parent->of_node, name);
+		if (IS_ERR(clk)) {
+			if (PTR_ERR(clk) != -ENOENT)
+				ret = PTR_ERR(clk);
+			else
+				ret = 0;
+		} else {
+			clk_put(clk);
 			ret = 1;
+		}
+	} else {
+		clk = devm_clk_get_optional(&client->dev, name);
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
+		} else {
+			if (!clk)
+				ret = 0;
+			else
+				ret = 1;
+		}
 	}
 
 	return ret;
@@ -899,6 +926,9 @@ isl1208_probe(struct i2c_client *client)
 		return sr;
 	}
 
+	if (isl1208->config->has_inverted_osc_bit)
+		xtosb_val = !xtosb_val;
+
 	rc = isl1208_set_xtoscb(client, sr, xtosb_val);
 	if (rc)
 		return rc;
-- 
2.25.1

